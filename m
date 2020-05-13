Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E9D21D1357
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2020 14:56:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731644AbgEMM4A (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 13 May 2020 08:56:00 -0400
Received: from mail-eopbgr40042.outbound.protection.outlook.com ([40.107.4.42]:13838
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1733012AbgEMMz7 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 13 May 2020 08:55:59 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E9Q9LnpF9jros6ntd/iMviL3evtGFI32I6Rwfd72vxcofCN1NqXo+ofc1wzO2sDaWY3ucxC/KDnDn+2GnUSgAAy8p0iTqD6lufkAU1swqwFwdydLsyH2WJIIOj1WPwpGwIrW5/dI+l3uxe01YUsZ1RR+D/Rg8sSM+3GCGjpH+07P3+10eG8VEpdIbj1qEZ+YqFTJwZUDe/HTLuR6JcsXCv2K7oCdiphf2h2X3hwl24VfR8WrLTnJB56SjpKSd/rL1VnxxXtU470yDpsOkfcorRYO2nX/ASj6eQj3j92T3Ua2khut+nlmuryDN6vWKXyqeBD9A5APoy8klXAfZE0K4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G8MmFtCMcL6drk6QtZF8rLaRt7svUAP26pd0bjPRFkk=;
 b=Bo3sTj4zyYWKhdSr5Nc0P2UyOnHgb6I7tXmiuFtRBhC6Ibqnz12zPBo6T6Lod90m4x4E4Ae9uXQIJsCk2R3v2/xRb5GomKDjGjR0xxMY6Y/Km7fK8sEiKqfJKDyJXSYEvk2lwaPujyB3NOKyNgN2rBiOncgw6S14sdmAA5WdCDl/41fO32RN13RPuVRBUx8l9+nzDvy4oWtpSSRdE0nbunG4Fc/XwBaKifBf8wN+Piye4Ih47BLYR2QOkYCN8fuTm5YjcunKS7cPw9HQXXWDh+QcpiXMqc5/dmXzlcZZnVxFKF9Fh7d54CLOhGW4cNSsF/6drxsj4KCILgjITIDuZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G8MmFtCMcL6drk6QtZF8rLaRt7svUAP26pd0bjPRFkk=;
 b=T8D093xfFo6T6/eYjyWlRKgqlyof8dQoLF1w7sgf/06oHVtXivL2vvOD5gFO0horRhav0cSXxR739MgdWEUdmO0snN1f4oFOy/dk94Urln17A0zI7NiX3CLedE8MmW18wIHF+mY2UCOUBmRGhfA3m6vfAniS3pmk2qtwCGWfHYM=
Authentication-Results: ti.com; dkim=none (message not signed)
 header.d=none;ti.com; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM7PR04MB6805.eurprd04.prod.outlook.com (2603:10a6:20b:dc::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.26; Wed, 13 May
 2020 12:55:57 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::7c34:7ade:17d0:b792]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::7c34:7ade:17d0:b792%9]) with mapi id 15.20.2979.033; Wed, 13 May 2020
 12:55:57 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     kishon@ti.com, vkoul@kernel.org
Cc:     linux-usb@vger.kernel.org, jun.li@nxp.com, linux-imx@nxp.com,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH v2 1/1] phy: phy-cadence-salvo: add phy .init API
Date:   Wed, 13 May 2020 20:56:05 +0800
Message-Id: <20200513125605.5545-1-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0095.apcprd01.prod.exchangelabs.com
 (2603:1096:3:15::21) To AM7PR04MB7157.eurprd04.prod.outlook.com
 (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.66) by SG2PR01CA0095.apcprd01.prod.exchangelabs.com (2603:1096:3:15::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.20 via Frontend Transport; Wed, 13 May 2020 12:55:55 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.66]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c71ffcae-08e8-4159-32ea-08d7f73cfa79
X-MS-TrafficTypeDiagnostic: AM7PR04MB6805:|AM7PR04MB6805:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR04MB680570CE91A1F7ABD9028D288BBF0@AM7PR04MB6805.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:366;
X-Forefront-PRVS: 0402872DA1
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +dm79StaJbEkxii3Ve0a4YhT9r6bjUw1W+ZAHojzClU3Ru0j+iVOProti4tPe5nq5FW15pbAoNMjv/iUX75Whz1kwIw77HNDAxOF7pkImVfDFrt16FaTSr+S6UAUaoBRgimGyG1VngOIcfizfTv8w8GMEyHde0TbjllElUlvv5nttCQLHitlsX1p1P3Z0XTV8eNgpqSt1Q/tm0c9kKyVSvtsGseCvNGSwNNsM1XbXb7brxnZrmwPNWFOoHLkSC+g6EPTDTKliagJtv3cOmTkNMwbXIFy+cn6bHevercjRZzl/AFP8qIEup/DkaKMYGDI9QgzbsMdSbuECc8NQAri864SyuS635edCXJqmIunmYaf+w7DA3kNtLTzU4MrK5W4gPbenA42VJ1MzbP0myjx9NbHEWvbdoMwXxnTVZ0e3PeOhxqNfNaaY700TOHBSgEweF3xWvTRSUuLzsK7OzEqxdp3+OUqCXQrJC4KlomzkwrLtRHQdUMRL387TPiJ/x26VHpvureskRSLmKQBqmcH4HLzyBlqZrGxBZO95f4S9CH2yNBFVV839By8MQk/8ixx
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(136003)(39860400002)(346002)(376002)(366004)(396003)(33430700001)(6666004)(33440700001)(16526019)(66476007)(6512007)(956004)(8936002)(2906002)(66946007)(1076003)(5660300002)(86362001)(26005)(44832011)(186003)(478600001)(66556008)(2616005)(36756003)(8676002)(4326008)(6486002)(52116002)(6506007)(316002)(142923001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: dj7mcdDpria3p8j7+oDdgN4o+i2ailydhpaafYoGG8pFdJjfoChtPhrjztEJJzSgWIaNhQZWoH8J6Xx1PhJMxCcOi60JLckwmStvAuqLKxI5QyoWhLivxqrWaNTe9e9F6UaN/G6blXxq1TGI+OwncC/BIysilejFunUrYpC0QwhUBRyjRSKtiWabUFo18WYWjQaRJ5j5ZNIXkL/l2B4WCqSjjzpzaSxPf6XeLZ/+7FFa/vrKi0O8xg93/3e/tx1Rj0OjtRXMVGslaEfe5OYrKjUAGMiYfwxhOUtbN+6bLN/P7MdqQcaE5N6FcAUHRkk8V0B/UcE5tMW4Dn2IaA/+rCjG23tJReiLNAN3PvMwjRe+H7B5kOa8F70fQdVLFjjZZ67Tcv23zoZ9F84qQoTyoPJWPtcupzCDU9kb6OIOcO68brGhJpT4uGWoM2BuQ21X670KWg4OA1vUT6JZelAFoSR5m+NXKEUnqbBkCsQByfE=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c71ffcae-08e8-4159-32ea-08d7f73cfa79
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2020 12:55:57.0411
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fkc8JPIvFK1HLMZH+smf+gNtVjz6AxhxjR1PNbu2N4BeScUnWjQP2yN4qAuA/XvjQBCFtn2sufUy1ciiQizM6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6805
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The .init is used for one-time PHY's initialization, and .power_on
is called many times during the device lifecycle.

Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
Changes for v2:
- Apply to linux-phy -next tree
- Change commit log a bit

 drivers/phy/cadence/phy-cadence-salvo.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/cadence/phy-cadence-salvo.c b/drivers/phy/cadence/phy-cadence-salvo.c
index 292e9b4dd41a..1ecbb964cd21 100644
--- a/drivers/phy/cadence/phy-cadence-salvo.c
+++ b/drivers/phy/cadence/phy-cadence-salvo.c
@@ -205,7 +205,7 @@ static struct cdns_reg_pairs cdns_nxp_sequence_pair[] = {
 	{0x0090, TB_ADDR_XCVR_DIAG_LANE_FCM_EN_MGN_TMR},
 };
 
-static int cdns_salvo_phy_power_on(struct phy *phy)
+static int cdns_salvo_phy_init(struct phy *phy)
 {
 	struct cdns_salvo_phy *salvo_phy = phy_get_drvdata(phy);
 	struct cdns_salvo_data *data = salvo_phy->data;
@@ -230,9 +230,18 @@ static int cdns_salvo_phy_power_on(struct phy *phy)
 
 	udelay(10);
 
+	clk_disable_unprepare(salvo_phy->clk);
+
 	return ret;
 }
 
+static int cdns_salvo_phy_power_on(struct phy *phy)
+{
+	struct cdns_salvo_phy *salvo_phy = phy_get_drvdata(phy);
+
+	return clk_prepare_enable(salvo_phy->clk);
+}
+
 static int cdns_salvo_phy_power_off(struct phy *phy)
 {
 	struct cdns_salvo_phy *salvo_phy = phy_get_drvdata(phy);
@@ -243,6 +252,7 @@ static int cdns_salvo_phy_power_off(struct phy *phy)
 }
 
 static struct phy_ops cdns_salvo_phy_ops = {
+	.init		= cdns_salvo_phy_init,
 	.power_on	= cdns_salvo_phy_power_on,
 	.power_off	= cdns_salvo_phy_power_off,
 	.owner		= THIS_MODULE,
-- 
2.17.1

