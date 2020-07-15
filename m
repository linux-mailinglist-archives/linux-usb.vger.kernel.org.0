Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C9382208D6
	for <lists+linux-usb@lfdr.de>; Wed, 15 Jul 2020 11:32:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730846AbgGOJck (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Jul 2020 05:32:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730793AbgGOJcV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Jul 2020 05:32:21 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 782F4C08C5C1
        for <linux-usb@vger.kernel.org>; Wed, 15 Jul 2020 02:32:21 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id q5so1681881wru.6
        for <linux-usb@vger.kernel.org>; Wed, 15 Jul 2020 02:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zIfwG4edfdZ0SvbrErNnoWeJSNFEawblVl9W1BGUl0c=;
        b=KDslEjnSQHAZDr3xp/DTWD275dXtqmIN+QWWeOPMn7d1pvYUjXDgd/tn/Bo5+lb9yw
         z2nomIjXCeRFimM3mGejfzSOIwkWxmxiINGCOb1l2Ouy54iLn9K+/YHASyZvHeauBB1l
         bxBgDn20+U53HF1nj2yuN8qjv3x+8sMpOjckq0v6LIiVqLy9G4+zui/A6JDuz/deobic
         ZRc0d2gzwL3i9evsEsgsgsOmDbXib9e8TVdfEWct5zZFqwmoU2Ycek3TFsTn/9iiebCp
         IAcudveq7zVF8eMOOg87/bSKwDQJIT9bmboQgQg8RHAdmsWS10wHat5RKdVRt+1VB1ba
         GQIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zIfwG4edfdZ0SvbrErNnoWeJSNFEawblVl9W1BGUl0c=;
        b=n7n4VKkb8WQdRfAfoNnh5R2VooAKvvHTJj21vSnWmzqGvhp/+dRq0XIpr6wkMfBeky
         plc6tAiNtf8Nngll6E5LH7ZwQjHXSTdekmIAXH99w33S4NPVgc5WbaAVB5X0UiEXjxGq
         8noywdzgoTy5pTfe1wHQXCgTYWzRHizgRjVwBXN6hrg685LW+EmWlRwbQTrBkhAJ2rD3
         n3joJgAlgtS6iNxcVq3NboZoIDhSYiHh37l3X8D2sqjILY11swkgFcmMpGju30aB0ezE
         q1RD+SwbkJ2JdKd3n5UTe8zePWF9x4gKUWzrg+OLtRG04cXSUvMsJbGQwPz3CwNlDreP
         wgug==
X-Gm-Message-State: AOAM533GNTd8aOPod74y1yAp/izBE0Yu2iZeQeJtzQlM4YsAsVE0Znhx
        3OKItEZUVuNjW7UOzg9gTD8uzQ==
X-Google-Smtp-Source: ABdhPJzy9C1OIc07ZZJ+baBn+wPtrRgMaFIbwmLZzlKqBbVdIza75yrsP5fHxF0BGHIinI+EcMHu3w==
X-Received: by 2002:adf:f104:: with SMTP id r4mr10755413wro.90.1594805540164;
        Wed, 15 Jul 2020 02:32:20 -0700 (PDT)
Received: from localhost.localdomain ([2.31.163.61])
        by smtp.gmail.com with ESMTPSA id s203sm2686991wms.32.2020.07.15.02.32.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2020 02:32:19 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
        Peter Korsgaard <jacmet@sunsite.dk>,
        Oliver Neukum <oneukum@suse.com>
Subject: [PATCH v2 6/8] usb: c67x00: c67x00-hcd: Demote obvious misuse of kerneldoc to standard comment blocks
Date:   Wed, 15 Jul 2020 10:32:07 +0100
Message-Id: <20200715093209.3165641-7-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200715093209.3165641-1-lee.jones@linaro.org>
References: <20200715093209.3165641-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

No attempt has been made to document any of the functions here.

Fixes the following W=1 kernel build warning(s):

 drivers/usb/c67x00/c67x00-hcd.c:237: warning: Function parameter or member 'sie' not described in 'c67x00_hcd_irq'
 drivers/usb/c67x00/c67x00-hcd.c:237: warning: Function parameter or member 'int_status' not described in 'c67x00_hcd_irq'
 drivers/usb/c67x00/c67x00-hcd.c:237: warning: Function parameter or member 'msg' not described in 'c67x00_hcd_irq'
 drivers/usb/c67x00/c67x00-hcd.c:267: warning: Function parameter or member 'hcd' not described in 'c67x00_hcd_start'
 drivers/usb/c67x00/c67x00-hcd.c:279: warning: Function parameter or member 'hcd' not described in 'c67x00_hcd_stop'

Cc: Peter Korsgaard <jacmet@sunsite.dk>
Cc: Oliver Neukum <oneukum@suse.com>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
Changelog

v2: Removed accidental addition of unrelated change

 drivers/usb/c67x00/c67x00-hcd.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/c67x00/c67x00-hcd.c b/drivers/usb/c67x00/c67x00-hcd.c
index c39eee17c0e46..39f2376663314 100644
--- a/drivers/usb/c67x00/c67x00-hcd.c
+++ b/drivers/usb/c67x00/c67x00-hcd.c
@@ -228,7 +228,7 @@ static int c67x00_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
  * Main part of host controller driver
  */
 
-/**
+/*
  * c67x00_hcd_irq
  *
  * This function is called from the interrupt handler in c67x00-drv.c
@@ -260,7 +260,7 @@ static void c67x00_hcd_irq(struct c67x00_sie *sie, u16 int_status, u16 msg)
 	}
 }
 
-/**
+/*
  * c67x00_hcd_start: Host controller start hook
  */
 static int c67x00_hcd_start(struct usb_hcd *hcd)
@@ -272,7 +272,7 @@ static int c67x00_hcd_start(struct usb_hcd *hcd)
 	return 0;
 }
 
-/**
+/*
  * c67x00_hcd_stop: Host controller stop hook
  */
 static void c67x00_hcd_stop(struct usb_hcd *hcd)
-- 
2.25.1

