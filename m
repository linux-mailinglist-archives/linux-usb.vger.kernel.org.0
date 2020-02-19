Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D2BC01646A6
	for <lists+linux-usb@lfdr.de>; Wed, 19 Feb 2020 15:15:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727902AbgBSOPT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 19 Feb 2020 09:15:19 -0500
Received: from mail-am6eur05on2080.outbound.protection.outlook.com ([40.107.22.80]:56096
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726736AbgBSOPT (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 19 Feb 2020 09:15:19 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WwJWy5caasfL5wAB1Ajr+17FiTo24MzyDVGhodRE/76CU87RkkR2TVfJphOk3ZxIp8X5HDqSDzKfzgAJm2mQgYRxOkX10bu+MIz6ObqHlldi18JpKZw9E2MW5lc1UUQYYuz+9xUQ6RlW8vhTPE+3SmdZV/H3oMtwCxJH3p60fU5cwKdz1b7fLRcUcaD5g3zT9ZpYDeyoaHgSQlPKMnvnRlzRGP+4bIenUl9OBvINCbhgYcbuTMk3FmNN9ddRU5wBIT6plY2unCUM7qnHLS7fuGJVXQahzYT4LHvFx0OD/Fqnpwd9KmhEsIY7eY8uwiRZU9/TBlBF1N4NhQ8VItu7+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KA/7IyDCkfbX672Mg8YxjO+ukIdraLA+9u7XrWKlRe0=;
 b=KgmHcjPXROAz0dvhQYeV4vHZN5JUqbdNy5wJQfAqznxJ6RvecXt8mIUhhNenLWDZ2dR719OK2+prM4IUIQ0qVgPYf14Dz/zwKUKm2a9wcbnZib/xsLYhIA0Bos8nR5v6J1O45F5YBk1d4Pfa+aZhy4y6pEk5+VGb9qDZJSaw6Wv/E1e3qHI9C7ZJ29fgG4hnrfh45HNJUMU/5DQjGnvsZFRSJRZZYPo0GW1fv8rwIjVLa0R509zMZ7pzW4UENwzRTufftZhC3HBJZpewmSpuDk/9FoNhEAMT9O26r63JOjubTsZMzBhl6v8stauL7IJKIvQNUlLtCL1yDZsTzfJtTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KA/7IyDCkfbX672Mg8YxjO+ukIdraLA+9u7XrWKlRe0=;
 b=NidS24du7qNL5DqBgaeojhmBn5uVprOrvAMoHDgj+bxZEaju+M45lAmWqe7FUUdd18IHwK+5gWJsaCDGy6K5lCKWCQEcqI5xMoTVvMS1k7H3oiSSidrqa6IKdrBBbfr0JnXDLIL0cIVeuw3vsJyxdEk72SORE/9/Hi0u3Ed+fa0=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com (20.177.51.23) by
 VI1PR04MB4112.eurprd04.prod.outlook.com (52.133.14.153) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2750.18; Wed, 19 Feb 2020 14:15:17 +0000
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::c7d:58a2:7265:407e]) by VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::c7d:58a2:7265:407e%6]) with mapi id 15.20.2729.032; Wed, 19 Feb 2020
 14:15:16 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com, pawell@cadence.com,
        rogerq@ti.com, gregkh@linuxfoundation.org, jun.li@nxp.com,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH v2 2/2] usb: cdns3: gadget: toggle cycle bit before reset endpoint
Date:   Wed, 19 Feb 2020 22:14:55 +0800
Message-Id: <20200219141455.23257-3-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200219141455.23257-1-peter.chen@nxp.com>
References: <20200219141455.23257-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: HK2PR03CA0062.apcprd03.prod.outlook.com
 (2603:1096:202:17::32) To VI1PR04MB5327.eurprd04.prod.outlook.com
 (2603:10a6:803:5c::23)
MIME-Version: 1.0
Received: from b29397-desktop.ap.freescale.net (119.31.174.66) by HK2PR03CA0062.apcprd03.prod.outlook.com (2603:1096:202:17::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2750.9 via Frontend Transport; Wed, 19 Feb 2020 14:15:14 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.66]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 0c6e83ac-4f58-4573-34cd-08d7b54624da
X-MS-TrafficTypeDiagnostic: VI1PR04MB4112:|VI1PR04MB4112:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB4112CE7C465930502740EC3C8B100@VI1PR04MB4112.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 0318501FAE
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10009020)(4636009)(346002)(136003)(39860400002)(366004)(396003)(376002)(199004)(189003)(52116002)(8936002)(16526019)(186003)(8676002)(81166006)(81156014)(26005)(44832011)(6666004)(6916009)(6486002)(1076003)(6512007)(4326008)(86362001)(5660300002)(6506007)(956004)(2906002)(66556008)(478600001)(2616005)(66476007)(36756003)(316002)(66946007);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB4112;H:VI1PR04MB5327.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
Received-SPF: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ccDYzOvy14HzvLRg4GUku48SitjweMmwPYWQYFJhRfzHG0hwU+uqiZ62UY7B8OtmYqpb1nu41T9WjnQ5cXshZbpiuoG3YOT/tsEfbBVaOyxh45EFiAoUUzcXM5Ynncx5KhxQyOU/VA9WlikNRG92GDLDrLveG9+M+4jxxmN6JDnJrvX21KgEqEgZJsmnvCTYDRa5dIT2NlX7jjqbOwpLauErYC4I3NEV8Na0QgHVWTX5J46807vBshGcwB40X5k9oDSvSFI/cXuqLX+vaI5KoD1gYZ3fB+kOk4xTZADx7VI6FzmkkvTPLdyDjwMWM0xs88cOsaEHOf9lcFmF9hJDlca/0xgdVytwcDFN0IfeNytz9baC/MmnN8SUtvkU/RSjgizQn2qPmAPZuvvAi9C33q51ULXhBokaPvNVPLOmV3BJrvlFS53dszhfbvou5Dib
X-MS-Exchange-AntiSpam-MessageData: +k69/Nvgg3L17LgYJsQTd7e8a3hFB9YIBEsxg5xH/V1OCPE/vVMDgH7VeszInFPsMIBaxX6C5YFY4dqcgGHYf+cftojL6f0l8CAKfht+C0vM5tZ+4bE0Itb1VzNSh5BWVJLrvJpdFB9V12z0yrFtDQ==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c6e83ac-4f58-4573-34cd-08d7b54624da
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2020 14:15:16.8821
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H0Po0ydhSyPfUeVVPQ3XuO5h+TllvX4z9evxK/ECwn20GB71ONIHfWoEFKFf30qzd5ns5eCWDcmdsUK5jrm4oQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4112
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

If there are TRBs pending during reset endpoint operation, the
DMA will advance after reset operation, but it isn't expected,
since the data is not yet available (For OUT, the data is not
yet available). After the data is ready, there won't be any
interrupt since the EP_TRADDR already points to next TRB entry
and doorbell is not set.

To fix it, it toggles cycle bit before reset operation, and restores
it after reset, it could avoid unexpected DMA advance due to
cycle bit is for software during the endpoint reset operation.

Fixes: 7733f6c32e36 ("usb: cdns3: Add Cadence USB3 DRD Driver")
Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
Changes for v2:
- Improve the comments.
- Using MACRO TRB_CYCLE at code

 drivers/usb/cdns3/gadget.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/cdns3/gadget.c b/drivers/usb/cdns3/gadget.c
index 1d8a2af35bb0..3574dbb09366 100644
--- a/drivers/usb/cdns3/gadget.c
+++ b/drivers/usb/cdns3/gadget.c
@@ -2595,11 +2595,21 @@ int __cdns3_gadget_ep_clear_halt(struct cdns3_endpoint *priv_ep)
 {
 	struct cdns3_device *priv_dev = priv_ep->cdns3_dev;
 	struct usb_request *request;
+	struct cdns3_request *priv_req;
+	struct cdns3_trb *trb = NULL;
 	int ret;
 	int val;
 
 	trace_cdns3_halt(priv_ep, 0, 0);
 
+	request = cdns3_next_request(&priv_ep->pending_req_list);
+	if (request) {
+		priv_req = to_cdns3_request(request);
+		trb = priv_req->trb;
+		if (trb)
+			trb->control = trb->control ^ TRB_CYCLE;
+	}
+
 	writel(EP_CMD_CSTALL | EP_CMD_EPRST, &priv_dev->regs->ep_cmd);
 
 	/* wait for EPRST cleared */
@@ -2610,10 +2620,11 @@ int __cdns3_gadget_ep_clear_halt(struct cdns3_endpoint *priv_ep)
 
 	priv_ep->flags &= ~(EP_STALLED | EP_STALL_PENDING);
 
-	request = cdns3_next_request(&priv_ep->pending_req_list);
-
-	if (request)
+	if (request) {
+		if (trb)
+			trb->control = trb->control ^ TRB_CYCLE;
 		cdns3_rearm_transfer(priv_ep, 1);
+	}
 
 	cdns3_start_all_request(priv_dev, priv_ep);
 	return ret;
-- 
2.17.1

