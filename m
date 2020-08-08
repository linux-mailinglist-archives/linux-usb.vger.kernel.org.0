Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58E0B23F6B7
	for <lists+linux-usb@lfdr.de>; Sat,  8 Aug 2020 08:57:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726199AbgHHG5n (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 8 Aug 2020 02:57:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726048AbgHHG5m (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 8 Aug 2020 02:57:42 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB7D0C061756
        for <linux-usb@vger.kernel.org>; Fri,  7 Aug 2020 23:57:42 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id a79so2328603pfa.8
        for <linux-usb@vger.kernel.org>; Fri, 07 Aug 2020 23:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Uqo+y2RVmAl9mwXgsjTPkG12cVgaTvPGHT93WHkzpyM=;
        b=hPsbfH8i3zqvFfJnbwXNFJw35Fbg79ui57idQm7/FNANqfQ63UlJR9KRjOHFLJ8dLY
         wYqoIx1BvwHgz1IVi3sbOVw1EOqHerVJKfZNMOrsGwdivbvs4qNqZCRZkYgZY2lIUzCV
         oXjdKzyNNwinFzQ1mUqO5vbUL185Ds9PSMbQjbsnb01J4hvWY/mwrnZlhYHDj6UoAaJ/
         P+PcPGeRwr/vYkTPe/dgGMES+oOLrM8TH//HqF/RQP3VhgVK7yC22J2TJyH8IJnTmn19
         /LhNfjGpqDAs0985yWdosId9oT218MWmREWc+qLHYbaMKI50iMFnxxUW18FcJzvLTowl
         5Sng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Uqo+y2RVmAl9mwXgsjTPkG12cVgaTvPGHT93WHkzpyM=;
        b=oQNTMiEJ/SqbOmHXtQSn01KjN43V8khKWMs6vfZj+Nq/Tt6XYxEieMP92rfiuPoEDf
         c1XuMu7qtdKlWZIyAqpYTK6iOvCWZ9yN5rQOkaS40LVRFrxElsR64mJ53El0+dCFABgn
         lz6Y8EOLkCL8jWVQDgl1tTBvSqxSgplg8TOC5JyioL7puJyec4GzXOkvwiQ8NuY1pHlr
         8FYIN0MfrsN+Wn2f6ThzKH0loJx02JKrlAs5l4hsIKyuyipbj0x0utSzxcF9pqvGsYb7
         I9bpEIFQ9Mbl4XSYlg2+1v3NncGtS+VzwUQdwgSpyRROtuxDjeoLPXFtpnvzAgUaEJ8k
         29LQ==
X-Gm-Message-State: AOAM531SHgR/xR5crRpZJIMV4YPuw7x+WaIPA6Zo3lj3B3g1T+gmOgpV
        95h9/Ry61WluLrcSW+msQGC1G2sv/7FnOw==
X-Google-Smtp-Source: ABdhPJyrAKo0J32v5Dp2Xe54Oob1HDwdqqZOWzNtQ36crvZf8w1cAlh+x/EM+PT6kzeaKTHvr5M8/w==
X-Received: by 2002:a65:6384:: with SMTP id h4mr14412217pgv.196.1596869860514;
        Fri, 07 Aug 2020 23:57:40 -0700 (PDT)
Received: from lemmy.tees.ne.jp (153-125-65-70.catv.tees.ne.jp. [153.125.65.70])
        by smtp.googlemail.com with ESMTPSA id fv7sm30704504pjb.2.2020.08.07.23.57.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2020 23:57:40 -0700 (PDT)
From:   Yasushi Asano <yazzep@gmail.com>
To:     stern@rowland.harvard.edu, gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, erosca@de.adit-jv.com,
        andrew_gabbasov@mentor.com, jim_baxter@mentor.com,
        wnatsume@jp.adit-jv.com, nnishiguchi@jp.adit-jv.com,
        yasano@jp.adit-jv.com
Subject: [PATCH] [RFC] USB: hub.c: decrease the number of attempts of enumeration scheme
Date:   Sat,  8 Aug 2020 15:57:28 +0900
Message-Id: <20200808065728.3405-1-yazzep@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200806151016.GB197575@rowland.harvard.edu>
References: <20200806151016.GB197575@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Yasushi Asano <yasano@jp.adit-jv.com>

According to 6.7.22 A-UUT “Device No Response” for connection timeout
of USB OTG and EH automated compliance plan v1.2, the enumeration
failure has to be detected within 30 seconds. However, the old and new
enumeration schemes made a total of 16 attempts, and each attempt can
take 5 seconds to timeout, so it failed with PET test. Modify it to
reduce the number of attempts to 5 and pass PET test.

Signed-off-by: Yasushi Asano <yasano@jp.adit-jv.com>
---
 drivers/usb/core/hub.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 052d5ac..ebf6931 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -2707,9 +2707,9 @@ static unsigned hub_is_wusb(struct usb_hub *hub)
 
 #define PORT_RESET_TRIES	5
 #define SET_ADDRESS_TRIES	2
-#define GET_DESCRIPTOR_TRIES	2
-#define SET_CONFIG_TRIES	(2 * (use_both_schemes + 1))
-#define USE_NEW_SCHEME(i, scheme)	((i) / 2 == (int)(scheme))
+#define GET_DESCRIPTOR_TRIES	1
+#define SET_CONFIG_TRIES	(use_both_schemes + 1)
+#define USE_NEW_SCHEME(i, scheme)	((i) == (int)(scheme))
 
 #define HUB_ROOT_RESET_TIME	60	/* times are in msec */
 #define HUB_SHORT_RESET_TIME	10
-- 
2.7.4

