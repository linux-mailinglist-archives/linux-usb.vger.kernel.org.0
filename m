Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 131334DB600
	for <lists+linux-usb@lfdr.de>; Wed, 16 Mar 2022 17:22:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357484AbiCPQVI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 16 Mar 2022 12:21:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357489AbiCPQVF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 16 Mar 2022 12:21:05 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DE0636B71
        for <linux-usb@vger.kernel.org>; Wed, 16 Mar 2022 09:19:50 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id n2so2209069plf.4
        for <linux-usb@vger.kernel.org>; Wed, 16 Mar 2022 09:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9NdJb4RDgp+BJmtWEEcZQrfda0+GIucqryqqu1rCYYc=;
        b=JFg/b3Er62OZQ10vBXK9Lrev4pZxFdLx2I4zuqIqaOBLYK/MqFqBWrpbFy3sKSzbZb
         /qYJProVO4sjDuMPGac+pIPDvhtxXlTf+oqb4M2V7T80GdKjOnQgJO8gFblAfBiqbmJS
         fWo80s5ku5DkvXOHsUfcRr/Bwfkild4JuBmDHtY4cd1pvLYmWan7TiGdzAmQHPAwEjJX
         MT8Cr5IK3YUZS7lvvSq1V3h2KQL4KtQ3lLMTNhzvWYSCTEp5lxyZ7v9JO2B3ETvnyxAV
         ChR9KdW0mZRfLVjPgOuM9m8OgZSyQm0KHWGLogW/TgoA/THGPYN25ZJjfbQ7mpKl9oSt
         998Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=9NdJb4RDgp+BJmtWEEcZQrfda0+GIucqryqqu1rCYYc=;
        b=krA4Kyr+iTvjFbP2n4WBr21SJOPtMYOmQ+oSk068NXHSAr7QDGsQGv/PuVx0LUj7nP
         hZz4sV7/66z0lWSCAZX/HJChHdar8q2S1dPOPwQenkE/bdRVsy+MKXTG3Kg/cgbApes9
         JZHZbkfZ6MBvepHU2+B17o+NvDgmMS9EAoR2kYm2mQOZUVzanb0VnHQ60SKJWGqAJnBf
         5UQyv/vLzlgMzDdxjFwmMlTcUFIMFtHtMWGEpwJ+2EsLDwwSeIiEXFK0qpC5ZGRc7IXn
         X7rj+jh5lOL6JO6W4nR3kdRmvWvWphH3TEMprCjatfF1BNzBuMzEHUQJU1ek+e4OhdkW
         fkSQ==
X-Gm-Message-State: AOAM532FTNwF6jXUMZoSyFr9P0VSLFD9DBQLgyKIQSfm4uuKGQ/7TH+R
        296n6hm42p6XG0evLPFbUjk=
X-Google-Smtp-Source: ABdhPJyiQz79B7DM7PZ2Wmhx8k59ndJAK/X3ERo6Lk5bZaxLHfTcVor5tB+lFH2t3oW7cCElZG6+OA==
X-Received: by 2002:a17:902:7610:b0:151:6152:549c with SMTP id k16-20020a170902761000b001516152549cmr394441pll.91.1647447589959;
        Wed, 16 Mar 2022 09:19:49 -0700 (PDT)
Received: from localhost.localdomain (124x33x176x97.ap124.ftth.ucom.ne.jp. [124.33.176.97])
        by smtp.gmail.com with ESMTPSA id mt15-20020a17090b230f00b001bf191e6f08sm2988374pjb.9.2022.03.16.09.19.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Mar 2022 09:19:49 -0700 (PDT)
Sender: Vincent Mailhol <vincent.mailhol@gmail.com>
From:   Vincent Mailhol <mailhol.vincent@wanadoo.fr>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Cc:     Vincent Mailhol <mailhol.vincent@wanadoo.fr>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: [PATCH v3 2/9] HID: usbhid: remove third argument of usb_maxpacket()
Date:   Thu, 17 Mar 2022 01:19:28 +0900
Message-Id: <20220316161935.2049-3-mailhol.vincent@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220316161935.2049-1-mailhol.vincent@wanadoo.fr>
References: <20220304105420.1059585-1-mailhol.vincent@wanadoo.fr>
 <20220316161935.2049-1-mailhol.vincent@wanadoo.fr>
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

