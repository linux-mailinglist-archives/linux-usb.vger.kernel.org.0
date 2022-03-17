Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B8254DBEE7
	for <lists+linux-usb@lfdr.de>; Thu, 17 Mar 2022 07:05:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229579AbiCQGGP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 17 Mar 2022 02:06:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229780AbiCQGGH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 17 Mar 2022 02:06:07 -0400
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com [IPv6:2607:f8b0:4864:20::e30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25DA4F3A43
        for <linux-usb@vger.kernel.org>; Wed, 16 Mar 2022 22:38:06 -0700 (PDT)
Received: by mail-vs1-xe30.google.com with SMTP id y4so4408065vsd.11
        for <linux-usb@vger.kernel.org>; Wed, 16 Mar 2022 22:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9NdJb4RDgp+BJmtWEEcZQrfda0+GIucqryqqu1rCYYc=;
        b=LELb38i0kjAbl3rLsUfPdmM/eFdFoBrlEIWF7nHlEAT6OIwz8SgiQEyMps3Z9O143R
         lP60CGb45aNwjzEK0+dVHo0aUUduvQ4SQHDiNv3ptk0n8REPI/xzPF7EZD4ZbFRRf2eh
         Ywe4AR707lneuyyC206/76qPkmFz6OPvZgGwO2x4a2QtIs+Uj4owo085cpyNqU18B6TE
         a5CGZy5l6Och00+yQ9lRHYeRTEVB81nr6bnfelo+uQ3o3Yo6SLbiqx7hOuFdO4MErWux
         1fHCCiFT9xUDjsuCzF2QwyjYbFbuKjIzRpmmhxObJ6JpTVK+qtWiw/c03dRyD0GD80ld
         HuGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=9NdJb4RDgp+BJmtWEEcZQrfda0+GIucqryqqu1rCYYc=;
        b=SJlfF6L8Bddfo0QgJvm7B6vWaXC8XNa7hWANhmm5WnG0CR5bNRD4vFbiWCS8+WBSnT
         +o7w0Ik2vMG4iR5QiQOfXznowHgKLpOCPjmPJ8iuTP8HfQx3lDzw5CRGekvtDy52QVZD
         a+jFP35ag+9yMzxpSwXv+ZH/EwtAtD7WiKcWS/kUhOjIH++ua/QxYaL277zje46mA0d0
         bG5IqYj6m1tHw+lFJU9pySw7J+PU8hHwNaa7gYrBXNGAkPndiGfzZiPx1sjDowuq6swj
         T5I7lVRQP9cyCdQZELDfeo+hN+a3iMf69tzi+3wVtPcxqQ6xZ5B7wtwlt/8PGgt9n9ik
         Y9XA==
X-Gm-Message-State: AOAM532Nnh/yiMx6TkdfYiyB9VGv9aGWs46ZIuu0ZaPPxy6gCTbRHuQX
        f95KyXP2Q5EHBKKcXUMGoBijGGGAgNVmww==
X-Google-Smtp-Source: ABdhPJyoWDGVkyK/W4p9mBQzarEFmEmY4/Oc6mcYC8J13bQLJzHhJXUKEdqTAEZa+0rqMUSg+d0cvA==
X-Received: by 2002:a17:902:e748:b0:153:b484:bdf4 with SMTP id p8-20020a170902e74800b00153b484bdf4mr3047454plf.66.1647489336326;
        Wed, 16 Mar 2022 20:55:36 -0700 (PDT)
Received: from localhost.localdomain (124x33x176x97.ap124.ftth.ucom.ne.jp. [124.33.176.97])
        by smtp.gmail.com with ESMTPSA id e6-20020a056a001a8600b004f78e446ff5sm5096734pfv.15.2022.03.16.20.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Mar 2022 20:55:36 -0700 (PDT)
Sender: Vincent Mailhol <vincent.mailhol@gmail.com>
From:   Vincent Mailhol <mailhol.vincent@wanadoo.fr>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Cc:     Vincent Mailhol <mailhol.vincent@wanadoo.fr>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: [PATCH v4 2/9] HID: usbhid: remove third argument of usb_maxpacket()
Date:   Thu, 17 Mar 2022 12:55:07 +0900
Message-Id: <20220317035514.6378-3-mailhol.vincent@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220317035514.6378-1-mailhol.vincent@wanadoo.fr>
References: <20220304105420.1059585-1-mailhol.vincent@wanadoo.fr>
 <20220317035514.6378-1-mailhol.vincent@wanadoo.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The third argument of usb_maxpacket(): in_out has been deprecated
because it could be derived from the second argument (e.g. using
usb_pipeout(pipe)).

N.B. function usb_maxpacket() was made variadic to accommodate the
transition from the old prototype with three arguments to the new one
with only two arguments (so that no renaming is needed). The variadic
argument is to be removed once all users of usb_maxpacket() get
migrated.

CC: Jiri Kosina <jikos@kernel.org>
CC: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Signed-off-by: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
---
 drivers/hid/usbhid/hid-core.c | 2 +-
 drivers/hid/usbhid/usbkbd.c   | 2 +-
 drivers/hid/usbhid/usbmouse.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/usbhid/hid-core.c b/drivers/hid/usbhid/hid-core.c
index 54752c85604b..4490e2f7252a 100644
--- a/drivers/hid/usbhid/hid-core.c
+++ b/drivers/hid/usbhid/hid-core.c
@@ -387,7 +387,7 @@ static int hid_submit_ctrl(struct hid_device *hid)
 
 		usbhid->urbctrl->pipe = usb_rcvctrlpipe(hid_to_usb_dev(hid), 0);
 		maxpacket = usb_maxpacket(hid_to_usb_dev(hid),
-					  usbhid->urbctrl->pipe, 0);
+					  usbhid->urbctrl->pipe);
 		len += (len == 0);	/* Don't allow 0-length reports */
 		len = round_up(len, maxpacket);
 		if (len > usbhid->bufsize)
diff --git a/drivers/hid/usbhid/usbkbd.c b/drivers/hid/usbhid/usbkbd.c
index df02002066ce..b4b007c4beb6 100644
--- a/drivers/hid/usbhid/usbkbd.c
+++ b/drivers/hid/usbhid/usbkbd.c
@@ -279,7 +279,7 @@ static int usb_kbd_probe(struct usb_interface *iface,
 		return -ENODEV;
 
 	pipe = usb_rcvintpipe(dev, endpoint->bEndpointAddress);
-	maxp = usb_maxpacket(dev, pipe, usb_pipeout(pipe));
+	maxp = usb_maxpacket(dev, pipe);
 
 	kbd = kzalloc(sizeof(struct usb_kbd), GFP_KERNEL);
 	input_dev = input_allocate_device();
diff --git a/drivers/hid/usbhid/usbmouse.c b/drivers/hid/usbhid/usbmouse.c
index c89332017d5d..fb1d7d1f6999 100644
--- a/drivers/hid/usbhid/usbmouse.c
+++ b/drivers/hid/usbhid/usbmouse.c
@@ -123,7 +123,7 @@ static int usb_mouse_probe(struct usb_interface *intf, const struct usb_device_i
 		return -ENODEV;
 
 	pipe = usb_rcvintpipe(dev, endpoint->bEndpointAddress);
-	maxp = usb_maxpacket(dev, pipe, usb_pipeout(pipe));
+	maxp = usb_maxpacket(dev, pipe);
 
 	mouse = kzalloc(sizeof(struct usb_mouse), GFP_KERNEL);
 	input_dev = input_allocate_device();
-- 
2.34.1

