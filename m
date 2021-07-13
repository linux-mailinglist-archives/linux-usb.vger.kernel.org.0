Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 834223C782F
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jul 2021 22:51:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234290AbhGMUyR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 13 Jul 2021 16:54:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235125AbhGMUyQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 13 Jul 2021 16:54:16 -0400
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com [IPv6:2607:f8b0:4864:20::d30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A05B2C0613E9
        for <linux-usb@vger.kernel.org>; Tue, 13 Jul 2021 13:51:25 -0700 (PDT)
Received: by mail-io1-xd30.google.com with SMTP id v26so886300iom.11
        for <linux-usb@vger.kernel.org>; Tue, 13 Jul 2021 13:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=S+P0lnm66PueEszYCDJDubaGT6w8AgN5uZJqD6o5QDU=;
        b=Rjb4JaecdyzLKW8TfmKxzdMwLbM8WvDWiuYx8GcWgW/EITtQIWSuRn+ZnTSX9cPQUC
         2Cf5j+Wmq8ziesp5Bw+Qh9sLdGh9MN7nELkKjAmTDuunxOospqNAp+FWBcWqwhqbDrqJ
         qMs/qyKfpv9VBUApJKcHHo9ZA/NrYw9XdRejs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=S+P0lnm66PueEszYCDJDubaGT6w8AgN5uZJqD6o5QDU=;
        b=OEkstYoUR2XcdE2cfniAsAkgnDCKuyhMeJtSjB8+Eo3O3+m+QKnj49YEdFwtfEMdoD
         eqHBz8m5vJB40EXZC7ZoxYZUFC5a/D/2qpaowoVuI89Rd7GJ50djDVaxVk/D0gs/bik1
         2y414iLNxEMYhxnKanaJleTghoysx47b99Oylua00SOpnynVex9Hwm6NV8dKhO5OwrrD
         WXNbZbpQ3yNnQYgUrdniWgvt6HZyRBMpV/aslfIj5To2LVByJj02PXNCG6UcKzKq0wdF
         UfdxQkKmBL2kvu4g/acnvtio/N28uAIc8I/VBWETG7ffFgZBI8XsaavBMm/sgUZfQArJ
         yWGg==
X-Gm-Message-State: AOAM532Q0j1TCaNhXUF6WLIih79vHKsNTbtD0DCpzYvGXb7k+fXBM8ao
        JFGEzEjg5EHdPMFrFvbUpkFV5gT/1Q5Ftw==
X-Google-Smtp-Source: ABdhPJw+a8PT32dOHUSQzpVZj170qOOA3wPOnXWGntorBfnlYI+INoCiWrV5AZVh8qt6KA0IJbMroQ==
X-Received: by 2002:a6b:b883:: with SMTP id i125mr4731580iof.104.1626209484648;
        Tue, 13 Jul 2021 13:51:24 -0700 (PDT)
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com. [209.85.166.179])
        by smtp.gmail.com with ESMTPSA id z7sm5235965iox.4.2021.07.13.13.51.23
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jul 2021 13:51:24 -0700 (PDT)
Received: by mail-il1-f179.google.com with SMTP id w1so22546992ilg.10
        for <linux-usb@vger.kernel.org>; Tue, 13 Jul 2021 13:51:23 -0700 (PDT)
X-Received: by 2002:a92:d9c6:: with SMTP id n6mr4288193ilq.142.1626209483450;
 Tue, 13 Jul 2021 13:51:23 -0700 (PDT)
MIME-Version: 1.0
References: <CAE=gft50j2D_UmNNVOj-h6Hyi5ctMztAVDBP442SPinmCwcnpw@mail.gmail.com>
 <YOk/dzmF9sRg4uBn@kroah.com> <CAE=gft6pax+OB-TDDUEUabmc8p3x-p7CC-9ihNbjRKq0MgdisA@mail.gmail.com>
 <DM6PR11MB39639EB194DF47AE6D7F77ECF6149@DM6PR11MB3963.namprd11.prod.outlook.com>
In-Reply-To: <DM6PR11MB39639EB194DF47AE6D7F77ECF6149@DM6PR11MB3963.namprd11.prod.outlook.com>
From:   Evan Green <evgreen@chromium.org>
Date:   Tue, 13 Jul 2021 13:50:47 -0700
X-Gmail-Original-Message-ID: <CAE=gft4prWe-oD-042GT2F4zHiGBsNRH9pH040O9hipF9D5EfA@mail.gmail.com>
Message-ID: <CAE=gft4prWe-oD-042GT2F4zHiGBsNRH9pH040O9hipF9D5EfA@mail.gmail.com>
Subject: Re: thunderbolt: Warning and 20 second delay in S4
To:     "Mani, Rajmohan" <rajmohan.mani@intel.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        "Fine, Gil" <gil.fine@intel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Prashant Malani <pmalani@google.com>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Raj,
Sure. I've got a TGL chromebook with my own kernel. The chromebook has
nothing but a servo v4 plugged into it via type-C.

I built the kernel by checking out next-20210709 from linux-next in
the v5.4 ChromeOS chroot directory, then doing "git checkout m/main --
chromeos", in order to get the configs. My chromeos-5.4 (where I
pulled the configs from) happened to be on 04686c32716158 UPSTREAM:
ASoC: rt5682-sdw: use first_hw_init flag on resume, though I don't
think it matters.

From there, my build line is:
USE="kgdb pcserial vtconsole " emerge-volteer chromeos-kernel-5_4

My commandline has "earlyprintk=ttyS0,115200n8 console=ttyS0,115200n8"
so I get spew out of the serial port, but otherwise it should be
standard. I'm also tracking this in b/192575702.

-Evan

On Mon, Jul 12, 2021 at 5:16 PM Mani, Rajmohan <rajmohan.mani@intel.com> wrote:
>
> Hi Evan,
>
> > -----Original Message-----
> > From: Evan Green <evgreen@chromium.org>
> > Sent: Monday, July 12, 2021 4:46 PM
> > To: Greg KH <gregkh@linuxfoundation.org>
> > Cc: Mika Westerberg <mika.westerberg@linux.intel.com>; Fine, Gil
> > <gil.fine@intel.com>; Mani, Rajmohan <rajmohan.mani@intel.com>; linux-
> > usb@vger.kernel.org; Prashant Malani <pmalani@google.com>; LKML <linux-
> > kernel@vger.kernel.org>
> > Subject: Re: thunderbolt: Warning and 20 second delay in S4
> >
> > On Fri, Jul 9, 2021 at 11:34 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Fri, Jul 09, 2021 at 02:31:35PM -0700, Evan Green wrote:
> > > > Hi Mika et al,
> > > >
> > > > I'm experimenting with suspending to disk (hibernate) on a Tigerlake
> > > > Chromebook running the chromeos-5.4 kernel. I don't have any USB4
> > > > peripherals plugged in. I'm getting this warning, along with a 20
> > > > second stall, both when going down for hibernate and coming back up.
> > >
> > > 5.4 is pretty old, especially for thunderbolt issues, can you try 5.13
> > > please?
> >
> > Good idea. On 5.13.0-next-20210709, I see the warning and delay even at boot
> > when runtime pm kicks in. This should make for an easier repro at least:
> >
> > [   18.832016] thunderbolt 0000:00:0d.2: 0: timeout reading config
> > space 2 from 0x6
> > [   18.840309] ------------[ cut here ]------------
> > [   18.845466] thunderbolt 0000:00:0d.2: interrupt for RX ring 0 is
> > already disabled
> > [   18.853836] WARNING: CPU: 0 PID: 5 at drivers/thunderbolt/nhi.c:103
> > ring_interrupt_active+0x1b7/0x1da
> > ...
> > [   18.977736] CPU: 0 PID: 5 Comm: kworker/0:0 Tainted: G     U
> >     5.13.0-next-20210709 #18
> > [   18.996804] Workqueue: pm pm_runtime_work
> > [   19.001285] RIP: 0010:ring_interrupt_active+0x1b7/0x1da
> > ...
> > [   19.100302] Call Trace:
> > [   19.103031]  tb_ring_stop+0x9d/0x17d
> > [   19.107022]  tb_ctl_stop+0x33/0xa0
> > [   19.110822]  tb_domain_runtime_suspend+0x35/0x3a
> > [   19.115979]  nhi_runtime_suspend+0x1f/0x4c
> > [   19.120557]  pci_pm_runtime_suspend+0x5a/0x173
> > [   19.125533]  ? pci_pm_restore_noirq+0x73/0x73
> > [   19.130411]  __rpm_callback+0x8a/0x10d
> > [   19.134595]  rpm_callback+0x22/0x74
> > [   19.138489]  ? pci_pm_restore_noirq+0x73/0x73
> > [   19.143355]  rpm_suspend+0x21e/0x514
> > [   19.147355]  pm_runtime_work+0x8a/0xa5
> > [   19.151554]  process_one_work+0x1b7/0x368
> > [   19.156027]  worker_thread+0x213/0x372
> > [   19.160217]  kthread+0x147/0x15f
> > [   19.163827]  ? pr_cont_work+0x58/0x58
> > [   19.167928]  ? kthread_blkcg+0x31/0x31
> > [   19.172113]  ret_from_fork+0x1f/0x30
> > [   19.176105] ---[ end trace 438b7f20f6b4049d ]---
>
> I used to see these timeout errors, when there was a control
> read/write issued to the thunderbolt/usb4 device, after the
> thunderbolt driver is suspended.
> Can you share the steps to reproduce this S4 issue in a Chrome device?
>
> Thanks
> Raj
