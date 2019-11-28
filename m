Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 48FA910C367
	for <lists+linux-usb@lfdr.de>; Thu, 28 Nov 2019 06:10:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727113AbfK1FKN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 28 Nov 2019 00:10:13 -0500
Received: from mail-pj1-f67.google.com ([209.85.216.67]:39429 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727034AbfK1FKM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 28 Nov 2019 00:10:12 -0500
Received: by mail-pj1-f67.google.com with SMTP id v93so8060152pjb.6
        for <linux-usb@vger.kernel.org>; Wed, 27 Nov 2019 21:10:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=VUmL4qLsieRvwPq6R62FHNU4t8q1oQ82Y1SNhYOmg5k=;
        b=D/EdEpZqCCtTGiwmEC6gq+PCA/Y+yTDJREnWu59+lBpHibMPIellRcG6NR3zwBZ/xx
         OLmVSLIv3eX7q3wLN9j+c2n0JjO5XplIw9WMd8uSDYe9OF95xpsuAd8rk29X/Hd+01Tj
         W77VEvKvNu60Xa6aMADiIWzQknKzchQvsD3dVqfzNqGHNe3VmiYARrwxWMJ4D1w0fl0K
         YRo62TEYKYB4WuHdY/Xeige/XvQ222CnRfEmh67QgYKqArYKhs+IjP/Xf4D9lvoyCumN
         HsH+6Y+XfFdBvJGolCgcSWJYxQkhAOebHTwJaN77THPerQMMc+RHJoa0BAYcxkRiZkBZ
         XZ7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=VUmL4qLsieRvwPq6R62FHNU4t8q1oQ82Y1SNhYOmg5k=;
        b=ZuYG7Me9LarbVAtpWBsLEUt/oqDdi9Rqkz0kFosSsbOCXQKZmGZz+cx9VofyVdKD6h
         JX9gl650zb22Jw1ZtrbaEMPCcMA3MWUEhQoQn3zIUGrdnIK0icYvDLBJE+ZxBU3qZgmO
         2gYP3H4kCSNLnA01VKuSimBah5Ng1YXD4c1hcyxfjxJnHyD7hafmS1qYUISBAzC5cEUe
         MSZi3OOwtwEDIVF513j51TNMwULP70waHWzw/EICcRNjUp8v7ri6V7NZ3a8Me1WKjv3w
         ehenwJtKhFdWJrI2r0S6Dr+wZAEt3jm+/4qxYH02c5/e8CnzyhJ88f0z3fGYNBL6N5mt
         QAag==
X-Gm-Message-State: APjAAAVUTp9/Z6+wEWXWga9uGEzK1Z74zvwggJAQedhoqvQqDH0ysWJn
        AjCE1SifZgvt5Gd18yaTiho2nA==
X-Google-Smtp-Source: APXvYqw1Rx241aQ1QD+PueNp8aW3lcCk1ns7N57sTu49O5IMq1I9NZ4kt+Nn94dM2CeRSzBJKvW8ow==
X-Received: by 2002:a17:90a:65cb:: with SMTP id i11mr10354421pjs.23.1574917811857;
        Wed, 27 Nov 2019 21:10:11 -0800 (PST)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id j20sm17799838pff.182.2019.11.27.21.10.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2019 21:10:11 -0800 (PST)
From:   John Stultz <john.stultz@linaro.org>
To:     lkml <linux-kernel@vger.kernel.org>
Cc:     Yu Chen <chenyu56@huawei.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        ShuFan Lee <shufan_lee@richtek.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Felipe Balbi <balbi@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Jun Li <lijun.kernel@gmail.com>,
        Valentin Schneider <valentin.schneider@arm.com>,
        Jack Pham <jackp@codeaurora.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, John Stultz <john.stultz@linaro.org>
Subject: [PATCH v6 7/8] dt-bindings: misc: Add bindings for HiSilicon usb hub and data role switch functionality on HiKey960
Date:   Thu, 28 Nov 2019 05:10:00 +0000
Message-Id: <20191128051001.18995-8-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191128051001.18995-1-john.stultz@linaro.org>
References: <20191128051001.18995-1-john.stultz@linaro.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Yu Chen <chenyu56@huawei.com>

This patch adds binding documentation to support usb hub and usb
data role switch of Hisilicon HiKey960 Board.

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
Cc: Jack Pham <jackp@codeaurora.org>
Cc: linux-usb@vger.kernel.org
Cc: devicetree@vger.kernel.org
Signed-off-by: Yu Chen <chenyu56@huawei.com>
Signed-off-by: John Stultz <john.stultz@linaro.org>
Change-Id: I3f111b39b7a982b3489549076412a2f7c3c3d008
---
v3: Reworked as usb-role-switch intermediary
---
 .../bindings/misc/hisilicon-hikey-usb.txt     | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/misc/hisilicon-hikey-usb.txt

diff --git a/Documentation/devicetree/bindings/misc/hisilicon-hikey-usb.txt b/Documentation/devicetree/bindings/misc/hisilicon-hikey-usb.txt
new file mode 100644
index 000000000000..1e131b38230d
--- /dev/null
+++ b/Documentation/devicetree/bindings/misc/hisilicon-hikey-usb.txt
@@ -0,0 +1,40 @@
+Support usb hub and usb data role switch of Hisilicon HiKey960 Board.
+
+-----------------------------
+
+Required properties:
+- compatible: "hisilicon,gpio_hubv1"
+- typec-vbus-gpios: gpio to control the vbus of typeC port
+- otg-switch-gpios: gpio to switch DP & DM between the hub and typeC port
+- hub-vdd33-en-gpios: gpio to enable the power of hub
+- pinctrl-names: pin configuration state name ("default")
+- pinctrl-0: pinctrl config
+- usb-role-switch: flags the driver as a role switch provider
+- ports: two endpoints to connect the usb core role switch provider
+	 to the usb-c tcpm driver.
+
+Example
+-----
+	hisi_hikey_usb: hisi_hikey_usb {
+		compatible = "hisilicon,gpio_hubv1";
+		typec-vbus-gpios = <&gpio25 2 GPIO_ACTIVE_HIGH>;
+		otg-switch-gpios = <&gpio25 6 GPIO_ACTIVE_HIGH>;
+		hub-vdd33-en-gpios = <&gpio5 6 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&usbhub5734_pmx_func>;
+		usb-role-switch;
+
+		port {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			hikey_usb_ep0: endpoint@0 {
+				reg = <0>;
+				remote-endpoint = <&dwc3_role_switch>;
+			};
+			hikey_usb_ep1: endpoint@1 {
+				reg = <1>;
+				remote-endpoint = <&rt1711h_ep>;
+			};
+		};
+	};
-- 
2.17.1

