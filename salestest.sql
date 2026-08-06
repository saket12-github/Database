-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 06, 2026 at 05:16 PM
-- Server version: 8.0.46
-- PHP Version: 8.1.2-1ubuntu2.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `salestest`
--

-- --------------------------------------------------------

--
-- Table structure for table `campaign_email_cron_queue`
--

CREATE TABLE `campaign_email_cron_queue` (
  `id` int NOT NULL,
  `campaign_unique_name` varchar(255) DEFAULT NULL,
  `url` text,
  `subject` varchar(255) DEFAULT NULL,
  `send_to_email` varchar(255) DEFAULT NULL,
  `send_to_name` varchar(255) DEFAULT NULL,
  `lead_id` int DEFAULT NULL,
  `cdate` datetime DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `schedule_date` datetime DEFAULT NULL,
  `actual_email_sent_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `campaign_email_cron_queue`
--

INSERT INTO `campaign_email_cron_queue` (`id`, `campaign_unique_name`, `url`, `subject`, `send_to_email`, `send_to_name`, `lead_id`, `cdate`, `status`, `schedule_date`, `actual_email_sent_date`) VALUES
(1, 'welcome-series', 'https://example.com/campaign/welcome-1', 'Welcome to our services', 'rahul.mehta1@gmail.com', 'Rahul Mehta', 1, '2026-07-01 10:20:00', 'sent', '2026-07-01 10:20:00', '2026-07-01 10:21:00'),
(2, 'welcome-series', 'https://example.com/campaign/welcome-2', 'Welcome to our services', 'priya.sharma2@gmail.com', 'Priya Sharma', 2, '2026-07-05 11:20:00', 'sent', '2026-07-05 11:20:00', '2026-07-05 11:21:00'),
(3, 'welcome-series', 'https://example.com/campaign/welcome-3', 'Welcome to our services', 'amit.verma3@yahoo.com', 'Amit Verma', 3, '2026-07-02 12:20:00', 'sent', '2026-07-02 12:20:00', '2026-07-02 12:21:00'),
(4, 'welcome-series', 'https://example.com/campaign/welcome-4', 'Welcome to our services', 'neha.kapoor4@gmail.com', 'Neha Kapoor', 4, '2026-06-26 15:50:00', 'sent', '2026-06-26 15:50:00', '2026-06-26 15:51:00'),
(5, 'welcome-series', 'https://example.com/campaign/welcome-5', 'Welcome to our services', 'vikram.singh5@gmail.com', 'Vikram Singh', 5, '2026-07-06 10:05:00', 'sent', '2026-07-06 10:05:00', '2026-07-06 10:06:00');

-- --------------------------------------------------------

--
-- Table structure for table `captcha_codes`
--

CREATE TABLE `captcha_codes` (
  `id` varchar(40) NOT NULL,
  `namespace` varchar(32) NOT NULL,
  `code` varchar(32) NOT NULL,
  `code_display` varchar(32) NOT NULL,
  `created` int NOT NULL,
  `audio_data` mediumblob
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `crm_ai_agent_logs`
--

CREATE TABLE `crm_ai_agent_logs` (
  `id` int NOT NULL,
  `request_id` varchar(36) NOT NULL,
  `agent` varchar(50) NOT NULL DEFAULT 'get_quote_questions',
  `lead_id` int DEFAULT NULL,
  `session_id` varchar(36) DEFAULT NULL,
  `provider` varchar(50) NOT NULL DEFAULT 'anthropic',
  `model` varchar(100) NOT NULL,
  `api_endpoint` varchar(255) NOT NULL,
  `services` text,
  `industry` varchar(150) DEFAULT NULL,
  `question_count_requested` smallint DEFAULT NULL,
  `question_count_returned` smallint DEFAULT NULL,
  `focus_areas` mediumtext,
  `final_prompt` mediumtext,
  `raw_response` mediumtext,
  `parsed_response` mediumtext,
  `input_tokens` int DEFAULT NULL,
  `output_tokens` int DEFAULT NULL,
  `total_tokens` int DEFAULT NULL,
  `http_status` smallint DEFAULT NULL,
  `status` enum('success','error') NOT NULL,
  `error_message` text,
  `request_started_at` datetime(3) NOT NULL,
  `response_received_at` datetime(3) DEFAULT NULL,
  `duration_ms` int DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `crm_ai_agent_logs`
--

INSERT INTO `crm_ai_agent_logs` (`id`, `request_id`, `agent`, `lead_id`, `session_id`, `provider`, `model`, `api_endpoint`, `services`, `industry`, `question_count_requested`, `question_count_returned`, `focus_areas`, `final_prompt`, `raw_response`, `parsed_response`, `input_tokens`, `output_tokens`, `total_tokens`, `http_status`, `status`, `error_message`, `request_started_at`, `response_received_at`, `duration_ms`, `ip_address`, `created_at`) VALUES
(4, 'a8ff0ef5-cbb1-41af-8ecd-af364e03e848', 'get_quote_questions', 2, NULL, 'anthropic', 'claude-haiku-4-5-20251001', 'https://api.anthropic.com/v1/messages', '[\"AI Agent & Chatbot\"]', 'Retail', 4, 4, '- Primary users (customers, internal staff, both)\n- Training data availability\n- Primary goal (support, sales, lead generation, automation)\n- Business process it should support\n- Mobile app + website embedding', 'Client needs AI Agent & Chatbot for Retail.\n\nGenerate exactly 4 discovery questions covering all requested services. If multiple services are requested, include at least one question per service where possible.\n\nUse these topics:\n\n- Primary users (customers, internal staff, both)\n- Training data availability\n- Primary goal (support, sales, lead generation, automation)\n- Business process it should support\n- Mobile app + website embedding\n\nRules:\n- Output ONLY a JSON array.\n- Exactly 4 objects.\n- Format:\n[\n  {\n    \"question\":\"...\",\n    \"type\":\"single|multi\",\n    \"options\":[\"A\",\"B\",\"C\",\"D\"]\n  }\n]\n- 4 options only. Do NOT add \"Other\" (added automatically).\n- Question: one sentence, max 12 words.\n- One topic per question.\n- No design, reference sites, budget, timeline, or contact questions.\n- Options: max 6 words each.\n- Use \"single\" unless multiple selections are genuinely valid.\n- For \"single\", options must be mutually exclusive.\n- For \"multi\", options must be independent and combinable.\n- Make questions specific to AI Agent & Chatbot and Retail.', '```json\n[\n  {\n    \"question\": \"Who are your primary chatbot users in retail?\",\n    \"type\": \"single\",\n    \"options\": [\n      \"Customers only\",\n      \"Internal staff only\",\n      \"Both customers and staff\",\n      \"Partners and suppliers\"\n    ]\n  },\n  {\n    \"question\": \"What primary goal should your retail chatbot achieve?\",\n    \"type\": \"single\",\n    \"options\": [\n      \"Customer support and inquiries\",\n      \"Sales and product recommendations\",\n      \"Lead generation and promotions\",\n      \"Order automation and fulfillment\"\n    ]\n  },\n  {\n    \"question\": \"Which retail processes need AI agent automation?\",\n    \"type\": \"multi\",\n    \"options\": [\n      \"Inventory management\",\n      \"Customer service workflows\",\n      \"Checkout and transactions\",\n      \"Employee scheduling\"\n    ]\n  },\n  {\n    \"question\": \"Where should your chatbot be deployed?\",\n    \"type\": \"multi\",\n    \"options\": [\n      \"Mobile app\",\n      \"Website\",\n      \"In-store kiosks\",\n      \"Social media platforms\"\n    ]\n  }\n]\n```', '[{\"question\":\"Who are your primary chatbot users in retail?\",\"type\":\"single\",\"options\":[\"Customers only\",\"Internal staff only\",\"Both customers and staff\",\"Partners and suppliers\"]},{\"question\":\"What primary goal should your retail chatbot achieve?\",\"type\":\"single\",\"options\":[\"Customer support and inquiries\",\"Sales and product recommendations\",\"Lead generation and promotions\",\"Order automation and fulfillment\"]},{\"question\":\"Which retail processes need AI agent automation?\",\"type\":\"multi\",\"options\":[\"Inventory management\",\"Customer service workflows\",\"Checkout and transactions\",\"Employee scheduling\"]},{\"question\":\"Where should your chatbot be deployed?\",\"type\":\"multi\",\"options\":[\"Mobile app\",\"Website\",\"In-store kiosks\",\"Social media platforms\"]}]', 285, 288, 573, 200, 'success', NULL, '2026-07-13 17:40:47.886', '2026-07-13 17:40:51.962', 4076, '::1', '2026-07-13 17:40:51'),
(5, '7423676b-9105-4431-b531-adf3125ed970', 'get_quote_questions', 5, NULL, 'anthropic', 'claude-haiku-4-5-20251001', 'https://api.anthropic.com/v1/messages', '[\"Digital Marketing\"]', 'Retail', 4, 4, '- Marketing objective (leads, sales, rankings, brand awareness, traffic, launch)\n- Preferred channels (SEO, Google/social ads, email, WhatsApp)\n- Marketing activities already running\n- Prior/current marketing agency experience\n- Target audience/geography\n- Key marketing challenge', 'Client needs Digital Marketing for Retail.\n\nGenerate exactly 4 discovery questions covering all requested services. If multiple services are requested, include at least one question per service where possible.\n\nUse these topics:\n\n- Marketing objective (leads, sales, rankings, brand awareness, traffic, launch)\n- Preferred channels (SEO, Google/social ads, email, WhatsApp)\n- Marketing activities already running\n- Prior/current marketing agency experience\n- Target audience/geography\n- Key marketing challenge\n\nRules:\n- Output ONLY a JSON array.\n- Exactly 4 objects.\n- Format:\n[\n  {\n    \"question\":\"...\",\n    \"type\":\"single|multi\",\n    \"options\":[\"A\",\"B\",\"C\",\"D\"]\n  }\n]\n- 4 options only. Do NOT add \"Other\" (added automatically).\n- Question: one sentence, max 12 words.\n- One topic per question.\n- No design, reference sites, budget, timeline, or contact questions.\n- Options: max 6 words each.\n- Use \"single\" unless multiple selections are genuinely valid.\n- For \"single\", options must be mutually exclusive.\n- For \"multi\", options must be independent and combinable.\n- Make questions specific to Digital Marketing and Retail.', '```json\n[\n  {\n    \"question\": \"What\'s your primary marketing objective for retail growth?\",\n    \"type\": \"single\",\n    \"options\": [\n      \"Increase in-store foot traffic\",\n      \"Drive online sales\",\n      \"Improve search rankings\",\n      \"Build brand awareness\"\n    ]\n  },\n  {\n    \"question\": \"Which digital channels interest you most?\",\n    \"type\": \"multi\",\n    \"options\": [\n      \"Google Search and Shopping ads\",\n      \"Social media advertising\",\n      \"Email marketing campaigns\",\n      \"SEO optimization\"\n    ]\n  },\n  {\n    \"question\": \"What marketing activities are you currently running?\",\n    \"type\": \"multi\",\n    \"options\": [\n      \"Social media posts\",\n      \"Paid advertising campaigns\",\n      \"Email newsletters\",\n      \"None currently\"\n    ]\n  },\n  {\n    \"question\": \"What\'s your biggest marketing challenge today?\",\n    \"type\": \"single\",\n    \"options\": [\n      \"Low website conversion rates\",\n      \"Limited customer reach\",\n      \"Competing with larger retailers\",\n      \"Measuring marketing ROI\"\n    ]\n  }\n]\n```', '[{\"question\":\"What\'s your primary marketing objective for retail growth?\",\"type\":\"single\",\"options\":[\"Increase in-store foot traffic\",\"Drive online sales\",\"Improve search rankings\",\"Build brand awareness\"]},{\"question\":\"Which digital channels interest you most?\",\"type\":\"multi\",\"options\":[\"Google Search and Shopping ads\",\"Social media advertising\",\"Email marketing campaigns\",\"SEO optimization\"]},{\"question\":\"What marketing activities are you currently running?\",\"type\":\"multi\",\"options\":[\"Social media posts\",\"Paid advertising campaigns\",\"Email newsletters\",\"None currently\"]},{\"question\":\"What\'s your biggest marketing challenge today?\",\"type\":\"single\",\"options\":[\"Low website conversion rates\",\"Limited customer reach\",\"Competing with larger retailers\",\"Measuring marketing ROI\"]}]', 295, 287, 582, 200, 'success', NULL, '2026-07-14 11:44:04.175', '2026-07-14 11:44:06.928', 2753, '::1', '2026-07-14 11:44:06'),
(182, '11111111-1111-1111-1111-111111111101', 'get_quote_questions', 1, '21111111-1111-1111-1111-111111111101', 'anthropic', 'claude-haiku-4-5-20251001', 'https://api.anthropic.com/v1/messages', 'Pest Control', 'Residential', 5, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'success', NULL, '2026-07-01 10:05:00.000', '2026-07-01 10:05:02.500', 2500, '103.21.45.10', '2026-08-06 17:15:03'),
(183, '11111111-1111-1111-1111-111111111103', 'get_quote_questions', 3, '21111111-1111-1111-1111-111111111103', 'anthropic', 'claude-haiku-4-5-20251001', 'https://api.anthropic.com/v1/messages', 'Pest Control', 'Residential', 5, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'success', NULL, '2026-07-02 12:08:00.000', '2026-07-02 12:08:02.100', 2100, '103.21.45.12', '2026-08-06 17:15:03'),
(184, '11111111-1111-1111-1111-111111111104', 'get_quote_questions', 4, '21111111-1111-1111-1111-111111111104', 'anthropic', 'claude-haiku-4-5-20251001', 'https://api.anthropic.com/v1/messages', 'Pest Control', 'Commercial', 5, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'success', NULL, '2026-06-26 15:38:00.000', '2026-06-26 15:38:03.000', 3000, '103.21.45.14', '2026-08-06 17:15:03');

-- --------------------------------------------------------

--
-- Table structure for table `crm_ai_log_feedback`
--

CREATE TABLE `crm_ai_log_feedback` (
  `id` int NOT NULL,
  `ai_log_id` int NOT NULL,
  `rating` tinyint NOT NULL,
  `comment` text,
  `created_by` int NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `crm_api_log`
--

CREATE TABLE `crm_api_log` (
  `id` int NOT NULL,
  `post_data` text NOT NULL,
  `get_data` text NOT NULL,
  `cdate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sesssion_data` text NOT NULL,
  `serve_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `crm_campaign`
--

CREATE TABLE `crm_campaign` (
  `id` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(200) NOT NULL,
  `added_by` int NOT NULL,
  `date_of_add` datetime NOT NULL,
  `status` varchar(50) NOT NULL DEFAULT '1',
  `cpc` varchar(20) NOT NULL DEFAULT '',
  `cost` varchar(20) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `crm_email_campaigns`
--

CREATE TABLE `crm_email_campaigns` (
  `id` int NOT NULL,
  `project_id` int NOT NULL,
  `subject` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `start_date` varchar(50) NOT NULL,
  `end_date` varchar(50) NOT NULL,
  `add_date` datetime NOT NULL,
  `update_date` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `crm_lead`
--

CREATE TABLE `crm_lead` (
  `id` int NOT NULL,
  `name` varchar(100) NOT NULL DEFAULT '',
  `company` varchar(100) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `mobile` varchar(20) NOT NULL DEFAULT '',
  `ip` varchar(50) NOT NULL DEFAULT '',
  `request_url` varchar(255) NOT NULL DEFAULT '',
  `campaign_name` varchar(255) NOT NULL,
  `add_date` datetime DEFAULT NULL,
  `is_delete` varchar(20) NOT NULL DEFAULT 'N',
  `is_active` varchar(1) NOT NULL DEFAULT 'Y',
  `added_by` int NOT NULL DEFAULT '0',
  `status` varchar(100) NOT NULL DEFAULT '',
  `merged_on` datetime NOT NULL,
  `merged_into_id` int NOT NULL DEFAULT '0',
  `assign_to` int NOT NULL DEFAULT '0',
  `lead_utm_source` varchar(255) NOT NULL DEFAULT '',
  `lead_campaign_source` varchar(100) NOT NULL DEFAULT '',
  `lead_medium_source` varchar(100) NOT NULL DEFAULT '',
  `industry_type` varchar(100) NOT NULL DEFAULT '',
  `office_phone` varchar(100) NOT NULL DEFAULT '',
  `update_date` datetime NOT NULL,
  `updated_by` int NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL DEFAULT '',
  `form_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `crm_lead_conversations`
--

CREATE TABLE `crm_lead_conversations` (
  `id` int NOT NULL,
  `lead_id` int NOT NULL,
  `message_type` varchar(10) NOT NULL,
  `message` text NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `crm_lead_conversations`
--

INSERT INTO `crm_lead_conversations` (`id`, `lead_id`, `message_type`, `message`, `created_at`) VALUES
(710, 1, 'user', 'Hi, I want a quote for pest control services.', '2026-07-01 10:00:00'),
(711, 1, 'agent', 'Sure! Could you share your city and property type?', '2026-07-01 10:01:00'),
(712, 2, 'user', 'What packages do you offer for termite treatment?', '2026-07-05 11:00:00'),
(713, 2, 'agent', 'We have Basic, Standard and Premium plans. Want details?', '2026-07-05 11:02:00'),
(714, 3, 'user', 'Can someone call me back with pricing?', '2026-07-02 12:05:00'),
(715, 3, 'agent', 'Sure, our team will call you shortly.', '2026-07-02 12:06:00'),
(716, 4, 'user', 'Do you cover residential societies?', '2026-06-26 15:35:00'),
(717, 4, 'agent', 'Yes, we service both residential and commercial sites.', '2026-06-26 15:36:00'),
(718, 5, 'user', 'I need a callback today for termite inspection.', '2026-07-06 09:50:00'),
(719, 5, 'agent', 'Noted, we will call you back today.', '2026-07-06 09:51:00');

-- --------------------------------------------------------

--
-- Table structure for table `crm_lead_documents`
--

CREATE TABLE `crm_lead_documents` (
  `id` int NOT NULL,
  `lead_id` int NOT NULL,
  `call_log_id` int DEFAULT NULL,
  `file_name` varchar(255) NOT NULL,
  `stored_name` varchar(255) NOT NULL,
  `file_size` int NOT NULL DEFAULT '0',
  `uploaded_by` int NOT NULL,
  `uploaded_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `crm_lead_documents`
--

INSERT INTO `crm_lead_documents` (`id`, `lead_id`, `call_log_id`, `file_name`, `stored_name`, `file_size`, `uploaded_by`, `uploaded_at`) VALUES
(38, 1, NULL, 'site_photo.jpg', 'lead1_site_photo_20260701.jpg', 245678, 10, '2026-07-01 10:10:00'),
(39, 2, NULL, 'requirement.pdf', 'lead2_requirement_20260705.pdf', 102400, 10, '2026-07-05 11:10:00'),
(40, 3, 1, 'quote_request.pdf', 'lead3_quote_request_20260702.pdf', 87231, 1, '2026-07-02 12:10:00'),
(41, 4, 2, 'property_layout.png', 'lead4_property_layout_20260626.png', 156432, 7, '2026-06-26 15:40:00'),
(42, 5, 3, 'inspection_notes.docx', 'lead5_inspection_notes_20260706.docx', 53210, 1, '2026-07-06 09:55:00');

-- --------------------------------------------------------

--
-- Table structure for table `crm_lead_notes`
--

CREATE TABLE `crm_lead_notes` (
  `id` int NOT NULL,
  `lead_id` int NOT NULL,
  `call_log_id` int DEFAULT NULL,
  `note_html` longtext NOT NULL,
  `created_by` int NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `crm_lead_notes`
--

INSERT INTO `crm_lead_notes` (`id`, `lead_id`, `call_log_id`, `note_html`, `created_by`, `created_at`) VALUES
(15, 1, NULL, '<p>Interested in residential pest control, prefers evening calls.</p>', 10, '2026-07-01 10:15:00'),
(16, 2, NULL, '<p>Asked about termite treatment pricing for a 2BHK flat.</p>', 10, '2026-07-05 11:15:00'),
(17, 3, 1, '<p>Spoke briefly, asked to call back with pricing details.</p>', 1, '2026-07-02 12:15:00'),
(18, 4, 2, '<p>No answer on first attempt, retry scheduled.</p>', 7, '2026-06-26 15:45:00'),
(19, 5, 3, '<p>Interested, requested callback today for inspection.</p>', 1, '2026-07-06 10:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `crm_lead_request`
--

CREATE TABLE `crm_lead_request` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `mobileno` char(100) NOT NULL,
  `email_id` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `assign_to` int NOT NULL,
  `lead_owner` int NOT NULL,
  `add_date` datetime NOT NULL,
  `added_by` int NOT NULL,
  `update_date` varchar(45) NOT NULL,
  `updated_by` int NOT NULL,
  `last_email_date` varchar(45) DEFAULT NULL,
  `visit_site` varchar(100) DEFAULT NULL,
  `source_details` varchar(100) DEFAULT NULL,
  `form_type` varchar(100) DEFAULT NULL,
  `form_location` int NOT NULL,
  `field1` varchar(100) DEFAULT NULL,
  `field2` varchar(100) DEFAULT NULL,
  `field3` varchar(100) DEFAULT NULL,
  `field4` varchar(100) DEFAULT NULL,
  `field5` varchar(100) DEFAULT NULL,
  `field6` varchar(100) DEFAULT NULL,
  `field7` varchar(100) DEFAULT NULL,
  `field8` varchar(100) DEFAULT NULL,
  `field9` text,
  `field10` varchar(100) DEFAULT NULL,
  `field11` varchar(100) DEFAULT NULL,
  `field12` varchar(100) DEFAULT NULL,
  `field13` varchar(100) DEFAULT NULL,
  `field14` varchar(100) DEFAULT NULL,
  `field15` varchar(100) DEFAULT NULL,
  `field16` varchar(100) DEFAULT NULL,
  `field17` varchar(100) DEFAULT NULL,
  `field18` varchar(100) DEFAULT NULL,
  `field19` varchar(100) DEFAULT NULL,
  `field20` varchar(100) DEFAULT NULL,
  `field21` varchar(100) DEFAULT NULL,
  `field22` varchar(100) DEFAULT NULL,
  `field23` varchar(100) DEFAULT NULL,
  `field24` varchar(100) DEFAULT NULL,
  `field25` varchar(100) DEFAULT NULL,
  `field26` varchar(100) DEFAULT NULL,
  `field27` varchar(100) DEFAULT NULL,
  `field28` varchar(100) DEFAULT NULL,
  `field29` varchar(100) DEFAULT NULL,
  `field30` varchar(100) DEFAULT NULL,
  `field31` varchar(100) NOT NULL,
  `field32` varchar(100) NOT NULL,
  `field33` varchar(100) NOT NULL,
  `field34` varchar(100) NOT NULL,
  `field35` varchar(100) NOT NULL,
  `field36` varchar(100) NOT NULL,
  `field37` varchar(100) NOT NULL,
  `field38` varchar(255) NOT NULL,
  `field39` varchar(255) NOT NULL,
  `address_line1` varchar(255) DEFAULT NULL,
  `address_line2` varchar(255) DEFAULT NULL,
  `address_city` varchar(100) DEFAULT NULL,
  `address_state` varchar(100) DEFAULT NULL,
  `address_pincode` varchar(20) DEFAULT NULL,
  `address_country` varchar(100) DEFAULT NULL,
  `notes` longtext,
  `status` varchar(100) DEFAULT NULL,
  `email_flag` tinyint(1) NOT NULL DEFAULT '0',
  `visit_date` datetime DEFAULT NULL,
  `lead_utm_source` varchar(100) DEFAULT NULL,
  `lead_channel` varchar(20) NOT NULL DEFAULT 'website',
  `lead_medium_source` varchar(100) DEFAULT NULL,
  `lead_campaign_source` varchar(100) DEFAULT NULL,
  `lead_utm_term` varchar(100) DEFAULT NULL,
  `lead_utm_content` varchar(100) DEFAULT NULL,
  `form_id` int NOT NULL,
  `is_delete` varchar(50) NOT NULL,
  `deleted_date` datetime DEFAULT NULL,
  `email_alerts` int NOT NULL,
  `total_emails` int NOT NULL,
  `issubscribed` int NOT NULL,
  `last_email_date_flag` date NOT NULL,
  `location` varchar(100) NOT NULL,
  `frmtime` varchar(100) NOT NULL,
  `website_url` varchar(100) NOT NULL,
  `source_website` varchar(255) DEFAULT NULL,
  `next_call_date` varchar(50) NOT NULL,
  `next_call_time` varchar(50) NOT NULL,
  `call_status` varchar(50) NOT NULL,
  `call_description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `crm_lead_request`
--

INSERT INTO `crm_lead_request` (`id`, `name`, `mobileno`, `email_id`, `message`, `assign_to`, `lead_owner`, `add_date`, `added_by`, `update_date`, `updated_by`, `last_email_date`, `visit_site`, `source_details`, `form_type`, `form_location`, `field1`, `field2`, `field3`, `field4`, `field5`, `field6`, `field7`, `field8`, `field9`, `field10`, `field11`, `field12`, `field13`, `field14`, `field15`, `field16`, `field17`, `field18`, `field19`, `field20`, `field21`, `field22`, `field23`, `field24`, `field25`, `field26`, `field27`, `field28`, `field29`, `field30`, `field31`, `field32`, `field33`, `field34`, `field35`, `field36`, `field37`, `field38`, `field39`, `address_line1`, `address_line2`, `address_city`, `address_state`, `address_pincode`, `address_country`, `notes`, `status`, `email_flag`, `visit_date`, `lead_utm_source`, `lead_channel`, `lead_medium_source`, `lead_campaign_source`, `lead_utm_term`, `lead_utm_content`, `form_id`, `is_delete`, `deleted_date`, `email_alerts`, `total_emails`, `issubscribed`, `last_email_date_flag`, `location`, `frmtime`, `website_url`, `source_website`, `next_call_date`, `next_call_time`, `call_status`, `call_description`) VALUES
(1, 'Rahul Mehta', '+91 9820011223', 'rahul.mehta1@gmail.com', 'Service: Corporate Website | Industry: Retail', 0, 0, '2026-07-17 09:15:00', 0, '', 0, NULL, NULL, NULL, 'Image Online', 0, '', NULL, NULL, NULL, NULL, NULL, 'Retail', '', '', NULL, 'Corporate Website', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', 'Get Quote', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', 1, NULL, 'google', 'website', 'website_form', 'iopl_new_site', NULL, NULL, 5, 'N', NULL, 0, 0, 0, '0000-00-00', '', '', '', NULL, '', '', '', ''),
(2, 'Priya Sharma', '+91 9820011224', 'priya.sharma2@gmail.com', 'Service: AI Agent & Chatbot | Industry: Retail', 0, 0, '2026-07-17 10:05:00', 0, '', 0, NULL, NULL, NULL, 'Image Online', 0, '', NULL, NULL, NULL, NULL, NULL, 'Retail', '', '', NULL, 'AI Agent & Chatbot', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', 'Get Quote', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', 1, NULL, 'facebook', 'website', 'website_form', 'iopl_new_site', NULL, NULL, 5, 'N', NULL, 0, 0, 0, '0000-00-00', '', '', '', NULL, '', '', '', ''),
(3, 'Amit Verma', '+91 9820011225', 'amit.verma3@yahoo.com', 'Company: ImageOnline', 1, 0, '2026-07-01 12:00:00', 0, '', 0, NULL, NULL, NULL, 'Image Online', 0, 'ImageOnline', NULL, NULL, NULL, NULL, NULL, '', '', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', 'Get Quote', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', 1, NULL, 'organic', 'website', 'website_form', 'iopl_new_site', NULL, NULL, 5, 'N', NULL, 0, 0, 0, '0000-00-00', '', '', '', NULL, '2026-07-10', '11:30', 'Reminder Scheduled', 'Spoke briefly, asked to call back with pricing details.'),
(4, 'Neha Kapoor', '+91 9820011226', 'neha.kapoor4@gmail.com', 'Company: ImageOnline', 7, 0, '2026-06-25 15:30:00', 0, '', 0, NULL, NULL, NULL, 'Image Online', 0, 'ImageOnline', NULL, NULL, NULL, NULL, NULL, '', '', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', 'Get Quote', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', 1, NULL, 'instagram', 'website', 'website_form', 'iopl_new_site', NULL, NULL, 5, 'N', NULL, 0, 0, 0, '0000-00-00', '', '', '', NULL, '2026-07-12', '15:00', 'Unreachable', 'No answer, will retry.'),
(5, 'Vikram Singh', '+91 9820011228', 'vikram.singh5@gmail.com', 'Service: Digital Marketing | Industry: Retail | Budget: ?1 – ?3 Lakhs | Timeline: 1–3 months | Q: What\'s your primary marketing objective for retail growth?\nA: Increase in-store foot traffic\n\nQ: Which digital channels interest you most?\nA: Email marketing campaigns; SEO optimization\n\nQ: What marketing activities are you currently running?\nA: Social media posts; Paid advertising campaigns; Email newsletters\n\nQ: What\'s your biggest marketing challenge today?\nA: Low website conversion rates', 1, 0, '2026-07-05 09:45:00', 0, '', 0, NULL, NULL, NULL, 'Image Online', 0, '', NULL, NULL, NULL, NULL, NULL, 'Retail', '?1 – ?3 Lakhs', '1–3 months', NULL, 'Digital Marketing', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', 'Get Quote', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', 1, NULL, NULL, 'website', NULL, NULL, NULL, NULL, 5, 'N', NULL, 0, 0, 0, '0000-00-00', '', '', '', NULL, '2026-07-17', '12:00', 'Reminder Scheduled', 'Interested, requested callback today.');

-- --------------------------------------------------------

--
-- Table structure for table `crm_lead_request_call_log`
--

CREATE TABLE `crm_lead_request_call_log` (
  `log_id` int NOT NULL,
  `id` int NOT NULL,
  `lead_id` int NOT NULL,
  `lead_status` varchar(50) NOT NULL,
  `call_status` varchar(30) NOT NULL,
  `call_description` text NOT NULL,
  `add_date` datetime NOT NULL,
  `added_by` int NOT NULL,
  `next_call_date` varchar(45) NOT NULL,
  `next_call_time` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `crm_lead_request_call_log`
--

INSERT INTO `crm_lead_request_call_log` (`log_id`, `id`, `lead_id`, `lead_status`, `call_status`, `call_description`, `add_date`, `added_by`, `next_call_date`, `next_call_time`) VALUES
(1, 1, 3, 'pending', 'Reminder Scheduled', 'Spoke briefly, asked to call back with pricing details.', '2026-07-02 12:00:00', 1, '2026-07-10', '11:30'),
(2, 2, 4, 'pending', 'Unreachable', 'No answer, will retry.', '2026-06-26 15:30:00', 7, '2026-07-12', '15:00'),
(3, 3, 5, 'pending', 'Reminder Scheduled', 'Interested, requested callback today.', '2026-07-06 09:45:00', 1, '2026-07-17', '12:00');

-- --------------------------------------------------------

--
-- Table structure for table `crm_lead_update_log`
--

CREATE TABLE `crm_lead_update_log` (
  `id` int NOT NULL,
  `lead_id` int NOT NULL,
  `lead_status` varchar(255) NOT NULL,
  `visit_date` date NOT NULL,
  `status_comment` varchar(255) NOT NULL,
  `assign_to` int NOT NULL,
  `update_date` varchar(45) NOT NULL,
  `updated_by` int NOT NULL,
  `last_assign_to` int NOT NULL,
  `call_status` varchar(255) NOT NULL,
  `next_call_date` varchar(255) NOT NULL,
  `next_call_time` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `crm_lead_update_log`
--

INSERT INTO `crm_lead_update_log` (`id`, `lead_id`, `lead_status`, `visit_date`, `status_comment`, `assign_to`, `update_date`, `updated_by`, `last_assign_to`, `call_status`, `next_call_date`, `next_call_time`) VALUES
(64, 3, 'pending', '2026-07-02', 'Spoke briefly, asked to call back with pricing details.', 1, '2026-07-02 12:00:00', 1, 0, 'Reminder Scheduled', '2026-07-10', '11:30'),
(65, 4, 'pending', '2026-06-26', 'No answer, will retry.', 7, '2026-06-26 15:30:00', 7, 0, 'Unreachable', '2026-07-12', '15:00'),
(66, 5, 'pending', '2026-07-06', 'Interested, requested callback today.', 1, '2026-07-06 09:45:00', 1, 0, 'Reminder Scheduled', '2026-07-17', '12:00');

-- --------------------------------------------------------

--
-- Table structure for table `crm_lead_vision`
--

CREATE TABLE `crm_lead_vision` (
  `id` int NOT NULL,
  `lead_id` int NOT NULL,
  `question` varchar(500) NOT NULL,
  `answer` text,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `crm_lead_vision`
--

INSERT INTO `crm_lead_vision` (`id`, `lead_id`, `question`, `answer`, `created_at`) VALUES
(5, 5, 'What\'s your primary marketing objective for retail growth?', 'Increase in-store foot traffic', '2026-07-14 11:44:20'),
(6, 5, 'Which digital channels interest you most?', 'Email marketing campaigns; SEO optimization', '2026-07-14 11:44:20'),
(7, 5, 'What marketing activities are you currently running?', 'Social media posts; Paid advertising campaigns; Email newsletters', '2026-07-14 11:44:20'),
(8, 5, 'What\'s your biggest marketing challenge today?', 'Low website conversion rates', '2026-07-14 11:44:20'),
(58, 1, 'What type of pest issue are you facing?', 'Cockroaches and ants in kitchen area.', '2026-07-01 10:03:00'),
(59, 2, 'How large is the property to be treated?', 'Approximately 900 sq ft, 2BHK flat.', '2026-07-05 11:05:00'),
(60, 3, 'What is your preferred service frequency?', 'Quarterly treatment preferred.', '2026-07-02 12:07:00'),
(61, 4, 'Is this for residential or commercial property?', 'Commercial - a residential society clubhouse.', '2026-06-26 15:37:00');

-- --------------------------------------------------------

--
-- Table structure for table `crm_mailing_list`
--

CREATE TABLE `crm_mailing_list` (
  `id` int NOT NULL,
  `lead_id` int NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `contactnumber` varchar(30) NOT NULL,
  `mobilenumber` varchar(30) NOT NULL,
  `project_id` int NOT NULL,
  `date_created` datetime NOT NULL,
  `last_email_date` varchar(50) DEFAULT NULL,
  `email_log` text NOT NULL,
  `total_emails` int NOT NULL,
  `last_email_link` varchar(255) NOT NULL,
  `issubscribed` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `crm_mailing_list`
--

INSERT INTO `crm_mailing_list` (`id`, `lead_id`, `username`, `email`, `contactnumber`, `mobilenumber`, `project_id`, `date_created`, `last_email_date`, `email_log`, `total_emails`, `last_email_link`, `issubscribed`) VALUES
(1, 1, 'Rahul Mehta', 'rahul.mehta1@gmail.com', '+91 9820011223', '+91 9820011223', 1, '2026-07-01 10:20:00', '2026-07-02', 'Welcome email sent', 1, 'https://example.com/campaign/welcome-1', 1),
(2, 2, 'Priya Sharma', 'priya.sharma2@gmail.com', '+91 9820011224', '+91 9820011224', 1, '2026-07-05 11:20:00', '2026-07-06', 'Welcome email sent', 1, 'https://example.com/campaign/welcome-2', 1),
(3, 3, 'Amit Verma', 'amit.verma3@yahoo.com', '+91 9820011225', '+91 9820011225', 1, '2026-07-02 12:20:00', '2026-07-03', 'Welcome email sent', 1, 'https://example.com/campaign/welcome-3', 1),
(4, 4, 'Neha Kapoor', 'neha.kapoor4@gmail.com', '+91 9820011226', '+91 9820011226', 1, '2026-06-26 15:50:00', '2026-06-27', 'Welcome email sent', 1, 'https://example.com/campaign/welcome-4', 1),
(5, 5, 'Vikram Singh', 'vikram.singh5@gmail.com', '+91 9820011228', '+91 9820011228', 1, '2026-07-06 10:05:00', '2026-07-07', 'Welcome email sent', 1, 'https://example.com/campaign/welcome-5', 1);

-- --------------------------------------------------------

--
-- Table structure for table `crm_module`
--

CREATE TABLE `crm_module` (
  `id` int NOT NULL,
  `page_name` varchar(50) NOT NULL,
  `shr_name` varchar(10) NOT NULL,
  `url` varchar(100) NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `crm_module`
--

INSERT INTO `crm_module` (`id`, `page_name`, `shr_name`, `url`, `title`, `description`) VALUES
(2, 'Lead Management', 'lm', 'list_leads.php', 'Lead Management', 'Lead Management'),
(3, 'User Management', 'um', 'list_user.php', 'User Management', 'User Management');

-- --------------------------------------------------------

--
-- Table structure for table `crm_product`
--

CREATE TABLE `crm_product` (
  `id` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(200) NOT NULL,
  `added_by` int NOT NULL,
  `date_of_add` datetime NOT NULL,
  `status` varchar(50) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `crm_role`
--

CREATE TABLE `crm_role` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `menu_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `crm_team`
--

CREATE TABLE `crm_team` (
  `id` int NOT NULL,
  `team_name` varchar(100) NOT NULL,
  `team_description` varchar(300) NOT NULL,
  `team_leader_id` int NOT NULL,
  `added_by` int NOT NULL,
  `date_of_add` datetime NOT NULL,
  `date_of_update` datetime NOT NULL,
  `status` varchar(50) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `crm_team_user`
--

CREATE TABLE `crm_team_user` (
  `id` int NOT NULL,
  `team_id` int NOT NULL,
  `member_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `crm_user_registration`
--

CREATE TABLE `crm_user_registration` (
  `reg_id` int NOT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `user_email` varchar(255) DEFAULT NULL,
  `user_pswd` varchar(255) DEFAULT NULL,
  `contact_number` varchar(255) DEFAULT NULL,
  `department` int NOT NULL,
  `form_access` varchar(50) NOT NULL,
  `website_lead` varchar(50) DEFAULT NULL,
  `is_admin` int NOT NULL,
  `is_delete` varchar(20) DEFAULT NULL,
  `is_active` varchar(1) DEFAULT NULL,
  `add_date` date DEFAULT NULL,
  `updated_date` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `category_access` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `crm_user_registration`
--

INSERT INTO `crm_user_registration` (`reg_id`, `user_name`, `user_email`, `user_pswd`, `contact_number`, `department`, `form_access`, `website_lead`, `is_admin`, `is_delete`, `is_active`, `add_date`, `updated_date`, `category_access`) VALUES
(10, 'admin', 'admin@imageonline.co.in', '0192023a7bbd73250516f069df18b500', '', 1, '1,2,3,4,5', '', 1, 'N', 'Y', '2026-07-20', '2026-07-20 15:43:20', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `crm_ai_agent_logs`
--
ALTER TABLE `crm_ai_agent_logs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_request_id` (`request_id`),
  ADD KEY `idx_lead_id` (`lead_id`),
  ADD KEY `idx_status` (`status`),
  ADD KEY `idx_created_at` (`created_at`),
  ADD KEY `idx_session_id` (`session_id`);

--
-- Indexes for table `crm_ai_log_feedback`
--
ALTER TABLE `crm_ai_log_feedback`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_ai_log_id` (`ai_log_id`);

--
-- Indexes for table `crm_lead`
--
ALTER TABLE `crm_lead`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `crm_lead_conversations`
--
ALTER TABLE `crm_lead_conversations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lead_id` (`lead_id`);

--
-- Indexes for table `crm_lead_documents`
--
ALTER TABLE `crm_lead_documents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lead_id` (`lead_id`);

--
-- Indexes for table `crm_lead_notes`
--
ALTER TABLE `crm_lead_notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lead_id` (`lead_id`);

--
-- Indexes for table `crm_lead_request`
--
ALTER TABLE `crm_lead_request`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `crm_lead_request_call_log`
--
ALTER TABLE `crm_lead_request_call_log`
  ADD PRIMARY KEY (`log_id`);

--
-- Indexes for table `crm_lead_update_log`
--
ALTER TABLE `crm_lead_update_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `crm_lead_vision`
--
ALTER TABLE `crm_lead_vision`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lead_id` (`lead_id`);

--
-- Indexes for table `crm_mailing_list`
--
ALTER TABLE `crm_mailing_list`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`,`project_id`);

--
-- Indexes for table `crm_module`
--
ALTER TABLE `crm_module`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `crm_product`
--
ALTER TABLE `crm_product`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `crm_role`
--
ALTER TABLE `crm_role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `crm_team`
--
ALTER TABLE `crm_team`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `team_name` (`team_name`,`status`) USING BTREE;

--
-- Indexes for table `crm_team_user`
--
ALTER TABLE `crm_team_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `crm_user_registration`
--
ALTER TABLE `crm_user_registration`
  ADD PRIMARY KEY (`reg_id`),
  ADD UNIQUE KEY `user_name` (`user_name`,`is_delete`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `crm_ai_agent_logs`
--
ALTER TABLE `crm_ai_agent_logs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=185;

--
-- AUTO_INCREMENT for table `crm_ai_log_feedback`
--
ALTER TABLE `crm_ai_log_feedback`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `crm_lead`
--
ALTER TABLE `crm_lead`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `crm_lead_conversations`
--
ALTER TABLE `crm_lead_conversations`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=720;

--
-- AUTO_INCREMENT for table `crm_lead_documents`
--
ALTER TABLE `crm_lead_documents`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `crm_lead_notes`
--
ALTER TABLE `crm_lead_notes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `crm_lead_request`
--
ALTER TABLE `crm_lead_request`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT for table `crm_lead_request_call_log`
--
ALTER TABLE `crm_lead_request_call_log`
  MODIFY `log_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `crm_lead_update_log`
--
ALTER TABLE `crm_lead_update_log`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=143;

--
-- AUTO_INCREMENT for table `crm_lead_vision`
--
ALTER TABLE `crm_lead_vision`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `crm_mailing_list`
--
ALTER TABLE `crm_mailing_list`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `crm_module`
--
ALTER TABLE `crm_module`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `crm_product`
--
ALTER TABLE `crm_product`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `crm_role`
--
ALTER TABLE `crm_role`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=135;

--
-- AUTO_INCREMENT for table `crm_team`
--
ALTER TABLE `crm_team`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `crm_team_user`
--
ALTER TABLE `crm_team_user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `crm_user_registration`
--
ALTER TABLE `crm_user_registration`
  MODIFY `reg_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `crm_ai_log_feedback`
--
ALTER TABLE `crm_ai_log_feedback`
  ADD CONSTRAINT `fk_ai_log_feedback_log` FOREIGN KEY (`ai_log_id`) REFERENCES `crm_ai_agent_logs` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
