Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1571252EAC4
	for <lists+linux-usb@lfdr.de>; Fri, 20 May 2022 13:27:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348499AbiETL1v (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 20 May 2022 07:27:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348518AbiETL1t (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 20 May 2022 07:27:49 -0400
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2047.outbound.protection.outlook.com [40.107.243.47])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B22AEBE86
        for <linux-usb@vger.kernel.org>; Fri, 20 May 2022 04:27:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=POG7Ot0S3tjPZGwDNkO9UxwP5BKz6DHe3KK4I7ea4cxhZ7qbFr+eofzlf8XFDnDIE64hAhJ3TgEMC35Y6p5AKEqpXwNw2oeHNXSxw5Eg9G/ZQ7APhzfHoVO+4BcFBuhBihdGIcvCq9NrRAZuxq/Rl8ldel/+uNCEoy0bkGs6en6+siU/3LPiOq3PHA3TcFsvMaC7sz/SqXs+gFLhOP1HPZldQyh9DU3N/qTGHBGc2g/GMYGF7+zMw28AwFANi34ZWG2pWE5qivQSmPFAiZvvVOaS5h2EMZWjE8lFnBgBI2RbIazt+DGY+F+eWqX+2BD2MTOXE19aI2JEk16nEOvj8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IVR6QcctdzpYsMcx3CKYOzyP0E/LHE55ITo6BR8cdFo=;
 b=GNQX4Fd62tlhD+UytivA1iw7XuM77vcCq4ySW3en4LUBDHcSj+FWyiiOgm/ZUB8CmewzxEpsX5NuJ7mHYUYI5Ijl3pcMip1dIhcOsOhG0lsb6IKV+WbK7G6jFiUvMlijZd1icCAYtqfA32oWLYp4QITuTBWSUtGlxgNiM8Ce/6n2SPSrRMoFZu2+qLDTwFNjUm+iWk4xseJ7zdWZusZlw53XUUZuNDx0P00kATGCCXcsHCnoR3U2jpgnE2cCJ09QXLsjyQV1kRs3j3zo0G56rXli5/9DRQ2y5pXczJXLVSKojkk+dpWpaRqIB/IT1Fzq/gD35/+quY053VQcqeBEOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IVR6QcctdzpYsMcx3CKYOzyP0E/LHE55ITo6BR8cdFo=;
 b=FUFASyQY42g6Wi4C9i6HDEzC1oWiwKAm+VWbvHZ3PVZ28WYOxRGSnfGu5pRCnkiTg/LJN7n1MBndMd1KUHT2s4V7I529CJwUyWk5tkV8RI+xZNudusBNIqnRgbcJKA0267hTX5g8tQy7TWx5/Avgu69gtcxZqxcMZ23TLdL/t28=
Received: from BN6PR14CA0020.namprd14.prod.outlook.com (2603:10b6:404:79::30)
 by MWHPR1201MB2557.namprd12.prod.outlook.com (2603:10b6:300:e4::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.13; Fri, 20 May
 2022 11:27:44 +0000
Received: from BN8NAM11FT009.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:79:cafe::78) by BN6PR14CA0020.outlook.office365.com
 (2603:10b6:404:79::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20 via Frontend
 Transport; Fri, 20 May 2022 11:27:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT009.mail.protection.outlook.com (10.13.176.65) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5273.14 via Frontend Transport; Fri, 20 May 2022 11:27:43 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Fri, 20 May
 2022 06:27:41 -0500
From:   Sanket Goswami <Sanket.Goswami@amd.com>
To:     <heikki.krogerus@linux.intel.com>, <gregkh@linuxfoundation.org>,
        <ajayg@nvidia.com>, <linux-usb@vger.kernel.org>
CC:     Sanket Goswami <Sanket.Goswami@amd.com>
Subject: [PATCH v2 1/2] ucsi_ccg: ACPI based I2c client enumeration for AMD ASICs
Date:   Fri, 20 May 2022 16:57:03 +0530
Message-ID: <20220520112704.1461022-2-Sanket.Goswami@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220520112704.1461022-1-Sanket.Goswami@amd.com>
References: <20220520112704.1461022-1-Sanket.Goswami@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a73a17e8-4a7d-4ae7-558a-08da3a53c220
X-MS-TrafficTypeDiagnostic: MWHPR1201MB2557:EE_
X-Microsoft-Antispam-PRVS: <MWHPR1201MB2557CA7D9CCA821D41569EEF9CD39@MWHPR1201MB2557.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 926c5mjWetSyAg2NS47GzEQXjrAQn4QpyuOjF1+z9a4RX1EveYupePcB8MWaGbhQtAphGKC1fLjLmRNaMUR8p8dszCfGt87JnM0Qn4zm4sO05bHF/QOKLG5zFeMc0APgHW5Hm8GfQfVkxZvLkefnfpxe1DRdTAeDuicuilgOuuvuC4USXViLbi88i9ROa/3vTojTBlWoLCR4Wp48Iw/AVpjoQ6FVsSD+0lSb6iR/lTCpyteGLmws0uHQpO/CczhXCHzWdBJFfM8su3zV5la1XMyCgDjCb2uWzfjYjOTu1rGKP5Hwz9IMoeK8Yt6REGWOrvQAb4YzdGgAr/CkxtuXeuMxO1BYSHltX+FN8comWTwNwfKJ9QmKguNfECqOmBUHkQ2RXWSeQTe0VzICJl2HlU7sb9PUMs4AgHwtxXteQq6FQUUZHXA0AF7DG5HIkRXvcuEdNimguHJSucNcyKduAwS5wiwC8LUL+eZK73jgDxIvPYhLWideqoLFC3SqwMWuzUELpu0VeqvzwsL6+tjNarFD3ZrmbsSeQtDUNIDD4IxiN+cF8vGOy8GyhOakhD76G4nHUTahkdIcX75+JzJGZV0kRQ7fU+vk3l2sD3xcJzhsLmBmqwGtzYRE9cvimMgkaMjass8g4OudZKfy1ZDJGOemJP+lqJkkO4pSWp68H0BcmnXvMRDK6WKt3Fk87DwuNIhJcEL5ZOnoI+doh0IPaw==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(1076003)(5660300002)(40460700003)(508600001)(81166007)(36860700001)(2906002)(86362001)(110136005)(356005)(70206006)(70586007)(186003)(2616005)(47076005)(426003)(336012)(8676002)(316002)(8936002)(82310400005)(26005)(4326008)(16526019)(6666004)(7696005)(36756003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2022 11:27:43.9317
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a73a17e8-4a7d-4ae7-558a-08da3a53c220
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT009.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB2557
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

Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
---
 drivers/usb/typec/ucsi/ucsi_ccg.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
index 6db7c8ddd51c..7585599bacfd 100644
--- a/drivers/usb/typec/ucsi/ucsi_ccg.c
+++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
@@ -1418,6 +1418,12 @@ static const struct i2c_device_id ucsi_ccg_device_id[] = {
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
@@ -1459,6 +1465,7 @@ static struct i2c_driver ucsi_ccg_driver = {
 		.name = "ucsi_ccg",
 		.pm = &ucsi_ccg_pm,
 		.dev_groups = ucsi_ccg_groups,
+		.acpi_match_table = amd_i2c_ucsi_match,
 	},
 	.probe = ucsi_ccg_probe,
 	.remove = ucsi_ccg_remove,
-- 
2.25.1

