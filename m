Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 793DE1F1349
	for <lists+linux-usb@lfdr.de>; Mon,  8 Jun 2020 09:11:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729053AbgFHHLE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 8 Jun 2020 03:11:04 -0400
Received: from mail-eopbgr40046.outbound.protection.outlook.com ([40.107.4.46]:14272
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728961AbgFHHLD (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 8 Jun 2020 03:11:03 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OW1QTH1JgNqlJ/6QFNX2Jeyez11GmTLpzUQAowDCjKXvf2Jlc2DSUw4LUakzkcOfcy1bRwMQW9/tp7BXwOqYJctNQRZDNMCPMoNPEMMFSaIWEajQi8D0rxCObpBphgJRvvqmj61dkuJSyc7GYWOlzQ8ioGEr9CY7vH8xwbwC9CfWgoCu4ikuetsBGYJml5FK5sw5E2LR13Uhcdo/tskcuk10ZDQHA5SiyFeaZhxsoCE5CKFP4y8y4HOGroMuOTPHzr1q+xn/3sytS0uUjxhJBYF18BHRGBTOZvAJpKhaC/XwntJUqjL8KP6w85E3pBfYBFDPSfym5fl3846jIjvBNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/9aRElE4Hx7j+1wgBbZbc4ByTd8mpJyjrvvHsaKY/9g=;
 b=NUK0iy/4vs58bwr1PTLwOITUI+eokb++V8ZV7gmr80wdbwC+L2d9AnFt/ZeTWG7AClsAr+PcmLfpn1XXyeCkhp7R6CNJcvqzHDjAhSGLmjKE7UPEQIgEb+RbvieLOfKe3UlVJpVwvt2YnjOzAayErKXmcCz3btekdnkBhwMtO9tdSt0JyC7gr6nPgcrwpA27bzJJKcj0YYwm+NoqUHDSZ60mY15ZhCEYgudR0moG1RH9HTzFpQh7PZVAktekntH0MdH9Quv/runnQcDU5plNWz4ER9H/Bcj9SqlKiFwG1ZPhs5Rb+BzPXZzaCzJVj7vUJfPmr1xHtl8AqIajLEHYXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/9aRElE4Hx7j+1wgBbZbc4ByTd8mpJyjrvvHsaKY/9g=;
 b=Puv+OCbcm6Kvsw2nPSRgAb5bFPZE8LiNbHDjFs2q8zhHVWy6APe3GBZPwVZ5p49Pc3lrSioFlHlpgVvXmlCkM/cElpCCqQS2CmBmK65D2jzJdtIwReYCQR6GcU5fSdw/pTj5p+VflUl877sRj85sijeF5kh4c0+vjmNpUmdM6HI=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM7PR04MB6870.eurprd04.prod.outlook.com (2603:10a6:20b:107::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18; Mon, 8 Jun
 2020 07:10:59 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a%3]) with mapi id 15.20.3066.023; Mon, 8 Jun 2020
 07:10:59 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org, mathias.nyman@intel.com
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com, pawell@cadence.com,
        rogerq@ti.com, gregkh@linuxfoundation.org, jun.li@nxp.com,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH v3 6/9] usb: host: xhci-plat: delete the unnecessary code
Date:   Mon,  8 Jun 2020 15:10:49 +0800
Message-Id: <20200608071052.8929-7-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200608071052.8929-1-peter.chen@nxp.com>
References: <20200608071052.8929-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SGAP274CA0002.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::14)
 To AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.66) by SGAP274CA0002.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18 via Frontend Transport; Mon, 8 Jun 2020 07:10:55 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.66]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c4f7f75f-219f-4665-00fe-08d80b7b1865
X-MS-TrafficTypeDiagnostic: AM7PR04MB6870:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR04MB6870B6CD3FBD4C87C9C76AED8B850@AM7PR04MB6870.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2512;
X-Forefront-PRVS: 042857DBB5
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: w74f43LnIh0LQNdoPHoRFm2sNvhnlojBRwPGYObsjKb2Rm9nXZEsNwqOT8WU62VRxgkBn35LTjwkzltrDiLUoX9z78teR+ibq23q2m+d32Di8/6pGRVnu+s2G0oJezKC6duYUh0IixsRgUNNB4Z0hps7O7S8+C3n6iSbhyg/6rlvXecsXPikDr8/YTxoJw25ta7KbsRbWvlsPlO/b/CNFK4+UuiCuV9Syki47SNiAg1tzLAfJ0NKqs3wjECeexOAM8PnM2A5prEuhYk3gQMYbtctLhXp0lLBYSnSyXUBoC8pdOUr/DdTsNMLAKv37lgkM1iqgW+e/gvy5eWJ592X3g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(396003)(39860400002)(136003)(346002)(376002)(1076003)(6512007)(4744005)(66946007)(44832011)(5660300002)(8936002)(66476007)(66556008)(8676002)(16526019)(186003)(956004)(2616005)(26005)(6506007)(86362001)(6486002)(316002)(2906002)(83380400001)(4326008)(478600001)(36756003)(52116002)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: luOgGzpcUtZI6EVRDa7nroOhe1rgtKNC0ot9e/YiLMHAu7DHExNmA1x58vSI2sTLiHa5T0vY0LHGVhG8kSnSO9/24SmoizQUEbT5k6uh6n/g4Vnrm2eBWeCnkUs3TFJ5cShD3Jbc09uqbaDdfY4Vg4ClqC+1GhTwKD+BPRb0ZGRx9kqK/1yiQEK14tYNwS5+JpBpcBK5P72yLJ2QZVDhf2ZNzummH0POL/npWL0eBqZwmYghY7LxliJ7Qhv77HOdX4FpUs9J++92t3GdO3raNMtgdJI1+S3SEIl+m1tOb+mdI7CJsYAkE7kkvZVJ7z3Yj9l/L51s2d/QK+YXwVvYoQY5ROkdpThWqyiT+KLs2ljoCLMPJ0V4u236T8DZAdt3F2II1j/di1NFd3rx6ea501BRqz/6jE15EPH6A7JnDMpMcs8TbGT5HAnaJoe5uFPAu7tZWQ0QnSq7zarOoBkQO9mqRcBwCzjffNnPmX2nnAU=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4f7f75f-219f-4665-00fe-08d80b7b1865
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2020 07:10:59.4515
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AuTbEgO3dedw140/+lcv61dQh4vgHVcJtmBNxzNm52wH9XTYvz1Uz1x38hUWY4d+DiC8VEm7U+VK5PV1i+pD7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6870
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The if {} condition is duplicated with outer if {} condition.

Reviewed-by: Jun Li <jun.li@nxp.com>
Acked-by: Mathias Nyman <mathias.nyman@linux.intel.com>
Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/host/xhci-plat.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index ca02e7f36238..a45c7ec33ed6 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -274,8 +274,7 @@ static int xhci_plat_probe(struct platform_device *pdev)
 		struct xhci_plat_priv *priv = hcd_to_xhci_priv(hcd);
 
 		/* Just copy data for now */
-		if (priv_match)
-			*priv = *priv_match;
+		*priv = *priv_match;
 	}
 
 	device_wakeup_enable(hcd->self.controller);
-- 
2.17.1

