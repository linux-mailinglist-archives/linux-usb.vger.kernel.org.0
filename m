Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F8844861AC
	for <lists+linux-usb@lfdr.de>; Thu,  6 Jan 2022 09:54:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237097AbiAFIyl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 6 Jan 2022 03:54:41 -0500
Received: from mail-eopbgr10045.outbound.protection.outlook.com ([40.107.1.45]:1505
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S236914AbiAFIyd (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 6 Jan 2022 03:54:33 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ll1nI5rSRLLRXLC/KmbVC2HbEHWcBB7LtC/sMGER//v1//fxDHtAud4/O15EHtfuGv9yIR/ZHHeAJG/ZKxnCxMOS9SN2fCQCFFKF+658Et57m467Ei9PYZSGpJlG25WzOuc9nimKOsmhwwIMuT/Wzq7oj2RJd5DvoNcrv2LDImHx6yAb5GAhfJ3JZFHOGWaky8n/mS4mRDNRRdSpJhk8HnKsOEUpupMZaKuoM97KU8Q744Noi62oIC56mQvbC7mfj1ZgI+DfLaI+qMZ39dHlQd+lIy3PHIVRCJL+5xcPAwIbrE3fGxVqXk8xfmU8LmH3O/j7MyayprNCXOw12KNEmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MMoKy/XFAp+aEU/lON456YprMR1/k63Y/gY9eqSR+0E=;
 b=fOt/7zTL7Sa8Dt9P2KfM/rwKR2qDFlMu+tBYcemo/5WrBwONwAclaTiPHB89V2xTwN3M/zJcSa6Q8soZgpgXlR2ysqSHFhtnMB8d8vg6i6KOVOcDgmtkweGVC83Qimeed29JhmG3uuDkEK5e4gBma6o2nC5nMvPMl+pH1gPnhchCOPwpJtrKvM7AYoMHPcKWhYOq1cDMndcbqLySVKqsPMNqfre/I8EpgT2T8ijO9e680DSoKYbkzxFF/vohr9+qJWOPLhw8OGisuHgQqT2u5xL8hQg93XPLZa5KdHEeY8c0/8nA7HewbY3YoJzqZnnT961XVJBMxrYHBIs1fQd7oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MMoKy/XFAp+aEU/lON456YprMR1/k63Y/gY9eqSR+0E=;
 b=lSC1uv9+CeBTfkYTb1DToEg/LzSNHIHgSvFZ5x5SYngaByrnZ7jh1XLFiuwG/UPWfWp85nGgYGN+awdoC1TpHesmFfADcEbSE3Gx0N5s3FlxMhzYy55Me3GBrVw91FyOUm74OjPOaWEbwClJt7b/ae4LTz8sKUfPoM6+oUlOXnY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB8PR04MB6843.eurprd04.prod.outlook.com (2603:10a6:10:11b::14)
 by DB7PR04MB4746.eurprd04.prod.outlook.com (2603:10a6:10:15::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9; Thu, 6 Jan
 2022 08:54:30 +0000
Received: from DB8PR04MB6843.eurprd04.prod.outlook.com
 ([fe80::9934:6146:9a64:1e51]) by DB8PR04MB6843.eurprd04.prod.outlook.com
 ([fe80::9934:6146:9a64:1e51%7]) with mapi id 15.20.4867.009; Thu, 6 Jan 2022
 08:54:30 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        jun.li@nxp.com, linux-imx@nxp.com
Subject: [PATCH] usb: typec: tcpci: don't touch CC line which source Vconn
Date:   Thu,  6 Jan 2022 16:53:25 +0800
Message-Id: <20220106085325.1353591-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0048.apcprd02.prod.outlook.com
 (2603:1096:4:196::23) To DB8PR04MB6843.eurprd04.prod.outlook.com
 (2603:10a6:10:11b::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1e860dc1-90e4-41f7-4ad1-08d9d0f226e1
X-MS-TrafficTypeDiagnostic: DB7PR04MB4746:EE_
X-Microsoft-Antispam-PRVS: <DB7PR04MB4746FE62D2D71F4ED2FE30488C4C9@DB7PR04MB4746.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RtLSpQYP9Z2+sxIw9z+kn8AAkQQx6JuorP/itgprZU7ZS3A7YQqo6kl7FeO9XbS1A08doLtdavg5PWcVlRCdi7+3upO5WcmBa2/RcK2HHSp39W2iEjfP0xLNSbiCMKxPmk6jTTg5nNvzkqRWh4kZL+MGfnj++zic52klnesvhdATDSb278JxGDBCHXDs0G0tCS23KHNMkoRzFSdIOCOlxK204jfT3wV0ZCjoi0VWujgLGtUTX339ACPQqt5HGSkRudCt4EBMesVddzvB1d3+Z8ycHrmxuS20gmi8tXKVIr9XX7FX6pHKhc6GU70eFPc4B5UJfaZzLINTdZAm3BNmSlnPlqJQvjv8l/CeMruX8iHFB3nx50Dz7uw8QSLbWVYu7pAleyHVizlQ676sYPDYild/0vvk7gys+o7C2yT3aYfqo8P1BqA63/jqhgTw0xTQhDnyfY6rVok+M8ifK+Lp3/j9gYAo21H0i6Htp0yJwoKxKo1wm0+LuOOu6bKyS0shEttuWLHnKow2CWk2tln5FE5dt/P2+pGnH1ZdSTYfrkDUynp9fwVU8T1REcl6LKKq+tmZEkd06tu9AudBRb/1FHgATyo68mvxyOiqbcjCy7Gj7w4s9pt4UC0bbgRkW6ucE1aJ8AgmI+68QTkjinKUH/a9xrITmwBUMy6trlGXABwrRynksSAuEDhp+LvAZWV32V0yRHunfMlAEXf+YvyObw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6843.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6506007)(4326008)(6512007)(316002)(1076003)(2616005)(52116002)(66556008)(66476007)(66946007)(6486002)(8936002)(86362001)(8676002)(2906002)(5660300002)(83380400001)(38100700002)(38350700002)(36756003)(186003)(6666004)(508600001)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?a8KDeeMLEiA+ID7bctVcda+wve4Bsm5yDKs8lLjxigd/dRK3GxwhPnmNftya?=
 =?us-ascii?Q?Y7Ac2puo+k4iZ47sl8D0GCyWhNXAtyFW0cHMLR68lPe7tptJPDap9WU6nZ68?=
 =?us-ascii?Q?itxM4ERavAbZHae6c15AXT8kNiMvrq0e54pXit1b3TuNgDqJ+SX55HnWGywf?=
 =?us-ascii?Q?W5Bxanq6JPi88p7fNGAon7UNQhXAqmBB9LB9WogKqgAMppVVOpBGbHAKfEx9?=
 =?us-ascii?Q?mLIR5cyga9/882lvmvpuqJQJ7JZ8zYIQ7CobN4WYTEvS5f0yWDB5CHZVMZvK?=
 =?us-ascii?Q?36kjnS4MGIArD+48Jqo1TeFezABPr0EGnY9pX7RxELpY/DLYSpbrWJmkROCT?=
 =?us-ascii?Q?wIP75Z804ybZ4ZtUi3GWp3wPZNNiYsB7nGDkVziS7NW0NYnjy57b9vcmUvfo?=
 =?us-ascii?Q?yJfBxlKl24o8IhRTg4xd1Yx0ZMIQp5sUbpZWiU/T+I2TDtN434+Jk6cA0CmF?=
 =?us-ascii?Q?u3SkYN4H1jVcE+FZbaR9QY2iX1JPh/c2OAaYKWbEXcqiNnBAUTPHaCGKkTAf?=
 =?us-ascii?Q?LwHG6MF0hJpYi+8RW2tWVKlrlTWjedU5YX7S9fTjqooUYolN6bxpBxm/WpE9?=
 =?us-ascii?Q?fBMumVOJLwT1M2xu+scvZErzA3CExnHOhuv2YQrrYmkJCM07eUxhyedwAgGu?=
 =?us-ascii?Q?dZbEYda3ewi99rwfieWqx0XXdG84FNxqfovEhxMwuyaqw29PTeNYPNsufaaQ?=
 =?us-ascii?Q?g9J5V1zMHI1kNpw7JYsgPPvhGuxiSl84ZasxJpCwPlOHuQHv1/NemxylF4JB?=
 =?us-ascii?Q?PejYx/MsIEa4Hpn2d2jUHJFi8LFWksN+IFHUENTzkLfd+rcKfgguv3xqdEXG?=
 =?us-ascii?Q?+xoIH69IYh6b9E9fE/OHyTJXL8RivfWoal5kCHfZbMe7IWvIhr/+aMb0bUQH?=
 =?us-ascii?Q?fsODcc2fFj81UHWRM4A+5w1N9HuwKXNoi0qChzc6gXklPpfoucZLBq38pHzd?=
 =?us-ascii?Q?z39sQ0NjjxYQ2uBJptZL2TrceiyeRkSJFFKW713wiPZX/CNm2weSGOR8d4Z2?=
 =?us-ascii?Q?OzSiXaqFSRqNELoITXV2WNIscmjNNJlDYYQRzXtDPdbH27QnFJVGzd53veMQ?=
 =?us-ascii?Q?cO4ogE23/pszVd3DDcToHOq0N5Fwn68ZlrXFuvznG2XE7oAbesyN9cToFeZM?=
 =?us-ascii?Q?uP1YNA8QJZZ534TQK7NQw7SmsiDMvTrvjIIb0zl/fy2CtxfD0sIzMiJXScXb?=
 =?us-ascii?Q?xMp/PU1ROVU87Op20VDVmaFCRwE/cvx3Dkj5nCEMyjpBZjdTHmNdrFOn94IF?=
 =?us-ascii?Q?9et4kGkPcQK4FZBoIFOwStG0YvsGtZQ3PvCQd0/B/QLeuOXHvUv9VRjwXBOF?=
 =?us-ascii?Q?wMCq7emRFvDBSu98CYfJIvJOm0WWCu/s1vQZd1+xzgHVsnnp/43D4+dQnWfF?=
 =?us-ascii?Q?FKKpGt5wjmYUpC2UHQFVTNu6NVnFPNX0KxmcP18a7JPO5ZSH0H24oUXM1xJt?=
 =?us-ascii?Q?cjov0fBY3thcnjKM9SciP4xsYYIqPHIC2L87BMOxm3rZG4hlS2oYfDCGCkPz?=
 =?us-ascii?Q?0QfgdPfvMK+KYADD0fSzyewqSAg6AVEieouzAe0NVwMV8uMSN6S3bONy65hD?=
 =?us-ascii?Q?eoL0T3ttTkgodfkTVXk68biTjKCuUL8OBboGBpbwTYb76wUlYY3gD4pquUOU?=
 =?us-ascii?Q?TxFFAtQn2YjWk7SMl8qJprg=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e860dc1-90e4-41f7-4ad1-08d9d0f226e1
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6843.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2022 08:54:30.5564
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xGy/u8aVR3JNIpMgNLXCzVHAmg3GTRrGczJsIlA3xtRYwf/R9y1y2V2uS7aOxiBSdPQ1vt+DV4aDKiZIjemWZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4746
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

With the AMS and Collision Avoidance, tcpm often needs to change the CC's
termination. When one CC line is souring Vconn, if we still change its
termination, the voltage of the another CC line is likely to be fluctuant
and unstable.

Therefore, we should verify whether a CC line is soucing Vconn before
changing its termination. And only changing the termination that is
not a Vconn line. This can be done by reading the VCONN Present bit of
POWER_ STATUS register. To determinate the polarity, we can read the
Plug Orientation bit of TCPC_CONTROL register. Since only if Plug
Orientation is set, Vconn can be sourced.

Fixes: 0908c5aca31e ("usb: typec: tcpm: AMS and Collision Avoidance")
cc: <stable@vger.kernel.org>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/usb/typec/tcpm/tcpci.c | 27 +++++++++++++++++++++++++++
 drivers/usb/typec/tcpm/tcpci.h |  1 +
 2 files changed, 28 insertions(+)

diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
index 35a1307349a2..0bf4cbfaa21c 100644
--- a/drivers/usb/typec/tcpm/tcpci.c
+++ b/drivers/usb/typec/tcpm/tcpci.c
@@ -75,9 +75,26 @@ static int tcpci_write16(struct tcpci *tcpci, unsigned int reg, u16 val)
 static int tcpci_set_cc(struct tcpc_dev *tcpc, enum typec_cc_status cc)
 {
 	struct tcpci *tcpci = tcpc_to_tcpci(tcpc);
+	bool vconn_pres = false;
+	enum typec_cc_polarity polarity = TYPEC_POLARITY_CC1;
 	unsigned int reg;
 	int ret;
 
+	ret = regmap_read(tcpci->regmap, TCPC_POWER_STATUS, &reg);
+	if (ret < 0)
+		return ret;
+
+	if (reg & TCPC_POWER_STATUS_VCONN_PRES) {
+		vconn_pres = true;
+
+		ret = regmap_read(tcpci->regmap, TCPC_TCPC_CTRL, &reg);
+		if (ret < 0)
+			return ret;
+
+		if (reg & TCPC_TCPC_CTRL_ORIENTATION)
+			polarity = TYPEC_POLARITY_CC2;
+	}
+
 	switch (cc) {
 	case TYPEC_CC_RA:
 		reg = (TCPC_ROLE_CTRL_CC_RA << TCPC_ROLE_CTRL_CC1_SHIFT) |
@@ -112,6 +129,16 @@ static int tcpci_set_cc(struct tcpc_dev *tcpc, enum typec_cc_status cc)
 		break;
 	}
 
+	if (vconn_pres) {
+		if (polarity == TYPEC_POLARITY_CC2) {
+			reg &= ~(TCPC_ROLE_CTRL_CC1_MASK << TCPC_ROLE_CTRL_CC1_SHIFT);
+			reg |= (TCPC_ROLE_CTRL_CC_OPEN << TCPC_ROLE_CTRL_CC1_SHIFT);
+		} else {
+			reg &= ~(TCPC_ROLE_CTRL_CC2_MASK << TCPC_ROLE_CTRL_CC2_SHIFT);
+			reg |= (TCPC_ROLE_CTRL_CC_OPEN << TCPC_ROLE_CTRL_CC2_SHIFT);
+		}
+	}
+
 	ret = regmap_write(tcpci->regmap, TCPC_ROLE_CTRL, reg);
 	if (ret < 0)
 		return ret;
diff --git a/drivers/usb/typec/tcpm/tcpci.h b/drivers/usb/typec/tcpm/tcpci.h
index 2be7a77d400e..b2edd45f13c6 100644
--- a/drivers/usb/typec/tcpm/tcpci.h
+++ b/drivers/usb/typec/tcpm/tcpci.h
@@ -98,6 +98,7 @@
 #define TCPC_POWER_STATUS_SOURCING_VBUS	BIT(4)
 #define TCPC_POWER_STATUS_VBUS_DET	BIT(3)
 #define TCPC_POWER_STATUS_VBUS_PRES	BIT(2)
+#define TCPC_POWER_STATUS_VCONN_PRES	BIT(1)
 #define TCPC_POWER_STATUS_SINKING_VBUS	BIT(0)
 
 #define TCPC_FAULT_STATUS		0x1f
-- 
2.25.1

