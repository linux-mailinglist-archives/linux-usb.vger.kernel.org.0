Return-Path: <linux-usb+bounces-14872-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF4F972A1E
	for <lists+linux-usb@lfdr.de>; Tue, 10 Sep 2024 09:03:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8DE051F257CA
	for <lists+linux-usb@lfdr.de>; Tue, 10 Sep 2024 07:03:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96C3617BB26;
	Tue, 10 Sep 2024 07:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="lSw0xEbF"
X-Original-To: linux-usb@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010059.outbound.protection.outlook.com [52.101.69.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE459335A7;
	Tue, 10 Sep 2024 07:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725951794; cv=fail; b=NbVu9cnV4PavQ1zliAM5Ab+F5pohuzvPrpPOrMphNOJ4pLawVF9D1VDiKmFEcOaomcRxnKA8r4f2scDkXzprfU/PjtIGzF1rHZPr8ZJL409ngqp/Q2479qjMRQBi64YtI7gLd3GodnPYLL/AlMziC8NV4qib1BOC3+/CPbdTnzQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725951794; c=relaxed/simple;
	bh=KmTH7JctGdSddpee6yUN2Gw9iXlt95zRke8KsmWij08=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=O3BFBJGm0fEhnFAIVWKnl7Gds5jaZiW5qALJM5ax9dbzEOCEt8e4DeRLyHI3VAjCtPPbuZMkWVm34AlcJj3l5ETID6Lz3By8yYePG4ULQ5Ad/T7fwr+GH6VNeIPDkNR/C7b/HgZ3Icb0JGSl7J73q4sanQU7nOvur4eywApEjQQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=lSw0xEbF; arc=fail smtp.client-ip=52.101.69.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SZ6PWSDEv+PoBTmA4EkLVZPvr4grIHGmPn949VaaZINQiiIzLHGIGPp1oB5nDi6uv0NNi88Ae41eeL1yQNzDLkDNRk1+BrCRs5KTx9zWfepWWE4jM8MBU9ATzQH1F0C3t/6G4s5Iz+hV53I1uF+G33AF9jz0rNwYtzAf+6BC0/devWKwHC7uazfZ49uEWXyC6FYOupQ7kL6fLFaA1f69L5iSvxhF9aqqGaFS2dsadukPzXFht6Gdz+yX+Br6BC7OspRXwJX/XDjqX0rhJpleX/Y/BVBn3WUw0E1JnAb072bjoFmr4n7ksq+se+Pit25U2Qvo371nZGNqu2bIOJT+Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oL/W2dv0JiR6ixWs28Px+WcW0LjLoUyM/xiiZG2pqxw=;
 b=ArLB9ihUV04avGriToxGsJJWRhc+PBNnC2vzYo7JZkBDwG/u660g77bEDi3EMGDiRcJR6jSxJl4mazgrnpPunhtjV0u6c5kE0lTUcZ3l1GsSDaniCit/eeTvO9VC1QeUMdIr/eavTqni0NBaO/HV+vT1OQxh1koZHUwSqYM4nwZHPmMgmLJ43RCqxh16vq+1JPeY3b2ULoFbAT+t75niQzEG5OAMptmygGhE5f4SQi9Dhz41sEWYozghHvleSNIr/4DR8YCTn3mbQ9nA0BZFSJQlVTxnqrNYvIFGk6EwVpcZ0jEMlFWrAJaXawGuQKVG3IjMuiJCrutGxnWTjyIsHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oL/W2dv0JiR6ixWs28Px+WcW0LjLoUyM/xiiZG2pqxw=;
 b=lSw0xEbFbHhia8X1wS9Keafi8JI5CuwMegvYvZuy6UmZhMoXuOHBIcc8LSHBvoOX/N/Z+qisVBqN7cjuecUiBTgWQX0iZbL2yMJvCX8hFF6PlStg7pgzaL59oMGbsA+2/M2P+5Ms0hUFxv5k+QBjZvt9SIof697nRfO/ASl8uw8Y3grGZDoiFKg5pwipxQj/AEmvNDX13IFoYKDhIed8La6gSc0NNdAXUm0h208zvl4RxyTwWzfFUAW84tf8jrA20Y6/VY3qZV80rWZJgbFvDJ+c7atwoXZ9dDijHUVcaa0baXWWORefE57IOnA/gdIEj1GogW8pB7o3rAaoCNB5iw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by DB8PR04MB7099.eurprd04.prod.outlook.com (2603:10a6:10:12b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24; Tue, 10 Sep
 2024 07:03:06 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%4]) with mapi id 15.20.7918.024; Tue, 10 Sep 2024
 07:03:06 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: vkoul@kernel.org,
	kishon@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	gregkh@linuxfoundation.org,
	Frank.Li@nxp.com,
	jun.li@nxp.com,
	l.stach@pengutronix.de,
	aford173@gmail.com,
	hongxing.zhu@nxp.com,
	alexander.stein@ew.tq-group.com
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v4 1/5] dt-bindings: phy: imx8mq-usb: add compatible "fsl,imx95-usb-phy"
Date: Tue, 10 Sep 2024 15:03:35 +0800
Message-Id: <20240910070339.4150883-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0184.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::9) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|DB8PR04MB7099:EE_
X-MS-Office365-Filtering-Correlation-Id: 998e1d75-6c54-43e6-b0af-08dcd1669ea2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|52116014|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1o8qZct3blxAWayV3nZLyom5LS1uPywL4ydRoqyJoOCuMbwu8/wpeYyrLP+D?=
 =?us-ascii?Q?R2LdS7+nguZlC0mmtpYmGqy2vSkoBtbv5TJ5+qBsCgpWGr0XPrZOU7/nY8bM?=
 =?us-ascii?Q?2Z2Z0ILlxsbySimWH1Hn0X6pkXkD0Y3x2b2Q8XaW6PVUPbpIwHEGNglvQhZp?=
 =?us-ascii?Q?719BVkkHVJbuahT7VpjfrgsCIAAOEW71SS2RP+nhLG75ypBLpqmTup5fjxjc?=
 =?us-ascii?Q?R6kWk4YCGbL7tfSRLuCeLAU+NkhW/BH3xmVNXxA/sRvlQPYxUuF5SL0tENr+?=
 =?us-ascii?Q?6cFU6VXbC+IPVKBvjHHBPkLpDG12EoYMBTqVnFcIhxBMyLz1PBLZyL40jfJC?=
 =?us-ascii?Q?0Lztn99y/WYG9dc2Delp1RjiJpFv2ffQgKQDxDt4xWOT/Oe/E0aRKUNqj8eh?=
 =?us-ascii?Q?yRwSpg1jfiCUA+9p/1tdQZjqlYDr4iXbGv0Z2yLdN+qwTSrO278C+f+CqgMO?=
 =?us-ascii?Q?2g9pucimhNfj+3Dx/jib3qfg6hki7CrSEsw6EWD/Di0DLQwKb0Bv9W0MxI7h?=
 =?us-ascii?Q?BvXU1swfj4fI6AHQqtHijxbvk/UTYQh+z9eHmk68VEgJB3Nhh7p7DVibSnKu?=
 =?us-ascii?Q?xP9u7jU1MyfFHHd2f32iHJZyFe/qmm25ClZNc4xoPkLkaxM7Tc4jgO83TZq0?=
 =?us-ascii?Q?EYLoAV9tacxYufGasJEFiTQPHdaR4JSzctvpceFdEkOkUll88Auy9OvpfPXq?=
 =?us-ascii?Q?RNE4xn0GU118fOfeSIuklf5/OLgCF7TY77VtXIk/gSKiD0LUunVew8sWatcx?=
 =?us-ascii?Q?FAvLckZ4ph0Z71r4dSd+/czOvI2Lo1Krk7i0lD2C9LIsSEii8O1/z4da5HLB?=
 =?us-ascii?Q?YdbTGVB/PYiOi258zUhXvRxklSpnt+hb7sUtsAw8x7NP4/Syvc8enzSAFfrI?=
 =?us-ascii?Q?j27OMC7T6iw1Wp+cJyvd8VDLmMIb1ILBS3PgQtqcHGgMzir+Wu7k3fK/YfzE?=
 =?us-ascii?Q?a0qWVhpGbeZkNfoOOqJBBmUmx4TBrG81PsyhzhYDBH565EZXsfmC+4DMDJZ9?=
 =?us-ascii?Q?pumYo6DfTWNnr5+EmAwobbRFb88Y5+A3Zv4zFt0JukVn18sfcUsw8D8Ex9FL?=
 =?us-ascii?Q?+AGHUgn+IgGEpumTntG44D50ngYnurQocUUv8JRdvSrnXVYT7DA4joVYnt4I?=
 =?us-ascii?Q?RRKCjbnYXIcb1fTVz54AnRwRj/4v8t5UZH3gHfWRJSHN+EmiWXFkoAjcGDO2?=
 =?us-ascii?Q?RJUs+8mSeXK48SPrYVJrmcqkfmaoSwo6l8Sl9gDwOSTdWsez3iuMzwIoxLo/?=
 =?us-ascii?Q?Bs6jAlvQg+1bL32huc3vGvn0OkoykJFcihpV6NqHI65L6OExlrHhXdIwB6IA?=
 =?us-ascii?Q?MwTEUkcbkKvnVzHVXggmQIXWPPT5fN1ePeLMwAoYu4p1DmRmlwVGOgaeJROL?=
 =?us-ascii?Q?+9RM98gYwejZcIGrxItiRqANi8nD0wpn7SsCWBpOMhpWpmEBnKh129ITE7PO?=
 =?us-ascii?Q?s39V5ZxWGxk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(52116014)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4KcCoSlb1T+i2iJyl3/S/pmkFhHNgOfoA2scdg8iCL3QlG3vWV9mLs4RWUHe?=
 =?us-ascii?Q?TmAmey7XXmrfs82l3SZeXih4nyUZoJ9Sx/UFiUpriGdZSosOJXQCQ8lca4Gl?=
 =?us-ascii?Q?vMNMQa5uVc2dj+GzGYysBKDA7DvOpoM58PloVXx1Mv6DeuE5o4/4TTgHoJai?=
 =?us-ascii?Q?RioxycvmeUaFrdIPJAGL5T4wOGSeFnGOA/1UZTyxFKlv+PjNUZTIv6G2YkjU?=
 =?us-ascii?Q?IrJrDJW8PBDogP/JZC5ECUj4rk0fKHTnAqgeyAi4sz+kmwCLr+sTDkY1MIQm?=
 =?us-ascii?Q?DX47IvZbPsVq2c1iLNHucwKdqUYQAqgYbfe/cGooEPwZngNyAo54qy6WRa+G?=
 =?us-ascii?Q?dKEbdxcfI4T5nVRWnsPqSFLjpofaBXkqn7WN++BVxL+2pGPAAMi2Q/dMbMuu?=
 =?us-ascii?Q?d/6I3KcLXZOdWFQBzGcHsuFYde+FdcNpcnW26qBaZJ4PZuJf+GAwsuaCcSM7?=
 =?us-ascii?Q?WoIurhGYvYWFAYz/nfTl4u5OPgf3t1SKehHm28io8JE4nSWo3XNiSZQJKQAj?=
 =?us-ascii?Q?Ie5CdRx3VuPCdzkmrFXefQvEuWqOTElli0m6DPNMIwDG9i3qmvLP7gVXLMb4?=
 =?us-ascii?Q?0ncFg78rmIBCUPhUnYmUNObaJOEk12BBGmRIo08MjpLdHsI51+lzhBwPeCBA?=
 =?us-ascii?Q?BKV6+XcRm58NGOMePteOWHuen0bGkg0O+cDwBvtoq+bexd4UFkc25UxFtY3y?=
 =?us-ascii?Q?9hGUInO0CYo8l0PmnsDShMMFqmT8uc3Xni5LN96d3i07viB5bIfugRxNz+Mp?=
 =?us-ascii?Q?Xe19Agoh7hmoETdBZpvq9Cj7UtCxWHjW5XyGO7D+xO+Kw1BTmnkQBtsC2sho?=
 =?us-ascii?Q?bQK7Tt9cWpDzMvOLY3y0wM+aISsvO625nrshkU9e/eh2tMfbox1QNf1NjdVh?=
 =?us-ascii?Q?Ul6pyCEwETipgVcaqBSctpiejmd2QeazIGJqctgsSAPIgZWu09irUV/PJDRl?=
 =?us-ascii?Q?7XfBKCj4wjD0ubhQZDCmCjiJrudiCHxaXZCbswHHuP83JnqfXqTbM0K1jhU6?=
 =?us-ascii?Q?h/VPM9cqQwmQZHPq8xdaRhh/9fnNrVaAPUwCaDELnPlQGL46mk3CzXIlnAxL?=
 =?us-ascii?Q?s3JRbRWOu/6G1XklLBOpzVp/Hg8mgw/xsg3WmzwlYZ+qUve27Rr8QEOKgUZX?=
 =?us-ascii?Q?agnTNqjDgDLF3G5SVGmLCUK7LK64/TFm6LhGiduZ8WfT458Bg9/98PPSjjkt?=
 =?us-ascii?Q?wjjTxovryJSFOKprHDBECCDEi3jWIAObHvCwLxHwKpjQKrhLE49DD9uwXo+a?=
 =?us-ascii?Q?3Di+OqhUB/iRbvOLF9XGeftiRumaNAdXyfegUJrW6zdSGVcrHwSY/9Xo7fr/?=
 =?us-ascii?Q?cjj8EA8GX6YEn8hWbX9dfqgi4Wp2ST8GNdZWDPEtxCQc7vvDYPIoizFIV0nw?=
 =?us-ascii?Q?arLSt7SdwTRKdpA9V9ybcQGCLR+BEkFMfbK4/iKwx6E/EBforRAOvCbmAiic?=
 =?us-ascii?Q?kN+sHhd1XX1NUd68xYU4s8SAOA+lUeNAWSEH2VKTEB4VtDnf1LTiyx/l8Id0?=
 =?us-ascii?Q?LqeRXBE6YYftAm/sZdWx9qwL+JQjzHIoncjMZzdwdZ1fyt8GUi85d8ZEdP46?=
 =?us-ascii?Q?YLejHbXg7MNRE66ZP0W/H0b748lWXZ7B3/MES1bg?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 998e1d75-6c54-43e6-b0af-08dcd1669ea2
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 07:03:06.1840
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vtYs33HkzLwnUy6RO7IfnCW2mmwmOIQIesL9W0UdQUA1U5D5v3tjh8NOLA8ie/qkFUGkHavW/eVINEAYoBonyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7099

The usb phy in i.MX95 is compatible with i.MX8MP's, this will add a
compatible "fsl,imx95-usb-phy" for i.MX95. Also change reg maxItems
to 2 since i.MX95 needs another regmap to control Type-C Assist (TCA)
block. Since i.MX95 usb phy is able to switch SS lanes, this will also
add orientation-switch and port property to the file.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
 - replace minItems with description in reg property
 - remove orientation-switch and port
 - refer to usb-switch.yaml
 - use unevaluatedProperties
Changes in v3:
 - add Rb tag
Changes in v4:
 - no changes
---
 .../bindings/phy/fsl,imx8mq-usb-phy.yaml      | 42 ++++++++++++++++---
 1 file changed, 37 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml b/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml
index dc3a3f709fea..6d6d211883ae 100644
--- a/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml
@@ -11,12 +11,17 @@ maintainers:
 
 properties:
   compatible:
-    enum:
-      - fsl,imx8mq-usb-phy
-      - fsl,imx8mp-usb-phy
+    oneOf:
+      - enum:
+          - fsl,imx8mq-usb-phy
+          - fsl,imx8mp-usb-phy
+      - items:
+          - const: fsl,imx95-usb-phy
+          - const: fsl,imx8mp-usb-phy
 
   reg:
-    maxItems: 1
+    minItems: 1
+    maxItems: 2
 
   "#phy-cells":
     const: 0
@@ -89,7 +94,34 @@ required:
   - clocks
   - clock-names
 
-additionalProperties: false
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - fsl,imx95-usb-phy
+    then:
+      properties:
+        reg:
+          items:
+            - description: USB PHY Control range
+            - description: USB PHY TCA Block range
+    else:
+      properties:
+        reg:
+          maxItems: 1
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - fsl,imx95-usb-phy
+    then:
+      $ref: /schemas/usb/usb-switch.yaml#
+
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.34.1


