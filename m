Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DE5F34A9ED
	for <lists+linux-usb@lfdr.de>; Fri, 26 Mar 2021 15:37:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230327AbhCZOfr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 26 Mar 2021 10:35:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230231AbhCZOfO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 26 Mar 2021 10:35:14 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6396AC0613B1
        for <linux-usb@vger.kernel.org>; Fri, 26 Mar 2021 07:35:11 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id j7so5895772wrd.1
        for <linux-usb@vger.kernel.org>; Fri, 26 Mar 2021 07:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=E7/N3FVykAR22YhzUhZ15csg3vPH/3PyPAZDl2mJTyE=;
        b=FQWiQy0EIE+653fmzj9XU1SF5NMeZNCgs/VV4mo5PT9LyRG571UmXuJauUJ0aL1lsQ
         31HG7A3ja6wq0s6hA1qzpq9p/RAo62r0dAKvoUHFRvBJyr4R4GZ46OnKPqEbtmWzAcKa
         634knbEo7HgrGK+FcjSGYELCBL1XnOzC+eiEoCU/gWLWFRISxi7wr6FrfE8yCPZPJaQu
         pSvz3r5gB73TV5rLg+heSe/IcHsdsj8ItZktZAI5J5mW3RX0vDxiVu+22B34cQIJfrk9
         odZrgDQ8EtlwoHtFND6OdBiltcah311hZtwgV1F3y0Z2qFULwLJAOvY5jUAnZ35QhkWs
         zbfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=E7/N3FVykAR22YhzUhZ15csg3vPH/3PyPAZDl2mJTyE=;
        b=arh+MPACTj28XuS/JFmn7fOINCbAd9kQ6nfowgqr/m2KsXtjVfL51xAHRGXLQcji6L
         LtgxMn9YDYvYLmgscHwmKj/v3iktp6Dg+aIVe2p0i56y4ML4Gk1jHktfEVZL7CAGHexa
         vxQDzMhhHViZHCplUP4ynLzS8dGaDQylFTavAVQWONneXgyIJQlxZA1DKEMdZCN+VR4T
         pCZ604f3q72pvB0zE08Kk6e78FVY3SKfLQ/UGVs349ef++uMOutFxVOzD3jX6tKtBJI6
         Wya0pwM3H7iaKcpQV1EgNWYOCwQTgRI7HyAKCNUwcCibMRvxJ/Ws5VaddtI6wpH4WK1+
         VStQ==
X-Gm-Message-State: AOAM531n1TuvUtz8NPzjJLNX7ZBWnmTHJJwLhWOCrBmVZ8cHMNeNuINe
        nqzkDfHM8BYjVtYIPzayKRdakw==
X-Google-Smtp-Source: ABdhPJxFiTlqN3F0RkSV5mVncLvGDUsps6SqQ0/eWlY0L1Lcp/6xy75ULVxXD1xv8pgKWF11ZcnP9g==
X-Received: by 2002:a5d:6307:: with SMTP id i7mr15081102wru.305.1616769310126;
        Fri, 26 Mar 2021 07:35:10 -0700 (PDT)
Received: from dell.default ([91.110.221.194])
        by smtp.gmail.com with ESMTPSA id j26sm12878225wrh.57.2021.03.26.07.35.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Mar 2021 07:35:09 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Anssi Hannula <anssi.hannula@gmail.com>,
        linux-usb@vger.kernel.org, linux-input@vger.kernel.org
Subject: [PATCH 08/25] HID: usbhid: hid-pidff: Demote a couple kernel-doc abuses
Date:   Fri, 26 Mar 2021 14:34:41 +0000
Message-Id: <20210326143458.508959-10-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210326143458.508959-1-lee.jones@linaro.org>
References: <20210326143458.508959-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/hid/usbhid/hid-pidff.c:512: warning: Function parameter or member 'dev' not described in 'pidff_playback'
 drivers/hid/usbhid/hid-pidff.c:512: warning: Function parameter or member 'effect_id' not described in 'pidff_playback'
 drivers/hid/usbhid/hid-pidff.c:512: warning: Function parameter or member 'value' not described in 'pidff_playback'
 drivers/hid/usbhid/hid-pidff.c:512: warning: expecting prototype for value times(). Prototype was for pidff_playback() instead
 drivers/hid/usbhid/hid-pidff.c:1005: warning: Function parameter or member 'pidff' not described in 'pidff_find_effects'
 drivers/hid/usbhid/hid-pidff.c:1005: warning: Function parameter or member 'dev' not described in 'pidff_find_effects'
 drivers/hid/usbhid/hid-pidff.c:1005: warning: expecting prototype for Find the implemented effect types(). Prototype was for pidff_find_effects() instead

Cc: Jiri Kosina <jikos@kernel.org>
Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: Anssi Hannula <anssi.hannula@gmail.com>
Cc: linux-usb@vger.kernel.org
Cc: linux-input@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/hid/usbhid/hid-pidff.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index fddac7c72f645..ea126c50acc3b 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -505,7 +505,7 @@ static void pidff_playback_pid(struct pidff_device *pidff, int pid_id, int n)
 			HID_REQ_SET_REPORT);
 }
 
-/**
+/*
  * Play the effect with effect id @effect_id for @value times
  */
 static int pidff_playback(struct input_dev *dev, int effect_id, int value)
@@ -997,7 +997,7 @@ static int pidff_find_special_fields(struct pidff_device *pidff)
 	return 0;
 }
 
-/**
+/*
  * Find the implemented effect types
  */
 static int pidff_find_effects(struct pidff_device *pidff,
-- 
2.27.0

