Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC971215880
	for <lists+linux-usb@lfdr.de>; Mon,  6 Jul 2020 15:36:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729314AbgGFNeF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Jul 2020 09:34:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729305AbgGFNeC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Jul 2020 09:34:02 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91BA7C061755
        for <linux-usb@vger.kernel.org>; Mon,  6 Jul 2020 06:34:02 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id f18so32881053wrs.0
        for <linux-usb@vger.kernel.org>; Mon, 06 Jul 2020 06:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KCHAGi+yis7rT4RcJ1xkGNsqK+uVMhPXLaq/wOq2nXg=;
        b=d1ILBA/20Tq+wf0tqPOsJ+Q7ruJ9GVdOks6k+ffLS4tTGE0XaURNCIQ3lPi3D8MqNy
         6bfpQGGIvvkd7dqLML2B/x3dDVz1X2KSrKeKImRiplCftwatlzk4iTY1bSQWuRoNS6CN
         n+d6tzIzTcqwW84lCy7LOKRcFOHHbSATtvadCsaCKyNI8wsUmOMuAtEzSoIoYXzf4TsO
         Pa25MqF0q1O3Onbn/OmoYNR44areZTUJ7E38CrsTHRAwH9fameB3YKH/n/EwJedUzvzp
         PiJOKFvVHKVlf5cdnE+5q7vJa6crbxjM7PG0iwmBGNtpdFRf+AbWmusFYIrj9TqmKxao
         h3pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KCHAGi+yis7rT4RcJ1xkGNsqK+uVMhPXLaq/wOq2nXg=;
        b=cpblXl8Pu1Htvqp1rsBfKrsw2b5PnrbWV0WTcru4D9Kh7B9uMl1L3LqPAu3+jnH+nd
         bdgH7FOZdyTSWT9FPYyuAyzmcqPHY5cl5HzwqwLKw7WKWRBOeo4rnbFQUSUu9hfu7VbV
         DGtzxZIzXMvQY5xR5OchDR80Wr18OA6gj/UyfYfNeJ2ag2ytCPO3QdjBm37vTA2Fk+ni
         F9iEW67v735eIVbGXJa7VvQAUlAA3exl51jAm5gQOd5Ti0tBW6+jYuMO2mycbqdU6m9c
         gyCY9fAIUyINmeatRzxO+rFv9BSIHBS2qxO6RyYAImah+27GX6p7iOvHrnBs+CUlgxbt
         5Q9w==
X-Gm-Message-State: AOAM532G0qOP7DvnLYMIaLOb0PKU4rHKfx0a9jmCh4EE2o4V3G5ghwID
        JRoX+kkwbUDYukDeSEFZS8c1Sw==
X-Google-Smtp-Source: ABdhPJy2Eg3D1zjnU2FxioIxSHD9bWpgEVorUJ2S4pILADo+vEbjB7rEn1A92h/ru5KDKIiVhqYg/w==
X-Received: by 2002:a5d:5706:: with SMTP id a6mr13466028wrv.328.1594042441319;
        Mon, 06 Jul 2020 06:34:01 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.206])
        by smtp.gmail.com with ESMTPSA id v18sm25416082wrv.49.2020.07.06.06.34.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2020 06:34:00 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
        Felipe Balbi <balbi@kernel.org>,
        Chao Xie <chao.xie@marvell.com>,
        Neil Zhang <zhangwm@marvell.com>
Subject: [PATCH 14/32] usb: gadget: udc: mv_udc_core: Remove unused static const variable 'driver_desc'
Date:   Mon,  6 Jul 2020 14:33:23 +0100
Message-Id: <20200706133341.476881-15-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200706133341.476881-1-lee.jones@linaro.org>
References: <20200706133341.476881-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Looks as though it's never been used.  Driver was introduced in 2014.

Fixes the following W=1 kernel build warning(s):

 drivers/usb/gadget/udc/mv_udc_core.c:56:19: warning: ‘driver_desc’ defined but not used [-Wunused-const-variable=]
 56 | static const char driver_desc[] = DRIVER_DESC;
 | ^~~~~~~~~~~

Cc: Felipe Balbi <balbi@kernel.org>
Cc: Chao Xie <chao.xie@marvell.com>
Cc: Neil Zhang <zhangwm@marvell.com>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/usb/gadget/udc/mv_udc_core.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/mv_udc_core.c b/drivers/usb/gadget/udc/mv_udc_core.c
index 2384b55f9d3e8..0fb4ef464321d 100644
--- a/drivers/usb/gadget/udc/mv_udc_core.c
+++ b/drivers/usb/gadget/udc/mv_udc_core.c
@@ -53,7 +53,6 @@
 static DECLARE_COMPLETION(release_done);
 
 static const char driver_name[] = "mv_udc";
-static const char driver_desc[] = DRIVER_DESC;
 
 static void nuke(struct mv_ep *ep, int status);
 static void stop_activity(struct mv_udc *udc, struct usb_gadget_driver *driver);
-- 
2.25.1

