Return-Path: <linux-usb+bounces-4009-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8360680E436
	for <lists+linux-usb@lfdr.de>; Tue, 12 Dec 2023 07:23:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0DA8D1F21FC6
	for <lists+linux-usb@lfdr.de>; Tue, 12 Dec 2023 06:23:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E74F15ADA;
	Tue, 12 Dec 2023 06:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GeMJuoqa"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com [IPv6:2001:4860:4864:20::34])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78361C3;
	Mon, 11 Dec 2023 22:23:05 -0800 (PST)
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-1fab887fab8so4026973fac.0;
        Mon, 11 Dec 2023 22:23:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702362185; x=1702966985; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=trvLPWdMf9ONBuz1cwMATx3gpPUiFzy4m+MU7IJ3tNw=;
        b=GeMJuoqaSXmh1ZQcy0Stc32bnyJK3eQoMQwldFaC+OQU2kmeiQfapaKxsyjVYTKNjG
         1Uv3p0JbVyKNXzD/2JyjylVM1l0AqWKD8JxtP1vFYaIM4HcwiaOtu90jnD9PYKxcWxNh
         +sDg/gDWxd3KpiveNOnYQDXwrhTggdSt6gI3uncqWXOH+lXRayZVOhiJowBuDdymwa2D
         OGeVIXtVbi3MgULtrxK5ZtTQfIBq39i/D1dyhHyICQSBoozfpMAnHmkXupn/4Q87/09g
         0+PwGoKob+g7aqsFjVoVS/XkFmXLYUucDDyfndcANmX2oiFZY8T1OISxNlTuRxKNwP1Q
         znmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702362185; x=1702966985;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=trvLPWdMf9ONBuz1cwMATx3gpPUiFzy4m+MU7IJ3tNw=;
        b=G23yMl1XOO/ExhjHCPxc+PKXqui9FuvsiTllnPdvyW8YWeGXy5nEoT/CiMfx8hoiCT
         tZ4UYVrcx8ScRzfL3qD3AQnxDK392ni1wQ+k36ufnWCJ4RItX5kr/AsLo0sZf/86lAmF
         tjbSeLSF6s/+OdnL+Hsu04f72jU2mVvqhVLYI4Y3wV4+6ClgSu7Q+PWfKtrkzgE151dX
         I8YRGK29HjRdHfEB0uKqVwWc0fhWAHZieW4+tXLxMS/SQI+/LfhcklL/SME0Y3CFphSD
         29lZaJk30Kwf1OVqDJnLWtez8YLxeWl77gF40sQcBX0914ozJQcmkRC+wEQT7mxqiaVn
         NAJQ==
X-Gm-Message-State: AOJu0Yzrk5tNpqptHyrIjD7K0gkTnu9Iigxv4qftDDNM5LutOVO+cV6M
	p1WhqMcpPnSpbaho4iim+B07MRUwp4iHzctGHTI=
X-Google-Smtp-Source: AGHT+IHH9MpYlWrKCKBE94gDOEjFql0vjoN8nxr8qktyfZX3jatGWzYfF+weG7CtlS8kQc0ez1Mfxc+PNaJXJpMHBSg=
X-Received: by 2002:a05:6870:70a4:b0:1fb:75c:4016 with SMTP id
 v36-20020a05687070a400b001fb075c4016mr7403693oae.118.1702362184693; Mon, 11
 Dec 2023 22:23:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231204144429.45197-1-linux.amoon@gmail.com> <20231204144429.45197-2-linux.amoon@gmail.com>
 <20231206135311.GA2043711-robh@kernel.org> <CANAwSgTS0ZSFPv4x803pCLEpjH5imh8vEoWpbiJRH14Sy3GZww@mail.gmail.com>
 <21673bfd-bb87-4c7d-a53f-337c263f3a00@linaro.org> <CANAwSgSo37B0zg-xjrmqndSZ5SbyB3m27_wRsqqN9WTONooeiw@mail.gmail.com>
 <604e653d-c1e2-45c7-b121-8a6b4be5c6bb@linaro.org> <CANAwSgRB=XWo2-40rDru=Zy277-kgGNjozJ8Lxnxgv_4ABB-kg@mail.gmail.com>
 <1a78d453-62a2-410a-a40f-1ff0c2b62e86@linaro.org> <CANAwSgTy4N7Q8e0OQLsFRkRDWksTSbkOetKQGygaqsQ8++U1_g@mail.gmail.com>
 <2e688f4e-11d7-4f8e-b8ec-58f4a97304a8@linaro.org>
In-Reply-To: <2e688f4e-11d7-4f8e-b8ec-58f4a97304a8@linaro.org>
From: Anand Moon <linux.amoon@gmail.com>
Date: Tue, 12 Dec 2023 11:52:48 +0530
Message-ID: <CANAwSgQstkS-SDaV2hj0fimt7vgfEgOT_x4efshZ6sZQ0gWSEA@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] dt-bindings: usb: Add the binding example for the
 Genesys Logic GL3523 hub
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Icenowy Zheng <uwu@icenowy.me>, Neil Armstrong <neil.armstrong@linaro.org>, 
	linux-amlogic@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

On Fri, 8 Dec 2023 at 17:47, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 08/12/2023 12:19, Anand Moon wrote:
> > Hi Krzysztof,
> >
> > On Fri, 8 Dec 2023 at 13:14, Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> >>
> >> On 08/12/2023 01:24, Anand Moon wrote:
> >>>>>>>
> >>>>>>> If I move reset-gpios to required, I observe the below warning.
> >>>>>>>
> >>>>>>>   DTC_CHK Documentation/devicetree/bindings/usb/maxim,max33359.example.dtb
> >>>>>>> /home/alarm/linux-amlogic-5.y-devel/Documentation/devicetree/bindings/usb/usb-device.example.dtb:
> >>>>>>> hub@1: 'reset-gpio' is a required property
> >>>>>>>         from schema $id: http://devicetree.org/schemas/usb/genesys,gl850g.yaml#
> >>>>>>
> >>>>>> Where are the properties defined? If you open the binding you see:
> >>>>>> nowhere. You cannot define properties in some variant with "true".
> >>>>>> Please define all of them in top-level and only narrow/constrain when
> >>>>>> applicable.
> >>>>>>
> >>>>> What I meant is the example below, required meant applicable for both
> >>>>> the binding
> >>>>> But it shows me the above warning.
> >>>>
> >>>> My explanation stands... So again:
> >>>>
> >>>>>> Please define all of them in top-level and only narrow/constrain when
> >>>>>> applicable.
> >>>>
> >>> Apologies, But I have tried this multiple times but have not been able
> >>> to fix the device tree warning
> >>
> >> Did you document all properties in top-level "properties:" block?
> >>
> > Yes, I have,
> >
> > Can you suggest a couple of examples to follow?
> > I looked at some of the YAML files but could not fix my issue.
>
> 99% of bindings. Look also at example-schema.
>
> You can also attach here complete patch for fast look / short review.
>

Please find the modified patch, I have tried a few things but none
resolve the binding warning.
I am not able to debug this.

-Thanks
Anand
-----8<----------8<----------8<----------8<----------8<----------8<-----
diff --git a/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
b/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
index ee08b9c3721f..7f75fa3c1945 100644
--- a/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
+++ b/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
@@ -9,9 +9,6 @@ title: Genesys Logic USB hub controller
 maintainers:
   - Icenowy Zheng <uwu@icenowy.me>

-allOf:
-  - $ref: usb-device.yaml#
-
 properties:
   compatible:
     enum:
@@ -27,11 +24,47 @@ properties:

   vdd-supply:
     description:
-      the regulator that provides 3.3V core power to the hub.
+      The regulator that provides 3.3V or 5.0V core power to the hub.
+
+  peer-hub:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      For onboard hub controllers that support USB 3.x and USB 2.0 hubs with
+      shared resets and power supplies, this property is used to identify the
+      hubs with which these are shared.

 required:
   - compatible
   - reg
+  - vdd-supply
+  - reset-gpios
+  - peer-hub
+
+allOf:
+  - $ref: usb-device.yaml#
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - usb5e3,608
+    then:
+      properties:
+        peer-hub: false
+        vdd-supply: false
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - usb5e3,610
+              - usb5e3,620
+    then:
+      properties:
+        peer-hub: true
+        vdd-supply: true

 additionalProperties: false

@@ -49,3 +82,29 @@ examples:
             reset-gpios = <&pio 7 2 GPIO_ACTIVE_LOW>;
         };
     };
+
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    usb {
+        dr_mode = "host";
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        /* 2.0 hub on port 1 */
+        hub_2_0: hub@1 {
+            compatible = "usb5e3,610";
+            reg = <1>;
+            peer-hub = <&hub_3_0>;
+            reset-gpios = <&gpio 20 GPIO_ACTIVE_LOW>;
+            vdd-supply = <&vcc_5v>;
+        };
+
+        /* 3.1 hub on port 4 */
+        hub_3_0: hub@2 {
+            compatible = "usb5e3,620";
+            reg = <2>;
+            peer-hub = <&hub_2_0>;
+            reset-gpios = <&gpio 20 GPIO_ACTIVE_LOW>;
+            vdd-supply = <&vcc_5v>;
+        };
+    };

