Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED9BE59E544
	for <lists+linux-usb@lfdr.de>; Tue, 23 Aug 2022 16:42:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241570AbiHWOmN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 23 Aug 2022 10:42:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241430AbiHWOlz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 23 Aug 2022 10:41:55 -0400
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (mail-he1eur01on0604.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe1e::604])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97A3D2D0976;
        Tue, 23 Aug 2022 05:00:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SzxO4+4CQRLleOx3BTm3jHk70BrxLkImddRtJlQ2V3d/8OrvOFbhurhEwIfJxwTZLsGVrZ8OkDra8+KA6cFbVx5RR8bsubVO+mQVtssV1hb9DLwgH5M61v54NT32GTI/lipisAdAWv2LwSTb2anWeqQJ1njq8+UoDm4xF+NBpXgjaOCx4y9OnUOUwcMEmyaMlA47K12wVqXnP+aB85livlEcF7A0pxKyf575mKcXzQOtUQTaah/OtL+2FWaPQZAox0AlNNqSoLge8flgFK39Ev8JEOC7InhoiKKvgW6o72t+cgOAKhbMYJKnjd6pCf/go+JKLnhr4Qx91ZttK89iZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+LLbE1Q6XPZaP2naT3ealao5u80azla42tVcyyT4V0M=;
 b=GNKG4DhDAKGdHB/2aRzdkyZ/M6B+D+AaFPRcrT7yiqR4cxEcosAuPgQ03+iFvEj3y5FnTomVJZSvn/mAl8kZhbQfK6Ni18Nie8v7o5KPQDqmXCxzzh54JFFlDFIjgEAzs1+8ZyY5UBxphai88nXHFgdGdOedZTxniiWcWXh2Igwxp3/FyG8vwGoBqbLPcE7h3Tt/XR4qbYtUxtcKvi0JzZCJadmXbyTQhx8fwB4eH2kNBJLVgW3J+TK0gbfHx8Bws5jmy7nvkTdryURZdTaeZrO4oR837b/rXuIP4W1d1mh6Tmph5OxD/HgZwX/xshtQ5eq9xqh2fiKWo4nx0arb6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+LLbE1Q6XPZaP2naT3ealao5u80azla42tVcyyT4V0M=;
 b=p72Z+nwQaO12jYEOL+xqJyX3tPR8GgHHyojSO6euADDF5x1FerHOINI6TsdI9VeQgjSlelFK7G1Ux/6QG7Xn9yVevE/op3bL7locsm9YlIeGqkzzKKYuPe3+UHG+i6AxufDqYHrGoBrnG0WVl7F3PfwXMJ6grQLfQq0/bi/oXIU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8784.eurprd04.prod.outlook.com (2603:10a6:102:20f::23)
 by VI1PR0402MB2720.eurprd04.prod.outlook.com (2603:10a6:800:b3::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.22; Tue, 23 Aug
 2022 11:53:15 +0000
Received: from PAXPR04MB8784.eurprd04.prod.outlook.com
 ([fe80::60b7:af13:8472:2e8c]) by PAXPR04MB8784.eurprd04.prod.outlook.com
 ([fe80::60b7:af13:8472:2e8c%4]) with mapi id 15.20.5546.022; Tue, 23 Aug 2022
 11:53:15 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     heikki.krogerus@linux.intel.com, robh+dt@kernel.org,
        peda@axentia.se, shawnguo@kernel.org
Cc:     gregkh@linuxfoundation.org, linux@roeck-us.net, jun.li@nxp.com,
        xu.yang_2@nxp.com, linux-usb@vger.kernel.org, linux-imx@nxp.com,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 1/4] dt-bindings: connector: Add typec orientation switch properties
Date:   Wed, 24 Aug 2022 03:54:26 +0800
Message-Id: <20220823195429.1243516-2-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220823195429.1243516-1-xu.yang_2@nxp.com>
References: <20220823195429.1243516-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0155.apcprd04.prod.outlook.com (2603:1096:4::17)
 To PAXPR04MB8784.eurprd04.prod.outlook.com (2603:10a6:102:20f::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 66fd00ff-cc2d-4590-c13b-08da84fe101f
X-MS-TrafficTypeDiagnostic: VI1PR0402MB2720:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GSiZgEbcx6jhe7MyU4Z8jUCzNKyloxC52xEGH+fWCQ5UfnsLwZx6IdmShuvp2/kI4rduM1v6shrXGD9fJbY+/J4b3P8DNcQ2p6oCVGDygnBIMYYc658HrU32ojoHzzCfxgjjIjWo9hN8U7sVxogdCNtnmer8P7wgeLlOY6RPrJvYGWgu2mnWKPSJXlaSIJlUDohsJ3uvMET53moZivC0DI+nhe6uFN7TMX1g24BPYHZnGnvy8r1SAINdzD+REKijsjMbzznpuJ189pJja+chlyAkCNQqJmYGDOiCa8QeTVJUtLv+UmLtk1JIeEa8TRLrm8bAi0ILFMn+jHDeeYidlIHtrgxJVt2VmKRmiqtFeid7Gld7vCTBJFMDlK0EO6ZEZsV3jiOd+DWWyQq2GXrNvhNpY7thVbs1Xh9BSHPpGPo5taIBGJh5F+mg8mgvexrAaJLTgUtkN08IG9wsKNsnNSALLaBt9m++sbHB2/ev/57i03drzjewmk+RM8AFhUIx1wivOfzCVMgOz2CDcNakOgOq7wraT+uvAFI+UDVjrdOCoGm3p3G+PUdfj9AIozgTXUbxSyahm/yQdYou/pNoxrz6E4vcRuoKQLJc7iT0z69V19DxDTDfJ+4ubQTcxMDJgj8V3aVQxszT2PVVlkaZvylYf3TPi+pT2VXeSwugzTsXoGzgJj1tYoOR7Z0OdfXus703GbLzR/Aj+gx7rVeCYdB/wfTvrtmq6BH+ZmGhrItYYv36AlVbpQGo2QemHoIl
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8784.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(376002)(366004)(39860400002)(346002)(136003)(66556008)(66476007)(66946007)(8676002)(4326008)(86362001)(38350700002)(38100700002)(36756003)(186003)(8936002)(26005)(6512007)(52116002)(1076003)(6666004)(6506007)(41300700001)(6486002)(478600001)(316002)(2906002)(5660300002)(83380400001)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UFkSdq26jkyub2jAt+G22SMLo+jIcQtwJ3lYiyC3ad7NVQN3m+HdYpEhVYZh?=
 =?us-ascii?Q?jM0le7qFzp0hzWEZ5K30sFqPF0Y3NjxdSoSp3aXf7fzE4TevoCPgVPiz1Arg?=
 =?us-ascii?Q?ArGriUNZ182KsRjfQ9pYCU2y5Ynr5PRKPw1718lSw2DvscBLeEulSWoo5VzZ?=
 =?us-ascii?Q?1CL4ZrapcFFGtIgpmoxxLEWBA8vcWWjv48Fr1v37r/dKRAxss4jeM5/HE8db?=
 =?us-ascii?Q?WX2+czKIdOO03QyO2hkaA+BbrT6T175b/QwGzBO8H5n5imx7cuafjLZ004qG?=
 =?us-ascii?Q?5Gap3aMlJFMjiwLp7oi0w+2Gi/xIjeVVZWhB11Hf1KiJWfhaniqV5pe5uyNE?=
 =?us-ascii?Q?d6IhesGjOy9JXc/xDFR8/Xv1JtPsuze/tNulRL8W+zJwsZAtNA73uwLFlPkN?=
 =?us-ascii?Q?+iagpfrnJbH+lKOHYYcfNDV2krUbx6Ue+sIBcUxzGT7snstXp3joswg5UmfN?=
 =?us-ascii?Q?Sj4ZMsgksBn9r95nZthDciK662ZWWokfpd3TlSwxvwsnc90xJ/S/4o10KEb0?=
 =?us-ascii?Q?uK5yGwhqrheeHI+BhF2hzkKfkLi6oYbLRLawbJxPJeI7ayabPCo2DwEzfqcX?=
 =?us-ascii?Q?2g0FDDKMORgdXEpOsKlRCPPlBFnTgkTQyegR9zEhF9N5RKUBSKodzcwo1jgF?=
 =?us-ascii?Q?uw9M/8LqWw9D7jeSDd/ghxruFTlZ5IDxGUMJLHgNqmF2y3URJTqQdt3U7KMo?=
 =?us-ascii?Q?6q7laLFuCHbCbpPQAQdyc0qmReALhd9+DTyef1fxC3CR1kJG/XMX+KGraRa2?=
 =?us-ascii?Q?b6uEZwm72bPFHRZY4OcIWnwt5IBIdFh2fGMPjrHiWvAsE5cXiRQHIij3kX7U?=
 =?us-ascii?Q?VZ9Hpzgc2uslCTnryH+XAHP17Ax74thu4NIZK/wSC2HbZXA4f0kkxfGPR+u+?=
 =?us-ascii?Q?2rmjwUI0iCGySo599hHoMgO+/4/jZrU4uJXDNyhojRq3cCnrHDUTtCdzAo+V?=
 =?us-ascii?Q?XhaSXNt4Ij8PfZBN/SmZEX7HMKMBdtA5trcY2RBalceUxdAJWhbl8BK4d9WT?=
 =?us-ascii?Q?tpHsiy3CC3r3u5zmgZcnors/47bJpEMQ98ztHbtfmTyu+5nuHNCgN8rZgx2z?=
 =?us-ascii?Q?E9W2H4YxubV56AxnGNcybDviI6yPPWWCqd3Vx/UD2J3WOS5/Dij1TPtGNrHr?=
 =?us-ascii?Q?SVviW2HpuyfN+xpGUy8sMu4owNrU/v3EzX+ou15vPyU78GRyNjajnti55RRR?=
 =?us-ascii?Q?JyjaZw4Hs2zgHShETaWgOwTcz9nuXrzycOHRQzE9XFMsCDktznuK4rnHJkoh?=
 =?us-ascii?Q?c5MgxZpWcre5LHfB7e6wa6MdMUdXXfm+Sk6wScnfU73Gics8z5PIS6teTX9P?=
 =?us-ascii?Q?qnTxF9ZxH6mhmUmy/j3U8cR/Rol+t+EPRn9xUSmLeZFywVUcVAgujWTqIv4E?=
 =?us-ascii?Q?FQq3QlEjFQOYfPR/eVT/s4rOs2ajQjRbLEm+fzH5suU0SuxmMwd6TcMmUyDD?=
 =?us-ascii?Q?7Ui3cL7MCpl/TeiupcFsLOxoAXmN4FIoY3Q3dQQQ9soAEXxElUzZcs5ZLhr0?=
 =?us-ascii?Q?TxzM1ubU6/9u0jSb8Ki1REfM3WouRi6ij+DEcazFqsrTB49XwWegTNdGgWaG?=
 =?us-ascii?Q?2kpBRLugUm5tMejVWWj5U2bjV5ylKfekE/YhcMi2?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66fd00ff-cc2d-4590-c13b-08da84fe101f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8784.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2022 11:53:15.5141
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hFO6Fp2eCqHsRPNJMKSZxH2xiRW41Jy1Y7yqCZHW3TpSG8Px8X5u1nnv2uNvE3HOIpxrwGUfiaJ/m/oL4bKjqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2720
X-Spam-Status: No, score=0.8 required=5.0 tests=BAYES_00,DATE_IN_FUTURE_06_12,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        SPF_HELO_PASS,T_SCC_BODY_TEXT_LINE,T_SPF_PERMERROR autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Typec orientation switch can be implemented as a consumer of mux
controller. So we can use mux controller to control simple gpio switch
or other types of switch. This will cover the following typec switch
use case: High Speed, Super Speed and Sideband switch.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes since v1:
- No changes.

 .../bindings/connector/usb-connector.yaml      | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/connector/usb-connector.yaml b/Documentation/devicetree/bindings/connector/usb-connector.yaml
index ae515651fc6b..47f53cdbf31a 100644
--- a/Documentation/devicetree/bindings/connector/usb-connector.yaml
+++ b/Documentation/devicetree/bindings/connector/usb-connector.yaml
@@ -221,6 +221,24 @@ properties:
       SNK_READY for non-pd link.
     type: boolean
 
+  # The following are optional properties for "usb-c-connector".
+  mux-controls:
+    description: Mux controller node to use for orientation switch selection. This mux controller
+      could handle High Speed, Super Speed and Sideband switch use case one time. In orde to do so,
+      besides mux settings need to be properly configured for each switch under mux-controller node,
+      correct states should also be assigned to typec-switch-states parameter.
+    maxItems: 1
+
+  typec-switch-states:
+    description: An ordered u32 array describing the mux state value for each typec orientations.
+      Three states correspond to NONE(high impedance), NORMAL, REVERSE respectively. If there is
+      no HW mux state for NONE, use value of NORMAL or REVERSE for it. If this mux controller
+      handle more than 1 switch, correct states value need to be caculated according to the mux
+      settings.
+    minItems: 3
+    maxItems: 3
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+
 dependencies:
   sink-vdos-v1: [ 'sink-vdos' ]
   sink-vdos: [ 'sink-vdos-v1' ]
-- 
2.34.1

