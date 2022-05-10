Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B415520D35
	for <lists+linux-usb@lfdr.de>; Tue, 10 May 2022 07:25:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236716AbiEJF3t (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 10 May 2022 01:29:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236710AbiEJF3r (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 10 May 2022 01:29:47 -0400
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2083.outbound.protection.outlook.com [40.107.243.83])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 744895A594
        for <linux-usb@vger.kernel.org>; Mon,  9 May 2022 22:25:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jjFLtrW2tSKj2gWHls1WZV3QQ8Nk2GpclQHmXiMg/YW8IuiHlK/zW+e0n68sMAUUpQBzOw1q3kbZrji0Q4NWluxLSOzPyVDRrktDyRLR1LJJBmL9NoaVodYRoHDQFxnIyxycjmYL38EFIh1QtNUPDHseGO9SV6GriZqHJdo/TQ6Vu+OYm8wcJ0KiQnBMZv6krUqSaXloL/UYAN7AjTf6AmQxkdufwoy0IKuCdd4K5G8dz2/Zv/VSyc3xOZqMP9WdzIMrdG+CuD8Tc9sWp++AsGAw13OH+xsNVGjcETCGZzj5qYepqJf4lx3/YRnGGIZpAELPTewRu6uDxWOQl9/0Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mbYAJD/8Z43wEqURSoC5ssua5a5Ap+UPDqwevh8yLks=;
 b=X/UzZp0uD5Bw2ezrkJnEP6+09bqLN/m+K3LjUPMjhImnoKJtb2GnUqI/V9VMzMJVYDuBNWD6CbskmVoz5IOHB6iz/OHg1ROo/YBKk/XxALenB6Cee/cZEQfhHKtBsc+CZstv5mA8euj9UEYmzlKAmJ8xchQvik/AcgpWFJ+t7pGYAA9cdq0uI7ltSMbldS5im6rVEt+MR8PMO1UOJ+CU9OtoKt0NjQL5FhR0oBkX+qgEC+fSCnWt6OLKMOSWci2QdQGdkYLbvrHl1Up4eE3t12M2/BuV9lfdCOSJVVsv+DtSUEW9dbRQYkTp75aO8+X1X2lVF4V9qNK/xU4lw/sqLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mbYAJD/8Z43wEqURSoC5ssua5a5Ap+UPDqwevh8yLks=;
 b=yZWsrAIbmK0IqHuDB5NPHRqbjBDZtQ4FeO9OiivBMnbRljJxGYALSv3mI2rGro3jFB4kubCNtsquwQ6Mc3ywOKWf1aVoNimNpkyxShGbPW3EXzBQuOVA5mMcH7iAYomzhHzNwzNfHSBX8Xx3o6HYS6eOlIINCtewr021QhRMu84=
Received: from DM6PR06CA0052.namprd06.prod.outlook.com (2603:10b6:5:54::29) by
 BL0PR12MB4932.namprd12.prod.outlook.com (2603:10b6:208:1c2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.22; Tue, 10 May
 2022 05:25:45 +0000
Received: from DM6NAM11FT046.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:54:cafe::fd) by DM6PR06CA0052.outlook.office365.com
 (2603:10b6:5:54::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.20 via Frontend
 Transport; Tue, 10 May 2022 05:25:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT046.mail.protection.outlook.com (10.13.172.121) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5227.15 via Frontend Transport; Tue, 10 May 2022 05:25:45 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Tue, 10 May
 2022 00:25:43 -0500
From:   Sanket Goswami <Sanket.Goswami@amd.com>
To:     <heikki.krogerus@linux.intel.com>, <gregkh@linuxfoundation.org>,
        <ajayg@nvidia.com>, <linux-usb@vger.kernel.org>
CC:     Sanket Goswami <Sanket.Goswami@amd.com>
Subject: [PATCH 2/2] ucsi_ccg: Do not hardcode interrupt polarity and type
Date:   Tue, 10 May 2022 10:54:37 +0530
Message-ID: <20220510052437.3212186-3-Sanket.Goswami@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 3e810f01-ec9e-4302-64ed-08da324588b6
X-MS-TrafficTypeDiagnostic: BL0PR12MB4932:EE_
X-Microsoft-Antispam-PRVS: <BL0PR12MB4932F9CF5FA9BF890DAFB79F9CC99@BL0PR12MB4932.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mpYeBo2mzfY+tNm8peFEleawg1NPcGubBOWcxkigKUEsOLcU0rzyK98rLH7bOjq3sCYLL/Yg+jh0przWhlEhi6QXhPsFOeHnsWrI6rheGeSuQkxlP+7Qbt9XAR1s02M5jL3n7feCJEA1WV5tiSe4qcLVYirtd3xQwsri/+onwN3246dvtHLTrSiq0rF/xGiQ5suJ8BvVVNHt1d04+N6tCHZFK/9E2BuaxTMi6XcHNCfNP2PhKq6BWRj6onTxeAz6mGfA3O28EFW2Rs9F88P2iHWPe/vERCMxq4zJci4dkbJN/apH7WhQfoMSIhdR2LNm9aoH2DgXIC4u7cpTG6Z+0XQxar2y9RKo+3FTRxYJppGAXBQrZ9k/c+bMElaumi+FwLUSjhqTqiLqLH5o/HHh64uTVTqNuyDC5qPq+AH1eGCAsb5l9d/D3g6vseQta09EhPb1sk2gJj5LIxKGHpqktNw+1VkHlTpzDLshNMbcOfuBXRaJm2J/yQfl/d1Z+cIU375ZqE/jKzr/kkXRpnuAsuNgIvDjU5/10A1sWlf3viyfYP9Vlfop8vhElQgdSpO/c1IQetPrqrurJQidHNGFv7ZJhxhGv42dchsRlEcgwH8FhaTEiJKiqd6PG4y099sof8ZZQ12pjmvqfzYJ53PotgEItE5mMrn5a5CEgv1jdMIllKqgS7wrZ7Obn1cqWbTQdjmiG720TgMp4I37gFCSMg==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(186003)(8676002)(47076005)(2616005)(426003)(336012)(70586007)(83380400001)(70206006)(4326008)(508600001)(1076003)(6666004)(86362001)(26005)(82310400005)(316002)(7696005)(110136005)(16526019)(40460700003)(36860700001)(356005)(81166007)(8936002)(36756003)(2906002)(5660300002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2022 05:25:45.3196
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e810f01-ec9e-4302-64ed-08da324588b6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT046.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4932
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The current implementation supports only Level trigger with ACTIVE HIGH.
Some of the AMD platforms have different PD firmware implementation which
needs different polarity. This patch checks the polarity and type based
on the device properties set and registers the interrupt handler
accordingly.

Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
---
 drivers/usb/typec/ucsi/ucsi_ccg.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
index 7585599bacfd..0db935bd8473 100644
--- a/drivers/usb/typec/ucsi/ucsi_ccg.c
+++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
@@ -20,6 +20,7 @@
 
 #include <asm/unaligned.h>
 #include "ucsi.h"
+#define INTR_POL_TYPE	BIT(0)
 
 enum enum_fw_mode {
 	BOOT,   /* bootloader */
@@ -1324,6 +1325,8 @@ static int ucsi_ccg_probe(struct i2c_client *client,
 	struct device *dev = &client->dev;
 	struct ucsi_ccg *uc;
 	int status;
+	/* Keep the IRQ type and polarity default as Level trigger Active High */
+	int irqtype = IRQF_TRIGGER_HIGH;
 
 	uc = devm_kzalloc(dev, sizeof(*uc), GFP_KERNEL);
 	if (!uc)
@@ -1366,8 +1369,12 @@ static int ucsi_ccg_probe(struct i2c_client *client,
 
 	ucsi_set_drvdata(uc->ucsi, uc);
 
+	status = (uintptr_t)device_get_match_data(dev);
+	if (status & INTR_POL_TYPE)
+		irqtype = IRQF_TRIGGER_FALLING;
+
 	status = request_threaded_irq(client->irq, NULL, ccg_irq_handler,
-				      IRQF_ONESHOT | IRQF_TRIGGER_HIGH,
+				      IRQF_ONESHOT | irqtype,
 				      dev_name(dev), uc);
 	if (status < 0) {
 		dev_err(uc->dev, "request_threaded_irq failed - %d\n", status);
@@ -1419,7 +1426,7 @@ static const struct i2c_device_id ucsi_ccg_device_id[] = {
 MODULE_DEVICE_TABLE(i2c, ucsi_ccg_device_id);
 
 static const struct acpi_device_id amd_i2c_ucsi_match[] = {
-	{"AMDI0042"},
+	{"AMDI0042", INTR_POL_TYPE},
 	{}
 };
 MODULE_DEVICE_TABLE(acpi, amd_i2c_ucsi_match);
-- 
2.25.1

