Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1036369941A
	for <lists+linux-usb@lfdr.de>; Thu, 16 Feb 2023 13:16:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229964AbjBPMQN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 16 Feb 2023 07:16:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229561AbjBPMQM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 16 Feb 2023 07:16:12 -0500
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66888270F;
        Thu, 16 Feb 2023 04:16:11 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id c1so2519868edt.4;
        Thu, 16 Feb 2023 04:16:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EbvmtuNwS3/dsrG/u4fvnYPw2qS6adCghBRkCaNErR0=;
        b=n3FSV2+0RSYgLQ/igTpgUG5opVXJhff2ITeG3DGkqv0e3Hh+ejo3zeqhouw1yfj0o5
         A7PlfzjNAW13/ee9/p9fk0JdQlqCqWxshs5x6lj92anQ8SjQ9q7ThP6NQYPIDJEAE/YL
         9N5nE8X7KsoOwZOtQ/XH4y5ahJ8JejEysbOPJ5dmEpzABL0e41aRX/mXJvzj7uqtj7SZ
         MXq3cgqUUdQUwWYS3qNHSznGDsDyi/TW2LGzGbT5gD2PNMOGMx2zt9uREL5dxmw1umnA
         7cANpstwRoGJNfALlNldYiNE5unSxvIoGbwu/QdVaLK4trV1Bt8EESmqEQFNn3YfPhVN
         GljA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EbvmtuNwS3/dsrG/u4fvnYPw2qS6adCghBRkCaNErR0=;
        b=I7xyuW2cT0bzBb/uO3UgfAsgVz8j9Rn5E4VqM/EBPpUgtH2mi2GaQBnwWFh52woBrN
         uHNmIsqXliLl0VFcxGd2mzOUyBrVTJOBtqW2bY07OVjz+FZ+v30VOHRRQ5EfHHLSHdgz
         zFTfu3NI+26R4CB3lH9JblUOriNq/0HXfcVky25M5V7xCcYAFFhz/oU5iSJeeTB/fzmK
         pnEDw2sTSlnay7aqUIbcAsYrEivcRogmiJtWDm/oDsAQMneptO0e1etgvrYt40SbrGkd
         sAmgYCxLGPllvAqL5D5FBhwtmgnHGJDJZS5e6pzhMO9vzI3Z+L/WUnrHECfe3Yt88mzE
         iLEQ==
X-Gm-Message-State: AO0yUKUTdEplLGgV8sHPThhEGq2I6zoox+tvjnJ3P0zxVDf/H8Qjb/+r
        GDHhMMW2LtuEqwVQZTmXht8=
X-Google-Smtp-Source: AK7set+MZaKMAueIo+Wa0CW/YU2VjhO2HzL1sA6pm4GwovsHtXJhXB8PlhaKYO4+1iy3PxcmKEXydA==
X-Received: by 2002:a05:6402:885:b0:4ac:b97f:214c with SMTP id e5-20020a056402088500b004acb97f214cmr5203363edy.2.1676549769905;
        Thu, 16 Feb 2023 04:16:09 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id y7-20020a50ce07000000b004a21304f5a0sm768887edi.72.2023.02.16.04.16.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 04:16:09 -0800 (PST)
Date:   Thu, 16 Feb 2023 15:16:04 +0300
From:   Dan Carpenter <error27@gmail.com>
To:     Daniel Scally <dan.scally@ideasonboard.com>
Cc:     Daniel Scally <dan.scally@ideasonboard.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] usb: gadget: uvc: unlock on an error paths
Message-ID: <Y+4ehE7/GgnRZuo0@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This code accidentally returns without dropping the "su_mutex" if
kstrtou8() fails.  It's probably better to just do the kstrtou8() before
taking the lock.

Fixes: b3c839bd8a07 ("usb: gadget: uvc: Make bSourceID read/write")
Fixes: 0525210c9840 ("usb: gadget: uvc: Allow definition of XUs in configfs")
Signed-off-by: Dan Carpenter <error27@gmail.com>
---
 drivers/usb/gadget/function/uvc_configfs.c | 31 +++++++++++-----------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/drivers/usb/gadget/function/uvc_configfs.c b/drivers/usb/gadget/function/uvc_configfs.c
index 18c6a1461b7e..a59c1a95bfcd 100644
--- a/drivers/usb/gadget/function/uvc_configfs.c
+++ b/drivers/usb/gadget/function/uvc_configfs.c
@@ -590,6 +590,10 @@ static ssize_t uvcg_default_output_b_source_id_store(struct config_item *item,
 	int result;
 	u8 num;
 
+	result = kstrtou8(page, 0, &num);
+	if (result)
+		return result;
+
 	mutex_lock(su_mutex); /* for navigating configfs hierarchy */
 
 	opts_item = group->cg_item.ci_parent->ci_parent->
@@ -597,10 +601,6 @@ static ssize_t uvcg_default_output_b_source_id_store(struct config_item *item,
 	opts = to_f_uvc_opts(opts_item);
 	cd = &opts->uvc_output_terminal;
 
-	result = kstrtou8(page, 0, &num);
-	if (result)
-		return result;
-
 	mutex_lock(&opts->lock);
 	cd->bSourceID = num;
 	mutex_unlock(&opts->lock);
@@ -707,15 +707,15 @@ static ssize_t uvcg_extension_b_num_controls_store(struct config_item *item,
 	int ret;
 	u8 num;
 
+	ret = kstrtou8(page, 0, &num);
+	if (ret)
+		return ret;
+
 	mutex_lock(su_mutex);
 
 	opts_item = item->ci_parent->ci_parent->ci_parent;
 	opts = to_f_uvc_opts(opts_item);
 
-	ret = kstrtou8(page, 0, &num);
-	if (ret)
-		return ret;
-
 	mutex_lock(&opts->lock);
 	xu->desc.bNumControls = num;
 	mutex_unlock(&opts->lock);
@@ -742,14 +742,15 @@ static ssize_t uvcg_extension_b_nr_in_pins_store(struct config_item *item,
 	int ret;
 	u8 num;
 
+	ret = kstrtou8(page, 0, &num);
+	if (ret)
+		return ret;
+
 	mutex_lock(su_mutex);
 
 	opts_item = item->ci_parent->ci_parent->ci_parent;
 	opts = to_f_uvc_opts(opts_item);
 
-	ret = kstrtou8(page, 0, &num);
-	if (ret)
-		return ret;
 
 	mutex_lock(&opts->lock);
 
@@ -795,15 +796,15 @@ static ssize_t uvcg_extension_b_control_size_store(struct config_item *item,
 	int ret;
 	u8 num;
 
+	ret = kstrtou8(page, 0, &num);
+	if (ret)
+		return ret;
+
 	mutex_lock(su_mutex);
 
 	opts_item = item->ci_parent->ci_parent->ci_parent;
 	opts = to_f_uvc_opts(opts_item);
 
-	ret = kstrtou8(page, 0, &num);
-	if (ret)
-		return ret;
-
 	mutex_lock(&opts->lock);
 
 	if (num == xu->desc.bControlSize) {
-- 
2.39.1

