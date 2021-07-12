Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C13A73C671F
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jul 2021 01:47:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233453AbhGLXtq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 12 Jul 2021 19:49:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232878AbhGLXtp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 12 Jul 2021 19:49:45 -0400
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com [IPv6:2607:f8b0:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E2AFC0613DD
        for <linux-usb@vger.kernel.org>; Mon, 12 Jul 2021 16:46:57 -0700 (PDT)
Received: by mail-il1-x130.google.com with SMTP id w1so19340009ilg.10
        for <linux-usb@vger.kernel.org>; Mon, 12 Jul 2021 16:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Cf4yqaJPmTjFkdku0O3vwLmFKdIsVujoTgyzXKaDw0A=;
        b=K4LjdXUTo4VzmsHX/WnmTu8W+i5OQq+/PImj2JoXAfksmqHgTrxd+f6QtEDjnuLe/O
         jfmyS1IeRYzi3L5YJzrpxxegX5h3C7k+FTOm2EBSDkhQbkuFli7c3VJjms8+Ps0ZQpdO
         4duaNMrChyre5QSRgzTVIWxKoddI/3wB+sEwA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Cf4yqaJPmTjFkdku0O3vwLmFKdIsVujoTgyzXKaDw0A=;
        b=EGihby1S32r398kh3tIrgqRgnxyrAewrxVlxCGRf+OYO8JCR32/9SItQy2UHRPaPPI
         47PpmiL/MKy3APWjpuwvS7ixCR1cNP17A9nMcXOOUA2zNqEvFd60Owwuq9GmueQTsppd
         IZHoef8dUUI9gYapfC0FiyDoltK3HPTydF3KWwAYKP8DKK0DAlnfoLsTJo52w+bPpMDr
         eo1/nYYOsxAFObobFZo0l+f9ZDc4egIPKwGUj7gt7jq9AGnKrfCS2faNtJ1JaVxkZcd5
         qSg/C/MbVp00JWejWgkDWT6Ge/YhSr6pdh2h68pdBPX+0wErlVpZTDdlbk0YFjmW9Kzo
         m9yQ==
X-Gm-Message-State: AOAM530QARsWoOZCdqu5RCWFGLKmrrFVyF2sUhlYl7DxSrrBSTvcNVg/
        qLH8V19GSzZFY9Ib0pKehMK1S7TASBWgvQ==
X-Google-Smtp-Source: ABdhPJyZNeKknX5c1TyY5+0ocCEjq1dwB6kJ1uJ57hgYJ3N13t3ERVTGBtoinnbOYd9e/EGtnto8fA==
X-Received: by 2002:a92:6412:: with SMTP id y18mr966641ilb.158.1626133616496;
        Mon, 12 Jul 2021 16:46:56 -0700 (PDT)
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com. [209.85.166.41])
        by smtp.gmail.com with ESMTPSA id h11sm8980605ilc.1.2021.07.12.16.46.55
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jul 2021 16:46:55 -0700 (PDT)
Received: by mail-io1-f41.google.com with SMTP id h6so24905060iok.6
        for <linux-usb@vger.kernel.org>; Mon, 12 Jul 2021 16:46:55 -0700 (PDT)
X-Received: by 2002:a5d:914a:: with SMTP id y10mr1072292ioq.140.1626133614672;
 Mon, 12 Jul 2021 16:46:54 -0700 (PDT)
MIME-Version: 1.0
References: <CAE=gft50j2D_UmNNVOj-h6Hyi5ctMztAVDBP442SPinmCwcnpw@mail.gmail.com>
 <YOk/dzmF9sRg4uBn@kroah.com>
In-Reply-To: <YOk/dzmF9sRg4uBn@kroah.com>
From:   Evan Green <evgreen@chromium.org>
Date:   Mon, 12 Jul 2021 16:46:18 -0700
X-Gmail-Original-Message-ID: <CAE=gft6pax+OB-TDDUEUabmc8p3x-p7CC-9ihNbjRKq0MgdisA@mail.gmail.com>
Message-ID: <CAE=gft6pax+OB-TDDUEUabmc8p3x-p7CC-9ihNbjRKq0MgdisA@mail.gmail.com>
Subject: Re: thunderbolt: Warning and 20 second delay in S4
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        gil.fine@intel.com, Rajmohan Mani <rajmohan.mani@intel.com>,
        linux-usb@vger.kernel.org, Prashant Malani <pmalani@google.com>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jul 9, 2021 at 11:34 PM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Fri, Jul 09, 2021 at 02:31:35PM -0700, Evan Green wrote:
> > Hi Mika et al,
> >
> > I'm experimenting with suspending to disk (hibernate) on a Tigerlake
> > Chromebook running the chromeos-5.4 kernel. I don't have any USB4
> > peripherals plugged in. I'm getting this warning, along with a 20
> > second stall, both when going down for hibernate and coming back up.
>
> 5.4 is pretty old, especially for thunderbolt issues, can you try 5.13
> please?

Good idea. On 5.13.0-next-20210709, I see the warning and delay even
at boot when runtime pm kicks in. This should make for an easier repro
at least:

[   18.832016] thunderbolt 0000:00:0d.2: 0: timeout reading config
space 2 from 0x6
[   18.840309] ------------[ cut here ]------------
[   18.845466] thunderbolt 0000:00:0d.2: interrupt for RX ring 0 is
already disabled
[   18.853836] WARNING: CPU: 0 PID: 5 at drivers/thunderbolt/nhi.c:103
ring_interrupt_active+0x1b7/0x1da
...
[   18.977736] CPU: 0 PID: 5 Comm: kworker/0:0 Tainted: G     U
    5.13.0-next-20210709 #18
[   18.996804] Workqueue: pm pm_runtime_work
[   19.001285] RIP: 0010:ring_interrupt_active+0x1b7/0x1da
...
[   19.100302] Call Trace:
[   19.103031]  tb_ring_stop+0x9d/0x17d
[   19.107022]  tb_ctl_stop+0x33/0xa0
[   19.110822]  tb_domain_runtime_suspend+0x35/0x3a
[   19.115979]  nhi_runtime_suspend+0x1f/0x4c
[   19.120557]  pci_pm_runtime_suspend+0x5a/0x173
[   19.125533]  ? pci_pm_restore_noirq+0x73/0x73
[   19.130411]  __rpm_callback+0x8a/0x10d
[   19.134595]  rpm_callback+0x22/0x74
[   19.138489]  ? pci_pm_restore_noirq+0x73/0x73
[   19.143355]  rpm_suspend+0x21e/0x514
[   19.147355]  pm_runtime_work+0x8a/0xa5
[   19.151554]  process_one_work+0x1b7/0x368
[   19.156027]  worker_thread+0x213/0x372
[   19.160217]  kthread+0x147/0x15f
[   19.163827]  ? pr_cont_work+0x58/0x58
[   19.167928]  ? kthread_blkcg+0x31/0x31
[   19.172113]  ret_from_fork+0x1f/0x30
[   19.176105] ---[ end trace 438b7f20f6b4049d ]---
