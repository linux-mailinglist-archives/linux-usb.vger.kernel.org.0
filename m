Return-Path: <linux-usb+bounces-14080-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF3595E9F9
	for <lists+linux-usb@lfdr.de>; Mon, 26 Aug 2024 09:08:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 87BCD28108B
	for <lists+linux-usb@lfdr.de>; Mon, 26 Aug 2024 07:08:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8ED886277;
	Mon, 26 Aug 2024 07:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="nZMBitZX"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2072.outbound.protection.outlook.com [40.107.104.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA07E3FE4;
	Mon, 26 Aug 2024 07:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.104.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724656115; cv=fail; b=udNAyYnSZdr9nj1Tdf5fGz2qMubAl64YLkWZtzWI7eQjSYu3Skw+/q67iqTA7iVgh6wr0KXn0oYFa85zt3MVe9lOITZ/uS8HFQ2fp81AifQDbNYveKH0kJeGMPBCIeApEQ31DuYXV6z6Hx/odRZcXXpGLISLa0KBbxCC3qnmR0I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724656115; c=relaxed/simple;
	bh=3BIhKyy52T+RoYfzp7o2AJwlTig9uknR5LlB99drP4I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=msFGQyzm8sZDUBqcrYzBtRA0to8DJYKejRwV4Uzy463FTwfEfTWZRicQgHkS+S4ib7DVxRham2HCqyRwTNR6maWp+AA/2+hN+/zOgtq1FHnnKRbpyQZSwuNXaqFhjirhExpsVS2cpTOy8DNeoSqH7f6mFgjMxzL5Si5yHobxRJw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=nZMBitZX; arc=fail smtp.client-ip=40.107.104.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j/ZCjSW53A3yJYY6OL/6lurFKqt+sje/Y4ZH4/mKto4+f1lAJeYyvFSVXgg2nRQA5friKcVVs6pVM6gtJA9Q49kpaAlfpBDZeyjp0bA+ncWUrBnwa14rjlrPSi9WAB1N1EocAmaCJC6WP23WrTtMUm1+NmEWVsZHRovpRWGuLmy68jmqWEeAoBsb7zhVyRbEi+a66gzsxtTNJpFNlQjzjynkWDlvptrwWHdqf2dU8b8664wfstKV5A9q+Pup6fecdvBgZDgyafr+zDjwfsuWbV99/VBjjjCsJu1FjCBDZ9z3WZ6NSXPmYRxw0RKRYzBqGQRTd/Wh0i5AunDvhKvJBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g6l96Tlx2Zk6CpCxmkaWzI6pvlz4tAqOkW9DYYRKQhM=;
 b=NiZsBtNyX2R18nCrFBwT/1FASyLlLaz7yANlaBWFzJHgIAafU8q6x+h/4euDh8z7H9PAGBQJo59QVSuf1bhpcuiuARjC+ccHgBSnNSDIeezmfJDN2ZjxfQU3Sl03+OSvffkzXXj+YCRMiDR37w/TAzWAms3rfIIWAZGCGSfcH7iCMHsRxfd2CqJBXW2QDm7/pnUMZDwzsWeJvvnlgTYstjoGtqsrDECRbuKz76/BLq99YyR4edNAa8C8EyKmzWj8S265duD19L/rm05w0Rnn0noUVdk89sbzQ42Be/2GUdSo7tFyjmb9NJT34gbvj1WgVZWMZo//Ls+lqXQpg6OCIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g6l96Tlx2Zk6CpCxmkaWzI6pvlz4tAqOkW9DYYRKQhM=;
 b=nZMBitZXX/dZXs6Sr1bAYnR6aGus1NoaqgMx+whMjLl060g0ddHbYASKI77oDPft+njfj4fGMKZ/jCQCrGJL2RimufU8lYwfSbPGaUS5uDuPpTDZZwom9R7pQjKJC97pebm7Txi21xsxGHRALnihE5VUKgZioMC8V2UWqvQGB5Gf0Vfd2ooeYv+WyGM3reRgNhiIP2ygUrqJ+eZswbe5rLKeRPjsU+qaIPvWN5bpNCIAicJpZLKyYSbNJtau9V6073xtShB6UHhoDhYoci+qNNJcglqDHzyFxrx78phQ+Hq6sfor9UGsuuroInVdzjuAk5oE/7KCGZpJJj8z9XUObg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by PA4PR04MB9637.eurprd04.prod.outlook.com (2603:10a6:102:272::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Mon, 26 Aug
 2024 07:08:30 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%5]) with mapi id 15.20.7897.021; Mon, 26 Aug 2024
 07:08:30 +0000
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
Subject: [PATCH v3 2/5] dt-bindings: usb: dwc3-imx8mp: add compatible string for imx95
Date: Mon, 26 Aug 2024 15:08:51 +0800
Message-Id: <20240826070854.1948347-2-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240826070854.1948347-1-xu.yang_2@nxp.com>
References: <20240826070854.1948347-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0194.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::22) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|PA4PR04MB9637:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f6c0dc6-8513-41a8-c12e-08dcc59de36e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?D9wxRwx6S2wfQfv0b0wB46rz914AamktMclVylwg+5G8XSfA/G569OwFwAIJ?=
 =?us-ascii?Q?EsThoccdLVh+ujA/NChkYBUR7x1JZmcIkQtRC2iM2E4UyG2mZDWo+LCrCX7f?=
 =?us-ascii?Q?zj5wZfEVZHMWP5z1NwbhrmVrh1QAYV1D6dsxlW9bi0haiIxZDb90f/r9E1Vm?=
 =?us-ascii?Q?k+oUNt0yOUEz/kj+KS2lzAiHZRj/iORaczcziEvLrO7zaubyNdBmU8LRDolQ?=
 =?us-ascii?Q?sxITma4QxUzGY5GHusiBVDys9XL1+B8MiF5u4DhEtFk4i9iUvJjX8GCX2wqC?=
 =?us-ascii?Q?QhizZtJpGhn/4KXGPh59GeWdtiiKPnQdhZpi4hRSaTKJIOVl5N9xCrXyhF8Q?=
 =?us-ascii?Q?sCi8bx03PyCKppkUyHyb11t/eA7KVvfGptxOV2ULyqFFeNKavhrrohF0kVuF?=
 =?us-ascii?Q?1gUCS0U7jTRVxaKRhAtV4kAOjSSA/9gV7mNtcS3hTK3JhvquBZ+df/7gK/Vi?=
 =?us-ascii?Q?Gqd30K1Yz0H5hO0M9Nwa+NEquEPhl5ItfOHgXbtlsmlskUVJIPVpYjf83GjI?=
 =?us-ascii?Q?F5cWa+iRZ05FP9umblXYraBae5I1pEg7N9fh3A0Kp3X/eHSxcSYFHG3cDCcW?=
 =?us-ascii?Q?v/5slrQN9wdXsxvO7hs2UNPKS4JUgF/DaCY17bFn2zAxlR5Y8m//BUhA7gTb?=
 =?us-ascii?Q?1+BFGzw9N3q8iZObDzkcb4OFkkQDJpq01vICBXMJVUANaPIP7+gWyIt9qQeI?=
 =?us-ascii?Q?J70HZASHsgjsCWX7Yk+zZ7ucWi4i6j90zxXhTADnorvahVKYoP4ZbNZqr1bs?=
 =?us-ascii?Q?TITaG0ips/jndxdbTms7yq7UiWW3BLOnKEcovqPSnDysdMtsAomWFOjOtEHK?=
 =?us-ascii?Q?qiuqrWa6Qn2+YNZVQ/scVUpti0Sq69UzEg/9JdyTeGa9BwmGw7EO21blMFkh?=
 =?us-ascii?Q?6fvTZ6jJeHmLgwo8mXvRHu4O3dEucH+OVoCt8WPuWv4zszQb/PHPOrU0PTQT?=
 =?us-ascii?Q?+nbAi2anGpaZGTw2H0y8SK5fONs8OEYhETOUn7x1pzqbRBBNNfoROHJdmbGq?=
 =?us-ascii?Q?CqEMDF5kp93pob61TeWQwDBohxEPaQ4uRETlCS4HdQF8mNqNs+K2TMp/9CgP?=
 =?us-ascii?Q?K0iwMaLkyj7PV0BjfxRlTFouRi14A7ZmSa/wtF2KDwYpkfEPVwZ7KUqdCT/N?=
 =?us-ascii?Q?uavaw8N94axzLTBbA+IyH/RW/yG7nvDtrSZoVXUrJFZQLYeUTKd6XNqmLwag?=
 =?us-ascii?Q?2BBd8Kiy+ksPnvY9T9T28gygkLMtrB8CO1jF+4YtFWyy7wP7L2T1FnPkuFoR?=
 =?us-ascii?Q?A4764l+szr7M7cDhkekpw/FW+gmqjTf17w3hskh//lIMQ3qJWDL+0smHC79t?=
 =?us-ascii?Q?cmqcSszI+wiypT54AwVA5gfN5zfVH+TcUOzR1danxcHMwWCVQ5g+UItCUPxB?=
 =?us-ascii?Q?jJTdHrzIn+4Z7wHE9cW/S5djG4mZ9qtWV7E1Ec70DmLJOxAbYoE7dIzDRgmb?=
 =?us-ascii?Q?7dPOn+BkUaY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Lnl/uVir6YJVKWBLV2wZuFUWwrY++SIsN33HkCXiD7UzJMLGTfdW/3TN3eJA?=
 =?us-ascii?Q?/Cs8agMM3B/MP9V6mcxKV2AOJ7fnPFRicrjmXcHFzbRbindDD53lfok49dgR?=
 =?us-ascii?Q?+Tz+bY/34+KT4zUK7PMGD2ayHpzWVY6X17BWgs+9KkwFzY7HSLMWuUsz+oLb?=
 =?us-ascii?Q?5ePZoK9tXOyAeuJ6c1a6ZsF8lIicIkJoYCsUIse29KmY49H/oqCvmGitvfAl?=
 =?us-ascii?Q?k5qp4vi+56wisV7it5xugzC94QG+i2TGxDq8iqhpzbgAi1XT5x7RP4REnkwS?=
 =?us-ascii?Q?SOjb1ZRXBfHhLjWgGEYL8M+RgXlj6ddNLK86zsGo5AM0w41dZMB198wRIKoN?=
 =?us-ascii?Q?CdI7+MZNjnWrpnK2HJg3Hyg3nvk4wXJ78DB3Oe875n6kIhEvWGzfkL/6HCfd?=
 =?us-ascii?Q?ZlX9i/Z/U1Qb9G2X+O/EJVFurgycU4BH3CwShNzolxximaX0CwxkskA9fsov?=
 =?us-ascii?Q?poG2JiTv/Iai6yTo0w3saDqNvV/gkgElIkLtqE4v9ADl3p5solif38TZFk1u?=
 =?us-ascii?Q?NpIZDeKm8/lfc1u99lcvElGemcdJcszgz13yX+atfgA+PB8YC97AS2rF/RgL?=
 =?us-ascii?Q?SfXjlEswc6t53T/RL1CNdnTMeJY6ued73c+eeIXOGz4NyHFJfnPB5owwxOYc?=
 =?us-ascii?Q?ltQkAqfGYoU4LZTz9nytwa0uz5nF5fIinRVLNtNa4xEgeL8eLqd6WIPIvOQw?=
 =?us-ascii?Q?Jr4RYtxBluJVV/weus47RSiToxxUxPU1B86Jl77Opte2TW5hVHvOMulY+IV9?=
 =?us-ascii?Q?axcaCQSRwoas42Es6NZzqYJ+oj7uBBxkDnZ/m8C4mcJCWbLTZI2MYi3X2nXC?=
 =?us-ascii?Q?lFon6rSCBHukB6b39sk5IE+fCE3+CDI6okUsE1lvFIkj4BnpaiCNycM4VY4Q?=
 =?us-ascii?Q?Vp0I9PkD7v/QR2HggYlTujLKhX+nKFszgXjPeiOfYuL0cLoL960ekW40FsMU?=
 =?us-ascii?Q?EUwNCiKrpnu3y2st0CpFUE9tt9bkDmb3SbGc0yfQTjKYqRI7GGolJuenFh9V?=
 =?us-ascii?Q?rGWXtoimkBlUb6zYg1E+iMkqlOq6x9FjX8qe7kXZJlx1JIPAOBt3zWcCA17/?=
 =?us-ascii?Q?YvCtLzS4T16un56WzVMPcV9QwoYDfLKG3Y3Szw8oQJz3Y9eyrWqcCyyoiBKo?=
 =?us-ascii?Q?77WJDFtma5ORcSJbKrRBw+88wPQjwKAWqj/yWoQ8tnrbmPhyP6Tchm35209k?=
 =?us-ascii?Q?fjkj7J9VwSfVWoku00pBHgKwdAeuf4OMxAy+XUHyzyD6Xv7OvtaVL+oHaSha?=
 =?us-ascii?Q?BxT2agvmOOsskE96jjHlczhOj9rFg4/iDCdc7zbvegJEsMMTROqcUWsuUtHC?=
 =?us-ascii?Q?5xKY5c5Iq7WqDu7Rcrl44V6cB0HIWnlwvslfPtqus0wA9tJAqYTYZzJhRxr8?=
 =?us-ascii?Q?db9KTk6qNZvOYpyaiggOpYaQmePyJSSYTfP35Knt68+SefO3yIUV+V5+KEoe?=
 =?us-ascii?Q?Bc+Djvj6Pmtw/wr7m7cNxWkuaxDudrad8ZHXvdVZH/J+z/NW3svD6C/vHesF?=
 =?us-ascii?Q?v7vB0Wo7lZBJ2+Oy5LgvV/IRU/PDiqDJpXdTZ9KYvg3XOyf3zmqcTaS6ruxW?=
 =?us-ascii?Q?ynCfAQ/3FlvpUQMtEz3LNXgH8N7KnoeaV1m5kkQO?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f6c0dc6-8513-41a8-c12e-08dcc59de36e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 07:08:29.9540
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KuSAUFheLETtfd4YaAGLCwnbVJKeCVo5lSyIyvyw+2HTJVXPOCYqEio+Np01tEFT+UL94ebCUVA3YuqiZsGmKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9637

The i.MX95 is compatible with i.MX8MP's usb controller. This will add a
compatible string "fsl,imx95-dwc3" for i.MX95.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
 - add Ack-by tag
Changes in v3:
 - no changes
---
 Documentation/devicetree/bindings/usb/fsl,imx8mp-dwc3.yaml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/fsl,imx8mp-dwc3.yaml b/Documentation/devicetree/bindings/usb/fsl,imx8mp-dwc3.yaml
index 9ea1e4cd0709..baf130669c38 100644
--- a/Documentation/devicetree/bindings/usb/fsl,imx8mp-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/fsl,imx8mp-dwc3.yaml
@@ -12,7 +12,11 @@ maintainers:
 
 properties:
   compatible:
-    const: fsl,imx8mp-dwc3
+    oneOf:
+      - items:
+          - const: fsl,imx95-dwc3
+          - const: fsl,imx8mp-dwc3
+      - const: fsl,imx8mp-dwc3
 
   reg:
     items:
-- 
2.34.1


