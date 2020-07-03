Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFF912131EE
	for <lists+linux-usb@lfdr.de>; Fri,  3 Jul 2020 04:55:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726169AbgGCCza (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Jul 2020 22:55:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726150AbgGCCz3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Jul 2020 22:55:29 -0400
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com [IPv6:2607:f8b0:4864:20::e41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB15BC08C5C1
        for <linux-usb@vger.kernel.org>; Thu,  2 Jul 2020 19:55:27 -0700 (PDT)
Received: by mail-vs1-xe41.google.com with SMTP id r5so16336198vso.11
        for <linux-usb@vger.kernel.org>; Thu, 02 Jul 2020 19:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=RWqJ+GuttV0mSBGf7O5OHrnoUgMsFnqqshF6IMXKSWs=;
        b=fGT04+gARNdEcSKule5SRYM8an4G1sVZwFFcWyxdqnCiYmZhGMozzAaVT4iwrYiRH8
         PX/ZCbxhRBMDwponEBp5EGYudfm30LsvasT/yMLkzUL2De5z2w8W3VqQWQWp5KVgveP8
         dU7Ezm5gbJ8uYJFcvAKmePCrkmInxYnfAATqVL/QuyqWmQOz4VHGx/bho4wKq90RptUU
         ipBbJCVMUAnMpYqZrW3qmQd1wGZK5m9y4GYKFHu+MtRUlR6PjztSIGhzBtfVSOsa0phQ
         8KJ/xqv9U1QuqSEilbMpyKAx1NVRNd720CV4Rx78mhQBGGKYap5GQhCejG2GC8YX7Ngh
         grAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=RWqJ+GuttV0mSBGf7O5OHrnoUgMsFnqqshF6IMXKSWs=;
        b=aP3GdllNdp4DhJsgkqz30GEUQw2V2nheR7YqWX/FKhvYxpB+OEDOXgSILkeTABZ8Go
         W+7GvRBUCEVn3yKYjb1SY1TD8brhxparl38Z490Rq8klToNP5othGCxwpJFd4EVBJMFL
         s7+zZT7E/XXv073HJaVUF9KnXpicAmKuSU8DrGQ7xY3pr/Jp+rUgNEs7e+jnWXyWfBvF
         u1AkR5Y4BNOCvulo3hsmYcdD9sJ7EJMefX3m48js5IVh9Mf5rOawJdyUA4+hKkpmXQyv
         MCDhRWubHnbLvlYLhnJsYpbKYBSbRsnY9h+ymWQIzS/xPwcYxX1xm/WAjBnmH1Avmo+V
         Enww==
X-Gm-Message-State: AOAM531xx4r8cbdZ8FUxVwIQ000sB1hkL7t47xiBqipZNaytzZAlQR9O
        vq/jT1R/n9IRfrDWNLwUsTRfQW8w7cs9uG3/h8M=
X-Google-Smtp-Source: ABdhPJzWI2POZ/2RDdEsTJXxK1x58i7yALFvSHlPbBJtYsVR0Vf5oMoqkLZkKKDcjS9Yvag0M5JAQixU5Y9ZQG9iB1A=
X-Received: by 2002:a67:2d8d:: with SMTP id t135mr4347785vst.23.1593744926856;
 Thu, 02 Jul 2020 19:55:26 -0700 (PDT)
MIME-Version: 1.0
References: <CALAqxLWAvvHGo1RYef1fJ_k65WqHAPCDhLfehO6_j_f8E2jB7Q@mail.gmail.com>
In-Reply-To: <CALAqxLWAvvHGo1RYef1fJ_k65WqHAPCDhLfehO6_j_f8E2jB7Q@mail.gmail.com>
From:   Jun Li <lijun.kernel@gmail.com>
Date:   Fri, 3 Jul 2020 10:55:15 +0800
Message-ID: <CAKgpwJV3pF0x6X6eUPVu4PnicTKta9qTQGsbaAZQ1rznZhkeLw@mail.gmail.com>
Subject: Re: dwc3 inconsistent gadget connection state?
To:     John Stultz <john.stultz@linaro.org>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Tejas Joglekar <tejas.joglekar@synopsys.com>,
        Yang Fei <fei.yang@intel.com>,
        Anurag Kumar Vulisha <anurag.kumar.vulisha@xilinx.com>,
        YongQin Liu <yongqin.liu@linaro.org>,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        Thinh Nguyen <thinhn@synopsys.com>,
        Linux USB List <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

John Stultz <john.stultz@linaro.org> =E4=BA=8E2020=E5=B9=B47=E6=9C=883=E6=
=97=A5=E5=91=A8=E4=BA=94 =E4=B8=8A=E5=8D=885:46=E5=86=99=E9=81=93=EF=BC=9A
>
> Hey Felipe,
>
>   I've been tripping over an issue on my HiKey960 where with the usb-c
> gadget cable connected, the gadget code doesn't consistently seem to
> initialize properly. I had rarely seen this behavior previously, but
> more recently it has become more frequent and annoying.
>
> Usually, unplugging and replugging the USB-C cable would get things
> working again (but that's not helpful in test labs).
>
> I annotated a bunch of code trying to understand what was going on and
> I narrowed down the difference in the good and bad case to a dwc3
> reset interrupts happening after usb_gadget_probe_driver() completes.
> In the good case, we see the reset interrupts, and in the failed case
> we don't.
>
> [   16.491953] JDB: usb_gadget_probe_driver
> [   16.495938] JDB: udc_bind_to_driver
> [   16.499555] JDB: dwc3_gadget_start irq: 65 revision: 1429417994
> [   16.503803] JDB: __dwc3_gadget_ep_enable
> [   16.507791] JDB: __dwc3_gadget_ep_enable
> [   16.511715] JDB: dwc3_gadget_enable_irq
> [   16.515582] JDB: usb_udc_connect_control
> [   16.519510] JDB: usb_gadget_connect
> <in the bad case, this is all we see, the gadget device doesn't come up>
> [   16.811010] JDB: dwc3_gadget_interrupt
> [   16.814783] JDB: dwc3_gadget_reset_interrupt
> [   16.819047] JDB: dwc3_reset_gadget
> [   16.823935] JDB: dwc3_gadget_interrupt
> [   16.827686] JDB: __dwc3_gadget_ep_enable
> [   16.831611] JDB: __dwc3_gadget_ep_enable
> [   16.994477] JDB: dwc3_gadget_interrupt
> [   16.998246] JDB: dwc3_gadget_reset_interrupt
> [   17.002519] JDB: dwc3_reset_gadget
> [   17.005922] JDB: usb_gadget_udc_reset
> [   17.062422] JDB: usb_gadget_set_state  state: 5
> [   17.067069] JDB: dwc3_gadget_interrupt
> [   17.070823] JDB: __dwc3_gadget_ep_enable
> [   17.074745] JDB: __dwc3_gadget_ep_enable
> [   17.170898] JDB: usb_gadget_set_state  state: 6
> [   17.195605] JDB: usb_gadget_set_state  state: 7
> [   17.200179] JDB: __dwc3_gadget_ep_enable
> [   17.204118] JDB: __dwc3_gadget_ep_enable
> [   17.208057] JDB: usb_gadget_vbus_draw
> [   17.211721] JDB: usb_gadget_set_state  state: 7
> <in the good case everything is happy here>
>
>
> This sounds a bit like the issue in the comment here:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/d=
rivers/usb/dwc3/gadget.c?h=3Dv5.8-rc3#n3143
>
> However, I've tried calling dwc3_gadget_reset_interrupt() and
> dwc3_reset_gadget() at the tail end of dwc3_gadget_start() but that
> doesn't seem to help.
>
> I was curious if you or anyone else had any thoughts on how to debug
> this further?

If you force your gadget to be USB2(e.g. in dts)

+       maximum-speed =3D "high-speed";

will you still reproduce this issue?

Does your gadget connect to host super speed port directly via a C-to-A cab=
le
in your test labs? or there is something between?

Li Jun
>
> thanks
> -john
