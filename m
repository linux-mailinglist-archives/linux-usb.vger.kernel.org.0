Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B791873FAED
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jun 2023 13:18:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230113AbjF0LSt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 27 Jun 2023 07:18:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231578AbjF0LSa (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 27 Jun 2023 07:18:30 -0400
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (mail-he1eur01on2045.outbound.protection.outlook.com [40.107.13.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD4D826B1;
        Tue, 27 Jun 2023 04:18:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gqae/tcewuAul8ZXdQtobOLHssIgJwHAUWrtf3HBDvo0Pd9b6sAGsEg/iVbpuzoXxTXLxqXkI9NfjcKV1vkC1WoyQGzQapxnu5FH1TF3CM6s/C8c2mBvbZDYOATG+Sn4wTt04xq9ZsnBhluMuq+q/hkNbtuClQacz65O8CegPtRLaUA2jCuxTIHipOwzM4MRWpC83ykLvQIQY6GjvrnWra6nW81P/B5NU3RFeZBPpuWscifAzUYC7YTgXVvb4BaaKVG5T7F6odEMmNudRcoszNuvEmakdqGYcGXOs/zWkaBgpi6EVJZ3x9SUNLL2z+m9LCwDDXfP91Ic8PYrah5zhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iVlqUdQ/f/vGG84cFDBWPwYd9G4exBnOFL9iIOCrBXU=;
 b=WNcf/itr5VhoseO6OvKKLc3UjJL7l8yB8oBCWql/gFfJ2DgIHwYfh0mjLA0/nwcMQhQQ5+9Po5XwytNA+h7+nKb7Umzfh6vJ/3ZmpU+b5jxDEnsqM7Ow4cAs5L6nJhEV+wjFcclUWKBy7CK9RdKj6xksP+u4l9neoNE1ruh/Xph1zLLAl5UTTs22dtOqAEDl5lng/FjwCxr979CaipYPy0s9L6Bm1tIIfUFSG0laMbFi7FP6NiAQKf5HxHKwlhIcTJbMpqjUSrCb4ldqct8j8B7wb4fSVPqqHwxQBFwbjO59gJXHHieQh/gv6UF1cPt8Pdna4kFDOSpN93It+g2/zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iVlqUdQ/f/vGG84cFDBWPwYd9G4exBnOFL9iIOCrBXU=;
 b=sV6DnPHyS56SZlLzrV56Q7w9BhZ39/Ik3XmbYX7L2DEaphIFUphvqS3CXxutMH91xU4u9SIradcen/Vf5N0ZAzoBPmAYGzcmE4Udv7LX0cNoUaDd/5pp+8GH3UV/XZaJzAtpWmJ9cCuVCZLfHfqaOexJvTmQ/0fvzsPjm3dDXTE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com (2603:10a6:5:39::26) by
 DB9PR04MB9332.eurprd04.prod.outlook.com (2603:10a6:10:36c::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6521.26; Tue, 27 Jun 2023 11:18:26 +0000
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::f9b0:8c34:e57:92a4]) by DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::f9b0:8c34:e57:92a4%7]) with mapi id 15.20.6521.024; Tue, 27 Jun 2023
 11:18:26 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     peter.chen@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, gregkh@linuxfoundation.org
Cc:     conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
        linux-imx@nxp.com, peng.fan@nxp.com, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, jun.li@nxp.com, xu.yang_2@nxp.com
Subject: [PATCH v2 2/3] dt-bindings: usb: ci-hdrc-usb2: add fsl,picophy-rise-fall-time-adjust property
Date:   Tue, 27 Jun 2023 19:21:25 +0800
Message-Id: <20230627112126.1882666-2-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230627112126.1882666-1-xu.yang_2@nxp.com>
References: <20230627112126.1882666-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0002.apcprd02.prod.outlook.com
 (2603:1096:4:194::22) To DB7PR04MB4505.eurprd04.prod.outlook.com
 (2603:10a6:5:39::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR04MB4505:EE_|DB9PR04MB9332:EE_
X-MS-Office365-Filtering-Correlation-Id: fe16b59e-7174-440d-5c1f-08db770039f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nuy7wUzVJSysyTAaqimn7mEw5rA+oGcb6Wp7aZuAo/3/xxLYRB6BBpe8XG9cV4nhR4wl9Gv1JDSvc7G8/8v+tB8mLIFNuu7kXQ7NTVHqkE4aRzP2zt5r7ARNtzI746mhklRwmiyfpAyHuBnErOu0Hztt4WZ06bCsb+MCadNltS51wFioUyJxiuWA+GYxxeqZLd6AHnmRdBB2nzPG8hmy2PUFD4qQqp6IpXao45N5/uDWJcMaimtBXKlaDS9ekp5npl5dREfy/AoqZYMnXbzl2Jc5y5gZMJw6/kdWo39qZiENERTb1jF9cWDA/VQOERWRR5aa6hB1hWhxQMpIAubTXjIJzX8Je/Y07yaOuo6wDMKJgowquvkTmmf70mvPPFEgqhTjM6cxbg8mOaZ0UxE0yp7d4QbLgtIo58CFZPjQxMVhn1v0ADiDFsu4SazEFGwW4HFOfZLOllUeY/BwrhhmuoHqG+eluYfV/7MaaGMtiUecqqT/9xH715ADfl2hCKJvR4Q4pX9n9w5TyZPiZOUjJv2+MKQgRXSDl2o48mjH+YyswGbJPgA7b5N4UlKLOiBZk83EnlM+uXrw/apHBud1mffOmtD3ERCZIqi+0KLp+cebPVA8dI2iVjwFu99DSBtw
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4505.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(376002)(396003)(346002)(39860400002)(451199021)(2906002)(186003)(38350700002)(52116002)(6486002)(38100700002)(2616005)(6506007)(6512007)(26005)(1076003)(41300700001)(86362001)(316002)(478600001)(36756003)(66556008)(4326008)(66946007)(66476007)(5660300002)(8676002)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?O59iUdR6QqDls4SW5MiM/Pup6IehnYgPlfc0Mp25Ckq4+QdZ5sxqPu4uLirb?=
 =?us-ascii?Q?5XAJUXK4ruzZtZuJfarZpKNNQtl17kTTeVsHMhCm4VZnx12GJHdjYWPLRs6w?=
 =?us-ascii?Q?Q08lqO4sGTmUwTsnkxnsVP8tAD1W8kDBRnJPsZ0fV5xiQMhjvI4m3vCKdVde?=
 =?us-ascii?Q?nucpneqJ5OUAJbKSe1E8iiXbkRQZMPGnmT/Pr3VK/dL7XHh5Z3AXX6cbgxEm?=
 =?us-ascii?Q?IvafdU06D8gpT5YAbxDE4D4BlDs/Glx0yzhH9xGvpZgQ/H6ccig0alxL4/Ok?=
 =?us-ascii?Q?5FMZAxskNPZKZsfFxs5N3tnsPcUQ3OR73aGAV7KQ5+4BAbRCBZVPgfLKNFdW?=
 =?us-ascii?Q?hTScY4zbiF7mKA4JHKigWI/tdBTYMCp16ssOnZ8hIxwwDaLQ6LcLf8G/IkFi?=
 =?us-ascii?Q?PoqOJ/a9hLScWF4h5kkBYsxkH3RymW39e0AlbpqJG51McH54djyybrrMGQKT?=
 =?us-ascii?Q?wSxLFvSIMyRIFmvXyrSiuHH0OGXXR75YlXo2EFR4i6O13Q8kdV6nNLnp3e+J?=
 =?us-ascii?Q?6saQ5KivXsOk9BFnthvASzBSS/tI8EF8hMEHjWDylh4k8q7oT1qgLfJfdyTO?=
 =?us-ascii?Q?vzOzdl1XaEZ/GYr+ZHBgeITX8VbtJypik0KHrrAa+3a/eI2/bkPtygBjpXv9?=
 =?us-ascii?Q?StocaJNC8d5YJgnWJnxitJnLb6x/2yP/F9oxNcV1Ai855vV0/raewHwwNtc1?=
 =?us-ascii?Q?BA1AcLNieJLY5h+pkPL4hvZihhaDY5lMjRhv3CV3ARsucpr9QF9m2ieKVZ2V?=
 =?us-ascii?Q?CQMdsZ0th9Cf9gwOxSmvk1nj/kt0Cg2oBys7HUida5hkdwf5qtB3R1gIoJDa?=
 =?us-ascii?Q?zAWYyWSqHfPcbv9nmKF3o0bd+3Tvby1YlWnKa1+fMq63TcOTgNm/vT1Xf7T+?=
 =?us-ascii?Q?DNfn+xtE4l041zeOCTSRtRPyysFwtPh6JB9tYt3QyHUlD8l9QZmdppm3T7k6?=
 =?us-ascii?Q?V8Q1K8CwlYijpbtlwGQHWYkpsFlCfGoxbkypvA1w6xL3fBDVKqw4jzzvKUND?=
 =?us-ascii?Q?AYWR2/f3g6toJz8LfmaAgjTfMk+Xc1annLZYDoBQGic6dT8kQwKwMQ+nd9vd?=
 =?us-ascii?Q?+jd6DS6aMzf3FVepPy3JCjz//9HzBbms2aHW3a3sPc/0H8txo/RMU7JttISF?=
 =?us-ascii?Q?bk7oRnwppu/ym2ZnnQUw4NigmRwiytEqv3Untpi8D0M4dXKh2qw8F2ixOXkl?=
 =?us-ascii?Q?0PW8TQBp5vCS3QS9b4KiuLXgTn57XqOOC6DsKtji++CNb9ImSxex5Ci/kmZK?=
 =?us-ascii?Q?ZptgwXUhhscdJAS9nOTded3QddxtBH+LHIAzG19J4pczXOKTRQBOUemIScJE?=
 =?us-ascii?Q?tLw8u9RIgU45HSwe3MSABOyffOANh9/8GbiMeqrcQIxTbzBLr1J3S0IplXds?=
 =?us-ascii?Q?QigfM3fOkQp49e8ewffsD2KmjSL2iOTV1866vxc2UFehtJSW9xr9HijFW/FE?=
 =?us-ascii?Q?vNzCJLyfGA/u2tM2H6naQemilVEyYBOtOZzbz2sLJ4KvZp5A0iSg5TB9Eu/N?=
 =?us-ascii?Q?P/4J29D2/hdsvC/Bk1WBAmPj3R3F9s13Pogica0NJMTswGRtJ1N57nZnNeUJ?=
 =?us-ascii?Q?ngtyIEO70r/RjkFEhQ+B0EW+C27XYIiBZA1HBmDJ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe16b59e-7174-440d-5c1f-08db770039f7
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4505.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2023 11:18:26.1886
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JukHCa+iOZTIbVx4Jcpy4X7/22BvcDKV4VuyZBf3lxJazf0HFCXNsMv0j0poxkYN/H/ZB4qh/6rCM9eRZ1Qpqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9332
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The fsl,picophy-rise-fall-time-adjust property can help to adjust the
rise/fall times of the high-speed transmitter waveform. The value can be
0~3. It has no unit. According to the description of USBNC_n_PHY_CFG1
register, the rise/fall time will be increased or decreased by a certain
percentage relative to design default time if a value is given to this
property.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
 - rename property to fsl,picophy-rise-fall-time-adjust
 - add default: 1
 - add some description in yaml and commit msg
---
 .../devicetree/bindings/usb/ci-hdrc-usb2.yaml        | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
index 782402800d4a..532d6464c8b3 100644
--- a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
+++ b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
@@ -292,6 +292,18 @@ properties:
     minimum: 0x0
     maximum: 0xf
 
+  fsl,picophy-rise-fall-time-adjust:
+    description:
+      HS Transmitter Rise/Fall Time Adjustment. Adjust the rise/fall times
+      of the high-speed transmitter waveform. It has no unit. The rise/fall
+      time will be increased or decreased by a certain percentage relative
+      to design default time. (0:-10%; 1:design default; 2:+15%; 3:+20%)
+      Details can refer to TXRISETUNE0 bit of USBNC_n_PHY_CFG1.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 3
+    default: 1
+
   usb-phy:
     description: phandle for the PHY device. Use "phys" instead.
     $ref: /schemas/types.yaml#/definitions/phandle
-- 
2.34.1

