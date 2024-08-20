Return-Path: <linux-usb+bounces-13691-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C179577E1
	for <lists+linux-usb@lfdr.de>; Tue, 20 Aug 2024 00:43:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6F430285AAA
	for <lists+linux-usb@lfdr.de>; Mon, 19 Aug 2024 22:43:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C549205E3B;
	Mon, 19 Aug 2024 22:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JhqrlOUd"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74252205E08
	for <linux-usb@vger.kernel.org>; Mon, 19 Aug 2024 22:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724107150; cv=none; b=mPwosbM9iGKnpREGjpgIlwOyOUc50EuK1iLXhxkRMYYXXQWQ1XTMeveTO21NxvDz65HBvIJVQx8PeXeweMvou0UWAq1gZoWodRZZfKrsstyEFqpoOF6GzYn3/QVsmdpj+mQX5lbt6RGI7JCms/Pfi6/V1nBI6ZjIV2FiANlZVck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724107150; c=relaxed/simple;
	bh=/dI7MR+2Xs16wfk9NVoRInRnpjgI0wsZ+hkJsjkYxjs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QHcOA9AatNWRqroqqQb7A7LIkpFo2egisR22XPF1gldSkIX36SkeRuiq2qbuCtlh75pRiE/9XBqw+nt0Zdj6eatE5z2+uTmIRBoSWWBrZmq1usgAPAJQmo9Rn3lMNjyf08vBYIyBBmWosIk6eNBWFLTLTkmk4xxTku4XrpKbOPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=JhqrlOUd; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-70d1d6369acso3763506b3a.0
        for <linux-usb@vger.kernel.org>; Mon, 19 Aug 2024 15:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1724107148; x=1724711948; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3olKCNMmm+bbLjPBrj+yuwpy+tnEYS3+fqAauOCcd9s=;
        b=JhqrlOUdZDP75Pr//TT8p40l8Mrwjqgh3B2KjpNgUVXNti+zWddC29GHRJ0cARutpI
         t6DebrGgHTjDaVG1sJmuDVEhTyS0kBdkiSmAgEQHoGRCVZXhPGbT4b63fLuEUUGlqiSm
         v4BRe8tFdbBXh3Adder1HZrQqT7ul+T9qkcco=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724107148; x=1724711948;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3olKCNMmm+bbLjPBrj+yuwpy+tnEYS3+fqAauOCcd9s=;
        b=TxGg3I+It/4+DXDg3kUCk2eyE7TkSbzyiiAI7MfkmF/imoyg3DRRu75JIUzG+UyOSj
         Pbf8Gk0ohGke4xRZFJDzmgkGzOh8vfQFuWeBxeAkdXwdVSdfUoP6Y4bbTmlE1OVYcHiH
         hfn8JT45Kh0kNNbM/b9mCLU8zejOeabDE1aJEEtPUWZiej7LQUTYAtT/bnzffg++pH9K
         SLLMu+Y/Vvk5+j6P0q48A4ggSzZlUB3QEpgA/wIkPlCshQ/+dRIVIQHR3291KFLxqgvr
         FryzfCYeHxStotqO6X8AKxCLFg+04vYnYh0yle17Syk5RimHCPQKHC96Ibo6o74rk7xX
         SKfA==
X-Forwarded-Encrypted: i=1; AJvYcCUUdN3aozmwH6YAA8K6L+SmLuSNPhSrVgCzRSpb1C9zV/K/awsHcoAY8JKj9WJLKuZHO/Q5ZhvefM8xkLCaWlAQncAy4emba/Sb
X-Gm-Message-State: AOJu0YzfCzOS6cqkgr9K42Oc22ec5FkJkZz9Uh5w0s1l0AfohWR4AUp9
	iusvACYwNW1JLG++WcPXUzFXk71RVv8cNEuw29NZ4DH4iAjMFOXZmVArQg6U8w==
X-Google-Smtp-Source: AGHT+IFuHobXwMpayN/T3l++MLdpiZSou9JMIsZXu7qiGwNDrozpjaxioFvym1cbtCUJdc/lyGhU6w==
X-Received: by 2002:a05:6a21:3409:b0:1c0:f114:100c with SMTP id adf61e73a8af0-1cac701c654mr1375044637.17.1724107147591;
        Mon, 19 Aug 2024 15:39:07 -0700 (PDT)
Received: from localhost (210.73.125.34.bc.googleusercontent.com. [34.125.73.210])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-7127add6de9sm7314417b3a.12.2024.08.19.15.39.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Aug 2024 15:39:07 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: chrome-platform@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	devicetree@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Pin-yen Lin <treapking@chromium.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Benson Leung <bleung@chromium.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Vetter <daniel@ffwll.ch>,
	David Airlie <airlied@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	dri-devel@lists.freedesktop.org,
	Guenter Roeck <groeck@chromium.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Lee Jones <lee@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Prashant Malani <pmalani@chromium.org>,
	Robert Foss <rfoss@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Ivan Orlov <ivan.orlov0322@gmail.com>,
	linux-acpi@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v3 14/17] dt-bindings: usb: Add ports to google,cros-ec-typec for DP altmode
Date: Mon, 19 Aug 2024 15:38:28 -0700
Message-ID: <20240819223834.2049862-15-swboyd@chromium.org>
X-Mailer: git-send-email 2.46.0.184.g6999bdac58-goog
In-Reply-To: <20240819223834.2049862-1-swboyd@chromium.org>
References: <20240819223834.2049862-1-swboyd@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a DT graph binding to google,cros-ec-typec so that it can combine
DisplayPort (DP) and USB SuperSpeed (SS) data into a USB type-c endpoint
that is connected to the usb-c-connector node's SS endpoint. This also
allows us to connect the DP and USB nodes in the graph to the USB type-c
connectors, providing the full picture of the USB type-c data flows in
the system.

Allow there to be multiple typec nodes underneath the EC node so that
one DT graph exists per DP bridge. The EC is actually controlling TCPCs
and redrivers that combine the DP and USB signals together so this more
accurately reflects the hardware design without introducing yet another
DT node underneath the EC for USB type-c.

If the type-c ports are being shared between a single DP controller then
the ports need to know about each other and determine a policy to drive
DP to one type-c port. If the type-c ports each have their own dedicated
DP controller then they're able to operate independently and enter/exit
DP altmode independently as well. We can't connect the DP controller's
endpoint to one usb-c-connector port@1 endpoint and the USB controller's
endpoint to another usb-c-connector port@1 endpoint either because the
DP muxing case would have DP connected to two usb-c-connector endpoints
which the graph binding doesn't support.

Therefore, one typec node is required per the capabilities of the type-c
port(s) being managed. This also lets us indicate which type-c ports the
DP controller is wired to. For example, if DP was connected to ports 0
and 2, while port 1 was connected to another DP controller we wouldn't
be able to implement that without having some other DT property to
indicate which output ports are connected to the DP endpoint.

Cc: Rob Herring <robh+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Lee Jones <lee@kernel.org>
Cc: Benson Leung <bleung@chromium.org>
Cc: Guenter Roeck <groeck@chromium.org>
Cc: Prashant Malani <pmalani@chromium.org>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: <devicetree@vger.kernel.org>
Cc: <chrome-platform@lists.linux.dev>
Cc: Pin-yen Lin <treapking@chromium.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 .../bindings/mfd/google,cros-ec.yaml          |   7 +-
 .../bindings/usb/google,cros-ec-typec.yaml    | 229 ++++++++++++++++++
 2 files changed, 233 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml b/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
index c991626dc22b..bbe28047d0c0 100644
--- a/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
+++ b/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
@@ -98,9 +98,6 @@ properties:
 
   gpio-controller: true
 
-  typec:
-    $ref: /schemas/usb/google,cros-ec-typec.yaml#
-
   ec-pwm:
     $ref: /schemas/pwm/google,cros-ec-pwm.yaml#
     deprecated: true
@@ -166,6 +163,10 @@ patternProperties:
     type: object
     $ref: /schemas/extcon/extcon-usbc-cros-ec.yaml#
 
+  "^typec(-[0-9])*$":
+    type: object
+    $ref: /schemas/usb/google,cros-ec-typec.yaml#
+
 required:
   - compatible
 
diff --git a/Documentation/devicetree/bindings/usb/google,cros-ec-typec.yaml b/Documentation/devicetree/bindings/usb/google,cros-ec-typec.yaml
index 5ec4a9777ea1..d4c5c92c78ce 100644
--- a/Documentation/devicetree/bindings/usb/google,cros-ec-typec.yaml
+++ b/Documentation/devicetree/bindings/usb/google,cros-ec-typec.yaml
@@ -26,6 +26,106 @@ properties:
   '#size-cells':
     const: 0
 
+  mux-gpios:
+    description: GPIOs indicating which way the DP mux is steered
+    maxItems: 1
+
+  no-hpd:
+    description: Indicates this endpoint doesn't signal HPD for DisplayPort
+    type: boolean
+
+  mode-switch:
+    $ref: usb-switch.yaml#properties/mode-switch
+
+  orientation-switch:
+    $ref: usb-switch.yaml#properties/orientation-switch
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description: Output ports for combined DP and USB SS data
+        patternProperties:
+          "^endpoint@([0-8])$":
+            $ref: usb-switch.yaml#/$defs/usbc-out-endpoint
+            unevaluatedProperties: false
+
+        anyOf:
+          - required:
+              - endpoint@0
+          - required:
+              - endpoint@1
+          - required:
+              - endpoint@2
+          - required:
+              - endpoint@3
+          - required:
+              - endpoint@4
+          - required:
+              - endpoint@5
+          - required:
+              - endpoint@6
+          - required:
+              - endpoint@7
+          - required:
+              - endpoint@8
+
+      port@1:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description:
+          Input port to receive USB SuperSpeed (SS) data
+        patternProperties:
+          "^endpoint@([0-8])$":
+            $ref: usb-switch.yaml#/$defs/usbc-in-endpoint
+            unevaluatedProperties: false
+
+        anyOf:
+          - required:
+              - endpoint@0
+          - required:
+              - endpoint@1
+          - required:
+              - endpoint@2
+          - required:
+              - endpoint@3
+          - required:
+              - endpoint@4
+          - required:
+              - endpoint@5
+          - required:
+              - endpoint@6
+          - required:
+              - endpoint@7
+          - required:
+              - endpoint@8
+
+      port@2:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        description:
+          Input port to receive DisplayPort (DP) data
+        unevaluatedProperties: false
+
+        properties:
+          endpoint:
+            $ref: usb-switch.yaml#/$defs/dp-endpoint
+            unevaluatedProperties: false
+
+        required:
+          - endpoint
+
+    required:
+      - port@0
+
+    anyOf:
+      - required:
+          - port@1
+      - required:
+          - port@2
+
 patternProperties:
   '^connector@[0-9a-f]+$':
     $ref: /schemas/connector/usb-connector.yaml#
@@ -35,6 +135,40 @@ patternProperties:
 required:
   - compatible
 
+allOf:
+  - if:
+      required:
+        - no-hpd
+    then:
+      properties:
+        ports:
+          required:
+            - port@2
+  - if:
+      required:
+        - mux-gpios
+    then:
+      properties:
+        ports:
+          required:
+            - port@2
+  - if:
+      required:
+        - orientation-switch
+    then:
+      properties:
+        ports:
+          required:
+            - port@2
+  - if:
+      required:
+        - mode-switch
+    then:
+      properties:
+        ports:
+          required:
+            - port@2
+
 additionalProperties: false
 
 examples:
@@ -50,6 +184,8 @@ examples:
 
         typec {
           compatible = "google,cros-ec-typec";
+          orientation-switch;
+          mode-switch;
 
           #address-cells = <1>;
           #size-cells = <0>;
@@ -60,6 +196,99 @@ examples:
             power-role = "dual";
             data-role = "dual";
             try-power-role = "source";
+
+            ports {
+              #address-cells = <1>;
+              #size-cells = <0>;
+
+              port@0 {
+                reg = <0>;
+                usb_c0_hs: endpoint {
+                  remote-endpoint = <&usb_hub_dfp3_hs>;
+                };
+              };
+
+              port@1 {
+                reg = <1>;
+                usb_c0_ss: endpoint {
+                  remote-endpoint = <&cros_typec_c0_ss>;
+                };
+              };
+            };
+          };
+
+          connector@1 {
+            compatible = "usb-c-connector";
+            reg = <1>;
+            power-role = "dual";
+            data-role = "dual";
+            try-power-role = "source";
+
+            ports {
+              #address-cells = <1>;
+              #size-cells = <0>;
+
+              port@0 {
+                reg = <0>;
+                usb_c1_hs: endpoint {
+                  remote-endpoint = <&usb_hub_dfp2_hs>;
+                };
+              };
+
+              port@1 {
+                reg = <1>;
+                usb_c1_ss: endpoint {
+                  remote-endpoint = <&cros_typec_c1_ss>;
+                };
+              };
+            };
+          };
+
+          ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+              reg = <0>;
+              #address-cells = <1>;
+              #size-cells = <0>;
+
+              cros_typec_c0_ss: endpoint@0 {
+                reg = <0>;
+                remote-endpoint = <&usb_c0_ss>;
+                data-lanes = <0 1 2 3>;
+              };
+
+              cros_typec_c1_ss: endpoint@1 {
+                reg = <1>;
+                remote-endpoint = <&usb_c1_ss>;
+                data-lanes = <2 3 0 1>;
+              };
+            };
+
+            port@1 {
+              reg = <1>;
+              #address-cells = <1>;
+              #size-cells = <0>;
+
+              usb_in_0: endpoint@0 {
+                reg = <0>;
+                remote-endpoint = <&usb_ss_0_out>;
+              };
+
+              usb_in_1: endpoint@1 {
+                reg = <1>;
+                remote-endpoint = <&usb_ss_1_out>;
+              };
+            };
+
+            port@2 {
+              reg = <2>;
+              dp_in: endpoint {
+                remote-endpoint = <&dp_phy>;
+                data-lanes = <0 1>;
+              };
+            };
           };
         };
       };
-- 
https://chromeos.dev


