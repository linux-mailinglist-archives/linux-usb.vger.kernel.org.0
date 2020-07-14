Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60D8921E65B
	for <lists+linux-usb@lfdr.de>; Tue, 14 Jul 2020 05:36:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726722AbgGNDgV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 13 Jul 2020 23:36:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726661AbgGNDgU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 13 Jul 2020 23:36:20 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A693C061794
        for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2020 20:36:20 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id u189so17105819ybg.17
        for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2020 20:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=0+nyRB4FjMX87DKB086K0BKyIubl+CqEw8r/lrjQmxQ=;
        b=Vpd863DWtRje1jzZiUqY+85x9YDp4OKtuawen/XxjhstnxKOa7+DKF8jeefo/rEiRg
         cJ57qzZjMfX/dwbrFBeJeN5UN17t4L7D/nwyKuCMNMcSIok2yLJLdK3zBpo404vdBcXL
         TR98Qx9PIM8D2zbFibUMHBTV/sAFcy7UXxWF62zWnLmxFVTtxCqKMChrp41V5WbCs3oX
         mbQwZKZ7b/LteXsP8WqdbjjldWR0uBke8c+ZnY9ccAXVH/d2HenbCWCgcW0m55Ifo1bh
         +oWfC1CVcqvxshVIfhR/zZ3XKORCM3CqNWJQt7sEkW1v60Xwu7eIXake3VQSvBZ/Sz7C
         eoCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=0+nyRB4FjMX87DKB086K0BKyIubl+CqEw8r/lrjQmxQ=;
        b=ARvkg/jaDaAaofbdkUuiEnumtAfdAJZaKav+Y5R7oUXCPGCUxa6XiAH0X1pWdzFLPP
         a38o6IdBgpcGnSunF9dtQx0bFRIeSULOhe8g3Zjq5lOtEyMUbpA2Zoee9Vrhw1aKaCYC
         Ovwh+vDcfJxs/dVjaXGvW359sOKSuHaMFB5W92mVDCK6trxeuNhgM2N9Z8SxkGNa9cg8
         0FbdEky7GCWTwIC+spxHdJhw6WppkOtbkIbQDFVjS08qT5fP1Ng5EHvr8EfjhtRwNA9b
         zTC7xjFudpL85GpHrPZctS85dnSZtVkAV4BLjtU6ii772hPFljhEbASDxGUFhlXvqEEv
         Pbxw==
X-Gm-Message-State: AOAM5332cOApV3LN+5aYe5FZHQMdxTLakAPhNeKo7LTRBm1Qt3bFiIHN
        XDuhBXdOGJOc8XoICkVSOYgZEARNEj5m
X-Google-Smtp-Source: ABdhPJypXU4xQMjv4OfZEmpngqqwsqY3SfhQH2rS2+ro4iTC+chO8wmNzvludTkKpsLR9hoBfW8VQBBqU8Ny
X-Received: by 2002:a25:d104:: with SMTP id i4mr5388671ybg.176.1594697779588;
 Mon, 13 Jul 2020 20:36:19 -0700 (PDT)
Date:   Tue, 14 Jul 2020 11:34:52 +0800
In-Reply-To: <20200714033453.4044482-1-kyletso@google.com>
Message-Id: <20200714033453.4044482-2-kyletso@google.com>
Mime-Version: 1.0
References: <20200714033453.4044482-1-kyletso@google.com>
X-Mailer: git-send-email 2.27.0.389.gc38d7665816-goog
Subject: [PATCH 1/2] usb: typec: Comment correction for typec_partner_register_altmode
From:   Kyle Tso <kyletso@google.com>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org
Cc:     badhri@google.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, Kyle Tso <kyletso@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

typec_register_altmode returns ERR_PTR on failure.

Signed-off-by: Kyle Tso <kyletso@google.com>
---
 drivers/usb/typec/class.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index c9234748537a..02655694f200 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -580,7 +580,7 @@ EXPORT_SYMBOL_GPL(typec_partner_set_identity);
  * SVID listed in response to Discover Modes command need to be listed in an
  * array in @desc.
  *
- * Returns handle to the alternate mode on success or NULL on failure.
+ * Returns handle to the alternate mode on success or ERR_PTR on failure.
  */
 struct typec_altmode *
 typec_partner_register_altmode(struct typec_partner *partner,
-- 
2.27.0.389.gc38d7665816-goog

