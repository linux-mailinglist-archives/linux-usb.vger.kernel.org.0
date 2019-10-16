Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 24AD6D86A3
	for <lists+linux-usb@lfdr.de>; Wed, 16 Oct 2019 05:34:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403921AbfJPDeC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 15 Oct 2019 23:34:02 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:33597 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403898AbfJPDeA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 15 Oct 2019 23:34:00 -0400
Received: by mail-pg1-f193.google.com with SMTP id i76so13415048pgc.0
        for <linux-usb@vger.kernel.org>; Tue, 15 Oct 2019 20:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=g5sQMXSMdWuSqvmdQD58X3h1zk5SjaH8Y+Tanu+qv7s=;
        b=xYd2AltOxj3y/Ve5vEQPkHNfpCqVzUI4h1Hkf4GwUtrRjBAR3I8+P5vvRXlAMF+VIj
         lOAoFNsMsXMtTUfsDZmToG3ETzPD4KKFUT+JgO5tIITA5efcDQc7e5ADqNqyf7OnBFo7
         8Trebi8naNe9Hrv3Wf8lzKTYnqJv/rBY0PwLAhpC6iOmx5HUgiovPLa/tEUg7wBG1iiu
         Q4aJv6u02XbtnyN0bEGS6bXVcn/wWy9ewpbWtyWcud7BrGvhVM2CKEdrJqo9/fTpDlwd
         D7Bhmm6SQvPwc6Wi0UibcLOg/tqbRtIh9CqaWfWS63sbVEk2I4v0MryE86bkFYVz1Ud6
         CcrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=g5sQMXSMdWuSqvmdQD58X3h1zk5SjaH8Y+Tanu+qv7s=;
        b=uiA7Eqm4NB6h3uHiptYCgnoa2JbWjA/V3tKv+IQpxUXixHRpZh8Pt1i6HwD5WnR7ZJ
         B+Rt1bxjidGqP8WVXHGnpXk7+9bPdbVTJ6uJ9ZjQ322Rie2N+iLdamsEauOiPof7fNzX
         Fvzu+fbiILU5LWgK/FlXpVCdFQRB3BcodQm+DLli7Z7HJD+aW4c4K1SNbQcJnNMvcvQa
         yIc/7d/Xd/j/lYEOHTcDFoHx7NkfKqm1IcWcICz84azzzis9w5OBBSoQAJqg2fztgnbE
         eRK0gKbbwN/xxB9+3sZZaZG9DMGUk1nRDBtFDZp+H2XvV4ROBf2x1KiNXsD7wj6YJPBH
         G/RA==
X-Gm-Message-State: APjAAAV9IVTsvGkZ1NbEedShZcwGW9z0mm9k/DJVpRb075SUKjlTzWKH
        nGwCH47zLZuO/ziBlyU9JjrYZpb2Frw=
X-Google-Smtp-Source: APXvYqxdFeMofjrhcmy13r5JUspDNYDwqOMXH2WgRGuNbN+bj9FrOOgg9uXV3EB0TMfrXMdil541Aw==
X-Received: by 2002:aa7:908b:: with SMTP id i11mr42817988pfa.186.1571196839121;
        Tue, 15 Oct 2019 20:33:59 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id l23sm748356pjy.12.2019.10.15.20.33.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2019 20:33:58 -0700 (PDT)
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
Subject: [RFC][PATCH v3 10/11] dt-bindings: misc: Add bindings for HiSilicon usb hub and data role switch functionality on HiKey960
Date:   Wed, 16 Oct 2019 03:33:39 +0000
Message-Id: <20191016033340.1288-11-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191016033340.1288-1-john.stultz@linaro.org>
References: <20191016033340.1288-1-john.stultz@linaro.org>
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

