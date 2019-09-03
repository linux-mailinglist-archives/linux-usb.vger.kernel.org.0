Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 378FAA6C77
	for <lists+linux-usb@lfdr.de>; Tue,  3 Sep 2019 17:09:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729862AbfICPHm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 3 Sep 2019 11:07:42 -0400
Received: from mail-yw1-f74.google.com ([209.85.161.74]:40295 "EHLO
        mail-yw1-f74.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729852AbfICPHm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 3 Sep 2019 11:07:42 -0400
Received: by mail-yw1-f74.google.com with SMTP id k63so13590105ywg.7
        for <linux-usb@vger.kernel.org>; Tue, 03 Sep 2019 08:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=QzLwUka7MndmPbLBfBjtnVUWcO8y+yUapUjSVd2AkdE=;
        b=PB5Ah+kYC1m4B/Vqzh02d5Dma2M2yVL7Bdqf/cgU5C5/QHZXWWxWusz5yxJTxv/UaW
         cPQ+if9lMxNZfGZL8S6lAAv/KZXOdRW/TgOTyyk2SxYWVb84rGwfPhHTdzrwyml3fyYR
         zMB9ShCEW07O4VXQZsewgm0bwovFzEdsUHPpP51HT13xk3Eva1qhEajcX6jZ8XP0Sq9l
         WK3aEEJXUIn/x+ktaxUYG8u++q7nTs10fbIeFJFJgHQ61R003giZa7EC3s1heJ+v3BkU
         DhFAq5i9QktVcROUV7GZTvihIhoDpLPBW6QkwLuwo8b24v/88OsKzS4oZLrp9/OjXMdl
         ZYLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=QzLwUka7MndmPbLBfBjtnVUWcO8y+yUapUjSVd2AkdE=;
        b=Jx86y7BbMJmPjriXGprXSYV04/C7KwMAAoPztFX+o934BfGbdEehZ2z8toYk2O/QWM
         +11UFG0au2kC6HcaxRyTckz2Re2EWsFvzTa6wFRTccQQwG/Rq6JHfxH815fbG11Yi2/v
         hX1fPpaqcTDTyMc5LWfoTrBZ6YG9pLiufghM0bu44/S3Waj3JUQ6J/Fh2CJiuh2JbFUa
         5vRZmkE2qUsSZAukce5p7AroaRPQFC5ehn80sejHO2FV5y90EF0XaIQMGWe2shsxtr77
         xkuz2J7auN+3uKygibE0Adtf42gN90YduEFxhlA9SpLp5m+L8wale191rRfsLQZZP+pd
         D42A==
X-Gm-Message-State: APjAAAVZoinRISIzK4Aj6/EiGRWp8CtUSR4rII68nCu9lWJmi6KUWAd7
        cKqji5R39OITCUpkWGjWJUdAmzTi+SyVZw==
X-Google-Smtp-Source: APXvYqwwwghshBlXbu3SzPrPSRDK2LVE5Xdl4WcySrrwEMVrzGCbbqWqp4Yfsy68npcFDyQxAHFyHkK5McSccQ==
X-Received: by 2002:a81:9ac2:: with SMTP id r185mr25908588ywg.210.1567523261200;
 Tue, 03 Sep 2019 08:07:41 -0700 (PDT)
Date:   Tue,  3 Sep 2019 16:06:32 +0100
In-Reply-To: <20190903150638.242049-1-maennich@google.com>
Message-Id: <20190903150638.242049-7-maennich@google.com>
Mime-Version: 1.0
References: <20180716122125.175792-1-maco@android.com> <20190903150638.242049-1-maennich@google.com>
X-Mailer: git-send-email 2.23.0.187.g17f5b7556c-goog
Subject: [PATCH v4 06/12] export: allow definition default namespaces in
 Makefiles or sources
From:   Matthias Maennich <maennich@google.com>
To:     linux-kernel@vger.kernel.org
Cc:     kernel-team@android.com, maennich@google.com, arnd@arndb.de,
        gregkh@linuxfoundation.org, jeyu@kernel.org,
        joel@joelfernandes.org, lucas.de.marchi@gmail.com,
        maco@android.com, sspatil@google.com, will@kernel.org,
        yamada.masahiro@socionext.com, linux-kbuild@vger.kernel.org,
        linux-modules@vger.kernel.org, linux-usb@vger.kernel.org,
        usb-storage@lists.one-eyed-alien.net,
        linux-watchdog@vger.kernel.org
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

