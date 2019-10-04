Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 37570CC505
	for <lists+linux-usb@lfdr.de>; Fri,  4 Oct 2019 23:44:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731221AbfJDVnn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 4 Oct 2019 17:43:43 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:43989 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731174AbfJDVnm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 4 Oct 2019 17:43:42 -0400
Received: by mail-pg1-f195.google.com with SMTP id v27so4459325pgk.10
        for <linux-usb@vger.kernel.org>; Fri, 04 Oct 2019 14:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kKHG7UTsDPcnCMtVxGV72BXVFFtNiiXVrgsu7N6vxI4=;
        b=dUHt+jCIixU+I2Q5iiGOtz5ZLigFhCMop4kFDCvfXwqMApUQHan0clusE1HE9LZPTr
         kTm1Sf08Dy/4mnp5fIxaCLIYm1CtgcsETkD0e/um/x2SznUJ3BMRFDDQ19Ps0nYJOPri
         f6gEqnwUOTN2RyHZ8d+g5Am+X+uP4NhdPdb68=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kKHG7UTsDPcnCMtVxGV72BXVFFtNiiXVrgsu7N6vxI4=;
        b=qP5Hc+XxDm75/fCa+3XvLKouQSa2UuPkssVnCCKOPaCuXtGvtXCqxFe304tzhLpPz3
         Dizl7vH41Kzv8lPu3nD0S5VB4ayuEkEzVgeV/bijkMgc/THWk7F500v5yaSiSwDzHmNa
         Ch8mBxpEG3IVePGZMy48U18wabqBN0ymH26UoVLnQfJjjJ7762ZkbpC2hS6IpAFOypY8
         umD5pB4/dd2CC1RVBbV23YaeRQcw/f1XYkt2+qa5Y2q6btdWtEYaTscReMXEr5TP880u
         RNEuOPzeCuvSF+YD6PIo62mh3NHMgN5ZhVjNMEWyqtP2y72svxJ6gG0poMy++mTbVIS7
         0tZQ==
X-Gm-Message-State: APjAAAUHePLo5tEJpV5tG1tLMAGlkHDP+zJ2E7cNP7PozDqclLuRAL9+
        nZfsyY+hhdfQO2dLD0M1Dji3Dg==
X-Google-Smtp-Source: APXvYqxRakS5XLryNdBetTMDUVY49wiIkkoe+7l2+YKQd+NSkcecQAoD98r+dwCVJDzmBco1sQvNuA==
X-Received: by 2002:a65:4686:: with SMTP id h6mr18021406pgr.212.1570225422072;
        Fri, 04 Oct 2019 14:43:42 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id a11sm10446799pfg.94.2019.10.04.14.43.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Oct 2019 14:43:41 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     linux-kernel@vger.kernel.org
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Richard Leitner <richard.leitner@skidata.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        linux-usb@vger.kernel.org
Subject: [PATCH 06/10] usb: usb251xb: Use of_device_get_match_data()
Date:   Fri,  4 Oct 2019 14:43:30 -0700
Message-Id: <20191004214334.149976-7-swboyd@chromium.org>
X-Mailer: git-send-email 2.23.0.581.g78d2f28ef7-goog
In-Reply-To: <20191004214334.149976-1-swboyd@chromium.org>
References: <20191004214334.149976-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Use the more modern API here instead of using of_match_device() and
avoid casting away const from the returned pointer by pushing the const
type through to the users. This nicely avoids referencing the match
table when it is undefined with configurations where CONFIG_OF=n and
avoids const issues.

Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Richard Leitner <richard.leitner@skidata.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Frank Rowand <frowand.list@gmail.com>
Cc: <linux-usb@vger.kernel.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---

Please ack or pick for immediate merge so the last patch can be merged.

 drivers/usb/misc/usb251xb.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/misc/usb251xb.c b/drivers/usb/misc/usb251xb.c
index 6ca9111d150a..84f218a6843c 100644
--- a/drivers/usb/misc/usb251xb.c
+++ b/drivers/usb/misc/usb251xb.c
@@ -392,7 +392,7 @@ static void usb251xb_get_ports_field(struct usb251xb *hub,
 }
 
 static int usb251xb_get_ofdata(struct usb251xb *hub,
-			       struct usb251xb_data *data)
+			       const struct usb251xb_data *data)
 {
 	struct device *dev = hub->dev;
 	struct device_node *np = dev->of_node;
@@ -623,7 +623,7 @@ static const struct of_device_id usb251xb_of_match[] = {
 MODULE_DEVICE_TABLE(of, usb251xb_of_match);
 #else /* CONFIG_OF */
 static int usb251xb_get_ofdata(struct usb251xb *hub,
-			       struct usb251xb_data *data)
+			       const struct usb251xb_data *data)
 {
 	return 0;
 }
@@ -633,13 +633,11 @@ static int usb251xb_probe(struct usb251xb *hub)
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
Sent by a computer through tubes

