Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 89E4717EA59
	for <lists+linux-usb@lfdr.de>; Mon,  9 Mar 2020 21:44:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726875AbgCIUoC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 9 Mar 2020 16:44:02 -0400
Received: from mail-yw1-f68.google.com ([209.85.161.68]:36418 "EHLO
        mail-yw1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726810AbgCIUoB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 9 Mar 2020 16:44:01 -0400
Received: by mail-yw1-f68.google.com with SMTP id j71so11580076ywb.3;
        Mon, 09 Mar 2020 13:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KKHUWz0Uha+CDG15YVmtHwxSiy2XT+hJxNbxwEkR868=;
        b=eW2RpvuYPPkcwhjG9Vmv6IcKW5Qnqmjl08/IRhSljpMizzQhJcIV+BAL6xf5VOMNtd
         mfFawM7Uec3t7mNYUnwllnhTM8yxo2o0twGxeBwPwIat4xz2QHwdCxEXPVqkLLM3xwOs
         CVvtuLZ3mL/zUmhmHXxbVtd/1+aYOST/iP7uCvw704CKaa2HSms7ZxZbAZXOrdVVnmZa
         AB3MxMx7PhJeewGgaZYNA00v9qF0xEOcuVNKoTznjxlpSVE/pkL4zDbGSgccawpC4fZl
         nVBU5InX77ry1rNKET7p1jzcnpaz71BoiURh1SFYpDwjKHqjdDRdgxFElX+DNrms/gla
         E20Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KKHUWz0Uha+CDG15YVmtHwxSiy2XT+hJxNbxwEkR868=;
        b=RoSSfpEpR78EoTMHe32UfAWU0QFLLlq8o5bLy6PSTYEGCxJ4lbx7qwvUeuPcmFTyqo
         zW91U+Ww8eEgZocxw4UjFXZfpMm6z1UZX+LrjRNANsnQ2zRI//aFFnPXwe/HaUGAe93d
         dbg6kJ1QhA6Q+7GAYYc6r2eCmbYpVGzALA1zAPg1MdRTqVWDpBt8i9XMRC6mxQUQBKwi
         H9c56eZBpnWxF8qBw7y+FBwoDr4ZgeW/ZfJ7ysn2Xj5BGF4ewoJHZYkVh6iMJuqgEyLK
         2Y9mjrePIqH/JeQYwNvPDBJxreyMOomq2Z97mrNFe9Mc6Fx2t5QZD9QG6Uqsu4S73/dP
         DoYA==
X-Gm-Message-State: ANhLgQ0VXi3rIoD7GFNTRzLi0t+pjHV++B73noDnoPLarQA3E83Vwhjc
        lVuod9DaDxLK+AxPviadsJ4=
X-Google-Smtp-Source: ADFU+vtjLJBY/bBFHMcKlXA3hyCoEMNmsFisitAuSnzMN8OydLYNYzqhTqxDAdSU3MWvWGaIViC/1A==
X-Received: by 2002:a0d:ffc4:: with SMTP id p187mr18238754ywf.4.1583786637913;
        Mon, 09 Mar 2020 13:43:57 -0700 (PDT)
Received: from farregard-ubuntu.kopismobile.org (c-73-177-17-21.hsd1.ms.comcast.net. [73.177.17.21])
        by smtp.gmail.com with ESMTPSA id s63sm17998768ywd.82.2020.03.09.13.43.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2020 13:43:57 -0700 (PDT)
From:   George Hilliard <thirtythreeforty@gmail.com>
To:     Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     George Hilliard <thirtythreeforty@gmail.com>,
        Icenowy Zheng <icenowy@aosc.io>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [RESEND PATCH 3/5] musb: sunxi: add support for the suniv MUSB controller
Date:   Mon,  9 Mar 2020 15:43:24 -0500
Message-Id: <20200309204326.27403-4-thirtythreeforty@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200309204326.27403-1-thirtythreeforty@gmail.com>
References: <20200309204326.27403-1-thirtythreeforty@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The suniv SoC has a MUSB controller like the one in A33, but with a SRAM
region to be claimed.

Add support for it.

Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
Signed-off-by: George Hilliard <thirtythreeforty@gmail.com>
---
 drivers/usb/musb/sunxi.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/musb/sunxi.c b/drivers/usb/musb/sunxi.c
index f3f76f2ac63f..76806b781844 100644
--- a/drivers/usb/musb/sunxi.c
+++ b/drivers/usb/musb/sunxi.c
@@ -714,14 +714,17 @@ static int sunxi_musb_probe(struct platform_device *pdev)
 	INIT_WORK(&glue->work, sunxi_musb_work);
 	glue->host_nb.notifier_call = sunxi_musb_host_notifier;
 
-	if (of_device_is_compatible(np, "allwinner,sun4i-a10-musb"))
+	if (of_device_is_compatible(np, "allwinner,sun4i-a10-musb") ||
+	    of_device_is_compatible(np, "allwinner,suniv-f1c100s-musb")) {
 		set_bit(SUNXI_MUSB_FL_HAS_SRAM, &glue->flags);
+	}
 
 	if (of_device_is_compatible(np, "allwinner,sun6i-a31-musb"))
 		set_bit(SUNXI_MUSB_FL_HAS_RESET, &glue->flags);
 
 	if (of_device_is_compatible(np, "allwinner,sun8i-a33-musb") ||
-	    of_device_is_compatible(np, "allwinner,sun8i-h3-musb")) {
+	    of_device_is_compatible(np, "allwinner,sun8i-h3-musb") ||
+	    of_device_is_compatible(np, "allwinner,suniv-f1c100s-musb")) {
 		set_bit(SUNXI_MUSB_FL_HAS_RESET, &glue->flags);
 		set_bit(SUNXI_MUSB_FL_NO_CONFIGDATA, &glue->flags);
 	}
@@ -814,6 +817,7 @@ static int sunxi_musb_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id sunxi_musb_match[] = {
+	{ .compatible = "allwinner,suniv-f1c100s-musb", },
 	{ .compatible = "allwinner,sun4i-a10-musb", },
 	{ .compatible = "allwinner,sun6i-a31-musb", },
 	{ .compatible = "allwinner,sun8i-a33-musb", },
-- 
2.25.0

