Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F62256B92B
	for <lists+linux-usb@lfdr.de>; Fri,  8 Jul 2022 14:03:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238237AbiGHL7J (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 8 Jul 2022 07:59:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238230AbiGHL7I (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 8 Jul 2022 07:59:08 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 426539A69F
        for <linux-usb@vger.kernel.org>; Fri,  8 Jul 2022 04:59:07 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id r14so24453777wrg.1
        for <linux-usb@vger.kernel.org>; Fri, 08 Jul 2022 04:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PQd5KukuVRiN5L0KlbcVNHjHjkFnetKH3Ol5RF7yC2g=;
        b=PsC8yEYKVpxPpapCvVSoXT5cTwmP2xCxJXg7cu0lbmnUlgnRFQU+sm0RezZd5weeDj
         bhTPYMUDW35WfgTpt2+Irq4kCRbqmh8Gx5Ao3tTmoFiUIlBzZiG6QsDacJTUVt2GfekT
         oKn6PFgVOJ4Qb3b9yjERekH0uc34Nuj1l329Ap4hY254yqYu5B2GOItWPn00fjMkTpPl
         iUnRZXKKpjS5yu8GqsG8uUCM7r47cNoWDzXB+PFxvm12qqtQfpD4J+wgMUU4razAtRNv
         HMPT13+VvuM1nUJYITKiDreo6kM+nrpYL4tUcGbmmrpeAqVzBAvy6IzR1ysZ3yCASmC5
         rPrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PQd5KukuVRiN5L0KlbcVNHjHjkFnetKH3Ol5RF7yC2g=;
        b=kptFJLXGuCvRFa/Oon3EXXkZ7mv5ftO3SyFP1H68qSfp0jXxXPWxDM/voLipCVEwVy
         rLy2Dg+aZRiTKMFKca6bBtIHmjWJ7X1QmOqxNcF/JReYQqZGS4lsd8Eta/YtWs6smTOQ
         uW07g53JFeBt+up6S5Fwd/vYpCFaiw/oZ9SFjr5CxKC00U5Jsq6mAyf/auetU21HyONO
         jLL01TJyW+3pPTVfd8BbHdzBEXZdVlT/RjD4tMK7PmIkZz4zLsU0V4BXD0hPntS95W8f
         +1NrDkQRby5AQzEuhINhq5r5vw2dIV39vqP21fxaKNT5lINfgNhUEAFDjNZOkReGFbfU
         SQBw==
X-Gm-Message-State: AJIora8T5kCfYvij2ILiGTsRjRWzq/hW8n4cCX9D3IF42ONIIauuW5Fs
        jcLQ3Gc1ouAxDp+gPDZlA3HBuci+ZBrt5A==
X-Google-Smtp-Source: AGRyM1v8tWX9G5s5pv8JDLkYgIRpAOBMJrMNcPJjItnC//kKgi33dMo/MEchE5SVPWaCx2y2cbD+OA==
X-Received: by 2002:adf:fb03:0:b0:21d:70cb:d6b5 with SMTP id c3-20020adffb03000000b0021d70cbd6b5mr2933435wrr.548.1657281545541;
        Fri, 08 Jul 2022 04:59:05 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id z5-20020adfe545000000b0021b81855c1csm49436474wrm.27.2022.07.08.04.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jul 2022 04:59:04 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org
Cc:     faizel.kb@dicortech.com, baihaowen@meizu.com,
        bryan.odonoghue@linaro.org
Subject: [PATCH 2/3] tools: usb: testusb: Add super speed reporting
Date:   Fri,  8 Jul 2022 12:58:58 +0100
Message-Id: <20220708115859.2095714-3-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220708115859.2095714-1-bryan.odonoghue@linaro.org>
References: <20220708115859.2095714-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add the ability to detect and print the USB speed as "super" if/when the
kernel reports that speed.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 tools/usb/testusb.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/usb/testusb.c b/tools/usb/testusb.c
index 6f428f9253844..d996a3819322e 100644
--- a/tools/usb/testusb.c
+++ b/tools/usb/testusb.c
@@ -98,6 +98,7 @@ enum usb_device_speed {
 	USB_SPEED_LOW, USB_SPEED_FULL,		/* usb 1.1 */
 	USB_SPEED_HIGH,				/* usb 2.0 */
 	USB_SPEED_WIRELESS,			/* wireless (usb 2.5) */
+	USB_SPEED_SUPER,			/* usb 3.0 */
 };
 
 /*-------------------------------------------------------------------------*/
@@ -110,6 +111,7 @@ static char *speed (enum usb_device_speed s)
 	case USB_SPEED_FULL:		return "full";
 	case USB_SPEED_HIGH:		return "high";
 	case USB_SPEED_WIRELESS:	return "wireless";
+	case USB_SPEED_SUPER:		return "super";
 	default:			return "??";
 	}
 }
-- 
2.36.1

