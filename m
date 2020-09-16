Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F8FF26CB2B
	for <lists+linux-usb@lfdr.de>; Wed, 16 Sep 2020 22:23:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727725AbgIPUXT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 16 Sep 2020 16:23:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727105AbgIPR2l (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 16 Sep 2020 13:28:41 -0400
Received: from mail-qk1-x74a.google.com (mail-qk1-x74a.google.com [IPv6:2607:f8b0:4864:20::74a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7F63C061223
        for <linux-usb@vger.kernel.org>; Wed, 16 Sep 2020 10:18:37 -0700 (PDT)
Received: by mail-qk1-x74a.google.com with SMTP id y17so6644360qkf.15
        for <linux-usb@vger.kernel.org>; Wed, 16 Sep 2020 10:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:message-id:mime-version:subject:from:to:cc;
        bh=Y0CPyJBwGQKF4TQ8zu0H48gbO6NYy9xi7Y4e0tcM1aw=;
        b=AKcdiPC8efayCQdDN10LvIwxIxN45JmyKaoTeC1THHFKEOIMQ0ITfoGNlFPyYhVETY
         H1fJm0YJ4NkBeEQ5g9uN4zPH4mO4tQ3qQd4AGqFpK/os0xUBQDVFNwOyvjh5VsB6kHOL
         MFtH55xPMLaZ9nBpF4QO3bOoi0Mxhd4B8+kWEfqMKPo/yEbIxCbk4RTn1LWhrKNhJJPq
         BJVBMvbUFzDf8dL+b4dzYOIepi6BTrjdvqe14vnOXWopFyqNa/Rz+LEBAu/+c1HlWqH2
         MdPs0Lf12rnEGwXFQtyiN6QDhLsEmGO4EhI9Eud57PhAR2Dwq8UvNtoId9Y7MbpJi7xC
         x9bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
         :to:cc;
        bh=Y0CPyJBwGQKF4TQ8zu0H48gbO6NYy9xi7Y4e0tcM1aw=;
        b=Sz6HumFQJLmU/qtl038dLau7quQ6Ku9FZCbhP2JyxRMrbLJukzZJb+gd4GlgNEj8wH
         NJCxtRTdJFcRWUXB91nSZJwaIibjGDVkWc0YjG91pYsT49lCPUc17AS7zn6b8XIHiNPI
         5rh31hxhN1fhz+FlySURb1rnUHiSY2sBAWGQsOTJT2nqZRMAqB6eJrfvzP9RuGhV6xkO
         LuQirNp5zA7eJxKd+dfBDyboBml3BvbRcxzux9sO1JBm8zWCpug3cGvx7O+d07HM4blH
         p/RH9OiKKYsNaAYjup4vhw1sVTNnNBC+NjXOJewG+dQ9BFesYmhpqEXBxFk4gxvUxGCs
         j8Pw==
X-Gm-Message-State: AOAM533BwKguRrqmcDq0ZO3K/IL3gSU2O7ld5gh5sUhXqasCLl4qbeC3
        ksrdkOU/PNUwJaZsohLd/6mmYD2cSpoh
X-Google-Smtp-Source: ABdhPJznneI9TAMGyd2aPyjb7DmSc4PR6Y++OBX/SaiCh7j1ELLhBHs25xVeDzbpuY3fAJOT29JQgmtByDnZ
X-Received: from luke.lon.corp.google.com ([2a00:79e0:d:110:f693:9fff:fef4:a7ef])
 (user=qperret job=sendgmr) by 2002:ad4:57a7:: with SMTP id
 g7mr24575105qvx.10.1600276714810; Wed, 16 Sep 2020 10:18:34 -0700 (PDT)
Date:   Wed, 16 Sep 2020 18:18:25 +0100
Message-Id: <20200916171825.3228122-1-qperret@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.28.0.618.gf4bc123cb7-goog
Subject: [PATCH] ehci-hcd: Move include to keep CRC stable
From:   Quentin Perret <qperret@google.com>
To:     stern@rowland.harvard.edu, gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        gprocida@google.com, maennich@google.com, kernel-team@android.com,
        Quentin Perret <qperret@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The CRC calculation done by genksyms is triggered when the parser hits
EXPORT_SYMBOL*() macros. At this point, genksyms recursively expands the
types of the function parameters, and uses that as the input for the CRC
calculation. In the case of forward-declared structs, the type expands
to 'UNKNOWN'. Following this, it appears that the result of the
expansion of each type is cached somewhere, and seems to be re-used
when/if the same type is seen again for another exported symbol in the
same C file.

Unfortunately, this can cause CRC 'stability' issues when a struct
definition becomes visible in the middle of a C file. For example, let's
assume code with the following pattern:

    struct foo;

    int bar(struct foo *arg)
    {
	/* Do work ... */
    }
    EXPORT_SYMBOL_GPL(bar);

    /* This contains struct foo's definition */
    #include "foo.h"

    int baz(struct foo *arg)
    {
	/* Do more work ... */
    }
    EXPORT_SYMBOL_GPL(baz);

Here, baz's CRC will be computed using the expansion of struct foo that
was cached after bar's CRC calculation ('UNKOWN' here). But if
EXPORT_SYMBOL_GPL(bar) is removed from the file (because of e.g. symbol
trimming using CONFIG_TRIM_UNUSED_KSYMS), struct foo will be expanded
late, during baz's CRC calculation, which now has visibility over the
full struct definition, hence resulting in a different CRC for baz.

The proper fix for this certainly is in genksyms, but that will take me
some time to get right. In the meantime, we have seen one occurrence of
this in the ehci-hcd code which hits this problem because of the way it
includes C files halfway through the code together with an unlucky mix
of symbol trimming.

In order to workaround this, move the include done in ehci-hub.c early
in ehci-hcd.c, hence making sure the struct definitions are visible to
the entire file. This improves CRC stability of the ehci-hcd exports
even when symbol trimming is enabled.

Signed-off-by: Quentin Perret <qperret@google.com>
---
 drivers/usb/host/ehci-hcd.c | 1 +
 drivers/usb/host/ehci-hub.c | 1 -
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/ehci-hcd.c b/drivers/usb/host/ehci-hcd.c
index 6257be4110ca..3575b7201881 100644
--- a/drivers/usb/host/ehci-hcd.c
+++ b/drivers/usb/host/ehci-hcd.c
@@ -22,6 +22,7 @@
 #include <linux/interrupt.h>
 #include <linux/usb.h>
 #include <linux/usb/hcd.h>
+#include <linux/usb/otg.h>
 #include <linux/moduleparam.h>
 #include <linux/dma-mapping.h>
 #include <linux/debugfs.h>
diff --git a/drivers/usb/host/ehci-hub.c b/drivers/usb/host/ehci-hub.c
index ce0eaf7d7c12..087402aec5cb 100644
--- a/drivers/usb/host/ehci-hub.c
+++ b/drivers/usb/host/ehci-hub.c
@@ -14,7 +14,6 @@
  */
 
 /*-------------------------------------------------------------------------*/
-#include <linux/usb/otg.h>
 
 #define	PORT_WAKE_BITS	(PORT_WKOC_E|PORT_WKDISC_E|PORT_WKCONN_E)
 
-- 
2.28.0.618.gf4bc123cb7-goog

