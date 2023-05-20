Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2041A70A72F
	for <lists+linux-usb@lfdr.de>; Sat, 20 May 2023 12:35:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230325AbjETKe6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 20 May 2023 06:34:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229568AbjETKe5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 20 May 2023 06:34:57 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C371198
        for <linux-usb@vger.kernel.org>; Sat, 20 May 2023 03:34:56 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3095b1b6e02so614779f8f.2
        for <linux-usb@vger.kernel.org>; Sat, 20 May 2023 03:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684578894; x=1687170894;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=av/T+jOYWv+vEFvnYffiiaRUKFLDEkBM81OSePg1FTk=;
        b=N8BWzznLysRb2ORRLjogs4n10FXs8kDOLg9urSSU7ZZELU7Fr1XbFn+ZnJcygwwB+X
         hNUz++n3ZYN/IYK5Q6rvnxkCtZ91D690JjXRr92hMfZHbKQ7CySV6RLx7TAo01xsBoDQ
         Ro3eJUAr+E0BeQYQ7HviM8t6oL0bn9aXAnxzqTJy4UxzpZJr5gK11PVWpXC/rDUGU3SA
         RhD8ukDFgNmlvEAJaVpMFmF4+uqSk9F+KU225JQXtIu10iR1shr2wwntgBIK/5ht/sNR
         J45nstYXQjQub2HacfbLMwrHrfMsk1GbVCpWIap1AzdpCA4RnFC5pyzDkr7xHyVs2OI/
         TD/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684578894; x=1687170894;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=av/T+jOYWv+vEFvnYffiiaRUKFLDEkBM81OSePg1FTk=;
        b=ilKmorbweF54fI0hr9lcRSMIv3ZZdVta8FXaM0o8vAt+U7//YSVvxdNeoq1OjfNB5U
         W64s5SQGJ43sm2KhwUcSMyAi8AFSAsyQ610nUW3W7uwkT7cmnQ2JD1JMP1Me2scubuhq
         m/CUflHBWHHzAbvH2P0LlmezPBVqC8WRINz52iXTGY43g8TtGteVmye5iIQSvhQb554Q
         1U1yN5Jp1+WBBHMX6xPkA+TH8m6uUv+gOfVT3gCJd3v+MtPJ6o86Y/RtS7z6EWij0oMA
         G6osk61uGQ2DpMmvI+gKUew0mLwTCFolVWkieo1wzYXgSHip8VFmgqLVRN6Sz0QT8C7O
         eAcA==
X-Gm-Message-State: AC+VfDxcFqj9/BKuxE+NV+TCEmTxzi6QCVERfoprSMiysKkjeBfCjyZy
        1zFjU4/b35rpnm/h+i5EQaMI2SMz0jBJ4eR0JeI=
X-Google-Smtp-Source: ACHHUZ59qNMpRJ3vmc2o2cDCnC1ylgG87hsF/LKOH91hmC2zp7d9sv02oBZexKvpoEzqixE1Z4SZ3A==
X-Received: by 2002:adf:fc44:0:b0:307:a075:2709 with SMTP id e4-20020adffc44000000b00307a0752709mr3069852wrs.68.1684578894696;
        Sat, 20 May 2023 03:34:54 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id i10-20020adfe48a000000b002fed865c55esm1577553wrm.56.2023.05.20.03.34.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 May 2023 03:34:52 -0700 (PDT)
Date:   Sat, 20 May 2023 13:34:43 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     stern@rowland.harvard.edu
Cc:     linux-usb@vger.kernel.org
Subject: [bug report] USB: gadget: Fix obscure lockdep violation for udc_mutex
Message-ID: <683df726-4510-4a79-968a-b238e21c4346@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello Alan Stern,

The patch 1016fc0c096c: "USB: gadget: Fix obscure lockdep violation
for udc_mutex" from Aug 26, 2022, leads to the following Smatch
static checker warning:

	drivers/usb/gadget/udc/core.c:767 usb_gadget_disconnect()
	warn: sleeping in atomic context

drivers/usb/gadget/udc/core.c
    757                  * Gadget will stay disconnected after activation.
    758                  */
    759                 gadget->connected = false;
    760                 goto out;
    761         }
    762 
    763         ret = gadget->ops->pullup(gadget, 0);
    764         if (!ret)
    765                 gadget->connected = 0;
    766 
--> 767         mutex_lock(&udc_lock);
    768         if (gadget->udc->driver)
    769                 gadget->udc->driver->disconnect(gadget);
    770         mutex_unlock(&udc_lock);
    771 

The call tree where we're holding a spinlock is:

max3420_vbus_handler() <- disables preempt
-> usb_udc_vbus_handler()
   -> usb_udc_connect_control()
      -> usb_gadget_disconnect()

regards,
dan carpenter
