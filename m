Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB02F23D852
	for <lists+linux-usb@lfdr.de>; Thu,  6 Aug 2020 11:08:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727819AbgHFJIX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 6 Aug 2020 05:08:23 -0400
Received: from mail-eopbgr70085.outbound.protection.outlook.com ([40.107.7.85]:51734
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727768AbgHFJIV (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 6 Aug 2020 05:08:21 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i+A5nMv9Un4+vJovWGn5QrxJ1ZemthYkogYWCu56IvVog3ct4AsPJOGC5gt6sKdPoJYR7vjqKS7yaLfR4EQ20X4jeVuy2zOJItrbYcomB21biwlff1BziB69fAfSGnNP5isvmVtFrG8u7BXXWulf5neDhGFoSKgrb3Hw/PeXVTGIkvYndrYmLc6ufAF5xIhGXyxi+fV0Ly8vAVOcXpRmx0oM8SUxgudiROh/iZi6zJVcqk2pA+Ujcz1f5+JZ9uYrq4IkavG3DMBLL7bl/iH0/87rwKmHZA7redyUbEcvRQB+4LT6b82gJSYcirYMYvFmXMjYmaPzl+YMVpcJQBh3Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I0+pIv5PXfNEoyX7Y90LeSoUiQZZXY0KaQLkQM6XAuA=;
 b=PKa18jiwS2OE2W+B6Am04nbwV6MtvvEA2MIZGGcp7HIQwxIdMF5VAC/ArWSn26J56z6ArCP4XmhmcSsDpGhRidOptH/B5Sa9v7jbwu3oxqOLATfYtlueM8jNWMmAxQt1R2R1I0Dd04H2Md6cJ7+t/2hwfeXus8UAZzorP+sQMIFqr7NtwDkoZg22j6idQBe+VpDPgDtOVBkeFIilyzfxD/81ZrX2DmZJiQw6JEIKh9Kwu7j8XEmPdLukTOoKYRNMKg1lznwYtdkR3XA+uoHzrgdO64YZZPEOX9y85rdgBmF/Px9YZarDA9qqKZYOS6AgXVvRLg7ZSK0BTO5++L3hDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I0+pIv5PXfNEoyX7Y90LeSoUiQZZXY0KaQLkQM6XAuA=;
 b=rcujwhCQylKH+sXusPjSWzkiis7Z7lGN+LdyIuQZmrTJ+jdAaJwoBOYOMWNwDbZAaYNjTKV6i31hUo5p3Vdnqg9T3HLd7gHLKnsZHp4OQeuk6CNKMGtth7ozBU3ouzrTD58DPr/OhJ9KEQNL36R+8yuZ7+mq81ZEsjnIJNYNAnU=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM6PR04MB5368.eurprd04.prod.outlook.com (2603:10a6:20b:9c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.18; Thu, 6 Aug
 2020 09:08:15 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::ed7f:8755:5994:7fcf]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::ed7f:8755:5994:7fcf%5]) with mapi id 15.20.3261.019; Thu, 6 Aug 2020
 09:08:15 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com,
        Peter Chen <peter.chen@nxp.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>
Subject: [PATCH 2/2] Revert "usb: udc: allow adding and removing the same gadget device"
Date:   Thu,  6 Aug 2020 17:07:17 +0800
Message-Id: <20200806090717.18657-2-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200806090717.18657-1-peter.chen@nxp.com>
References: <20200806090717.18657-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SGAP274CA0024.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::36)
 To AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.67) by SGAP274CA0024.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::36) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19 via Frontend Transport; Thu, 6 Aug 2020 09:08:11 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 47aa5e8f-d7d3-462d-015d-08d839e8409c
X-MS-TrafficTypeDiagnostic: AM6PR04MB5368:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB5368775C89476396C1C350C68B480@AM6PR04MB5368.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:196;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BGFrayqCDeJwkzHziCoeaIjXvi6nhDRwpTdUtYS+JU4mBseIY13gNZH6+XPne1yjH3ugt635TRTmH8DkoUkGW1M2hrNhMEo8p368PQeV9TaWQQHr9ZF/7dF2w2U5gGXQ1mvvVuyMtCSoMliuhvbSCxmOquzvNYDY2fPRt5zhnkx8Fpr/p+Y284zTdMZmY/JodMIqBrNxRAyV7m4u7KEbRk+nW8aefH4wRJy0TTgWmB/1vgb88L50OQGcigNFqVO/tL17WBRiEyU2V3pnvJAK6DE1bC7f8dJMNmxXh25o3HcH/UzCUbIFXt3YvyNpaMYWGuRQSOhgbhCzB+978PsMrw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(346002)(376002)(366004)(396003)(39860400002)(136003)(54906003)(8676002)(316002)(6916009)(6506007)(86362001)(8936002)(66476007)(66946007)(66556008)(4326008)(52116002)(2906002)(83380400001)(1076003)(5660300002)(36756003)(6512007)(478600001)(6486002)(4744005)(186003)(44832011)(2616005)(26005)(956004)(16526019);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: Xo5BfUZYlt4SIx473QNUEE8Tb2WwDEUdGRwdhkkp045KWHYKK1amCUogMLdDUbWuC+/EJj4rT6efZMXW5ExXKzdWe7NgUClLlTMuIQ3i6rdE8GYkh7v2zINqWTqAQZPB/SDX2K/lEQAywuDY4anhTel4uR9dKs11L7B2VzVvjiDzL6UzqEplTJt6QKauKurO/kZcemz+w5Aprzig4fkVoWcC4ARGVEplohGjLgWCLmSXFmYYdlvIppo6fe22wBljsJfdSRHPcikIBRCp0OqctPVdA4vKfQ34qqKVlOFxYTDRjQhPv6n01K8YFRhdesZ7xjGDYXoDFgcSfYT7ctXvumJhdDn6R5YDkkHMQAZk1dVBo8CkJDMOzkQHzH6pkAPXMRBEkbPjpw7VF2q/0LAuh/+dg4LNOaUsYc7M4Xef1+NZ/1vj85+8Y7J+/rwcLFhqUDMqo7VOzrzFhYxUMCFWMUm1szUIdMzAlxTigy+xt867kPQw1xH/1jgFwLFUj5saPQ3o7KZ9CInxjGui15k3IVqSb2ARoEO4UEXe/75bxXbjDpomUd1QEReWifx0z8BEHRVgaPQEdm3p4w/h39zN60wq1I8P1r1NPYaHu041N7fow4rvIkBg8QJqedLlCQ8sk3EFomzkAjSg6a+l7MtTaQ==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47aa5e8f-d7d3-462d-015d-08d839e8409c
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2020 09:08:15.4964
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p8hywDuyXec1fWeGkZVDBAxxyee5Lmql5ShYxmbghcha7DaauzUgtddxqWJWp31TVG0Y1YtjW+wSPoWoLg/DtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5368
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

We have already allocated gadget structure dynamically at UDC (dwc3)
driver, so commit fac323471df6 ("usb: udc: allow adding and removing
the same gadget device")could be reverted.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alan Stern <stern@rowland.harvard.edu>
Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/gadget/udc/core.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/core.c b/drivers/usb/gadget/udc/core.c
index ee226ad802a4..2170bb67cc9e 100644
--- a/drivers/usb/gadget/udc/core.c
+++ b/drivers/usb/gadget/udc/core.c
@@ -1338,7 +1338,6 @@ void usb_del_gadget_udc(struct usb_gadget *gadget)
 	flush_work(&gadget->work);
 	device_unregister(&udc->dev);
 	device_unregister(&gadget->dev);
-	memset(&gadget->dev, 0x00, sizeof(gadget->dev));
 }
 EXPORT_SYMBOL_GPL(usb_del_gadget_udc);
 
-- 
2.17.1

