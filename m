Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C37591821E8
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2020 20:16:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731269AbgCKTPJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 11 Mar 2020 15:15:09 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:44119 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731250AbgCKTPI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 11 Mar 2020 15:15:08 -0400
Received: by mail-wr1-f66.google.com with SMTP id l18so4091300wru.11
        for <linux-usb@vger.kernel.org>; Wed, 11 Mar 2020 12:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=X9f/RMIcWlgabS9DXbbWR0nDB/AmM5zj7IJkKsoXLIU=;
        b=PRRcxJMXrJh7fbewIVca185JzZpd7vdSgFAU0gqvfH8cMn0pzWO28SI1VHH4IwZlY9
         0FE//oe7MYBljUmcWIktdo5ZWRduy5JQuIbmRNydhSly5iK232PPtQt0QDZhXuRKEu4C
         CEWliCnk3VuuUpdIledRZZ3ovKiLHDms4T2tQ8UR27SsFOMsWU0EEQazP3pPtKxWKj5y
         wmh4AacYJzF9kESt/KvxCS6PFLAoVoieFaOs8GtWoZDSx7jRAODkEoYhz3WSPP8JTtGe
         71swFQcqs1QXEqA0yZwJ8glgBotEWnvgXFESFo4ZEtz/8hEpi829xzbGI8fP+Phhaxlh
         AbcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=X9f/RMIcWlgabS9DXbbWR0nDB/AmM5zj7IJkKsoXLIU=;
        b=YK/y+VJo0i5wJthaz9DKKZjdtzK0KK6aNasUWH/Z/4IymUUQsFEOzYgU+NKra1TXPh
         diqzx8u8HEMd5CJOVsxfIKXUXn2Oy5h7DTEIDML8gu6f74IYVSahD1uKHU191YLa8uMt
         SIX19Ss9S8ZfVQcOWsvYQztLI0Cpfif9rfxDTJPfKiq5/oQJ/fTluvhCHkdvNhE7sPp/
         TAwtdB2msZWQqw/2UKStNYMQ6v2OxurZaeZHQP0UCv8tmo8HEDoF86+qZ9d0OPBNeTn0
         cnDGdQEOhYHSVpul5P2NMGqtAv1i2neOAFaoDYIFdsylKz0uwAg+ptAOexVPaoXY8BNy
         DvEQ==
X-Gm-Message-State: ANhLgQ2T1Gi1lkmM4Et2gZ/y3fH8+GWUrB6eGzpj0QS0QWCTHiMEtgUQ
        TtFldbIRgJnosnWEisMLNAmiFQ==
X-Google-Smtp-Source: ADFU+vsNESGH2R0MWraSUxtoXYOPanK+N4SyHx/YW970exsdRbl2fb83FXgcCYN4IisEFn6Ku+ChQA==
X-Received: by 2002:adf:a419:: with SMTP id d25mr6270727wra.210.1583954106153;
        Wed, 11 Mar 2020 12:15:06 -0700 (PDT)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id c85sm9687437wmd.48.2020.03.11.12.15.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2020 12:15:05 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        linux-usb@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        jackp@codeaurora.org, robh@kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Subject: [PATCH 3/6] arm64: dts: qcom: qcs404-evb: Define USB ID pin
Date:   Wed, 11 Mar 2020 19:15:14 +0000
Message-Id: <20200311191517.8221-4-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200311191517.8221-1-bryan.odonoghue@linaro.org>
References: <20200311191517.8221-1-bryan.odonoghue@linaro.org>
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
Tested-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcs404-evb.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
index 62ef9c34b04e..cb893ca76901 100644
--- a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
@@ -271,6 +271,20 @@ rclk {
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
2.25.1

