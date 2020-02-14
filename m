Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0488715D29A
	for <lists+linux-usb@lfdr.de>; Fri, 14 Feb 2020 08:15:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728773AbgBNHPd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 14 Feb 2020 02:15:33 -0500
Received: from mail-eopbgr140087.outbound.protection.outlook.com ([40.107.14.87]:21077
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726181AbgBNHPc (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 14 Feb 2020 02:15:32 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jzoVK3ECWJy5bGAYHncumXRemwLhD3FQQpm+cLUcU7CKV6C8zAJWVhJzU/RhnFqSQcLlWdUbXhSYtbNKLEAG4uA6tbRAeaqD6ZRV3tayByg2jPTySr95M8/904Nj2n7JPzGLP5rmDrmt2hmMU+M1RaBOSxasDC1wGFxNc9R85ZBoIvfTUqf2t8NUzE+BUw0kCp2jRtW+edUl3s4dFPkrljOmXRKoX+e867w+BdNojmib0UsutbMkl72y74NCMC9vMop4GRxulvjzmaFRydCE4bXzZOX/RpcK1F5ziRH8FZTjwg97eM+aa+LB0xbV4N2ajp+IxiGbzU/0wQkzloozLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aYXhMJPt7pBWxYLS8wM2cmQR28e9JPVpgDGAB0+t94U=;
 b=Ek1v05o6BXlA7R1U7y//ZB5KYf+OjX2NYecyevxVcvvK7qjolsLAnHKCAsmRK85iTsSb2VqmsDh0Xc/1mTl+iXfJnhJkf6hOWYW6+Cxmqdk3s2/gOUp53PZmLu+++PWoVPXyI0U/ti0qVAe7e9P+w2PIJiuRzwoDz/3hVvaI34ELCg4y8RlOEWtAOAytq0MUrkKyBXb637GrTTQv8hbeyD//dAAoRAGGBaKHgqKj5DtvppkiteYo0gacCHf4I1v1bs3rDYGgLcb4fR2zhlZr9RItTpyGFzu8rPIw/Kk9CL7Ff07PL0a9rfNobCag6eVuwJWRe5s/oOFt/O4Uv02fkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aYXhMJPt7pBWxYLS8wM2cmQR28e9JPVpgDGAB0+t94U=;
 b=rtIidttrHIHC/JMyDASL6db1xd9QlIxnjPB2vBsHbgyApx4xM2ptz8+rpnjXdCCNnOIMsmRWqxYsnL6hF2Kz6Pjp5Sjl9YXgXDpZQks2uYbOrt9pbmgdhqLaSDzBr7ZMa2g/Q84ZSj4HIux8x6/TZrN1HEzI/p5otQX6L861Vjs=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com (20.177.51.23) by
 VI1PR04MB3997.eurprd04.prod.outlook.com (52.134.123.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.22; Fri, 14 Feb 2020 07:15:01 +0000
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::c7d:58a2:7265:407e]) by VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::c7d:58a2:7265:407e%6]) with mapi id 15.20.2729.025; Fri, 14 Feb 2020
 07:14:42 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com, pawell@cadence.com,
        rogerq@ti.com, gregkh@linuxfoundation.org, jun.li@nxp.com,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH 1/2] usb: cdns3: gadget: link trb should point to next request
Date:   Fri, 14 Feb 2020 15:14:13 +0800
Message-Id: <20200214071414.7256-2-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200214071414.7256-1-peter.chen@nxp.com>
References: <20200214071414.7256-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0111.jpnprd01.prod.outlook.com
 (2603:1096:405:4::27) To VI1PR04MB5327.eurprd04.prod.outlook.com
 (2603:10a6:803:5c::23)
MIME-Version: 1.0
Received: from b29397-desktop.ap.freescale.net (119.31.174.66) by TYCPR01CA0111.jpnprd01.prod.outlook.com (2603:1096:405:4::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2729.22 via Frontend Transport; Fri, 14 Feb 2020 07:14:39 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.66]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 13baaf5d-3261-475c-0b78-08d7b11d8fef
X-MS-TrafficTypeDiagnostic: VI1PR04MB3997:|VI1PR04MB3997:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB3997737EE1A8FD5143369E4B8B150@VI1PR04MB3997.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-Forefront-PRVS: 03137AC81E
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10009020)(4636009)(39860400002)(376002)(346002)(136003)(366004)(396003)(199004)(189003)(478600001)(66946007)(6916009)(44832011)(81156014)(36756003)(316002)(8676002)(81166006)(86362001)(8936002)(956004)(2616005)(6486002)(26005)(6666004)(2906002)(4744005)(16526019)(186003)(66556008)(1076003)(66476007)(6506007)(5660300002)(6512007)(52116002)(4326008);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB3997;H:VI1PR04MB5327.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
Received-SPF: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OifXSxJsfsYGngXaFcZ3W4gpZZq8qSGsZiF/HZVU/O8UTeApfy2aiDdl57dPTcYIhyrH1IWqq7HFbkKpz9SaWiR0ywAMmKlTvwvLrRErY3qryCzBOMt0jvySmhjiIZg0FGfdtm8iSrSxeZoBKEMgyGYmC7UQ0DyUxFAhz7bs6HwMP41FO50KOMFjSJjX9A5vCjG9ttfIShibPrIoj1ewIQX1wEriZtuWXt1fcLZAfoR1eur3FR1SYrokfB2ENsYGrVfbW9OnXvvczNvJKNkxQhZrS3Cd/lirTmPJWT4u5UURoK1DBC13fzDUjg4h7GGKtXTirs1A5bHxQWkLml/rBGV/1B0zMZ/37VGYb45oNpIXS7n7gomAdHuiS/rt+tLgc7GuieE0PTCdEOTOlQ0A4Py566ZwBolyz/QdYvbLAqPoTfLDpv0+TB9ZpCtScv85
X-MS-Exchange-AntiSpam-MessageData: Lfel3CnyGk/040EKOTQmoHJSsUubgFBHaVtSTN650ghKCW657oQFCcc2xqQswOnvffuGTOcg76XzU2BNLyRdD0n1cf9tWPrLcG819qNwcm4c5OcAj7XzAK7N7yCpYrpshA76YSxs5R7/LuY2pfmLnA==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13baaf5d-3261-475c-0b78-08d7b11d8fef
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2020 07:14:42.7168
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4M1Kf3+Hxop8HboeNmwAZecl+Ydr7AWxc1WbB+1pvY76SB6sZxZQxer0whG3C/4R6f3Gu/YHYVHl1xuad3PF/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3997
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

It has marked the dequeue trb as link trb, but its next segment
pointer is still itself, it causes the transfer can't go on. Fix
it by set its pointer as the trb address for the next request.

Fixes: f616c3bda47e ("usb: cdns3: Fix dequeue implementation")
Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/cdns3/gadget.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/cdns3/gadget.c b/drivers/usb/cdns3/gadget.c
index 736b0c6e27fe..1d8a2af35bb0 100644
--- a/drivers/usb/cdns3/gadget.c
+++ b/drivers/usb/cdns3/gadget.c
@@ -2550,7 +2550,7 @@ int cdns3_gadget_ep_dequeue(struct usb_ep *ep,
 	/* Update ring only if removed request is on pending_req_list list */
 	if (req_on_hw_ring) {
 		link_trb->buffer = TRB_BUFFER(priv_ep->trb_pool_dma +
-					      (priv_req->start_trb * TRB_SIZE));
+			((priv_req->end_trb + 1) * TRB_SIZE));
 		link_trb->control = (link_trb->control & TRB_CYCLE) |
 				    TRB_TYPE(TRB_LINK) | TRB_CHAIN;
 
-- 
2.17.1

