Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CDF7F5F1CFC
	for <lists+linux-usb@lfdr.de>; Sat,  1 Oct 2022 16:56:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229550AbiJAO4k (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 1 Oct 2022 10:56:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229451AbiJAO4j (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 1 Oct 2022 10:56:39 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0992498D31
        for <linux-usb@vger.kernel.org>; Sat,  1 Oct 2022 07:56:37 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id u10so10779473wrq.2
        for <linux-usb@vger.kernel.org>; Sat, 01 Oct 2022 07:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :from:to:cc:subject:date;
        bh=u76t+8U3Ggnf3x517yNjhvxFU5i+Z4R6OU2udZ42kxE=;
        b=g/B0/wnV+K7l94yTP+62+Qjr3I6btZk9G7v6YVRA19cOwmBMhSUugj3bjMbAgDqGBz
         JZRcy4MJoQbygJCeta+ivxLkDAagdfAc6QwAHjl+GX/qItIrsAsOhVqDAgD1oZjXlXhW
         zzSPJTjSHRiOI0xMQ7xeVGOYsFW6s8vDYkt+89T5jwyZTXoStt9BkH0Sa9JqZAYZpBvy
         zGOAcLVKKLWWtco7JlJ2iAu5NIbw0SNDtrSvInsz68ujSjqgWbj9+/Alex1+XH2T9Yj6
         S7DtZ+Kv6gizMQhyTXH0kKKv7pdqsxvwXOjyzmmUi1fXeW71Me83EEweDvNbU2TPOnc6
         rNpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date;
        bh=u76t+8U3Ggnf3x517yNjhvxFU5i+Z4R6OU2udZ42kxE=;
        b=ybTWComHVGGSNZJROjI9CFiprwjcLQpy98W0rw2bSoRV6Ie70INgeY18qqJsmvOEyq
         KWhkvMUnaUuIoxPu2ZYItiJByyl1HCi5d49acwOwk/Vy5Ks0++v6QqINPyLILSBXgv8X
         ae7PRjkBZ4uk/BqU8P0OthlJxN4v2v0GE91KVKE/WoMYpjHYsXLvWnsrLmg56DDFEmYT
         Wb8OxB48TDgc0N/BJ19BHgNcxB8hNqULgxYNz7WW+oZsEMs7hLhSqCHIS4HvxabWWeyg
         HetN6wPXrmvaZAwh/shS7Gvw237oROToj7X/+WFAfxcLWGjjDUl3UHTRj3Kk+aHgv3Jh
         BJdA==
X-Gm-Message-State: ACrzQf1ZTyqsG4z93Z8GAlXCI+Ei4VD51Xzy1qMn1C3OqtC8uF0hJ1OQ
        AwvGemw9Oi0vakycb+AA5g==
X-Google-Smtp-Source: AMsMyM6GcETl6wcUSYkN+4Tvhyes1qV4LFcjlOqd8HcSdJb9DnLa6kdxgirz1CtiJDQH4KG/AwZr1w==
X-Received: by 2002:a05:6000:78a:b0:22a:de8c:ff8d with SMTP id bu10-20020a056000078a00b0022ade8cff8dmr8279428wrb.559.1664636195236;
        Sat, 01 Oct 2022 07:56:35 -0700 (PDT)
Received: from octinomon ([2a00:23c8:2f02:3b01:3ea1:40:8650:189])
        by smtp.gmail.com with ESMTPSA id bs11-20020a056000070b00b0022a2bacabbasm5420223wrb.31.2022.10.01.07.56.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Oct 2022 07:56:34 -0700 (PDT)
From:   Jules Irenge <jbi.octave@gmail.com>
X-Google-Original-From: Jules Irenge <jules.irenge@postgrad.manchester.ac.uk>
Date:   Sat, 1 Oct 2022 15:56:33 +0100
To:     shuah@kernel.org
Cc:     valentina.manea.m@gmail.com, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org
Subject: [PATCH] usbip: vudc: Convert snprintf() to sysfs_emit()
Message-ID: <YzhVIaNGdM33pcts@octinomon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Coccinnelle reports a warning
Warning: Use scnprintf or sprintf

Following the advice on kernel documentation
https://www.kernel.org/doc/html/latest/filesystems/sysfs.html

For show(device *...) functions we should only use sysfs_emit() or sysfs_emit_at()
especially when formatting the value to be returned to user space.
Convert snprintf() to sysfs_emit()

Signed-off-by: Jules Irenge <jules.irenge@postgrad.manchester.ac.uk>
---
 drivers/usb/usbip/vudc_sysfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/usbip/vudc_sysfs.c b/drivers/usb/usbip/vudc_sysfs.c
index c95e6b2bfd32..907a43a00896 100644
--- a/drivers/usb/usbip/vudc_sysfs.c
+++ b/drivers/usb/usbip/vudc_sysfs.c
@@ -242,7 +242,7 @@ static ssize_t usbip_status_show(struct device *dev,
 	status = udc->ud.status;
 	spin_unlock_irq(&udc->ud.lock);
 
-	return snprintf(out, PAGE_SIZE, "%d\n", status);
+	return sysfs_emit(out, "%d\n", status);
 }
 static DEVICE_ATTR_RO(usbip_status);
 
-- 
2.37.3

