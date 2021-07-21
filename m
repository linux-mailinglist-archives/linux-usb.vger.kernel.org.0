Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 991BA3D15DA
	for <lists+linux-usb@lfdr.de>; Wed, 21 Jul 2021 20:05:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231950AbhGURXj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Jul 2021 13:23:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229961AbhGURXi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 21 Jul 2021 13:23:38 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C56EC061575
        for <linux-usb@vger.kernel.org>; Wed, 21 Jul 2021 11:04:14 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id m16so4418342lfg.13
        for <linux-usb@vger.kernel.org>; Wed, 21 Jul 2021 11:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qFzfGfNT0XYGewWkJvl6F/ohB8obX0AKzenDOvTowUo=;
        b=ZEYJEhW+VVmJhGGSGwq6GpYkCKA9H77ifza9q30z89WJCrphZ6FpgPUdeVASkhskaa
         KBbZrPf92loJN5XoyBsfzZTpO3AyYQkx0uzBW0EdbJA0snH7KH9tI3SXKYejwnq2vSti
         73sX7NSc8RW0eOlmOUoyELWPnBFSiPK3mxAjZWMK/gD8zY2lu/9a++5KV8S8BDUGrGXb
         LHyyGWr03J77JL6HMPSsIJzYUQlgTXLoZOx9jwQZRi4hqd7BOSjg+ylrSfIoCNOjzaad
         kIpn/2GyeRib4NYGs+jvcOC5C1I+qW/K/EoNs9xFB+OK8rjs2idblGb0EZKiP5pRSVjl
         HolQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qFzfGfNT0XYGewWkJvl6F/ohB8obX0AKzenDOvTowUo=;
        b=bUF/q28kRWS/5zjkU7EQ+Rc9Tx6Uo3P73uIPY7EpAKLoTvEw+Zh189v3kayJClOoNf
         IxNa5f23Pe99INHC1LWoJopCSY62bjO1mFVMLwoSDwbmEqial1KVNi8fBd77o2gHA0CX
         EMdhAjmwnKwWhqk8rIHoXuGpB2HaW5Vjp/t2cPkn5p0cA6B45JkLbkU4d/BXt4CNh/WW
         4Vsm7/qSvZP8iqNfrJRL6cXND00ZJZPl3mQfHcVpsx8bZTW+AgHuyOkzpwXLkewE14Jr
         gp5EubbV/qWJ+cgKaJ1pXD+RmE/UPUW6PEgf4Xo/H3FJFgedZqZjZF6kVz6MJZmysEom
         ktRw==
X-Gm-Message-State: AOAM531UFP24VPz/plo3hApCGpffDg7ND+05VXvQKULEV/9tRaCkUOQx
        VOQ/Uwu1GQkWR2NF1sR0kHU=
X-Google-Smtp-Source: ABdhPJwPsFu19oefhR734USqpwh3FmI/i3ihTrZswbWtBjIk03sWpRrtK+T9BK4Dx609uLWlImBruw==
X-Received: by 2002:ac2:435a:: with SMTP id o26mr25730960lfl.216.1626890652612;
        Wed, 21 Jul 2021 11:04:12 -0700 (PDT)
Received: from localhost.localdomain (broadband-95-84-198-152.ip.moscow.rt.ru. [95.84.198.152])
        by smtp.gmail.com with ESMTPSA id t12sm2874136ljj.55.2021.07.21.11.04.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jul 2021 11:04:12 -0700 (PDT)
From:   Maxim Devaev <mdevaev@gmail.com>
To:     balbi@kernel.org
Cc:     gregkh@linuxfoundation.org, sandeen@redhat.com,
        linux-usb@vger.kernel.org, mdevaev@gmail.com
Subject: [PATCH] usb: gadget: f_hid: added GET_IDLE and SET_IDLE handlers
Date:   Wed, 21 Jul 2021 21:03:51 +0300
Message-Id: <20210721180351.129450-1-mdevaev@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

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

diff --git a/drivers/usb/gadget/function/f_hid.c b/drivers/usb/gadget/function/f_hid.c
index 02683ac07..1e1d1ae38 100644
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
 
+	case ((USB_DIR_IN | USB_TYPE_CLASS | USB_RECIP_INTERFACE) << 8
+		  | HID_REQ_GET_IDLE):
+		VDBG(cdev, "get_idle\n");
+		length = min_t(unsigned int, length, 1);
+		((u8 *) req->buf)[0] = hidg->idle;
+		goto respond;
+		break;
+
 	case ((USB_DIR_OUT | USB_TYPE_CLASS | USB_RECIP_INTERFACE) << 8
 		  | HID_REQ_SET_REPORT):
 		VDBG(cdev, "set_report | wLength=%d\n", ctrl->wLength);
@@ -546,6 +555,14 @@ static int hidg_setup(struct usb_function *f,
 		goto stall;
 		break;
 
+	case ((USB_DIR_OUT | USB_TYPE_CLASS | USB_RECIP_INTERFACE) << 8
+		  | HID_REQ_SET_IDLE):
+		VDBG(cdev, "set_idle\n");
+		length = 0;
+		hidg->idle = value;
+		goto respond;
+		break;
+
 	case ((USB_DIR_IN | USB_TYPE_STANDARD | USB_RECIP_INTERFACE) << 8
 		  | USB_REQ_GET_DESCRIPTOR):
 		switch (value >> 8) {
@@ -773,6 +790,7 @@ static int hidg_bind(struct usb_configuration *c, struct usb_function *f)
 	hidg_interface_desc.bInterfaceSubClass = hidg->bInterfaceSubClass;
 	hidg_interface_desc.bInterfaceProtocol = hidg->bInterfaceProtocol;
 	hidg->protocol = HID_REPORT_PROTOCOL;
+	hidg->idle = 1;
 	hidg_ss_in_ep_desc.wMaxPacketSize = cpu_to_le16(hidg->report_length);
 	hidg_ss_in_comp_desc.wBytesPerInterval =
 				cpu_to_le16(hidg->report_length);
-- 
2.32.0

