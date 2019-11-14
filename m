Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D0AFFFC996
	for <lists+linux-usb@lfdr.de>; Thu, 14 Nov 2019 16:11:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727083AbfKNPLB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 14 Nov 2019 10:11:01 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:46746 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727073AbfKNPLB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 14 Nov 2019 10:11:01 -0500
Received: by mail-pg1-f196.google.com with SMTP id r18so3937869pgu.13
        for <linux-usb@vger.kernel.org>; Thu, 14 Nov 2019 07:11:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=roRKIOX40b6Q/3+a+NshMVYzTrBfNeebY8L+kjytXRs=;
        b=kVX53tvflJrZ7i67dieAEPqJqgEgquhZFRAnVlI2YJDx22zztmIu11TLh4NDNAFN+T
         CX2YMO3wEPmmGACgjIYO7Xy0Ky3FlajlIbzeAr+2yadmJKDMhAyXwQXfkf2czRxnIchB
         zIRqC3mXkttBVprXoxuF3wc4pxgrHCB9YFiLkEOyNb5uONi/4ghGFaWSYip7g3fS0OiA
         QZYsqd8CHe50zJ9urtLSHndShhunx6Enr4KdX3E3ThBnXOD4SCrBwkWhONnRqZBDYHUt
         6XRB3xhz5g/NPTOsOWJf+7E0aodZKkybEyE09+8ASgfLlm7I3bD/SrZOerG8F+K5W9d3
         v9xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=roRKIOX40b6Q/3+a+NshMVYzTrBfNeebY8L+kjytXRs=;
        b=PG11ZFg4QG0T8QawdueLhsJYVYH/ajyJLvfNq4Ox3O2z2Ev4qU3dn0fNOFjb0QEZws
         ruVL3H/4AtNbLs6nktx/N2AWEJL7/rZ3UnswdrabY8aX+2tPuVZYzW1YUr7r3vPzCLBu
         jAiRJTlF9MpnoAaYoOer+j8G8b0kyHL5Sapo7GFAXD3rBFx689v6f27ewj2GJafMMR2Q
         fP1Ey7ijgcDIFxskaBsIgS3GIqGl781cJoOKVuCfwbqAMTIbnEjm9ogOL8i8juv/WcQO
         AY63+LhODffz1VIImFsUvW0NKw475a9lDpHR27zg4wq05tYhs4/IfP8W2zokuKaRhs34
         KmQw==
X-Gm-Message-State: APjAAAUUboVvM42UEwUD+R8Hwtioy2k4Z6Nk/VZDvLuU14xZps488JYh
        JMfNNYBk0AVQ8Q6tw6c/CqfsbsV/o31L4BlMNwqkVB8a
X-Google-Smtp-Source: APXvYqy8RhVcoQfGMi3SQ2aWlAr/b6M45vVTAnMILXZxwSYzz3/3mUs/jgcrwBgYeRwMyc8Ky+UoPtCMANbq/bcfyys=
X-Received: by 2002:a63:541e:: with SMTP id i30mr10665060pgb.130.1573744260540;
 Thu, 14 Nov 2019 07:11:00 -0800 (PST)
MIME-Version: 1.0
References: <cover.1573236684.git.andreyknvl@google.com> <Pine.LNX.4.44L0.1911081642461.1498-100000@iolanthe.rowland.org>
 <CAAeHK+zyvqJs_5X61NriLdHoityTdVJ0O=a-xrcq+-7Vb_F0FQ@mail.gmail.com>
In-Reply-To: <CAAeHK+zyvqJs_5X61NriLdHoityTdVJ0O=a-xrcq+-7Vb_F0FQ@mail.gmail.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Thu, 14 Nov 2019 16:10:49 +0100
Message-ID: <CAAeHK+zPh1zkALKNgnJb0_rGWYfTJGU2H+fsbe5XkSD9HLWumA@mail.gmail.com>
Subject: Re: [PATCH 0/1] usb: gadget: add raw-gadget interface
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     USB list <linux-usb@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Felipe Balbi <balbi@kernel.org>,
        Dmitry Vyukov <dvyukov@google.com>,
        Alexander Potapenko <glider@google.com>,
        Marco Elver <elver@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Nov 8, 2019 at 11:18 PM Andrey Konovalov <andreyknvl@google.com> wrote:
>
> On Fri, Nov 8, 2019 at 10:45 PM Alan Stern <stern@rowland.harvard.edu> wrote:
> >
> > On Fri, 8 Nov 2019, Andrey Konovalov wrote:
> >
> > > This patchset (currently a single patch) adds a new userspace interface
> > > for the USB Gadget subsystem called USB Raw Gadget (I don't mind changing
> > > the name to something else if there are better ideas). This is what
> > > currently being used to enable coverage-buided USB fuzzing with syzkaller:
> > >
> > > https://github.com/google/syzkaller/blob/master/docs/linux/external_fuzzing_usb.md
> > >
> > > Initially I was using GadgetFS (together with the Dummy HCD/UDC module)
> > > to perform emulation of USB devices for fuzzing, but later switched to a
> > > custom written interface. The incentive to implement a different interface
> > > was to provide a somewhat raw and direct access to the USB Gadget layer
> > > for the userspace, where every USB request is passed to the userspace to
> > > get a response. See documentation for the list of differences between
> > > Raw Gadget and GadgetFS.
> > >
> > > This patchset has been pushed to the public Linux kernel Gerrit instance:
> > >
> > > https://linux-review.googlesource.com/c/linux/kernel/git/torvalds/linux/+/2144
> > >
> > > Andrey Konovalov (1):
> > >   usb: gadget: add raw-gadget interface
> > >
> > >  Documentation/usb/index.rst         |    1 +
> > >  Documentation/usb/raw-gadget.rst    |   60 ++
> > >  drivers/usb/gadget/Kconfig          |    9 +
> > >  drivers/usb/gadget/Makefile         |    2 +
> > >  drivers/usb/gadget/raw.c            | 1150 +++++++++++++++++++++++++++
> >
> > As a general rule, gadget drivers don't go directly in
> > drivers/usb/gadget.  raw.c counts as a legacy driver (because it's not
> > written to use the composite gadget framework), so it belongs in
> > drivers/usb/gadget/legacy.  That's where the gadgetfs driver lives, for
> > example.
>
> Hi Alan! Sure, I'll move it to legacy/ in v2. Thanks!

Hi Alan,

Should I move CONFIG_USB_RAW_GADGET into legacy/Kconfig as well? AFAIU
this makes it impossible to turn on e.g. both GadgetFS and Raw Gadget
at the same time, since they both become options of the same choice.

Thanks!
