Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C74E82722A7
	for <lists+linux-usb@lfdr.de>; Mon, 21 Sep 2020 13:36:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726749AbgIULgX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 21 Sep 2020 07:36:23 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:38361 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726696AbgIULgW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 21 Sep 2020 07:36:22 -0400
Received: by mail-lj1-f194.google.com with SMTP id w3so10774719ljo.5
        for <linux-usb@vger.kernel.org>; Mon, 21 Sep 2020 04:36:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LPkgVcY9ITc2c7lL7eTIAvOiaRX9cWDsucFq3t5mnnE=;
        b=I0omz30ZAAuzCG6NcwiEb2pqlrimpFU4ldeG9xq8bTPUULZ6uzyaUWKe/kM1jdoKJc
         BQDcc4AK5r2SyKkPRDMatGjWbNlQvGdQ/P42SlmfS+CmKC7antggQ+0a63yLSQdk//3N
         xRWaRCrafykkcDBxssMYK4XOHwi0rRzQb4JyH4qQxS70K3B+LlNZGMjwDxYuCiZb5cps
         +J6Kq6BsJh82jCJW5w4AxTClVvTdcwFVTIUZyJRVGqHSGX0AOAmEgODVB4E5FXZ0Sw5P
         II0xZbvBoVzf2gTkAA8BmyVoPbzHiyZlnlbNUGtku46N0sQaUsMcDi/6Lf6AA9KBtwNb
         HIig==
X-Gm-Message-State: AOAM532v9uoROr0pyIEjWWMwJXmUYEEJcruykBQ5I0PF68qoGyF2hh2d
        L+JYKfOCi+65Q0DOc3iMvrs=
X-Google-Smtp-Source: ABdhPJytgBMaq5FjPwWrRcpVbj6C3q7Rd2kWAItdx/uYK47RoPTyCOhWI5qZAMKfsRYGdT0KW1EGhg==
X-Received: by 2002:a05:651c:200b:: with SMTP id s11mr15418397ljo.196.1600688179909;
        Mon, 21 Sep 2020 04:36:19 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id s11sm2649689ljh.56.2020.09.21.04.36.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 04:36:18 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@xi.terra>)
        id 1kKK79-0008OL-B5; Mon, 21 Sep 2020 13:36:11 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org,
        Daniel Caujolle-Bert <f1rmb.daniel@gmail.com>,
        Johan Hovold <johan@kernel.org>
Subject: [PATCH 3/4] USB: cdc-acm: use common data-class define
Date:   Mon, 21 Sep 2020 13:35:24 +0200
Message-Id: <20200921113525.32187-4-johan@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200921113525.32187-1-johan@kernel.org>
References: <20200921113525.32187-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Use the data-class define provided by USB core and drop the
driver-specific one.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/class/cdc-acm.c | 6 ++----
 drivers/usb/class/cdc-acm.h | 2 --
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/class/cdc-acm.c b/drivers/usb/class/cdc-acm.c
index 5b1a1cd0168d..2758e295871e 100644
--- a/drivers/usb/class/cdc-acm.c
+++ b/drivers/usb/class/cdc-acm.c
@@ -1287,10 +1287,8 @@ static int acm_probe(struct usb_interface *intf,
 skip_normal_probe:
 
 	/*workaround for switched interfaces */
-	if (data_interface->cur_altsetting->desc.bInterfaceClass
-						!= CDC_DATA_INTERFACE_TYPE) {
-		if (control_interface->cur_altsetting->desc.bInterfaceClass
-						== CDC_DATA_INTERFACE_TYPE) {
+	if (data_interface->cur_altsetting->desc.bInterfaceClass != USB_CLASS_CDC_DATA) {
+		if (control_interface->cur_altsetting->desc.bInterfaceClass == USB_CLASS_CDC_DATA) {
 			dev_dbg(&intf->dev,
 				"Your device has switched interfaces.\n");
 			swap(control_interface, data_interface);
diff --git a/drivers/usb/class/cdc-acm.h b/drivers/usb/class/cdc-acm.h
index cd5e9d8ab237..b7174a0098a5 100644
--- a/drivers/usb/class/cdc-acm.h
+++ b/drivers/usb/class/cdc-acm.h
@@ -131,8 +131,6 @@ struct acm {
 	unsigned long quirks;
 };
 
-#define CDC_DATA_INTERFACE_TYPE	0x0a
-
 /* constants describing various quirks and errors */
 #define NO_UNION_NORMAL			BIT(0)
 #define SINGLE_RX_URB			BIT(1)
-- 
2.26.2

