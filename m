Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 12A04571EA5
	for <lists+linux-usb@lfdr.de>; Tue, 12 Jul 2022 17:14:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233059AbiGLPOZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 12 Jul 2022 11:14:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233633AbiGLPN5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 12 Jul 2022 11:13:57 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AD6FD13A7;
        Tue, 12 Jul 2022 08:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1657638415; x=1689174415;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=H20Yshd9F2kwcQGnW9HMTIT2LodAkeqAkKIMjvmxWKo=;
  b=GplaDu+ZsUxb3xolw5jPNsfaogZP+c0VnVn83M/E6ScHRUcGMkH7j6hR
   3LsEoW6XVFlo1W3iBrHdaydIVqi++eHw9xmi+PfdJtmOMQaZROsVJq1ng
   e4fykOvinygs5g/pk9EhKKYVQy84He1cGuOk6zJ9nP9+fQxgC9QTA6C2z
   0p0oadU3qz+br17F0hgJSMMS58V+C6EdbZAoeVl9+h+gS0k5kRaaDeRq9
   1UO+HgehOwR35lUWlSobuM685W2jmWQfq2zt8HYrYg20cSJZ5qnMIPUGN
   EPGxYflb5B60cnp6zuFDfqINrlABsFugRHrhZTdrstg5G0xG8TYL5L2Zj
   g==;
X-IronPort-AV: E=Sophos;i="5.92,266,1650924000"; 
   d="scan'208";a="25005749"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 12 Jul 2022 17:06:47 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Tue, 12 Jul 2022 17:06:47 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Tue, 12 Jul 2022 17:06:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1657638407; x=1689174407;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=H20Yshd9F2kwcQGnW9HMTIT2LodAkeqAkKIMjvmxWKo=;
  b=HSsaPnjCWcjiHvXdY66kdKz35WsATJ09KzZKlD0eFUpIymnVQveae6VX
   pw8M9ygp84FBKvvwVpSFLO6OSpuPBcvxGl3Nsdi3Ik+EbMBKBMawXl/Sz
   UTctCrYGHX50gshRpg8BaJmXObIhbjxRf4JnLbUVHF299UIP+8oDButfp
   YTCXwmBjTp5P7R+i33io+K5LRqEyYc/keg24Is76qzEOeduBFAKeuIjzh
   Z/SZIPpfJI8Pyzu8d0rZqE2nLC6r95AjxBWyThkNewFh/igws1PCuSFRH
   RPrsCtx2/Ajxxtd4N0jRyGL14jBm6IKlAmmMOYxY6Zm2DfiOWg+s2mRKd
   g==;
X-IronPort-AV: E=Sophos;i="5.92,266,1650924000"; 
   d="scan'208";a="25005738"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 12 Jul 2022 17:06:32 +0200
Received: from steina-w.tq-net.de (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id D205F280056;
        Tue, 12 Jul 2022 17:06:31 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Kaehlcke <mka@chromium.org>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: usb: Add binding for TI USB8041 hub controller
Date:   Tue, 12 Jul 2022 17:06:25 +0200
Message-Id: <20220712150627.1444761-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The TI USB8041 is a USB 3.0 hub controller with 4 ports.

This initial version of the binding only describes USB related aspects
of the USB8041, it does not cover the option of connecting the controller
as an i2c slave.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Well, this is essentially a ripoff of
Documentation/devicetree/bindings/usb/realtek,rts5411.yaml with USB IDs
replaced, reset-gpio added and example adjusted.
IMHO this should be merged together with realtek,rts5411.yaml. Is it ok
to rename bindings files? I guess a common onboard-usb-hub.yaml matching
the driver seens reasonable. Any recommendations how to proceed?

 .../devicetree/bindings/usb/ti,usb8041.yaml   | 69 +++++++++++++++++++
 1 file changed, 69 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/ti,usb8041.yaml

diff --git a/Documentation/devicetree/bindings/usb/ti,usb8041.yaml b/Documentation/devicetree/bindings/usb/ti,usb8041.yaml
new file mode 100644
index 000000000000..9a49d60527b1
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/ti,usb8041.yaml
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/ti,usb8041.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Binding for the TI USB8041 USB 3.0 hub controller
+
+maintainers:
+  - Matthias Kaehlcke <mka@chromium.org>
+
+allOf:
+  - $ref: usb-device.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - usb451,8140
+          - usb451,8142
+
+  reg: true
+
+  reset-gpio:
+    maxItems: 1
+    description:
+      GPIO specifier for GSRT# pin.
+
+  vdd-supply:
+    description:
+      phandle to the regulator that provides power to the hub.
+
+  peer-hub:
+    $ref: '/schemas/types.yaml#/definitions/phandle'
+    description:
+      phandle to the peer hub on the controller.
+
+required:
+  - peer-hub
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    usb {
+        dr_mode = "host";
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        /* 2.0 hub on port 1 */
+        hub_2_0: hub@1 {
+          compatible = "usb451,8142";
+          reg = <1>;
+          peer-hub = <&hub_3_0>;
+          reset-gpio = <&gpio1 11 GPIO_ACTIVE_LOW>;
+        };
+
+        /* 3.0 hub on port 2 */
+        hub_3_0: hub@2 {
+          compatible = "usb451,8140";
+          reg = <2>;
+          peer-hub = <&hub_2_0>;
+          reset-gpio = <&gpio1 11 GPIO_ACTIVE_LOW>;
+        };
+    };
-- 
2.25.1

