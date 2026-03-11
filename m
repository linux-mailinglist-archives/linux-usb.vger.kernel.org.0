Return-Path: <linux-usb+bounces-34588-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0HqiCDuJsWnkDAAAu9opvQ
	(envelope-from <linux-usb+bounces-34588-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 16:24:43 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CAD632666D6
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 16:24:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 66109306CF47
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 15:20:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA4EA3DF010;
	Wed, 11 Mar 2026 15:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="zI0mqRSH"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC1ED3DD50F
	for <linux-usb@vger.kernel.org>; Wed, 11 Mar 2026 15:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773242440; cv=none; b=cIJIXNpa/J39l/mzuePyrhNZK9xn5RDr0PRmYmBHlHHR8xwOsANqR5rdFDWXSVxJhtKHCuMgW5uDteGaPbFqARHnjHiYY94gspocMd61KAdiB65JrJd7cxgyDg2LpVk3EMbjjc8WhaO+zTHcBTPLLnLrmhzZ8Q01zHr9S1ZDWk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773242440; c=relaxed/simple;
	bh=I1uVv/LTzsgQ1T+9I/7DnJ24yUCxC6BeyV7tRacRwvw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d8HNh2NLYiGvA01cpay5+dWenk/eKITPzRCPuEnsSMILE2bZxfe0e+Q36Yc13U3Ok/fOBJ50MSCZWELbjMrxUZSdKsrtP6TVTpyLLlCeTiDehRoeX/Dd4mooWXAFl7CEQ3QSW8DwtJr47acjjY6oape5B8glEshkYCyre6nkXPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=zI0mqRSH; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-48539cbb7b1so24555435e9.3
        for <linux-usb@vger.kernel.org>; Wed, 11 Mar 2026 08:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1773242436; x=1773847236; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PtHCEpa1o53nmFD6yBD46rLrQJD/cn516+0lc1j0K9k=;
        b=zI0mqRSHK+5aB1EoUwsbX6FDSPPQSfHEJ364kyk0xfeHZoyHO6deDgygaY5SF96OaZ
         ryvN+ld8bTJ935q6hXD5hFQVc4sImBbWMBH3zwjTTViM9iueTXgu9f7UOWupQzFb/qqQ
         c+OgySlTehmo1DQu/jTwLk17csqP1uPecPTfGFDBOQV6ZduFmT2dvUAILYHSb5iNKetD
         13vBXl5Y8N1rv78QRytmS3I6/vie1o4yj5/rX286R9vqUKInqWSuS0qSqCRUCaxCGxHd
         Cqi8Wdyd2E/yt/KEUoIq1Fa8TBpaWC2/Glv/FnXMMqT680O5hjMadQmMzBKWFJsQ39cw
         7HDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773242436; x=1773847236;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PtHCEpa1o53nmFD6yBD46rLrQJD/cn516+0lc1j0K9k=;
        b=mTUR2G0+WcNqdN0MbZiSKMdIUGx9BTZxOimiyr6ka7o04nSKOotK3QgxoTt0JqMMFO
         eJ+kz286Y380ojS7h4hEo0cA2NF7Lg+IY9C3S7HZiealCWujnMzvr4bDdI/t8kPnN0F8
         yTP94w6BWMqflZtu2byZYYEY0gZekHF9yg86bFM+utG6wmiU9hxtPj9ms4ok62ay5yhU
         LoqUnr9nj9+TP88T9NxIGvAGlHHEPIsGCZutk3LsltyPr13pL7c0carnHF+fkycsv0Tk
         sF/b25lXEMTY4HgEGl17MRVu41pUhP+Z4kkHxwXgsIiz3lDUftI0CxjF2XlQvPkSn7hm
         WzIg==
X-Forwarded-Encrypted: i=1; AJvYcCU0S/0sQsKi0yeVyIhv4uIHwlaLUUKSWhsmst9xjNYI/2QlKuEzrXesm6jc8ina01mTlkkMUEC84mc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIza8knu+0lCyKqmbhwOPP8+9NWJxq5KrNKYcDFjScG13VfhvS
	75qZH59ur/44JxePu3JAk/yhxSJm7TGWF9fygO7wLPXh0Mblh2ToAsqGO2BEFK7/EIw=
X-Gm-Gg: ATEYQzzKZjB0ow36lBS0SemwefIWsfU6OdAHQpERbcAJdzhE00VTQiRJXvHqglXBM7y
	18QE8snRgsWy4siNDm4S+xEkwoZoU1pCWgekyIntYZ6zo2kF1k2IYipwu7XFWsdfcJ/q0N6/E61
	2CxDniiVFq4hXIBlNcUFObETrqsDKMcouyUiCLsBwchYxuYVHxqO4aeSpzhY9RLkJtXENhhKFbf
	3+tYwyrEsXEwCZXmDYRWEHiP5uTh4Qsgg06Hp8P5CmgzQXYKOr6+FwzOQW7wvpG3jFMdSSFDbfH
	2G82v+vOxdHM8/jYlLPeXdd6JqojBk6Z4VE87dhNa7YImgk6J0PiINGZ2NB1SpaUEXraKGUR99b
	0eeyQEj0NF79rCTPdYhO2qPW4AMpQW+62QdEF7ZexZQub/1F2H7w1kmaOnNwkqS1ufOGCZV+1hH
	gUMJGyVvDM8aRhHzbNx+Xi+8TxaZdtktC1kiKC0j98hzRJ770THBa06wfiK1/k8SiLSI/zWW6Qn
	KEojLNLegxcnl4H
X-Received: by 2002:a05:600c:3b1c:b0:480:69b6:dfed with SMTP id 5b1f17b1804b1-4854b123903mr50834285e9.24.1773242436083;
        Wed, 11 Mar 2026 08:20:36 -0700 (PDT)
Received: from alchark-surface.localdomain (bba-86-98-192-109.alshamil.net.ae. [86.98.192.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541aa73dasm435519285e9.2.2026.03.11.08.20.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 08:20:35 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Wed, 11 Mar 2026 19:20:22 +0400
Subject: [PATCH 2/3] dt-bindings: usb: Add Corechips SL6341 USB2.0/3.0 hub
 controller
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-sl6341-v1-2-0a890056f054@flipper.net>
References: <20260311-sl6341-v1-0-0a890056f054@flipper.net>
In-Reply-To: <20260311-sl6341-v1-0-0a890056f054@flipper.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Matthias Kaehlcke <mka@chromium.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2553; i=alchark@flipper.net;
 h=from:subject:message-id; bh=I1uVv/LTzsgQ1T+9I/7DnJ24yUCxC6BeyV7tRacRwvw=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWRu7LBLaOyRV3m1WcNYbMbdiQkKmYcL2a4nnhJVmTX/4
 n7r3WnlHRNZGMS4GCzFFFnmfltiO9WIb9YuD4+vMHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 oaGOsY4RAxenAEz1+eOMDHOdpXrahXY7RT5/kae4fOLn+adb5lkvmLD9VNppnwIxdVFGhvd/87P
 vxBiefTR1G4PO969hYbIblv71FA9zmv9LrW9SKzMA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[flipper.net,quarantine];
	R_DKIM_ALLOW(-0.20)[flipper.net:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[flipper.net:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34588-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alchark@flipper.net,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.2:email,devicetree.org:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,0.0.0.1:email,flipper.net:dkim,flipper.net:email,flipper.net:mid]
X-Rspamd-Queue-Id: CAD632666D6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Corechips SL6341 is a 4-port low-power USB 3.2 Gen 1x1 hub controller
supporting SS, HS, FS and LS connections and integrating a 5V to 3.3V
built-in LDO to enable its IO to be powered directly from the 5V USB VBUS.

External 1v1 VDD supply is still required for its core power.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 .../devicetree/bindings/usb/corechips,sl6341.yaml  | 79 ++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/corechips,sl6341.yaml b/Documentation/devicetree/bindings/usb/corechips,sl6341.yaml
new file mode 100644
index 000000000000..82996791aaf1
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/corechips,sl6341.yaml
@@ -0,0 +1,79 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/corechips,sl6341.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Corechips SL6341 USB 2.0/3.0 Hub Controller
+
+maintainers:
+  - Alexey Charkov <alchark@flipper.net>
+
+allOf:
+  - $ref: usb-hub.yaml#
+
+properties:
+  compatible:
+    enum:
+      - usb3431,6241
+      - usb3431,6341
+
+  reg: true
+
+  peer-hub: true
+
+  reset-gpios:
+    description: GPIO controlling the RSTN pin.
+
+  vdd1v1-supply:
+    description:
+      The regulator that provides 1.1V core power to the hub.
+
+  vdd3v3-supply:
+    description:
+      The regulator that provides 3.3V IO power to the hub.
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    patternProperties:
+      '^port@':
+        $ref: /schemas/graph.yaml#/properties/port
+
+        properties:
+          reg:
+            minimum: 1
+            maximum: 4
+
+required:
+  - compatible
+  - reg
+  - vdd1v1-supply
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    usb {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        /* 2.0 hub */
+        hub_2_0: hub@1 {
+          compatible = "usb3431,6241";
+          reg = <1>;
+          peer-hub = <&hub_3_0>;
+          reset-gpios = <&gpio0 20 GPIO_ACTIVE_LOW>;
+          vdd1v1-supply = <&vdd1v1_hub>;
+        };
+
+        /* 3.0 hub */
+        hub_3_0: hub@2 {
+          compatible = "usb3431,6341";
+          reg = <2>;
+          peer-hub = <&hub_2_0>;
+          reset-gpios = <&gpio0 20 GPIO_ACTIVE_LOW>;
+          vdd1v1-supply = <&vdd1v1_hub>;
+        };
+    };

-- 
2.52.0


