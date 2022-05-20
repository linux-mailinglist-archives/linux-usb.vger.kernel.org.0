Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4682852EAC7
	for <lists+linux-usb@lfdr.de>; Fri, 20 May 2022 13:28:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346679AbiETL2i (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 20 May 2022 07:28:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245486AbiETL2g (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 20 May 2022 07:28:36 -0400
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2085.outbound.protection.outlook.com [40.107.243.85])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F8A3E733D
        for <linux-usb@vger.kernel.org>; Fri, 20 May 2022 04:28:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iiOTJkkSKuR185towhoFIljULBoj8FVjh3nLZQTE7YLoq752Wr+A6+C5W7EBd09/sb5wELqcbdMGGpXxDsheHqcVBjY8d9fXqqGUE7T+UCjGUtEkhwMv1FbRUEw+v/CNSIP8VtxrdCZn7ckYZ1A9wou6dPUIXgBjXSomjVEm1zxlzOuNF+RhkcfXqs43bHnkV8YPypmuhJqD8WQ+YAcr7nshEVaW2KZXFoxRfI9CacImePVt3s1hRQHS7Z+3igL7m4KcC0HsGJbG7D7b6JCMeLPwGrY5RtysWRBgmEC5s8q90VL1qxHMAllJyPVBIx7qpvU9q1lTreDA6G7oCwO3IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IGEKDF2gVDNfc1zVk5RGRaEmPNIBhbJDA5PGFa7tM78=;
 b=DMQ2KDjGYR+UATtCLXWCV8RyDdxukJgVz/LesIEABZhaYK37XQYEqbD4YLR29f1O772VAWuZB4EO/ltOqxAmrhNzNV7Qay+4BTJR8Xtluis1O9ftrTjOj9O9JJzsOFCwTNpmTSKGwk1SjOsUHiOqaOsoaMafmKTzYjJAYlbavDxpucj0zU2oECHeHgLl69gEXMPK2DXtxtyyWxwPE5XnJPc0sEQtn9X0mt7yw1+Cxy9D/U6FGbpgLUAFwBIkhwBDOdX+JWuTORzX55tZfQLw2km+YJ1hdc3b1YeSbfAeC5jkmf+MfcgPaNwjPY7VHoEoLFKf1S+xNVM2oZCLR/chRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IGEKDF2gVDNfc1zVk5RGRaEmPNIBhbJDA5PGFa7tM78=;
 b=slObCAtZnE+iFxXtJTLkcRBUS68LKij9xkX10UmJ05mOG0qLGgRB55AIjnK316RFFmksXSq/qXKUy1G18VmMgGvDPseqjWOvXT5dvevlB+PUOK3TcVXSFQQjyj8Qj2nGpdRn/AKzl35xtX7NaoidOTL8st6LGuHlAzowQfFXsYM=
Received: from BN9P223CA0003.NAMP223.PROD.OUTLOOK.COM (2603:10b6:408:10b::8)
 by MN2PR12MB4048.namprd12.prod.outlook.com (2603:10b6:208:1d5::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.13; Fri, 20 May
 2022 11:28:27 +0000
Received: from BN8NAM11FT042.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:10b:cafe::83) by BN9P223CA0003.outlook.office365.com
 (2603:10b6:408:10b::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14 via Frontend
 Transport; Fri, 20 May 2022 11:28:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT042.mail.protection.outlook.com (10.13.177.85) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5273.14 via Frontend Transport; Fri, 20 May 2022 11:28:26 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Fri, 20 May
 2022 06:28:24 -0500
From:   Sanket Goswami <Sanket.Goswami@amd.com>
To:     <heikki.krogerus@linux.intel.com>, <gregkh@linuxfoundation.org>,
        <ajayg@nvidia.com>, <linux-usb@vger.kernel.org>
CC:     Sanket Goswami <Sanket.Goswami@amd.com>
Subject: [PATCH v2 2/2] ucsi_ccg: Do not hardcode interrupt polarity and type
Date:   Fri, 20 May 2022 16:57:04 +0530
Message-ID: <20220520112704.1461022-3-Sanket.Goswami@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: c307b826-1fab-43b0-a376-08da3a53dbb3
X-MS-TrafficTypeDiagnostic: MN2PR12MB4048:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB4048D3F882916CEFDE13EE059CD39@MN2PR12MB4048.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hBdIbObjVoAeFuSS31n/t5Xui7Cmy96lu1iyZQAiVp6xMWP7sXrqXe2HvolKniYMYmH3cs2AvOU+q+tjTMtQx5PZupbzw5aM9DTro6AnfV167T2O+R3AuRQABj/Py46tc5Rzch/8vRA0ONVKwWseCH8jQpkztO5uj/rr5QjqkFlIpVcghcCvQbdacRMhtFv0/jF8MWMgp5xwxvRrVlwRuLaTUPTbo99M24zKpxF0+BeP4EbdygaDic2AVJWZ4Jbvy06H5u4uEK556AcSOnt9PbtlryX5oIdnKUTW8ovWZm+w28P3MHssQdE07awj4eGLsXxxBBulglHhRLpar37wwTexYMsVhVCHX4+H9S98vksZ4pDYySuLce52DGM7HoQtOEfY0vhnb/QDc+/5xAAScxhOdyt+0FEAKhMaA3EscFbR2GzgWxii9HgbvwE7MLFW112YgNRLzeEvR5g/D1BENOaa3IpiQ2Zzvy03ToUbmK2PqqoXFUV5lLGn/zxQWuQu2nmcJwnDh97oWoi9eQ9kUGNayoJ5HQMOUWW5hkfKIdx7YA5tkMkB4IcgWay1nBBheaQspgGP0eW/U2QHjL5OqYn8EdI4ujoOVX5nYxeunzhO8UvzeeLnbmc6L0EPuFcdR+9KJ94ZCwBPtp4S92sWXnSKWLcI0tLdlNHUatJCzShTOWEi9WfZEa4/3DvPju0a0BN3B2jxyMOdVwPG1AU3ng==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(83380400001)(40460700003)(47076005)(36756003)(2906002)(316002)(110136005)(86362001)(2616005)(1076003)(426003)(336012)(186003)(16526019)(36860700001)(5660300002)(4326008)(8676002)(70206006)(70586007)(8936002)(81166007)(356005)(26005)(508600001)(7696005)(6666004)(82310400005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2022 11:28:26.8401
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c307b826-1fab-43b0-a376-08da3a53dbb3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT042.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4048
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
Implement the common utility function to manage irq requests.

Suggested-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
---
Changes in v2:
- Implemented the new routine ccg_request_irq to handle irq requests.

 drivers/usb/typec/ucsi/ucsi_ccg.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
index 7585599bacfd..950efb2363f7 100644
--- a/drivers/usb/typec/ucsi/ucsi_ccg.c
+++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
@@ -1239,6 +1239,12 @@ static int ccg_fw_update(struct ucsi_ccg *uc, enum enum_flash_mode flash_mode)
 	return err;
 }
 
+static int ccg_request_irq(int irq, struct ucsi_ccg *uc)
+{
+	return request_threaded_irq(irq, NULL, ccg_irq_handler,
+				    IRQF_ONESHOT, dev_name(uc->dev), uc);
+}
+
 static int ccg_restart(struct ucsi_ccg *uc)
 {
 	struct device *dev = uc->dev;
@@ -1250,9 +1256,7 @@ static int ccg_restart(struct ucsi_ccg *uc)
 		return status;
 	}
 
-	status = request_threaded_irq(uc->irq, NULL, ccg_irq_handler,
-				      IRQF_ONESHOT | IRQF_TRIGGER_HIGH,
-				      dev_name(dev), uc);
+	status = ccg_request_irq(uc->irq, uc);
 	if (status < 0) {
 		dev_err(dev, "request_threaded_irq failed - %d\n", status);
 		return status;
@@ -1366,9 +1370,7 @@ static int ucsi_ccg_probe(struct i2c_client *client,
 
 	ucsi_set_drvdata(uc->ucsi, uc);
 
-	status = request_threaded_irq(client->irq, NULL, ccg_irq_handler,
-				      IRQF_ONESHOT | IRQF_TRIGGER_HIGH,
-				      dev_name(dev), uc);
+	status = ccg_request_irq(client->irq, uc);
 	if (status < 0) {
 		dev_err(uc->dev, "request_threaded_irq failed - %d\n", status);
 		goto out_ucsi_destroy;
-- 
2.25.1

