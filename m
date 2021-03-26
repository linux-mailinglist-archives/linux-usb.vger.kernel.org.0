Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B24DD34A9E7
	for <lists+linux-usb@lfdr.de>; Fri, 26 Mar 2021 15:37:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230411AbhCZOfo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 26 Mar 2021 10:35:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230204AbhCZOfK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 26 Mar 2021 10:35:10 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D11DC0613B7
        for <linux-usb@vger.kernel.org>; Fri, 26 Mar 2021 07:35:09 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id p19so3116052wmq.1
        for <linux-usb@vger.kernel.org>; Fri, 26 Mar 2021 07:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YVoLbq8RBXUfihLEoAO2RhgjiaRVSJgl/YQpPYdz058=;
        b=B2LHHGKt5RYtaAQDcE2ea2YjPdmOcookzVWUcAeW2fSKBOJYI4+/tTokzh72qclZTH
         o9XkPL0/M9rjfnS0EZXsGyJLZuK/uhjxvHwy1BgLn7IF2r6pLi5+aL1OsFmoaK4rM18+
         /8iiG42d8nOg7/rkGhD126LKouPNXEJWi2msD9kTTxN49Wxj2WHPgltfnrXugkf++PmV
         Dnkl+/l2GOSiKRL9zXMtTp+NQdKdWLXML6VUtuhVoVumEgKfU33KjTxhACDeTX0YFY2P
         2zDhuvtdB3zSN3PqLen9XWHTHmRYsWQtS5DmLO0R+qUVl5hEEGYzb45za+kw3BYdKZZb
         ph4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YVoLbq8RBXUfihLEoAO2RhgjiaRVSJgl/YQpPYdz058=;
        b=adoLnSe5cqJO5s7/07IwPdJezopg0CEl53wEBJuuIKZ6+iyqKe0YvIJriYqo1Y+uDG
         4l9SvDSAUoOesXDykjxBLTGVN7qq5Me5fnY8l28x9a+r4D/wt8TeU01R3LuI+jdzS5/4
         xJ66S5u1/dw7T3YcdVrSnZfeyfv53lua9+wNN5zEAHXktvL1/zX1YqBJK3MQreUcz5uT
         vcL/nbLJmcLKHZqFnHzDO5LVMXKjfE0Fcp1T5kIBGMiTvT+jVRtLwQHmM1K4gPn7A/Z8
         3n048GPohtsJJxnFMJ1b7SltBiM8mIjSgFCyo3Py6SwaJDtLGl3eamjYpVdcFSWDYvDh
         Y6ZQ==
X-Gm-Message-State: AOAM533SYcDkhExGGADhe/7CdsLdJneHVb7fgP2wwwvLTeNA8o49suJB
        5ShjOcRIpQWMyQmVU7b8veo+4g==
X-Google-Smtp-Source: ABdhPJyOl6H0eBdmFimOW38fifNp/S8IZLg8/1blX0NB8KwX5xbBrC5A0cvRaugsDJzcDYhO6id48Q==
X-Received: by 2002:a1c:4e0f:: with SMTP id g15mr13424401wmh.144.1616769308209;
        Fri, 26 Mar 2021 07:35:08 -0700 (PDT)
Received: from dell.default ([91.110.221.194])
        by smtp.gmail.com with ESMTPSA id j26sm12878225wrh.57.2021.03.26.07.35.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Mar 2021 07:35:07 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        message to <vojtech@ucw.cz>, linux-usb@vger.kernel.org,
        linux-input@vger.kernel.org
Subject: [PATCH 06/25] HID: usbhid: Repair a formatting issue in a struct description
Date:   Fri, 26 Mar 2021 14:34:39 +0000
Message-Id: <20210326143458.508959-8-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210326143458.508959-1-lee.jones@linaro.org>
References: <20210326143458.508959-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/hid/usbhid/usbkbd.c:66: warning: bad line:                 should be on

Cc: Jiri Kosina <jikos@kernel.org>
Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: message to <vojtech@ucw.cz>
Cc: linux-usb@vger.kernel.org
Cc: linux-input@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/hid/usbhid/usbkbd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/usbhid/usbkbd.c b/drivers/hid/usbhid/usbkbd.c
index d5b7a696a68c5..d0c640be8a885 100644
--- a/drivers/hid/usbhid/usbkbd.c
+++ b/drivers/hid/usbhid/usbkbd.c
@@ -63,7 +63,7 @@ static const unsigned char usb_kbd_keycode[256] = {
  *		new key is pressed or a key that was pressed is released.
  * @led:	URB for sending LEDs (e.g. numlock, ...)
  * @newleds:	data that will be sent with the @led URB representing which LEDs
- 		should be on
+ *  		should be on
  * @name:	Name of the keyboard. @dev's name field points to this buffer
  * @phys:	Physical path of the keyboard. @dev's phys field points to this
  *		buffer
-- 
2.27.0

