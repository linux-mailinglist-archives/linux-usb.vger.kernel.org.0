Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 675A8292465
	for <lists+linux-usb@lfdr.de>; Mon, 19 Oct 2020 11:10:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728064AbgJSJKN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 19 Oct 2020 05:10:13 -0400
Received: from mail-eopbgr60076.outbound.protection.outlook.com ([40.107.6.76]:14403
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727235AbgJSJKN (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 19 Oct 2020 05:10:13 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YA0Dme/QLItciHa17FJGYNxkZ+wQUfdNsf0z/12n5vD6EFjx+ov3xgmofsXWPGz6fiBjPRPcjKgB+6IRsEJ1dFH9dw1xhk6WZ6gAbKS7hQVynJL8FFlR/V8dUEcXiNe8VNJ5KzshF7wxkxwGfMj+vo59SR7KLt0HWeEVeEHuJH3sqFqJsL1+c++uFWGf8YWm2O4m6Et7hKk7DOeTsw42ktq7+AJVnb7dbYhxZqo5Dd0TlfM6mpqg22limIkYSQMcjEfYpw3PWM+An7iSIWmot59LscKH3cG7lZrfSqk3w6wwhDqOZo1fcaYOXbuGn2LLNqBjwYqmAZOSGhbVDX1psw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Beg3QnEiQRH+PfPlHy6n1+tg6XtXGaljM3uvHLxni7Q=;
 b=TowTO32es+PEtkhNQFjiQ3EEYZQ0cp5OxflCqJWEWPc3YV+vBiaN76Smwst6w5+KSV5F2OL3iRFUirQf0EPBFW72Hld7zc012R2R4PcDxCllTlKbmAaEZ13vw15QJnBxPVmrE5bWmnd5vVnw2FvKag76+BQ7/bgtw3WAcd0pTd7wfIrlS74bePmQNbNTnQYinr/LepkDoS+fnQsVTDp7wP2b6up3nn1wbb9Ya88rhmqTjzzkFz8D6h/jUBmNdLR+LpdJsMyAwpwsxyh3yte10dz6jcgfWklNY6hNL6MIbcAXaKFTWD0H8zfe9euMFJY6saireQvkBHU0xJALVxboSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Beg3QnEiQRH+PfPlHy6n1+tg6XtXGaljM3uvHLxni7Q=;
 b=QV1BtBShuB54m2Z87LT/m5+j+8He0OMrXo51CeI78XAY/FsI/LZf+MZ9RUdm7glKOdWHtddUrnrQG6yJ+/fNiSwbXY5716ujwiYddsDNARNDcu6hpYyA2GG0YS/MYC5l4iIveFfgBHKPVnoK90xtuMFv1r9xkTusqE/a/6L3kLw=
Authentication-Results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=nxp.com;
Received: from DB8PR04MB6523.eurprd04.prod.outlook.com (2603:10a6:10:10f::26)
 by DB6PR0401MB2342.eurprd04.prod.outlook.com (2603:10a6:4:4e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.25; Mon, 19 Oct
 2020 09:10:09 +0000
Received: from DB8PR04MB6523.eurprd04.prod.outlook.com
 ([fe80::35e9:2f0b:112b:28c3]) by DB8PR04MB6523.eurprd04.prod.outlook.com
 ([fe80::35e9:2f0b:112b:28c3%6]) with mapi id 15.20.3477.028; Mon, 19 Oct 2020
 09:10:09 +0000
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
Subject: [PATCH v4 1/4] dt-bindings: usb: add documentation for typec switch simple driver
Date:   Mon, 19 Oct 2020 17:03:12 +0800
Message-Id: <1603098195-9923-1-git-send-email-jun.li@nxp.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR01CA0128.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::32) To DB8PR04MB6523.eurprd04.prod.outlook.com
 (2603:10a6:10:10f::26)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR01CA0128.apcprd01.prod.exchangelabs.com (2603:1096:4:40::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3477.21 via Frontend Transport; Mon, 19 Oct 2020 09:10:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 749526a9-3135-4111-dd38-08d8740ec6d6
X-MS-TrafficTypeDiagnostic: DB6PR0401MB2342:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB6PR0401MB2342BEBA3E157DA747AEDD4B891E0@DB6PR0401MB2342.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: x59XFxft0RLCOuTdtKWM38+HjOtOAaY8VN8Dfu5x3JDN1/I0VP39f56LKu3lpfthvZbTU3Q2s1HIXN7YrMPEEROzotB1JDkeuJxz/q4ugWP9Ftnu+vM9EAlsM3YzbTDd/J5GsvlPRW+UTdqZCd7IbcybZEoiKQNcwGddn1XoMnY56HUdtSbmCAixcm9R8qNH2T/ukuF4Uh8i7qoKxzG1O/qlTtMZP40dVKNRwEtPAVK5lQOlmBT7ebPYEYikNLWsVloukgh7W4oQNtBu90doDRdrxy/7vKIW25s0/l22ljzCsEoba0uk1qgQ+gWMpNEWERmy3mJrExaXUid94Pj+9pC7oJbbYJriFpqINdvZIYELM2EspZJ7+aPsEFo1iPiQGKe60/MGnlUaYFT7EvJMcwcJ2cWzAok2PZamzMO0Cko0gx2SVV4irfxNvh6RLfL11vLqbAuX2up9neGkOB2FpA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6523.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(366004)(376002)(136003)(39860400002)(6666004)(8936002)(66556008)(7416002)(316002)(5660300002)(6512007)(4326008)(36756003)(66476007)(66946007)(8676002)(52116002)(69590400008)(478600001)(2616005)(956004)(2906002)(16526019)(26005)(86362001)(186003)(966005)(6506007)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: zMwt+A8xrSL/nUJXlabP6dLyoc/a7Z6Cj4+1pZFdDmb0x00Xmj+WcZcuh19EE025Rx+Vx75V6uLv1f+c7YiouVlqizXVKGxLk1d60Lr024g8aa0RCJDM7TeVjKSozy+lmghSy4bTxWH+8FBwDNxkoGD+VNGmPT2y3HSHRfkV2WzhV3XUi4OS00qYem+0QXO1U0jl67YlBlWnNf4oz313jtpi7S/6SOSicLwlB8JMtuwzH1LGoFft6YP+f84bAjHZhhxFvv1dZBg/U2Ws7SWJ0bChcJ86RKgDoMFMLaSnqqEvhKQpcfaiy0RNBvPL6iXmAu2LuhSahJyCg+FP3s5K5cYfwk0Fxz06JrIxvB0LvoMfSV9NRLq8e1CGuwgzwp8lwaCfNaR/lvIaSJPXdkUNveNA3+/Ud0RlsBV2Kg0LBKRVmRy5Nu7Krd3ao4GPczETxgjD5nY/EiPQtvFDEQl1DXD6NWdU5ymrbUUeZMoZTthOGghPeDl2m8OYC07CtFwYHs/ZtT+NKz9hNDNrzbRvYyOK07hJCXH3VSI0d9OcGBZf8dSc6peTA26LELRfVOVskos2kxh/5IBofiNImChxbZWb+qV6sOzC4BhgJn2IclMOKSguzKtQOMoOhH4VCI6m/sXGvkgkUq2IgMp3VRafqQ==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 749526a9-3135-4111-dd38-08d8740ec6d6
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6523.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2020 09:10:09.4195
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RnyDjWWiRZsE2UjMQ5/vfNSjtrhBLg2EweyI+5yRfBYsIazu4i0GGahvq4vY5HKo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0401MB2342
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Some platforms need a simple driver to do some controls according to
typec orientation, this can be extended to be a generic driver with
compatible with "typec-orientation-switch".

Signed-off-by: Li Jun <jun.li@nxp.com>
---
changes on v4:
- Use compatible instead of bool property for switch matching.
- Change switch GPIO to be switch simple.
- Change the active channel selection GPIO to be optional.

previsou discussion:
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

