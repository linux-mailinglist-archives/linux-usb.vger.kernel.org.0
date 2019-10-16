Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 92590D86C5
	for <lists+linux-usb@lfdr.de>; Wed, 16 Oct 2019 05:35:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403808AbfJPDdq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 15 Oct 2019 23:33:46 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:40186 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730211AbfJPDdp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 15 Oct 2019 23:33:45 -0400
Received: by mail-pl1-f196.google.com with SMTP id d22so10568774pll.7
        for <linux-usb@vger.kernel.org>; Tue, 15 Oct 2019 20:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=GYRc8Evk3wu8EUiuELp77RSTyUut+SJabJSgyybQCKc=;
        b=e6dZ4jnOdh701k6NIby9LePCeZk359ThphqZ/2dmJcm5ahDdEyvbcCb7e1qoumSLz0
         8j+1PiF2T63bndbhCteIdZ/+q9rAHX7I70BI2N3BlLE9Mt562iWVzRA6MOYGzlpwWKcQ
         GxWtdyTnInOCSf5l461dxNA5c2yEklyi3Mzj6nxxJAWzf8tSW9nlA43PAX/DEFhL1x5K
         wmgkPA9ikT+8E1AQJ2eAIdMSaNcViHVg26qtyYT587vUUX/1mnFB4MICD79iJd31EkHg
         LFcGqZVjhYpd+WkBoT7+lhEmQevDkes86Ld4ASBmJgLVKKUK3mnqhH1jmHEmjuR00Kbw
         n2SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=GYRc8Evk3wu8EUiuELp77RSTyUut+SJabJSgyybQCKc=;
        b=X+qCpSjfgVpWjURbkIni6mscEXo1mY9XdcM2G2CLY4uC/9st+f105k6cGADURzLYkz
         QeTbSgwgcHFqEvVjc9ss+c1j3XmKmD1jnHf0pmcuRMuYo4Sz795GP7oQo2wtWTlxxluq
         DYmkhx/YETLnOLLPB2VgLgVx6Jt886/yyDuGiY7l4m+IAeu9Y0W6TSQllNNoNMfkUZPx
         0rPGTkXe/oj2FNvcyHNf9qXNZhQwvYoM9Exs26YP+8oHiniS6Mbqe2OHxTaZBLnRS/41
         1cnFmHmGzEspQU1lRDexW15M2qayc2SZ3dx0oz+5LUiZ9ZvPODYGiPsFszBHc4Witx0y
         6z0g==
X-Gm-Message-State: APjAAAXBoJtIwQA31KzoFEW737u9fhQj1rOF9myb8J8QODQnx/uA9okG
        oQgzypjnoIy13VeQfHGh8UCWtw==
X-Google-Smtp-Source: APXvYqzi4gPMxKJwhqOxXiD5FPvDSBSoufhfjLaVn4yXk8AEbK4UogbAw0pn+zPiG0oPOnXiM33JVw==
X-Received: by 2002:a17:902:a988:: with SMTP id bh8mr39613879plb.303.1571196824723;
        Tue, 15 Oct 2019 20:33:44 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id l23sm748356pjy.12.2019.10.15.20.33.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2019 20:33:44 -0700 (PDT)
From:   John Stultz <john.stultz@linaro.org>
To:     lkml <linux-kernel@vger.kernel.org>
Cc:     John Stultz <john.stultz@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        ShuFan Lee <shufan_lee@richtek.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Yu Chen <chenyu56@huawei.com>, Felipe Balbi <balbi@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Jun Li <lijun.kernel@gmail.com>,
        Valentin Schneider <valentin.schneider@arm.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org
Subject: [RFC][PATCH v3 01/11] dt-bindings: usb: rt1711h: Add connector bindings
Date:   Wed, 16 Oct 2019 03:33:30 +0000
Message-Id: <20191016033340.1288-2-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191016033340.1288-1-john.stultz@linaro.org>
References: <20191016033340.1288-1-john.stultz@linaro.org>
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

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
CC: ShuFan Lee <shufan_lee@richtek.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Yu Chen <chenyu56@huawei.com>
Cc: Felipe Balbi <balbi@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Jun Li <lijun.kernel@gmail.com>
Cc: Valentin Schneider <valentin.schneider@arm.com>
Cc: linux-usb@vger.kernel.org
Cc: devicetree@vger.kernel.org
Reviewed-by: Rob Herring <robh@kernel.org>
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

