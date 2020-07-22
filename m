Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6976228E5C
	for <lists+linux-usb@lfdr.de>; Wed, 22 Jul 2020 05:03:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731898AbgGVDDs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 21 Jul 2020 23:03:48 -0400
Received: from mail-am6eur05on2063.outbound.protection.outlook.com ([40.107.22.63]:8617
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1731837AbgGVDDq (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 21 Jul 2020 23:03:46 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eEX4LAW5gFvfzNHjJI5bPxgd5fguPIS2GwJOOjFavDrhJwOCYQ+5HU9qGMrXdXl3d6smXrtptGnJzjteExUKMw+m4u1C+2W8d9x3kSdPldbAIii2nJ99kDBrcclH0dZeuI6D/Xw1VyKAXPocJkjV+SDwUPOdhyTWssdXIk+PnWZM84XHH4YYRYsOWg6IpbHq3+E1rKjloZw8XFHAikqzI02m4hcViaZtPDgs7i0n07aK31KZ+9xnhz+YadN5VnuIgpWdFelrQXEqoc6Nzg0yylh8qfiYx49S/2Er8n3AP+joBqG7ZsJnbUH8luyu07CqeRDF7rkVkVxs+Hf6Fy1r5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vdsHTlw/t7Fy/hudlpPkarQoBRcqvklp+P+LCFWyT0k=;
 b=ivi2g/srFIyPgcIlRgs2AeL10W+LM9q08qIpZA62WV7FG+YbhlebBG396AUo5kfWooR1Dy5bcKsKxuGmLldgHd3gR1zGIJlG/zXdkdMcocoe/oZVp6UJMn4O8w4AyvCqKtQWqA8tIRq5YWc2cLgLZRblIvRUXVwEr6SGYazWKz0x1Nr3Hs9eTP5uqJYalQAOaHue5Pnd1P4zpZbNTgu6wMISd+wGD5exIvTaypGjNnJNZbPecSWQ22nlqP0Xk3fRqLTtSnDlPNzuH638VlgULgBeFC9J6b7BsooPAYWC0g8ECG23aXE0cMzx6ovOjXffZv2zkriBd5aio/vcCDFBAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vdsHTlw/t7Fy/hudlpPkarQoBRcqvklp+P+LCFWyT0k=;
 b=esBQ0azBLsL1JtP2heI2uLktmbcoDV6LPaXrwScGBhB3H32pOZJMdVmv8MKBIxsTeOJkK917nMCMaVfoMXLM1YVgYogWGgW2EpdoHfbuyLYHRFfCOp7jz11W2169bArxay662Df4WYO4h7zqbEOpWd8k3BS1pWSRCt18g2OxN3c=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM5PR0402MB2738.eurprd04.prod.outlook.com (2603:10a6:203:97::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.23; Wed, 22 Jul
 2020 03:03:41 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a%3]) with mapi id 15.20.3195.027; Wed, 22 Jul 2020
 03:03:41 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     linux-usb@vger.kernel.org
Cc:     linux-imx@nxp.com, jun.li@nxp.com, Peter Chen <peter.chen@nxp.com>
Subject: [PATCH 2/2] usb: chipidea: imx: get available runtime dr mode for wakeup setting
Date:   Wed, 22 Jul 2020 11:03:17 +0800
Message-Id: <20200722030317.14245-2-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200722030317.14245-1-peter.chen@nxp.com>
References: <20200722030317.14245-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0170.apcprd06.prod.outlook.com
 (2603:1096:1:1e::24) To AM7PR04MB7157.eurprd04.prod.outlook.com
 (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.67) by SG2PR06CA0170.apcprd06.prod.outlook.com (2603:1096:1:1e::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.21 via Frontend Transport; Wed, 22 Jul 2020 03:03:39 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: bf683574-f077-4e71-1d7a-08d82debd695
X-MS-TrafficTypeDiagnostic: AM5PR0402MB2738:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0402MB27384FAD6409EE31C42BA0B68B790@AM5PR0402MB2738.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RZx5i7UO1LWOiDlp4I7wL2UFUXcSFlaq9EmMo/azcj4jq9+7tM58ej4wA/BHcEivhWHJmjk4dKtCxfugbXTB+5T+G87fOk2mrPZiTzWUHgO/gYJYzPopHryJmN66YNG+9shDUpJY4hNDVJKoWPY2/BoOJlIxIQ9OlFq/3t11fQi1IRsYPSQ/QwCCLDa5EVcIl8C54TN4uU3w3mSmOU1YQtapjXU8ukTu6hMqkUowZOXpkpON3AKrAYWTNsCGVBKdWqRLEjF7HhWedYZ5uFgEwdnn04/U7u6OlK6mEigBuWhRnojR2YJ7gpwTs65LlAYFWBGWlvUdYPXZCz6Eqpw0FgZtG23pYM7fF/lnpcan8Z5BfZpnOsh9J270VTGOSie/
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(346002)(366004)(39860400002)(376002)(396003)(136003)(66556008)(6666004)(66946007)(66476007)(6506007)(52116002)(316002)(478600001)(36756003)(5660300002)(1076003)(83380400001)(44832011)(86362001)(186003)(16526019)(2906002)(956004)(2616005)(6486002)(26005)(6512007)(8936002)(4326008)(6916009)(8676002)(131093003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: PpoC2CCUM4XX1xFZ/cSrDfOHDTKlPOfYr6nlxGIsSg5e3dmGnTc+WaYHVRniaHmXqF9DBI1ap2ACkYm8gC7Dm6iCTEfzhtYBUgkv5zgrzPSiv0WZ2D75msOhLCd/Lo2QJRyPqu687dbhO0yDAAa/sHhbPxV5PHVFNY9Oe0q+If/zRg8DdS362jO2kChHla1R5kOZbCpwbg+MFiQfg3xdMwQFd5gzC3W2cHp3b3tjLnC5gOJi9825vjwfMRCx19xQO92KMelsUbv3pU3bWF2RRO6humV8padVq5Y3GcBJBpLtx6m6cpHvFayzNN+iua/kxDj7TbbXP6KbqTzTMR1mukeu6G5+kIcPWhXKLTR5papy+2TX4Tki1EjKYTarjU/AiWWqZ9BeLa94mmxEDCKN0wc1x9rYjfX/yMRON/LDvYT4Tc6VOLUcARpVZkVXHwQU2szKJabyZ1hR3ThlqICNc/5sJjMdLUQjDF6NUF1jk3qT9ksu/r94qbQfA4BKBM1m
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf683574-f077-4e71-1d7a-08d82debd695
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2020 03:03:41.5079
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6skoZxSPEnmb3jtyRfg0Sn3QphE6BEFyfJWNp9FWm2oDJeiT5J+LCyuiCiNfShvzB2kY8zfFDDjSWkLgD0PJUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0402MB2738
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

If runtime dr_mode is not dual-role, it doesn't need to enable ID
wakeup interrupt.
If runtime dr_mode is host, it doesn't need to enable VBUS
wakeup interrupt.
With these changes, the user will not get the unexpected wakeup
for single role use case. For example, the host-only use case at
Micro-AB port, the controller should not be waken up by only
plug in Micro-AB cable or the Micro-B cable with host.

Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/chipidea/ci_hdrc_imx.c | 4 ++++
 drivers/usb/chipidea/ci_hdrc_imx.h | 1 +
 drivers/usb/chipidea/usbmisc_imx.c | 4 ++--
 3 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
index 58de0f3ac0e9..800ed9663172 100644
--- a/drivers/usb/chipidea/ci_hdrc_imx.c
+++ b/drivers/usb/chipidea/ci_hdrc_imx.c
@@ -467,6 +467,10 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
 		if (!IS_ERR(pdata.vbus_extcon.edev) ||
 		    of_property_read_bool(np, "usb-role-switch"))
 			data->usbmisc_data->ext_vbus = 1;
+
+		/* usbmisc needs to know dr mode to choose wakeup setting */
+		data->usbmisc_data->available_role =
+			ci_hdrc_query_available_role(data->ci_pdev);
 	}
 
 	ret = imx_usbmisc_init_post(data->usbmisc_data);
diff --git a/drivers/usb/chipidea/ci_hdrc_imx.h b/drivers/usb/chipidea/ci_hdrc_imx.h
index 367bb0d0cb6b..234d2dcd8a24 100644
--- a/drivers/usb/chipidea/ci_hdrc_imx.h
+++ b/drivers/usb/chipidea/ci_hdrc_imx.h
@@ -27,6 +27,7 @@ struct imx_usbmisc_data {
 	struct usb_phy *usb_phy;
 	int emp_curr_control;
 	int dc_vol_level_adjust;
+	enum usb_dr_mode available_role; /* runtime usb dr mode */
 };
 
 int imx_usbmisc_init(struct imx_usbmisc_data *data);
diff --git a/drivers/usb/chipidea/usbmisc_imx.c b/drivers/usb/chipidea/usbmisc_imx.c
index f9881aed468f..ce2e19d87387 100644
--- a/drivers/usb/chipidea/usbmisc_imx.c
+++ b/drivers/usb/chipidea/usbmisc_imx.c
@@ -373,10 +373,10 @@ static u32 usbmisc_wakeup_setting(struct imx_usbmisc_data *data)
 {
 	u32 wakeup_setting = MX6_USB_OTG_WAKEUP_BITS;
 
-	if (data->ext_id)
+	if (data->ext_id || data->available_role != USB_DR_MODE_OTG)
 		wakeup_setting &= ~MX6_BM_ID_WAKEUP;
 
-	if (data->ext_vbus)
+	if (data->ext_vbus || data->available_role == USB_DR_MODE_HOST)
 		wakeup_setting &= ~MX6_BM_VBUS_WAKEUP;
 
 	return wakeup_setting;
-- 
2.17.1

