Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7C2EF157422
	for <lists+linux-usb@lfdr.de>; Mon, 10 Feb 2020 13:09:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727536AbgBJMIn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 Feb 2020 07:08:43 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:37911 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727634AbgBJMHa (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 10 Feb 2020 07:07:30 -0500
Received: by mail-wr1-f65.google.com with SMTP id y17so7337562wrh.5
        for <linux-usb@vger.kernel.org>; Mon, 10 Feb 2020 04:07:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YJAqrsEVC7Ekr/URFS4yzXVcz6M9nFcDb80ARG3rIgM=;
        b=PfNkBn3UuJhxiOWb3aj4wanPHWVp9XtdYGN6NfAJMzbkSIF7NAJJIkFo8FA3S+b3MO
         NQYy6aWz3Lbj6qi4fnoYiLuBQ5ZhsZt0kZP9fpcUGZ6vRj4POlPeYmyzVnr4PfxXJqN1
         Ph374vpGJQNTy4aTV32qf/DbA93ofj0hP05aLqPbTKLwLldShTVGENfn1YeqG1WK7qLS
         B+Tfc3+JvFIa5QFi+ntyAJ+dlKXkUzTeQHOxnyxV+QmiyskZVvAoG95heAPIjp78HFDt
         uJprhIxDJNU93xzVP2cgua4XG581nXWaagdVQznhNxz9I+2Nfjn6Lm6b3I6865eVPwlr
         nacg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YJAqrsEVC7Ekr/URFS4yzXVcz6M9nFcDb80ARG3rIgM=;
        b=R9Hsitj20LSIhzv2eGS8bb56sVAhs3buQ49OR4FVoZ2A37VVPjrhiQUUqzR++6fHOL
         cezQpdgt4BmLt9aIl+2MxSFPy/yRXtIVJk4P6leOinymplJ+AyjNE2+oHybD12HXcBIW
         AHwArxBlVQmvzN3uE2lgix2niJA/VFgVC1r+kMA55alwX5KNnrTVTd8TWe7SbZtP5Udz
         1yNfwcPS8zPRsw9or9mIs5fkQLkEW9Q7F1KiLK7Fyjg0GmQhbteE1vIJuNHKsJj2QvDf
         P/1M7UyJ1I4kg1MaUJOWlXRMQ8Q8Jc3IkByQgFkpYefmjbCR2ppRXtdjREaUlD9UOnNI
         adsA==
X-Gm-Message-State: APjAAAWYR9YmGRuu5V9QjvcU6Ep7q2L3OxZCGEesZbwSzGrALZ7Els+g
        Jbr5siRZAQp8TUDLn/MYzfQ1kg==
X-Google-Smtp-Source: APXvYqwSKDoRdPspygko2oEkUZgUoMMd2zIHMed2NPqd2qqb2IGVmkSGSqG6xQbYjovFrI/O1hlrZA==
X-Received: by 2002:adf:f58c:: with SMTP id f12mr1655330wro.22.1581336449216;
        Mon, 10 Feb 2020 04:07:29 -0800 (PST)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id i204sm293124wma.44.2020.02.10.04.07.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2020 04:07:27 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org, jackp@codeaurora.org, balbi@kernel.org,
        bjorn.andersson@linaro.org, robh@kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Subject: [PATCH v6 07/18] dt-bindings: usb: dwc3: Add a gpio-usb-connector example
Date:   Mon, 10 Feb 2020 12:07:12 +0000
Message-Id: <20200210120723.91794-8-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200210120723.91794-1-bryan.odonoghue@linaro.org>
References: <20200210120723.91794-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

A USB connector should be a child node of the USB controller
connector/usb-connector.txt. This patch adds an example of how to do this
to the dwc3 binding descriptions.

It is necessary to declare a connector as a child-node of a USB controller
for role-switching to work, so this example should be helpful to others
implementing that.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: linux-usb@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Acked-by: Felipe Balbi <balbi@kernel.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 Documentation/devicetree/bindings/usb/dwc3.txt | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documentation/devicetree/bindings/usb/dwc3.txt
index 66780a47ad85..4e1e4afccee6 100644
--- a/Documentation/devicetree/bindings/usb/dwc3.txt
+++ b/Documentation/devicetree/bindings/usb/dwc3.txt
@@ -121,4 +121,12 @@ dwc3@4a030000 {
 	interrupts = <0 92 4>
 	usb-phy = <&usb2_phy>, <&usb3,phy>;
 	snps,incr-burst-type-adjustment = <1>, <4>, <8>, <16>;
+
+	usb_con: connector {
+		compatible = "gpio-usb-b-connector";
+		id-gpios = <&tlmm 116 GPIO_ACTIVE_HIGH>;
+		vbus-supply = <&usb3_vbus_reg>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&usb3_id_pin>, <&usb3_vbus_pin>;
+	};
 };
-- 
2.25.0

