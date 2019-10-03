Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8FD6DC96EE
	for <lists+linux-usb@lfdr.de>; Thu,  3 Oct 2019 05:22:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727160AbfJCDWj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 2 Oct 2019 23:22:39 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:32915 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726326AbfJCDWj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 2 Oct 2019 23:22:39 -0400
Received: by mail-pf1-f196.google.com with SMTP id q10so813370pfl.0
        for <linux-usb@vger.kernel.org>; Wed, 02 Oct 2019 20:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=Qcbatkrbyyrp3eBE32fuNXC7/HcaftiTNzoulB+n+F0=;
        b=vA9rJV6W6StGzq8ac3QtjivxEU9aoBXxLYIHjyDMcFzWXLUuKJR6aLVf8SrVkfbmGx
         1alqxZaX/KTfcm2X/rJpq3MCA3BbDSQgyrtWgtMk2BvtyLbzuVkey5qqOIDMdbNb+5zL
         0QSW2Umv2uJ12YiDOQ73F2ufn8fUJgbKxNCV7AvBHGVIH72OVQCoGMT8+p35apaUVLye
         7obZ3IabS34qjjCLeP0XLoP2vUDuVIs2qejPcLp9tDZ/Jr4xk0b0lKfMylA73QHevBE8
         OzpwUj3WJ248qonmDXzkU8aTrKDi5bxHfWdb2MQbg1BW/6Mv4yEtgtNmuVwbIgMZVY0w
         YWbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Qcbatkrbyyrp3eBE32fuNXC7/HcaftiTNzoulB+n+F0=;
        b=QeezSMkc43uUCrKK1SXfeMGn7B5Jw59b0jjBOIFcN+gnhzO3OVQNm7Usm0lpvlDE1B
         g656GT5F49uH24vt9Mz5Lh9Y+9btm+9E0Rr287mNLl7dArBK5K8QCN3hIFatJildW0JC
         y3dY5TJ16S1t4Mtbuq/kAuR2OVG+SWZjN0MrNmWsj8WgChtMcKTFlaNy8sAD7ADwMrSd
         3EWiWVE/Fxy5pcqFIwEsrG06isOFKJJlLcuohorZNkdjMxOYSq55+3AC2dZS+N8Upe5i
         zGtyd+2qlrB8KxLKGRFgN780Whz+o2OYgPSYA5INYv4sHPWaO+FPfeVVUcgtJn3PHkGI
         Pxmg==
X-Gm-Message-State: APjAAAUrJT68NJbV18l1N02QMrsjWTwX3OlrG2WdF+0ZolXVMNCopgAe
        98R4jd3EBFeDldyhJ3ypD8Nzcg==
X-Google-Smtp-Source: APXvYqx2lOV0eh+Ow8KeLKSt9Zas93Pb/ThAgFgUhO+p+JCOUsHOJLJdQpDh8zxXHDvsj/W+AjVgAw==
X-Received: by 2002:a63:5005:: with SMTP id e5mr7521362pgb.442.1570072957845;
        Wed, 02 Oct 2019 20:22:37 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id d76sm801914pga.80.2019.10.02.20.22.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2019 20:22:36 -0700 (PDT)
From:   John Stultz <john.stultz@linaro.org>
To:     lkml <linux-kernel@vger.kernel.org>
Cc:     John Stultz <john.stultz@linaro.org>,
        ShuFan Lee <shufan_lee@richtek.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [RFC][PATCH] dt-bindings: usb: rt1711h: Add connector bindings
Date:   Thu,  3 Oct 2019 03:22:32 +0000
Message-Id: <20191003032232.115832-1-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add connector binding documentation for Richtek RT1711H Type-C
chip driver

It was noted by Rob Herring that the rt1711h binding docs
doesn't include the connector binding.

Thus this patch adds such documentation following the details
in Documentation/devicetree/bindings/usb/typec-tcpci.txt

CC: ShuFan Lee <shufan_lee@richtek.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: linux-usb@vger.kernel.org
Cc: devicetree@vger.kernel.org
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
 .../bindings/usb/richtek,rt1711h.txt          | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/richtek,rt1711h.txt b/Documentation/devicetree/bindings/usb/richtek,rt1711h.txt
index d4cf53c071d9..e3fc57e605ed 100644
--- a/Documentation/devicetree/bindings/usb/richtek,rt1711h.txt
+++ b/Documentation/devicetree/bindings/usb/richtek,rt1711h.txt
@@ -6,10 +6,39 @@ Required properties:
  - interrupts : <a b> where a is the interrupt number and b represents an
    encoding of the sense and level information for the interrupt.
 
+Required sub-node:
+- connector: The "usb-c-connector" attached to the tcpci chip, the bindings
+  of connector node are specified in
+  Documentation/devicetree/bindings/connector/usb-connector.txt
+
 Example :
 rt1711h@4e {
 	compatible = "richtek,rt1711h";
 	reg = <0x4e>;
 	interrupt-parent = <&gpio26>;
 	interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
+
+	usb_con: connector {
+		compatible = "usb-c-connector";
+		label = "USB-C";
+		data-role = "dual";
+		power-role = "dual";
+		try-power-role = "sink";
+		source-pdos = <PDO_FIXED(5000, 2000, PDO_FIXED_USB_COMM)>;
+		sink-pdos = <PDO_FIXED(5000, 2000, PDO_FIXED_USB_COMM)
+			     PDO_VAR(5000, 12000, 2000)>;
+		op-sink-microwatt = <10000000>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@1 {
+				reg = <1>;
+				usb_con_ss: endpoint {
+					remote-endpoint = <&usb3_data_ss>;
+				};
+			};
+		};
+	};
 };
-- 
2.17.1

