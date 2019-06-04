Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4D4D13448B
	for <lists+linux-usb@lfdr.de>; Tue,  4 Jun 2019 12:45:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727494AbfFDKpJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 4 Jun 2019 06:45:09 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:38930 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727480AbfFDKpI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 4 Jun 2019 06:45:08 -0400
Received: by mail-wr1-f68.google.com with SMTP id x4so15287441wrt.6
        for <linux-usb@vger.kernel.org>; Tue, 04 Jun 2019 03:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=MkGVFZY1XhtlH3EXbDSeWCPiZrbaYk4zwPdOeyiIsNc=;
        b=hljw8RsTFEcbuplHCj6D4tq/5nIpPFTXoAK24WDaO16R2lM4A4tkIl52AnrPf6JXw1
         gT3EjpICXK9lQrDnqMtsHhdKD3i45MO0tlSwTZkOGsLnygeqnS1GEq42hVT5+HlqpNGw
         T+gYf8t0vIU7HSEAEdNBmet5opXalvHQjYcEdfz/km30EDtQQfXPpL8nTAL5/46rMhak
         gMuexpRELw1yz4AqSHcBpII97mOzlQXjdBv9q9uxJg0vY4L2Wkz4mWfTGT41kUyPjWyf
         oCCUVzTVMMLzv8BuVscDTyHO0HMHqetsCPsptCOLxfHbS+xv6PqNZFqqiN1cTF5Ezas/
         RETA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=MkGVFZY1XhtlH3EXbDSeWCPiZrbaYk4zwPdOeyiIsNc=;
        b=Jc5QLB4QhbEwp1qxjG7bSJ+ZuksF3lqdWuetIEevRQ2/2midNYihzPeGOFtxRfeHE1
         6DVAK3U1EcOrxi+u0tHxuYIu6C84lOECZTNgTP8g9pwQ7xyzb/zfAsPqiBLVh0JJr6ph
         i+6If8ojgvIOCACqlR5c888ZpuLbwp9QHaT3BUs2RUVbvcgZNKgjhlliEKaVG59aD2NA
         pSB28/NIAuacLw3ilcXVVAcPg7ld2k0lZbjTpHIrncu/tBsr3EZN/tHDtlNWkX3nwvni
         t/vzpQNpQFI/01ZLZwqL0m3A1+FTMZAe7rzbHTkbbUp6aCp+oX/fOTCFDWvlUGwoj5ov
         uSqQ==
X-Gm-Message-State: APjAAAUiKLuQSWBFYp3sZCexWHlpCDjvRCTulLr74OXNdu4BFT3qHdDJ
        xKcJ2y7E+uq3Feqb6liir2bPNw==
X-Google-Smtp-Source: APXvYqyK+bgytdW+OPwhr0ZBevMVV7NDVd58ezc6owb6wL4UOd2DK/LWci6dPsr3n48XMl5sTrJS0w==
X-Received: by 2002:adf:a38d:: with SMTP id l13mr13613323wrb.187.1559645107190;
        Tue, 04 Jun 2019 03:45:07 -0700 (PDT)
Received: from localhost.localdomain ([2.27.167.43])
        by smtp.gmail.com with ESMTPSA id t140sm2718623wmt.0.2019.06.04.03.45.06
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 04 Jun 2019 03:45:06 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     alokc@codeaurora.org, kramasub@codeaurora.org,
        andy.gross@linaro.org, david.brown@linaro.org,
        wsa+renesas@sang-engineering.com, bjorn.andersson@linaro.org,
        linus.walleij@linaro.org, balbi@kernel.org,
        gregkh@linuxfoundation.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        jlhugo@gmail.com, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-usb@vger.kernel.org, Lee Jones <lee.jones@linaro.org>
Subject: [PATCH 8/8] usb: dwc3: qcom: Improve error handling
Date:   Tue,  4 Jun 2019 11:44:55 +0100
Message-Id: <20190604104455.8877-8-lee.jones@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190604104455.8877-1-lee.jones@linaro.org>
References: <20190604104455.8877-1-lee.jones@linaro.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

dwc3_qcom_clk_init() is called with of_count_phandle_with_args() as an
argument.  If of_count_phandle_with_args() returns an error, the number
of clocks will be a negative value and will lead to undefined behaviour.

Ensure we check for an error before attempting to blindly use the value.

Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/usb/dwc3/dwc3-qcom.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index f21fdd6cdd1a..633482926497 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -419,6 +419,9 @@ static int dwc3_qcom_clk_init(struct dwc3_qcom *qcom, int count)
 	if (!count || ACPI_HANDLE(dev))
 		return 0;
 
+	if (count < 0)
+		return count;
+
 	qcom->clks = devm_kcalloc(dev, qcom->num_clocks,
 				  sizeof(struct clk *), GFP_KERNEL);
 	if (!qcom->clks)
-- 
2.17.1

