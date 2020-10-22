Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3941E29568D
	for <lists+linux-usb@lfdr.de>; Thu, 22 Oct 2020 05:02:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2895255AbgJVDCS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Oct 2020 23:02:18 -0400
Received: from mail-eopbgr20052.outbound.protection.outlook.com ([40.107.2.52]:47251
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2895233AbgJVDCR (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 21 Oct 2020 23:02:17 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FphDQG1z9MWGQaz+kVUPTynSQKwgJ106GhKNAffm/mqD//DPTr+y9BVtCMOBv2mlm/8OG+IN6Icjorlp1X8/5VEBG7YGihgkTySJzP78pd9DlnExAH6HlIcHtdHp1OCHOGvHxwKirh2Ms0tEAbP2csBEuLTi33b2O/a14QrIuw3Etm2Np5R0kk3+8zL9CQjzvsksaaUV23B9OfkjSahlaNyay6NK/phObI3lZBNX6Q5wmyRZlQTR/uQH+becHLExLrXkif0REwwMCNpVUhkGKa39b0JPi4CXk1bp+1EMxQIfAuV7Xg+cyKZNaP07KPNVhb8FncmbQ/Hw8CR1Enm5Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yz1hVREAX2h8Cu5cfU+CAzVXBpM1YYLnYIsotluvq5I=;
 b=BUew8/97lygzEXamF8ptfzELlNfDCuVXYGPUvp2pT1QhCqndpKYIbK3HQpKP6BMv1yTkBsyXSnZbBCMMeNKn13gXNGhDFbld6QmAr7jHyptZQ0SREjngPrzOhBHC5pK9hDn2d1IPxCfjJqI3Bf7g9y6XDXjnXYm6OUEOTT4fKr/SOttvBRgndBpBX1khcNYcbdy9z9ovlqmxDUQk41zTaip+aZ8xWoufncOlW7aPDLcBKWF/u0aiIYwYt/fQ98hjzkxMQ5BJvOcWaMj7wbCrPmqcaj3KmmqtCSqrwft90S2NkxtUwE8rh9c5nNUJci6ZEzW516+Idn0qeF+BmAO/8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yz1hVREAX2h8Cu5cfU+CAzVXBpM1YYLnYIsotluvq5I=;
 b=chBfeyXW75krlDPSkpsh/5NIRkhhbayVG8403cz0//eEB+ue/S47CFwIAEfeGMcKtyg62vHZlTcgCa2FO82qUM+cOEdhQjJNu1ISDt6Nx4cmEnpZ1HDTdFCK2VCav5Lpdylwp1dkpLaah92hwuqGFLD4figIJV3N7oEDulJG1a0=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=nxp.com;
Received: from AM8PR04MB7300.eurprd04.prod.outlook.com (2603:10a6:20b:1c7::12)
 by AM0PR0402MB3857.eurprd04.prod.outlook.com (2603:10a6:208:b::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.28; Thu, 22 Oct
 2020 03:02:12 +0000
Received: from AM8PR04MB7300.eurprd04.prod.outlook.com
 ([fe80::b902:6be0:622b:26c2]) by AM8PR04MB7300.eurprd04.prod.outlook.com
 ([fe80::b902:6be0:622b:26c2%4]) with mapi id 15.20.3477.028; Thu, 22 Oct 2020
 03:02:12 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     mathias.nyman@intel.com
Cc:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        linux-imx@nxp.com, jun.li@nxp.com, Peter Chen <peter.chen@nxp.com>,
        Pawel Laszczak <pawell@cadence.com>,
        Roger Quadros <rogerq@ti.com>
Subject: [PATCH 1/2] usb: host: add XHCI_CDNS_HOST flag
Date:   Thu, 22 Oct 2020 11:01:32 +0800
Message-Id: <20201022030133.19528-1-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR06CA0224.apcprd06.prod.outlook.com
 (2603:1096:4:68::32) To AM8PR04MB7300.eurprd04.prod.outlook.com
 (2603:10a6:20b:1c7::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.66) by SG2PR06CA0224.apcprd06.prod.outlook.com (2603:1096:4:68::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend Transport; Thu, 22 Oct 2020 03:02:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b28a3f12-a2d1-4584-1736-08d87636df10
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3857:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR0402MB38574923153428EA6E5C23108B1D0@AM0PR0402MB3857.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0KFhsvmMEtmivX+hndl5JwBA5kF9FkW6cIERYv8JLj8mHSWmIb86F7hhP+boTEMogXIfkx5Mcr6Fr0sb8VVcQxpwUtEBPiOm5qh9bcEYsNVbQEtJntJyARegtF8CfEFCYOydzhiITA2Xw+RNghxGGuSLI2CAsT/9+hvcrbcMwKApdoXykG+oRSSghvLxyCZd0xfhS7cjk+gDiR2+WazmvBT7ylVX83kev9oogR+oD1qY7oXYc3A/qDtLM74vMReu4MWspyaAkSqTldmG4/36MtnkCzTOoo1UdXtFaroH38lDxlcNxd8/eFbblapb8yb/OAi4HTvQKptLwwbb1lARUA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7300.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(396003)(39860400002)(376002)(346002)(8676002)(6666004)(66476007)(5660300002)(6506007)(4326008)(6512007)(8936002)(66946007)(956004)(66556008)(2616005)(52116002)(36756003)(6916009)(54906003)(26005)(44832011)(316002)(478600001)(186003)(86362001)(1076003)(2906002)(16526019)(83380400001)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: ttTu75cwgHaas5R3YmGazfFcNeQGGkl1AJmxyMIrToNAjb7107BY3b7r4d4wrZhxHyx6ZafR3RQR35aeywUetIpILETkDDhUdtBzSu/oQnbFJ8x51yVln0usdLg+11OGo5ssKQ0B8jUMqaN69QPnq+eUCKHxWH0d1VArVUjtBIzgkxsEEB+Fc89UsZsHJ2E4Ow8eQOO13mEtlRpDgWypyjkCQWRH3CGxZkgjbXX4Y6ZXDBbdD5usrv6nMz+0Gk5uX9MX7wuH53lsudFaSqHEsGa0nQU04Muw3wPlLea7Kg7sP0Z4ufd5UIu2vwJ1+q63pyH76JN1BnKCR/Gy8dtPYn5p5TaDWWQ/EpBD1FnNx05bM+AyAODfcNvvT5tYaKUsgEpnnq5NPJOOHDlVfFuDt4pI0nZj7P6/lLG0UurPsb8vjtXl7gi3pDJTH4YpYHzAZy+vK45sPWd+ShTkqH/F41c2psdWdn8LZ2eNsYTp7mEt4kO309dIO5sdPeIk0KXjP0Q3mNCIbJrnBSpcH0QEcmCtn5HYgEfHUUe+nwpWAr4qA5zn77j6GVfHfK8oLia84lKzWWRl0vdgGV+xM+WHIrf/3ajujdYjcVo2N1z7IGjUau/7IVYbIQ/ul10V41eVTTK4yU6k1OlBm1rc1emhAA==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b28a3f12-a2d1-4584-1736-08d87636df10
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7300.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2020 03:02:11.8945
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iO3dkr5TcbrOS63+M8lxtjAJov6WspP/e0TcYKBo4F/I4AzVtMO7/PICC5wd1dgPaI1SmqNQuKqlMW5DOCFwjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0402MB3857
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The Cadence xHCI host has the same issue with Intel's,
it is triggered by reboot stress test.

Cc: Pawel Laszczak <pawell@cadence.com>
Cc: Roger Quadros <rogerq@ti.com>
Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/host/xhci.c | 2 +-
 drivers/usb/host/xhci.h | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 482fe8c5e3b4..fc72a03dc27f 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -193,7 +193,7 @@ int xhci_reset(struct xhci_hcd *xhci)
 	 * Without this delay, the subsequent HC register access,
 	 * may result in a system hang very rarely.
 	 */
-	if (xhci->quirks & XHCI_INTEL_HOST)
+	if (xhci->quirks & (XHCI_INTEL_HOST | XHCI_CDNS_HOST))
 		udelay(1000);
 
 	ret = xhci_handshake(&xhci->op_regs->command,
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 8be88379c0fb..4b7275c73ea5 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1877,6 +1877,7 @@ struct xhci_hcd {
 #define XHCI_SNPS_BROKEN_SUSPEND    BIT_ULL(35)
 #define XHCI_RENESAS_FW_QUIRK	BIT_ULL(36)
 #define XHCI_SKIP_PHY_INIT	BIT_ULL(37)
+#define XHCI_CDNS_HOST		BIT_ULL(38)
 
 	unsigned int		num_active_eps;
 	unsigned int		limit_active_eps;
-- 
2.17.1

