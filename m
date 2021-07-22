Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 496243D2B6D
	for <lists+linux-usb@lfdr.de>; Thu, 22 Jul 2021 19:51:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229937AbhGVRLI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 22 Jul 2021 13:11:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229697AbhGVRLH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 22 Jul 2021 13:11:07 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49432C061575
        for <linux-usb@vger.kernel.org>; Thu, 22 Jul 2021 10:51:41 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id m16so9735505lfg.13
        for <linux-usb@vger.kernel.org>; Thu, 22 Jul 2021 10:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TmG//MwHJdKaLuyi5v/bKon+DjKAPtVgUySPjCaJ9Ao=;
        b=rW2BVUmbnDE1vpoFFGaCFqGTpgZ5Q3iOQGAjwGu96iSuubeiTYbid4iXSEUTXOlI/T
         PETbzZXIXA22evvZzYh8143TFQgxoY2Zy2AH+NpYG4LeNoQXzTcGhrO0TR0z+FYgNWik
         oX4hGJCaO4mCtr7y/BteUU9LLyEi6BTxCAzPl3OdPLDnWauarOuM+VErfpi1vMIaanaL
         OLGLE+EDqcEKukalasD5VYeFDwpJtNOMQ397yhGiDYGLYbsCx9yZzyO2hVbVQH39SUnj
         t0gcsu5/PnygyodB1U2QVAlANSvHDYQZCO5ER9NHQTNqCCe8FY2zPbNwzCXl58EF0uHs
         WlxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TmG//MwHJdKaLuyi5v/bKon+DjKAPtVgUySPjCaJ9Ao=;
        b=ZwRy6A9m5oqsf+TkELD19zuq9lMYimYjynTMjzNWBL2hHSk17dQTU1xC73Hu6mqBDw
         BjuOTb0x+ybn/ZLl3H5GMxy6doVuLro9VLSTSJBjTNw5W61EWwGthFekNIjQWs2AvBsD
         lHHG4OyFh4j6VyuOzgbkaXCcrc0gXaMzy3NfFQPTp0QaucFMKxtOj+7hXvlBY+4j6dem
         7BH7vBeuh8gqo4wj5sdv4/sptiHhbJQGNYV/AcNwEWrKUTYmGQ9P9qFShkz+p0eZz3hY
         P9G0xt1iQ8MvDJR3QLLkNTMFPJId3X0qsFy2BDIeTHUg//7eXyMEwfWgv455NQig/fyE
         GZ/g==
X-Gm-Message-State: AOAM530602P1ze2NJ7/1+ZTAU/mt64Xgr+cOBzyTG5t1GRDwhOZWYPsl
        RRtxpYbsDl7GiQ6glZhq/q8=
X-Google-Smtp-Source: ABdhPJyt7Uc6lL7HA4TkeEKxjf8XtqCl3R2LVdhjk/2huJ+yy38epOoZR3dtufiWBQsMj+rlCx3phg==
X-Received: by 2002:a05:6512:4004:: with SMTP id br4mr449677lfb.2.1626976299687;
        Thu, 22 Jul 2021 10:51:39 -0700 (PDT)
Received: from reki (broadband-95-84-198-152.ip.moscow.rt.ru. [95.84.198.152])
        by smtp.gmail.com with ESMTPSA id h34sm2027965lfv.231.2021.07.22.10.51.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jul 2021 10:51:39 -0700 (PDT)
Date:   Thu, 22 Jul 2021 20:51:32 +0300
From:   Maxim Devaev <mdevaev@gmail.com>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     gregkh@linuxfoundation.org, sandeen@redhat.com,
        linux-usb@vger.kernel.org, mdevaev@gmail.com
Subject: Re: [PATCH] usb: gadget: f_hid: added GET_IDLE and SET_IDLE
 handlers
Message-ID: <20210722205132.7a168041@reki>
In-Reply-To: <87y29ylga5.fsf@kernel.org>
References: <20210721180351.129450-1-mdevaev@gmail.com>
        <87y29ylga5.fsf@kernel.org>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

> Felipe Balbi <balbi@kernel.org> writes:
>=20
> yeah, I don't see any issues with this. If you have access to the tool,
> mind running USBCV on the f_hid gadget? Would be cool to get some
> confirmation that we're within spec.

Thanks for pointing to USBCV. I used a hardware USB protocol analyzer
to understand what was wrong with f_hid, and my hosts only sent idle=3D0.
Thanks to the test, I realized that I should only use the upper byte
that contains duration. Here a fixed version of the patch,
which successfully passes all HID tests. The idle part:

    Now Starting Test: HID Class GET/SET Idle Test (Configuration Index 0)
    Start time: Jul 22, 2021 - 20:29:40
    No report IDs found in report descriptor for Interface : 0x0
    GET/SETIdle test for report ID 0. Setting Idle rate to : 0x7F
    No report IDs found in report descriptor for Interface : 0x1
    GET/SETIdle test for report ID 0. Setting Idle rate to : 0x7F
   =20
    Stop time: Jul 22, 2021 - 20:29:41
    Duration:  1 second.
    Stopping Test [ HID Class GET/SET Idle Test (Configuration Index 0):
         Number of: Fails (0); Aborts (0); Warnings (0) ]


=46rom ac56ddc1ab2dfa599a12a3bf064e520d587e89fe Mon Sep 17 00:00:00 2001
From: Maxim Devaev <mdevaev@gmail.com>
Date: Wed, 21 Jul 2021 20:48:28 +0300
Subject: [PATCH] usb: gadget: f_hid: added GET_IDLE and SET_IDLE handlers

The USB HID standard declares mandatory support for GET_IDLE and SET_IDLE
requests for Boot Keyboard. Most hosts can handle their absence, but others
like some old/strange UEFIs and BIOSes consider this a critical error
and refuse to work with f_hid.

This primitive implementation of saving and returning idle is sufficient
to meet the requirements of the standard and these devices.

Signed-off-by: Maxim Devaev <mdevaev@gmail.com>
---
 drivers/usb/gadget/function/f_hid.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/usb/gadget/function/f_hid.c b/drivers/usb/gadget/funct=
ion/f_hid.c
index 02683ac07..1010f0a3e 100644
--- a/drivers/usb/gadget/function/f_hid.c
+++ b/drivers/usb/gadget/function/f_hid.c
@@ -41,6 +41,7 @@ struct f_hidg {
 	unsigned char			bInterfaceSubClass;
 	unsigned char			bInterfaceProtocol;
 	unsigned char			protocol;
+	unsigned char			idle;
 	unsigned short			report_desc_length;
 	char				*report_desc;
 	unsigned short			report_length;
@@ -523,6 +524,14 @@ static int hidg_setup(struct usb_function *f,
 		goto respond;
 		break;
=20
+	case ((USB_DIR_IN | USB_TYPE_CLASS | USB_RECIP_INTERFACE) << 8
+		  | HID_REQ_GET_IDLE):
+		VDBG(cdev, "get_idle\n");
+		length =3D min_t(unsigned int, length, 1);
+		((u8 *) req->buf)[0] =3D hidg->idle;
+		goto respond;
+		break;
+
 	case ((USB_DIR_OUT | USB_TYPE_CLASS | USB_RECIP_INTERFACE) << 8
 		  | HID_REQ_SET_REPORT):
 		VDBG(cdev, "set_report | wLength=3D%d\n", ctrl->wLength);
@@ -546,6 +555,14 @@ static int hidg_setup(struct usb_function *f,
 		goto stall;
 		break;
=20
+	case ((USB_DIR_OUT | USB_TYPE_CLASS | USB_RECIP_INTERFACE) << 8
+		  | HID_REQ_SET_IDLE):
+		VDBG(cdev, "set_idle\n");
+		length =3D 0;
+		hidg->idle =3D value >> 8;
+		goto respond;
+		break;
+
 	case ((USB_DIR_IN | USB_TYPE_STANDARD | USB_RECIP_INTERFACE) << 8
 		  | USB_REQ_GET_DESCRIPTOR):
 		switch (value >> 8) {
@@ -773,6 +790,7 @@ static int hidg_bind(struct usb_configuration *c, struc=
t usb_function *f)
 	hidg_interface_desc.bInterfaceSubClass =3D hidg->bInterfaceSubClass;
 	hidg_interface_desc.bInterfaceProtocol =3D hidg->bInterfaceProtocol;
 	hidg->protocol =3D HID_REPORT_PROTOCOL;
+	hidg->idle =3D 1;
 	hidg_ss_in_ep_desc.wMaxPacketSize =3D cpu_to_le16(hidg->report_length);
 	hidg_ss_in_comp_desc.wBytesPerInterval =3D
 				cpu_to_le16(hidg->report_length);
--=20
2.32.0
