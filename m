Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F07AE0988
	for <lists+linux-usb@lfdr.de>; Tue, 22 Oct 2019 18:47:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389559AbfJVQqs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 22 Oct 2019 12:46:48 -0400
Received: from mail-wm1-f74.google.com ([209.85.128.74]:43619 "EHLO
        mail-wm1-f74.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389540AbfJVQqr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 22 Oct 2019 12:46:47 -0400
Received: by mail-wm1-f74.google.com with SMTP id z24so6490668wmk.8
        for <linux-usb@vger.kernel.org>; Tue, 22 Oct 2019 09:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=dZqmdJoB3+A49ICzPo96uRSdJyjd5u4IxSZMRZTT8kw=;
        b=aGCQoxiscmOs4q7I5aIwxy/WLvyyzb4S34dykF8stm150nI0Mg7g+zESFmXDJWDLsf
         g9sUxrKCxB3EgINvN4U5jZc5Ivkz8fRrFJ3rKj4iHN51povup3qWqaDWi4wGkq9E6mMa
         D0RHOnyNQg/FaQHBqf1CvRZfHmm7is/+WKRLg4iWrnMivEC/2AO3B4u62zghIer97iMO
         8lzdwI8EAJPsycgo0jxJ/hMURM48uWgsQJsu/VSnb+yET7PkBWAFr5CImm6g3gO6la79
         wVRrrBA9MJF1t9HU0b3RoAyhzh+6lZEesOE/38w6DLyOmYOqMA/i3bc7AHiiCOKJqQB0
         E+tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=dZqmdJoB3+A49ICzPo96uRSdJyjd5u4IxSZMRZTT8kw=;
        b=YryfIssY13mCstp+wdF3afqC5HNlGgJbS93ReUvvnD2PnyStN2KAJFz4LqtQPiy9Yh
         U0P7KmPoA44I4R8MbbtwSSFZplLOG+9I6/pekk0lFhclomZ2PmjzZPx/ilZIsVDNVI25
         7yR05gcpJoXAbmDnmDQnFwusscRclw9Xam8wqOgh4PJEbxAz0PyE2wMswq8RLVPpA5E3
         a3EwSCy2yu72xDOuen/uPkwA7oYTkwtpcz2McPIW88mhIRpopv4O7UdWHNEolANDU00M
         FXK9M3q3GSdhhOwTUdhqaIMPYMOHFlqjXOBjfx9Rfh10TGcZnZMxbIEvFzH+X52QuveR
         YC+Q==
X-Gm-Message-State: APjAAAWffe/TYuHQDGZyS46wzR5LmsTMzz3mT5DdZ3FZNV0zdZPFIRUt
        2s757kOy0YaXDzJjXwof4HkYvQpGkI51Cwm6Vr4S7hnECD3P4bVg4V6CdH9xaULgiJnwfsXNXrG
        HepRaAgIUOvv35m2hESi+5sZyI3wRhxsshG1UzzwCNMkTNtZyVZD2DDJL2zuY3mtXvO1Aq3Tyyi
        YU
X-Google-Smtp-Source: APXvYqyg34S0UvAo3dCHduedIiaciddRbGPGd1ANg2NOZTg0iOc4BttacxusO1zMaQisBx28V0YrLfMfr6aEKg0V
X-Received: by 2002:adf:e702:: with SMTP id c2mr4203701wrm.70.1571762803843;
 Tue, 22 Oct 2019 09:46:43 -0700 (PDT)
Date:   Tue, 22 Oct 2019 18:46:32 +0200
In-Reply-To: <cover.1571762488.git.andreyknvl@google.com>
Message-Id: <453d1fe3843d576eeeef6f8536eead59c1e566f3.1571762488.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1571762488.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.23.0.866.gb869b98d4c-goog
Subject: [PATCH 2/3] usb, kcov: collect coverage from hub_event
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
index 236313f41f4a..2634976dab3b 100644
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
 
+	kcov_remote_start(kcov_remote_handle_usb(hdev->bus->busnum));
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
2.23.0.866.gb869b98d4c-goog

