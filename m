Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 895A2625625
	for <lists+linux-usb@lfdr.de>; Fri, 11 Nov 2022 10:04:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233369AbiKKJEz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 11 Nov 2022 04:04:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233438AbiKKJEd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 11 Nov 2022 04:04:33 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1101D77E7A
        for <linux-usb@vger.kernel.org>; Fri, 11 Nov 2022 01:03:22 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id p8so7384096lfu.11
        for <linux-usb@vger.kernel.org>; Fri, 11 Nov 2022 01:03:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uDzd4abq0tgpR4GqgHbA/G3xdUvZ33DQ50+3Ct7HstM=;
        b=M+DQSdgqsVfklmIHa3xlZJLS/n1PyRc/At+iRSsFl510UA3YJZVwul42HKajdZ/jcf
         bQBihPAUIXFMyQuWPmfT/2MnVqXMUb+lEOEa7v+SAr0ReYuFV8hIV/DKPM/SFPypNol9
         jmlCUqJaJQ6WAxLAoTJUDKOSjWg3xxl2hHy4WNt+0NaiIzNHlOZ3yIy6K/GRSqShudHC
         AlGdiWv2g0FisPttdypsGbyw5CHtv89fBSDaTqkAUr5SV3c+LVLApx3Ffz3XMJ25CMcw
         qY346R9d5ujn2/eWlOsiXGtOHc6YMVG4vqc0yeC/QrjrNQ+ObHUX1t7YrRJG/W0g901A
         ZuKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uDzd4abq0tgpR4GqgHbA/G3xdUvZ33DQ50+3Ct7HstM=;
        b=kSuKsxgATUn1AtCJKPvkQSVIUtmmCrfIe64FMsxnsGxhDdfP/pTfFMsnhkY5iEum7N
         hK7teELlR1t6d6thzFmBbS4u2XwuX9+FD8qwoViSTTC0KUMROYvOCImrB7h2stj6OEHU
         Jni7hSP5AzKaAedb651pVAFgcdCNcHS/Icw/Etfk6WpYFzBH+ZY8KdPDeQSFcQlBjrWP
         fROMhg/AMYwOv91mKhKu1QmhiVV0ofML8B1NXuuH89UiNosgmQOQnBtJ8ZNox14r43gj
         TyvLaXZiGdLc6iyk7QgKBVhmu8qMspT/VsZAu0ZopHNvwnJTaL3AJN5cgeb7zpKW3HjZ
         nfvw==
X-Gm-Message-State: ANoB5pkyW33vuSadDEw+Vl5KUqFqdqhCI02o6D/IOkTAIb3eSTJeW5yp
        xZtu3lCZ0GXET4oQjuWKjIRMD0dDggP7Vw==
X-Google-Smtp-Source: AA0mqf59Ci1jwDchk91a7u7/2lETERyIke4rZm6O8WrNpiRLI/gLP3+dOxvMbgA6I290Izlh2+ke7g==
X-Received: by 2002:a19:7b15:0:b0:492:c88a:17a8 with SMTP id w21-20020a197b15000000b00492c88a17a8mr401639lfc.250.1668157400439;
        Fri, 11 Nov 2022 01:03:20 -0800 (PST)
Received: from Fecusia.lan (c-05d8225c.014-348-6c756e10.bbcust.telenor.se. [92.34.216.5])
        by smtp.gmail.com with ESMTPSA id d25-20020a19e619000000b004a2386b8cf9sm221143lfh.206.2022.11.11.01.03.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Nov 2022 01:03:19 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH] usb: fotg210-udc: Fix ages old endianness issues
Date:   Fri, 11 Nov 2022 10:03:17 +0100
Message-Id: <20221111090317.94228-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The code in the FOTG210 driver isn't entirely endianness-agnostic
as reported by the kernel robot sparse testing. This came to
the surface while moving the files around.

The driver is only used on little-endian systems, so this causes
no real-world regression, but it is nice to be strict and have
some compile coverage also on big endian machines, so fix it
up with the right LE accessors.

Fixes: b84a8dee23fd ("usb: gadget: add Faraday fotg210_udc driver")
Reported-by: kernel test robot <lkp@intel.com>
Link: https://lore.kernel.org/linux-usb/202211110910.0dJ7nZCn-lkp@intel.com/
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/usb/fotg210/fotg210-udc.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/fotg210/fotg210-udc.c b/drivers/usb/fotg210/fotg210-udc.c
index 7757aaa11d6f..3c357ce42d3b 100644
--- a/drivers/usb/fotg210/fotg210-udc.c
+++ b/drivers/usb/fotg210/fotg210-udc.c
@@ -630,10 +630,10 @@ static void fotg210_request_error(struct fotg210_udc *fotg210)
 static void fotg210_set_address(struct fotg210_udc *fotg210,
 				struct usb_ctrlrequest *ctrl)
 {
-	if (ctrl->wValue >= 0x0100) {
+	if (le16_to_cpu(ctrl->wValue) >= 0x0100) {
 		fotg210_request_error(fotg210);
 	} else {
-		fotg210_set_dev_addr(fotg210, ctrl->wValue);
+		fotg210_set_dev_addr(fotg210, le16_to_cpu(ctrl->wValue));
 		fotg210_set_cxdone(fotg210);
 	}
 }
@@ -714,17 +714,17 @@ static void fotg210_get_status(struct fotg210_udc *fotg210,
 
 	switch (ctrl->bRequestType & USB_RECIP_MASK) {
 	case USB_RECIP_DEVICE:
-		fotg210->ep0_data = 1 << USB_DEVICE_SELF_POWERED;
+		fotg210->ep0_data = cpu_to_le16(1 << USB_DEVICE_SELF_POWERED);
 		break;
 	case USB_RECIP_INTERFACE:
-		fotg210->ep0_data = 0;
+		fotg210->ep0_data = cpu_to_le16(0);
 		break;
 	case USB_RECIP_ENDPOINT:
 		epnum = ctrl->wIndex & USB_ENDPOINT_NUMBER_MASK;
 		if (epnum)
 			fotg210->ep0_data =
-				fotg210_is_epnstall(fotg210->ep[epnum])
-				<< USB_ENDPOINT_HALT;
+				cpu_to_le16(fotg210_is_epnstall(fotg210->ep[epnum])
+					    << USB_ENDPOINT_HALT);
 		else
 			fotg210_request_error(fotg210);
 		break;
-- 
2.38.1

