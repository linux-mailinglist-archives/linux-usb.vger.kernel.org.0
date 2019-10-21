Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2C7D6DEF55
	for <lists+linux-usb@lfdr.de>; Mon, 21 Oct 2019 16:21:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729268AbfJUOVR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 21 Oct 2019 10:21:17 -0400
Received: from mail-wr1-f73.google.com ([209.85.221.73]:35266 "EHLO
        mail-wr1-f73.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729094AbfJUOVR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 21 Oct 2019 10:21:17 -0400
Received: by mail-wr1-f73.google.com with SMTP id 7so7430344wrl.2
        for <linux-usb@vger.kernel.org>; Mon, 21 Oct 2019 07:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=on4/idiV9oaS/IR8jAQI0iaB3VMV3aTStZbS/UnOUko=;
        b=QzsodSJfTcR+ufqqv1YzNohzVZCaQ7UjuI6sf6P3JxkLy/VaKISnvfhqy/SV2K8Okg
         nXE/UkzqGS2/YiDOPKl1JFSPo/QWUEVJzmDfpzuMfmxNaqv2rCAp+crVEmFOnt5daDvQ
         k+rxVHnbCAaPLOoGc5SrR0Nb8ASM5vyqAsHV0eJWsRkHrZ5gh4zlcYlb6vZO86yFLIea
         UcorsSOze5s/hpxbrw0m/p/UzugFY1mn+SuMcSNTcLFOX+Phs0KYIqZzd2d3SZRU9Fzs
         UWOjREsxJ9lsVgNCnOfN/w/iXJgFgPyBvcKUH+yelrCCYUtIVGAwXRqAivnA5PWWPZoW
         Um4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=on4/idiV9oaS/IR8jAQI0iaB3VMV3aTStZbS/UnOUko=;
        b=RWsH7Sz5SWhgrjU2Qhz0J7xH0ANqZ4DDj0YfOTe4WF9UBimmYQFPKeWPd3dXUTLP02
         kWvulpqTDDYtfx60DFoWGdDX+ccSXgC/16Q8jVXRR4cPHOayEe5flK7S6V+r9WDPGbn6
         2elzzcWcLdaMANTyjZ4lC6CE6fgWxXXJUtxuRTnkahwFxdN/haoq3tru11vlfv0QzF3H
         xcPE46dAowKan8Wy/3i81wuqWbPXz5vdR6AVQ3lviUDgl+KMdpqiDEfG96q3U/XBy4ex
         0La/VkdS/RF+B2kZjsDabW8gojnjsKbFCtTCGoL8jYWMquOeuJCrUZujQiVmu8CnnK6s
         01Zw==
X-Gm-Message-State: APjAAAVzN6QgM234waFTtlDRpB4f4bG5aIdbs4yQdtAF6U8aEW5xZOOO
        7FKn1bszIx+i9Gxh2jwvmNc8zNNS/jXV5DoILWw/OJVfnFpql/C+3bKhpWlScTcfAPeXXUelgOc
        7lB/R+blPgkIBNBnt0R3JblkMSdNbJXOy108qPFlrMqAnvP7whBvblxwQ3luT7uXoso9rmnhmJ9
        CF
X-Google-Smtp-Source: APXvYqx8/1/VpRgkzTaXT7elbGdj8wMsh9ChrrFJHVEeMNfKAo3+ORHj0vkDBDkeawbudSZib3uXrRMAw0yDwmZX
X-Received: by 2002:adf:8289:: with SMTP id 9mr21260326wrc.0.1571667673653;
 Mon, 21 Oct 2019 07:21:13 -0700 (PDT)
Date:   Mon, 21 Oct 2019 16:20:58 +0200
In-Reply-To: <cover.1571667489.git.andreyknvl@google.com>
Message-Id: <665578f904484069bb6100fb20283b22a046ad9b.1571667489.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1571667489.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.23.0.866.gb869b98d4c-goog
Subject: [PATCH v2 1/2] USB: dummy-hcd: increase max number of devices to 32
From:   Andrey Konovalov <andreyknvl@google.com>
To:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        "Jacky . Cao @ sony . com" <Jacky.Cao@sony.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Alexander Potapenko <glider@google.com>,
        Marco Elver <elver@google.com>,
        Andrey Konovalov <andreyknvl@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

When fuzzing the USB subsystem with syzkaller, we currently use 8 testing
processes within one VM. To isolate testing processes from one another it
is desirable to assign a dedicated USB bus to each of those, which means
we need at least 8 Dummy UDC/HCD devices.

This patch increases the maximum number of Dummy UDC/HCD devices to 32
(more than 8 in case we need more of them in the future).

Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
---
 drivers/usb/gadget/udc/dummy_hcd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/dummy_hcd.c b/drivers/usb/gadget/udc/dummy_hcd.c
index 3d499d93c083..a8f1e5707c14 100644
--- a/drivers/usb/gadget/udc/dummy_hcd.c
+++ b/drivers/usb/gadget/udc/dummy_hcd.c
@@ -2725,7 +2725,7 @@ static struct platform_driver dummy_hcd_driver = {
 };
 
 /*-------------------------------------------------------------------------*/
-#define MAX_NUM_UDC	2
+#define MAX_NUM_UDC	32
 static struct platform_device *the_udc_pdev[MAX_NUM_UDC];
 static struct platform_device *the_hcd_pdev[MAX_NUM_UDC];
 
-- 
2.23.0.866.gb869b98d4c-goog

