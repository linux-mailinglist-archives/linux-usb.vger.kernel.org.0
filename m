Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1E51B145C0E
	for <lists+linux-usb@lfdr.de>; Wed, 22 Jan 2020 19:57:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729027AbgAVS5n (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 22 Jan 2020 13:57:43 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:40679 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729028AbgAVS4W (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 22 Jan 2020 13:56:22 -0500
Received: by mail-wm1-f67.google.com with SMTP id t14so181551wmi.5
        for <linux-usb@vger.kernel.org>; Wed, 22 Jan 2020 10:56:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=N7NGrZiCykS9PVNmtZp1ptOeaDXAZnoM5ctYQxR/lvg=;
        b=JjrDZiFo1z2S4nagQjFlE8TZ6iw+WftpvZS2cg+KhHRSuyk4tJ8HxJ3/pmD6nxunfk
         yqglV8Wk+LtcrnlNhPC6gyXb2DwLs/emo7K0wpgwYHaWJ/OS5u2jJ6dpN6uCL9fVIfZH
         O6YP6w0pbzzvPHhZNnCVzXwSLeyfgX9/ZduDHCcGJdgzN+8SS9IrMCiBjrlsNtforbD9
         JGeWfMgw5EwST6j32wjqn8ktyB8YU9f48xJaj7GRsuKZC+uFCgl6Lx9EXqZuvS2WpVnO
         KXkwkKNlhXgatusNhL/fq+o/N9zAwFN0bmUqRGf7fktmYzhaOdfdcZeQEl+mYUH4m7sx
         856g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=N7NGrZiCykS9PVNmtZp1ptOeaDXAZnoM5ctYQxR/lvg=;
        b=ih2QfNfaxE7DcRQwgCmqTYr6pGK9JbDW5egS5TuK+H7HKubmLS7OkRkr8oSIwQmJVq
         Zhl6Evff9hMwQYbgT1/fzRmhOLip0WTOAJJDoAGUxoVJtXG+WmIqdpYpg+fNGejffNPK
         ZFn8c4uXKqq6/p1GIXyI5+U6RAvbqpu7fpEtJttnoANcyCOMFbKMMDIU69OtY3NlZyDz
         Nt2u9ibZVec43nIScY31cuiy2jKF9rVkUfe2008q9nhwdbunhtHYOU96eARpANkQBIZP
         h10DyHs5Pn5OyusSmeZgVZ73XC64hHa1M/Krn3HFaCobYzT/XHBFC15Uw75Nx0Awnl7X
         n+1Q==
X-Gm-Message-State: APjAAAVRBgG0s+CQI+/sHfvIHJva6yqFbRzitrR1ldw6czUS7LHWL4UY
        RAj0hGn1fOVoBCMZ8bOi//uyKA==
X-Google-Smtp-Source: APXvYqwBZ3qVZlvTwFJnbVmR3f0+AikcNfDNnOu2exJum92HJkIWSHQ4Ffotxe3v3xFlhXReIWrztg==
X-Received: by 2002:a1c:1f51:: with SMTP id f78mr4302287wmf.60.1579719380619;
        Wed, 22 Jan 2020 10:56:20 -0800 (PST)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id q15sm58590390wrr.11.2020.01.22.10.56.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2020 10:56:19 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org, jackp@codeaurora.org, balbi@kernel.org,
        bjorn.andersson@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Subject: [PATCH v3 06/19] dt-bindings: usb: dwc3: Add a gpio-usb-connector description
Date:   Wed, 22 Jan 2020 18:55:57 +0000
Message-Id: <20200122185610.131930-7-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200122185610.131930-1-bryan.odonoghue@linaro.org>
References: <20200122185610.131930-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

A USB connector should be a child node of the USB controller
connector/usb-connector.txt. This patch adds a property
"gpio_usb_connector" which declares a connector child device. Code in the
DWC3 driver will then

- Search for "gpio_usb_controller"
- Do an of_platform_populate() if found

This will have the effect of making the declared node a child of the USB
controller and will make sure that USB role-switch events detected with the
gpio_usb_controller driver propagate into the DWC3 controller code
appropriately.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: linux-usb@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 Documentation/devicetree/bindings/usb/dwc3.txt | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documentation/devicetree/bindings/usb/dwc3.txt
index 66780a47ad85..b019bd472f83 100644
--- a/Documentation/devicetree/bindings/usb/dwc3.txt
+++ b/Documentation/devicetree/bindings/usb/dwc3.txt
@@ -108,6 +108,9 @@ Optional properties:
 			When just one value, which means INCRX burst mode enabled. When
 			more than one value, which means undefined length INCR burst type
 			enabled. The values can be 1, 4, 8, 16, 32, 64, 128 and 256.
+ - gpio_usb_connector: Declares a USB connector named 'gpio_usb_connector' as a
+		       child node of the DWC3 block. Use when modelling a USB
+		       connector based on the gpio-usb-b-connector driver.
 
  - in addition all properties from usb-xhci.txt from the current directory are
    supported as well
@@ -121,4 +124,12 @@ dwc3@4a030000 {
 	interrupts = <0 92 4>
 	usb-phy = <&usb2_phy>, <&usb3,phy>;
 	snps,incr-burst-type-adjustment = <1>, <4>, <8>, <16>;
+	usb_con: gpio_usb_connector {
+		compatible = "gpio-usb-b-connector";
+		id-gpio = <&tlmm 116 GPIO_ACTIVE_HIGH>;
+		vbus-gpio = <&pms405_gpios 12 GPIO_ACTIVE_HIGH>;
+		vbus-supply = <&usb3_vbus_reg>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&usb3_id_pin>, <&usb3_vbus_pin>;
+	};
 };
-- 
2.25.0

