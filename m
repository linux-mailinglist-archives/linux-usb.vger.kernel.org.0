Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 25A21145BF0
	for <lists+linux-usb@lfdr.de>; Wed, 22 Jan 2020 19:57:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729470AbgAVS5L (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 22 Jan 2020 13:57:11 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:44715 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729262AbgAVS4d (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 22 Jan 2020 13:56:33 -0500
Received: by mail-wr1-f65.google.com with SMTP id q10so199681wrm.11
        for <linux-usb@vger.kernel.org>; Wed, 22 Jan 2020 10:56:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9jS7AtcyDtrs+6cLov2M3M67k09AnqIN5nOTMIVW4oM=;
        b=uIY/LzvMTa8UYFu7SMOf7arl2LGKGgPP6MdyKzi8gdvoDGEckp0uMVHNQoARE1+rnH
         YZvGJ5I/CjM9+BsyaqBy3VVRa/pTX6KXytsQRiVkvJTkx5CWxzwEJ5BmaaHd083GRizE
         If88CqcOPF689+Gjm6PeMYrzW9SqHi6kUqV+NhjB4y/Hzwc5AXwy8fSo20mnh8g+uwV2
         /5lntkgCAnSsOqV5hKBResCyMX11EcfJa8Irl78JNIxnZt0tKY7CiNnMSmlDp8pgkcfK
         PMFe4avyjTJuvcOVL/8d/ByhO+itoNG0dtCL5tBa4sEXEredhXwvE9g9bI+ArUT86JxF
         vV4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9jS7AtcyDtrs+6cLov2M3M67k09AnqIN5nOTMIVW4oM=;
        b=TwqV1iO72h4nePmYHmLQDLLkgj/dTZXR7xJXqpYBhkEWsQ47uwYC+Ze4hePZSuboJl
         JF7xUEP4DK4cegKuvHWvueA5d1qNxhpEXwAAByMWkNPWBgdDmqvigqG8DikLfUoO8ofc
         tKvxoJuLfOoN7O4D/kSnjyfy++My8QofUWfHGBopt45sOUjvZ8GzDTR8/qevy1hj+ds2
         YcKdrRT8RQEVKiW2tDPnoHaa6dBf2K9UzV9m3zOGw+dpCQp89qJ+e0lMWdZC8GT/YJV4
         Vvgzcx4zIG8jomko73FuppV9Z38kgAbaC1XDz+Oit93iDQkneFYZuN7oTHyJu/+sUe59
         nWPg==
X-Gm-Message-State: APjAAAWFCrizwv9VnW/gsNv947kbKZPGUPEerT+zGus6iwHGFRum2LRi
        6vcq4tv+uYvde3lpzl3cU9q1Ew==
X-Google-Smtp-Source: APXvYqzrdGeIxT9VNurC3FRV7A2bAgXNvXtOZWLz/ojtb944DLNyYt1otcc5nDGx2jLCF4xBBeAHWw==
X-Received: by 2002:a5d:4b8f:: with SMTP id b15mr12752680wrt.100.1579719391505;
        Wed, 22 Jan 2020 10:56:31 -0800 (PST)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id q15sm58590390wrr.11.2020.01.22.10.56.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2020 10:56:31 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org, jackp@codeaurora.org, balbi@kernel.org,
        bjorn.andersson@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Subject: [PATCH v3 15/19] arm64: dts: qcom: qcs404-evb: Define USB ID pin
Date:   Wed, 22 Jan 2020 18:56:06 +0000
Message-Id: <20200122185610.131930-16-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200122185610.131930-1-bryan.odonoghue@linaro.org>
References: <20200122185610.131930-1-bryan.odonoghue@linaro.org>
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

