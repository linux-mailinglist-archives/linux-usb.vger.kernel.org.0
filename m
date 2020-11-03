Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E13502A4479
	for <lists+linux-usb@lfdr.de>; Tue,  3 Nov 2020 12:46:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728072AbgKCLq3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 3 Nov 2020 06:46:29 -0500
Received: from mail-eopbgr40066.outbound.protection.outlook.com ([40.107.4.66]:28642
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727109AbgKCLq1 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 3 Nov 2020 06:46:27 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aqaJJy3njJXAEB7/CsWRVAhEJpGsGBvocQEvXob4eZeZS0CcW6+s8BhjwYvlkXSuNFdnaJun2GgfhqWlHKL3B8wR/jeMIxfXY/cFHpEH4Eb9MGwOG+orpExMOLeC+PTxd4kQZTYdUleY2iaoxk3Rm9te3ttdSATHjv50YDekICR6lUZnHxuOdPlztMVNfeyD8IWbjwPtzOqWwgokD9OALqxD9TGX1xgxiD7pDfFIGrl7RxVcIIJ7ylFNfgmaZu2j3cFKJpDhUHvSSXn205QScer/sP93aQY+zECdYjBHN/SyN4EZUD9UIQQiHQcjZg6v7ZBW7qCCZPQNIQAcLY6sIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5w5WD8gBwMCmRzhXi8+9zceJ3wKIZEIC8qZhHX4kPC4=;
 b=lW+1/aWLc6/n+hIR5wReWsnL38RStEOfFjuJVBprY2b2/mya1Q2qfSgt+++G1OOjY62XDjCPJezFhuQj2xmoIO5SAMUoNFFroUEs6NPeNDVGhWoT/S/MBoBJnoUQoGZjO/eYWSqYKjdFvPoZBE1xGaQdJ8ZQoRj6gS8opMYw/iYdFagQvS6CqFDAvzQfCVBZgDUNQA1StSAgYLw9OSTn0Vi4Tt7PJmsm/MyKVC7Lo90bSsKJspCfS6Y5siTbNN/7I8539Phlprkw2RQV5JGjaewKJ9FjkMB5nZcHqxn4sQpZ4GEG2hW23gWKGE7D3DaO85HC2nLVJyE73Q0F1QRaTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5w5WD8gBwMCmRzhXi8+9zceJ3wKIZEIC8qZhHX4kPC4=;
 b=NXk7Gs3iNmNKzoC6dZYJqcaLBhqvujpMrx6o5K+xxouO3VXsCFeuaWqc5qH5X/mLkCaw3W43XvoJrGr1Vz0i6kQdeVe3bPNUxX4Mc0Vkg06Zml9q50gm22nD3O5ZzKAzC9jXP9ofnTtDvjCiBLtZqHR+2X1bgYVDKrbyZlkd6W4=
Authentication-Results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=nxp.com;
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com (2603:10a6:803:127::18)
 by VE1PR04MB7278.eurprd04.prod.outlook.com (2603:10a6:800:1b1::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Tue, 3 Nov
 2020 11:46:22 +0000
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::852e:24d5:4c9f:5bdf]) by VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::852e:24d5:4c9f:5bdf%6]) with mapi id 15.20.3499.032; Tue, 3 Nov 2020
 11:46:22 +0000
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
Subject: [PATCH v5 1/4] dt-bindings: usb: add documentation for typec switch simple driver
Date:   Tue,  3 Nov 2020 19:40:07 +0800
Message-Id: <1604403610-16577-1-git-send-email-jun.li@nxp.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR01CA0131.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::35) To VE1PR04MB6528.eurprd04.prod.outlook.com
 (2603:10a6:803:127::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR01CA0131.apcprd01.prod.exchangelabs.com (2603:1096:4:40::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3499.19 via Frontend Transport; Tue, 3 Nov 2020 11:46:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 0a7bf8fe-9195-4e49-9d80-08d87fee15f4
X-MS-TrafficTypeDiagnostic: VE1PR04MB7278:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VE1PR04MB72782CE02F8554981A2CE1B789110@VE1PR04MB7278.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: awh9QUksJCvyPhyWGO+mHOhwAzOi6RHn03KSdewpUO5UPmgBzP58RxEMK1BSzlIrLy9cpmeYmYLtN6smah5N/oE1/Hj4fJ+MeaCYfJNQC64eXOP/9nu8KPEZMK6hn70ny06jTi4wLy/nfuU5L3tews1tv3sWZVY+Tm1EQjiZywDtqgS6ryJYpwq2e6nuOnBow366E3JykKxiifSMdUyQSrx5cShMFZO0BZbnDLbcyZYXIVSqAZ2+9H+OK5aLTMVNPW+CBCL/JmRmrCcWBbqA1QGoqk20pYGNsBFiii0A0vT/h6EGQWR5TVVspMiLdZtMrm++uNRSY2oPEfiHH7iQEIT5s3QxJqSVIC7A0wbkpD/oa48+2PJt9nqQF2fXjJczbk8ZgjtpnAl0655qzW28KZlzgL5QDb5B2eUc+XSem3X5B0W1l1lRGdyomkGLPOFLr9RQyYAXf08ofieLSBttaA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6528.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(136003)(346002)(376002)(39860400002)(69590400008)(26005)(316002)(16526019)(186003)(8936002)(6486002)(6506007)(7416002)(4326008)(6666004)(478600001)(966005)(36756003)(956004)(5660300002)(2906002)(66476007)(2616005)(86362001)(66556008)(52116002)(66946007)(6512007)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: yfKLULPVn3Rhq2LxA4rT7FGtSeZZ2U7H1Ih4B33GNLP3RKIPW1YjRPDsAYmUrejYCeL0D+WaP+qW8eRzmGYZH7Klq5pJXTw9EBE5c+g0p2SYKmRw7ONfCi0C0Mo+A5BoGF7irI+TIGnrv1fba4xnyXLBhNUMH9ZG+93TZ/W4J9npDH9AcQHpqazNRuJvHeQ9AOGi6BBq5HtmWAMrLrL4F5jpF6fp0HiDdfo33VjDQb7RyZ57kHodFH4vouwfID5iOcOyxgYXiKm/1JaoQC1HVQwc6ukgojdmpSV0+f+lVC4Elc86yK299QlnTsg8ON00RvtaasGD7zHkOVFCGE+THQUmGJj5Wf66m9uftwfJJPOf2JqqY27Qsup04WX60qwTmJJj2DLwIQqPhz62T+CwFY+1wkZrWGWFL7L00fHMh0+r5yKSHHIdHxceVt10d5rZEoH2LRNtYvfYb+mCdKi5uUGmLjz7/v0ubHeNb7JGGausqHGnUywLcDWtJMg4pDAuQ3oiqkBnT4xPMkS80wPh0mTZrgfOT7313Fliva2nm4JyVFDGPE5vxtV8l7TSMrEoK4K+QV8ZF1Oc4m9spn/tvXcdHmp4enIaZtWEgY6l159Iz9JEQcWiAs6se9LuiCAk4557Y09R8vhQuhX3QWpKiQ==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a7bf8fe-9195-4e49-9d80-08d87fee15f4
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6528.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2020 11:46:22.3769
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jY7iqcYTD+qL4yOrHU83tm4Ch+qk9L2QCyMpG8z2Go+ckbe89VeBUYoKEpsuZ4bc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7278
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Some platforms need a simple driver to do some controls according to
typec orientation, this can be extended to be a generic driver with
compatible with "typec-orientation-switch".

Signed-off-by: Li Jun <jun.li@nxp.com>
---
No changes for v5.

changes on v4:
- Use compatible instead of bool property for switch matching.
- Change switch GPIO to be switch simple.
- Change the active channel selection GPIO to be optional.

previous discussion:
http://patchwork.ozlabs.org/patch/1054342/

 .../bindings/usb/typec-switch-simple.yaml          | 69 ++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/typec-switch-simple.yaml b/Documentation/devicetree/bindings/usb/typec-switch-simple.yaml
new file mode 100644
index 0000000..244162d
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/typec-switch-simple.yaml
@@ -0,0 +1,69 @@
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
+  switch-gpios:
+    description: |
+      gpio specifier to switch the super speed active channel,
+      GPIO_ACTIVE_HIGH: GPIO state high for cc1;
+      GPIO_ACTIVE_LOW:  GPIO state low for cc1.
+    maxItems: 1
+
+  port:
+    type: object
+    additionalProperties: false
+    description: -|
+      Connection to the remote endpoint using OF graph bindings that model SS
+      data bus to typec connector.
+
+    properties:
+      endpoint:
+        type: object
+        additionalProperties: false
+
+        properties:
+          remote-endpoint: true
+
+        required:
+          - remote-endpoint
+
+    required:
+      - endpoint
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
+    ptn36043 {
+        compatible = "typec-orientation-switch";
+        pinctrl-names = "default";
+        pinctrl-0 = <&pinctrl_ss_sel>;
+        switch-gpios = <&gpio3 15 GPIO_ACTIVE_HIGH>;
+
+        port {
+                usb3_data_ss: endpoint {
+                        remote-endpoint = <&typec_con_ss>;
+                };
+        };
+    };
-- 
2.7.4

