Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 24B03E8CC2
	for <lists+linux-usb@lfdr.de>; Tue, 29 Oct 2019 17:32:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390498AbfJ2Qcq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 29 Oct 2019 12:32:46 -0400
Received: from mail-qt1-f202.google.com ([209.85.160.202]:33705 "EHLO
        mail-qt1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390458AbfJ2Qcp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 29 Oct 2019 12:32:45 -0400
Received: by mail-qt1-f202.google.com with SMTP id k53so15006009qtk.0
        for <linux-usb@vger.kernel.org>; Tue, 29 Oct 2019 09:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=faKSwlSmrf00HoJTd4USGLoBTwV5dEP/8paqFstcDoc=;
        b=Nz75YSFZjOcoohsJhZXuh9r/j4u1xAgcPaQgz0lBLSkZB2ODDE+MdTXxZYEaD3E62c
         OmHFv8rFSi6NgwdSYY87X4qz9DqBuzDtjhscnrtadxPQqsLvxLnhZk8IF5dGmrm5sYF3
         zbHUml+6nzeqwHzOnd4QXiailc4uT1Uc97LBlxaZGNw/m/1ZX5DtOnjciKnKaBFyEzVG
         FmRZSLCSe7zpFw8fmmMsJJDD49ekY58ES32VAIFMX6SDAbdl6YB8NsVCSzi1ZXeqXrg3
         CVlmxM7WVDV+7TQVXrEnGE4ahQRTguLirKt9jxD/SXcMtRziKOweOl0IyXDTWXCz32Gc
         XteQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=faKSwlSmrf00HoJTd4USGLoBTwV5dEP/8paqFstcDoc=;
        b=CIJ5h7/fK7hya9lKGNcTFCKWZY1G5jqvdkqqZWrCxLn7hAlwh3Enl+Ux+B50AvMG3V
         QqNe1gZAp++yjU0u50Iem/eLu4fX0Q9Hejb1R7lIMjETT39jPDLBcUNV7iYGN8IZXxHz
         sgiDCuVzDvlxZwMFYiicYicP/8STlQWqjQAW9OYmDgW10frGp/oIO7oF11ia9S1ATKs8
         a1ZrFuwMpAvsYrt2TkiO1I7M6LnKjoImcaYunKcOlNjKpvWgMg140Yqu2/eX38HHyPcu
         GxsZZU0gbweOCNr33sbhHgdJQ85F4s7DguvnKVAdapJgzGEeomIE5rr3Wr3ZdKoI4USS
         C6EQ==
X-Gm-Message-State: APjAAAVUNwAm8Fh3kc1Jrj5I0+5wJM0E3tiq0Q2Coa5tY8iI9N5mjO49
        DLB4844saWsaqY8kk3u8/S9IJYUBxg/2sWqTmwLP+SbNguLFsL/1p5mySgOfvRaTvEhFUMTRMl8
        p/H7axjbyPInTfsLdAYJ/qjFoJjxgBOqU7MYnqdQAbQnDmfosuE4S7JQnKnW862C7/Ht7scOhWQ
        PL
X-Google-Smtp-Source: APXvYqwTWzu3ovaXFQhXn10N2hQ7GnlWOKOp8q2TyEUZqeMzmyCmDkxG3BUDYq5XUqxyUSVreMdyPbCjexQr1vIG
X-Received: by 2002:a0c:e8cb:: with SMTP id m11mr17810316qvo.182.1572366763616;
 Tue, 29 Oct 2019 09:32:43 -0700 (PDT)
Date:   Tue, 29 Oct 2019 17:32:28 +0100
In-Reply-To: <cover.1572366574.git.andreyknvl@google.com>
Message-Id: <de4fe1c219db2d002d905dc1736e2a3bfa1db997.1572366574.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1572366574.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.24.0.rc0.303.g954a862665-goog
Subject: [PATCH v3 2/3] usb, kcov: collect coverage from hub_event
From:   Andrey Konovalov <andreyknvl@google.com>
To:     linux-usb@vger.kernel.org, kvm@vger.kernel.org,
        virtualization@lists.linux-foundation.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, Dmitry Vyukov <dvyukov@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        "Michael S . Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Steven Rostedt <rostedt@goodmis.org>,
        David Windsor <dwindsor@gmail.com>,
        Elena Reshetova <elena.reshetova@intel.com>,
        Anders Roxell <anders.roxell@linaro.org>,
        Alexander Potapenko <glider@google.com>,
        Marco Elver <elver@google.com>,
        Andrey Konovalov <andreyknvl@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This patch adds kcov_remote_start()/kcov_remote_stop() annotations to the
hub_event() function, which is responsible for processing events on USB
buses, in particular events that happen during USB device enumeration.
Since hub_event() is run in a global background kernel thread (see
Documentation/dev-tools/kcov.rst for details), each USB bus gets a unique
global handle from the USB subsystem kcov handle range. As the result kcov
can now be used to collect coverage from events that happen on a
particular USB bus.

Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
---
 drivers/usb/core/hub.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 236313f41f4a..823dd675f6db 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -29,6 +29,7 @@
 #include <linux/random.h>
 #include <linux/pm_qos.h>
 #include <linux/kobject.h>
+#include <linux/kcov.h>
 
 #include <linux/uaccess.h>
 #include <asm/byteorder.h>
@@ -5374,6 +5375,8 @@ static void hub_event(struct work_struct *work)
 	hub_dev = hub->intfdev;
 	intf = to_usb_interface(hub_dev);
 
+	kcov_remote_start_usb((u64)hdev->bus->busnum);
+
 	dev_dbg(hub_dev, "state %d ports %d chg %04x evt %04x\n",
 			hdev->state, hdev->maxchild,
 			/* NOTE: expects max 15 ports... */
@@ -5480,6 +5483,8 @@ static void hub_event(struct work_struct *work)
 	/* Balance the stuff in kick_hub_wq() and allow autosuspend */
 	usb_autopm_put_interface(intf);
 	kref_put(&hub->kref, hub_release);
+
+	kcov_remote_stop();
 }
 
 static const struct usb_device_id hub_id_table[] = {
-- 
2.24.0.rc0.303.g954a862665-goog

