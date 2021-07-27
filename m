Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7EF93D728E
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jul 2021 12:05:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236131AbhG0KFl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 27 Jul 2021 06:05:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236114AbhG0KFi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 27 Jul 2021 06:05:38 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FD2DC061760
        for <linux-usb@vger.kernel.org>; Tue, 27 Jul 2021 03:05:36 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id u15so3801483wmj.1
        for <linux-usb@vger.kernel.org>; Tue, 27 Jul 2021 03:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nF64hrCt+iysrWcIxiwBk9hVVpCYT1t38dbYkFkUu9c=;
        b=CStKikPTlXNXft2gxGvH3D0Vurm1lfjh3TnXMKa7nxsBgBWXYmXtf72ubLu6ZOU83u
         ClVInJbfqfPSE3uNKZRGjyMYq1WmFMkWId2TbJ24Fnc/sHBckjZ6Cld0VcNSGItTjyxK
         AinWCsTDqhpl3rvrkp+o4qfwXhdu5HWu6//F8CVQguGIVGvPj4KVm3alENGa276DCQGa
         lfubIuEli/VkOEldRN9uOhMR5P0x9NvW9dArzNI7IkuwYdvTYItTvFxytYqNr9Mmo619
         cnGRvhfYSClltQw/Kygad+DaDVO1KEY4QMH6FX7zhwpWLV68HrLhVfjg1JIgp62KVKLI
         NdXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nF64hrCt+iysrWcIxiwBk9hVVpCYT1t38dbYkFkUu9c=;
        b=ngKcSkf9hAVuMQnJ3nrd8VxGxff9Ifmjn1Re6Czm9FKta8nIydAd6a+S60+MZbgB6F
         Bqt92hz/Jv1MDl7hnQgQwNFORmYNdGRTdCT9jXvAt4+3d1h8PSgwq0Caz9UOV+pLCcJr
         riQo0eWpJC7sfrdTjcxL/OtqZuiWqhRvFNxqXyxjSk8F4fG62jL0z6p15MhaeQitjV2z
         1PNXSRKe4oG7VJ9sIAM4i8egYu1RW5xtxz+9LifWYXDTTdGDaE6rTZv2ApxnvcfRs7Sw
         uNlt1bPZK9Op7smRBs3yzmdVYo1ekBDbOwrN7sG16pi07GoocrDl/UplchfJjjW2SrWh
         SOsQ==
X-Gm-Message-State: AOAM530S96cS+ioUewTJdhNZ5olqkY3Dc5XKuN7njjeyip8wHd+ATvai
        ajF+B0mpZpB5uaoGLQ1BjK1nrg==
X-Google-Smtp-Source: ABdhPJxaopeXdvHv8ScBCBLMZyMkJiuwF2lwSqLvIdKGnGrjC1jtZPyyjtaFgRYYOXfszmmyUhNmSw==
X-Received: by 2002:a1c:7208:: with SMTP id n8mr3064975wmc.89.1627380334520;
        Tue, 27 Jul 2021 03:05:34 -0700 (PDT)
Received: from arch-thunder.local (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id v5sm2813221wrd.74.2021.07.27.03.05.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jul 2021 03:05:34 -0700 (PDT)
From:   Rui Miguel Silva <rui.silva@linaro.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dan Carpenter <dan.carpenter@oracle.com>
Cc:     linux-usb@vger.kernel.org, Rui Miguel Silva <rui.silva@linaro.org>
Subject: [PATCH 1/3] usb: isp1760: remove debug message as error
Date:   Tue, 27 Jul 2021 11:05:14 +0100
Message-Id: <20210727100516.4190681-2-rui.silva@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210727100516.4190681-1-rui.silva@linaro.org>
References: <20210727100516.4190681-1-rui.silva@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Remove debug message leftover from the boot error buffer.

Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
---
 drivers/usb/isp1760/isp1760-hcd.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/usb/isp1760/isp1760-hcd.c b/drivers/usb/isp1760/isp1760-hcd.c
index 27168b4a4ef2..a745c4c2b773 100644
--- a/drivers/usb/isp1760/isp1760-hcd.c
+++ b/drivers/usb/isp1760/isp1760-hcd.c
@@ -733,7 +733,6 @@ static int isp1760_hc_setup(struct usb_hcd *hcd)
 
 	/* Change bus pattern */
 	scratch = isp1760_hcd_read(hcd, HC_CHIP_ID_HIGH);
-	dev_err(hcd->self.controller, "Scratch test 0x%08x\n", scratch);
 	scratch = isp1760_hcd_read(hcd, HC_SCRATCH);
 	if (scratch != pattern) {
 		dev_err(hcd->self.controller, "Scratch test failed. 0x%08x\n", scratch);
-- 
2.32.0

