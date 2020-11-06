Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23C082A8C1B
	for <lists+linux-usb@lfdr.de>; Fri,  6 Nov 2020 02:29:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732917AbgKFB3d (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 5 Nov 2020 20:29:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730895AbgKFB3d (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 5 Nov 2020 20:29:33 -0500
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9007DC0613CF
        for <linux-usb@vger.kernel.org>; Thu,  5 Nov 2020 17:29:31 -0800 (PST)
Received: by mail-pf1-x442.google.com with SMTP id g7so2535306pfc.2
        for <linux-usb@vger.kernel.org>; Thu, 05 Nov 2020 17:29:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=P6A1qUZApyMU5jCUBIX+1v23CvXu4Fk7lhZ+dP9+1nY=;
        b=HlVd6Md1B6Nxt142H/Mjr6vuBpA7K9sKazRuc6mY13J1oEc3t9aO64ZTjgbVyTCXga
         F8NaBXhsbhATbb7V2YAG8jAtBr8wog7mB79et3EiT05i+6K4RWkxoLJYwSvRTYNnPVk1
         5Z6poomOhL0DBJBv47VgHxrNcfnvKH/zC5aTI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=P6A1qUZApyMU5jCUBIX+1v23CvXu4Fk7lhZ+dP9+1nY=;
        b=l3E6TzHXNDR+IkUiYOeOTlaqKJKZuq33i9nO4/vvrZhQ5OQtngxXrwGqxjAkkezdd/
         jQNQmqmdJkcg1KSFvnWaikl4mnrdaRVnVXMVLhlDUhf0nxPKMPLi+P5M4577Mm+bcmXA
         NN3jCKP9G7DqT2M/cLR4KH9b4vLJYKq+YO8l5JvNknzaypqunrvAkZunWYWmpmFyePOs
         zar1epwrjSw6tg9kw7eRxgwrnkKufVR4pWLoqJ3ZeMYpE89O0ofKydTqwKcoj7AMBAhL
         /MszFf7Hv98FJHTPvGAHUZY3NIwk0814QKvJO6JyGbjNEWPi6F06Juak/IyPVCl9jQ1v
         59MA==
X-Gm-Message-State: AOAM5303h3RZOOr1dTtqIk8G38mbzr9NU4CBF2TyEsbdqCcV1q2uqfl6
        BOd7hK7TuebbDqV52EJauXR4bA==
X-Google-Smtp-Source: ABdhPJzteC0hNpMz4X1xVSEOVUrOYOYH3/0JsclrNu/lDxMWF3+4lJ18GzOHfXb2zG/9G213w99Vgg==
X-Received: by 2002:a17:90a:8b01:: with SMTP id y1mr4724538pjn.83.1604626171158;
        Thu, 05 Nov 2020 17:29:31 -0800 (PST)
Received: from pmalani2.mtv.corp.google.com ([2620:15c:202:201:a28c:fdff:fef0:49dd])
        by smtp.gmail.com with ESMTPSA id e2sm3567887pgd.27.2020.11.05.17.29.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2020 17:29:30 -0800 (PST)
From:   Prashant Malani <pmalani@chromium.org>
To:     linux-kernel@vger.kernel.org
Cc:     heikki.krogerus@linux.intel.com, dzigterman@chromium.org,
        alevkoy@chromium.org, Prashant Malani <pmalani@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org (open list:USB SUBSYSTEM)
Subject: [PATCH 5/6] usb: pd: Add captive Type C cable type
Date:   Thu,  5 Nov 2020 17:28:01 -0800
Message-Id: <20201106012758.525472-6-pmalani@chromium.org>
X-Mailer: git-send-email 2.29.1.341.ge80a0c044ae-goog
In-Reply-To: <20201106012758.525472-1-pmalani@chromium.org>
References: <20201106012758.525472-1-pmalani@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The USB Power Delivery Specification R3.0 adds a captive cable type
to the "USB Type-C plug to USB Type-C/Captive" field (Bits 19-18,
Passive/Active Cable VDO, Table 6-38 & 6-39).

Add the corresponding definition to the Cable VDO header. Also add a
helper macro to get the Type C cable connector type, when provided
the cable VDO.

Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Prashant Malani <pmalani@chromium.org>
---
 include/linux/usb/pd_vdo.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/linux/usb/pd_vdo.h b/include/linux/usb/pd_vdo.h
index 68bdc4e2f5a9..8c5cb5830754 100644
--- a/include/linux/usb/pd_vdo.h
+++ b/include/linux/usb/pd_vdo.h
@@ -177,7 +177,7 @@
  * <31:28> :: Cable HW version
  * <27:24> :: Cable FW version
  * <23:20> :: Reserved, Shall be set to zero
- * <19:18> :: type-C to Type-A/B/C (00b == A, 01 == B, 10 == C)
+ * <19:18> :: type-C to Type-A/B/C/Captive (00b == A, 01 == B, 10 == C, 11 == Captive)
  * <17>    :: Type-C to Plug/Receptacle (0b == plug, 1b == receptacle)
  * <16:13> :: cable latency (0001 == <10ns(~1m length))
  * <12:11> :: cable termination type (11b == both ends active VCONN req)
@@ -193,6 +193,7 @@
 #define CABLE_ATYPE		0
 #define CABLE_BTYPE		1
 #define CABLE_CTYPE		2
+#define CABLE_CAPTIVE		3
 #define CABLE_PLUG		0
 #define CABLE_RECEPTACLE	1
 #define CABLE_CURR_1A5		0
@@ -208,6 +209,7 @@
 	 | (tx1d) << 10 | (tx2d) << 9 | (rx1d) << 8 | (rx2d) << 7	\
 	 | ((cur) & 0x3) << 5 | (vps) << 4 | (sopp) << 3		\
 	 | ((usbss) & 0x7))
+#define VDO_TYPEC_CABLE_TYPE(vdo)	(((vdo) >> 18) & 0x3)
 
 /*
  * AMA VDO
-- 
2.29.1.341.ge80a0c044ae-goog

