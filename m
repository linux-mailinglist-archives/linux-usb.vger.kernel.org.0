Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA9EB6A0D88
	for <lists+linux-usb@lfdr.de>; Thu, 23 Feb 2023 17:05:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233852AbjBWQFt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 Feb 2023 11:05:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233162AbjBWQFs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 23 Feb 2023 11:05:48 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3716A4E5EE
        for <linux-usb@vger.kernel.org>; Thu, 23 Feb 2023 08:05:48 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id y2so9242481pjg.3
        for <linux-usb@vger.kernel.org>; Thu, 23 Feb 2023 08:05:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jVRvJBZ8jwdKziKMkGDOxl1cAgsAeqM1LPB86fDX0rE=;
        b=SBm+pmDAEK2E+n4LinMUySlof/VHcrV52IrzBdTpoKz8R5c/BWzVXvnBrkWB1Pzo7j
         mqCc86MgWD8/dsdUx4CtHB8m8IK25l4Wyoj+G+3EB1mUDnFcF5pbdE8s6++l1X9uBKMN
         PkRup+k9vbyxr5ItwPglAAZzTEoP4cgwhHtGEAKv8EHeMMcW2o+N6msdvJFb8gXvbWTu
         91IihLgSnCcRG+kyZDT5GuKKrlsNX2rgVyN78fhPBin4iO9b0pqADQo6YSERDQRlhF6b
         59edbkdTwahGM4O+JgTKuDOVlggUEIUXosmUUmUSmQ2T5XHrH+71Jgn5nSIH2xAiJLiD
         uZ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jVRvJBZ8jwdKziKMkGDOxl1cAgsAeqM1LPB86fDX0rE=;
        b=aB7aM3913goZIikhrG1W7GZbzI7qupqMJ11/DOOJ5P5A6wDPtWGEPJPEUS82nNsvRy
         HZ/rpPoxfwQOtiWGQsUuLxnd3vrPK4o1Fa/MpqVJocFK17sMXvIMEash8k0z4+Ru7NJ8
         pWIFH/AwGZUbogdrNcezCfzQY7NFNmPVOFAszhgHPkEH47hCLMBUgrPnzj2YfWwykTbD
         DOjZ9UxQxQTGCFECOV4wA0LOovMHVTcUuwJvFeE61gXo0ZE6l4mgel+zMmpv9f3QdVo7
         jXf5+MUtOAQEF0KxrKWLZ2Nx8MNsGAGyEqBEygmCxEn02d7jv6aoz3vUxByCXFKnbwZ2
         vjzw==
X-Gm-Message-State: AO0yUKX8xh1drT7BQmVCYUv8qAziklXKaSssZmVqNuPeAnM6r7QB0oEh
        h0EMuON5TzuUJbYfw6KK5XAq4tJkME0Txw/tIds=
X-Google-Smtp-Source: AK7set/j9ahcEto89gykLulP7ESCFLy+7QB8eek/zj3BB8SvhNqYJNGGQclIVexsWWF7j6ICNKLOcCGhLARi185ZB+s=
X-Received: by 2002:a17:90a:1703:b0:234:87a7:f180 with SMTP id
 z3-20020a17090a170300b0023487a7f180mr553526pjd.0.1677168347665; Thu, 23 Feb
 2023 08:05:47 -0800 (PST)
MIME-Version: 1.0
References: <CA+JN8xMXu=sVQ2nyR9SgF25fquCZhH43wdsnuvfjDu+yGRv2yA@mail.gmail.com>
 <b13655bf-4a04-bece-71e4-698bfec83e2d@linux.intel.com> <CA+JN8xOOyU8yLJrxnKPwAMhQFKE70rTi=aLa3Adt7Og4dfPRVg@mail.gmail.com>
 <Y/eKwvQAihZYKUos@rowland.harvard.edu>
In-Reply-To: <Y/eKwvQAihZYKUos@rowland.harvard.edu>
From:   Seth Bollinger <seth.boll@gmail.com>
Date:   Thu, 23 Feb 2023 10:05:36 -0600
Message-ID: <CA+JN8xOWzo8ugtzyrAeSB5wN7XSxXs1-69kTZyJ-ZSPLTvFx-A@mail.gmail.com>
Subject: Re: HC died
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Mathias Nyman <mathias.nyman@linux.intel.com>,
        linux-usb@vger.kernel.org, sethb@digi.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

> Note that the USB-2.0 spec says (section 9.2.6.3, Set Address
> Processing):
>
>         After the reset/resume recovery interval, if a device receives a
>         SetAddress() request, the device must be able to complete
>         processing of the request and be able to successfully complete
>         the Status stage of the request within 50 ms.
>
> These devices' 9.6 seconds to process a Set-Address request is a _lot_
> longer than 50 ms.  No wonder they don't work properly.  Why on earth do
> they take so long?

The device can't actually respond as it's no longer present on the
bus.  The hardware is taking this long to complete the TRB when the
device disappears in the middle of the transaction (at least this is
the theory).

I'm not trying to argue that these devices aren't crappy.  However, it
does seem like there are quite a lot of crappy devices in the field.
It would be nice if the driver didn't die when encountering these
devices.

> Of course, xHCI controller drivers should be able to cancel an
> Address-Device TRB without waiting for it to complete.

Agreed.  Is there some way I could try to cancel this command ring
TRB?  The hardware seems hung enough that it's not responding to
whatever we're trying to do in the cleanup routine when the timeout
handler fires though.

>
> Alan Stern
