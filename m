Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EAA8C100A98
	for <lists+linux-usb@lfdr.de>; Mon, 18 Nov 2019 18:42:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726568AbfKRRmi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 18 Nov 2019 12:42:38 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:35030 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726322AbfKRRmi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 18 Nov 2019 12:42:38 -0500
Received: by mail-pg1-f193.google.com with SMTP id k32so4253368pgl.2
        for <linux-usb@vger.kernel.org>; Mon, 18 Nov 2019 09:42:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DgL5jwV55j56rqZyzAJUKDc+dx0GYajHDkjPpkhqdMk=;
        b=Y6PDtscv0Qk1SQHHR0IpCIxRLptjHm3HfoYE6fx8NgeF348GQNEdoPUTMFeOJbB0qX
         7ksHWm0FmRh5SsaVQG2Hvnl+AWPCdtdAr9OIZoUkjnqTrHMckgE+YD7qdLTTbDXlrbN5
         eSJmM9hnlzCHcM1XuiplsaA/Ydxnq3WFtvI2ztUZvm3bpey5i0EHZj0dEi9iI1lZbkPB
         95Pkf//OyrjD8kJHpM0skp0HOmsOyapnRik+i4D+enQf5Pc/vQxIyTGoOwUO4CpJdNQy
         Ny25osx4Kl0nnBZRzui7C13LLMZ6npTyPc4oKTytPq7np0R/+xTyEcqcBI/a/vFkYLA9
         LoBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DgL5jwV55j56rqZyzAJUKDc+dx0GYajHDkjPpkhqdMk=;
        b=RGWrBzD30fjo6hMBRGzzuSROnnqItryt7GascFcgKhFh6yF3HQkqnSjeWBkLuPhRNY
         qAOeQee2Ff2manM4ZVUuGM2mdhYN1OBQ3nEdt9QnaM9+5oAxIEOSjAYPDV5HfRTx5oEJ
         DhGxyF2xjQAHPNh7cU8IEohTtc04VuNED3LnCmQz3gEUmP4VN9XcotRyp4uC2kD8FP4P
         TVpYImxr6n1yO5M9atrCuEUhIDONDWZDuBuu8YJbFH4Fcc5DZXLtB6qB6HEiO7Axm5aM
         8sQuEnVr7GsRIvqZkj7QTOS23cqwp73JKUr90IOGqpvuY+ryC2VxfbvwmvAgo3mrrhoZ
         t97A==
X-Gm-Message-State: APjAAAXbdBfmFfPOKcnbvUMykLDZkwk1bWeul2FqTRf6SOw0aJFKwrHh
        +R5GTrp0zkJJaF7zGc5Qm14X+HlLjryTtwODgiKgxQ==
X-Google-Smtp-Source: APXvYqyLKWOmNncXb5bGSfJ9fyQCT7lExfOUcjhVeYgnix7qhrl8vhCGMdYnzG63/qIogaQL/JVFfv2VFa4X4PsDlZk=
X-Received: by 2002:a62:53c6:: with SMTP id h189mr495908pfb.93.1574098957353;
 Mon, 18 Nov 2019 09:42:37 -0800 (PST)
MIME-Version: 1.0
References: <CAAeHK+yyKeV8h6UO2-4zZM_ndUaHcG1Ex5GYHxdmh_GJxDOa4w@mail.gmail.com>
 <Pine.LNX.4.44L0.1911151038480.1527-100000@iolanthe.rowland.org>
 <CAAeHK+z6m8mXEH-L+W+8FxjasrMX6BGMEdTq_hgUYerp+_0kjA@mail.gmail.com>
 <20191116084854.GA384892@kroah.com> <CAAeHK+xjUhR077goAHv=re78C6pzzSEBQxU+LZcOs0iCu2ZStg@mail.gmail.com>
 <20191118163958.GA595190@kroah.com>
In-Reply-To: <20191118163958.GA595190@kroah.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Mon, 18 Nov 2019 18:42:25 +0100
Message-ID: <CAAeHK+zWYAMJ5FQeTYNpCVH8Cnbyh11=0fqSh=oaEJLxNaXusQ@mail.gmail.com>
Subject: Re: Exporting USB device ids from the kernel
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        USB list <linux-usb@vger.kernel.org>,
        Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Nov 18, 2019 at 5:40 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Mon, Nov 18, 2019 at 05:12:34PM +0100, Andrey Konovalov wrote:
> > On Sat, Nov 16, 2019 at 9:49 AM Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Fri, Nov 15, 2019 at 05:10:26PM +0100, Andrey Konovalov wrote:
> > > > On Fri, Nov 15, 2019 at 4:44 PM Alan Stern <stern@rowland.harvard.edu> wrote:
> > > > >
> > > > > On Fri, 15 Nov 2019, Andrey Konovalov wrote:
> > > > >
> > > > > > Hi Greg and Alan,
> > > > > >
> > > > > > For USB fuzzing it would be nice to be able to export usb_device_id
> > > > > > structs from the kernel to facilitate the fuzzer with generating USB
> > > > > > descriptors that match to actual drivers. The same is required for
> > > > > > hid_device_id structs, since those are matched separately by the
> > > > > > usbhid driver (are there other cases like this?).
> > > > > >
> > > > > > Currently I have a hacky patch [1] that walks all drivers for USB and
> > > > > > HID buses and then prints all device ids for those drivers into the
> > > > > > kernel log. Those are manually parsed and built into the fuzzer [2]
> > > > > > and then used to generate USB descriptors [3].
> > > > >
> > > > > There are so many different flags for those id structures, parsing and
> > > > > understanding them must be quite difficult.
> > > > >
> > > > > > I'm thinking of making a proper patch that will add a debugfs entry
> > > > > > like usb/drivers (and usb/hid_drivers?), that can be read to get
> > > > > > USB/HID device ids for all loaded drivers. Would that be acceptable?
> > > > > > Or should I use some other interface to do that?
> > > > >
> > > > > I can't think of a better way to get the information from a running
> > > > > kernel.
> > > > >
> > > > > There is another possibility, though.  If the drivers are built as
> > > > > modules, the information is already available to userspace tools via
> > > > > depmod.  You could get it from the modules.dep.bin file.  This has the
> > > > > advantage that it will work even for drivers that aren't currently
> > > > > loaded.
> > > >
> > > > This is the same thing Greg mentions above, right?
> > >
> > > Yes.
> > >
> > > > Would this work for drivers that are built into the kernel (as =y)?
> > >
> > > No, sorry.  There has not been any need to export that information to
> > > userspace as nothing has ever needed that.
> > >
> > > The only reason we exported that at all was to allow modules to
> > > auto-load to handle the device.
> >
> > OK, I see. Ideally we would want to support both builtin drivers and
> > modules. I'll then implement the approach with exporting the ids
> > through debugfs. I'll send a patch once I have it.
>
> Note, this is part of the build/link process (see what
> MODULE_DEVICE_TABLE() does), so I don't know if you will be able to do
> it in debugfs very easily.

Take a look at the patch I've linked [1]. It iterates all drivers on
the USB bus via bus_for_each_drv and then iterates both builtin ids
(in usb_device_id_dump_static) and the ones that come from modules (in
usb_device_id_dump_dynamic) (at least that's how I understand the code
that I've written :). The patch just does that in a weird place and
prints ids to kernel log. It seems it should be easy to change it to
do the same in a read() handler of a debugfs entry.

[1] https://github.com/google/syzkaller/blob/master/tools/syz-usbgen/usb_ids.patch

> Why not put it in /sys/module/MODULE_NAME/ ?

I can look into this, if that's what you prefer. In this case we'll
need to iterate over all dirs in /sys/module to find the ones that
export some USB ids. Seems less convenient than a single debugfs file
approach, but would also work AFAIU.
