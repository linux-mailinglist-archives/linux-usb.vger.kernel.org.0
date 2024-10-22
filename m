Return-Path: <linux-usb+bounces-16518-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 523249A9FFC
	for <lists+linux-usb@lfdr.de>; Tue, 22 Oct 2024 12:27:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D6DE31F23F4E
	for <lists+linux-usb@lfdr.de>; Tue, 22 Oct 2024 10:27:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FA8F19B3E3;
	Tue, 22 Oct 2024 10:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KygAGPNS"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 379DA19ABAB
	for <linux-usb@vger.kernel.org>; Tue, 22 Oct 2024 10:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729592837; cv=none; b=ZGgyJ7W25lTQUT8HTmsd97rq+s0N855LQ4sMvkIwZ6PqNWZJjd9gG+94yZhyT/0bu/XuR+c0lS9TcrnxGLRbF23nhXx8JNMocg/r3gX/p2dx/LxHFC8wcE8lLiuJ26mbKzKls+LcDRgfy62LBaHwh+UI+IxCjCXogTb0TW8pihY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729592837; c=relaxed/simple;
	bh=9fRQ6n/qsT4Eo4o8dtxsoT2LEgiFvt7RuxiVrOmz67M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QobM3MiePb1psYlo+lr5PuXX0yHI27qhDJeU98pHWwSeX/C5hrG1B/YLGHGw+ucIIdrIlL5pG8Ellu98+HUikVGZkSKpWwUTsdTyCdufz35dYA8WGYYUrtN+kZqUQZLB3LL2sjJWW11pF4BPtuCKGFwLAzJp+pBBvHgcH7+9EeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KygAGPNS; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4315abed18aso50828835e9.2
        for <linux-usb@vger.kernel.org>; Tue, 22 Oct 2024 03:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729592833; x=1730197633; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dWCtht+OoWB12NCCbJohh/zQ+S38rmPfIVCAzkodcBA=;
        b=KygAGPNSDwj+b6WAWddOEgSHPgHhrl1PvlIU7cLX6LbLReFMGD2WhMXjM9Yl+GR3Ul
         kXqygDptCOdUxPNUh8AYwYW+SHpU/IDSYdHgDDuwH5PoXppV2hRh3HHZaxiLlREj5EWr
         L8UMICk2HZauHmPJcB+1g7yWJeXo42kTONAFy0Im+lYGgIQPJupXlP+40F3b4S8ju4sQ
         OII3dtdpkPfMyacpJDGUorqUMP5Fuf2MqgwLJiNScPVI9ix/DeqfgCV9C13jGnONhUhy
         Xta9wKTaVGfZcfJ8PTKMslm3gwoziF7SaS1DedHRCSbYiT4FmzyFLhSePFB6TOgP/etN
         i74w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729592833; x=1730197633;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dWCtht+OoWB12NCCbJohh/zQ+S38rmPfIVCAzkodcBA=;
        b=M+hneZdHZhcwyIaah1qunZv2bP6URoaBSRMvM3lRRQJc6Iq/734lYAAEDzRGpgV5Pz
         wqdSefZ2tUxkeC47ys3lNHmOMEdTCOcKgp3bRNGkqdfgKimWd6+Pa8DGHqGM6a0ERNHX
         dlWIxFp43vqYGnwECIshiLpj/7Z2LWT4z19VuIUVzz7X6CH0O2/pnQP84DkiO4rGUsQH
         rQXFxXOq2zaIRryTD0dfTgYmX6VinBHxOrAHq9W1Ns/FG4g+k9wGkTNY9sJOsmGaex82
         FPUXtvoq3qzdjz7lxSVdCld60k566vADIb2mllh2zpFvQ6Tkxh+yYYoDk/RxECRHnLBD
         s8ug==
X-Forwarded-Encrypted: i=1; AJvYcCVADEeFs92FAlz1hDQqYPzTp3lV4mKx95S1jR0nX2f3HxAlhO6JFfFjKQyuOhFHLDtRiRwKKMGxmFk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzwRyCt52dVrtq1MdrSaZAoq7fO5SxZvCp7KbzsyNcM4Yoo4+pJ
	jqcFxqa8djtUeDqdnRQGgUnb/1dRKfztQ0itDaWxWUVsArbtOrjmNrLS+INanPunt4IxwYUTMPB
	X
X-Google-Smtp-Source: AGHT+IGfgr7tyJC12Fmn3Oe6eVtTlsH5ZYzur2/bdoxM7nF+dK6YBfkfJ3j91qi2gldb7K51Lg0KkQ==
X-Received: by 2002:adf:e70c:0:b0:37d:4846:3d29 with SMTP id ffacd0b85a97d-37ea2198725mr10182676f8f.28.1729592833384;
        Tue, 22 Oct 2024 03:27:13 -0700 (PDT)
Received: from [127.0.1.1] ([82.76.168.176])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0b94048sm6285184f8f.85.2024.10.22.03.27.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 03:27:13 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Tue, 22 Oct 2024 13:26:54 +0300
Subject: [PATCH v3 1/4] dt-bindings: usb: Add Parade PS8830 Type-C retimer
 bindings
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241022-x1e80100-ps8830-v3-1-68a95f351e99@linaro.org>
References: <20241022-x1e80100-ps8830-v3-0-68a95f351e99@linaro.org>
In-Reply-To: <20241022-x1e80100-ps8830-v3-0-68a95f351e99@linaro.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Rajendra Nayak <quic_rjendra@quicinc.com>, 
 Sibi Sankar <quic_sibis@quicinc.com>, Johan Hovold <johan@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Trilok Soni <quic_tsoni@quicinc.com>, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3623; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=9fRQ6n/qsT4Eo4o8dtxsoT2LEgiFvt7RuxiVrOmz67M=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBnF3344rsQ7Lqt78Ied8Q9JJHvAYQrJMJO76p7g
 M/NjF/4UfaJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZxd9+AAKCRAbX0TJAJUV
 VsErD/99GOp0pKiCdrrqBBy4RM+7vUBpdCq0nb4v+yKBmKUmBf+WmjQac7QUF88fyRKcKIj+V/3
 fe8/PUbNFsLHrIbZs/sFiuH0fvOuzBM9mqZuagVu99ZdtiN8eLC3uvVBU6cXwm1z4MgV2D0y3Hk
 txYleU27gNE43DLzcJlYaIGgxHPtPoNNwi4Xnr2zAZjm7KagwrqdkdPGH6PN1wd/QXRRiRq1XhP
 StP5g4YNTADqas2rkImRXs67opTRQWAvpkWqe7OGXUDdhkux2KjTjmZPAe0rFGaQv31klkVatvG
 KjYi3SYHwdldtHQj1UPUl1Y0MB/ERvnKWwgcCKuTZk7EzlyJYOvUTOPqnhoRohIne9zUNRdzJNF
 FQsD7nN1ENoaIqbmt6iFnw+0Lu0jb0ofOB3pepOJCpHWATcgbGUV6m4t0+pVeiHL/BGmiGzTBaj
 expCv7hxyN+BhsfrY8r0MhrbNQSgNr2sRXq4Q6SMWsAEx1oYa7H5Ypj1xdHKi/FpX53SwaYkrLw
 6aFY7m0QC+ZSLw6WfBTcU7A2xgqjoHFkpKKbfFwu3Z3gg2cdIym0ztkiAkCp37Xlkux6UjzLjFn
 5PpWtrAZIDUtiDide3J4YuaEvQkMqWzlpS2YM9iyuwQzzcdHRCRtssZAdU0gX3Ebnhrv/TFYO+D
 +qgA4nBIfxMUQpg==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

Document bindings for the Parade PS8830 Type-C retimer. This retimer is
currently found on all boards featuring Qualcomm Snapdragon X Elite SoCs
and it is needed to provide altmode muxing between DP and USB, but also
connector orientation handling between.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 .../devicetree/bindings/usb/parade,ps8830.yaml     | 129 +++++++++++++++++++++
 1 file changed, 129 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/parade,ps8830.yaml b/Documentation/devicetree/bindings/usb/parade,ps8830.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..ee4c69eca6066e4da0373fad6c25d6e9fff83366
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/parade,ps8830.yaml
@@ -0,0 +1,129 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/parade,ps8830.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Parade PS8830 USB and DisplayPort Retimer
+
+maintainers:
+  - Abel Vesa <abel.vesa@linaro.org>
+
+properties:
+  compatible:
+    enum:
+      - parade,ps8830
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: XO Clock
+
+  clock-names:
+    items:
+      - const: xo
+
+  ps8830,boot-on:
+    description: Left enabled at boot, so skip resetting
+    type: boolean
+
+  reset-gpios:
+    maxItems: 1
+
+  vdd-supply:
+    description: power supply (1.07V)
+
+  vdd33-supply:
+    description: power supply (3.3V)
+
+  vdd33-cap-supply:
+    description: power supply (3.3V)
+
+  vddar-supply:
+    description: power supply (1.07V)
+
+  vddat-supply:
+    description: power supply (1.07V)
+
+  vddio-supply:
+    description: power supply (1.2V or 1.8V)
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - reset-gpios
+  - vdd-supply
+  - vdd33-supply
+  - vdd33-cap-supply
+  - vddat-supply
+  - vddio-supply
+  - orientation-switch
+  - retimer-switch
+
+allOf:
+  - $ref: usb-switch.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        typec-mux@8 {
+            compatible = "parade,ps8830";
+            reg = <0x8>;
+
+            clocks = <&clk_rtmr_xo>;
+            clock-names = "xo";
+
+            vdd-supply = <&vreg_rtmr_1p15>;
+            vdd33-supply = <&vreg_rtmr_3p3>;
+            vdd33-cap-supply = <&vreg_rtmr_3p3>;
+            vddar-supply = <&vreg_rtmr_1p15>;
+            vddat-supply = <&vreg_rtmr_1p15>;
+            vddio-supply = <&vreg_rtmr_1p8>;
+
+            reset-gpios = <&tlmm 10 GPIO_ACTIVE_LOW>;
+
+            retimer-switch;
+            orientation-switch;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+
+                    endpoint {
+                        remote-endpoint = <&typec_con_ss>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+
+                    endpoint {
+                        remote-endpoint = <&usb_phy_ss>;
+                    };
+                };
+
+                port@2 {
+                    reg = <2>;
+
+                    endpoint {
+                        remote-endpoint = <&typec_dp_aux>;
+                    };
+                };
+            };
+        };
+    };
+...

-- 
2.34.1


