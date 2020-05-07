Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1B1E1C817E
	for <lists+linux-usb@lfdr.de>; Thu,  7 May 2020 07:21:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725841AbgEGFVR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 7 May 2020 01:21:17 -0400
Received: from mail-eopbgr20086.outbound.protection.outlook.com ([40.107.2.86]:24066
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725819AbgEGFVR (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 7 May 2020 01:21:17 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jid1/gR1jFNyGWOLVrcheQc8BZiMBdAtSCYm8lVyQYjFD2dCD+8ESvLiodF1QUzLkWYhMWaB9gJHeUhnjluYgIzDM2gi6m6KaMeZbE5/A31Bef8cA4QP7iV2LIC3mJoy1VFLwmdnFZOu3cd4aDa/OksOAx9hXU0kcZOAERJG/rlJLDm4oCZ6iPPUFm/MtqSZADuqQ3TMjtNgVgDgrJTMPDRSH1SSA9p7ogprgcagvM0xeUIX6xvtaI0945U1M+cCjaQOY2Bg+p5SCO1P4H39X39fIIPezxyqcrc0x5eQyhpY7fFFeZnuobug2UGNr9dLLYjU2J4EqMUUricg8ZnHPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fdd3/ek2A/RYKD9wYqjq+8lvTM77ydXS4BbD7+bUV0s=;
 b=brEnK9113fu21lFUZWb0NkExx6KY3sFkkY6XTE5PO8BfJhPUJUlQIdtUk5DTITWMSsN2WJtPBWblpI+YS41PJdOhm2XTz/YTPVZe5k5Y/u/Sb3z6oJqOiTwaydyZkETHiuGsPz29iniWnRICK0Og7L3CSNTTeY5hJQ1EDH+GYvTMickrIS0dzBhaSYvBTupuTytw45XFFJErIEz9iGELbC/nAYBb1/qSXXDEcSm1Lu37EhvjyycKsSzaOnG/aglIluVCFNf9ltix20Kt9Y03EPPpHzO0/P0en89tzRt2/Faa/xnsIpSRF4aZrXo7IVFrVVeky9ncutDxGzkvWdhL1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fdd3/ek2A/RYKD9wYqjq+8lvTM77ydXS4BbD7+bUV0s=;
 b=CR9mF3ibh6sGOiixMs4k3km+03Wp/wo6X8YikuYqpjDRg8txwX77VW3p04HQa8DKyYWpZwmtEDxFULghd9xmgNnEJauA0zhoBOnruaMkHpMVSFOAJ96zbdjcZ7RCN2QoBnWmAAH7A8CdR7lZPmaidzlQJpsW3hS1+eCNs3sZph0=
Authentication-Results: ti.com; dkim=none (message not signed)
 header.d=none;ti.com; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM7PR04MB6951.eurprd04.prod.outlook.com (2603:10a6:20b:10f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.27; Thu, 7 May
 2020 05:21:13 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::7c34:7ade:17d0:b792]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::7c34:7ade:17d0:b792%9]) with mapi id 15.20.2979.028; Thu, 7 May 2020
 05:21:13 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     kishon@ti.com, vkoul@kernel.org
Cc:     linux-usb@vger.kernel.org, jun.li@nxp.com, linux-imx@nxp.com,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH 1/1] phy: phy-cadence-salvo: add phy .init API
Date:   Thu,  7 May 2020 13:21:20 +0800
Message-Id: <20200507052120.27497-1-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SG2PR0302CA0018.apcprd03.prod.outlook.com
 (2603:1096:3:2::28) To AM7PR04MB7157.eurprd04.prod.outlook.com
 (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.66) by SG2PR0302CA0018.apcprd03.prod.outlook.com (2603:1096:3:2::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.16 via Frontend Transport; Thu, 7 May 2020 05:21:10 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.66]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 319326a0-9895-4f0b-19da-08d7f2467573
X-MS-TrafficTypeDiagnostic: AM7PR04MB6951:|AM7PR04MB6951:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR04MB6951E5EEDF1E07AD48971C178BA50@AM7PR04MB6951.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:741;
X-Forefront-PRVS: 03965EFC76
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /u0GqdxE2ghI6jxpRUN/uGQfduN+npU6csQTYDveeWQltEL1T7Qekgzmk0PIC8IdMbdc5boyjR30smYr2qUXvUE20YND6D4ABhzUHNPUFApiN/LsPrY1nZfHIgjCBXLxF1tpaUQHIXrCmsv9onj57A5BV55ATFD0aqm/3fmPJZmC+XuLsZA/wW7I8oMbsDXoyeYKjsmPjs1EPclnq9U3VFMWrxFhTwk+Nm3+mt1RHrOj5BNEx1gl3EHzCN/jqyq3qGrzZW3hU2Cu8Lrmk7aaIcE1QwgyiHEe0zU/taB+dU7m+qhl9qQoPQZCGIhe1Fx7ehZ4pehf0VXlNszAUcbCIhQ4nQWtIsS1hSO16JAtKRM/Pp8IKxFm1Tp3EYfCKZW10JFpqyOo8iHGiGIVA4ORsEy36+3dbMK5A/Vc/WeTY6gST6cG1VzD6NwK5hN1/fRV/M9RjDRQcRlaVMK6LVr2Rxf4MDwcCy1DFfeHZwS2YOywCe5NT/sGBltKQeFAMR6Uaup1IwdtWaF8Ov+VhfrEogPhttRZqGYBsOPGIzmJnRyCi+4IGQDx40HOOeSMjxs5
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(346002)(376002)(366004)(136003)(396003)(33430700001)(6666004)(5660300002)(8936002)(2906002)(8676002)(316002)(4326008)(6486002)(6506007)(26005)(36756003)(52116002)(186003)(16526019)(6512007)(478600001)(33440700001)(86362001)(44832011)(2616005)(66476007)(956004)(1076003)(66946007)(66556008)(83300400001)(83280400001)(83320400001)(83290400001)(83310400001)(142923001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: T3ChIylbGtGXgZetUmU36b+UdN3uv8FexnU4tky2EMCPm61MWavV4Pc2IyJNE3acV4t8Daj/+8vdiFor8flBpQ4cpsIUeK9ayb+GxTG3Jwmno/ENTp6Q5H3ndtyO1QTc4VID62Z5BNESxb+QIVcBsnD7cDo2djudadtzQnT8PbilfyLdlmBoqW+H7tsb4eSbg6J3yVBVsu5FYJZY+FmOwyTGoWGuDR7V/U36eic7ZCB7Xi2nx/bkGJcKwh5OCdJaWzO/i912BN6od4NdqOcwXZnQNHnSvUV9qEppuw7aMaVw+WCQlAUhj96Y6urZF0K1tNMkuhQkBcVJcotfLVTrdmZ/L4zt07xOYAdF8E/jb2fKlzconUS5tJ3+JxxNkA2xTSuX0ErH9u5gG2wJtDnWCuRRJN0AU6/1Q5g3DKVorezaHCBMI4xSZD8k6kIbum+QaLzodNOcfhhhemMhIaIS8Iy1phrXUZe8160rDQX+DE4eUqgWJLayDs2JIG0+AQcPNj1DLrIhv6sRx81J4JOYu7jPoTZ+zN/ia6b7zSRTWN2NaY5XM4SUeVGvHddCRe6sXyFxF2ZpMKfmi8KdoTbu82lUo0aYuaCkh2enEkn30sx7D1RTHS3VKNZlTQMH6TeA0DIHDvsjWZNOKxo4Ew0yaCEYPAse405L3tKTtwLezU92d/GDgIA8dFN5YEaYzUsP/AcZ471P1fvEBamqYeubapIlmZ6k13Ie34eQVec02m0s9kX/pkfgAMlmZOax3xcQQN9D22YkeneSLoeZjo8twAaDtnNheu0ifmCKN5zGOjU=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 319326a0-9895-4f0b-19da-08d7f2467573
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2020 05:21:13.0843
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mtb7oUaivoPm0S6FY2WT11XsNPAr7Ovz8pchcpSJQWAzGW4EzQbjiF5N2XbgFcFf/aF+UwP6KrDl0+52DzU9aw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6951
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

.init is used for PHY's initialization, and .power_on/power_off are only
used for clock on and off.

Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/phy/cadence/phy-cadence-salvo.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/cadence/phy-cadence-salvo.c b/drivers/phy/cadence/phy-cadence-salvo.c
index fa666527356d..c2b6ddfe02e0 100644
--- a/drivers/phy/cadence/phy-cadence-salvo.c
+++ b/drivers/phy/cadence/phy-cadence-salvo.c
@@ -206,7 +206,7 @@ static struct cdns_reg_pairs cdns_nxp_sequence_pair[] = {
 };
 
 
-static int cdns_salvo_phy_power_on(struct phy *phy)
+static int cdns_salvo_phy_init(struct phy *phy)
 {
 	struct cdns_salvo_phy *salvo_phy = phy_get_drvdata(phy);
 	struct cdns_salvo_data *data = salvo_phy->data;
@@ -231,9 +231,18 @@ static int cdns_salvo_phy_power_on(struct phy *phy)
 
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
@@ -244,6 +253,7 @@ static int cdns_salvo_phy_power_off(struct phy *phy)
 }
 
 static struct phy_ops cdns_salvo_phy_ops = {
+	.init		= cdns_salvo_phy_init,
 	.power_on	= cdns_salvo_phy_power_on,
 	.power_off	= cdns_salvo_phy_power_off,
 	.owner		= THIS_MODULE,
-- 
2.17.1

