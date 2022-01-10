Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DF9448A0DB
	for <lists+linux-usb@lfdr.de>; Mon, 10 Jan 2022 21:20:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245756AbiAJUUC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 Jan 2022 15:20:02 -0500
Received: from mx0d-0054df01.pphosted.com ([67.231.150.19]:30795 "EHLO
        mx0d-0054df01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S245674AbiAJUUB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 10 Jan 2022 15:20:01 -0500
Received: from pps.filterd (m0209000.ppops.net [127.0.0.1])
        by mx0c-0054df01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20AI5rmP001632;
        Mon, 10 Jan 2022 15:19:57 -0500
Received: from can01-to1-obe.outbound.protection.outlook.com (mail-to1can01lp2050.outbound.protection.outlook.com [104.47.61.50])
        by mx0c-0054df01.pphosted.com (PPS) with ESMTPS id 3dgp68r80x-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 10 Jan 2022 15:19:57 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dCnG13tCyhV+VnLgqn3ksKximjB+XRjdUXe9Je5LY8gcA8U1MrlMXONcBSq/j4efjfdoi+mkVnJozVZxXAEYpXb+OKIWATnpVF0aFBuagKVU1/eZ2b5ig9lEO91iPPpgDvdq+20O7RF/wIgjV7GfClK4+Q7jHL2SzAsf9ciCyKyInX07po3pysyOI+tgPbETtgdM7ju9s/74I/ha8C7L1NeyTDqUm/0C/z6KWLJHQGQmBMLbB+clH/XpPDSabLd0UKr0PbIIlX6qx6Hs/pd8DHfI5ZHClpisaIA+e9bWsM6pex0XMdpQHWNg6Qud9Gs3TsGhH5xarF74TQSn09EPMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lYYoL8ENqXn8/yzpo6DmGcjV/PxdJYZrbStIiLXDXEE=;
 b=OA1i/BQ+MCJ+Y7GZLZPIlgc37WzIZe1ABUWPwXzo30/xfUlMjukDmoYh4++OzutA1Z3h41MwV0DwzWDiJW5RRNUhayDjdxfHnDzFI3AVkxCU2vZgwHMzpl5WGdZiyzIEyvmVTnPDobSpXr7PYsR1IpsYQyTxjhRj/A1ZfMTverqNAAsbF71VR/MFJ1rz2eiMN5tBJD1KAWfaZ9iuuydI1FDTlry/Rnbkl2fyvPi1JSY8u3s74qGfAcXspAEUOEJ8yx7CWb8xJT5JAXW03c+Fl2yW3oZW9fOsAe+DhdkNwmBpnms+JJSrh4JhdaCFms6cpXurkPojyAeN6Gc20RYtYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=calian.com; dmarc=pass action=none header.from=calian.com;
 dkim=pass header.d=calian.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lYYoL8ENqXn8/yzpo6DmGcjV/PxdJYZrbStIiLXDXEE=;
 b=RBGUiGUfAR3xTnWRDz7G3dSBk2fH+Uva4bwW5NZGA7DQq2GW9SJSUBofhjMetCz1FNFmnyhv1IMR1EokeiTyYvqss9F9bDaSvHX2r1k5Y9G03CjBXdF9DHrvasu2yJYXg6wD/1bh/Yvwd3WqtY2YAtAbtOCk5QTmrU8FUe4rnVQ=
Received: from YT2PR01MB6270.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:4d::14)
 by YT1PR01MB8505.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:c4::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9; Mon, 10 Jan
 2022 20:19:55 +0000
Received: from YT2PR01MB6270.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::4441:49c3:f6d1:65ec]) by YT2PR01MB6270.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::4441:49c3:f6d1:65ec%9]) with mapi id 15.20.4867.012; Mon, 10 Jan 2022
 20:19:55 +0000
From:   Robert Hancock <robert.hancock@calian.com>
To:     linux-usb@vger.kernel.org
Cc:     Thinh.Nguyen@synopsys.com, robh+dt@kernel.org,
        devicetree@vger.kernel.org, michal.simek@xilinx.com,
        balbi@kernel.org, gregkh@linuxfoundation.org,
        mounika.grace.akula@xilinx.com, manish.narani@xilinx.com,
        Robert Hancock <robert.hancock@calian.com>
Subject: [PATCH v3 3/5] dt-bindings: usb: dwc3: add reference clock period fractional adjustment
Date:   Mon, 10 Jan 2022 14:19:34 -0600
Message-Id: <20220110201936.1371891-4-robert.hancock@calian.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220110201936.1371891-1-robert.hancock@calian.com>
References: <20220110201936.1371891-1-robert.hancock@calian.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MWHPR1201CA0002.namprd12.prod.outlook.com
 (2603:10b6:301:4a::12) To YT2PR01MB6270.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:4d::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e2a8ca15-7984-4118-5c81-08d9d47690e6
X-MS-TrafficTypeDiagnostic: YT1PR01MB8505:EE_
X-Microsoft-Antispam-PRVS: <YT1PR01MB8505F8B34AF5227C9ACA26C1EC509@YT1PR01MB8505.CANPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vm3bUrFWCHCTBMHOWQWrl2c3MkcpBCoY2XLT2DFN2eg0tCjoZCq+0aled3qH4mjQJ8Fkq6K+4pStDssSnts4g4mF4QjC66j6DU3+ujvZhvNKA1bQlelBozZu0wMk0N79vlpJg4SWyNBq1Om+/w7Z5c/IGi6/mMAWst5FbDMK4DSbKzj82/yqQbjWVtJVT57fWSzijjNwxFQvM9wUqTg1ZZAyEKqvo6swFGbU9rkPM471YZKPTxg58iQh6X5KC+t3kFWWXRq/PqNXMz2OKk+inz5dEhSdTGMNHbqgTQGY1BCKn/wtfYyxH0sc+FZ3Cxtut/HZBuZyIw3AH90ALCJfa8ZCrz210o4/+ngbgdJH/AJTvJFf5/WSl3BLx1t72qOT4Lf/fnu2MsYAqnHdFF1ICrKEg5M9omt3ilp68gyQhPNnKFhya67PoAdJdJaryrvukIZvscSB6htj3JGhtUQUWxWQHFOBuryXLHY+KvB/NM6CPEv5a/IWLIQ46ehJizv3T5HAjeQtckSETYEWY17zxNkdwBiJUEdfSsNnITCR8jG8KvPek/Wmc4fvf7J1hHZdJXioBnnQL9/ldi7zwJrAzjxQaaXSfhUpxmsQLbAy+HCYKRPZXU5vvpcSw3cbUn4nZa37+M0w/C2F9cLQmEtX2Y9QjqPsJt67dtZT53O5rfPLTX7esFwkQeCAB3h34Cy3PzelvnyZMvxigrVbVPO5nw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT2PR01MB6270.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(508600001)(1076003)(5660300002)(6506007)(2906002)(6666004)(316002)(2616005)(4326008)(6916009)(86362001)(83380400001)(107886003)(186003)(52116002)(66556008)(66476007)(36756003)(66946007)(44832011)(6512007)(8936002)(6486002)(8676002)(38100700002)(38350700002)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eET3PeaHDn2YxZvsTzCFAJv5tMPRTPnKFoKTR5iOASaY6lxUb/4JveeRoVi7?=
 =?us-ascii?Q?srHEP6+czYM1LxFadlJTpYJVpwd15FRIeSO1TXUtDrAJgJK1Twu3mnQ2y2Lx?=
 =?us-ascii?Q?FncWcIxCfWrkD9gNYlL/3+baxQmRFr3WnFZNMNKGsXhVGo/lql9gMAkWuCk0?=
 =?us-ascii?Q?YXt5BQddvrmAnAfaYCKNN9Spji8NaL4RfsIgOoDyuWEq2oyMVrXaEX85wo8N?=
 =?us-ascii?Q?SRdBIF81fb37ev4yit1VJZOcdfzJsluwGRyvgSwYilKfoGxEGmHJBFx2+s0J?=
 =?us-ascii?Q?QzCBvnkBlVMR37AFHCAfMF572q9314ljedSU0vuOFzPhdZDyTURaPMTGZSWW?=
 =?us-ascii?Q?3eR7upajPrbeC7vaKM9oswi57OlJwBx19ZQjIk3BEHIm31sCwhqtEo4ptnUk?=
 =?us-ascii?Q?HghUIlDypb/szPnO5xiP2wPWY65SWMUI1OPZvWffBlRtMcWv5ugtN6ITlFU8?=
 =?us-ascii?Q?6/dmTjNUwkOcGdJFvzFU+aRt14Y4yC0ce1AuIp0u6ZpyHCUrKCQ4vuVevzgq?=
 =?us-ascii?Q?Qb+okiK1ISCfZdWpu5xmPiwAoMohIkvVVnttDOn092G45Pxc0meDwyRd7o9d?=
 =?us-ascii?Q?QCYXvoKQPh8m7I7vWDto1yFUvT9TOW8JTromf0u6MRXfjUtTCquEldu6Kc7u?=
 =?us-ascii?Q?RFWzW3ECTbIq73eBjL0fEFxlnjwTg9ldw9ANy6pGvZa18XnjAkjG3PXRydZA?=
 =?us-ascii?Q?BMHaVgfOL3gZhYjKltUcwCfRGOD1k48On5FEMyJwJUw9f1IFKHHoUlQCZvM5?=
 =?us-ascii?Q?wY53CQD3itMISmiJ01D6yFOp5O3Ekmon4kWPE6j23PWEjaOPWOGTV1AsvIsI?=
 =?us-ascii?Q?UUnSSX9pbmPfB3enbIoVUOHZZL7jabIeCCiyEyARoUPuwbNZ+jnE//L9BZnG?=
 =?us-ascii?Q?ku7XReG11jvNw7fb+v8CiGkyrf50DsmptkSnJF9oBcWSPKCwmOWJH5xhKQ+Q?=
 =?us-ascii?Q?DrW7krYLUSSW9lDxe5FKtY+tXPBZ4A+3bBIi+qLkPV72GulEZ75tnW/qexOr?=
 =?us-ascii?Q?zbJxDe2DjXQACckqNmAxl3qZOncCd+BPb4TEtDdcZe4nS/exZazv3U83vSQy?=
 =?us-ascii?Q?nliplHv8LGlasQmNzMEV7WGgYv/C15QDv5QXN69iXuQmErhH0a80ayD8Lroj?=
 =?us-ascii?Q?XrieGb6Nnol11jtU1FVGvAYARxOnEWFsWlzhHv059DbjCpdPEruCjQqYc8gG?=
 =?us-ascii?Q?Cd1kWolsFy9U4fu58RqrPsbZMqD5ewVH+ldNV1nOBX1ZavHYiCfW6QrhjT3e?=
 =?us-ascii?Q?uaORLIw4FA9LnKztk5SHLMqUPgXePTI7AwZZePEYqwmvmru7irugjwMVeriP?=
 =?us-ascii?Q?x9eEqP3KRzqwEhsk1s9hA1t471WEzogcEsAfaan/imwZ0Uo3r0kaHmZ0/Zpm?=
 =?us-ascii?Q?EflYT9WQ9dfiVDuuiPX4lHcv9m20iksXOOSLQabBCJyV8QzoTb/9kO63BSvk?=
 =?us-ascii?Q?NQldHZyTa0P4p6Y5g3IZppQbsoZOd2jBBLafCaBoFCcUs1XS1hTHhVnRCSxX?=
 =?us-ascii?Q?pW+1E0lSuD+fpnk7kznuL3IL95NyRgdGRCo5kFjEJ/k1z6ANl8sHCIAnyPi2?=
 =?us-ascii?Q?TYWoeL0SkFMV7RReq7XMszgcyn8zCYy4gW48aoDDkaST+/BeNTMzdmA7BBW/?=
 =?us-ascii?Q?GEfr9Mli0bOBeTHyf7jzCNOQT3geN68XS7aSaLjiCMK8N0kg9HRXOZxwnVED?=
 =?us-ascii?Q?GEaToae6Ud0k/yIZgHKDUGXTw2g=3D?=
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2a8ca15-7984-4118-5c81-08d9d47690e6
X-MS-Exchange-CrossTenant-AuthSource: YT2PR01MB6270.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2022 20:19:55.3755
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /zdbuKbtE6+IEu71hYrfwPt2QI2fzuUafYAT3u4v8ABYMOl8Y56S1WGrTJkeGm2cgYhMgJeAEW8itE/t0qbgew/zWNGlwz1EcXwcIB9066w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT1PR01MB8505
X-Proofpoint-GUID: yHnHbaKi0Y_jOryhVtA88tDHGEo3UiPq
X-Proofpoint-ORIG-GUID: yHnHbaKi0Y_jOryhVtA88tDHGEo3UiPq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-10_09,2022-01-10_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 clxscore=1015 mlxscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 bulkscore=0 mlxlogscore=714 malwarescore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201100138
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Document the new snps,ref-clock-fladj property which can be used to set
the fractional portion of the reference clock period.

Signed-off-by: Robert Hancock <robert.hancock@calian.com>
---
 Documentation/devicetree/bindings/usb/snps,dwc3.yaml | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/snps,dwc3.yaml b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
index 25ac2c93dc6c..88d8d831e04a 100644
--- a/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
@@ -260,6 +260,18 @@ properties:
     minimum: 1
     maximum: 0x3ff
 
+  snps,ref-clock-fladj:
+    description:
+      Value for GFLADJ_REFCLK_FLADJ field of GFLADJ register for the
+      fractional portion of the reference clock period in nanoseconds,
+      when the hardware set default does not match the actual
+      clock. Calculated via
+      ((125000/ref_clk_period_integer)-(125000/ref_clk_period)) * ref_clk_period
+      where ref_clk_period_integer is the period specified in GUCTL_REFCLKPER and
+      ref_clk_period is the period including fractional value.
+    minimum: 0
+    maximum: 124999
+
   snps,rx-thr-num-pkt-prd:
     description:
       Periodic ESS RX packet threshold count (host mode only). Set this and
-- 
2.31.1

