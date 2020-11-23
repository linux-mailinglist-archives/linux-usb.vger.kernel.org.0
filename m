Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3658F2C0CF0
	for <lists+linux-usb@lfdr.de>; Mon, 23 Nov 2020 15:14:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729867AbgKWOIy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 23 Nov 2020 09:08:54 -0500
Received: from mail-vi1eur05on2073.outbound.protection.outlook.com ([40.107.21.73]:8513
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729111AbgKWOIx (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 23 Nov 2020 09:08:53 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NhWFtNa+hmOZLtnZ1G+rb/A0g6D5L6YDw8VvNWojJ2InjfQQiX7xTK0Q/EQIeLp5Y0BNMEfL2EoGvZ5vWywnHCQbknC2Bc72XjF7u3K/P+Ro7ZCynAP5zxeAPDfEKjD+NIdVm6MOmR0BCSD1CsuB97mNNOunDSxBds+10F6LRAn8uh/eM88PoGeF/4KGcmpK1G/f3xruWPh40mI6KSk8DkyLu6EiB6Rx1w8hrjnfpHe4rDdCS9TgMKnuE4XPrBRAtbj+zPNEl+P1MAJuR+zz0zMrHgM6FMlxNjLzZzbzenG6ssrpc6BP5cTdpscWyn5XDOwvHj+bo7gtGJv12TVRtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tvjPCHPIKqLJYXalimTUpBZ/ZbP6H6NE4aqt3/1bTRM=;
 b=U+I6CzYXU7l+UoAXiEnuXx3aanOhmtoWsjvKSAYAxLOeR6TkPaMgmelcWKAH8h8RQdjjcJlS4HHD0VD6Vhyzcb4X7iJGRPVaRJt2m28RCyj3939+CExTwYPpVj1AUJQLbi7H3Tgzeb4gEpVsRz1cTj928TpyiBm3iqtIwL/b0oLz1AUJRNdOmvho2+NmYDU5Bf4gzc0wtfm29Smkqd7Hbx0k8w8mrcQY/SsTwfTPkxXxk+23t2L7bqp04bOs3fov0+06EiuGWJCMVl9mPf91g2164td79cCcBfpAy+Ys/pbhP9ByF4BErVsO1jt3kuyn1AzMh+NC4mwJBf9fQJP5nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tvjPCHPIKqLJYXalimTUpBZ/ZbP6H6NE4aqt3/1bTRM=;
 b=YurncW6P6GpySbwLSSStCWS7b0eEA+gqZZmF+CAPvRFdkFTD3EBwWG8gVVZtO9AaD7FLxXiQgiOxg5UHI3MHsxt4srn7plVT5LgJKISHg5PyIllm3o/EpQC5yVbezN0iREJXaE0WzCGjG2iSN/OU5AKqSurwr18DJBfMelqdKbU=
Authentication-Results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=nxp.com;
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com (2603:10a6:803:127::18)
 by VI1PR0402MB3760.eurprd04.prod.outlook.com (2603:10a6:803:23::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Mon, 23 Nov
 2020 14:08:49 +0000
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::b035:d158:c99c:57c6]) by VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::b035:d158:c99c:57c6%7]) with mapi id 15.20.3589.028; Mon, 23 Nov 2020
 14:08:49 +0000
From:   Li Jun <jun.li@nxp.com>
To:     heikki.krogerus@linux.intel.com, robh+dt@kernel.org,
        rafael@kernel.org
Cc:     gregkh@linuxfoundation.org, andriy.shevchenko@linux.intel.com,
        hdegoede@redhat.com, lee.jones@linaro.org,
        mika.westerberg@linux.intel.com, dmitry.torokhov@gmail.com,
        prabhakar.mahadev-lad.rj@bp.renesas.com,
        laurent.pinchart+renesas@ideasonboard.com,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-imx@nxp.com, peter.chen@nxp.com
Subject: [PATCH v6 1/6] dt-bindings: usb: add documentation for typec switch simple driver
Date:   Mon, 23 Nov 2020 22:01:31 +0800
Message-Id: <1606140096-1382-1-git-send-email-jun.li@nxp.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR06CA0164.apcprd06.prod.outlook.com
 (2603:1096:1:1e::18) To VE1PR04MB6528.eurprd04.prod.outlook.com
 (2603:10a6:803:127::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR06CA0164.apcprd06.prod.outlook.com (2603:1096:1:1e::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3589.20 via Frontend Transport; Mon, 23 Nov 2020 14:08:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f70fbdc3-2b91-4866-f5c4-08d88fb94c95
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3760:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0402MB3760C9701D5B54D983E8434E89FC0@VI1PR0402MB3760.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SlyBArFZGi3e1P2Z/JIlFvuJ+jMGSWTIn84GdbeWVWsdnp+hoEhHrWI6ei0V3RzHn0/boOkW+MCwBpu1hR8Od4tfUEuW0J/syEVWJCP2TfQouH0jE9I/6Wh/gNBOx9kDTCzYCh/PoCJs6OWIQE/NYioLIzIu0bNqrl07hiu/r3QWcwnrSHZIjz0Ep6IZhfX0AyXAsZupruMzxC06n/1HXKIYITSkE62lxXhWP7U+LFsmpWRprk79/SSfAT3DjKBj3gJcyuL8pghsS6QblQU3RR9AF9f6K/XAWYHJvGWfFxN132WA+lYV58ximiwFwDnz4Wln7G57hh5+NV2hUsKxrUaGhpWhm925wFuYAx7Dob468d1SsXdWRvPrQJxssllW5MeU4arXmb2hKNfka16BIhIOqaLXSgvejoRVNq3gbkRyJ/OiGB+Be/iHbv8G41rysi0elSiniMQ3C1Q5OWm64Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6528.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(346002)(396003)(136003)(376002)(366004)(4326008)(186003)(16526019)(26005)(36756003)(86362001)(69590400008)(6666004)(2906002)(66556008)(6512007)(66946007)(478600001)(7416002)(2616005)(8936002)(956004)(966005)(316002)(52116002)(66476007)(6486002)(8676002)(6506007)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: CQpUQycvXexQwG1CvA/sLgWLoQ1008IQr1koKI1vPVV7J7fV2h6v+N3IM48tzWXBqUKVOI/QmBrI5qigBLVAusbkv49M+SF+lf0vO9i9xr93MP0Wz8QM7yXF4Qz85+wSJeMchrnnfUizHugMpYatuDA0GMglqCwvVuRZ//s0C24lpynwDd3gIArvbu+SopLBD0qJsGFrkAPPK/7C3gp+KLhJElQSLM5eRlVbsDzX3+IOJiJwP3vJUQS7rBzPt0ENROT/TF9418D5Chp9pa4pRJY46wDXjasasrp76brsSFRYKtDE4C13SRCjOmT1Cn18lD+q9AKwqVlLxPr5fjFwL6AHEHMZdkUO9v/vpTFOXLuwel6bx8JyyMT4PdJHebJurYb4kbTI6OZsTkJ4X89qf45+sHvQVGb9ARnNUDQaGcltK52cHYPUNanEs5ZJPioK2lIXYoKBI0wrVNpDqpZR9ZYYr/QqgI0HUBYWNM/+LS3ppagLIwLJBFNpAApH8oAkVxQLYjzbSG8kKbY+UzXqVVo4YAApmahLLKFKvu+o6bnnoJXYqYmBF9dv8wBLp4h6RGoTtEmRn9Ric2zDzrXS4+KYYMYUZuyRgtd0mtY4mnhUUfqJ6rWFGlAUq0fszjUwwmxBgo5kANGhlqMFvZdXs/7+zJvMIuo1Bx+NCLQFDySStF6hQCc3QJAnTwmE38m0CAU4E/GTqS6Yq4jZ/38bclqCtGWCp6d+DCvCCdaylvxYuBb9B8XYJGI5vvNujWmszToTqX7wa4CiUKIwnE3lcoWX08bw1xuJ7e4OEOK1VM4FAwYQkPmv3f0Vzyi60OfWjdTs4BVoMb97BZo2X0PSmtUzCcpW7tFrmPuCRDrKyJT80sypJN0psNEz71Ty4LBMFWUenYYTuZrnGmKeboHCKA==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f70fbdc3-2b91-4866-f5c4-08d88fb94c95
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6528.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2020 14:08:49.2561
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T9lhvYYumLyEmwV/rWF78SN45LjODU3XnU4ZmgmYl1iMvwCoXVycflZTwFlpDuxQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3760
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Some platforms need a simple driver to do some controls according to
typec orientation, this can be extended to be a generic driver with
compatible with "typec-orientation-switch".

Signed-off-by: Li Jun <jun.li@nxp.com>
---
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

 .../bindings/usb/typec-switch-simple.yaml          | 122 +++++++++++++++++++++
 1 file changed, 122 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/typec-switch-simple.yaml b/Documentation/devicetree/bindings/usb/typec-switch-simple.yaml
new file mode 100644
index 0000000..030ade5
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/typec-switch-simple.yaml
@@ -0,0 +1,122 @@
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
+description: |-
+  USB SuperSpeed (SS) lanes routing to which side of typec connector is
+  decided by orientation, this maybe achieved by some simple control like
+  GPIO toggle.
+
+properties:
+  compatible:
+    const: typec-orientation-switch
+
+  '#mux-control-cells':
+    const: 0
+
+  switch-gpios:
+    description: |
+      GPIO specifiers to select the target channel of mux.
+      The first GPIO is for cc1 and cc2 selection, the GPIO flag use
+      GPIO_ACTIVE_HIGH if GPIO physical state high is for cc1; or use
+      GPIO_ACTIVE_LOW if GPIO physical state low is for cc1.
+      The second gpio is to deselect any channles by places all channels
+      in high-impedance state to reduce current consumption, the gpio flag
+      use GPIO_ACTIVE_HIGH if GPIO physical state high is for
+      high-impedance state (so low for normal operations); or Use
+      GPIO_ACTIVE_LOW if GPIO physical state low is for high-impedance
+      state(so high for normal operations).
+    minItems: 1
+    maxItems: 2
+
+  idle-state:
+    description: -|
+      For TYPEC_ORIENTATION_NONE by deselect both channels if supported.
+    const: 2
+
+  # Standard properties described in
+  # Documentation/devicetree/bindings/mux/mux-controller.txt
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
+    typec_switch: mux-controller {
+        compatible = "typec-orientation-switch";
+        #mux-control-cells = <0>;
+        pinctrl-names = "default";
+        pinctrl-0 = <&pinctrl_ss_sel>;
+        switch-gpios = <&gpio3 15 GPIO_ACTIVE_HIGH>,
+                       <&gpio2 20 GPIO_ACTIVE_HIGH>;
+        idle-state = <2>;
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

