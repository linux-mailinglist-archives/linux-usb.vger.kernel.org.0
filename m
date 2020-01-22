Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 19679145BF2
	for <lists+linux-usb@lfdr.de>; Wed, 22 Jan 2020 19:57:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729473AbgAVS5M (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 22 Jan 2020 13:57:12 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:38516 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729240AbgAVS4c (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 22 Jan 2020 13:56:32 -0500
Received: by mail-wr1-f67.google.com with SMTP id y17so242371wrh.5
        for <linux-usb@vger.kernel.org>; Wed, 22 Jan 2020 10:56:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ounN3zi0imbgKpbsfEs2C8qMeNLcd0eRtq+ghfuGYQw=;
        b=hHIUKPms2Gxr0V+3L/ZF3HJb9w2oVNp5EgDWIC7gsrYlPERcRHqCoZ1dZ5JdhJs07r
         oXO6wEx6t33p2A5jOUxBlq6CD2+nQra2xdKLPgNwzzeK7cBPOJfS2akX2158/0FguTqh
         jdFel6dG9s+pnjLNFqcTKJ/eRfW7CrrfmxP19U9QtbifQH2hxN4X/XmRCEWHtGMZuhZi
         ptd3XBGMyOo25zSLBHnGh/PsfvzvMwciiqLDTMdLAdqTcqICb/ZV9o3qvYk11YkAKdoI
         46XTTmrOXKZ+6BQyqjvKIvsWVKMB0J9aadrDeDirOxS4ZVHEFUqFJZ1jp06wRa9kthTr
         Vaow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ounN3zi0imbgKpbsfEs2C8qMeNLcd0eRtq+ghfuGYQw=;
        b=lyxRMGj7wz3w/WcHzYQFXlWfJcPErqWiaoGmkonxWoIkDw0mWxDG5ni7MNRo6yKOKz
         9yfP2fu2V47AypK8gYYgEFn+sA+Gn49ubB+D+acXxFUGm7rYj8zXn+P8ijJfNZl6Fjib
         7SWI6g4MbCl2a5gqjAk0sxygAUH6/ir0Ck+xRWP1xNCgsWANhp53JBe6SVua2eHnTwbV
         lWXBeY7Y3pSXpXI2sR1XqAZYyq8kQ6+dDzuq0P73Y9YIG2WJu3SlgmdJB/VzVUVSIMbr
         mg76sT+lAFPMD8Xa4IwKTmWS8wnUHwmQc6T/+NB2KBgMkc0DDfY2wTKI2niKwNfBDVtV
         xsFg==
X-Gm-Message-State: APjAAAXVJ0SbarLrzCd9kKzrgac7ImLT9ny6942efLmJc5cX98euPWS4
        Jx2FchBs/zWj4jmiOpA72wz0AQ==
X-Google-Smtp-Source: APXvYqy156Ycx8aSYgl72eE6NVySJt+/Cj+i1oQ3QTGvgPcSTND7ZMiN2qzDHOTYeYEjbSgcDADDCg==
X-Received: by 2002:adf:ec0d:: with SMTP id x13mr12681783wrn.400.1579719390270;
        Wed, 22 Jan 2020 10:56:30 -0800 (PST)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id q15sm58590390wrr.11.2020.01.22.10.56.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2020 10:56:29 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org, jackp@codeaurora.org, balbi@kernel.org,
        bjorn.andersson@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Subject: [PATCH v3 14/19] arm64: dts: qcom: qcs404-evb: Define VBUS boost pin
Date:   Wed, 22 Jan 2020 18:56:05 +0000
Message-Id: <20200122185610.131930-15-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200122185610.131930-1-bryan.odonoghue@linaro.org>
References: <20200122185610.131930-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

An external regulator is used to trigger VBUS on/off via GPIO. This patch
defines the relevant GPIO in the EVB dts.

Cc: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcs404-evb.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
index 6d53dc342f97..b6147b5ab5cb 100644
--- a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
@@ -273,6 +273,14 @@ rclk {
 };
 
 &pms405_gpios {
+	usb_vbus_boost_pin: usb-vbus-boost-pin {
+		pinconf {
+			pins = "gpio3";
+			function = PMIC_GPIO_FUNC_NORMAL;
+			output-low;
+			power-source = <1>;
+		};
+	};
 	usb3_vbus_pin: usb3-vbus-pin {
 		pinconf {
 			pins = "gpio12";
-- 
2.25.0

