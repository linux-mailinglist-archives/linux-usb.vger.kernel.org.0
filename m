Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A0EA3DEDED
	for <lists+linux-usb@lfdr.de>; Tue,  3 Aug 2021 14:35:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235948AbhHCMfh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 3 Aug 2021 08:35:37 -0400
Received: from mail-bn7nam10on2067.outbound.protection.outlook.com ([40.107.92.67]:60032
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235945AbhHCMfg (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 3 Aug 2021 08:35:36 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MdJyVE3CKsN0S54/TNyDBe7HFmIhg3OGMK9wjCvWoFv3hS02mmlr3cDV5vjeDEj6BXjzyYkvQ5KAf3UabWgzOYqUEWkYYJn53Hlk6wFSeekJiXQyJrm3pJiYRcHCnLpxxKRGvcQcYZDvJpE1eagVvUAzZAKZO46ssyxB5LdxQbTvaNZcM7gpZWpC5wSS4JInQrVrMHId/vs1FdoI8KnHIznChwijBm1RnDc601bdm2EljzYf3rsGeWPHcSf5+zIA+P7tlg/b7zOlgs9CuPX/2fxYrVupC7Y8ZMCbJGCpuLurjbuM6+pVqYy9ke7yh4W8JRVIR5lfIgD/xfVJ7oLksA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f9QxL7gyYzriVMjl+6sM26vb+rwoeFN1l0QdpY2bIjM=;
 b=DRShURCOKjhzGpR79qLfptDAU+O48WqzvlpWVEW38/zbfcTrNMidrNgA17hhUPdQVkjWzo7t2us8vQfHPPL0dD3mEVOl9kmalGJEwyMywxbfRCRZRfPjPoicHj5WWhJi0XK8k2mOAG4xYpJDVBfIdYYIIA0rEgezlOeepedq5Gu490W/jIX6USVI5sBvAKbKBdC7fRTuWXuCzu7BH4gRI3hUZ4qR2JBOWVUV/WwARQ8r3dGSQZn/fr2+1Tec61Xf9LswusRG6zhsSYrx3L3wu8coy1qNkCDDR9Zy+cUNnp6LR0aCRlm73A7/gyaGNmoUKF+jjaGL+uNwtARMlcIKRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f9QxL7gyYzriVMjl+6sM26vb+rwoeFN1l0QdpY2bIjM=;
 b=S5TfNmSekq4IpGm4DU+Y5wZUWJBy7E2cE7EmlrT8HAqHeBHpY/OIgZ5qtcg+9YCyQlI9kAXAswHyzCyYmFsVWNEvcO83FdXev7d4zjBvxEcw4VzijkiPZRew+MKWLdyEAeTMTgmfuy0V4cDXKc4WaylDsD/QRaWW/MXHld74m1Y=
Received: from BN6PR14CA0029.namprd14.prod.outlook.com (2603:10b6:404:13f::15)
 by BN6PR12MB1442.namprd12.prod.outlook.com (2603:10b6:405:f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.25; Tue, 3 Aug
 2021 12:35:24 +0000
Received: from BN8NAM11FT043.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:13f:cafe::58) by BN6PR14CA0029.outlook.office365.com
 (2603:10b6:404:13f::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15 via Frontend
 Transport; Tue, 3 Aug 2021 12:35:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT043.mail.protection.outlook.com (10.13.177.218) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4373.18 via Frontend Transport; Tue, 3 Aug 2021 12:35:23 +0000
Received: from sanjuamdntb2.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Tue, 3 Aug
 2021 07:35:21 -0500
From:   Sanjay R Mehta <Sanju.Mehta@amd.com>
To:     <mika.westerberg@linux.intel.com>, <andreas.noever@gmail.com>,
        <michael.jamet@intel.com>, <YehezkelShB@gmail.com>
CC:     <Basavaraj.Natikar@amd.com>, <linux-usb@vger.kernel.org>,
        Sanjay R Mehta <sanju.mehta@amd.com>
Subject: [PATCH v2 3/4] thunderbolt: Skip port init for control adapter(0)
Date:   Tue, 3 Aug 2021 07:34:55 -0500
Message-ID: <1627994096-99972-4-git-send-email-Sanju.Mehta@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1627994096-99972-1-git-send-email-Sanju.Mehta@amd.com>
References: <1627994096-99972-1-git-send-email-Sanju.Mehta@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 04ad7e8b-004f-47d8-f1a3-08d9567b2a4a
X-MS-TrafficTypeDiagnostic: BN6PR12MB1442:
X-Microsoft-Antispam-PRVS: <BN6PR12MB14427D53423CB1C3CD2A0AADE5F09@BN6PR12MB1442.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2887;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pWxZ2mbeQqQ+IX6SbVWbvio7LkB9VSQQWRUB4nvnJVn91n5Av9vAqICLcS+a+R66h8iXtGPfz0QYV5wIoDrzAbyKJrNwilgLtVtLyLV4WdSf85laQIFoEUHIShLAEEdq5QKCM8k6yd6rBfhQ7NfI429oXzB9jKTv0k6Walucw8VCO9rku0ZJIZ3YDMJyfjvciArU0jYzE28e//r0imjXEMc7TaZDjzxNtxf3Xu3Tl3xL5q9jsRTVPdGrDsXjlwmBqKDU4lXfXncXWqT/yDtq1yt4FFIBnq8Jwym5S854P6zuwNrGVbNu898UxmzP8BmvTSSwkHiczGO9AqOj1q1mC10yVMRLI063YjzUVu14kSiCEjm1z9FR5S4XvGTGv7alSllz73MfI5Rj+/JOgj0b4UBk4EUuBF14++Jge1osbaFiuqme63pXJ4tTReyJM39aLdNyiX0lh0prHDUQPoq4RLH/lOLv3hS+zlwb8/Yw84Q0Y7FToiBFOuIpKJ+JjlQ/nZFmMhWRD0gOKvWYD6AnRB9aDoQZVz3v184nDsTYLMs2uawIVFIW0r+DqAgKmRlZi5QPT7RSrhBvPyBLQQYrnYgiT84doChWboLoKH2OEzbg8AHQQNxgTghQ5CzU4Ir8n20dKRZHh99r0ZGyFKfqZJanAVlbsaPiSYyxpUjQJ+hfNHuxYI7ZLvQHkYEg+aL+P3yOFh/4auFDHLjsTBhc93bcxOsPAUuFM89RgHgSQhI=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(39860400002)(396003)(376002)(136003)(346002)(36840700001)(46966006)(336012)(86362001)(36756003)(4744005)(70206006)(70586007)(478600001)(356005)(47076005)(6666004)(82310400003)(4326008)(83380400001)(5660300002)(8676002)(82740400003)(7696005)(36860700001)(2906002)(81166007)(16526019)(54906003)(316002)(186003)(426003)(8936002)(26005)(110136005)(2616005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2021 12:35:23.9716
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 04ad7e8b-004f-47d8-f1a3-08d9567b2a4a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT043.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1442
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Sanjay R Mehta <sanju.mehta@amd.com>

Adapter (0) is control adapter and as per USB4 spec in "Section 1.8",
Control Adapters do not have an Adapter Configuration Space".

Hence skip port initialization for adapter (0).

Fixes: e6b245ccd524 ("thunderbolt: Add support for host and device NVM firmware upgrade")
Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Signed-off-by: Sanjay R Mehta <sanju.mehta@amd.com>
---
 drivers/thunderbolt/switch.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index 83b1ef3..6447876 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -2740,7 +2740,7 @@ int tb_switch_add(struct tb_switch *sw)
 			return ret;
 		}
 
-		for (i = 0; i <= sw->config.max_port_number; i++) {
+		for (i = 1; i <= sw->config.max_port_number; i++) {
 			if (sw->ports[i].disabled) {
 				tb_port_dbg(&sw->ports[i], "disabled by eeprom\n");
 				continue;
-- 
2.7.4

