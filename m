Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9CD9A155F3A
	for <lists+linux-usb@lfdr.de>; Fri,  7 Feb 2020 21:17:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727704AbgBGURb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 7 Feb 2020 15:17:31 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:51403 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727684AbgBGURK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 7 Feb 2020 15:17:10 -0500
Received: by mail-wm1-f67.google.com with SMTP id t23so3858577wmi.1
        for <linux-usb@vger.kernel.org>; Fri, 07 Feb 2020 12:17:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9jS7AtcyDtrs+6cLov2M3M67k09AnqIN5nOTMIVW4oM=;
        b=RWP7RK3h6AzOSpxh5XkjjBfKP94Q2tWcVCM7Eo0zAsIH+f05Gyx4k8PpujF3lXJUJa
         tSXs2Xf91emkXQg05rdyKiOgEw9RMST/yqj9zCzI3sHWcouwVDVofKWhk285OD+9iiTI
         nhffaKDxZ5YR5EfiEDBU22RUKxQjR5KFhe8nVrzVQqHkiCZV0UuhewueMta3BkU8+Wb6
         LAQPCTW6aonTWan57LvVLf+PUb2Rm2ta2uaUDC3dAjGgbwmJ6Z0Yis/S5Jo9KYRUNkre
         8RAAW0rrN3BJe40oIgGTiJBpiTCsCJZGwGBefH5kxdEuFfNpvOECSF76LA+WZxxHM2yd
         vGkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9jS7AtcyDtrs+6cLov2M3M67k09AnqIN5nOTMIVW4oM=;
        b=lC5uY4G+KO5YdRxG5SOUHxv2bhK/KSxu7FZDR+Jzf2u/fHj+TmhlF8c0yYrU6SgOdD
         s9dhpXu/EQDVTcb+Y70gsvCQo2bZ56VYacq3CNXmg+3l3Vc2ueVwEAF0Q2jOHjbwnVQx
         o0RQ8hO67zL9Q8n+Khqmwz8Zar+FmpEYsAbpDe/cW6uWu/V+bnlmqWhvksNkNhRceQet
         npawNhwlZKdqX6P1/zeAzJ5uQIj8LgcY2Sq7Ie/VYVee3qqekfmSpTC6vdBy5pQsn/8R
         DS1ife5NU41bMHbXc/jABw/KKUmc7sQehVhVpyFwPQ1GLOjKRVTB4T6BdWZ+rEDqdVx2
         Ge0A==
X-Gm-Message-State: APjAAAWIj6InabKwlaLaKW90Rv7BUAE/RQQAkkjz9H1E7UC8odWb/l8J
        lOaVNfi4fDLFrjVQf8LNAPlK3g==
X-Google-Smtp-Source: APXvYqz/KfvjcJfby9r5wr2ptN9l/Ajghv7BZxCOpp8rYMpBbWqmMuZjAJZGB1wcqtDscS9bYK4z8g==
X-Received: by 2002:a7b:cf2d:: with SMTP id m13mr5081wmg.163.1581106627340;
        Fri, 07 Feb 2020 12:17:07 -0800 (PST)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id h2sm5018542wrt.45.2020.02.07.12.17.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2020 12:17:06 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org, jackp@codeaurora.org, balbi@kernel.org,
        bjorn.andersson@linaro.org, robh@kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Subject: [PATCH v5 15/18] arm64: dts: qcom: qcs404-evb: Define USB ID pin
Date:   Fri,  7 Feb 2020 20:16:51 +0000
Message-Id: <20200207201654.641525-16-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200207201654.641525-1-bryan.odonoghue@linaro.org>
References: <20200207201654.641525-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The USB ID pin is used to tell if a system is a Host or a Device. For our
purposes we will bind this pin into gpio-usb-conn later.

For now define the pin with its pinmux.

Cc: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcs404-evb.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
index b6147b5ab5cb..abfb2a9a37e9 100644
--- a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
@@ -270,6 +270,20 @@ rclk {
 			bias-pull-down;
 		};
 	};
+
+	usb3_id_pin: usb3-id-pin {
+		pinmux {
+			pins = "gpio116";
+			function = "gpio";
+		};
+
+		pinconf {
+			pins = "gpio116";
+			drive-strength = <2>;
+			bias-pull-up;
+			input-enable;
+		};
+	};
 };
 
 &pms405_gpios {
-- 
2.25.0

