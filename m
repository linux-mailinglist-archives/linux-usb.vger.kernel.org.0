Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4945B213EAE
	for <lists+linux-usb@lfdr.de>; Fri,  3 Jul 2020 19:42:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726682AbgGCRmJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Jul 2020 13:42:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726670AbgGCRmI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 3 Jul 2020 13:42:08 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DF90C061794
        for <linux-usb@vger.kernel.org>; Fri,  3 Jul 2020 10:42:07 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id f2so5597603wrp.7
        for <linux-usb@vger.kernel.org>; Fri, 03 Jul 2020 10:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=F6U6du2cLEW6hsEFJ/YlMHhYAq991XScHIIikwh94ck=;
        b=Y2SU5Y10snNBVm4aLkU7fk0EzfCxFtMtC2t6XTYj/cZvEvyIk4JHi4IzvP1Q84NMJb
         wp3/StQ4VnPEvn10ZvSQjYAQoaEXHwEQT4aUyHcryjLofn34gYEQYBX9KR5uIygZqkN6
         c8U7oJkzVqsT/LFEegC/GHVUwFXrl2/ZhWuLrxRxPNjIUcCh5M1zV79xpQ30M6cB6ga7
         QWgSinALKbHXOtbxbW8M3V/Iiah/Cu+ACH7HTP3WaFgoG4gBY45UTg5GU2giIEBzvnLg
         iBZ1Uq8pwToe0JQnN0zwI96iPtfuryHBRuGoe5iyK5uIGgRfcs1vA3hqc87ZlrAGsbuR
         pCCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=F6U6du2cLEW6hsEFJ/YlMHhYAq991XScHIIikwh94ck=;
        b=p9C8iNUP+rrOR5cQ/BzhDhaqocKHy/ek10j8FanYlRQr7x5vBrGHcFOhmBWjXtXKrV
         SsYnKMr+XjluHlGkq3kTZhQecycYgx1YiMXsoUBspx+Svi3SyumfIDqGP/2DBpxPZWvf
         0PQVn1H5uxwnLFnNfwBg+x8gw/iwlU79dpuBTHMfqiuJNK9c6NlNwjmFGyr4D8n6i4sA
         46EtwQnPSNfLVjyJmMUCX/2uxAf4bSx+cSc0YIRrtmt05gRv1CCITe5ZGQpVeNkYuLAI
         pZ2DbLiodlddA8fh9eC2ZsiGoDA41k+M2Of4aMBnJy0rAW9FbV8OoJiCeLflde3Co99E
         MXFw==
X-Gm-Message-State: AOAM531z9DeaBMpGtb2ZgzcbmdL9iVxHV1miJy9ZUTrdpIDoCexf66oW
        XTNBzV1f0pwlH37luZmvS74slQ==
X-Google-Smtp-Source: ABdhPJzRUz7YIJkc5rXRh4EaTG+LenxNZrmqTf7CVLD+POjSpAcpZFSCLy+UvmQirb+yuYnlUSpq1g==
X-Received: by 2002:adf:fcc5:: with SMTP id f5mr41966929wrs.60.1593798126416;
        Fri, 03 Jul 2020 10:42:06 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.144])
        by smtp.gmail.com with ESMTPSA id x11sm13625799wmc.26.2020.07.03.10.42.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2020 10:42:05 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Lee Jones <lee.jones@linaro.org>,
        Johan Hovold <johan@kernel.org>,
        David Glance <davidgsf@sourceforge.net>,
        Juergen Stuber <stuber@loria.fr>
Subject: [PATCH 06/30] usb: misc: adutux: Demote obvious misuse of kerneldoc to standard comment blocks
Date:   Fri,  3 Jul 2020 18:41:24 +0100
Message-Id: <20200703174148.2749969-7-lee.jones@linaro.org>
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

 drivers/usb/misc/adutux.c:117: warning: Function parameter or member 'dev' not described in 'adu_abort_transfers'
 drivers/usb/misc/adutux.c:653: warning: Function parameter or member 'interface' not described in 'adu_probe'
 drivers/usb/misc/adutux.c:653: warning: Function parameter or member 'id' not described in 'adu_probe'
 drivers/usb/misc/adutux.c:762: warning: Function parameter or member 'interface' not described in 'adu_disconnect'

Cc: Johan Hovold <johan@kernel.org>
Cc: David Glance <davidgsf@sourceforge.net>
Cc: Juergen Stuber <stuber@loria.fr>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/usb/misc/adutux.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/misc/adutux.c b/drivers/usb/misc/adutux.c
index d8d157c4c271d..a7eefe11f31aa 100644
--- a/drivers/usb/misc/adutux.c
+++ b/drivers/usb/misc/adutux.c
@@ -109,7 +109,7 @@ static inline void adu_debug_data(struct device *dev, const char *function,
 		function, size, size, data);
 }
 
-/**
+/*
  * adu_abort_transfers
  *      aborts transfers and frees associated data structures
  */
@@ -642,7 +642,7 @@ static struct usb_class_driver adu_class = {
 	.minor_base = ADU_MINOR_BASE,
 };
 
-/**
+/*
  * adu_probe
  *
  * Called by the usb core when a new device is connected that it thinks
@@ -753,7 +753,7 @@ static int adu_probe(struct usb_interface *interface,
 	return retval;
 }
 
-/**
+/*
  * adu_disconnect
  *
  * Called by the usb core when the device is removed from the system.
-- 
2.25.1

