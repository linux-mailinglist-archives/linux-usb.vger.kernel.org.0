Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3D8B213EBD
	for <lists+linux-usb@lfdr.de>; Fri,  3 Jul 2020 19:44:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726803AbgGCRm1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Jul 2020 13:42:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726639AbgGCRmG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 3 Jul 2020 13:42:06 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 851D2C08C5DD
        for <linux-usb@vger.kernel.org>; Fri,  3 Jul 2020 10:42:06 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id o8so32744464wmh.4
        for <linux-usb@vger.kernel.org>; Fri, 03 Jul 2020 10:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=As8A0RVzBKjotvgXeoxk2ZtBQ/Bg0sCNtYggCVfAltY=;
        b=vxZsHJwvvgk09IRk1MBBvInd06xDFaXaJSvUjtd1st5QBwE7HyMKZH7jepYLljpcQg
         zUHRMk04EnmsYB1tHOAEOToKbahfZNCxa2IgNpGUJzAY8RUNWCNGf5YJiWejTxgPu1E/
         0DNDIRZTdlSOPBhE42KiXRHEn84U1+zcJqILDik1LWMAVQR4OwHllAkevRZJAAxCxPdY
         Yrs0IHBWbngpyzHbb5g2+htPJdQxKakwoR0jr3Mtt3yPL6c8ag7wc5DkOdqUDX/rJBUU
         oD+k+3a0jVUSk5VbS3zeYPCF2xo/5RD7A7aQnMB21Z+a6om5KhL9zryyYKpkaJlLrsFB
         AacA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=As8A0RVzBKjotvgXeoxk2ZtBQ/Bg0sCNtYggCVfAltY=;
        b=lkqIqDsKPmoOjWx+3rsjbyZ4I5ZRv8GAbo3aDrXnhVydlBO6xMuV9kN4rjdUdF8K5G
         ibr9w+x+8UPY558XZQIcnRlNnTTSSqjw69VNp10vQrAIB2kADQ0RPmlwapDOHAnYQkCM
         tQH+blRRzbvrAtyxng1wfyhxrm8RyvpLUpSz8xgGZfgUS54Qrh5O3QnAT06x8B2jGzyH
         fRCa45QtRsr9u0IwTJ1UK6FS6fy+hhDGQVC+cX97xhgTgG5Jw65hHle8ZDUl3PzYHHwk
         +/88RnisZTwYTriKiiL/MTBJaruyo1H7D1N6erDoKqsWDqL3880FvnJ5n3uYoZ913o9C
         htBA==
X-Gm-Message-State: AOAM533Mepohr79IS4pHVOhM767EuWLtqlPMcAjLkdy28ldPR89GxIdg
        bxcM6CNfnAsttjbl5TBDTcQwnw==
X-Google-Smtp-Source: ABdhPJwolAxrC9FaOIOAI5J97mqd3etXuXAGwhxu+GQ5gnBfEv/QxrYF0gQrtBPhDn4CwIqSE6hE0g==
X-Received: by 2002:a1c:398b:: with SMTP id g133mr36495525wma.76.1593798125273;
        Fri, 03 Jul 2020 10:42:05 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.144])
        by smtp.gmail.com with ESMTPSA id x11sm13625799wmc.26.2020.07.03.10.42.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2020 10:42:04 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Lee Jones <lee.jones@linaro.org>,
        Matthieu CASTET <castet.matthieu@free.fr>,
        Stanislaw Gruszka <stf_xl@wp.pl>,
        Damien Bergamini <damien.bergamini@free.fr>
Subject: [PATCH 05/30] usb: atm: ueagle-atm: Demote obvious misuse of kerneldoc to standard comment blocks
Date:   Fri,  3 Jul 2020 18:41:23 +0100
Message-Id: <20200703174148.2749969-6-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200703174148.2749969-1-lee.jones@linaro.org>
References: <20200703174148.2749969-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

No attempt has been made to document any of the functions here.

Fixes the following W=1 kernel build warning(s):

 drivers/usb/atm/ueagle-atm.c:578: warning: Function parameter or member 'usb' not described in 'uea_send_modem_cmd'
 drivers/usb/atm/ueagle-atm.c:578: warning: Function parameter or member 'addr' not described in 'uea_send_modem_cmd'
 drivers/usb/atm/ueagle-atm.c:578: warning: Function parameter or member 'size' not described in 'uea_send_modem_cmd'
 drivers/usb/atm/ueagle-atm.c:578: warning: Function parameter or member 'buff' not described in 'uea_send_modem_cmd'
 drivers/usb/atm/ueagle-atm.c:679: warning: Function parameter or member 'usb' not described in 'uea_load_firmware'
 drivers/usb/atm/ueagle-atm.c:679: warning: Function parameter or member 'ver' not described in 'uea_load_firmware'

Cc: Matthieu CASTET <castet.matthieu@free.fr>
Cc: Stanislaw Gruszka <stf_xl@wp.pl>
Cc: Damien Bergamini <damien.bergamini@free.fr>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/usb/atm/ueagle-atm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/atm/ueagle-atm.c b/drivers/usb/atm/ueagle-atm.c
index e9fed9a887377..786299892c7f4 100644
--- a/drivers/usb/atm/ueagle-atm.c
+++ b/drivers/usb/atm/ueagle-atm.c
@@ -570,7 +570,7 @@ MODULE_PARM_DESC(annex,
 #define LOAD_INTERNAL     0xA0
 #define F8051_USBCS       0x7f92
 
-/**
+/*
  * uea_send_modem_cmd - Send a command for pre-firmware devices.
  */
 static int uea_send_modem_cmd(struct usb_device *usb,
@@ -672,7 +672,7 @@ static void uea_upload_pre_firmware(const struct firmware *fw_entry,
 	uea_leaves(usb);
 }
 
-/**
+/*
  * uea_load_firmware - Load usb firmware for pre-firmware devices.
  */
 static int uea_load_firmware(struct usb_device *usb, unsigned int ver)
-- 
2.25.1

