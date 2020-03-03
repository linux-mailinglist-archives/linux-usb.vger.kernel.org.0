Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 117BE177CF5
	for <lists+linux-usb@lfdr.de>; Tue,  3 Mar 2020 18:13:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730653AbgCCRMD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 3 Mar 2020 12:12:03 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:44083 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730635AbgCCRMC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 3 Mar 2020 12:12:02 -0500
Received: by mail-wr1-f67.google.com with SMTP id n7so5283030wrt.11
        for <linux-usb@vger.kernel.org>; Tue, 03 Mar 2020 09:12:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=M9ph+jxDzGgiRBaVZmmvpJl00qLHRlJZThV1uDOFG5s=;
        b=JESZm0ODS2Wm7MZiY4M3IuSgt7PNoSjHXo837QenUUOzfHs/QHUj/jR17XCEOiVJ+a
         tQMteKC3CnrOfDP/skWKbp9W0o99P636IhP6hA3XhoiZ3h4Hy5fqpRr0c30ZklkAquWk
         pnxskvkCkqW7EXKxJot4f6oqRt8J2NThyVUlJflJ9iSVr+TQf/APq6nXzLYk1RMl6iAU
         dB/EAuFG9Ikdw3FWAgCftX/CnFHu+3zQgabJXAR3IqRqKxeiYan8bbtlo8HDzu+lOckp
         +GhECXgGpvEWsk0lB5JfQ81SikrfkfvaTzcSSOXDPObqdz7f9p58gkZ7yrxYEBs+QeCy
         mb3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=M9ph+jxDzGgiRBaVZmmvpJl00qLHRlJZThV1uDOFG5s=;
        b=LQIRYHcWmF+jnixj0e87LIkvglGKF9H2gh02+xADaoxf7YdWNwJHQvZFWDvraJJY8H
         1W+XSfhJBuVyYjV3ir6M6XwfIy0kjxhD8FJE7wIt7H0FJq8d3f2bO2k6jmU99zL5qT2g
         eR481Sy7lLrGDJHXHf6xpaWZ5Sd4R5M6v/3fjut/Zq4sAY+tPaM+mgREOVgCJf3gDJir
         QEQ6HG0rR4ul/cRLovTIIfZBfv4nsQFKXRrIUgSLTie8Uk1xue0D7A97bO5NVtyUvBYs
         77GH4zbpyQxxC2oLw6o3pkj6NnCxxgxQA2wI9IGaF5tLoDgczSuBdr8Dn0ZR48MGA8d8
         4TLg==
X-Gm-Message-State: ANhLgQ0DS8YnX/Hfzh0zvEA6IlPubny4qAilkrLOUAL19ZAMUPTpEjwi
        VqLhu8nrfbqLhhJU/8vPbtFt3A==
X-Google-Smtp-Source: ADFU+vvIlGOYOSdxmZ7huKTi44WJjdKX+SA2RUsm5n1QYKm9tOTrG8aeAJXsYMbwIDZOTphtucsoEQ==
X-Received: by 2002:adf:fd08:: with SMTP id e8mr6166791wrr.43.1583255520866;
        Tue, 03 Mar 2020 09:12:00 -0800 (PST)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id z13sm5425319wrw.88.2020.03.03.09.11.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2020 09:12:00 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org, jackp@codeaurora.org, balbi@kernel.org,
        bjorn.andersson@linaro.org, robh@kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Subject: [PATCH v7 07/18] dt-bindings: usb: dwc3: Add a gpio-usb-connector example
Date:   Tue,  3 Mar 2020 17:11:48 +0000
Message-Id: <20200303171159.246992-8-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200303171159.246992-1-bryan.odonoghue@linaro.org>
References: <20200303171159.246992-1-bryan.odonoghue@linaro.org>
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
2.25.1

