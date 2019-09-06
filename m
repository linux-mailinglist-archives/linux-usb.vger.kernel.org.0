Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EB2A4AB5EA
	for <lists+linux-usb@lfdr.de>; Fri,  6 Sep 2019 12:33:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393055AbfIFKdC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 6 Sep 2019 06:33:02 -0400
Received: from mail-qt1-f201.google.com ([209.85.160.201]:37963 "EHLO
        mail-qt1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393035AbfIFKdA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 6 Sep 2019 06:33:00 -0400
Received: by mail-qt1-f201.google.com with SMTP id l22so5801197qtq.5
        for <linux-usb@vger.kernel.org>; Fri, 06 Sep 2019 03:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=QzLwUka7MndmPbLBfBjtnVUWcO8y+yUapUjSVd2AkdE=;
        b=Cwgi2TD2axl7EA3tVfizddxZpfimXndhfzAvvjo1Y/HcF0VNlztN/wh+wlfI/QRMJC
         721inxt51pWefqg1V5l9Jg7vIvYwuyDi50jczACweEFPDlE/63bksbkxrFi6ZvDA+Ym2
         j3wxi6QRKlHrIjsNMFF2l41QKQDbNXwohYCQEXBJFuJagd5DP0vvlpheldo7lDu3TQjU
         lutZes51nFw36amBGFM2Gc2HE/HknAUImyvRXHV9Dq1T3uWnqG76xU9CdO6hwmYZ7q48
         u0bilHqGVhc7stv688zzu+ASd0t01d+jII1ubYlyGWstv7sY5hXWCc0De+ZsQ/p899eq
         hzVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=QzLwUka7MndmPbLBfBjtnVUWcO8y+yUapUjSVd2AkdE=;
        b=Mq1n2B+vxY0NUMJhMf1zo8J8DBzLW6KBhsJ7XHd8PAHhiFKKS5to0quweA0sz34uDu
         FXQh6GKbMWz1AJeN4MtpuOjFFZam3q2CEEXVAMfZQdQ5nCcM37v7NmKKDxImIVs26Cht
         TG21PWkjVAZqUY4JUAGyI5UNCJhd3aQke3sxu5AIPa5HAoQu7NgTI1ZxkD+uIw8LCdud
         2RCjnSqJRR8Zr0h96fygX/had6e/uIpYZ4Aa4+q75Lso58u0nSiVVn4r3KTJjEDMxVrt
         7xHpnVZg6jiCu/kVeVMnCImUshpGgAmnbuugWOtheM0zFFD7Yk6wl/e2qBVH33Cg7fQu
         /s8w==
X-Gm-Message-State: APjAAAXa/EawUQfCY2To4Cldi3Qu9edjM1QCkgkgYhZD9THnxJs1mFlt
        MzKp7c61JmGhW/EWxDJR8VMjbYJzCWN/9Q==
X-Google-Smtp-Source: APXvYqyn74gBgiBJgWNpy+8bHCGt4X+ud03+1T7HA8XDbjuxekyCFIxgsJyLh3BXntLiMcVMNJUiOXBKo5PpJg==
X-Received: by 2002:ad4:5149:: with SMTP id g9mr4868362qvq.115.1567765979457;
 Fri, 06 Sep 2019 03:32:59 -0700 (PDT)
Date:   Fri,  6 Sep 2019 11:32:30 +0100
In-Reply-To: <20190906103235.197072-1-maennich@google.com>
Message-Id: <20190906103235.197072-7-maennich@google.com>
Mime-Version: 1.0
References: <20180716122125.175792-1-maco@android.com> <20190906103235.197072-1-maennich@google.com>
X-Mailer: git-send-email 2.23.0.187.g17f5b7556c-goog
Subject: [PATCH v5 06/11] export: allow definition default namespaces in
 Makefiles or sources
From:   Matthias Maennich <maennich@google.com>
To:     linux-kernel@vger.kernel.org
Cc:     kernel-team@android.com, maennich@google.com, arnd@arndb.de,
        gregkh@linuxfoundation.org, jeyu@kernel.org,
        joel@joelfernandes.org, lucas.de.marchi@gmail.com,
        maco@android.com, sspatil@google.com, will@kernel.org,
        yamada.masahiro@socionext.com, linux-kbuild@vger.kernel.org,
        linux-modules@vger.kernel.org, linux-usb@vger.kernel.org,
        usb-storage@lists.one-eyed-alien.net
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

To avoid excessive usage of EXPORT_SYMBOL_NS(sym, MY_NAMESPACE), where
MY_NAMESPACE will always be the namespace we are exporting to, allow
exporting all definitions of EXPORT_SYMBOL() and friends by defining
DEFAULT_SYMBOL_NAMESPACE.

For example, to export all symbols defined in usb-common into the
namespace USB_COMMON, add a line like this to drivers/usb/common/Makefile:

  ccflags-y += -DDEFAULT_SYMBOL_NAMESPACE=USB_COMMON

That is equivalent to changing all EXPORT_SYMBOL(sym) definitions to
EXPORT_SYMBOL_NS(sym, USB_COMMON). Subsequently all symbol namespaces
functionality will apply.

Another way of making use of this feature is to define the namespace
within source or header files similar to how TRACE_SYSTEM defines are
used:
  #undef DEFAULT_SYMBOL_NAMESPACE
  #define DEFAULT_SYMBOL_NAMESPACE USB_COMMON

Please note that, as opposed to TRACE_SYSTEM, DEFAULT_SYMBOL_NAMESPACE
has to be defined before including include/linux/export.h.

If DEFAULT_SYMBOL_NAMESPACE is defined, a symbol can still be exported
to another namespace by using EXPORT_SYMBOL_NS() and friends with
explicitly specifying the namespace.

Suggested-by: Arnd Bergmann <arnd@arndb.de>
Reviewed-by: Martijn Coenen <maco@android.com>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Matthias Maennich <maennich@google.com>
---
 include/linux/export.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/linux/export.h b/include/linux/export.h
index d59461e71478..2c5468d8ea9a 100644
--- a/include/linux/export.h
+++ b/include/linux/export.h
@@ -166,6 +166,12 @@ struct kernel_symbol {
 #define __EXPORT_SYMBOL ___EXPORT_SYMBOL
 #endif
 
+#ifdef DEFAULT_SYMBOL_NAMESPACE
+#undef __EXPORT_SYMBOL
+#define __EXPORT_SYMBOL(sym, sec)				\
+	__EXPORT_SYMBOL_NS(sym, sec, DEFAULT_SYMBOL_NAMESPACE)
+#endif
+
 #define EXPORT_SYMBOL(sym) __EXPORT_SYMBOL(sym, "")
 #define EXPORT_SYMBOL_GPL(sym) __EXPORT_SYMBOL(sym, "_gpl")
 #define EXPORT_SYMBOL_GPL_FUTURE(sym) __EXPORT_SYMBOL(sym, "_gpl_future")
-- 
2.23.0.187.g17f5b7556c-goog

