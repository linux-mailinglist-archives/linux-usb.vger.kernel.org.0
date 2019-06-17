Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 27F9A4830B
	for <lists+linux-usb@lfdr.de>; Mon, 17 Jun 2019 14:52:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728015AbfFQMvY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 17 Jun 2019 08:51:24 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:44284 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727465AbfFQMvN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 17 Jun 2019 08:51:13 -0400
Received: by mail-wr1-f68.google.com with SMTP id r16so9796415wrl.11
        for <linux-usb@vger.kernel.org>; Mon, 17 Jun 2019 05:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=2C6MxhIF9Gjdvx3J9DYd/48/Suqux1auzpg7O20+XA4=;
        b=MHuiL6Hd66D8KM0jn4ls2iBDOBivmXgGCkd0bRuw3BVISYThbeIBV65YPTVnC9S5pN
         8kwD7l1LeRLhShtYuu/Ido0JQEJeak94CdUos+d7lXijbpc7lq70fcnle30NFz0tcJIj
         fAbhj9eIhnoDKlZtfNVWfkzOAx8xp0EuIZ9g38860fnnolOIibyFhNmFCQEOV3JsQtou
         UjFRWCn0iZbk4TdcLNFh4kMAKOur21h0NofVuZCw5wYBD3SEo5yr15DOn4ZrA5obTtoT
         wSTQGINMn3kmRWVRTFv5WxMKEdA0kEwajLFNzSkDL3ycCAfLXhvSJF2ZlVcb1F43lutn
         H4ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=2C6MxhIF9Gjdvx3J9DYd/48/Suqux1auzpg7O20+XA4=;
        b=BBSjiEScNaT4U3CA5KjsxxgJPDOJGvMvVlS2z2n4pHb8vLhlxZFFThFExtp0LWcceT
         F9B0K7PHQ7nRHQl+1SQqUi4gF9sIZgy3BeGGYwwjoTGm8TotcOT00aTjZms5nu8kIz3k
         KsUg8EKoHwzcbdz5r+x6QGhM6keEWnOZnsjww/oG8XLew9xf10Bzj0owML+AqJ7BK0w6
         utztNk1AS0ylneZer9AXYuW2D/5j2aC2VC7QGDpEOml2F4PMoXnVaveJWPvILiJ0DQDv
         QedL1nxaM2/bqOXaSDSZoJTo6waX430sRk/0j1Kb6PEFPNAUnXjvuHS79OaeCioEPA6p
         V57Q==
X-Gm-Message-State: APjAAAVImT+lP6KCVo6BAKxpp3kX5xy6dkBqkuiBQkAKCI8vSETk6iZ6
        EyB2betP5lL2Xm09iQ8RoAJDrA==
X-Google-Smtp-Source: APXvYqwC65DYERLdER2UmlNerHOaEQY3c4hwpSMWsWud6VpPKrL6rBW7xSk8iiKL0ioPg8v7UxK/qQ==
X-Received: by 2002:adf:ebc6:: with SMTP id v6mr14844325wrn.222.1560775871713;
        Mon, 17 Jun 2019 05:51:11 -0700 (PDT)
Received: from dell.watershed.co.uk ([2.27.35.243])
        by smtp.gmail.com with ESMTPSA id o11sm10477852wmh.37.2019.06.17.05.51.10
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Jun 2019 05:51:11 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     alokc@codeaurora.org, agross@kernel.org, david.brown@linaro.org,
        bjorn.andersson@linaro.org, balbi@kernel.org,
        gregkh@linuxfoundation.org, ard.biesheuvel@linaro.org,
        jlhugo@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, felipe.balbi@linux.intel.com
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Lee Jones <lee.jones@linaro.org>
Subject: [RESEND v4 3/4] usb: dwc3: qcom: Start USB in 'host mode' on the SDM845
Date:   Mon, 17 Jun 2019 13:51:04 +0100
Message-Id: <20190617125105.6186-4-lee.jones@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190617125105.6186-1-lee.jones@linaro.org>
References: <20190617125105.6186-1-lee.jones@linaro.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

When booting with Device Tree, the current default boot configuration
table option, the request to boot via 'host mode' comes from the
'dr_mode' property.  A property of the same name can be used inside
ACPI tables too.  However it is missing from the SDM845's ACPI tables
so we have to supply this information using Platform Device Properties
instead.

This does not change the behaviour of any currently supported devices.
The property is only set on ACPI enabled platforms, thus for H/W
booting DT, unless a 'dr_mode' property is present, the default is
still OTG (On-The-Go) as per [0].  Any new ACPI devices added will
also be able to over-ride this implementation by providing a 'dr_mode'
property in their ACPI tables.  In cases where 'dr_mode' is omitted
from the tables AND 'host mode' should not be the default (very
unlikely), then we will have to add some way of choosing between them
at run time - most likely by ACPI HID.

[0] Documentation/devicetree/bindings/usb/generic.txt

Signed-off-by: Lee Jones <lee.jones@linaro.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/usb/dwc3/dwc3-qcom.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index 0cb63f6c92d9..2d050303d564 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -444,6 +444,11 @@ static int dwc3_qcom_clk_init(struct dwc3_qcom *qcom, int count)
 	return 0;
 }
 
+static const struct property_entry dwc3_qcom_acpi_properties[] = {
+	PROPERTY_ENTRY_STRING("dr_mode", "host"),
+	{}
+};
+
 static int dwc3_qcom_acpi_register_core(struct platform_device *pdev)
 {
 	struct dwc3_qcom 	*qcom = platform_get_drvdata(pdev);
@@ -488,6 +493,13 @@ static int dwc3_qcom_acpi_register_core(struct platform_device *pdev)
 		goto out;
 	}
 
+	ret = platform_device_add_properties(qcom->dwc3,
+					     dwc3_qcom_acpi_properties);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "failed to add properties\n");
+		goto out;
+	}
+
 	ret = platform_device_add(qcom->dwc3);
 	if (ret)
 		dev_err(&pdev->dev, "failed to add device\n");
-- 
2.17.1

