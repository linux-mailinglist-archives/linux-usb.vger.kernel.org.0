Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4DDEC569EC3
	for <lists+linux-usb@lfdr.de>; Thu,  7 Jul 2022 11:43:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235162AbiGGJnW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 7 Jul 2022 05:43:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233783AbiGGJnV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 7 Jul 2022 05:43:21 -0400
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com [IPv6:2001:4860:4864:20::2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C20345070
        for <linux-usb@vger.kernel.org>; Thu,  7 Jul 2022 02:43:21 -0700 (PDT)
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-10bec750eedso16929541fac.8
        for <linux-usb@vger.kernel.org>; Thu, 07 Jul 2022 02:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=Fei5ldd1DMp40UpYey+IXPJbTXnAtUnFZhG4+jmAP/s=;
        b=GVdAxiuimo/PtedpAVWzJdvqeTJfTfSqOOFtOjNB0+yJwa0cB6waY7v3uaZN4rM07D
         jmrvfbXd+ie2TFtaM+/ivobvduiTaOEJq7KfeyfKJGGSAQHmvYN14T/i3rziUYvWnGl2
         GbDISHfsnHA3X1aBabP7BCjL8cGGdEBLWQ7uWMeOi1h3SJqf8oYRj8/n6aMC3VKU/wBZ
         d/POvdPYZ3GY/ebbnrkY39wmUQ6OF+X421emK6NngJQp6apqJUE/snvFWNedUDZdNQLC
         RqVoDewKp0y7UyWmhj3fdyCELvNdmiozyG0yTmdH71abQM7knbkEAJ6X/aF9Gj+iB5Gi
         GJQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=Fei5ldd1DMp40UpYey+IXPJbTXnAtUnFZhG4+jmAP/s=;
        b=F4DaHKuH1/DaY51v6sDM7tqIt4fRpLvqgfpfqTT/b8rO36e0MVLZ9iiFhi6K/dz3vo
         rsyiONynQs/GedOWQpLz6uGwKVDleT05BpoCEAVW06jXsSwIJdob8Ub1Fu7anf+BiJ8N
         zATdONPxHYClQn1Dp9Pm9wrYQf+SdAj5YMVO46R/lVO5nUxiDjL47YB0L8/KM1OEElNB
         ohSnmStCr5l9FeYnboWbM7uUDO+yOj7Ai/JWiHEmfq1j02AlJcld3c/HFc8+LfntQYKU
         GFwnN6ilTW4hntNfpkPBKcxzHnXtK9O/anI7FpG3aPv2ZgjGI6XG/1b35QooT4aZxlqD
         cyrA==
X-Gm-Message-State: AJIora+RkL5VtdNL1hC+/8RLJfSths0bR5RxZvmfhMfoTzs4wZXYPoJR
        hkNeXza2cpiaxkkg5ErxEmkwud52sITN0iSLanesetJucqw=
X-Google-Smtp-Source: AGRyM1sR9UX2zyOCgaROEoYEvFeEpDQHO3kMhsHpQwlNNRFN6ra6Yn2C8iQIEintGEiotufwJ7co9c1bI08u1nYvtiI=
X-Received: by 2002:a05:6870:b30a:b0:10c:190d:b32f with SMTP id
 a10-20020a056870b30a00b0010c190db32fmr2235177oao.14.1657187000630; Thu, 07
 Jul 2022 02:43:20 -0700 (PDT)
MIME-Version: 1.0
From:   "Jozo M." <jomajm@gmail.com>
Date:   Thu, 7 Jul 2022 11:43:09 +0200
Message-ID: <CA+BOZ0uBvKHc3idN+Pn_g4Z4e5ObYPZ4WY4f78fzj_B=8c5qJw@mail.gmail.com>
Subject: gadgetfs inode.c - possible memory corruption ?
To:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

my kernel running on imx6 was crashing on USB gadgetfs because my
kernel was using wait_event API instead of completion (I was convinced
it is due to wrong HW setup).
During research gadgetfs inode.c function ep_io was not clear for me:

we are submiting USB request here
      value = usb_ep_queue (epdata->ep, req, GFP_ATOMIC);
then we are waiting for completion here:
      value = wait_for_completion_interruptible(&done);
but if completion is interrupted we end up here:
      spin_unlock_irq (&epdata->dev->lock);
      DBG (epdata->dev, "endpoint gone\n");
      epdata->status = -ENODEV;

At this point ep_io is terminated and stack is not valid. Later on
epio_complete might be called from IRQ and it calls complete ((struct
completion *)req->context) but stack is no longer valid;
Shouldn't we put req->context = NULL;  before spin_unlock_irq
(&epdata->dev->lock); ?
      req->context = NULL;
      spin_unlock_irq (&epdata->dev->lock);
      DBG (epdata->dev, "endpoint gone\n");
      epdata->status = -ENODEV;

Thanks,
Jozef
