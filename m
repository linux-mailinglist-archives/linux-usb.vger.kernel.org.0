Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18EC4376FD9
	for <lists+linux-usb@lfdr.de>; Sat,  8 May 2021 07:50:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229542AbhEHFva (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 8 May 2021 01:51:30 -0400
Received: from mail-eopbgr80073.outbound.protection.outlook.com ([40.107.8.73]:27342
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229481AbhEHFvX (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 8 May 2021 01:51:23 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ktzS9DR7g6wn75JplDdqgmKV8IlJ0G/Pt4p44USUrg18VEgh3ay5A1hFQmZRyhIrJtR9ectS6z3KV5FNGmHM2nOIXawwWgwqf2LcRLEX+xxlWOZbaXdJIaBK1RV+g21PX8000A/UEaR2v3arWPDqwhgYepB974RICthXJWsidR5S+YC3UJHO9gbGd7Rd3sed+WJ93BLfyDPH96O44oJDWW3jcdbAc5gyc5g+3KYa5yBD2bXkNhA4lxmrXzDmhkrlsZRjcfQhTGbCsksSZuoJ31gsKX+tOE+KayJNmquL98ojZ7JAxx83NEL4FaI27fY9d5lMmdvcsqnUYGIcHIp3Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=58rcjgRM0e9M+iPvx0aFYPXSjN8h3AMEN3YjUsgaHFA=;
 b=SO+LryE8CeIzoysJwgXeKEOTDqVxZWcnuHeD4Vrhy7T7DWvju92pfdjzShYnyTjxr4chNZoIPLU8N0IuEVNxlms9lUmTVozb+B+x6vYWWC/i3zP+J1XLSdgRDAqR3KAMrUqwHws28spRUY3rBPegmesXi46i/aLDyFRDhdil6t1B3lBYDt7Gy6nffj0Dl9iTge3e5T/E2hlMkFenaieC2Cn/YIInKJJFNQ7MP79R4enT71ak9y2AVa66AS6zJbZvdGB1eT6rt6FPizY5DcAz+kuTdsOF0yKG5EEeRfZV66lMs3BeGMIjaP6XkVVeaTOMLDNrw/AuzlhgoQhzuDN1DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=58rcjgRM0e9M+iPvx0aFYPXSjN8h3AMEN3YjUsgaHFA=;
 b=aOBHMVXpc3EQHLn9eov9gdGQZKDJLn+zlRS0RD3Uwe0txCNJhmoxNwtNTI8tMsxXzlUX3ZDALLg1XxdMvmfUQcQnWlYC8E77XGFig3tqMIlSATWbzefr4FZRg33iMP2T0ywgAHlMYo0DUg5PuOvMnxWsT+q6HF5Vgrp26s/tfjw=
Authentication-Results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=nxp.com;
Received: from VI1PR04MB5935.eurprd04.prod.outlook.com (2603:10a6:803:e9::17)
 by VI1PR0401MB2557.eurprd04.prod.outlook.com (2603:10a6:800:56::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.29; Sat, 8 May
 2021 05:50:21 +0000
Received: from VI1PR04MB5935.eurprd04.prod.outlook.com
 ([fe80::ddf7:8cd0:3132:7dbe]) by VI1PR04MB5935.eurprd04.prod.outlook.com
 ([fe80::ddf7:8cd0:3132:7dbe%7]) with mapi id 15.20.4108.029; Sat, 8 May 2021
 05:50:21 +0000
From:   Li Jun <jun.li@nxp.com>
To:     gregkh@linuxfoundation.org, stern@rowland.harvard.edu,
        mathias.nyman@intel.com
Cc:     peter.chen@kernel.org, jun.li@nxp.com, jackp@codeaurora.org,
        linux-usb@vger.kernel.org, linux-imx@nxp.com
Subject: [PATCH v4 3/3] usb: core: hcd: use map_urb_for_dma for single step set feature urb
Date:   Sat,  8 May 2021 13:33:59 +0800
Message-Id: <1620452039-11694-3-git-send-email-jun.li@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1620452039-11694-1-git-send-email-jun.li@nxp.com>
References: <1620452039-11694-1-git-send-email-jun.li@nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG3P274CA0009.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::21)
 To VI1PR04MB5935.eurprd04.prod.outlook.com (2603:10a6:803:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG3P274CA0009.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.4108.24 via Frontend Transport; Sat, 8 May 2021 05:50:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6022c9b8-cb6a-4e80-bf40-08d911e52a60
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2557:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0401MB25578FFBF674A3486AD2F03089569@VI1PR0401MB2557.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 11FyAMvnMiCYvfm7MIP7QSJmxwgkU/dFSZUezo5HTc+04eX3DKBT7BboFAP6xvzgZ1cwOmJBEdzmuPUmSpoTiLmd53NhpvK+En/qHsM3JjQTp2A4QNTFlT18GACfwIwe8koKJnm3k8d/Lv8tSwHqQOi3hJTJm2B6JP9qg5kqbtzMBL5ID0fpd5bFP5t60gP4kKEg9hxgDGtxHlkYDh0H7y7+pUcPva4tEyD3t5WtIH8KoUheD51qUrVFfZ70SF44b6pcvv9yipgoYCiMLwEqy9WtoTGW5QsCxPpPKUdAtXinD03f1eR/h7YIUhggzz08ODg+n9ljzC4yACCAVMhRrly4GMywFHM30WNTJsP9grCebEEyYeoKJxG6bP+zOqfzJX3ZU1fApxy5je6oOjoUzWhjpfb1A3qjZcjSu/x0W9i8sByzitt6uNxaZKShrMXmGxNhqzRXN77lpq7hyD/e1DmQSs6kMccjuXysaugB5WUwPWU6kD/jfWBUXE4i7Q8VFVG3aLlhF3xvIuOjBTP9xRJxOwQTIGsdUkX7oMOUJ9VRR05H3YeEe8EinvREFShbHBTYehMb/lMe1A+ORMNBZPRgXvprys8ZKS+y4iah7BoxRWkZsiPB9gkzP6yogwkWmtYDejjKvEwv8QjcIlnAUHnGxKiR7Pzlcpz6mAxMKX5h8t4ENgidgF9fnvwoqH/w
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5935.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(396003)(136003)(346002)(366004)(376002)(2906002)(8936002)(52116002)(6506007)(4326008)(83380400001)(38350700002)(38100700002)(2616005)(66946007)(66476007)(66556008)(6666004)(956004)(8676002)(6512007)(16526019)(5660300002)(316002)(36756003)(478600001)(86362001)(186003)(6486002)(26005)(69590400013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Ou4GnuGWf6+2eUaxhKM0ISQLsAZ9THnTFH9VPz58n+hYpvfgBXQiKop8SYTL?=
 =?us-ascii?Q?u8fGcirRaCZEBHyiMJxs7Y4WuH83uE6QwGgDgk5S80w1DO/PHOKoZBqciwy/?=
 =?us-ascii?Q?2lgvymTGtThWt8AiHa5cRm7IVQHFVsL9fsF1bjLaNu+z4vgjQKyKFUJbIfEj?=
 =?us-ascii?Q?LXb9WgnlVrlGRRcoOm+/jxwXHap+lSg+IOg4eqit8+VFU/S/to31UYTWV3ag?=
 =?us-ascii?Q?WmVOms9jGLwR7qOx9ehhkMsPS4Pf9fcl0Nhl7sDk19QmZyRr7Yf+Mtyof/j+?=
 =?us-ascii?Q?63BkkCaCS+sOLF/fPWVRhlV4dTavQOB5Y1sJ+UHOQop1Qh7QoW5ZuZQSAiMD?=
 =?us-ascii?Q?2K3jOgxIUW6BO6D3fmVPPYbmuqzuR47/Cvu6KsFfLJ9XcTTNZq/BeUu+wQfR?=
 =?us-ascii?Q?tJBqNez4WDUjiWj3vCbU1DltKEzWl0fnCcSFntUHS83UJY4RCTCTMDW3iCas?=
 =?us-ascii?Q?/tupNJNt4OkDT4JG4KRnnUwTq8k7F2OL82PKwiJx4kx2x/Ul56wcqNIu7hq0?=
 =?us-ascii?Q?HYc7vHXFy9VoCDCVQAxTbRSs9xC6zYCpOOoLpUxvbyRZu1nDltLljvDDgB4q?=
 =?us-ascii?Q?G/ZVIgJUE9Po+fXAYrnVSD1dhpkt5Bdkl+sQlw1mUnn0I3Q9LP+iY1X11tuY?=
 =?us-ascii?Q?ieT3bRBgrUMXizx9YsA61QPW8VrCuSUFJneoFLB6H9yOo65F4aIhmTyFnbGE?=
 =?us-ascii?Q?B/hJjsg8i562CDH7KxpGC+4RfOQ9HC+T/o6oQ91YscJvc4Y5Z7BQsOpfO+fJ?=
 =?us-ascii?Q?qIYioAZelfYiVmoS5xzYeYEFh60xERmw7o6u/HlpskL42VdIgRWJgVJxwv9G?=
 =?us-ascii?Q?RmY/rSYeGsD3J3gU0Sw8z2nLMg3zqnt0f7VCpoRba/dI5NMap1YlYT/0HFA6?=
 =?us-ascii?Q?ZmhxazQzej9sSC8vavewmIhhnp7Pu1MUYrwUwcnSkiJRbhEEfnLiLi1hfbMT?=
 =?us-ascii?Q?BwvFa17V8y+RuRj94Vwf4+ct3vUw5Fh9o20BfXJsklrO6/YjkLyY2mviDEJ5?=
 =?us-ascii?Q?LdkYwtpkUC2Qy/kJVprMrWFCsl3854ZWkV1l169r5FR7zaaDH1tTCatPsIDw?=
 =?us-ascii?Q?puAlx+KZTxoC3+PE34N/9EhpomuBbYjKLOeE463pOXkg2xAJvHdz3J3pRpd8?=
 =?us-ascii?Q?iQv1m7pT2x0AURgZvSc0WDo3qmL7RkdIsOvSjaH0aB9sll3/E5rAYZQAXuXm?=
 =?us-ascii?Q?erjhLV9YH7SS7sXh+IDGFMrZWsu8At4iyM3zEv6hND5diNyvAXSuqHahIl1v?=
 =?us-ascii?Q?tCoxnlpoTOv4aP7BNlpUMYf13mzD9/ZjGRx9PB5EDHAcIFFP8/rQqr3Vp1t/?=
 =?us-ascii?Q?HqX4zuzY98eFF4eOi02K1nK8?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6022c9b8-cb6a-4e80-bf40-08d911e52a60
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5935.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2021 05:50:20.9650
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WauZpzpafsRWQvaRSXw3WRDrzHRTGGJFyMb9oaYGGWdSNEyOtNcKb2JJgiEyldmv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2557
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Use map_urb_for_dma() to improve the dma map code for single step
set feature request urb in test mode.

Signed-off-by: Li Jun <jun.li@nxp.com>
---
Change for v4:
- Add missing usb_free_urb() to balance refcount to be 0.

Change for v3:
- Correct the error handling if map_urb_for_dma() fails.

change for v2:
- Add this new patch to use map_urb_for_dma API to
  replace both of dma_map_single() calls, suggested by
  Jack Pham.

 drivers/usb/core/hcd.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
index d7eb9f179ca6..0f8b7c93310e 100644
--- a/drivers/usb/core/hcd.c
+++ b/drivers/usb/core/hcd.c
@@ -2159,16 +2159,12 @@ static struct urb *request_single_step_set_feature_urb(
 	usb_get_urb(urb);
 	atomic_inc(&urb->use_count);
 	atomic_inc(&urb->dev->urbnum);
-	urb->setup_dma = dma_map_single(
-			hcd->self.sysdev,
-			urb->setup_packet,
-			sizeof(struct usb_ctrlrequest),
-			DMA_TO_DEVICE);
-	urb->transfer_dma = dma_map_single(
-			hcd->self.sysdev,
-			urb->transfer_buffer,
-			urb->transfer_buffer_length,
-			DMA_FROM_DEVICE);
+	if (map_urb_for_dma(hcd, urb, GFP_KERNEL)) {
+		usb_put_urb(urb);
+		usb_free_urb(urb);
+		return NULL;
+	}
+
 	urb->context = done;
 	return urb;
 }
-- 
2.25.1

