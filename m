Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F6F92DB0C1
	for <lists+linux-usb@lfdr.de>; Tue, 15 Dec 2020 17:03:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730608AbgLOQAY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 15 Dec 2020 11:00:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730725AbgLOP6G (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 15 Dec 2020 10:58:06 -0500
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1094C061282
        for <linux-usb@vger.kernel.org>; Tue, 15 Dec 2020 07:57:25 -0800 (PST)
Received: by mail-wm1-x344.google.com with SMTP id q75so18984011wme.2
        for <linux-usb@vger.kernel.org>; Tue, 15 Dec 2020 07:57:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZqRDZ0GMIRzKaG7rgPryy9HQP9wi6cbXcT4X1fC/8/o=;
        b=GmmphjG18PQ3QlCbDoIOTXj5O68I+Ch7cR7dctbOqo2c0jyLwSdvCcbv8DjP8RIW5h
         fggzVon2HsFOx8dVqJJw0OLO5Zrku6VsRIKaEAwYF76+/VnXw6Zew9bu223D2BvLT+mx
         781TLJaO5zt0Y0dYT4f7KWErfu+0vFDD0qAzoTLR20e9mdNQvvVwAW+wGP+6+WLev4bv
         vLTQZPC4c418URWdW47r2eJhzZNpU3e3ZG7RuGi58hU+oQAKk6RgxRGj+gtk/XqOvEgW
         wOxDFm65JxMwi/Mt8m4fpLC+3fsXWB8oQMiimkZbRUa2n2wOMs38SEYIzt0Tn8HcF0CB
         ki5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZqRDZ0GMIRzKaG7rgPryy9HQP9wi6cbXcT4X1fC/8/o=;
        b=p3ruGU+6WNYJbR6GSaKJalllveloWgfhaG8rtQluI+t2IIR8NOdFkEzZxVOszvwt4z
         FqWWrFuSay07IsQDJmK+/GCD3Jp4Be5jwru/cYpidLAt2kPWzhyRGVGiFKHRYNB2qxaN
         fFjiX4uowX8TO81l4JMxPMe+heDinoOYr/P7PVljldzef/y+Pa9oAIyU091IXsRs92R0
         ux7O322BVFa2oVzVCaflS17bbMK6SWek03XDzoCrRY1WdWkmLygRcxZd1s+gt2RH2HtN
         aan+PHN88v8Re+BxMHgL8u5EhDCfWNQfBTJX5oQxGFlt/zHyIKrk2jxqqXil28sVwMtC
         duog==
X-Gm-Message-State: AOAM532Yr4yjUhc5Rgn1xmWlnZmHYBLBtgqmVC3yEDzH0gQbsrNmBytb
        O1wPLBh2zNnciOltUJtfgIA=
X-Google-Smtp-Source: ABdhPJyJCiKCokxOFWOwk2TSTF93/kcdz2/zFFuugg6zZrRtiTAbF/9N90wOmV8+kuhhLYYj2AZE5A==
X-Received: by 2002:a7b:c406:: with SMTP id k6mr33450128wmi.90.1608047844628;
        Tue, 15 Dec 2020 07:57:24 -0800 (PST)
Received: from egonzo.toto.net.toto.net ([88.123.121.14])
        by smtp.gmail.com with ESMTPSA id c10sm38792018wrb.92.2020.12.15.07.57.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Dec 2020 07:57:24 -0800 (PST)
From:   Dave Penkler <dpenkler@gmail.com>
To:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Cc:     guido.kiener@rohde-schwarz.com, john.harvey@non.keysight.com,
        jian-wei_wu@keysight.com, gabe.jones@ni.com, dpenkler@gmail.com
Subject: [PATCH 4/4] USB: usbtmc: Bump USBTMC_API_VERSION value
Date:   Tue, 15 Dec 2020 16:56:21 +0100
Message-Id: <20201215155621.9592-5-dpenkler@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201215155621.9592-1-dpenkler@gmail.com>
References: <20201215155621.9592-1-dpenkler@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The previous patches in this series have changed the behaviour of the
driver and added new calls.

Signed-off-by: Dave Penkler <dpenkler@gmail.com>
Reviewed-by: Guido Kiener <guido.kiener@rohde-schwarz.com>
Tested-by: Jian-Wei Wu <jian-wei_wu@keysight.com>
---
 drivers/usb/class/usbtmc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/class/usbtmc.c b/drivers/usb/class/usbtmc.c
index d2fcc698c745..74d5a9c5238a 100644
--- a/drivers/usb/class/usbtmc.c
+++ b/drivers/usb/class/usbtmc.c
@@ -25,7 +25,7 @@
 /* Increment API VERSION when changing tmc.h with new flags or ioctls
  * or when changing a significant behavior of the driver.
  */
-#define USBTMC_API_VERSION (2)
+#define USBTMC_API_VERSION (3)
 
 #define USBTMC_HEADER_SIZE	12
 #define USBTMC_MINOR_BASE	176
-- 
2.29.2

