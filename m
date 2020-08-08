Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5F0823F6AE
	for <lists+linux-usb@lfdr.de>; Sat,  8 Aug 2020 08:40:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726120AbgHHGk0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 8 Aug 2020 02:40:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725786AbgHHGkZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 8 Aug 2020 02:40:25 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AF64C061756
        for <linux-usb@vger.kernel.org>; Fri,  7 Aug 2020 23:40:25 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id u10so2243425plr.7
        for <linux-usb@vger.kernel.org>; Fri, 07 Aug 2020 23:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Uqo+y2RVmAl9mwXgsjTPkG12cVgaTvPGHT93WHkzpyM=;
        b=aC1uPMqsVLhsH4kmY3X37Y/wEuJfNn9HRBUOfcAQA08QLG6dJhmEvbTJJO7zjBqzHi
         lVneCIYVtfIdGhN/8TZgl9znRMhAvwrZbeAFqUql3jT1LtvXRX84ETmc1HEGDzFhrHgP
         TKZea/pGvXdHlPws4Iqxf5E1u+ETP+1Yo4NzsKZdapRQQ58wq+gcdf/j9VCPT5ucvsFE
         sBpyjN0Da+jI3i9cq4RNVpX9QHF4JA8PoQa8yGLOpZdCjPx/VUvVWin8kwjGSmnpDa0n
         3RvLJvh/F6qH7P3Kg/pPahnurD4ICa+cij8SlYXH/0Icw9b+R8aWcHwaufdJH2VFvxcl
         FasQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Uqo+y2RVmAl9mwXgsjTPkG12cVgaTvPGHT93WHkzpyM=;
        b=ZXmvM3OUbd0cMNG1ZcaGlsUWjlNTYuVd76PbomOIvHgdQ6MF+H0V8JsrktS5FE1xTK
         EEVmUwQ201mzFjPJsnlT+/E0hmNcKgYjQ0CU5+k67+zucQXgzrRyYfEkt1E5VU/vLTwl
         9NmJDwHRlhHOCUW8gagyRytHrDB5irOhNJbXryxsGDH0XD57jhONNgMZ+70f9RO9l1ns
         hx3G+KIy9gEwptuhIkAj3q1pCXELtDVkScnsRgeqsrnlcoUCOFEIzLH3LL5qUBSJIA7e
         m7xoL8XThncGhkALXrpmYHOTg4+fWoYgU0ah22eH3oZRnVbIsm4Id3u0Hm0OiXs4g+G9
         9uBg==
X-Gm-Message-State: AOAM530F9C+eG+1cghOZRIHCKsPYQ7KBCOCIN+9+kQN/De7l8I6ItIpN
        gAa0nvaRyRmZtyL0ZfMZlnpSPAhuh5ThFg==
X-Google-Smtp-Source: ABdhPJwshS4B8G92W6bwwZ6SuY1p1ryeCe7A/+Col1r3qyuW6+U1IMtTn8x37hr8mzeB680dhn2Oug==
X-Received: by 2002:a17:90a:77ca:: with SMTP id e10mr15932090pjs.150.1596868824028;
        Fri, 07 Aug 2020 23:40:24 -0700 (PDT)
Received: from lemmy.tees.ne.jp (153-125-65-70.catv.tees.ne.jp. [153.125.65.70])
        by smtp.googlemail.com with ESMTPSA id a24sm14853790pfg.113.2020.08.07.23.40.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2020 23:40:23 -0700 (PDT)
From:   Yasushi Asano <yazzep@gmail.com>
To:     stern@rowland.harvard.edu, gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, erosca@de.adit-jv.com,
        andrew_gabbasov@mentor.com, jim_baxter@mentor.com,
        wnatsume@jp.adit-jv.com, nnishiguchi@jp.adit-jv.com,
        yasano@jp.adit-jv.com
Subject: [PATCH] [RFC] USB: hub.c: decrease the number of attempts of enumeration scheme
Date:   Sat,  8 Aug 2020 15:40:14 +0900
Message-Id: <20200808064014.3199-1-yazzep@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <CAEt1RjrQsb6=reKUKV9uJTG4JoJXErhJFj=2TdVx=N1_Ad1GVg@mail.gmail.com>
References: <CAEt1RjrQsb6=reKUKV9uJTG4JoJXErhJFj=2TdVx=N1_Ad1GVg@mail.gmail.com>
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

