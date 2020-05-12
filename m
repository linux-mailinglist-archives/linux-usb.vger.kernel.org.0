Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F2CB1CEF4A
	for <lists+linux-usb@lfdr.de>; Tue, 12 May 2020 10:42:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727859AbgELImh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 12 May 2020 04:42:37 -0400
Received: from mail-am6eur05on2041.outbound.protection.outlook.com ([40.107.22.41]:53121
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725776AbgELImg (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 12 May 2020 04:42:36 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e2s8ry83kKv6aZGmhzWhqzbd8h7DkM/ItT5c1GtqnNp16/a0wVsmgJD42lPEcYfNTsbfEtDMIghqXuLlINA8yZwoVeFoX3BZUOyogj46iD5l9ZNH8JoXYm/WNgQqvjq+lYRVQUK3U+WbiCwoHInSSUrSOHuxWx7LZZayDHGvvItJVAMvCE1rR7+tMHw8tGHuul08wJaGjJkVQI5jblF2Ci6nJGK8cz5CKufDvQOtsWdVzNfIAx4UslrSBld2JJr5+8JWP5+frfmHZfF8cu0nFDbzGKj9SMKV43BJOTidl4HOnAu34zsHod3VmBvH3UTsh143/xt3FA0q7a+z6d6jCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KhVSnZfRrWJsHNQbXJYEqtrA/dgpZOqS40RW2Y1TFzQ=;
 b=EwgkvnTAMt9WeBhP1REs7r6xlobhYfbdTcnu0/1FhGD9sXojPcoh3J0dYVYK5ZBSVT5U1NhmxuWT1LJAFtDyfPuELz2U1JPYgPQdFVKnuPM5hBtZxbCpb9Y6CH32eRB9dW2uxDgYNMv8QuYBZyu3Z8greOue+m7ML+ZJ0VbiqbmnSvAB6qk0DO5xnanS0bKdyUsrm+pPtrkd5chRJFkyC7bvhCgw1D3wwScopJn23lsACjELZqn+L8eeTJogRiy18AcSizqhn6s499kS8Nd9cZHJcn1uJmBtO9URvkc9A3X1KyjM5PNuKrE0dEshX5q7c/MXe4mhtK5C4jHrjrtI2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KhVSnZfRrWJsHNQbXJYEqtrA/dgpZOqS40RW2Y1TFzQ=;
 b=q7NYYNt8FHodb5B6IMMNURfkTdEpbF9+BphWLId43Tg99X0CllcXG3JgRbMRUQnWJiTLqdVrXypj4/r54QmcjF8jFU4/Pm5NNI1V76BENmyL4aMAKOZ8t/zaFJbS2KXYsaE3vxk8s4uAHsa+hHztzzjYeTwtBIXshmUBf0Dl+7M=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com (2603:10a6:803:127::18)
 by VE1PR04MB6686.eurprd04.prod.outlook.com (2603:10a6:803:125::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.33; Tue, 12 May
 2020 08:42:33 +0000
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::5086:ae9e:6397:6b03]) by VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::5086:ae9e:6397:6b03%7]) with mapi id 15.20.2979.033; Tue, 12 May 2020
 08:42:33 +0000
From:   Li Jun <jun.li@nxp.com>
To:     balbi@kernel.org
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        peter.chen@nxp.com, linux-imx@nxp.com
Subject: [PATCH] usb: dwc3: allow dual role switch by defautl for new IP w/o OTG
Date:   Tue, 12 May 2020 16:32:59 +0800
Message-Id: <1589272379-30536-1-git-send-email-jun.li@nxp.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-ClientProxiedBy: SG2PR0302CA0022.apcprd03.prod.outlook.com
 (2603:1096:3:2::32) To VE1PR04MB6528.eurprd04.prod.outlook.com
 (2603:10a6:803:127::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR0302CA0022.apcprd03.prod.outlook.com (2603:1096:3:2::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3000.11 via Frontend Transport; Tue, 12 May 2020 08:42:31 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [119.31.174.66]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 5bcf9fbb-b8cc-4365-a100-08d7f65069f8
X-MS-TrafficTypeDiagnostic: VE1PR04MB6686:|VE1PR04MB6686:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VE1PR04MB6686074CA0668DBC1D921AA889BE0@VE1PR04MB6686.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-Forefront-PRVS: 0401647B7F
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rReC3/m2dxYhdRNjpIfOK637GZhlxxmL6DVYRSuF0ws+OjoZxPrqAaxrUGQjBncyvFkJ4v8gOTrmK4a9X3T002k4m+wV4W+SnFtWSz8sBRzSIn4OCx8XyIvMVd9U2JMlQQ4c4+kZDNOSArwLnlNFdqfwcUjjqHFno2hm5tTVhuayPdgbClkFGiZwrk38OG2oP1NfQjfkBJEkzjNecpNp15oAEkHlO/asEDja3CS7dBP8zAKk8EKEUveKMnuLSb+6O6XHXLiewS36Lh1UENreAfw2szL/NGRTtlTU5psnJ9QFZjuhDKgmUY6yYOHZJJDtCSXGOAVFT9cdr/kDisT/9ZcMuflc4sKxL6/4l8GPCPQnlh/j/3iKw9rp+z1ufIgEOwGUsfZhoGsEWXcmt9TzL1g6tB0ALkCBoQiq4P5qbneAsyCkkwdedMt4vuFN43uhGionXTYKfDemdfcft1hi03rZsVB9TjLzAETcCi41sx0ZgjJ6pjDv1efzOc4cdIsgjDYRvzLOIUmxf0uiUHeStpS8iD1MCLrK9+60XO0Vt7wZ8hHfHNYqxEsV71dfTGah
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6528.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(136003)(396003)(376002)(366004)(346002)(39860400002)(33430700001)(33440700001)(6916009)(66556008)(5660300002)(16526019)(186003)(52116002)(26005)(6486002)(8676002)(36756003)(8936002)(6506007)(6512007)(6666004)(66946007)(2906002)(69590400007)(4326008)(86362001)(956004)(66476007)(478600001)(2616005)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: WjFXgWrZG8X7iMxP0tgTSlURDmttC/ROEN13mF+D2rPSNCCANZqgKAR9UO+eu8kt4p8o3TdkERLn04F1gGAbWPxSbMzV4FiONmhQTpMIMeqGp92OhyBGc0xFFjFZPGtCBOSbCCVZDlPdGaNDE8m/DsmtbEc4Uzb2sSu0+E/47fnPT0Xl0j+QtU6UeqhOnbOIa96Ed9chcor6H5zEJyhetCzVX96wk17XFRtvuD3KJ+ZO/vkIqhbdzW87/Zgx6koC9VXpWTS8SE6ByE4d4qR6UarAnb/5Jpmlbev6eyAlNv++xcpGxGCcIzD9+nhTwDo1Kbm7/bMTjsLngCBJXAP4BytKXoccL4A9oGgeO+AD9hnTYDAEpRn020kpOtW6uOKBtaB6nibujgkepja8/rrbVma04fs5y2kFUNaj6zNre/UdFNGDS6gFj64E5buVflv47LgcpeMngbHPiGZ6dgfLnMYmwScN7iPuXerDW6EJUVk=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bcf9fbb-b8cc-4365-a100-08d7f65069f8
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2020 08:42:33.3651
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: whhgGEWw+KsHqOEciM099u/SWyZocuuLEtUowFM/XmynBVa3JAxdtq+RdGPsASpv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6686
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

For new IP version DWC3_REVISION_330A or above, current code only allows
dual role if role-switch is used, those IP w/o OTG only removes OTG
block but dual role should be capable so don't limit dual role, user
may use debugfs or any other way to switch role.

Signed-off-by: Li Jun <jun.li@nxp.com>
---
 drivers/usb/dwc3/core.c | 11 -----------
 drivers/usb/dwc3/drd.c  | 10 +++++++++-
 2 files changed, 9 insertions(+), 12 deletions(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 75ee602..e4e473f 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -78,17 +78,6 @@ static int dwc3_get_dr_mode(struct dwc3 *dwc)
 			mode = USB_DR_MODE_HOST;
 		else if (IS_ENABLED(CONFIG_USB_DWC3_GADGET))
 			mode = USB_DR_MODE_PERIPHERAL;
-
-		/*
-		 * DWC_usb31 and DWC_usb3 v3.30a and higher do not support OTG
-		 * mode. If the controller supports DRD but the dr_mode is not
-		 * specified or set to OTG, then set the mode to peripheral.
-		 */
-		if (mode == USB_DR_MODE_OTG &&
-		    (!IS_ENABLED(CONFIG_USB_ROLE_SWITCH) ||
-		     !device_property_read_bool(dwc->dev, "usb-role-switch")) &&
-		    dwc->revision >= DWC3_REVISION_330A)
-			mode = USB_DR_MODE_PERIPHERAL;
 	}
 
 	if (mode != dwc->dr_mode) {
diff --git a/drivers/usb/dwc3/drd.c b/drivers/usb/dwc3/drd.c
index a24c6c0..4281e96 100644
--- a/drivers/usb/dwc3/drd.c
+++ b/drivers/usb/dwc3/drd.c
@@ -587,7 +587,7 @@ int dwc3_drd_init(struct dwc3 *dwc)
 		}
 
 		dwc3_drd_update(dwc);
-	} else {
+	} else if (!dwc3_is_usb31(dwc) && dwc->revision < DWC3_REVISION_330A) {
 		dwc3_set_prtcap(dwc, DWC3_GCTL_PRTCAP_OTG);
 		dwc->current_dr_role = DWC3_GCTL_PRTCAP_OTG;
 
@@ -615,6 +615,14 @@ int dwc3_drd_init(struct dwc3 *dwc)
 
 		dwc3_otg_init(dwc);
 		dwc3_set_mode(dwc, DWC3_GCTL_PRTCAP_OTG);
+	} else {
+		/*
+		 * DWC_usb3 dwc_usb31, v3.30a and higher do not support
+		 * OTG mode. If the controller supports DRD but the
+		 * dr_mode is not specified or set to OTG, then set the
+		 * default role to be peripheral.
+		 */
+		dwc3_set_mode(dwc, DWC3_GCTL_PRTCAP_DEVICE);
 	}
 
 	return 0;
-- 
2.7.4

