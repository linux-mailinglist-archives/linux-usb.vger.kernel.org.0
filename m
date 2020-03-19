Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC8A318C2C7
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2020 23:12:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727442AbgCSWLz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 19 Mar 2020 18:11:55 -0400
Received: from mail-wr1-f74.google.com ([209.85.221.74]:49985 "EHLO
        mail-wr1-f74.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727411AbgCSWLy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 19 Mar 2020 18:11:54 -0400
Received: by mail-wr1-f74.google.com with SMTP id h17so1672560wru.16
        for <linux-usb@vger.kernel.org>; Thu, 19 Mar 2020 15:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=YnO147Q8BfuYNBKiEQsszIXKG8E9VejO4ffbcq8Gn6s=;
        b=vB+ZL9tqVJcAaugYExOK+dJD6+VoZcjwf8huI233jMEi3vlRlVuYfR1w59pAYyeFGq
         0aurG5XHAmhfR8rO2twUDX/4MryFExVZrl/dJSy5dykP/iCH1PEasHHK5+ss0Ym4bUEM
         olqhzUpErgFqM91GnmPbCOTR5hvGOqwKcsO712Fjc3akBkUfGXOTkBdTNnMV+rU6BQp3
         AAXIEM9/rHEXjzHDwq+M+wqVkOrVquJ/6ycsUSTZfqbQdkVCVImonQTDCAGkVxkKalHx
         E4y+UlMw8USVNIKzX/JBBYaX/q6Ae0Fs7FTSPlDSTtCbUNrqeao2o8okL2/UFXaJkYli
         QvxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=YnO147Q8BfuYNBKiEQsszIXKG8E9VejO4ffbcq8Gn6s=;
        b=G/RkMNdEUDukmxu/pLnm7kWHRlUnqLv9i9vbJNi4D1Ixwrd3WreRafRQZwN7/IjgUm
         sCobfF9M7oYSk8uwyG1E+vHqi3m/5lMz4Wb/fLJX4tpo2skup4LNYEO9OalyIjTeNGKW
         4Bz+tOKAuRWgK+oGvMS6yGiN+iidEZ7ga7xgyIbIKKjAZmWKQzXsP8/KZgwT+7tGeA7w
         8zZpS9b5O0XSkNU0EAhlRsrbwx5mnOorz91znZ4kOjNQf7mD9np5qRwTH6lBMMjZhX55
         2l5K9iQuotWiBxy31bKVaredJ05ANQhYisnxYPmJfRRqeOuJTETtJz9PMdFYPMfCCc0w
         KEig==
X-Gm-Message-State: ANhLgQ1PARgte4J8mZebiIFVblVmxcLCdhj3a2CB75CYuL8LKRZtanAR
        2He1PB/r15MjbinWMcMwmXE8lxzm9pObK07f
X-Google-Smtp-Source: ADFU+vuhAnTFDp93u9bxNSwjdWx/XQWCDLYMfqinwA2kIZ5a3q7WAgPMw2RqRpTpBZ9kpYOKEBjFQrTOyHIYYPnf
X-Received: by 2002:adf:97d5:: with SMTP id t21mr6512634wrb.45.1584655912665;
 Thu, 19 Mar 2020 15:11:52 -0700 (PDT)
Date:   Thu, 19 Mar 2020 23:11:35 +0100
In-Reply-To: <cover.1584655448.git.andreyknvl@google.com>
Message-Id: <6206b80b3810f95bfe1d452de45596609a07b6ea.1584456779.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1584655448.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.25.1.696.g5e7596f4ac-goog
Subject: [PATCH USB] usb: raw_gadget: fix compilation warnings in uapi headers
From:   Andrey Konovalov <andreyknvl@google.com>
To:     Dmitry Vyukov <dvyukov@google.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alexander Potapenko <glider@google.com>,
        Marco Elver <elver@google.com>,
        Andrey Konovalov <andreyknvl@google.com>,
        "kernelci . org bot" <bot@kernelci.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Mark usb_raw_io_flags_valid() and usb_raw_io_flags_zero() as inline to
fix the following warnings:

./usr/include/linux/usb/raw_gadget.h:69:12: warning: unused function 'usb_raw_io_flags_valid' [-Wunused-function]
./usr/include/linux/usb/raw_gadget.h:74:12: warning: unused function 'usb_raw_io_flags_zero' [-Wunused-function]

Reported-by: kernelci.org bot <bot@kernelci.org>
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
---
 include/uapi/linux/usb/raw_gadget.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/uapi/linux/usb/raw_gadget.h b/include/uapi/linux/usb/raw_gadget.h
index 00cbded71061..ea375082b3ac 100644
--- a/include/uapi/linux/usb/raw_gadget.h
+++ b/include/uapi/linux/usb/raw_gadget.h
@@ -66,12 +66,12 @@ struct usb_raw_event {
 #define USB_RAW_IO_FLAGS_ZERO	0x0001
 #define USB_RAW_IO_FLAGS_MASK	0x0001
 
-static int usb_raw_io_flags_valid(__u16 flags)
+static inline int usb_raw_io_flags_valid(__u16 flags)
 {
 	return (flags & ~USB_RAW_IO_FLAGS_MASK) == 0;
 }
 
-static int usb_raw_io_flags_zero(__u16 flags)
+static inline int usb_raw_io_flags_zero(__u16 flags)
 {
 	return (flags & USB_RAW_IO_FLAGS_ZERO);
 }
-- 
2.25.1.481.gfbce0eb801-goog

