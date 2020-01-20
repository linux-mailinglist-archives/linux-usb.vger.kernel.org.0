Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BDD0D142FD3
	for <lists+linux-usb@lfdr.de>; Mon, 20 Jan 2020 17:31:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729751AbgATQbk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 Jan 2020 11:31:40 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:54108 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729596AbgATQbI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 20 Jan 2020 11:31:08 -0500
Received: by mail-wm1-f68.google.com with SMTP id m24so204756wmc.3
        for <linux-usb@vger.kernel.org>; Mon, 20 Jan 2020 08:31:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4Kx77RkRZ6BLkxPPbqLY1opgnPyzoSH+OO3s+PAvU9w=;
        b=BJEfEYsP7dkNBq/ZXZrw1WeIwoHH6Y3/6fejM2G4jDVOeGOjUzz72jCC3ygm2JNOJI
         +D3smzukgxj94czG8PmnpA1mWLB9sI6JPgNinHewmz7ixadliLPaaPQJ5ZQinzr0WXpP
         n5xeJux1cMoRwISVE3kF1ASnAhB+OHzo1mm+Tyvfkvxx1AQCddfpiz2NblPJ+HNWdj80
         nLy1pfaFu8DTkiuXJQc4CiOS2XUQO5cRd2bFrVFKsO936nKcfO7AfJ7aLIX1011+OlD/
         GmRCmS5r5LQBtjmJ7RCJrf+giRcYZqPFtk0Ux3/kdruh7iFGuUNoQ8QaWcD5c+NfXEEC
         2fbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4Kx77RkRZ6BLkxPPbqLY1opgnPyzoSH+OO3s+PAvU9w=;
        b=idn0HglgGvkKLaC2u/aDp8PcoEii//wD6fezvpMZN7htcEEaGWW6xGYcDhaCMd9QGi
         Jv9ge/zSexyL0qRVQ4LQ7lcWRoQYxSkZ5B2UPwsFSKuY8zjCeOXuNRlzQRUQpuv5qJOQ
         LETvM7mGCr7k4YSxo38Ue2xrWNP/FpswrJo7jPVR3A0dl/W86F64OGmxumyzg5vlQ6Qt
         7ykS9GJ8L4oMH0IaGh5i2UKs6Fv9fUujNz/gTdH25wglYVBF85dwUEyMKAB2kJjVYsxu
         G8KhwJM/yb+spJ9r75WIKMTMEHTJeWUG3nb1lgPockE5wcgKBjOBO746cZ7o+GfDof8o
         LV5Q==
X-Gm-Message-State: APjAAAVebrBe9+hk5hWpDvfFP28sq/ZOGNgpXwT29rS5KaYwldghaL0h
        rGlgv9lW4+X93A/Mi6xSThQZfw==
X-Google-Smtp-Source: APXvYqz2a6qywCQBwkVN/qFSGZFQdZm3WG2wfjnhvelokq7ZMbtdhUeKnYqDBngNRoafomEDfzXuWQ==
X-Received: by 2002:a1c:f003:: with SMTP id a3mr168184wmb.41.1579537866357;
        Mon, 20 Jan 2020 08:31:06 -0800 (PST)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id p26sm22631756wmc.24.2020.01.20.08.31.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2020 08:31:05 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org, jackp@codeaurora.org, balbi@kernel.org,
        bjorn.andersson@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Subject: [PATCH v2 16/19] arm64: dts: qcom: qcs404-evb: Describe external VBUS regulator
Date:   Mon, 20 Jan 2020 16:31:13 +0000
Message-Id: <20200120163116.1197682-17-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200120163116.1197682-1-bryan.odonoghue@linaro.org>
References: <20200120163116.1197682-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

VBUS is supplied by an external regulator controlled by a GPIO pin. This
patch models the regulator as regulator-usb3-vbus.

Cc: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcs404-evb.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
index abfb2a9a37e9..01ef59e8e5b7 100644
--- a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
@@ -33,6 +33,18 @@ vdd_esmps3_3p3: vdd-esmps3-3p3-regulator {
 		regulator-max-microvolt = <3300000>;
 		regulator-always-on;
 	};
+
+	usb3_vbus_reg: regulator-usb3-vbus {
+		compatible = "regulator-fixed";
+		regulator-name = "VBUS_BOOST_5V";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&pms405_gpios 3 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&usb_vbus_boost_pin>;
+		vin-supply = <&vph_pwr>;
+		enable-active-high;
+	};
 };
 
 &blsp1_uart3 {
-- 
2.25.0

