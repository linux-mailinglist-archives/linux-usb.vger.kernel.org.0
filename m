Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EB0ED520D36
	for <lists+linux-usb@lfdr.de>; Tue, 10 May 2022 07:25:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236717AbiEJF3u (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 10 May 2022 01:29:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236707AbiEJF3r (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 10 May 2022 01:29:47 -0400
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam07on2041.outbound.protection.outlook.com [40.107.95.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 946113BF90
        for <linux-usb@vger.kernel.org>; Mon,  9 May 2022 22:25:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QVd0uqbUF+lOCNMvJiiWwRYxAyxbzhzQPObwELNik7k4WrRjQimfkKR1dsRxedBQ1meE1168VlT9AZTzFaHhrvDdcLEcImbSoDCB8oSic4/6W9rVG75Z6TL4XpxC9kD4RzRnhUyQBy0ACnKobT5G+vEASIfSK+bxP8BN0AKPwiaF2ZzywyIwScxxP1SczAoP+qQwr5i/RaP8+Gty5qXSxpao4e+RPyXxVrMOBJ82aBx1i9woXrqOZywdxQWqLanAUcW+K3roCBIngdE5S1845oYH6DDkWsNxtWx4gIqyIH+Tlc9Rqyask/cfBKcEd0kY0PoEV9N2q+NivlSIjRyfEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IVR6QcctdzpYsMcx3CKYOzyP0E/LHE55ITo6BR8cdFo=;
 b=UIyYk6w2l+lbmSyMt2Z9anvHm8nDDqll7za7bdn93va1r+tAin0RQG9E78d8PKpdui4j7vM/65U44aVN0Iipm0jbMZmPs5gwRnSiXeYhC2G6GV3B+EpW7S+Bm4UWwxwoaRFE1vDJz2J6OWJJoG07OBE1LDF91B5qPoREDxFkO/wQzltrc6pvRXVyZ4EOmo1z/jZDOS5750rscPoryPTXmYHobhhrQuEt2HYATRoc6BqGj25+IgyRbqQGk0b+0aVv+1HDNhkicYu0LM/Y2EKVQx+W0nQGWKHmCP9juzA9L3A2d/W8jbLix+HiP3MMsoiJyjbLvFRXESlLPlPORNYdlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IVR6QcctdzpYsMcx3CKYOzyP0E/LHE55ITo6BR8cdFo=;
 b=L2g89gs4DtfmhgIzhvbjys/XfRcvN5p8zB2sw9bPExbrPNWbkquafEgxmt9WqBtwF6stVLzGmAB01sdX8pNy7cQ+a2FLcnE2eD3TuAE6e14gJUaEHeMk7aPJEBmRezjZr4AhgqVBeK4ImZWWnn9FYNlsvDjhqLt4KajRf3zitfk=
Received: from DS7PR05CA0097.namprd05.prod.outlook.com (2603:10b6:8:56::26) by
 PH0PR12MB5607.namprd12.prod.outlook.com (2603:10b6:510:142::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.18; Tue, 10 May
 2022 05:25:41 +0000
Received: from DM6NAM11FT025.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:56:cafe::c0) by DS7PR05CA0097.outlook.office365.com
 (2603:10b6:8:56::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.13 via Frontend
 Transport; Tue, 10 May 2022 05:25:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT025.mail.protection.outlook.com (10.13.172.197) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5227.15 via Frontend Transport; Tue, 10 May 2022 05:25:41 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Tue, 10 May
 2022 00:25:38 -0500
From:   Sanket Goswami <Sanket.Goswami@amd.com>
To:     <heikki.krogerus@linux.intel.com>, <gregkh@linuxfoundation.org>,
        <ajayg@nvidia.com>, <linux-usb@vger.kernel.org>
CC:     Sanket Goswami <Sanket.Goswami@amd.com>
Subject: [PATCH 1/2] ucsi_ccg: ACPI based I2c client enumeration for AMD ASICs
Date:   Tue, 10 May 2022 10:54:36 +0530
Message-ID: <20220510052437.3212186-2-Sanket.Goswami@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220510052437.3212186-1-Sanket.Goswami@amd.com>
References: <20220510052437.3212186-1-Sanket.Goswami@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 538bf712-1b35-4b0e-381c-08da3245863a
X-MS-TrafficTypeDiagnostic: PH0PR12MB5607:EE_
X-Microsoft-Antispam-PRVS: <PH0PR12MB5607FBED275E6C8464E393E79CC99@PH0PR12MB5607.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FaLrGOw/XDLAfYlvgPwz85BPBClchurCLaGdKmC58of6/Pw/HcMXBYU+ihMvcQZ/xTkGDJ0JvJLpNdHAn4qpdlfTOX8MfbsG+mK6fbWoWT9AEtxEUwQ409FzwxliYjvXDy4GusvQdz+r9HSODeTpbbnlKJEkWJkQPRMZNk33ndzgT8y+FE7jAPRVY1OuwAS5XmZyt3WEMtlVSLQfxZ9sQq8RigZXDYdRJn6uXTkHJu0CdvCnHn4pjKwjjmkI7s/eTD2JZliIvmenRj4s4tk/ZgqOLXcGqPBIgh9BT+BuNNG4GKbvwilVU8qNw6OHjZHhNMP3AefYIuDq+kI4s3Cxoe+lVZyJtjUXLQHubjRNMSWpo5OU7nuEa3SMcJHqrMfVq6eK47SF6MZYKaCOhfJvoPPCo+6SGNYRhu6EhK5fMh4fAu+/AV4ZOfEZvWZ9Yv7X9EwtHdv4xqrPP8LzXJDGBcuGDSJtnrmKpwpk6ynkqHU1xymI0lTRcKONfYgE1VCqAJi2znnlZjvy/XxaUtDGYj3RCW4H71UtzxgQYArXRiLQFu7cygb5sNrO81kd4CuE6+q5uEkqDkyNV4K3OMjByLryBJUTwpkpNyimY7N78nz+ogea3YS9dCcQL0AJnMjzP80MxabxRgXDMEdXObydT7kwekzzQOXqr5etDR7C5S6HrBAXH+38lp1w5Mz89XkqAflKh30/IZP4kskYxLxM/Q==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(7696005)(508600001)(1076003)(8936002)(16526019)(81166007)(2906002)(186003)(36756003)(316002)(336012)(47076005)(426003)(2616005)(5660300002)(70206006)(82310400005)(70586007)(86362001)(4326008)(8676002)(356005)(40460700003)(36860700001)(110136005)(26005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2022 05:25:41.1503
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 538bf712-1b35-4b0e-381c-08da3245863a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT025.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5607
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
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

