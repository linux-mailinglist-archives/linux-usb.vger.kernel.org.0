Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB0C6715C0C
	for <lists+linux-usb@lfdr.de>; Tue, 30 May 2023 12:42:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229984AbjE3Kmf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 30 May 2023 06:42:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231616AbjE3Km3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 30 May 2023 06:42:29 -0400
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04on2045.outbound.protection.outlook.com [40.107.8.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2317AA0;
        Tue, 30 May 2023 03:42:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cJ7kchsS03bALR/edHaq48NW23xvWP42Qg3KNiW2oHrTal+JP0wGTBQFtrnF5TTIGWMBoyph/ptZ2Ltgy16wl9j7ZgBaYGuKXUv5A4X0E6E5eFr6PYtY0je+Amdumx9fi0Yi5BJh2LkYSX/YOeZAZKHtxqS/CHxhuAvZthaUE94zKZTqZZJSVVh/dVSPpgt7YpWMV/SbXFz0Tn4+FALPumSTavaPb/pGU949g2cWog8hegegfENQ1yvR7oJMLUqAeawY3uoAl+VLSCjhVeeRKsegGcMGDu5U9pRL6enHnFrIP88msvxMDFs2Gbn0Bh9nwJr6cBC9GNvPlMN/IyxRkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kHRSLOaI/yJsZDYFElTSfXqQ4dhP9oePucPTJcoGNno=;
 b=Tox4rSe29hgJl4kviPRcxW82skBY9EmwB/9ojOQl9Gxh7GuyWn4XsVktekmoHAo34UW6YMkHvCwNpi5l0HdpPVs0D6pokzsHcifm5D9TcPpXZRHyD7d1f4dVMzoO6stON+Gq3Vb7tCqZlR8xkTZbMwuZRj3pz+xsGRIJEzufXsTv3+uCp3vvJkr1BhZZ2JvuzgXRqhlNfHy2OiE80gGNP+JDhPPc6sXFUj8kbDyU2OAGHgbrbjTiyZIbkhbWfpKPQcaVpCxcTHCFxQZN0dwSsaVg96nEJ/1NeTsqwpCFxUX5gMXF5/eutlV0f0puHzafD6tjhAFK0TzASGCc/hdPBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kHRSLOaI/yJsZDYFElTSfXqQ4dhP9oePucPTJcoGNno=;
 b=BrifqBJeJdmKjeSTtTpL996G8vWr9X+ejpLNUYiyErfFlpTz/UVyaxs6PtlvNqQN+b/Pt07h5RwOlgqD67teokYZhrxcnA4SCVdnGkY9QdmjRfmZ9WR1Vh7/JBp7GHvsa3Is1AKZ0+XJueAPA5rIitQ9zk0i1YXM70nrP9QT1CE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com (2603:10a6:5:39::26) by
 AS5PR04MB9970.eurprd04.prod.outlook.com (2603:10a6:20b:67e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.22; Tue, 30 May
 2023 10:42:26 +0000
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::f9b0:8c34:e57:92a4]) by DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::f9b0:8c34:e57:92a4%7]) with mapi id 15.20.6433.022; Tue, 30 May 2023
 10:42:26 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     peter.chen@kernel.org, robh+dt@kernel.org
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-imx@nxp.com, jun.li@nxp.com, xu.yang_2@nxp.com,
        devicetree@vger.kernel.org, peng.fan@nxp.com
Subject: [PATCH 2/2] usb: chipidea: imx: don't request QoS for imx8ulp
Date:   Tue, 30 May 2023 18:40:07 +0800
Message-Id: <20230530104007.1294702-2-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230530104007.1294702-1-xu.yang_2@nxp.com>
References: <20230530104007.1294702-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0165.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::21) To DB7PR04MB4505.eurprd04.prod.outlook.com
 (2603:10a6:5:39::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR04MB4505:EE_|AS5PR04MB9970:EE_
X-MS-Office365-Filtering-Correlation-Id: a9c78966-7989-4fc3-6ee6-08db60fa8eff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: V0HZh9jF3PMDODXrwhmT0K38QOjiIA3o1lz2RQisex0LYAidMoo46bR3ksbOF3UnIsLcFWe/A4DxCNHBYyetCRhwYxTel1L9tiy9mU1cEF1VMD9of5JpJwFNJaPSbwPoE1J50JkoYBqSowQvudWS4JZ2GqqAQnDFh2Ql8zhrUximEuLKoigLLzMWxpn9ip1xnJUTBpaz2Irj72Y8Xs4iRqyTFVwmB2aQ3k9kuzGZvUWPfnPlyPTqhH2cTtm4fO+VlYsO+27k3s7AX8cctalnIFAvZ1xww+sk/wEa07pk6seay/F8/U/iD60/vdvKvi/6HYheraJzu+wjkNL2n4Q82ouasOqoJ4IRbR4ZUiQytj84/XECkookQrJtOMP+NB2/qQWnExCild9n/y7mT4/7fI8mzRwNm/IhDe+VSXaEY6ik5FSRRES2ekcoptfaBOzQhT6zG6ufBpije2RYnMh4DS5aTBZ5dNQqg1y9/hEViTeaLgh54RRoIy47Dks/78wg1WVGTXPpX/w055QLmIS4+FaXnOKrbp7WQHgygdAXTvV9+v63NThUj+zfio5JW/RyX2E0OiD7ymad10WpWOTV+kVR4OuHLIl8ORZZjZrsxg46v32M5H4l7QhO+RuwXCzaSLAZA1ID1m9H5/yT7sv6TQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4505.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(366004)(376002)(39860400002)(396003)(451199021)(1076003)(186003)(6506007)(26005)(52116002)(6486002)(6512007)(316002)(6666004)(2906002)(5660300002)(36756003)(41300700001)(8936002)(8676002)(478600001)(38350700002)(38100700002)(4326008)(86362001)(66946007)(2616005)(66476007)(66556008)(83380400001)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2VXkih3Gkeinq+wYVLnKiovXf/pOT/SbcQDWCYcR0uhmH4WXoTn40WDk7rqO?=
 =?us-ascii?Q?X4reaoSQK0gr8kzCICl419ZO31iPI09okK5fY6It7l1yqFti94wkSJleEnAS?=
 =?us-ascii?Q?j70cfhCKMaU5S+zSOlESmNQB4ALayDf38QRkGVUrFj9bGQRX7nlbnrawfXwC?=
 =?us-ascii?Q?GvxeEHgwDoCraXGC6QL1fvjw5Ws3jQyajILI877JFVyCx8+0bS8eG7zGj5DM?=
 =?us-ascii?Q?YR6PP2+i+6t++5WISl0lamTMLaxgWbjRFUK1+dCxjy83uD3h4XOGUC4z9Li4?=
 =?us-ascii?Q?1JEUDYcTcFd+Vy1OsB+/KtaW67iCfnZjKVnJRxxlaUHeEJCfR7LR2FctdyZk?=
 =?us-ascii?Q?OtiLEz1IlOEbqKKl+fVhSaORw4Bw69jC57XZMXv6aVl81oxt8ILOoNTeO/XI?=
 =?us-ascii?Q?okBR5SuTNuXwNRUdKKpcXbjxYWNPNFI5/b+erMMZTFijugCTttOZHehVrVNP?=
 =?us-ascii?Q?xkKghp7kfvYPqu1nW0ynLoIvpg1Pp4wUaVPTruCGPc3v8gcJmkkLC4Zud62G?=
 =?us-ascii?Q?h9YflqIdmnd5Ks6vEA9bIhSnAWxdm/Rae7x8vgg3vtc287IFzM82yuoCaWxt?=
 =?us-ascii?Q?uyvPlhdWtrNL6qB4tMkRNk+n8egB/dTqM2Dzp+K07tpbVYSeJp70imM9E/kQ?=
 =?us-ascii?Q?rxnmJCex7A0y6HCg0jePmNPHpO3+k75z67JRpl0yyJ1etHU90NJdbhGq3Ic9?=
 =?us-ascii?Q?SSix0b59+FXpzCGPsKAcF1jDK7WIOTSgclBvCsd/6Sr66V9svSOGi8rnRMoE?=
 =?us-ascii?Q?tjhDMIPYxZFGVEm4oVnopefsVgm+N7EEyD1UxB3Psabn9TRz5S7wTbuVkwWK?=
 =?us-ascii?Q?Z/b5rrZ+Nu78PDNVG7EyD/ik+uYzmwZNFo99eVlFY3kYNFIxR8UxmaBtpO5b?=
 =?us-ascii?Q?OcFp7le7hZSHDGahVQ6WVcKFTtHIql6UHIUJz4m5G3+II5wHkyxGfJYvWyfT?=
 =?us-ascii?Q?ioftST5PPUwaxf27EcChEFDLSOhV3CjrbUawsIajtI5uAf3+kcmf3Db+itZT?=
 =?us-ascii?Q?nWubNMZ06ZC3qel5ZfxWdG+QrBRcFPMvUgxQkTjLIw0EHv5vTfEgaXoBpYRN?=
 =?us-ascii?Q?NnvgTnLe1d/OAyjLnbAE90CWXkAniYGqhXt/1lGJs2Yi4djPAGC37rzOheyV?=
 =?us-ascii?Q?KZ0a/rt8nhUyb7wXEjvZe+TqswSmQqFSoUHFD0Xzmz6nA29VpP0fy11arD4+?=
 =?us-ascii?Q?z0ECH4BGM7slsUxalfcMiEICrhJrVXqoRNiT2RRFo6C2fcaCha99qQdM2dBx?=
 =?us-ascii?Q?ZX94v+z2lY9DZEiBuLsDdUWv/nssZIJpl2/192cCkgOfflJeDhv2O5XfdMOY?=
 =?us-ascii?Q?bihgz6wxd4Pt8ucZcZNJvwgNCB+pBg7QZU73pj1sdKiIhFjQlnN+K/SqCQbS?=
 =?us-ascii?Q?aFcl0RGpdKyomdGrTQ9jnLSX0IdFYGSc1pq05RTXhngVuMVPNRKeLv1KQ6HQ?=
 =?us-ascii?Q?Q4S52JdW+Go1Aaq414+O40t2nvB2JU0I17M2Jbdx0WzDDS/Wp238iHs5ppwf?=
 =?us-ascii?Q?cMtGrh/o38XZFtuuQY9oEgrE+daghtdNf+SQgbNOTQj0T7G4jB8E3b3XXce3?=
 =?us-ascii?Q?sT8ocW0907olFIZtLNxPcxXJgJatxpomdZFnciRC?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9c78966-7989-4fc3-6ee6-08db60fa8eff
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4505.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2023 10:42:26.3679
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3EUcv+v/1l4LEHZIbOX09SZH5coMYE3bwFJ1/mlRdutrjkJ+mXEvjcjaF4i+BcWg8mF9XKEshRmA+jbNiyDn5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9970
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Use dedicated imx8ulp usb compatible to remove QoS request
since imx8ulp has no such limitation of imx7ulp: DMA will
not work if system enters idle.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
Signed-off-by: Li Jun <jun.li@nxp.com>
---
 drivers/usb/chipidea/ci_hdrc_imx.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
index 9f0f4ec701c5..336ef6dd8e7d 100644
--- a/drivers/usb/chipidea/ci_hdrc_imx.c
+++ b/drivers/usb/chipidea/ci_hdrc_imx.c
@@ -70,6 +70,10 @@ static const struct ci_hdrc_imx_platform_flag imx7ulp_usb_data = {
 		CI_HDRC_PMQOS,
 };
 
+static const struct ci_hdrc_imx_platform_flag imx8ulp_usb_data = {
+	.flags = CI_HDRC_SUPPORTS_RUNTIME_PM,
+};
+
 static const struct of_device_id ci_hdrc_imx_dt_ids[] = {
 	{ .compatible = "fsl,imx23-usb", .data = &imx23_usb_data},
 	{ .compatible = "fsl,imx28-usb", .data = &imx28_usb_data},
@@ -80,6 +84,7 @@ static const struct of_device_id ci_hdrc_imx_dt_ids[] = {
 	{ .compatible = "fsl,imx6ul-usb", .data = &imx6ul_usb_data},
 	{ .compatible = "fsl,imx7d-usb", .data = &imx7d_usb_data},
 	{ .compatible = "fsl,imx7ulp-usb", .data = &imx7ulp_usb_data},
+	{ .compatible = "fsl,imx8ulp-usb", .data = &imx8ulp_usb_data},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, ci_hdrc_imx_dt_ids);
-- 
2.34.1

