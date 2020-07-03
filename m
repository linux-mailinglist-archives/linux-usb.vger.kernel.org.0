Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9045C213EEB
	for <lists+linux-usb@lfdr.de>; Fri,  3 Jul 2020 19:45:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727817AbgGCRoF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Jul 2020 13:44:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726869AbgGCRmd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 3 Jul 2020 13:42:33 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39FF7C061794
        for <linux-usb@vger.kernel.org>; Fri,  3 Jul 2020 10:42:33 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id j18so32753949wmi.3
        for <linux-usb@vger.kernel.org>; Fri, 03 Jul 2020 10:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hkP3qVBNEk6Kc5YTDzguCBFbl645cyK8MIjoauSGcJc=;
        b=DMqJkwcMFbE16h4BXCAlhproq9OY9OTMS6yMlTWhnyElmGkSam1Nhg2OxHZdPKcjAV
         fWMh1JQtMrUG+nF+S5TM02kB7g2XlgSG0aUiH2N7fo4tvH0W6QcegBqOL5TlgE4Tb8uU
         sD9IP3QVUcbeuuFmEbW75bpiS8sTsnVeAORASEMdFtjTrJ4paWH3MEuIz3TiYhm7/jdO
         pYSCxncRB6biQIICoD2NYpo69H8bsraYRPIqQXuhynZl7lIBGzwCSQfo53knK+w9zgNW
         mlKrkddtqqQsp49JGkEEW3Fcd2AHsUc5Epv0TXK3FjLoSF05qYCsLrQGcCTF3+iVJENG
         UPdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hkP3qVBNEk6Kc5YTDzguCBFbl645cyK8MIjoauSGcJc=;
        b=lahqz4oAtgzDylU98yeWmG/H+7lWRAzJAacPGxhcatkILYw7tFsTq3OI9/BZJYTl6Q
         mnxDk04pvOOnMElAgTXoYSB0oy6/zhsKgMJFFwdDDMwW16EiUz7SXInrRJv2ON1s2LoG
         gjlP9kw/Sjzc4iRCwFEuaTNSOLNiiwbH59k9Bg+EPV+Z3rjoq+w0z5JpEEAibPU63rvy
         hnYzUTE2frtWuXAQSBr/Iv+Lc40bgKXv4MAfI8P1/BbIv8MRC9kGNx5xUfCXWHIfBbjt
         qPwN7OJrxYqXLNJaW3UoCpc3tP7jI9cHeJH0TMn2W7WQYJ6Q+bLlMvwnqRngWplT4dpe
         llPQ==
X-Gm-Message-State: AOAM530PIrGUZDspOsV+CIqed1r2tS1gV0RY5R1QQj7Lv51OHIlYEE9b
        HkIJkU3evRqynLeZ/wSnpCwZeQ==
X-Google-Smtp-Source: ABdhPJyBCYm3ryMjBcp1zoZ4Rl9KiNphQ9CcsrkGIBJR3Mk9yN41fsP6rocveGpS/R7FreNKHpirUg==
X-Received: by 2002:a1c:2d0d:: with SMTP id t13mr22258434wmt.43.1593798151974;
        Fri, 03 Jul 2020 10:42:31 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.144])
        by smtp.gmail.com with ESMTPSA id x11sm13625799wmc.26.2020.07.03.10.42.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2020 10:42:31 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Lee Jones <lee.jones@linaro.org>,
        Peter Chen <Peter.Chen@nxp.com>
Subject: [PATCH 11/30] usb: chipidea: udc: Add missing descriptions for function arg 'ci'
Date:   Fri,  3 Jul 2020 18:41:29 +0100
Message-Id: <20200703174148.2749969-12-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200703174148.2749969-1-lee.jones@linaro.org>
References: <20200703174148.2749969-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Looks like a very popular argument to omit descriptions for.

Fixes the following W=1 kernel build warning(s):

 drivers/usb/chipidea/udc.c:80: warning: Function parameter or member 'ci' not described in 'hw_device_state'
 drivers/usb/chipidea/udc.c:100: warning: Function parameter or member 'ci' not described in 'hw_ep_flush'
 drivers/usb/chipidea/udc.c:121: warning: Function parameter or member 'ci' not described in 'hw_ep_disable'
 drivers/usb/chipidea/udc.c:136: warning: Function parameter or member 'ci' not described in 'hw_ep_enable'
 drivers/usb/chipidea/udc.c:170: warning: Function parameter or member 'ci' not described in 'hw_ep_get_halt'
 drivers/usb/chipidea/udc.c:185: warning: Function parameter or member 'ci' not described in 'hw_ep_prime'
 drivers/usb/chipidea/udc.c:215: warning: Function parameter or member 'ci' not described in 'hw_ep_set_halt'
 drivers/usb/chipidea/udc.c:238: warning: Function parameter or member 'ci' not described in 'hw_port_is_high_speed'
 drivers/usb/chipidea/udc.c:251: warning: Function parameter or member 'ci' not described in 'hw_test_and_clear_complete'
 drivers/usb/chipidea/udc.c:263: warning: Function parameter or member 'ci' not described in 'hw_test_and_clear_intr_active'
 drivers/usb/chipidea/udc.c:277: warning: Function parameter or member 'ci' not described in 'hw_test_and_clear_setup_guard'
 drivers/usb/chipidea/udc.c:288: warning: Function parameter or member 'ci' not described in 'hw_test_and_set_setup_guard'
 drivers/usb/chipidea/udc.c:300: warning: Function parameter or member 'ci' not described in 'hw_usb_set_address'
 drivers/usb/chipidea/udc.c:312: warning: Function parameter or member 'ci' not described in 'hw_usb_reset'

Cc: Peter Chen <Peter.Chen@nxp.com>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/usb/chipidea/udc.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
index db0cfde0cc3cb..c42b98c84f2f1 100644
--- a/drivers/usb/chipidea/udc.c
+++ b/drivers/usb/chipidea/udc.c
@@ -72,6 +72,7 @@ static inline int ep_to_bit(struct ci_hdrc *ci, int n)
 
 /**
  * hw_device_state: enables/disables interrupts (execute without interruption)
+ * @ci: the controller
  * @dma: 0 => disable, !0 => enable and set dma engine
  *
  * This function returns an error code
@@ -91,6 +92,7 @@ static int hw_device_state(struct ci_hdrc *ci, u32 dma)
 
 /**
  * hw_ep_flush: flush endpoint fifo (execute without interruption)
+ * @ci: the controller
  * @num: endpoint number
  * @dir: endpoint direction
  *
@@ -112,6 +114,7 @@ static int hw_ep_flush(struct ci_hdrc *ci, int num, int dir)
 
 /**
  * hw_ep_disable: disables endpoint (execute without interruption)
+ * @ci: the controller
  * @num: endpoint number
  * @dir: endpoint direction
  *
@@ -126,6 +129,7 @@ static int hw_ep_disable(struct ci_hdrc *ci, int num, int dir)
 
 /**
  * hw_ep_enable: enables endpoint (execute without interruption)
+ * @ci: the controller
  * @num:  endpoint number
  * @dir:  endpoint direction
  * @type: endpoint type
@@ -161,6 +165,7 @@ static int hw_ep_enable(struct ci_hdrc *ci, int num, int dir, int type)
 
 /**
  * hw_ep_get_halt: return endpoint halt status
+ * @ci: the controller
  * @num: endpoint number
  * @dir: endpoint direction
  *
@@ -175,6 +180,7 @@ static int hw_ep_get_halt(struct ci_hdrc *ci, int num, int dir)
 
 /**
  * hw_ep_prime: primes endpoint (execute without interruption)
+ * @ci: the controller
  * @num:     endpoint number
  * @dir:     endpoint direction
  * @is_ctrl: true if control endpoint
@@ -205,6 +211,7 @@ static int hw_ep_prime(struct ci_hdrc *ci, int num, int dir, int is_ctrl)
 /**
  * hw_ep_set_halt: configures ep halt & resets data toggle after clear (execute
  *                 without interruption)
+ * @ci: the controller
  * @num:   endpoint number
  * @dir:   endpoint direction
  * @value: true => stall, false => unstall
@@ -243,6 +250,7 @@ static int hw_port_is_high_speed(struct ci_hdrc *ci)
 /**
  * hw_test_and_clear_complete: test & clear complete status (execute without
  *                             interruption)
+ * @ci: the controller
  * @n: endpoint number
  *
  * This function returns complete status
@@ -291,6 +299,7 @@ static int hw_test_and_set_setup_guard(struct ci_hdrc *ci)
 
 /**
  * hw_usb_set_address: configures USB address (execute without interruption)
+ * @ci: the controller
  * @value: new USB address
  *
  * This function explicitly sets the address, without the "USBADRA" (advance)
@@ -610,8 +619,9 @@ static int _hardware_enqueue(struct ci_hw_ep *hwep, struct ci_hw_req *hwreq)
 	return ret;
 }
 
-/*
+/**
  * free_pending_td: remove a pending request for the endpoint
+ * @ci: the controller
  * @hwep: endpoint
  */
 static void free_pending_td(struct ci_hw_ep *hwep)
-- 
2.25.1

