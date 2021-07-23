Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D2603D3C57
	for <lists+linux-usb@lfdr.de>; Fri, 23 Jul 2021 17:22:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235514AbhGWOlf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 23 Jul 2021 10:41:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235484AbhGWOle (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 23 Jul 2021 10:41:34 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70D48C061575
        for <linux-usb@vger.kernel.org>; Fri, 23 Jul 2021 08:22:07 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id g13so2608812lfj.12
        for <linux-usb@vger.kernel.org>; Fri, 23 Jul 2021 08:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kuRK2QclNOn92ZmDRBwu0W5l9SZ/PH+rJnJyAj7pojA=;
        b=TKycLY2QoQ8bNZCEFrlLxYz4tjcNNhCMA9fqsVrC0hTEpaaWdTnmhPg+ZFCgPEc9BU
         Rq1wp4Vksx/f0de0CCrYSNRvSqx27gYW/cdVzTugiVpqPf2P8KaTJn+tDr3StBhmOMbx
         gfJT+d+Y+Bc/HoUl1rukYyOmiCVuPfL4I3g87tBY1owjic8Is4e0j+AC8VZzNT8i4Op4
         MHR/OGBPmY1nxXNkxqtp15otCV5WKlYiKflrBI0kSM3fJ36CYZW0lv98U3uEjjYBkReN
         Snh3uOT3uhYbIzswIIZ5PS2o+pTm+3jyAakk6kHHVXF0aVqKNRd8irOVmb49iE7LDk/X
         6F3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kuRK2QclNOn92ZmDRBwu0W5l9SZ/PH+rJnJyAj7pojA=;
        b=RUqVhWJPo4dp4XDdmF7XWq+BQuldfdQsLgV1Yc1ARcqd5mkLDYfwXBdx9mvO7Gn6As
         F+RNxFbpt6JAY4WDgXzHNuIc62XO2ZgvBn7wYVT0VNq3oMeIRj+VmvL1jPH3+lM0Bvpd
         UR9XMfWWl9EOAcsCIUuYivaBrCIwXz8TsWdcnuLyPD6eyBzrC2KpRFmKcLfJmdwPaWFy
         2d7H4KyE08mEe5rEoZpzBhOXNGlkq8CZmEp3AaN56DCp0vcVEeARr2LubEkO/7EYZPYo
         jxRMFU3C4X1vZmkHXyPKXUFQStPlUz+LJ5LI9M/UP7aFzt3H90gaqY49yuqoaml5BJ0b
         XqGA==
X-Gm-Message-State: AOAM530XgvYFLpNoLkj5lmwrtHPXR+NTi+UeZJKViD38dWKDT5k5iAoK
        pHBuypQKHY/YPPHKVIA968Y=
X-Google-Smtp-Source: ABdhPJz/CgRb+aClkP6/cWGcwqP0DIvQ+2W5lGXlpKnW+gdvJL0f4MNY+rfH3o72gBeYzT06Nr/QaQ==
X-Received: by 2002:ac2:4288:: with SMTP id m8mr3276629lfh.461.1627053725798;
        Fri, 23 Jul 2021 08:22:05 -0700 (PDT)
Received: from reki (broadband-95-84-198-152.ip.moscow.rt.ru. [95.84.198.152])
        by smtp.gmail.com with ESMTPSA id d25sm2268036lfn.112.2021.07.23.08.22.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jul 2021 08:22:05 -0700 (PDT)
Date:   Fri, 23 Jul 2021 18:22:03 +0300
From:   Maxim Devaev <mdevaev@gmail.com>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     balbi@kernel.org, sandeen@redhat.com, linux-usb@vger.kernel.org,
        Phil Elwell <phil@raspberrypi.com>
Subject: Re: [PATCH] usb: gadget: f_hid: fixed NULL pointer dereference
Message-ID: <20210723182203.48396b80@reki>
In-Reply-To: <YPqWeCwFQJXLA1ey@kroah.com>
References: <20210723095323.205593-1-mdevaev@gmail.com>
 <YPqWeCwFQJXLA1ey@kroah.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

> Greg KH <gregkh@linuxfoundation.org> writes:
> Who is the original author here?  Please put their name as the "From:"
> line in the changelog so we can give proper credit if it was not you.

Phil Elwell. Fixed.

> Test for !req and then abort, and then continue on.  No need for moving
> the copy_from_user line in, right?  Should make the change smaller
> overall.

Fixed.

> Blank line after this please.

Added.

> Are the braces still needed here?

No, you're right.

Thanks for the review! Here the new version of the patch:

=46rom 72a504af8e3df3d7a44e9954b8cf03268795c07f Mon Sep 17 00:00:00 2001
From: Phil Elwell <phil@raspberrypi.com>
Date: Fri, 23 Jul 2021 11:59:49 +0300
Subject: [PATCH] usb: gadget: f_hid: fixed NULL pointer dereference

Disconnecting and reconnecting the USB cable can lead to crashes
and a variety of kernel log spam.

The problem was found and reproduced on the Raspberry Pi [1]
and the original fix was created in Raspberry's own fork [2].

Signed-off-by: Maxim Devaev <mdevaev@gmail.com>
Signed-off-by: Phil Elwell <phil@raspberrypi.com>
Link: https://github.com/raspberrypi/linux/issues/3870 [1]
Link: https://github.com/raspberrypi/linux/commit/a6e47d5f4efbd2ea6a0b6565c=
d2f9b7bb217ded5 [2]
---
 drivers/usb/gadget/function/f_hid.c | 26 ++++++++++++++++++++------
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/gadget/function/f_hid.c b/drivers/usb/gadget/funct=
ion/f_hid.c
index 02683ac07..08e73e812 100644
--- a/drivers/usb/gadget/function/f_hid.c
+++ b/drivers/usb/gadget/function/f_hid.c
@@ -338,6 +338,11 @@ static ssize_t f_hidg_write(struct file *file, const c=
har __user *buffer,
=20
 	spin_lock_irqsave(&hidg->write_spinlock, flags);
=20
+	if (!hidg->req) {
+		spin_unlock_irqrestore(&hidg->write_spinlock, flags);
+		return -ESHUTDOWN;
+	}
+
 #define WRITE_COND (!hidg->write_pending)
 try_again:
 	/* write queue */
@@ -358,8 +363,14 @@ static ssize_t f_hidg_write(struct file *file, const c=
har __user *buffer,
 	count  =3D min_t(unsigned, count, hidg->report_length);
=20
 	spin_unlock_irqrestore(&hidg->write_spinlock, flags);
-	status =3D copy_from_user(req->buf, buffer, count);
=20
+	if (!req) {
+		ERROR(hidg->func.config->cdev, "hidg->req is NULL\n");
+		status =3D -ESHUTDOWN;
+		goto release_write_pending;
+	}
+
+	status =3D copy_from_user(req->buf, buffer, count);
 	if (status !=3D 0) {
 		ERROR(hidg->func.config->cdev,
 			"copy_from_user error\n");
@@ -387,14 +398,17 @@ static ssize_t f_hidg_write(struct file *file, const =
char __user *buffer,
=20
 	spin_unlock_irqrestore(&hidg->write_spinlock, flags);
=20
+	if (!hidg->in_ep->enabled) {
+		ERROR(hidg->func.config->cdev, "in_ep is disabled\n");
+		status =3D -ESHUTDOWN;
+		goto release_write_pending;
+	}
+
 	status =3D usb_ep_queue(hidg->in_ep, req, GFP_ATOMIC);
-	if (status < 0) {
-		ERROR(hidg->func.config->cdev,
-			"usb_ep_queue error on int endpoint %zd\n", status);
+	if (status < 0)
 		goto release_write_pending;
-	} else {
+	else
 		status =3D count;
-	}
=20
 	return status;
 release_write_pending:
--=20
2.32.0
