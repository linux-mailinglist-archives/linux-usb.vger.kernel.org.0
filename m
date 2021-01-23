Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 601703012D1
	for <lists+linux-usb@lfdr.de>; Sat, 23 Jan 2021 04:48:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726913AbhAWDq6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 22 Jan 2021 22:46:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726874AbhAWDqg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 22 Jan 2021 22:46:36 -0500
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 999E6C061220
        for <linux-usb@vger.kernel.org>; Fri, 22 Jan 2021 19:44:38 -0800 (PST)
Received: by mail-pf1-x42d.google.com with SMTP id q131so5090055pfq.10
        for <linux-usb@vger.kernel.org>; Fri, 22 Jan 2021 19:44:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TAGPmP9BOJXhZhPf5GwqBeoScIfskZqY/J81LHEeHtk=;
        b=NZZ6yFVmNa7MxufUctRDhrA/2kE4i5M/O2laQqAIdRTg+v0WaUoejxIkipX2gg/JO8
         o4NiObGkeDm7IDiHhRPngZP9FP/mimImdZ6hYrEQoilLtad2G5wBGpPWs6AAojVqSYre
         SZkFzokfE9dqhMRMw1Z0pgZ/GD7gWAqAQIxs4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TAGPmP9BOJXhZhPf5GwqBeoScIfskZqY/J81LHEeHtk=;
        b=ZNVf4WNRs6iuh2/syfRy7pM6SBKuyTCrh+XIqISBMF0OpHAkjp2Xg3mrBCS0ThOVGz
         t7yaUhiDE+6pZUNgnKKD655jHZQK7XNjGETVdX8OKoFK5hw8dN6l24782zl13HIYp/BZ
         L7e16yOQlx8WWIvgT1z/N1hzX2XzkgyTDgClbHfx+TKc/EKkj4YzBhMEyiluDJDVCRSL
         Tk2qHrq6h2oGpJ25TLyDdt3p5gvE+nBmJL1hZugPlC9zXWEhceVjjiUxqtqWu0Sqn8RX
         tH9eSYRMnmqpzNg58tqLNqZA5GHezs61yGsr8UwAG4NGN9cVboKxAA5WzIUtJ4ouqfaa
         6WDg==
X-Gm-Message-State: AOAM531BWXWHM0yKwgDRBYYUWpg51DZEhlqUys6WCZl96fn+6pOJMWYM
        RIpMc5+C0lfKj0aFOHiR4cSwRA==
X-Google-Smtp-Source: ABdhPJzNLWbZDFfZmckPJlA5EOwk5QhhmGGjNE24UUnWdo/NgVHUBCoGkQOdXUeI7A/hJLgkWOm5nQ==
X-Received: by 2002:a05:6a00:1385:b029:1be:ac19:3a9d with SMTP id t5-20020a056a001385b02901beac193a9dmr1557962pfg.65.1611373478208;
        Fri, 22 Jan 2021 19:44:38 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:201:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id gf23sm10480343pjb.42.2021.01.22.19.44.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Jan 2021 19:44:37 -0800 (PST)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Rob Herring <robh@kernel.org>
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Richard Leitner <richard.leitner@skidata.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        linux-usb@vger.kernel.org
Subject: [PATCH v2 4/6] usb: usb251xb: Use of_device_get_match_data()
Date:   Fri, 22 Jan 2021 19:44:26 -0800
Message-Id: <20210123034428.2841052-5-swboyd@chromium.org>
X-Mailer: git-send-email 2.30.0.280.ga3ce27912f-goog
In-Reply-To: <20210123034428.2841052-1-swboyd@chromium.org>
References: <20210123034428.2841052-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Use the more modern API here instead of using of_match_device() and
avoid casting away const from the returned pointer by pushing the const
type through to the users. This nicely avoids referencing the match
table when it is undefined with configurations where CONFIG_OF=n and
avoids const issues.

Signed-off-by: Stephen Boyd <swboyd@chromium.org>
Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Richard Leitner <richard.leitner@skidata.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Frank Rowand <frowand.list@gmail.com>
Cc: <linux-usb@vger.kernel.org>
---

Please ack so Rob can apply.

 drivers/usb/misc/usb251xb.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/misc/usb251xb.c b/drivers/usb/misc/usb251xb.c
index 29fe5771c21b..507deef1f709 100644
--- a/drivers/usb/misc/usb251xb.c
+++ b/drivers/usb/misc/usb251xb.c
@@ -396,7 +396,7 @@ static void usb251xb_get_ports_field(struct usb251xb *hub,
 }
 
 static int usb251xb_get_ofdata(struct usb251xb *hub,
-			       struct usb251xb_data *data)
+			       const struct usb251xb_data *data)
 {
 	struct device *dev = hub->dev;
 	struct device_node *np = dev->of_node;
@@ -630,7 +630,7 @@ static const struct of_device_id usb251xb_of_match[] = {
 MODULE_DEVICE_TABLE(of, usb251xb_of_match);
 #else /* CONFIG_OF */
 static int usb251xb_get_ofdata(struct usb251xb *hub,
-			       struct usb251xb_data *data)
+			       const struct usb251xb_data *data)
 {
 	return 0;
 }
@@ -647,13 +647,11 @@ static int usb251xb_probe(struct usb251xb *hub)
 {
 	struct device *dev = hub->dev;
 	struct device_node *np = dev->of_node;
-	const struct of_device_id *of_id = of_match_device(usb251xb_of_match,
-							   dev);
+	const struct usb251xb_data *usb_data = of_device_get_match_data(dev);
 	int err;
 
-	if (np && of_id) {
-		err = usb251xb_get_ofdata(hub,
-					  (struct usb251xb_data *)of_id->data);
+	if (np && usb_data) {
+		err = usb251xb_get_ofdata(hub, usb_data);
 		if (err) {
 			dev_err(dev, "failed to get ofdata: %d\n", err);
 			return err;
-- 
https://chromeos.dev

