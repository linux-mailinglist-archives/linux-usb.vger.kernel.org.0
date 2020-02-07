Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 01BED15504B
	for <lists+linux-usb@lfdr.de>; Fri,  7 Feb 2020 03:01:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727848AbgBGB77 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 6 Feb 2020 20:59:59 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:33182 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727628AbgBGB7Z (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 6 Feb 2020 20:59:25 -0500
Received: by mail-wr1-f67.google.com with SMTP id u6so814619wrt.0
        for <linux-usb@vger.kernel.org>; Thu, 06 Feb 2020 17:59:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ounN3zi0imbgKpbsfEs2C8qMeNLcd0eRtq+ghfuGYQw=;
        b=t+MPhFh4Rz0MR4PG2q5JrkiNT2iUZbKcYFr85KyHRFxTBqtZXN43OPaw9JcUNXH3bu
         oiHXEyDIv0cJnH7ONzfX526UiPfkzsGUKX4UUXorF8p73e41Qumnc9c3/+l961ZOTTte
         HzNrPviDBlsFYaT3eqz180WJURnLhBc9mdkbHRlobABQx9P8cGNsUmgu0aS2yplPTXQg
         FclZIYqxbdf63i+uPfW3UCbZ2+jGWTmm0+SrDRe93YFABhEXCae59tSZ/AKIr36SvC4b
         Y+mPaXyPWm0CGRCSXCv1llQfCCksHxaEau0KZgQGN0WhOqEgVrR4aYYStJ9yFHvZ/k1c
         0U1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ounN3zi0imbgKpbsfEs2C8qMeNLcd0eRtq+ghfuGYQw=;
        b=J1MWuNl0KsKzBpREl3AxAE61Js3rGZ+p2DL4iOVOYMmuF+6G8hUgRTpAYa2bW/PVN5
         PrwL7Kn+OHDqDKW6ODx3Dt9PKpbk3ZG/mHCwm+EKdzmG0IY0r6IxKH9wOhpP+38DvGFe
         4biUud+QvmXINhl7PiEKxGdWfiflNTwaNSDXp1vsCqaG8/gXMCdtSZXG54SPPv7OwyRz
         i8FwSV0Ih/Ol/ucrnMEiKpPyaQ7Dcv+WLDIbAQVzf6xwB269N/hgyUcb97cv2whIGtPK
         73nbHTZ6sT0XDPfyTbLMw8bsNaK7gPto1IQbRm7Ueh3YKqhoLM6FkrVwZkHQZVTB+e9A
         y/cA==
X-Gm-Message-State: APjAAAVbV1ea6AS60uNjSaZqelyff4wzwUxwjqIlsTxoy/7KOAJjuRpk
        /w4DKc8n3X3QGxjkVs/TGKKmx9JiFyg=
X-Google-Smtp-Source: APXvYqyZScLrWHy3tdbhRSXuMOr2106U9G5i2D79tUx7UR8sBXRH8F4VMskTLvrnXvMYon1ZkgrS7g==
X-Received: by 2002:a5d:4b03:: with SMTP id v3mr1281888wrq.178.1581040763543;
        Thu, 06 Feb 2020 17:59:23 -0800 (PST)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id a62sm1490095wmh.33.2020.02.06.17.59.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2020 17:59:23 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org, jackp@codeaurora.org, balbi@kernel.org,
        bjorn.andersson@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Subject: [PATCH v4 13/18] arm64: dts: qcom: qcs404-evb: Define VBUS boost pin
Date:   Fri,  7 Feb 2020 01:59:02 +0000
Message-Id: <20200207015907.242991-14-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200207015907.242991-1-bryan.odonoghue@linaro.org>
References: <20200207015907.242991-1-bryan.odonoghue@linaro.org>
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

