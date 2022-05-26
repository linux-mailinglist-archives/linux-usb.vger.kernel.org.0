Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB66A534A66
	for <lists+linux-usb@lfdr.de>; Thu, 26 May 2022 08:33:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345594AbiEZGds (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 26 May 2022 02:33:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344030AbiEZGdq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 26 May 2022 02:33:46 -0400
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2075.outbound.protection.outlook.com [40.107.220.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED197BDA3B
        for <linux-usb@vger.kernel.org>; Wed, 25 May 2022 23:33:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dw4so5ktgN4eRcDj3qcWaQEU1knqI4VDQCBnxMwG0qDGFcvhTtx20uMmEytr7NGfDmDmbds5xvbzmb3HEddKWYiilHZG7ZIcZfi6WjQfvsnBdW9mswU40rIWRmkCVteGEsaEGIvbO1G35+3i2Jo70NI+7JW5cxtfHsK+Xl/hEvc5YPHS5H0/lAVz1ssmJXd2LKejkMzNB4D8DhPYYYceL46UTTzAZh3VB7nbqCTauCrW9VFg42Ltj7nPge6vHBLA5qKQwOhhZ6De2oFs0C8BkzB2PWulbCAU/DXjbWJ0t8k4q6HV2aDmDCLR2sLqS6dPcEK5GwyI3NIiD+3NJrpN/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m9OxxCwxesQmIzaDVCsz3uq/Vpl9wIhVNx52wEMbYTY=;
 b=R74KxZXtTPlHBKkdrKdBsJ7A2BSgfC12YEwRTRfIyY6qPqWt5U+hIYNYFwLEyTzAYl36h1O07e42KzrO+YnPVxWLDeBrqJqT3aRzdISYkZWz2uRsW066sU0ZC+z9okZN/+StlpGfM4kMwpQ7aKBBlI80ayLihTBwh5AAolNvxPFhtLxYc/FDOVsW5hrwDAUu8MMFuxzkiWPXirm0ORrzKuB/48h0hqaHzpInWNZ3yP0VAjOrMJAh1PaKpNs9QAxWOLX4+4LYnIz9ijROfsgxVtEJj0QTZQZ+9Bw8HftUoYnfuaS/LuC3iAqFDcCbthbnQ6nauPxoM9ZSKQK8V4lhog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m9OxxCwxesQmIzaDVCsz3uq/Vpl9wIhVNx52wEMbYTY=;
 b=ObZvBj2qyvWjcnvy++UXPXY6CTJt6kR6OgqIkAzmE71h5p4azMPVvYH3iap72WXqYlMkLwm0zZUSHidxdJDDAyd8s+B5/bResJoaoJSuZ6PInK8Ql690O+i/n96bYKDYcnjtEsZSrlI2MP41w8n78A3h8yH3eYmoXrb6BoGGRtw=
Received: from MW4P222CA0017.NAMP222.PROD.OUTLOOK.COM (2603:10b6:303:114::22)
 by DM6PR12MB5568.namprd12.prod.outlook.com (2603:10b6:5:20c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Thu, 26 May
 2022 06:33:42 +0000
Received: from CO1NAM11FT027.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:114:cafe::cf) by MW4P222CA0017.outlook.office365.com
 (2603:10b6:303:114::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13 via Frontend
 Transport; Thu, 26 May 2022 06:33:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT027.mail.protection.outlook.com (10.13.174.224) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5293.13 via Frontend Transport; Thu, 26 May 2022 06:33:41 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 26 May
 2022 01:33:38 -0500
From:   Sanket Goswami <Sanket.Goswami@amd.com>
To:     <heikki.krogerus@linux.intel.com>, <gregkh@linuxfoundation.org>,
        <ajayg@nvidia.com>, <linux-usb@vger.kernel.org>
CC:     Sanket Goswami <Sanket.Goswami@amd.com>
Subject: [PATCH v3 1/2] ucsi_ccg: Do not hardcode interrupt polarity and type
Date:   Thu, 26 May 2022 12:03:04 +0530
Message-ID: <20220526063305.3144352-2-Sanket.Goswami@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 03cb9fd5-65c6-4a4a-5249-08da3ee1ad3d
X-MS-TrafficTypeDiagnostic: DM6PR12MB5568:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB55680241CE53855C3BDC5B7D9CD99@DM6PR12MB5568.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CIfwGZod3eCAjfe1fi24r95h6zUAc7gUNOTzcI9QyaDjtAQwI4HE94mccJ5NV4LIbMztAoRW856v/y6q70xJPcSJQn/QLndijCJ6jnXjBDKevykfj2W1O1/DoZq6ELvaixpzAm6zKFk5tTRvjEXFi77EYrQBazwFUbzVRD1LcsyZ8m19tWJzR8hiFELlaJ5prYrOjw7VSXQ8IJkSH0XsC99nizatK5ItDWBzdoaN4exYSogKfmVHXKxinVHIexxKRoNdbPOmRCtbzMW6ZzOWPxTfq6jezMyh6kMcwV/9Ps1FKd1GGSQmL/k6LlOQzyLvs05O8FfQmh3BetytBIoBePYz2eGMQol901znbSJK+H+ZOjC9kuyxuSdv7YnmreX5Y9u/32WnJQgnOsueoe6m39WJc2HSZeG02l3XWQGhOvxU+YFTm0rm25OqWYeqJ8PEbQWFL/VobFeAtQtSF4bpZJRBWACZvsq1wBgLmiaD2cXWUI3rt0LTcq0+pONyijoJZGhoI9w9FzJj6wQ2VTbceYKJexMFrpurrXA3EZ6msp54SSjCiMviER6U4qCVxAf0h11mwDedxntYcIUNseJ/gqCU2d63kCFbAkI1d35QhGqiP3W1aNU7TltI28DBPlSl8m73pZaCClPgYTMyTRpUET5p+K5aTzyxJTyucaYQFxG9VaGVYog+QVgjUPYMSSM6gK8LcAEc5cWGAQEYDGfSiQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(6666004)(2616005)(2906002)(1076003)(36860700001)(40460700003)(508600001)(47076005)(8676002)(83380400001)(86362001)(16526019)(336012)(186003)(426003)(110136005)(26005)(316002)(7696005)(5660300002)(8936002)(70586007)(70206006)(36756003)(4326008)(82310400005)(356005)(81166007)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2022 06:33:41.9668
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 03cb9fd5-65c6-4a4a-5249-08da3ee1ad3d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT027.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB5568
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The current implementation supports only Level trigger with ACTIVE HIGH,
which is overriding level and polarity set by the ACPI table, hence
implement the common utility function to manage irq requests.

Suggested-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
---
Changes in v3:
- Implemented the new routine ccg_request_irq to handle irq requests
  including ACPI based device check.

Changes in v2:
- Implemented the new routine ccg_request_irq to handle irq requests. 

 drivers/usb/typec/ucsi/ucsi_ccg.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
index 6db7c8ddd51c..0707a7156299 100644
--- a/drivers/usb/typec/ucsi/ucsi_ccg.c
+++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
@@ -627,6 +627,16 @@ static irqreturn_t ccg_irq_handler(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
+static int ccg_request_irq(struct ucsi_ccg *uc)
+{
+	unsigned long flags = IRQF_ONESHOT;
+
+	if (!has_acpi_companion(uc->dev))
+		flags |= IRQF_TRIGGER_HIGH;
+
+	return request_threaded_irq(uc->irq, NULL, ccg_irq_handler, flags, dev_name(uc->dev), uc);
+}
+
 static void ccg_pm_workaround_work(struct work_struct *pm_work)
 {
 	ccg_irq_handler(0, container_of(pm_work, struct ucsi_ccg, pm_work));
@@ -1250,9 +1260,7 @@ static int ccg_restart(struct ucsi_ccg *uc)
 		return status;
 	}
 
-	status = request_threaded_irq(uc->irq, NULL, ccg_irq_handler,
-				      IRQF_ONESHOT | IRQF_TRIGGER_HIGH,
-				      dev_name(dev), uc);
+	status = ccg_request_irq(uc);
 	if (status < 0) {
 		dev_err(dev, "request_threaded_irq failed - %d\n", status);
 		return status;
@@ -1331,6 +1339,7 @@ static int ucsi_ccg_probe(struct i2c_client *client,
 
 	uc->dev = dev;
 	uc->client = client;
+	uc->irq = client->irq;
 	mutex_init(&uc->lock);
 	init_completion(&uc->complete);
 	INIT_WORK(&uc->work, ccg_update_firmware);
@@ -1366,16 +1375,12 @@ static int ucsi_ccg_probe(struct i2c_client *client,
 
 	ucsi_set_drvdata(uc->ucsi, uc);
 
-	status = request_threaded_irq(client->irq, NULL, ccg_irq_handler,
-				      IRQF_ONESHOT | IRQF_TRIGGER_HIGH,
-				      dev_name(dev), uc);
+	status = ccg_request_irq(uc);
 	if (status < 0) {
 		dev_err(uc->dev, "request_threaded_irq failed - %d\n", status);
 		goto out_ucsi_destroy;
 	}
 
-	uc->irq = client->irq;
-
 	status = ucsi_register(uc->ucsi);
 	if (status)
 		goto out_free_irq;
-- 
2.25.1

