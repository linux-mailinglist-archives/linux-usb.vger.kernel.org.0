Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E36740F219
	for <lists+linux-usb@lfdr.de>; Fri, 17 Sep 2021 08:12:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245174AbhIQGNY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 17 Sep 2021 02:13:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245100AbhIQGMz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 17 Sep 2021 02:12:55 -0400
Received: from mail-qk1-x749.google.com (mail-qk1-x749.google.com [IPv6:2607:f8b0:4864:20::749])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5258FC061766
        for <linux-usb@vger.kernel.org>; Thu, 16 Sep 2021 23:11:33 -0700 (PDT)
Received: by mail-qk1-x749.google.com with SMTP id h7-20020a37b707000000b003fa4d25d9d0so62494050qkf.17
        for <linux-usb@vger.kernel.org>; Thu, 16 Sep 2021 23:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=09xEzYT+gOEMXKux86y0OboJKHhnFsj7tooXascaZws=;
        b=idTj1foInP1ZjiSa8tzyXsAbvISX9h8D2okHQm47jLNzxI/gnljnhVQYgRp7gVyxij
         CsbzwRxgqhnisizhrS+yfMH6UHQ4fCv6XeCSCXXwKBm8fIy/regcyzobSzoURswbI015
         EhQaKFRWM6aq6l5B15meILrewxbaU6yp3g2Nl/72UnbQCanMYa7JpZscbFct1T1qwgHw
         WQJVUe+4dvGKD1YQH+pOx77QCpeyZep2k1EX0iFtXgeHezV2k7OgPXfN3EKXyp8yiBcw
         v4zOLgOsvCuCahcjEDuwXB5WMCghprYxDyANJW8IiN3wz2UXia2L39Jl4z728eSWNBky
         tuvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=09xEzYT+gOEMXKux86y0OboJKHhnFsj7tooXascaZws=;
        b=3oDuw3NZe4sQ0l0dBRQCDm8HxJgrCaTujLTiHT2kY+n5TxOlWi5MjYMYYU2DmvEOSn
         44Jyu8qnhDN5ef3H7E6qNY/QGoiWCyk0/YiUhDLJuMUX2dWp/XgE+qpufPMKQiiXJ6UH
         EZG7pndtgTrn2AqjN7y353RfefCjU49TULfAHNOxqEL1BpRmAeUTWbkqAHGGsDa6fPWp
         S34dVWNbNjCQlgPCvFTofz0L0oiYOEBULGfWtY8DPXqk+Zdsc8HopnngpLB00fQjsg2I
         flV87oxDofhvRQNT4IWq1ljqSN3MvUMYwhF6xTSLtoQ6/pdv0nj4zOTlU13F79TYFJv9
         Tywg==
X-Gm-Message-State: AOAM533o0TAMmj15b7gGsOp76Mo6X8+9HkxDKwdKb0ghuoUV/d4mPTIc
        2rINsvsiV2j5MZsY3wBwrTvmLhQvEYZe4PXvNID4DA==
X-Google-Smtp-Source: ABdhPJypRsw47dQReFc9GVfIgcLEvPuWKVLfs9Zkoz23e3pfAoJ7NFelyWt9aLLvWQZohalclJUd3bgYSnBd8nu1IvZJKA==
X-Received: from mactruck.svl.corp.google.com ([2620:15c:2cb:201:4845:43ba:3ff5:2de1])
 (user=brendanhiggins job=sendgmr) by 2002:a25:d747:: with SMTP id
 o68mr11675107ybg.488.1631859092480; Thu, 16 Sep 2021 23:11:32 -0700 (PDT)
Date:   Thu, 16 Sep 2021 23:11:01 -0700
In-Reply-To: <20210917061104.2680133-1-brendanhiggins@google.com>
Message-Id: <20210917061104.2680133-4-brendanhiggins@google.com>
Mime-Version: 1.0
References: <20210917061104.2680133-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.33.0.464.g1972c5931b-goog
Subject: [PATCH v1 3/6] device property: build kunit tests without structleak plugin
From:   Brendan Higgins <brendanhiggins@google.com>
To:     shuah@kernel.org, davidgow@google.com, arnd@arndb.de,
        keescook@chromium.org, rafael@kernel.org, jic23@kernel.org,
        lars@metafoo.de, ulf.hansson@linaro.org, andreas.noever@gmail.com,
        michael.jamet@intel.com, mika.westerberg@linux.intel.com,
        YehezkelShB@gmail.com, masahiroy@kernel.org,
        michal.lkml@markovi.net, ndesaulniers@google.com
Cc:     linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
        linux-kernel@vger.kernel.org, torvalds@linux-foundation.org,
        gregkh@linuxfoundation.org, linux-iio@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-hardening@vger.kernel.org, linux-kbuild@vger.kernel.org,
        Brendan Higgins <brendanhiggins@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The structleak plugin causes the stack frame size to grow immensely when
used with KUnit:

../drivers/base/test/property-entry-test.c:492:1: warning: the frame size of 2832 bytes is larger than 2048 bytes [-Wframe-larger-than=]
../drivers/base/test/property-entry-test.c:322:1: warning: the frame size of 2080 bytes is larger than 2048 bytes [-Wframe-larger-than=]
../drivers/base/test/property-entry-test.c:250:1: warning: the frame size of 4976 bytes is larger than 2048 bytes [-Wframe-larger-than=]
../drivers/base/test/property-entry-test.c:115:1: warning: the frame size of 3280 bytes is larger than 2048 bytes [-Wframe-larger-than=]

Turn it off in this file.

Co-developed-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
---
 drivers/base/test/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/base/test/Makefile b/drivers/base/test/Makefile
index 64b2f3d744d51..7f76fee6f989d 100644
--- a/drivers/base/test/Makefile
+++ b/drivers/base/test/Makefile
@@ -2,4 +2,4 @@
 obj-$(CONFIG_TEST_ASYNC_DRIVER_PROBE)	+= test_async_driver_probe.o
 
 obj-$(CONFIG_DRIVER_PE_KUNIT_TEST) += property-entry-test.o
-CFLAGS_REMOVE_property-entry-test.o += -fplugin-arg-structleak_plugin-byref -fplugin-arg-structleak_plugin-byref-all
+CFLAGS_property-entry-test.o += $(DISABLE_STRUCTLEAK_PLUGIN)
-- 
2.33.0.464.g1972c5931b-goog

