Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2625E2E7628
	for <lists+linux-usb@lfdr.de>; Wed, 30 Dec 2020 06:19:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726168AbgL3FMp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 30 Dec 2020 00:12:45 -0500
Received: from mail-eopbgr20065.outbound.protection.outlook.com ([40.107.2.65]:29508
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726144AbgL3FMo (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 30 Dec 2020 00:12:44 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XNZztnGfYAGK+BwlU+cIWD8uG4L4Lk7azFMTnl4Ouf4kS1k2VS4VwQ+GCSBtH3mdQGbbeAzR+0HZSg9kjph1O3zFoDoGUyHlkJ8qVExn1nkidGCHbYIBS0Ue5JztyGujJ0Yeoql8y7uvd09AyLbKJtzgXuXCaQpyzUKpUJeBjp8UfTbWcWK6Us7Anktz9U6i7wKxBtLdiWSNAe8/y1nzllV/vLzxUgT69NTWzMTXYbbeLedcNpy90mNbB1sGPTva55HXSkPSDh51XSedHZ+XH7vQHVugb7AuokkF8I3U+h01M6EfSQy692GrPNL0jNuNyqbKivk+RLLVDGYdsUdAsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k55LTBTg22UkXA+DuTEVqvu423dGP4yE1dNXe4nFM3U=;
 b=HQlpHIrqDb/j4FSSwJzUfzxXHhfYC8NGQxMrIYVz9Ls/oe4ZvGYQpd3hbZXVBpwLcG2t6/5yHnZoW28iBMNKh/WuVHwJ5DaFr6/rAundV+a0YbphNkjavG52qgG2lO3piSqjI6FrfHFW+LJ44M1+67KsSpHnHfzd362my1MSrNv/UuIcRG00jQ+VUp2Mevthoj7anTXTeO4g8pjIh5bZBg4dx3YTaZGDbItvmypLtAIXZEnMCZ13Y6TZAsLXdlPURo083T8qj+HdsbCXOqbxVbrSl6PKdBTKtA7o5Pyyc0RLFAA8GXYlS8ITu/GwbtWIzAwXgo45vqXhf5jX3gv4jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k55LTBTg22UkXA+DuTEVqvu423dGP4yE1dNXe4nFM3U=;
 b=IdI586N5CITxbmJx/8D0M5oDsFyWR/oLnUdt7Kw63+xTGodcL/qW18nGc8XkZoCrTATnsOXVrJrUFtdYj+MJTsAylIMeHU39oHFI2RLzMSE8ni3C9l9F8QwNnGzmj5ZgCrPsQRCkgi3F7TRFGL9hQQ22iSa9CrkptzWYLxGl160=
Authentication-Results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=nxp.com;
Received: from DBBPR04MB7979.eurprd04.prod.outlook.com (2603:10a6:10:1ec::9)
 by DBAPR04MB7223.eurprd04.prod.outlook.com (2603:10a6:10:1b0::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.20; Wed, 30 Dec
 2020 05:11:56 +0000
Received: from DBBPR04MB7979.eurprd04.prod.outlook.com
 ([fe80::89de:bd7c:7245:f139]) by DBBPR04MB7979.eurprd04.prod.outlook.com
 ([fe80::89de:bd7c:7245:f139%5]) with mapi id 15.20.3721.019; Wed, 30 Dec 2020
 05:11:56 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     gregkh@linuxfoundation.org, balbi@kernel.org
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH RESEND 1/1] usb: gadget: core: change the comment for usb_gadget_connect
Date:   Wed, 30 Dec 2020 13:11:14 +0800
Message-Id: <20201230051114.21370-1-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR04CA0128.apcprd04.prod.outlook.com
 (2603:1096:3:16::12) To DBBPR04MB7979.eurprd04.prod.outlook.com
 (2603:10a6:10:1ec::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.66) by SG2PR04CA0128.apcprd04.prod.outlook.com (2603:1096:3:16::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.20 via Frontend Transport; Wed, 30 Dec 2020 05:11:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4653d00b-95a1-4ad4-8174-08d8ac816d90
X-MS-TrafficTypeDiagnostic: DBAPR04MB7223:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DBAPR04MB7223B7A9739F88615EEF67A38BD70@DBAPR04MB7223.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Px9uJ7LeAkEb277qDgp7FweaL4zUXcdPzG9z8SHeGYzgjGYboFWQ7zKyMbJXBhxh31vhgT6wuIv8ugROWGVdnniasdHZCW+3qQWNQ7xp6B8MkdXcccJuuLiohxCF0JtFPBjPQlGZcNtDYh5ypEHS28d4WZiIw8Ku3YIjrReUKvNrpGWS2QAvq+CPkTCVFzjiPrjolysdfjsYLlpR7cCOQMjhVti7VOVLqjvlsVBoruIccm44h81sxgsWFl6FaFLw6nPGIi5K03hwhMGfg9/BbaMTxSJhqHMbxQsI+XarDbrZYdeZXpnYs0M/OGXOuTQZTf2BFFa8r+XbWZycxJgtMDvlnZjCDF0dir94W/coDih806NuETEDl2EzQRUk37LtlDQbAFf8brSzOs21FeOnEA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7979.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(396003)(376002)(136003)(39860400002)(52116002)(86362001)(956004)(2616005)(6512007)(83380400001)(6486002)(36756003)(44832011)(316002)(478600001)(6666004)(8936002)(1076003)(2906002)(4326008)(6506007)(26005)(8676002)(186003)(16526019)(66556008)(66946007)(66476007)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?MumkGkMKU+8roxeLWtYBWnS8+fuH/h0b99qsLUkyTG3tPU1bINhzF3L3zNon?=
 =?us-ascii?Q?qxbuqS5UaMAcuRo5mIoNgJ98Za74UgQpRF6wOVbeP31RenMKYJAPzIBWjXft?=
 =?us-ascii?Q?Q6V4GXMUzY65ie4Ggv6JYutEr7NyTV3sEAitjtQ/TOT7axLOvjRiCKtYMphd?=
 =?us-ascii?Q?leHPV1iLLujtGN6dDLOWj9o/rvFAEzMEIGDEtX/JtCJNdNgm3aRmznnHN9D0?=
 =?us-ascii?Q?b4mstS5LdPprkeQgD4y5jUG+K4Cw/dn2hKeYiGfCBYFxM/rxDE7EBv4LwaYI?=
 =?us-ascii?Q?pZkFklcyhaR7vLPBKMSAvU6FsgeOwnSu3VaY6JTXkvg5Jh6D4R3bZdLzGQiy?=
 =?us-ascii?Q?sgwDstXrzVLfFkgSqQ/iLltjfEL96i2BmJutOXAoxOkZRZbKgF9eMmSrKmjD?=
 =?us-ascii?Q?MsD4jLs43BRonOGq0j5lJQmegZwvXkANy8aK88cr08JTMfTwCQc7eSxSku+E?=
 =?us-ascii?Q?hSJ7MEQCKjwa6no+r0T/VIuYQUPJOqV41jSd4ddj0lbOui818FdKPR9YpYoc?=
 =?us-ascii?Q?hjoYX5qNFmygJAJh9YEXNNEWVtc6ABuWayHPbiWov28v/W2x5bHs0kGkg5Qb?=
 =?us-ascii?Q?O2VIinUyDJvj1FXdFTupmsoPs0IdZwtDX/fhzcHESVDJh/FKbmCMvajOCntB?=
 =?us-ascii?Q?oqyRapRuMoCZm7dyA1Uwfd/v3D89SOaCS/pO8/9R6/WIX8vNN+0lRyW28LxT?=
 =?us-ascii?Q?Djb35ppU+mSAcjAsfm7tkjYAtFCFJJomK8xoKvv7g81rsWtJuZDKrb3qDfT5?=
 =?us-ascii?Q?0lqp7mWhfDmtmN/Z9DET6F9RSvpqROfjcU0Ldxv4X1c6eEEJOx0nGGHB5+wE?=
 =?us-ascii?Q?G+5tl5WqmwmwC0ImAS/VKJC4Gfu+/Pp1HNe4ilVCMlpi7Ycp1+hO8PSRKpB0?=
 =?us-ascii?Q?LRHRcrRjVxgOZIVTfAiWKJtbxQqWB28xDlXr47pvKqhFmjzdjVm8tPKBVBn1?=
 =?us-ascii?Q?qbTvrKT9MWHu85K/N6CqWGNVpydFoR7BsYUnhP8cVTjR7wXeB4EB6BAi6hPe?=
 =?us-ascii?Q?DorE?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7979.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2020 05:11:56.0178
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-Network-Message-Id: 4653d00b-95a1-4ad4-8174-08d8ac816d90
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GI3NZVs14T+dUOdWwVxpQThAIc3x18/8YiAXOKdPl50/TiBNuG0cdVej1wky7IrzuyIYCf+Oz9U1LJulBcaxYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7223
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The pullup does not need to be enabled at below situations:
- For platforms which the hardware pullup starts after setting
register even they do not see the VBUS. If the pullup is always
enabled for these platforms, it will consume more power and
break the USB IF compliance tests [1].
- For platforms which need to do BC 1.2 charger detection after
seeing the VBUS. Pullup D+ will break the charger detection
flow.
- For platforms which the system suspend is allowed when the
connection with host is there but the bus is not at suspend.
For these platforms, it is better to disable pullup when
entering the system suspend otherwise the host may confuse
the device behavior after controller is in low power mode.
Disable pullup is considered as a disconnection event from
host side.

[1] USB-IF Full and Low Speed Compliance Test Procedure
F Back-voltage Testing
Section 7.2.1 of the USB specification requires that no device
shall supply (source) current on VBUS at its upstream facing
port at any time. From VBUS on its upstream facing port,
a device may only draw (sink) current. They may not provide power
to the pull-up resistor on D+/D- unless VBUS is present (see
Section 7.1.5).

Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/gadget/udc/core.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/udc/core.c b/drivers/usb/gadget/udc/core.c
index debf54205d22..215ecbe8b692 100644
--- a/drivers/usb/gadget/udc/core.c
+++ b/drivers/usb/gadget/udc/core.c
@@ -659,8 +659,7 @@ EXPORT_SYMBOL_GPL(usb_gadget_vbus_disconnect);
  *
  * Enables the D+ (or potentially D-) pullup.  The host will start
  * enumerating this gadget when the pullup is active and a VBUS session
- * is active (the link is powered).  This pullup is always enabled unless
- * usb_gadget_disconnect() has been used to disable it.
+ * is active (the link is powered).
  *
  * Returns zero on success, else negative errno.
  */
-- 
2.17.1

