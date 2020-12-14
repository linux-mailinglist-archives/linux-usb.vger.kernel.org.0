Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A508C2D91DD
	for <lists+linux-usb@lfdr.de>; Mon, 14 Dec 2020 03:52:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438018AbgLNCvl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 13 Dec 2020 21:51:41 -0500
Received: from mail-db8eur05on2073.outbound.protection.outlook.com ([40.107.20.73]:20864
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2438033AbgLNCv3 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 13 Dec 2020 21:51:29 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LRthw3oDNX1xLuYYkELcBDqCw9qYrdTp/1KvaZAh9d5wW6mmEDT9UTqqKRblNotH/GshZjmruKuei0FbdpLr4I54aLiu6eyjTTOmNquGjacjLmTH+bOxDT1GNIEEebJx0BU3Fs7OlqymRRoi0fZ+TlPO70CFhODHBHAuUE25gX5TASBTM7tViT2qR3qBvwgOZRAiVqS18i4nV7MZnnH8HgrzF0JxDGYkWNfEokv+AQo+JG/+Vx/MD2C1rQTDn7opjHFuNDkiyZuO+ld0oY6LMgEMoo1kX6o3FcxZcE8fIag20hxpzl6RcswtTo0WLnjkYd2im8lU0kRrO3rYI1lfCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NcW2jExdTX3oX+/UGATTPFLyBDdFizbbC3k54k6KcDo=;
 b=kqtOngKTvuNPA6YUPwKSCx8Flihkfdzt/DYCccEmvt+UdPvr6ZWZTh4WH0YKsvQNDzCXZ3JFE6P682EZmd9Canv5zVNP4oyE1Y6DfMWHP/J3rpL0fpjGq+BPXGKIyAouOhUqpu6uZEJ6B/AaXeQNQNqEWDaz4CHGkYoQkak0xfct6jpZMBc7QJNE1D1DjQpO0ByDoD4VYtGPayLt07VECATP0GZlIL3BbA8AqVbaIeUYww8ygqhlD5WBuoTUmNTo6AVj8jCUp89bYwgd6nXXuqpTrvQEW4mocM3xOiG3VdpK0rKp2OgmRk+A1v/BX8cZznlYgoe7jZFkpONqc9oseg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NcW2jExdTX3oX+/UGATTPFLyBDdFizbbC3k54k6KcDo=;
 b=mlAGQUisxc7XS3yLjDC8ucYCReQ/HdFuHGR/zF2+Ne1z8g+8RrghT074q4uojqOPH1iatpMO4AbSOtf+pYpWmEeGupCFRruzBZARV/9bVCi6oq64vw/roDlg34SAHDpGBtclkScBWaZYGwl0r/PbVZN87MgBMCFJp1pTdcN1mfU=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com (2603:10a6:803:127::18)
 by VI1PR04MB4591.eurprd04.prod.outlook.com (2603:10a6:803:6e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12; Mon, 14 Dec
 2020 02:50:38 +0000
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::b035:d158:c99c:57c6]) by VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::b035:d158:c99c:57c6%7]) with mapi id 15.20.3654.024; Mon, 14 Dec 2020
 02:50:38 +0000
From:   Li Jun <jun.li@nxp.com>
To:     robh+dt@kernel.org
Cc:     heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-imx@nxp.com, jun.li@nxp.com, peter.chen@nxp.com
Subject: [PATCH v7] dt-bindings: usb: add documentation for typec switch simple driver
Date:   Mon, 14 Dec 2020 10:42:24 +0800
Message-Id: <1607913744-27217-1-git-send-email-jun.li@nxp.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: MAXPR0101CA0005.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:c::15) To VE1PR04MB6528.eurprd04.prod.outlook.com
 (2603:10a6:803:127::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by MAXPR0101CA0005.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:c::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3654.12 via Frontend Transport; Mon, 14 Dec 2020 02:50:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: bfd2ac43-e934-4d1b-fa37-08d89fdb09e0
X-MS-TrafficTypeDiagnostic: VI1PR04MB4591:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB4591750678411D2BB901E01689C70@VI1PR04MB4591.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZCK9qbTiTz9wqWJeppl/kKmniJAN5m6Fn91KlUPIcp9Jw4YbjJgapEjmsJpvXEzTRydb9MOYWVnPiUmAmUgvlmy960qlxadchtVAJ70TwKf/rntM+GRnjUvyshqImANPuDpuFveCGZj0AN7lQL7DP83qZYMpdsC1yKl15CyfEbQoVqiZf6Gi+hjfNOyG55wvYBvKnL59ZLDE2yBWOPlstqw8ozKJ7pVvxLogmMUgJE9b5ixXT/XiVgu3FY144eBBNvKZt/9TE7lM9TInF6Ma17hcXnqKKu4l6JDblskv23dmB+RrK/mjlsxsb/lr6QfrRRNp8jYgSf9c5tSaZsOokHnF7v47Mf4QVHxexn3lr9xHg+sNIml7uc/f5oeaZs4MAMGeusuRb0RbkpeKj3sGBS8MK4Ss1kAos6R78keKDnTCWq7Re7s1po6WlniMYpNh3PVHxjduORTGUBi1tOEGzA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6528.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(396003)(136003)(346002)(376002)(366004)(66946007)(8676002)(478600001)(66556008)(66476007)(6666004)(6486002)(316002)(2906002)(5660300002)(8936002)(6506007)(26005)(52116002)(6512007)(4326008)(69590400008)(186003)(956004)(16526019)(86362001)(966005)(2616005)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?gsZ0B5Qqxy0PtzP1qdWzNhF5ys9r6XAeP01PDY0MTQGCTRoy3DZse3dG1H6/?=
 =?us-ascii?Q?MfBYy5oZkt5Lk2se4bdEWVNul2QbBnC0Z5aUhCpNPvITCMI+MyyKRttk5TZ8?=
 =?us-ascii?Q?Bxu6SBDlJXguf5BVCYyewEAkGYXV7Eho4qTC2c6Qjej9WTpOBJCyjxmLT3lw?=
 =?us-ascii?Q?RECR1aV5QpVag31pDirJZtoUKG0GgI0yi7z0RPEElnLlF6IkShAtCI42xk8l?=
 =?us-ascii?Q?FzOP2YSADlphHQ734QPvOTYe5/ihi4/Y2AJWlkjjhJB+2fTH1MQcjAUUYLxs?=
 =?us-ascii?Q?UtskLvsk5EKHYwdMEjf70gDJpR45Gx3ja/xQQgstXkpYg813prm8y76p2x17?=
 =?us-ascii?Q?zbB2lKiWKG2MbEttdo8KWi7OBeXLpGRaVmllFNvX/IDKVLE76rkd+otDkUqM?=
 =?us-ascii?Q?xQ3mk3+HB4iX23ia8VtgDumPfwZP0BA26uYesMwL4ovuyH9GnTFzq6pTZP5n?=
 =?us-ascii?Q?I+IvLa2AgLULWDcS1QnCwaPm9LGh6yK6lSwwNDewhS46BqXpFh3+7VFN53WC?=
 =?us-ascii?Q?wt7l9W+5Or5NEzSgJkHUJfW+Y9wg4v731vz9jjnkwiVpam4ass9lhpXU2mEu?=
 =?us-ascii?Q?Gj8Qib4PcZvT/NCjmGMxh0jhJN7yP3y5btsswxk0d2fJKVCqTbiv4YN2SftG?=
 =?us-ascii?Q?2D1i7rsPYnDHFtPqORnTfeKJbgrApvzVQPvPDHTjKJ5m5UTFxoJofNmXInIq?=
 =?us-ascii?Q?BqO08ciHaXJRsEDTQ9R4TVPiEvU3yoOG1ESi4/1hjyhqwtgccsjVOXrEXjr/?=
 =?us-ascii?Q?sggnLSOSYCnRH6sii2P+mdmyhsf1E+htvn6ERWyPwNuumlXBVTN+w+Oz9YFF?=
 =?us-ascii?Q?Ehp3VgjZ4HU/NsywzGyuRZUmQTehhzhOd4dbZbYE1qlW9h8hWCEWG985w6h5?=
 =?us-ascii?Q?VK57OA81/udYaElZojm8G9WCjpf6c0JzzoWQanPk8MurH8WWTr9HAwu/gDBf?=
 =?us-ascii?Q?ZEcuq5eKeEfNh7r8yWL7uq2okUlybLuHAugp7NHbcbWMQLmpLDTZRHRH5b01?=
 =?us-ascii?Q?hIs9?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6528.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2020 02:50:38.3659
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-Network-Message-Id: bfd2ac43-e934-4d1b-fa37-08d89fdb09e0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XgRzANCppTcW8P59jl5puLxpE7NVfDmCG0PwUMGBiGtAWhB6rB9TkclQeZ3Fsbv/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4591
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Some platforms need a simple driver to do some controls according to
typec orientation, this can be extended to be a generic driver with
compatible with "typec-orientation-switch".

Signed-off-by: Li Jun <jun.li@nxp.com>
---
change for v7:
- Use existing mux control binding node for actual typec switch
  control, and new typec-orientation-switch as the consumer of
  it to provide typec_switch for typec subsystem, this way typec
  switch can use any existing mux control bindings and no need
  change current common typec switch interface.
- Only send this binding patch for v7, will send out drivers
  changes after binding finalized.

changes for v6:
- Use general mux bindings for typec switch, one typec switch
  may have 1 or 2 GPIOs for channel selection, if 1 GPIO, only
  can be used to select cc1 or cc2; if 2 GPIOs, the second GPIO
  can be used to deselect both channels or keep normal operations.
- Add one more connection to usb controller.

No changes for v5.

changes on v4:
- Use compatible instead of bool property for switch matching.
- Change switch GPIO to be switch simple.
- Change the active channel selection GPIO to be optional.

previous discussion:
http://patchwork.ozlabs.org/patch/1054342/

 .../bindings/usb/typec-switch-simple.yaml          | 113 +++++++++++++++++++++
 1 file changed, 113 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/typec-switch-simple.yaml b/Documentation/devicetree/bindings/usb/typec-switch-simple.yaml
new file mode 100644
index 0000000..ae1ef87
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/typec-switch-simple.yaml
@@ -0,0 +1,113 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/typec-switch-simple.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Typec Orientation Switch Simple Solution Bindings
+
+maintainers:
+  - Li Jun <jun.li@nxp.com>
+
+description: -|
+  USB SuperSpeed (SS) lanes routing to which side of typec connector is
+  decided by orientation, this maybe achieved by some simple control like
+  GPIO toggle. This control is through a mux controller, so there are 2
+  nodes, one is the mux control provider(e.g. gpio-mux), the other one is
+  the typec-orientation-switch node as the consumer of mux control.
+
+properties:
+  compatible:
+    const: typec-orientation-switch
+
+  mux-controls:
+    description: -|
+      Phandle to mux controller node, the mux controller node see
+      Documentation/devicetree/bindings/mux/mux-controller.txt,
+      we have the fixed state of 0 for CC1, and fixed state 1 for
+      CC2.
+
+  mux-control-names:
+    const: mux-typec-switch
+
+  port:
+    type: object
+    additionalProperties: false
+    description: -|
+      Connection to the remote endpoint using OF graph bindings that model
+      SS data bus to typec connector.
+
+    properties:
+      '#address-cells':
+        const: 1
+
+      '#size-cells':
+        const: 0
+
+      endpoint@0:
+        type: object
+        description: Endpoint connected to typec connector.
+        additionalProperties: false
+
+        properties:
+          reg:
+            const: 0
+          remote-endpoint: true
+
+        required:
+          - remote-endpoint
+
+      endpoint@1:
+        type: object
+        description: Endpoint connected to usb controller.
+        additionalProperties: false
+
+        properties:
+          reg:
+            const: 1
+          remote-endpoint: true
+
+        required:
+          - remote-endpoint
+
+    required:
+      - endpoint@0
+
+required:
+  - compatible
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    mux: mux-controller {
+        #mux-control-cells = <0>;
+        pinctrl-names = "default";
+        pinctrl-0 = <&pinctrl_ss_sel>;
+        mux-gpios = <&gpio3 15 GPIO_ACTIVE_HIGH>,
+                    <&gpio2 20 GPIO_ACTIVE_HIGH>;
+        idle-state = <2>;
+    };
+
+    typec_switch {
+        compatible = "typec-orientation-switch";
+        mux-controls = <&mux>;
+        mux-control-names = "mux-typec-switch";
+
+        port {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                usb3_orien_sel: endpoint@0 {
+                        reg = <0>;
+                        remote-endpoint = <&typec_con_ss>;
+                };
+
+                usb3_con_data: endpoint@1 {
+                        reg = <1>;
+                        remote-endpoint = <&dwc3_0>;
+                };
+        };
+    };
-- 
2.7.4

