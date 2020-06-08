Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E59D61F134A
	for <lists+linux-usb@lfdr.de>; Mon,  8 Jun 2020 09:11:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729005AbgFHHLI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 8 Jun 2020 03:11:08 -0400
Received: from mail-eopbgr40046.outbound.protection.outlook.com ([40.107.4.46]:14272
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728953AbgFHHLG (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 8 Jun 2020 03:11:06 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BzV/bOaS8BdUIxv2W8SK5JYYv/n4lct9sT5FdSbs5ObG0pv0SliLLMSjjfaLYy1bQUcXLJncuMfm1s12u7Z7l6S5bzN6RI1GYcr1t6WsI4SvoXOedLodVhi7HRkeJxEoEjwgSzkhi5Ty0rhYOuLHgkP2zv1ziem86mQ7BTMuuHtZYW3m6k11Naq8djpn7AWvo8twiMOWgLuXLa4ggSDPk/7wE8SiLhUZaT883e5MeJCzhS6pIwU/gHg3QVpJnlTPzdf18DFYn57NuybAagGutuQVFKp5NdCYbV61CRl2t3+HhvF0nnmH5OyZhyAKQjFGo0hhwyF/VY6ktjY69lQhFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iPlSGX8/gUtmNQA831z4sLaWRywj/xvNP/68gpsfqFk=;
 b=TbZEArsXdqFLXXdTWwxF8AyWE73soX6VOvCKNbIXBP3R/WlgFxpwUW7vPLtecMH6LfEHMtxDJaneMWJbzABuJLH+530BxNxLLOpTLg5HiWvkVt809T+JYq+6pZv84+JvwAgYtdZyfNPRqb9rB9MNMw6bvbZxnklypazzuoRg4Y9eQ+JTnPNeZc79w3OcNARhEseNSy2p44r9T1CoQHivF2x553bm5Jh2cfTs6FW8DT1L+W+ureh5pTF5BFXfWdI7LOMtiY3w3o0EZ0AJ0yYq7QE8a4623r6bf0Wa6UmRzjLHAkM1B2Yy1hGZD2wHANdyK7+2w6fvP8ASNynF/XaS0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iPlSGX8/gUtmNQA831z4sLaWRywj/xvNP/68gpsfqFk=;
 b=ZQNhTTATzJ1m0juR9+BPdmKVsyQz/vVI8VD/+x2cF7uO/bpaXmvgrHJB41YjM9d23BVtEss9YnfhDs+WekrVQt3Zkh+3dU8pFHwsITat/qsAukt0/Z/lUg5901eFfdRh3kf/e0Q7Y1Z59LNUE4Au0av3e+h4E4NWG5jCwIQ2up8=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM7PR04MB6870.eurprd04.prod.outlook.com (2603:10a6:20b:107::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18; Mon, 8 Jun
 2020 07:11:02 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a%3]) with mapi id 15.20.3066.023; Mon, 8 Jun 2020
 07:11:02 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org, mathias.nyman@intel.com
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com, pawell@cadence.com,
        rogerq@ti.com, gregkh@linuxfoundation.org, jun.li@nxp.com,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH v3 7/9] usb: host: xhci-plat: add priv quirk for skip PHY initialization
Date:   Mon,  8 Jun 2020 15:10:50 +0800
Message-Id: <20200608071052.8929-8-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200608071052.8929-1-peter.chen@nxp.com>
References: <20200608071052.8929-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SGAP274CA0002.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::14)
 To AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.66) by SGAP274CA0002.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18 via Frontend Transport; Mon, 8 Jun 2020 07:10:59 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.66]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4831dc91-1360-4741-3430-08d80b7b1a53
X-MS-TrafficTypeDiagnostic: AM7PR04MB6870:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR04MB6870417CA56B4A78E674EA6B8B850@AM7PR04MB6870.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-Forefront-PRVS: 042857DBB5
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CymmbohsjSVWt6yaVVeiHqF6UgpomsgDMcvT0PoGFucTkatdK6UwSGLDM8O2pUrvhU9BmSnY6KcoEApWIXi+gD3zJoZfN9EFY0eLeJtQ09r9DncnDF8nzMHdrmYrmLVHun4lAC6bG6uXErX81YBCtfBQG5g2qFpOo+yEuSqRJ6nAYxLdj8b0sMHpFqJtMSeos3XhR2ogpPloeKbyrq8jcvC1HYcEL/QEfsJXjqc6BkSHI/vj3inAPD0Co5s6VfNgVSRF4ekTw8dcAel4zT2aK976iBXW634mnVMT/oyimYZpPaJ5Iy4y5ywG5qWWd+IDp+ekGF+TFlNcqndMNwzH1w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(396003)(39860400002)(136003)(346002)(376002)(1076003)(6512007)(66946007)(44832011)(5660300002)(8936002)(66476007)(66556008)(8676002)(16526019)(186003)(956004)(2616005)(26005)(6506007)(86362001)(6486002)(316002)(2906002)(83380400001)(4326008)(478600001)(36756003)(52116002)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: FsSdOhWxXgK+ZRBMMHkM7WYpwyj8sM8KkbhdDvu4pJhku3VgK33igsGGTlnjQdKAClDfpYgMywRkNMV+ypWjYcBWgQTa+vw6MHPynXd8FoXK/BCWbLvE5VZpkKvemX6UPPsN51M1z+v2sM9a5E619NXuxZNFpAfJNJsaj8toqJnql/ZU2SysmeT+12d4ni0M3qODDs2MDvS+KuEa+ijj1e5l/mdpnWwgwE7EGAfRioq5tb87eDkkGabtKcV3nQb3lj2aNeSoJjLnOsGHURF5S9N7oYZw7C7IyqnUgUbnpFRQK6em9huV0x6bBzP09kdBVoYy6ysCKSnQCyJcL5CzowM14HItnGpX9DklAtd2JuC1IBRbMRleULQ+t7q900EdjLiCqd51wi4GJUeowdS96wIsNt35PampZv3UltFjV2RKlWKjA42zP4BeQAmzCj2+ROnS75oLCPVc3P7DWif75hU/zqQ3quiHkEDAQFThbOY=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4831dc91-1360-4741-3430-08d80b7b1a53
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2020 07:11:02.5559
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DDWkA9wA3YSeoz9uonoYIKycksCj9Uvgix5WLv7soyUEyMOqnjN+h9iRyeH3InZGsduQp29RjILXJyeCMfgRgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6870
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Some DRD controllers (eg, dwc3 & cdns3) have PHY management at
their own driver to cover both device and host mode, so add one
priv quirk for such users to skip PHY management from HCD core.

Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/host/xhci-plat.c | 8 ++++++--
 drivers/usb/host/xhci.h      | 1 +
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index a45c7ec33ed6..6b8a193bd012 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -173,6 +173,8 @@ static int xhci_plat_probe(struct platform_device *pdev)
 	struct usb_hcd		*hcd;
 	int			ret;
 	int			irq;
+	struct xhci_plat_priv	*priv = NULL;
+
 
 	if (usb_disabled())
 		return -ENODEV;
@@ -271,8 +273,7 @@ static int xhci_plat_probe(struct platform_device *pdev)
 		priv_match = dev_get_platdata(&pdev->dev);
 
 	if (priv_match) {
-		struct xhci_plat_priv *priv = hcd_to_xhci_priv(hcd);
-
+		priv = hcd_to_xhci_priv(hcd);
 		/* Just copy data for now */
 		*priv = *priv_match;
 	}
@@ -324,6 +325,9 @@ static int xhci_plat_probe(struct platform_device *pdev)
 
 	hcd->tpl_support = of_usb_host_tpl_support(sysdev->of_node);
 	xhci->shared_hcd->tpl_support = hcd->tpl_support;
+	if (priv && (priv->quirks & XHCI_SKIP_PHY_INIT))
+		hcd->skip_phy_initialization = 1;
+
 	ret = usb_add_hcd(hcd, irq, IRQF_SHARED);
 	if (ret)
 		goto disable_usb_phy;
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 54a08bd31e46..b19169fd8a85 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1873,6 +1873,7 @@ struct xhci_hcd {
 #define XHCI_RESET_PLL_ON_DISCONNECT	BIT_ULL(34)
 #define XHCI_SNPS_BROKEN_SUSPEND    BIT_ULL(35)
 #define XHCI_CDNS_HOST		BIT_ULL(36)
+#define XHCI_SKIP_PHY_INIT		BIT_ULL(37)
 
 	unsigned int		num_active_eps;
 	unsigned int		limit_active_eps;
-- 
2.17.1

