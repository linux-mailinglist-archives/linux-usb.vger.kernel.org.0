Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF99968F106
	for <lists+linux-usb@lfdr.de>; Wed,  8 Feb 2023 15:41:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231436AbjBHOl5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 8 Feb 2023 09:41:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231533AbjBHOlz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 8 Feb 2023 09:41:55 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1901F4480
        for <linux-usb@vger.kernel.org>; Wed,  8 Feb 2023 06:41:54 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id a2so16709406wrd.6
        for <linux-usb@vger.kernel.org>; Wed, 08 Feb 2023 06:41:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pWM3HyfvBVYQD0vQBZdJOqOQmDtEYI+2l3tCHtvAz28=;
        b=h7fsgITe5u97lLA1jfBUxqqaTeppslRzRCIsyFO76p4DlqjIQLX23wh3PkRl+NpEgC
         t/gwdsZnhiO1IQbSZ3AZJ8SuRSHU1MkQlGYxv/GcFszUUJMQmu3sBJGDwPm647crAPKt
         emosr+72ebzSt6EN5Me5BHToUX+t8nt9zpaUnVYJxutnJl8oWP+1FibzHC/9UGkMS/VL
         vAmZsoCXdBOmo4bIImbIRjGN1WVosiURT3pEGBvX8N3ghnrXUSGMxK0LUW34o0fNOyQC
         w5ifqjPb1yMwMTizJYqcwYiEdy3iOJeFQJsN0nWR5QpIrGu6+wvTQXZtzPYJLhb95ali
         bvQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pWM3HyfvBVYQD0vQBZdJOqOQmDtEYI+2l3tCHtvAz28=;
        b=JYqCKz48s4YnaNI2MqCnLCjZtdJiTg3eSiZ8JR+auMj7NNzKzY3pcO55HQh0t6EF3t
         wGfxd8YaFNIfP0LZGBoHg232tyTOd8O1lEmoaK6hm6X2Q7kkQjWs3diJ+PXZDLnpngM0
         sSeqkjdQ7uncL9Cv/ylgHj6+h3FFZrd6/Id+Ksst9qqVZq+BQFb0DGYkDEAxjPkIEud6
         BB8TmuNGlJZ/lIn1fUmiD9hDpEwTu9LKGWbLMTxdvkg+KmAZZvg+kYChLBRFCTBULKIG
         cqjO7C7/FL5XKytFtjok9anxd5yMOh3ObI8tWpyIJ9orP6dPeeVKxTljv/1ZHg6CH1G7
         tvXg==
X-Gm-Message-State: AO0yUKXN5XAwc76/9dNyFTUSvCGyMDGo9RD1rA1WE+glYtRQS1u5MPxz
        7gpBh9QeJxdKIto+spZ4c48=
X-Google-Smtp-Source: AK7set9EbL+fpLITKBFy5tiBfUiCPoXuXd0Y+MEP2nn2yfj+sfAhZWfQ3z3P7wce3bfn4A3yldDlhQ==
X-Received: by 2002:adf:df11:0:b0:2bf:abce:ba26 with SMTP id y17-20020adfdf11000000b002bfabceba26mr6666574wrl.71.1675867312667;
        Wed, 08 Feb 2023 06:41:52 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id c63-20020a1c3542000000b003df14531724sm2226481wma.21.2023.02.08.06.41.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Feb 2023 06:41:52 -0800 (PST)
Date:   Wed, 8 Feb 2023 17:41:38 +0300
From:   Dan Carpenter <error27@gmail.com>
To:     jaswinder.singh@linaro.org
Cc:     linux-usb@vger.kernel.org
Subject: [bug report] usb: gadget: add udc driver for max3420
Message-ID: <Y+O0oviHe2CogH3M@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello Jassi Brar,

The patch 48ba02b2e2b1: "usb: gadget: add udc driver for max3420"
from Jan 21, 2020, leads to the following Smatch static checker
warning:

	drivers/usb/gadget/udc/max3420_udc.c:1307 max3420_remove()
	warn: sleeping in atomic context

drivers/usb/gadget/udc/max3420_udc.c
    1298 static void max3420_remove(struct spi_device *spi)
    1299 {
    1300         struct max3420_udc *udc = spi_get_drvdata(spi);
    1301         unsigned long flags;
    1302 
    1303         usb_del_gadget_udc(&udc->gadget);
    1304 
    1305         spin_lock_irqsave(&udc->lock, flags);
                 ^^^^^^^^^^^^^^^^^

    1306 
--> 1307         kthread_stop(udc->thread_task);
                 ^^^^^^^^^^^^
We can't call thread_stop() if we're holding a spin_lock because it
has a sleep while we wait_for_completion(&kthread->exited).

    1308 
    1309         spin_unlock_irqrestore(&udc->lock, flags);
    1310 }

Similar issue:

drivers/usb/gadget/udc/core.c:740 usb_gadget_disconnect() warn: sleeping in atomic context
max3420_vbus_handler() <- disables preempt
-> usb_udc_vbus_handler()
   -> usb_udc_connect_control()
      -> usb_gadget_disconnect()

regards,
dan carpenter
