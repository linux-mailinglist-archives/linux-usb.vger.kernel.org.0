Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2230A1646A5
	for <lists+linux-usb@lfdr.de>; Wed, 19 Feb 2020 15:15:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727895AbgBSOPR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 19 Feb 2020 09:15:17 -0500
Received: from mail-eopbgr130057.outbound.protection.outlook.com ([40.107.13.57]:46766
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726736AbgBSOPQ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 19 Feb 2020 09:15:16 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a8jC08jNL069Rs+/37G6fwfzsuirEYbeqMz/jjka1miYVesVGiIohMoSfFEolXkUgDHRuXnpQwRKbe0Z2WddRSgFkjSLKtDSUBOAk6gGrnkuJMkDsiVP9srAegIeCacN3Rrd94lBmACN4jSNZiQCHXRSEMO+ezevdsbrUSpbmI2M5nHapaXg1TB5SEzEtF9YnEOd6VR4LSdPkbavCg552n9GEsPrA5YcH6yu7AkyPNNkL2lg4Xz6WMrGcERYZfWQ1m2IVc7YdOaVlAz3A3icd72XMVbVwiiaMtObYvGz0pW9KU6Afe1USeVmZyRgDizfYIc8gX5xR8w3EssKC9chUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ChVc7l4yLzit68Dg2GljnvOS801pLEydouPXhx0jYms=;
 b=B8vTJVFVsKILhiv6bLcTS4gFqqGJej2RFYCiYGHEYupVElbg13CApfxG9USkb6Zf77SiXNlUJq2G9N+SkQ2FiWV20EJsoJ6jaAQ94pCnQA7Cg5L0tuiDahAV0yzwcTcdyi/XNSOSZA3t6T0yDWTXHD12cz6asaBZfzD5ZXIFn79oyTzJ7AaSP+7tpTp0kvXgweYBYyAJJ3LhZaTFJhqQEC0yaMuTDZI5uHXnUr0vKprHWDS3K/K5mxkwkjaZHjiRHWnLhsAtjS6bvKLbGCPAEN7TH/rTbRySlBaJo+lEgmXRHXPRbXu2OFzwBPhpYkdBp+y/aWr+vXn9JSohjvaYkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ChVc7l4yLzit68Dg2GljnvOS801pLEydouPXhx0jYms=;
 b=sAewIUAHtg/BJqV5Cz1LVyPysRwZf/hu8UgqPp5Y9np+/BALAugkqeEnCyBbraixQvE/MIFN+vYOOp7C5w/qbKnjLGbpdQASlsRp26sNe/PERUuNR2EVNtW+9tSROdbKpPzNwp1pzRgB7bxep+fF88kv0jRFSP1J2I9VOUYG7I0=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com (20.177.51.23) by
 VI1PR04MB4112.eurprd04.prod.outlook.com (52.133.14.153) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2750.18; Wed, 19 Feb 2020 14:15:14 +0000
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::c7d:58a2:7265:407e]) by VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::c7d:58a2:7265:407e%6]) with mapi id 15.20.2729.032; Wed, 19 Feb 2020
 14:15:14 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com, pawell@cadence.com,
        rogerq@ti.com, gregkh@linuxfoundation.org, jun.li@nxp.com,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH v2 1/2] usb: cdns3: gadget: link trb should point to next request
Date:   Wed, 19 Feb 2020 22:14:54 +0800
Message-Id: <20200219141455.23257-2-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200219141455.23257-1-peter.chen@nxp.com>
References: <20200219141455.23257-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: HK2PR03CA0062.apcprd03.prod.outlook.com
 (2603:1096:202:17::32) To VI1PR04MB5327.eurprd04.prod.outlook.com
 (2603:10a6:803:5c::23)
MIME-Version: 1.0
Received: from b29397-desktop.ap.freescale.net (119.31.174.66) by HK2PR03CA0062.apcprd03.prod.outlook.com (2603:1096:202:17::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2750.9 via Frontend Transport; Wed, 19 Feb 2020 14:15:11 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.66]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a98efaf3-57ed-4623-637e-08d7b5462309
X-MS-TrafficTypeDiagnostic: VI1PR04MB4112:|VI1PR04MB4112:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB41123A3FD2F1010858526B778B100@VI1PR04MB4112.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-Forefront-PRVS: 0318501FAE
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10009020)(4636009)(346002)(136003)(39860400002)(366004)(396003)(376002)(199004)(189003)(52116002)(8936002)(16526019)(186003)(8676002)(81166006)(81156014)(26005)(44832011)(6666004)(6916009)(6486002)(1076003)(6512007)(4326008)(86362001)(5660300002)(6506007)(956004)(4744005)(2906002)(66556008)(478600001)(2616005)(66476007)(36756003)(316002)(66946007);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB4112;H:VI1PR04MB5327.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
Received-SPF: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1rYnHq6Gfo1CArTL9o0jFqI8I4RpOhxsogskWmyrU5GSsu6jhmKV2gtgCaqmguDPH1wajJuO6pGg1BlhRmVdyc9+GmEFY2gQGAXZvK6OL0L1vAOfqVcbsfQC/FJLSYRNj9O8ekgbylobV8DSNjS5jz99ZX0inP2G5l5Dn3VudkX9flJ2HmiUwgKlut7JiI+nWq2bV4wzCU2pw7e57OlKaATXlQyCOFxlcmJemNGwYcRdiTF2gnMnaN1zNDH6X1W/5ThQhRMBb3cZ+feKXykOV24OXylMPMjVoU57LhxK7dOscDlLjl6oZrizu6C/AYcNcqIQTNQGOboazOqTdh4CKTiSP6jqCfRNvgzw4vZb7ypLto6bTWxG9ZG3RJXoE9U5GYrxi6zbKqDA8/gHMDDd+DRopj9nmF1GYlKPHuVTLgIgz8GEyn/1uyGGjE7FyaeL
X-MS-Exchange-AntiSpam-MessageData: IRzmrHzm2M8MhMI82B+Cz2P+m93FPmCHdUGXOoXWTXHpNUSghnEjl51CAy6q+3nCWquKSgbb64DF6rWnayMaKukohZgreziHqlSKw/uNLXsTXbV88BzwhZHVELNsGrXH79cPqw3fzloRQacHnmCXYQ==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a98efaf3-57ed-4623-637e-08d7b5462309
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2020 14:15:13.9988
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AaJNRtUihPSWCJoTEnCBCcz+A/gicE2HE2k0yZAiUciK5GmTe5uBazbvAWKf9TiVr5lR7NIvDBhzgmwEluKtZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4112
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
No changes.

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

