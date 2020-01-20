Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A803142FBD
	for <lists+linux-usb@lfdr.de>; Mon, 20 Jan 2020 17:31:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729605AbgATQbI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 Jan 2020 11:31:08 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:46496 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729579AbgATQbH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 20 Jan 2020 11:31:07 -0500
Received: by mail-wr1-f65.google.com with SMTP id z7so39113wrl.13
        for <linux-usb@vger.kernel.org>; Mon, 20 Jan 2020 08:31:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9jS7AtcyDtrs+6cLov2M3M67k09AnqIN5nOTMIVW4oM=;
        b=ZLzmT+7G1QN2Kl52lracr4oWkYEPK8VZDgUoaX+8kglatJZ6qSTJZTGfqjjZc8sMqH
         HSEFXPwiLDj/K3rPp1aNqHHMoWNati381iodNxhdYSONqgxEkFt2cPRwxJFqbwvX69vz
         41iUrrHUkJ1AVlw5TOONlRp+yy5YVnlSg43Xa+31g8UzsIB9aBYuOTDVio6l23wtRb0i
         6i7DGHKTgBz+HObpdXH36jpNhIPHQlXrC0bvTD6rxvJroz+rRlHKasPgPzLEMd+8ctJ3
         mGzWiAEneMOJ+G9Px7+1NmjiDR4x/NsAWde5SFLF8Y9OBTh/IwmWhQvIynLaIVcGQngC
         d6iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9jS7AtcyDtrs+6cLov2M3M67k09AnqIN5nOTMIVW4oM=;
        b=hFhhSXjo41i69Ulx9PX6Dv5gUHdu+9FHNKiGvkS4XvMDEyUWnSE+2MquO4Db0W19JS
         V4WQiiM7HaJnKaKh2Q2si8shhXvCUC1pYLzbGTbcAcj1Z6071MmhaWku3jcDLB4R+sxM
         2F+2ZAuduUXDbQeCdqI62I9BnOgAqmk0aoJsmrP72g/TjOO8G9Eq5gD8c3GjxvZ3xaRb
         07LLmWje8rnpar+pYOuM/M1ErmXv83LMAihB5IjPumgVcY8033all0PLqrLHJHhStVZZ
         y9I5QYR4eIj3nJXAkO5JsKIq1cw4iCAe07ES/y9fYTh/nMDaEODoD3hb3E9xj0BwPK/M
         Aoew==
X-Gm-Message-State: APjAAAVj4pxu0zqQARn+Yn1myZqHDV/SsNnW3MlYsf3tNpPUXRJ1SZV9
        REkQnFQOvok2d6z7Qy5iW3gi+g==
X-Google-Smtp-Source: APXvYqwsxlu9k7l6Uw+nDOZ0lR9INBaTqDEMiEHikJEgxASKQmp85XSc4MCElCe4yAI8hCM4Y4FHWQ==
X-Received: by 2002:a5d:6b03:: with SMTP id v3mr283291wrw.289.1579537865228;
        Mon, 20 Jan 2020 08:31:05 -0800 (PST)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id p26sm22631756wmc.24.2020.01.20.08.31.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2020 08:31:04 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org, jackp@codeaurora.org, balbi@kernel.org,
        bjorn.andersson@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Subject: [PATCH v2 15/19] arm64: dts: qcom: qcs404-evb: Define USB ID pin
Date:   Mon, 20 Jan 2020 16:31:12 +0000
Message-Id: <20200120163116.1197682-16-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200120163116.1197682-1-bryan.odonoghue@linaro.org>
References: <20200120163116.1197682-1-bryan.odonoghue@linaro.org>
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

