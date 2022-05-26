Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 30846534A67
	for <lists+linux-usb@lfdr.de>; Thu, 26 May 2022 08:34:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346202AbiEZGdx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 26 May 2022 02:33:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344030AbiEZGdw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 26 May 2022 02:33:52 -0400
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1anam02on2078.outbound.protection.outlook.com [40.107.96.78])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7D45BCEB3
        for <linux-usb@vger.kernel.org>; Wed, 25 May 2022 23:33:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UwC63fes3tIS1l+xkStnGbVd96lXGGHslthwXD8CrtdC7DVepLLHzGU+VV9grIKbJWFAUrz/TeDoDttoUcO2p9T4VZmjWzBhw62lMFikkd3Ys6u7FmHm1sdOA1wJHPoc8h8gxeq3MNLkqgr/f9JX+OIlQhffd0eSCyIv13f6gqsU72ReEezN9nlWkmjNteBXnfF3xTd3tTGTfLnh9kDoTVYH0aqO6vVLXbrujdK6VOLRCU4lcP4LiQIglTOU+53tXN3Cdv0JjumXCah47WJ6JHf4JYX7yRbjVfGfl2tPxSOFwayed0ZRZWcC8dEwhCn0IT3A5pdJSipy9cvO4vIMmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LmEsoRbBdexEgJw9xlXei1eDUq5s0NsqIVxlfCTThGA=;
 b=bF/h1pJc6yPRUHh8KU4MSc7AD+pEioXL8PEmSdEpLkpMCfyCRDfmD2rgpAUVX1Be9+xiYhDo/gnpS1ql4p0qPF3fTJdeMFMBKTy+qcgRcrGl56H6DvzKbGREJQcaWx9txW/MDwl/LHFlpGKJe9npgE8CElxvaTkWbVQ/w39woc+7O84kQ1VyXHlsFeD/sQedJKjNS9VxOci+ev/gkOwMw+Xjp0IHGU1iqAdBcusN/lWJalDr303d22GksypBslDbS3c1zHcy6WOBOLZRdE2y/6rKOheks1cpeuLCr+iW2Ght8rzqcTfygFGhEu5nUajJ0Ivs3TgzK4GX/xto04RBBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LmEsoRbBdexEgJw9xlXei1eDUq5s0NsqIVxlfCTThGA=;
 b=nPhdl+eHzbmiPAC/ShbH2ntvu3KDo3zlJrt+s6DS8kq+aDfLGKq1xB1hWb21h5TvpY3a/lHB2gShp43dT7YKhNE/XGB+KZWTdw5dqAWQOTIo9qvcgqSEzmbY0dhYtgDV0Hf9VWLzZl3Qxi8I7EbrbDrJT7n37mp9QEbhuo2O5ok=
Received: from MW4PR03CA0355.namprd03.prod.outlook.com (2603:10b6:303:dc::30)
 by SN6PR12MB5696.namprd12.prod.outlook.com (2603:10b6:805:e9::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.19; Thu, 26 May
 2022 06:33:49 +0000
Received: from CO1NAM11FT048.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:dc:cafe::9) by MW4PR03CA0355.outlook.office365.com
 (2603:10b6:303:dc::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13 via Frontend
 Transport; Thu, 26 May 2022 06:33:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT048.mail.protection.outlook.com (10.13.175.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5293.13 via Frontend Transport; Thu, 26 May 2022 06:33:48 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 26 May
 2022 01:33:45 -0500
From:   Sanket Goswami <Sanket.Goswami@amd.com>
To:     <heikki.krogerus@linux.intel.com>, <gregkh@linuxfoundation.org>,
        <ajayg@nvidia.com>, <linux-usb@vger.kernel.org>
CC:     Sanket Goswami <Sanket.Goswami@amd.com>
Subject: [PATCH v3 2/2] ucsi_ccg: ACPI based I2c client enumeration for AMD ASICs
Date:   Thu, 26 May 2022 12:03:05 +0530
Message-ID: <20220526063305.3144352-3-Sanket.Goswami@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220526063305.3144352-1-Sanket.Goswami@amd.com>
References: <20220526063305.3144352-1-Sanket.Goswami@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bd6532ec-0ee1-4605-8f25-08da3ee1b12b
X-MS-TrafficTypeDiagnostic: SN6PR12MB5696:EE_
X-Microsoft-Antispam-PRVS: <SN6PR12MB569667A2E4478CE9B2B94E1F9CD99@SN6PR12MB5696.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0/aFKhTgjW+PnaFc31uBBKvcfBNdl2MIPC+/lOyIbXwUvEvMYe1nWO8rVqLz9sWDeXvkJwRgYTyFmbsZl3084JgR82cyw8xZZepxW33ClIoutvo9qe68prFdM0h2oOo27tQCxlL2E/9GTTJkzu8uciF8eTvio/IGq1Jy4o80VdZR5ITet/6g1WsKkcNJDXyceSGF4yoLqLlW0npha4E6kE9hCK7UnKEfduwSuBxzYGlBFU/BVFKVmDi5piHfaH0qWu0FxCzIHVlroUEyU2GQRoZB1ug+Rv4TDYm9zn4W6Y5fEXPt4ZPsvc9guPWt7QVKli3R+OzeOwWPXLgZWT8hOEdYMagFEIOYWvpBADUCMFGNAqhiy+ZpgmsuIY+OliTFuAiwfyzVdq/YvxiXkfcYLQ7T9XTJvkqNegMvVI14J1r0hr+xVdbyJTdBfv/ZS8MOgBFV+aXu8/UTpn2i3pD7fpXQesrw5tCR3r/JBO+z2CMFZNntFcTpulEW319cv+waTY3Wbm2AxE2YJMOSCQ4HQ8JB+x9ea7TEuWq073gxjFPcnxPslx5DQBwtO7ds3TKELf6Gl0fjB68Pw3BBOUAjLBqmQSWa92zX5GkOL5NGOT4gn8L6pF/lpF0QopqJfhrS1Nqohpc6oPMWxhAsKU4qkVzXKkKqOd09TCe9F5pfNit4rqXJPmShRxEWz5/lvHCeeXakAD7Ykk615wB5xt/bIA==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(36756003)(36860700001)(186003)(16526019)(316002)(6666004)(40460700003)(110136005)(7696005)(356005)(70586007)(508600001)(86362001)(26005)(70206006)(2906002)(2616005)(4326008)(1076003)(5660300002)(8936002)(81166007)(336012)(82310400005)(426003)(47076005)(8676002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2022 06:33:48.5457
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bd6532ec-0ee1-4605-8f25-08da3ee1b12b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT048.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB5696
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Some of the AMD platforms have Cypress CCGX PD controller connected
to system I2C i.e designware I2C controller. Added support to enumerate
the CCGX client by adding ACPI ID to the firmware.

Suggested-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
---
Changes in v3:
- Swap the patch 1 and 2 to achieve required functionality.

Changes in v2:
- No change.

 drivers/usb/typec/ucsi/ucsi_ccg.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
index 0707a7156299..5c0bf48be766 100644
--- a/drivers/usb/typec/ucsi/ucsi_ccg.c
+++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
@@ -1423,6 +1423,12 @@ static const struct i2c_device_id ucsi_ccg_device_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, ucsi_ccg_device_id);
 
+static const struct acpi_device_id amd_i2c_ucsi_match[] = {
+	{"AMDI0042"},
+	{}
+};
+MODULE_DEVICE_TABLE(acpi, amd_i2c_ucsi_match);
+
 static int ucsi_ccg_resume(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
@@ -1464,6 +1470,7 @@ static struct i2c_driver ucsi_ccg_driver = {
 		.name = "ucsi_ccg",
 		.pm = &ucsi_ccg_pm,
 		.dev_groups = ucsi_ccg_groups,
+		.acpi_match_table = amd_i2c_ucsi_match,
 	},
 	.probe = ucsi_ccg_probe,
 	.remove = ucsi_ccg_remove,
-- 
2.25.1

