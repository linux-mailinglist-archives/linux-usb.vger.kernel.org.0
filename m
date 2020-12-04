Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B88552CEA31
	for <lists+linux-usb@lfdr.de>; Fri,  4 Dec 2020 09:52:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729278AbgLDIvo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 4 Dec 2020 03:51:44 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:36130 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729242AbgLDIvo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 4 Dec 2020 03:51:44 -0500
Received: by mail-lf1-f67.google.com with SMTP id v14so6634262lfo.3
        for <linux-usb@vger.kernel.org>; Fri, 04 Dec 2020 00:51:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5w0hnPaOEyit9bMPDiziBUhUR6rIaAP/djUPTNbCDHM=;
        b=Lqy9hJnXrIcJH2gqJDsAeCZ7QMRF0hZOqYIbY60av6UvREXtohnIS/rW7E+b538Iy4
         O2IJO2sW2BFe8Z5YWIpTmAGvFKcDvAFo/wf7IJFOu+yl+E+mplFoP5CioEeIWZaIkOMQ
         hmQY7LOagaHaE5ufy7vCPZWSkoH9FeltxJT5oBtOqsB1hPhcegNRdm6mTI/d+4lhi8Zv
         e4wMRASCnfbHVzwGqDH/UTjn3X47h+e0pBytmptDmpCtwr+G8fAJ8jyQdF+pBaD/O9Ug
         91wTjmKQ/2lsOtUZgBuP7UCWAMVyoGh58CpSnuK+xGeJELVbp/xgj5nKleNsYqhfyhr9
         4O/A==
X-Gm-Message-State: AOAM531F/wTsZ1F1ehHtvkl4IgHSGEIvd6R3ElVZRahlFaSsSx9NlK/w
        4nKV1u5XdFP0n41LoooW46I=
X-Google-Smtp-Source: ABdhPJx9tp/c1u3Oi+Tl0QxWR5wiVvQwIU27hm64cAdJpEp977ymTzIGoIxBwRcsH31dAHrXKx6Kjg==
X-Received: by 2002:a19:ad6:: with SMTP id 205mr3047186lfk.522.1607071862532;
        Fri, 04 Dec 2020 00:51:02 -0800 (PST)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id m13sm1451599ljg.30.2020.12.04.00.51.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Dec 2020 00:51:01 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@xi.terra>)
        id 1kl6oR-0005EN-1A; Fri, 04 Dec 2020 09:51:35 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org,
        Himadri Pandya <himadrispandya@gmail.com>,
        Johan Hovold <johan@kernel.org>
Subject: [PATCH 1/3] USB: core: drop pipe-type check from new control-message helpers
Date:   Fri,  4 Dec 2020 09:51:08 +0100
Message-Id: <20201204085110.20055-2-johan@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201204085110.20055-1-johan@kernel.org>
References: <20201204085110.20055-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The new control-message helpers include a pipe-type check which is
almost completely redundant.

Control messages are generally sent to the default pipe which always
exists and is of the correct type since its endpoint representation is
created by USB core as part of enumeration for all devices.

There is currently only one instance of a driver in the tree which use
a control endpoint other than endpoint 0 (and it does not use the new
helpers).

Drivers should be testing for the existence of their resources at probe
rather than at runtime, but to catch drivers failing to do so USB core
already does a sanity check on URB submission and triggers a WARN().
Having the same sanity check done in the helper only suppresses the
warning without allowing us to find and fix the drivers.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/core/message.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/usb/core/message.c b/drivers/usb/core/message.c
index c4e876050074..a04b01247117 100644
--- a/drivers/usb/core/message.c
+++ b/drivers/usb/core/message.c
@@ -204,9 +204,6 @@ int usb_control_msg_send(struct usb_device *dev, __u8 endpoint, __u8 request,
 	int ret;
 	u8 *data = NULL;
 
-	if (usb_pipe_type_check(dev, pipe))
-		return -EINVAL;
-
 	if (size) {
 		data = kmemdup(driver_data, size, memflags);
 		if (!data)
@@ -273,7 +270,7 @@ int usb_control_msg_recv(struct usb_device *dev, __u8 endpoint, __u8 request,
 	int ret;
 	u8 *data;
 
-	if (!size || !driver_data || usb_pipe_type_check(dev, pipe))
+	if (!size || !driver_data)
 		return -EINVAL;
 
 	data = kmalloc(size, memflags);
-- 
2.26.2

