Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E3AC617D9B
	for <lists+linux-usb@lfdr.de>; Thu,  3 Nov 2022 14:13:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231363AbiKCNM6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Nov 2022 09:12:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231316AbiKCNM4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 3 Nov 2022 09:12:56 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2C44140A2
        for <linux-usb@vger.kernel.org>; Thu,  3 Nov 2022 06:12:55 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id j12so1879009plj.5
        for <linux-usb@vger.kernel.org>; Thu, 03 Nov 2022 06:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f7xraXG/GileYO3tPwQFVcfRIK9dP1/TT5c9Q1u4UMU=;
        b=QHWz+PU8C9ejrxpJjFKO8yxQAEIOfgWd0jmIVuiJkFcZu8Xcg8SJAg/+iDGWyC3T8a
         uhf19QtvGRTBzoqKI0cjFaUxOA7BZtOxTDoXpLvTFoOdsMvjoHCkalG+oQC8lSMQv6IT
         iXiwMMO3N5SpjomNi02WrWy6ckVRsfvt4+DfQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f7xraXG/GileYO3tPwQFVcfRIK9dP1/TT5c9Q1u4UMU=;
        b=iobcl2nSZQvjj0afcoyOAGn1NkCr+jFh0M6yPUzH5PBXnT7XfbdJAchTY8XJkPpXKW
         +bE/UvwkYSW2oVfrvll1IjjulxOFnQfi1ZWlMLFF9Y8d4oDLlvk2DwrBRUQDuDKgOL1h
         2E9e7LCJhyZjlYtdKHEzUXjyBp4ylRklPJobc6Ywvtk8sZLCwcV0HtHaWhZ+Acpy14eI
         Q7k/AV6r6G1AtPuZKAePjJWMxK8+KPriCHzty6EvsDETNolToYzHcfoDll7f/9UgeNEj
         fuc7dbfFrIAcc5qeOxVFOCgjqmKP70rNtz3mdXSPfYRzuNxYonVRQrxeeOM41BEnf0CU
         RjaA==
X-Gm-Message-State: ACrzQf1oF8QLdY7PIeQ56uG+wQFtu0ebPMKHp4qLbF9bt4kNCRXVCUrZ
        I8f9BgNZWJoWnnPYMs/16Biy1g==
X-Google-Smtp-Source: AMsMyM4eVD/pPFuOp8pOkpzHdfAlJMtNs8StKlglQPlCXRJTor/oOOiYEc9zhsQmFlv8jkxNfPePlw==
X-Received: by 2002:a17:90a:930b:b0:20b:a5d:35d6 with SMTP id p11-20020a17090a930b00b0020b0a5d35d6mr48008379pjo.146.1667481175341;
        Thu, 03 Nov 2022 06:12:55 -0700 (PDT)
Received: from shuah-tx13.. ([103.99.10.63])
        by smtp.gmail.com with ESMTPSA id p8-20020a1709027ec800b0018703bf3ec9sm647871plb.61.2022.11.03.06.12.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 06:12:54 -0700 (PDT)
From:   Shuah Khan <skhan@linuxfoundation.org>
To:     shuah@kernel.org, valentina.manea.m@gmail.com
Cc:     Shuah Khan <skhan@linuxfoundation.org>, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] usb/usbip: Fix v_recv_cmd_submit() to use PIPE_BULK define
Date:   Thu,  3 Nov 2022 07:12:43 -0600
Message-Id: <c9790c485bfe31c55bbd2f9b270548ecefddc91a.1667480280.git.skhan@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1667480280.git.skhan@linuxfoundation.org>
References: <cover.1667480280.git.skhan@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Fix v_recv_cmd_submit() to use PIPE_BULK define instead of hard coded
values. This also fixes the following signed integer overflow error
reported by cppcheck. This is not an issue since pipe is unsigned int.
However, this change improves the code to use proper define.

drivers/usb/usbip/vudc_rx.c:152:26: error: Signed integer overflow for expression '3<<30'. [integerOverflow]
 urb_p->urb->pipe &= ~(3 << 30);

In addition, add a sanity check for PIPE_BULK != 3 as the code path depends
on PIPE_BULK = 3.

Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
---
 drivers/usb/usbip/vudc_rx.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/usbip/vudc_rx.c b/drivers/usb/usbip/vudc_rx.c
index a6ca27f10b68..e7e0eb6bbca0 100644
--- a/drivers/usb/usbip/vudc_rx.c
+++ b/drivers/usb/usbip/vudc_rx.c
@@ -149,7 +149,10 @@ static int v_recv_cmd_submit(struct vudc *udc,
 	urb_p->urb->status = -EINPROGRESS;
 
 	/* FIXME: more pipe setup to please usbip_common */
-	urb_p->urb->pipe &= ~(3 << 30);
+#if PIPE_BULK != 3
+#error "Sanity check failed, this code presumes PIPE_... to range from 0 to 3"
+#endif
+	urb_p->urb->pipe &= ~(PIPE_BULK << 30);
 	switch (urb_p->ep->type) {
 	case USB_ENDPOINT_XFER_BULK:
 		urb_p->urb->pipe |= (PIPE_BULK << 30);
-- 
2.34.1

