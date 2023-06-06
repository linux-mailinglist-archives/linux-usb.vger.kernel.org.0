Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 66F33723B38
	for <lists+linux-usb@lfdr.de>; Tue,  6 Jun 2023 10:20:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236133AbjFFIUM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 6 Jun 2023 04:20:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233176AbjFFIUJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 6 Jun 2023 04:20:09 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0686AE7A
        for <linux-usb@vger.kernel.org>; Tue,  6 Jun 2023 01:19:53 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-3f736e0c9a8so20568065e9.2
        for <linux-usb@vger.kernel.org>; Tue, 06 Jun 2023 01:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686039591; x=1688631591;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r7BybXB7K6At6gyQD9Ta56TpO5joEo6yFGjHkg9b930=;
        b=cqUKXeJn2Yb+7r/AvnxVNiHDs/0LwI++SJ7EoUHbfJRJAhvYoEuZQdB+kx08hCNrEh
         Qq+Qix6jpWJ8JdKulDTrl2WyjWMMTDfRt2c6RJ1rwosMHgvhOkfdfLzK0lxwUzHHiJGi
         TuoonHDnMnj6L0U49bwhK67+4Wq+bpX5Qso+4uhixG5SSyG4tdHb8BHcyLq3oHBKoUra
         PnGDgpASsMNiRkGV/Lnul4hG9vJtXsPUBPWFTKVP6XqMwfRNa5YwRr9rQxyER4c4ZaS7
         49xayyL0mA9O9aL4keqsS3FukjmFJy7+Rjxjl5heyFNrdNxigObIHEnYDHYZ6087NYho
         Sd9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686039591; x=1688631591;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r7BybXB7K6At6gyQD9Ta56TpO5joEo6yFGjHkg9b930=;
        b=lbUCuc6rXZnUJFE9kA1MKZnr1Jaz63aR2MYPMjGq149xn/3yBaJxdL65DMOG/nyUny
         duTxnnjWycWHJemuOErV7cHCCKia3bZ3s8BfdiYmMOEJHBybN91PnrEPcarzzY5hMhru
         GaaHjoxCjdDxhHrkJc7wzb0LUVeaKDiaS1YmtstX6o+u7iKAu1e00GzpcUfKiiEIkKZf
         xcniOpQePN8M1pY+oZ4gLr9zOOmcNccgqkB0sniUGSDU5lL5VkXOw4rZixGPBnSANAWn
         h7BAb2WGv8je2aHETmDK36CsCsYn7v1r8CXVH+yvfis5tkPZz+WdtEHdGHHoR3Uv///L
         b9Iw==
X-Gm-Message-State: AC+VfDwL1Qc7qirXxFGU1Gp8eFvBMSVi/x0IHVTqEbs9aRzztn26OybX
        opEmmJkiZz7T+fqoZYo74GD6iQ==
X-Google-Smtp-Source: ACHHUZ6dWQWl42uLQJMjkBKDTwjpU9TzhB9j6pHWmYTdAZjz5jEeX6bQ7y9+P72q2wHtyYqxwM88bQ==
X-Received: by 2002:a7b:cc83:0:b0:3f6:3bb:5135 with SMTP id p3-20020a7bcc83000000b003f603bb5135mr1549539wma.14.1686039591363;
        Tue, 06 Jun 2023 01:19:51 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id f4-20020a7bc8c4000000b003f7e66a51dfsm4064740wml.28.2023.06.06.01.19.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 01:19:50 -0700 (PDT)
Date:   Tue, 6 Jun 2023 11:19:46 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Felipe Balbi <felipe.balbi@linux.intel.com>,
        Raviteja Garimella <raviteja.garimella@broadcom.com>,
        linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] usb: gadget/snps_udc_plat: Fix a signedness bug in probe
Message-ID: <ZH7sIkbSZg1rAJpJ@moroto>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The irq_of_parse_and_map() function returns negative error codes
but "udc->irq" is an unsigned int so the error handling doesn't work.

Fixes: 1b9f35adb0ff ("usb: gadget: udc: Add Synopsys UDC Platform driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/usb/gadget/udc/snps_udc_plat.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/udc/snps_udc_plat.c b/drivers/usb/gadget/udc/snps_udc_plat.c
index 0ed685db149d..37edd6c35077 100644
--- a/drivers/usb/gadget/udc/snps_udc_plat.c
+++ b/drivers/usb/gadget/udc/snps_udc_plat.c
@@ -103,7 +103,7 @@ static int udc_plat_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct resource *res;
 	struct udc *udc;
-	int ret;
+	int irq, ret;
 
 	udc = devm_kzalloc(dev, sizeof(*udc), GFP_KERNEL);
 	if (!udc)
@@ -132,11 +132,12 @@ static int udc_plat_probe(struct platform_device *pdev)
 
 	udc->phys_addr = (unsigned long)res->start;
 
-	udc->irq = irq_of_parse_and_map(dev->of_node, 0);
-	if (udc->irq <= 0) {
+	irq = irq_of_parse_and_map(dev->of_node, 0);
+	if (irq <= 0) {
 		dev_err(dev, "Can't parse and map interrupt\n");
 		return -EINVAL;
 	}
+	udc->irq = irq;
 
 	udc->udc_phy = devm_of_phy_get_by_index(dev, dev->of_node, 0);
 	if (IS_ERR(udc->udc_phy)) {
-- 
2.30.2

