Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA1C459BA55
	for <lists+linux-usb@lfdr.de>; Mon, 22 Aug 2022 09:34:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232107AbiHVHeI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 22 Aug 2022 03:34:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229987AbiHVHeH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 22 Aug 2022 03:34:07 -0400
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-eopbgr60073.outbound.protection.outlook.com [40.107.6.73])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB25113E37;
        Mon, 22 Aug 2022 00:34:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RN2Xu5LE0h4CMlIv5s6sJoAwKrItGYn6fQF0ET7OqRxEda0cI1o2dEniVnjaZNBLs2sp+k9WD0+up41ANDcTPUVgRc1ektTPA26wxT2D6L1PyeXzB3T37Oem6lL7KekGWya2+IZwCwAM3EwmDrcjVQqIKRVXVQDSfYrZdX8P+IgcRdP1rBBjsBjMgUvSOumO83pI3mQrs3YomRGJWXe2wRuoziYcflabp6xqaBV/8Gj9lzA8oM6icY3WpOr452LQvEUo2I9IxPws81z08A8MrF5oSPeHf8QLgPnVD1YKUuaGNQllTaGz9WBtvHu7u2j+cvCx2VfwArj3IU/SSpjJig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lhkJwv5lSpjISGi6XtvovAFceQS5R4Xat8havDNeYks=;
 b=Hv698puCPLT7Szx+S4cgwrbL7uWsjEXaHCI0cf6ioI6RSwMHGYBHDwas52isZV+jX3BjmhOGSXfXjaXL7qJMawfAPkXk+DUpHeUwOYApRG0KO1nyfoNb5apYqYZzP/L8HfaKL+kf0mtOqBtc8RkGwg/G1n4nEweh6qeNTZ9GrZ5/f7ESWTFPOJuzNfmDaJ/yccgThuqMr7fQLuBj1L7hXQZk+V2eUfQQfNoPl2Bta+/oSoC4kysT8Gy7daKwINsh9ZNzYI+KXjbIcMqcWkQGDy9n6mfl3z1jzNIrep+OTObOiiYgL6eG6lheI4oOdOeWoED5D+WJ5tTCcOztNHbdvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lhkJwv5lSpjISGi6XtvovAFceQS5R4Xat8havDNeYks=;
 b=OPlg9EaVbs7Y291vtCNrWqc6cVoT4xacicaFoqEmOEmK7LmfU4/VbV5vdCn6gWKkJMoA7NstGrrUsVOTZzJORnD5FD7h0ihgONL6EVRONfBwd90dt+6wP+p6PRm6iLNiTkDuK+wPVoba6pG64f/Wizqpw0nTRet9AvKkIQX6lQo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8784.eurprd04.prod.outlook.com (2603:10a6:102:20f::23)
 by DB7PR04MB5530.eurprd04.prod.outlook.com (2603:10a6:10:83::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.21; Mon, 22 Aug
 2022 07:34:04 +0000
Received: from PAXPR04MB8784.eurprd04.prod.outlook.com
 ([fe80::60b7:af13:8472:2e8c]) by PAXPR04MB8784.eurprd04.prod.outlook.com
 ([fe80::60b7:af13:8472:2e8c%4]) with mapi id 15.20.5546.022; Mon, 22 Aug 2022
 07:34:04 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     heikki.krogerus@linux.intel.com, robh+dt@kernel.org,
        peda@axentia.se, shawnguo@kernel.org
Cc:     gregkh@linuxfoundation.org, linux@roeck-us.net, jun.li@nxp.com,
        xu.yang_2@nxp.com, linux-usb@vger.kernel.org, linux-imx@nxp.com,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/4] dt-bindings: connector: Add typec orientation switch properties
Date:   Mon, 22 Aug 2022 23:35:14 +0800
Message-Id: <20220822153517.3747679-2-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822153517.3747679-1-xu.yang_2@nxp.com>
References: <20220822153517.3747679-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0033.apcprd02.prod.outlook.com
 (2603:1096:4:195::20) To PAXPR04MB8784.eurprd04.prod.outlook.com
 (2603:10a6:102:20f::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b1fd883f-3d51-4427-de95-08da8410b069
X-MS-TrafficTypeDiagnostic: DB7PR04MB5530:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: d7AshOzXb+WN64w+jZ8g2c8JWJ+K7VTcoN+Y/6Gl3xygyhU0GWQbgIBL/E5/7vy8lDYfvY9ouUEvmadLTn6xfCBDds1hQs5fEPQyX+35ttotl+SqhVZKavGNkB0Z/bsScOcAlnEnvEQaQZ523wb1HoZeCMuFmN7iyWCzzn4nz/58oepmDc3Wx4Xn5bxDW07yGdj7ZuBYUCQHxJ9/MHUmgNYhYBv/L2+1yvdtP6apF6RI1+jdtc9I7L51Pk28rcB57w7l71txpNZ+RP7iZ3JCsOBE+gEU+gSwzLac8GoJyZLrG8MsgGJMn81ft2xiC8mcsfF35WYDR4payuv4vY/4SLhy+98VUL888HvFMWu2o6uvQlpoP//DO5Lx/en1dJsy/cRxbEpuP4N9+INary6sTGINDdYJWw74Rpi2hOvvIeuU69+VOZYKOm9i7de4bTHelhXV1hm5NPRN6JN4rZ7dHdnTmdhq1IvzVML1dRi6jo3jBodBDAnmM48j9suoRN95oVdWTnbvvfwApj63zP5VP7Pp5TFnd85dy2QJwYhrjSZgfIr8pU+stvVkiI1269sOP149Gek7DxdUVLHA9Lr5PS4NxaNfCGS6f7/GRsD+0LJkbVGkYk2FiipVLZnqvvflI4RHZ0fDxBL3XzGjbQ+5rGj6wsocCRukq8QsJ34gIZVTmA4Psr/T7pxKkR1+FwgDJmPYmh6wiThgwcMckuDg6fhUnVyPsPvTZh/AT6/ejYLF8lcTRwEYvNQ8sfqQCVrcQMf8kakhzxtC+XKFKZnBTA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8784.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(396003)(376002)(39860400002)(366004)(346002)(2906002)(8936002)(5660300002)(4326008)(66556008)(8676002)(66476007)(66946007)(316002)(36756003)(478600001)(41300700001)(6486002)(38350700002)(1076003)(86362001)(52116002)(6506007)(6666004)(6512007)(26005)(2616005)(186003)(38100700002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QJ+h+lmRiZrpNqlLCLIlZxctdYn654Gj3n3RDsPLCTgMQZ3vww6cRVUMtxA8?=
 =?us-ascii?Q?GQvnQBMZME1eSXh5R+IdllbObjGthhVoMeV437hDdRa7gC10+piKaeF8lqoz?=
 =?us-ascii?Q?QXnkZsKeFWucHD+C+V7xxA5GZa5zlGtOo0g7Wnb4NumDDCcVOQf4x43PYZ9F?=
 =?us-ascii?Q?/G9pxgndGFtKyWcCLhQ+w/tnnG1hUCaqMSih5D9Q+pORaOKn0K1Wd1kyqBLB?=
 =?us-ascii?Q?cotOk918tiqbHnu/ucmt0CBrYbg5HI1oePfxgsyVXlRwYqY7fvW4jc4PYFIw?=
 =?us-ascii?Q?jw0rGERKHhVU3CY/kCLllSG1dNN+Cbl7rd0Lz3Ya13GwzGb1W1mGDkt8P8d0?=
 =?us-ascii?Q?z8bJ971pzECnnWeeVVCZ80IKvl/mjvP57WiOUkDKNrQdLm63djyBn2ErpicJ?=
 =?us-ascii?Q?IDV0+FgmwowQ0nesfQ3nQkzNmrpshsFDNAiI4+uDByGTCWa7H1vv7bw+MPIg?=
 =?us-ascii?Q?/TCx9PqZcp4FA9egJI5ZDSNlXEBGS2SDpOYfKKkxiHyoxRFNGoOhE+wBwDja?=
 =?us-ascii?Q?X07ciBn9QvuVUJBdDiSbeatzYhdqrijXQgYVSd7Q5TIZifFqiZ/SVULykal1?=
 =?us-ascii?Q?zysxd6zfrmgor63wLXebr/T+4wppV/UDtNn7ZytybaTBZZGC04ajUN8KDRPw?=
 =?us-ascii?Q?3S7scQfUoEpXtjpVZs0tVkOt4c7j668La0LR6Gvy33PzMVOhFqBiBWA1muVe?=
 =?us-ascii?Q?A9uwhF0Ko2ATeVQajUIgKV3zLrButlIrxZ4YFG+dywqQTjaz+wpniUqUOMfK?=
 =?us-ascii?Q?nMtZ+pjUcncWjwmzdsGQwQhaoX07L9Jkr/7gQF6CQQOKR6Xtsi1L7t+Uq9jS?=
 =?us-ascii?Q?DdfR0Qav2oSWgk1Bz5wKLvoMYKnlJWx/eiENRUQpWWzB2ppiNHIyuyX2Grqh?=
 =?us-ascii?Q?Ytn/pCLuX6UX8o/UCCU/I91WKFxC3ELYfq8zyCepBQUoH/m1cZlnV9N2RS9A?=
 =?us-ascii?Q?v6v/o7DiwXvaKAt6g0OoiQpw9sjjclGOi6HoOp/8FuzO+h7tDAEboJiP7Upl?=
 =?us-ascii?Q?WYIUUCWMsjuc2DWjyAqoglRZh3nw7o4WrY/ZmQ7+qrVcUr/iMvUF9p7oeMHq?=
 =?us-ascii?Q?xpo9B5VnOROMTsebSrEYDNElQ6+2MOR+azywN1fiwFR8VNEZizW11Qq8VwYT?=
 =?us-ascii?Q?MEhjBDIo/7pn3s/YQZqZR8/uxF5OcdDy0QgLM7DL8Og8NQ+7qlsucfNSK25u?=
 =?us-ascii?Q?/Yu4nQ4vYdhFVSWJOcQT2aG7sU+EoHrljMi2+u9i3WvGEzPuUet3+qNPo+me?=
 =?us-ascii?Q?OPl8AJI1t1pquibpdhcQyW3j3G6DfExmA57f2vuZfNf0eYRgihlC8dWb0TIs?=
 =?us-ascii?Q?pFaKiWEIQlSPYvLGT38N4l/r4bjrFPOAkPEHWucoYnM4zwqYC/vRJlkxMM4S?=
 =?us-ascii?Q?RSwisy+1wpE0I7ecor9Va2PWY3g45CCBmJRqz+yyTuKvmX82ZIptVjnBNv+G?=
 =?us-ascii?Q?K8X0ZmUO3yHJnS3D7CKIDTyoRKdAhgxqRwv0RIHoHBgRXhaK/Hfynn8efRPh?=
 =?us-ascii?Q?oGjCWnxKhcJa2TFD/VqhK0meL4XtXEyjysiQRhVCigvK258Z1xyk3+/b9851?=
 =?us-ascii?Q?0g4gD7yUTZmmE0YMqK1bnq2hZqgoQsEChMeR4l1K?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1fd883f-3d51-4427-de95-08da8410b069
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8784.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2022 07:34:04.2917
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SmqIPRPifWXbYMz/xNuRwmRzOwtXk05Ba11YLuWl4tcoAKxdomS4UUNY/MwG6eqk7psICpeaB7mYQVi5lgF2bw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5530
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DATE_IN_FUTURE_06_12,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
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

