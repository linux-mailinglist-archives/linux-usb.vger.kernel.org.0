Return-Path: <linux-usb+bounces-21131-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CF786A47990
	for <lists+linux-usb@lfdr.de>; Thu, 27 Feb 2025 10:52:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 642391891CA6
	for <lists+linux-usb@lfdr.de>; Thu, 27 Feb 2025 09:53:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE277228CB0;
	Thu, 27 Feb 2025 09:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="PflTd/l/"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2054.outbound.protection.outlook.com [40.107.247.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 946C9227B94;
	Thu, 27 Feb 2025 09:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740649967; cv=fail; b=Ym7BkoKp869WkpVqc/0jjh+xar9wV4LwBEAv1votbNlpBUTTGLdtjmmGF66O4GmogUHVWSwfyZzWIFHjlusrpMnJLVl5RVMO1/rQEghAchx2M4gygcp9B1S2bCw/zZJ32OOdHbi5D4/0zLWJz17dAOwqbroTwRt+KOSoY9fyU9Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740649967; c=relaxed/simple;
	bh=WJIUtIPtxbYsjzRBG2KHi3dWADxQDxtyMosS+i7oS20=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Xwl0pB0kAbDLwW5JKGCNLxU3rn/ValAm024uVNub3gAWXT+zIzqSc7uP/UDjImxVsUaBsF+ohNTWRTdbVVhqF5CWaGmyu3SWpz0JVSoxh+FP3AZSSGCa3Cj5d1+UAKTBiLhxBPjafTiMBCtRnOLGMdWvhfQG6+RljASrmSdj2dw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=PflTd/l/; arc=fail smtp.client-ip=40.107.247.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hynIr/eTAyM+P/WcXwNNN7i3FP5EvdkOd/xyR8MyBfm2nA6zIFfbeSPZb76F9lrHYqPlLEV7VwkTumEM8zqlFnlLj2HKjczhcygIyl2mvTWDiiLNzLND5PrtYpbBPaXak6GZPt/Xe+HUge1dRaEMU/cv33R+DVsXFjE5Fep5X4hQYm2+QxELfTgNHaPkk6dJmaE3w+DfPTm112uCjptRgWaxHtDEj1pvHSd0P/Wmnke9Hm4V2IxkJU2UK8DNC7IQ4M/kbVtKAUTT5MUt5FdHADa1j7KrBmYGSxm6hBbEC4ooTqYx41j40+d1iMUjtTvXf8sT7brxl+8x7/G5iGVxdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EiBjZj4ADePYgoX67qxY/NPTV8/QiVunsNWGQLDOrD0=;
 b=vsyjpI4j2Jd6RhEvGeYBr/cQbEAXM8Y8ZYRKlx5pqm1xLwje7AXa50tEBSPHlDvOkQeVitbnq3+Jj48j8VOVtGOBXwa4DIhGOS0DIunW0EMAg6LqauEntwXA1ifBCVb8JRjNE/9B9VdXiMHl6WuEHATc0F+wbp+NWwDTdJTaiw7x5d+8CtZA6kATSJkZeqgEnFF60o3J8Tt8v86XHfw784K1YbDI/Ok7x5gpAnzKKrN61TVsogZ/q9cgn/gzk4N6fp9ZnBQ84xvvuAt5/IKjaaGu8K6340vVywGqB6j3mogw0Yz77dbYG6VY57GUQGYABWZgkH5429ZpfSJqKyQysg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EiBjZj4ADePYgoX67qxY/NPTV8/QiVunsNWGQLDOrD0=;
 b=PflTd/l/5fM1ROPjMjjlrdKFWN5KSztEc0taRycu0JJBIaLzPSGtjrrnCbCAIkUakQ/Ylr7R/lSBMTBVwIjL3qTEnGDWbtgjNNbPlKAmHKhIyTv/hfuQ8MtsB46FbYaCNqhgGQogkvurIyvDoDOs8i5XhU+d2Txtdy6EqsVrbq3ntxEFPWoU/TbUszX54DHYDhAAbXjNRJSjo7qo1mKBk5UtWFg8xMQzbEc2AMpsGJv09Lcr38ogp0FXpJLbRNvAcVIINDlVrDdPWffT4dVWdtDs3tmd9qWkDOPBFW356TX1VVhdZ3zPk5SOgEjr9pn0rILOpHa6JuBYiZ0xOlD6cA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by VI1PR04MB6848.eurprd04.prod.outlook.com (2603:10a6:803:13c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Thu, 27 Feb
 2025 09:52:44 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%6]) with mapi id 15.20.8489.021; Thu, 27 Feb 2025
 09:52:44 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: gregkh@linuxfoundation.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	peter.chen@kernel.org
Cc: linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	jun.li@nxp.com
Subject: [PATCH v3 1/6] dt-bindings: usb: chipidea: Add i.MX95 compatible string 'fsl,imx95-usb'
Date: Thu, 27 Feb 2025 17:53:43 +0800
Message-Id: <20250227095348.837223-2-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250227095348.837223-1-xu.yang_2@nxp.com>
References: <20250227095348.837223-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0205.apcprd06.prod.outlook.com
 (2603:1096:4:68::13) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|VI1PR04MB6848:EE_
X-MS-Office365-Filtering-Correlation-Id: c9ebdd23-33e9-4468-b234-08dd57147bc5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|7416014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Tb7iX+YKjZ8cBHNBIN+d3dX8/5AIAjQDN6UqRsq9qfNuKJfCOLtf2IftEjY7?=
 =?us-ascii?Q?sPYkGGGlyn6sAze2N4L7UjibsTJlPZjSNvvjXbU7dwTKSF026ngG9mAfC62m?=
 =?us-ascii?Q?t/xmLs554cFdhcGS5Rd1wpX70PkGocBypDz0rvoeXoT1HGyLNY2OsyTVn9i7?=
 =?us-ascii?Q?itFIae22GSJ9ZDbfauIg1w3g+SA6cg3jyHUOlFocnWOL4yRvkdHiHoNS4KAd?=
 =?us-ascii?Q?r6hGzPFiD1euqCtErwTh+xVsUPuMfEOvPlblwXnUbGJKxUPiUXDUG4hw6m98?=
 =?us-ascii?Q?UXyFTzxUACguJGZSNOnILLyWEY8ZTDWp/eYkw4Mfttvm32axDCRqFGCcIw5H?=
 =?us-ascii?Q?tNQjsmc3xUJs0FZdn/VBRkK9ahUkKqmb9gFzE2HaUaXXmwamH5FX4xmsbYH7?=
 =?us-ascii?Q?fIO6iOziHsLblpnFA/TLpC75D89e7Cbi8Djh/ob+bZx7ZBiqy6qESTPRzHPh?=
 =?us-ascii?Q?2u0lhySSD02akEFfW0DwTNV4v14WljIs1kaexrx++qOyT55icITNReKtoV48?=
 =?us-ascii?Q?9jgEiFPfv3LcjseNwgK8WYtwVZrYnkBwZBHUqmG1kBU4ssOGVXgncOFd0Qt3?=
 =?us-ascii?Q?yFpi8T4ZzVLtmVi6JX12aILjAc5qpgXfCVRZe33kBGppKoPaARdyfXlid8Em?=
 =?us-ascii?Q?aHGa3y264MfMSbsNIhpRzz3/hCdIR5sH9P/qDPyJZDbrbniVvMNAe1m1fYEs?=
 =?us-ascii?Q?69VtkBEB5xuvEcckuhL65T5icFjG+fcgAP+PnpBB5Cc48W22jOlhtaubhK+4?=
 =?us-ascii?Q?aydRTB06JijYXDNb10EyCSPQWjp/ShT+STjKy7VZUgsn/AZpguIOvI+FzQO+?=
 =?us-ascii?Q?9wFay9lgEXUNyxhYTzZQHtAwvXqoIdLo5fbiCN1maGRufGYSpPJ0LsMhViFe?=
 =?us-ascii?Q?ZLjCPOwf315dQQ/pavwdeROvJmH8zaVbTe+n7+5jp7jeh4KEu3ruaWxu356X?=
 =?us-ascii?Q?LoJPLgMZ8SKPU+5olbpZ5veewdm3GTtVJq/xFEVOcHDXHZnuEL8ITqLnunlf?=
 =?us-ascii?Q?dlIravuTmwvYskaFFX4CZpJjUI3TVM1cI+x3O3nyOqv4G0oz//39Rds+uFl0?=
 =?us-ascii?Q?GjuibPmCgNsXvuG/SUHF37iI1rZ2bBT7l/sE7zBpRWhEsqZiYAT2sf8l7ik4?=
 =?us-ascii?Q?Ppj6r7qSbDU+9HlCsD/MhbA7tJTKtxDay4K+g2GBg7J24mlvJ0piQBRDLrFH?=
 =?us-ascii?Q?VBC8eNqJ2AQQwUeSSRtbiXXg31CXIzK4TslsaTAB4HW3dMgx53DW3dpCyVeV?=
 =?us-ascii?Q?f/3Ecbf2zyUJLIuupEvSaj50qvfnltoo8extA7v2V0EBFUJu9Dq/BPfj9H4d?=
 =?us-ascii?Q?3c/x8fW4796didbvRjCx0rQYOSYCsL98jJd9K0WwGRikwQ81lWCv4pg8QdbL?=
 =?us-ascii?Q?ubJPlHIJGDIEwTzVTrt/lWX1cV9zRwF0rc2b54GReDadiqAQsnl6veQ81XFu?=
 =?us-ascii?Q?gdwgGsXVw3IDe2SVctcVIwZWSnKOipe2?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(7416014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ifQ3RULgBWrOZSdnmjZxSHTqrHO95vZoA4fOSVu1ASbO7forB4wZ5sU8Qlma?=
 =?us-ascii?Q?QKpc4pE3llcuiUKUYiB2c/6EO5qPdnFgRKigi3AjSZ/Qp3vTuFdbCRclH5OM?=
 =?us-ascii?Q?NL7jSdyTEUGYk4fRQyv26LX+04Rj0YQsgVEOdyMYso6PuxfllrvjMD2sEjus?=
 =?us-ascii?Q?LXyktnkiZ/59QnIO4/YsUulNbzRUTwAgSxrmpImc7LmmF1NUrHDNkGUjYz4z?=
 =?us-ascii?Q?OOmgFx7oloeh9mUsTNZ+BtufGiMBdmfcfLHyrk9VHhOUdaSKvegRSeq6ps9e?=
 =?us-ascii?Q?qI0gLlSSYMpviQI2+vccWLYJSl9uOov2LDkWKQurEoOCyAd+7TxrKvXb9Akt?=
 =?us-ascii?Q?ykZWbsEMTVqPWRsHklvnVm1jhcpJCIJAMisvc7yiAddoU6jKrOA6p3uN8AyK?=
 =?us-ascii?Q?icxgT+LMIqv1pjhEDckHsU+LVAJyBERVyT7+fbebjrMVm9f7DZ7P8cli5CyX?=
 =?us-ascii?Q?4mrJoeiBRLibor01JLE77nOWoKrdMlP+XdrSBSvVAcFvQ6dWnxe3SeT4iF91?=
 =?us-ascii?Q?M/fcdlOYPdt8nq52NwxkeTGZodKl/d51k5sR4hTcfDMD3zZBizofiwPrNt1H?=
 =?us-ascii?Q?UWforKKkRJfbiBq12jQE7hyeIABhDTwkz4yJHfz4f9xTkFXh3kbnNbtCbvuZ?=
 =?us-ascii?Q?5NuVtW++vcTv+6DMpaIdT7o7nIGlTNi6o16q1txLO6dqtjyITFT5D94WqDcr?=
 =?us-ascii?Q?PViBXTqeNe056JBtWz07dOJzabUG9UjlAWp0rwTj5eIIwfxRiY3oA74ojpqK?=
 =?us-ascii?Q?MC8wPlx0WHnSVBs8u1kIFerPFu75kJeygD6ZnmvjEuLLhLiqIehQibxMhMye?=
 =?us-ascii?Q?SUsGZgTlLtjQqmVwMq2pF0nFFw2Qw6mxZzwZNLQUzYyLsxooL6LXa+6Tfkin?=
 =?us-ascii?Q?R8+RENzip3nTxYFGxf0kqKcjTXsaDCu6patlIKthGhI8pbufqvnjsGEB9GkN?=
 =?us-ascii?Q?xICqmIZvTQn30if57NrMXGmOKaKHuYUiYZJMYKDGPzQscesXos0cvBY9YBIS?=
 =?us-ascii?Q?uEkuSbjlkh9Tm6gfHsMTnuczu+jB3853vzAszBRDbqt6li1Gfe8vGff+sc1H?=
 =?us-ascii?Q?zsTu5yV7G3ijT3xeo7RO4Ar06ILQO/g6SVIGHZolk8Wtcq/MP1LjvJhegt0r?=
 =?us-ascii?Q?XAQAqNGibirUObK4fzmNJH3dbeVMYL7ga2NaE55MKI1ka/p/kJqTqq5Q7cWq?=
 =?us-ascii?Q?RtZET4DNDudptTPy/isuwfTfqn4xC8X9Fo7xCiBTK1iVmcY8g68UNB60elOM?=
 =?us-ascii?Q?lx9/3ul0PEJPTp+S237NhbgiHoSBd1H5Uo/XN8NmjErlpST1THXEYsthJk0P?=
 =?us-ascii?Q?PR4oT5Uq+idFIuq9A+jssYDQ16/DJqXqImAvKC/ciKpnz7hR8Skg9UCiO7ws?=
 =?us-ascii?Q?LzA8Qk+rNWhrppmEJ52SSmtSomZhlRkK3qfFL/u4NnqCU89CqpxnhvMyoUKf?=
 =?us-ascii?Q?35Ekn0aTowgtrvrz9DgitPWwP1khx9BUFlfmnSBiYcSx+Rov6LjwVfwdS9fX?=
 =?us-ascii?Q?Ialr05rwEjbdMPz3lh7t/onOoRF9TVS/S0S3bdqHB1OLn7w8bN9/blxqd4LS?=
 =?us-ascii?Q?HCrEg7c2+WkMifOboY9KSA1ObFISwX+0c4tdXQ5h?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9ebdd23-33e9-4468-b234-08dd57147bc5
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2025 09:52:44.5783
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d1RXHLFgR9lSA/t27am8H8gs7v84Nk3h7SmsnVU2XnC6BTbX37kXs0yBpOttkBk8mTNfh1782XD6crLUACZ7lg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6848

The i.MX95 USB2.0 controller is mostly compatible with i.MX7D, except it
requires a second interrupt for wakeup handling. Add the compatible string
for the i.MX95 platform, add the iommus property, and enforce the
interrupt property restriction. Keep the same restriction for existing
compatible strings.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v3:
 - add Rb tag
Changes in v2:
 - improve interrupts description
 - improve subject and commit message
---
 .../bindings/usb/chipidea,usb2-common.yaml    |  3 +++
 .../bindings/usb/chipidea,usb2-imx.yaml       | 24 ++++++++++++++++++-
 2 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/chipidea,usb2-common.yaml b/Documentation/devicetree/bindings/usb/chipidea,usb2-common.yaml
index d2a7d2ecf48a..10020af15afc 100644
--- a/Documentation/devicetree/bindings/usb/chipidea,usb2-common.yaml
+++ b/Documentation/devicetree/bindings/usb/chipidea,usb2-common.yaml
@@ -42,6 +42,9 @@ properties:
 
   phy_type: true
 
+  iommus:
+    maxItems: 1
+
   itc-setting:
     description:
       interrupt threshold control register control, the setting should be
diff --git a/Documentation/devicetree/bindings/usb/chipidea,usb2-imx.yaml b/Documentation/devicetree/bindings/usb/chipidea,usb2-imx.yaml
index 8f6136f5d72e..51014955ab3c 100644
--- a/Documentation/devicetree/bindings/usb/chipidea,usb2-imx.yaml
+++ b/Documentation/devicetree/bindings/usb/chipidea,usb2-imx.yaml
@@ -41,6 +41,7 @@ properties:
               - fsl,imx8mm-usb
               - fsl,imx8mn-usb
               - fsl,imx93-usb
+              - fsl,imx95-usb
           - const: fsl,imx7d-usb
           - const: fsl,imx27-usb
       - items:
@@ -54,7 +55,11 @@ properties:
     maxItems: 1
 
   interrupts:
-    maxItems: 1
+    minItems: 1
+    items:
+      - description: USB controller interrupt or combine USB controller
+                     and wakeup interrupts.
+      - description: Wakeup interrupt
 
   clocks:
     minItems: 1
@@ -191,6 +196,7 @@ allOf:
           contains:
             enum:
               - fsl,imx93-usb
+              - fsl,imx95-usb
     then:
       properties:
         clocks:
@@ -238,6 +244,22 @@ allOf:
           maxItems: 1
         clock-names: false
 
+  # imx95 soc use two interrupts
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - fsl,imx95-usb
+    then:
+      properties:
+        interrupts:
+          minItems: 2
+    else:
+      properties:
+        interrupts:
+          maxItems: 1
+
 unevaluatedProperties: false
 
 examples:
-- 
2.34.1


