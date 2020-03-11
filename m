Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 252071821D8
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2020 20:15:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731274AbgCKTPK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 11 Mar 2020 15:15:10 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:34045 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731266AbgCKTPK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 11 Mar 2020 15:15:10 -0400
Received: by mail-wr1-f65.google.com with SMTP id z15so4139227wrl.1
        for <linux-usb@vger.kernel.org>; Wed, 11 Mar 2020 12:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WEwzry/jY0EwIu3SqW/i/uuhtKICMHn3+vPUvgi2EeQ=;
        b=NUF3+HfZC/mZ0S8xol+/4n86HJIHKo564ay1CbE+vi3VHYcONGUIaWxmVSw49sFWpW
         RP80M63fJKMzsBLjzyo+IaRYO53JSlgMeia5kKgD+g+3bmeQI165JeavX0hZ0P1QIRc+
         KMi9EjEx0L9uVcHY7f6WOz9e6xzZu05lZHWxesKKKqcd86EMIb4tapRajRfgBMrAAv6c
         maqGeiOBYSAPmThWcjHNY/eZqKPqj3Nmuun8iXe/8scTH+7DppUClsCa9QxMmdkxj7zq
         eYUWrQwlis0oFUvSalRc+LLWjyjCyeOIE1Cs0+s3c71gCChhpMASC70ynZrNSQHfVEJS
         ERTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WEwzry/jY0EwIu3SqW/i/uuhtKICMHn3+vPUvgi2EeQ=;
        b=EpIWcz7YM2Zgz3kBjWI3iwJZWfSkzX+7956HUn70gz0WlQgphf/ZhHGNrDQN7eJbmq
         rYaUVXWEWO4pvtdWD7Csw/MrG42y6cXdwt14lH82VCZY48Br5CMv4qUF2vkOrsgOVEwA
         dCkpnjmnv3PjtjaElEzetqoBqDrhOwJbpGy65D3XdYtBufVxVA69A2FNqS9uLgnfW8tM
         Z2xsFI20y62LmGMK8VE0irNrdndoDGc85eoNMMqfFL5QUTyz+46AFwl4MmJTlXEa4cDL
         9SvzTb0vHgCTtw7KcGJBJFnqi7Pr43ryDwc72VhSj8Z5eoejtK0g+fE1vaO5OnuSpeak
         AUbQ==
X-Gm-Message-State: ANhLgQ1S9jsQp3MnRRALV2UavvPqlq90z4/uOeFVvfoly5WKxBktrctZ
        YSNmOQIpuem2QHVsZ2h2qHcx7Q==
X-Google-Smtp-Source: ADFU+vt5lPjCeIzhFut9VqEfAfutvx/rWPEFF6e/wR/uuWGKcIximP5y31i8vGUEbjFbPSPyEVd1xg==
X-Received: by 2002:adf:eb51:: with SMTP id u17mr6294264wrn.29.1583954108525;
        Wed, 11 Mar 2020 12:15:08 -0700 (PDT)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id c85sm9687437wmd.48.2020.03.11.12.15.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2020 12:15:07 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        linux-usb@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        jackp@codeaurora.org, robh@kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Subject: [PATCH 5/6] arm64: dts: qcom: qcs404-evb: Raise vreg_l12_3p3 minimum voltage
Date:   Wed, 11 Mar 2020 19:15:16 +0000
Message-Id: <20200311191517.8221-6-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200311191517.8221-1-bryan.odonoghue@linaro.org>
References: <20200311191517.8221-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Rather than set the minimum microvolt for this regulator in the USB SS PHY
driver, set it in the DTS.

Suggested-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Andy Gross <agross@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Tested-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcs404-evb.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
index 4b529a6077d2..44c7dda1e1fc 100644
--- a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
@@ -200,7 +200,7 @@ vreg_l11_sdc2: l11 {
 		};
 
 		vreg_l12_3p3: l12 {
-			regulator-min-microvolt = <2968000>;
+			regulator-min-microvolt = <3050000>;
 			regulator-max-microvolt = <3300000>;
 		};
 
-- 
2.25.1

