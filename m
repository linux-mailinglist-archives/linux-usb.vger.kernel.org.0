Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D0EAE1F3E
	for <lists+linux-usb@lfdr.de>; Wed, 23 Oct 2019 17:25:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406743AbfJWPZA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 23 Oct 2019 11:25:00 -0400
Received: from mail-ua1-f73.google.com ([209.85.222.73]:47502 "EHLO
        mail-ua1-f73.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406692AbfJWPYn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 23 Oct 2019 11:24:43 -0400
Received: by mail-ua1-f73.google.com with SMTP id 4so2446741uay.14
        for <linux-usb@vger.kernel.org>; Wed, 23 Oct 2019 08:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=+fsowxQJsoipiOcnYQh/aAOpnyB04Lo2+yDsb2t+OXI=;
        b=rM5CCQ6QwHb40lD+8V+d3DREorqYK5DjOVpuv3ArZyGAQ516U+qeieYBqLgPg/xCCK
         UAjub/EHsWLgM2LRDliKIF+uBvQ/JLIyFqbB4P8PCFH2x5ojoCa0GTnMm7AwA84gXKV+
         kZMFiWnZrMW7me+aEiFoCKyx0Zg9KGlJpjayMWrLM/C4QjFy49U7YDeOOlyQRvjPEUhb
         7eRgQp1jx6Zkg5prYydvLpCIKKUNKxau5Flcl2aoiu02/1k6+a2awvXc/lfyJ2JFlgjD
         wJ1xx+GsUvq738BGFcz8U+DTA9duDH1CnWnU5lcaa/rUxJ8X2VmIijtBB1WemnynjuMk
         NdXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=+fsowxQJsoipiOcnYQh/aAOpnyB04Lo2+yDsb2t+OXI=;
        b=eMQW8AsG7tAFQj67ux3OYJvKl4hBZHDQyUEvzZsYnhmUp5IzKUtm05sXNs8f0+urNw
         nkyOhrmNTgSf7ZzgxL80Cv3CW47TB0rbQEwPJfpfrbc67DOJvGH+iQwXHK7JBwLH6q93
         QVpVdyCeQeN6SYk3J1qUj1uwgX4ZnYS03IH43T4DIwDFKItjCluH74j0drXHOMtqv60Q
         zSelDVYBRd/hkjVGAv+EkwVGcIvjzo/rfy8/88KpvOgjrcJDBuN0M77FHXZ+FyMAFNbx
         LEo9+bUtvT/Jfm2BdD8lF1Xi6Comt0atv7MCB56cG9pO1wOyiran4RjB61RWs0cwawea
         N8Pw==
X-Gm-Message-State: APjAAAUtkDKaWbDpJNzyA208EdPebM2Dt58hb2udXsMm9NnYLCD1UEKZ
        qFn2lsrfT5FubPJ1qaRTDeTsEEsOLf5gzvMTKZr3GT89qB3o0HEY2XR8iP/ncec/i4Mi6qsnLJe
        I6p4jpDv8+clGtLNDl3vmYOb4wtQOEWE9FRihnrgEE65sg0KU0lHrNdoH7iA0qGtr4vra5O2mQV
        3H
X-Google-Smtp-Source: APXvYqyVi59fXRYgZbs3IqAwnhV+t83pyUg453y+vcRDf4p6UDsgQ0xoylaSfeVaF4BAxV8813MNkxvSMM0JesNv
X-Received: by 2002:a1f:97c2:: with SMTP id z185mr5634334vkd.0.1571844282053;
 Wed, 23 Oct 2019 08:24:42 -0700 (PDT)
Date:   Wed, 23 Oct 2019 17:24:30 +0200
In-Reply-To: <cover.1571844200.git.andreyknvl@google.com>
Message-Id: <7ac106f30b2c1dab4809c75c5ae6efb91b531cce.1571844200.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1571844200.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.24.0.rc0.303.g954a862665-goog
Subject: [PATCH v2 2/3] usb, kcov: collect coverage from hub_event
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
global handle id from the USB subsystem kcov handle id range. As the
result kcov can now be used to collect coverage from events that happen on
a particular USB bus.

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

