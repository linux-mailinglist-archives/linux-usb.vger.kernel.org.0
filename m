Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AAD9373409F
	for <lists+linux-usb@lfdr.de>; Sat, 17 Jun 2023 14:10:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231877AbjFQMKD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 17 Jun 2023 08:10:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230312AbjFQMKC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 17 Jun 2023 08:10:02 -0400
Received: from mail-vk1-xa29.google.com (mail-vk1-xa29.google.com [IPv6:2607:f8b0:4864:20::a29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43F3519A6
        for <linux-usb@vger.kernel.org>; Sat, 17 Jun 2023 05:10:01 -0700 (PDT)
Received: by mail-vk1-xa29.google.com with SMTP id 71dfb90a1353d-471632450d1so220252e0c.0
        for <linux-usb@vger.kernel.org>; Sat, 17 Jun 2023 05:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1687003800; x=1689595800;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LRanvYrfBlIp6v2FrVHXQis8guqVRk+w5oS8fGksbKk=;
        b=IQsj9HQnGBn/JnaqyOQYNivJfuUhb2T5+Tan7DIeCcmjYvouKEpfQ72ABnMuvHGa9s
         scZW0ZGjFP1XFFaZvA1H6U5dRcWcKhJH+92lUQpIaXTulQ8okwAMBHmhtiHh5QDzddu1
         xEO1w5LA1FiyaVM1ZReKSLSwX7Gvt7ccqKCjU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687003800; x=1689595800;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LRanvYrfBlIp6v2FrVHXQis8guqVRk+w5oS8fGksbKk=;
        b=Zd6B0a8r3echqJvY/Q1+3zPwVlaecQ+CPyJP7I2CVJ2VBxXCWh0ueoR3PUWQ/r0lvg
         3EaocOjR+EgV66fNAikwip9OZY6V7eEDfE/pKugO5JzEWYaZjhaNPse/OKgtMBk2X7Yb
         l0owYyy9yye6T0uqoivjaYkJixbMykexQADbZ7N212NbH61FD7TQKe8R7HfvkdGCft+G
         3ekEJgDSEqJR1m0xMvkp5lKeDa8geuy7wmtjmh0lAJBnLL1DHnJYet8occOYyOEmMDMZ
         lmZl9QtrcoDMypRPHaelEmV5fw5nJi2uLAWnVby8EVRiD5d2aYidhTmMThBVnd0dGPso
         6Rmg==
X-Gm-Message-State: AC+VfDwO1K/TAKmr+yWIx0QWL/IBdKhrUTOUszwF0rXzFV1nEXY3ppra
        gTv9dIrNzoqDbhUd4xuFBEi6j/XHQW+GX/Qm2bE=
X-Google-Smtp-Source: ACHHUZ6NLSgAZpz2uP2rz6Unc1mkvVYh6RalWyJBPx0vkE3YEXKpTKecQI8RqE1egddmktT3VbkxNg==
X-Received: by 2002:a1f:6093:0:b0:471:5cb5:11fd with SMTP id u141-20020a1f6093000000b004715cb511fdmr783604vkb.8.1687003800065;
        Sat, 17 Jun 2023 05:10:00 -0700 (PDT)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com. [209.85.221.171])
        by smtp.gmail.com with ESMTPSA id u7-20020a1fab07000000b004681ed4d3c7sm2829105vke.22.2023.06.17.05.09.58
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Jun 2023 05:09:58 -0700 (PDT)
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-4717a1d07fdso29319e0c.1
        for <linux-usb@vger.kernel.org>; Sat, 17 Jun 2023 05:09:58 -0700 (PDT)
X-Received: by 2002:a67:f408:0:b0:440:a867:add9 with SMTP id
 p8-20020a67f408000000b00440a867add9mr30055vsn.3.1687003797989; Sat, 17 Jun
 2023 05:09:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230531-xhci-deadlock-v1-1-57780bff5124@chromium.org>
 <14d94fa1-1499-de1f-c924-9b823a606580@linux.intel.com> <CANiDSCuTYRUfW8tLbPDq3dE+F7Wno5oc4C9qESMmTpaNyW-54Q@mail.gmail.com>
 <e153b3e8-6c0a-a142-c357-eb295eecdece@linux.intel.com>
In-Reply-To: <e153b3e8-6c0a-a142-c357-eb295eecdece@linux.intel.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Sat, 17 Jun 2023 14:09:46 +0200
X-Gmail-Original-Message-ID: <CANiDSCt2YYOM7DPv4Qjghv5Y2TPMbWTccM7jubcaNmU4Qd_G6g@mail.gmail.com>
Message-ID: <CANiDSCt2YYOM7DPv4Qjghv5Y2TPMbWTccM7jubcaNmU4Qd_G6g@mail.gmail.com>
Subject: Re: [PATCH] xhci: Do not create endpoint debugfs while holding the
 bandwidth mutex
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
Cc:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Stephen Boyd <swboyd@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Mathias

Thanks for looking into this.  Relooking into the bug queue->mutex was
only bothering due to a downstream patch (that we are working on
upstreaming), so this should not affect upstream.

Sorry for  the noise :S

On Mon, 12 Jun 2023 at 16:28, Mathias Nyman
<mathias.nyman@linux.intel.com> wrote:
>
> On 1.6.2023 19.05, Ricardo Ribalda wrote:
> > Hi Mathias
> >
> > On Thu, 1 Jun 2023 at 16:13, Mathias Nyman
> > <mathias.nyman@linux.intel.com> wrote:
> >>
> >> Do you still have the lockdep output showing the deadlock?
> >
> > [  459.731142] ======================================================
> > [  459.731150] WARNING: possible circular locking dependency detected
> > [  459.731161] 5.4.169-lockdep-17434-g505c8a10e6fe #1 Not tainted
> > [  459.731168] ------------------------------------------------------
> > [  459.731176] syz-executor.3/15308 is trying to acquire lock:
> > [  459.731184] ffffff80c63e0ee0 (&queue->mutex){+.+.}, at:
> > uvc_queue_mmap+0x30/0xa0 [uvcvideo]
> > [  459.731226]
> >                 but task is already holding lock:
> > [  459.731232] ffffff80a748eea8 (&mm->mmap_sem){++++}, at:
> > vm_mmap_pgoff+0x10c/0x1f4
> > [  459.731255]
> >                 which lock already depends on the new lock.
> >
> ...
> > [  459.732148] Chain exists of:
> >                   &queue->mutex --> &sb->s_type->i_mutex_key#4 --> &mm->mmap_sem
> >
> > [  459.732165]  Possible unsafe locking scenario:
> >
> > [  459.732172]        CPU0                    CPU1
> > [  459.732178]        ----                    ----
> > [  459.732184]   lock(&mm->mmap_sem);
> > [  459.732193]                                lock(&sb->s_type->i_mutex_key#4);
> > [  459.732204]                                lock(&mm->mmap_sem);
> > [  459.732212]   lock(&queue->mutex);
> > [  459.732221]
> >                  *** DEADLOCK ***
> >
> >>
> >> I'm not sure how calling xhci_debugfs_create_endpoint() from
> >> xhci_add_endpoint() instead of xhci_check_bandwidth() helps.
> >>
> >> Both are called with hcd->bandwidth_mutex held:
> >>
> >> usb_set_interface()
> >>          mutex_lock(hcd->bandwidth_mutex);
> >>          usb_hcd_alloc_bandwidth()
> >>                  hcd->driver->add_endpoint()    -> xhci_add_endpoint()
> >>                  hcd->driver->check_bandwidth() -> xhci_check_bandwidth()
> >>          mutex_unlock(hcd->bandwidth_mutex);
> >
> > Yep, I guess I was lucky not to be able to repro again :)
> >
> > The locks involved are:
> >
> > hcd->bandwidth_mutex
> > mm->mmap_sem
> > [uvc] queue->mutex
> >
>
> Ok, took a look at this.
> I don't think the bandwidth mutex matters that much.
>
> To my understanding this is caused by the following lock chains:
>
> ucv_queue_mmap()
>    mmap_sem --> queue->mutex
>
> uvc_ioctl_streamon() calling usb_set_interface() calling debugfs_create_dir()
>    queue->mutex --> i_mutex_key
>
> Some debugfs error case:
>    i_mutex_key --> mmap_sem
>
> So we could end up with this deadlock:
> CPU0            CPU1            CPU2
> mmap_sem        queue->mutex    i_mutex_key
>
> waiting for     waiting for     waiting for
> queue->mutex    i_mutex_key     mmap_sem
>
> I have no idea if this can be triggered in real life.
>
> Looks like that requires a some specific debugfs error
> to trigger at the same time we are creating a debugfs directory
>
> Thanks
> Mathias
>
