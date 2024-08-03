Return-Path: <linux-usb+bounces-12914-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A8F946B36
	for <lists+linux-usb@lfdr.de>; Sat,  3 Aug 2024 23:51:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 203B51F21ED2
	for <lists+linux-usb@lfdr.de>; Sat,  3 Aug 2024 21:51:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A56B252F74;
	Sat,  3 Aug 2024 21:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hXWn25h8"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C2874C6D
	for <linux-usb@vger.kernel.org>; Sat,  3 Aug 2024 21:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722721912; cv=none; b=ePDCtekxg5YG/bF1+Ll1Tm/MygBeoVJ1qPjP12/g7hijvKJ8i2mH3+Rj1C/HMCHEOJkfr2c0RYnCYL72Lzei2tXhoBO8JBcXYNtIMjGdp/a1Lwq3/wHl7Z9i8jvp4RFgQUJYU9F8RMO0GMhyVjilIHyue0eVqWpfOe4qdt75DGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722721912; c=relaxed/simple;
	bh=7e6QgkrdwJK0368GzbJVIi8NTs/1uvFBoioV1Xnfk0c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C4ijRiqTNogJq4+ck4GwvUqnzsINPbzKQbUBnpFUrpSbU/zQsZ69rvuu0n0D+i2uprnPNUhllbA/azeXXiAORU86IpnNlkRo+rytn5lgEZSKtuXORrpl9HekgV1OtdYtMwNldZRsL104QPNzGbsqF/XkPyPoSTNKBFaX10jOqjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=hXWn25h8; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-52f04c29588so15161006e87.3
        for <linux-usb@vger.kernel.org>; Sat, 03 Aug 2024 14:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1722721908; x=1723326708; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xmsM9A0jTUH9hEbkvaffoss4achMsZIbmzuS5sWZ+ps=;
        b=hXWn25h8BcCCqw93nW2x1zPz2Lnl/LZ90q0gCK+1LSUOzTStQkcDlbcDewKPfR/q9H
         ozB6pdzntOw7XfMd+4wdvSbRopdP5Q8KbFJwqbELnPihkFikzQV5qq7x8ik4BbEBXAwX
         ohp2C1d2MV8sLWE1SyOtIKBgthsUNQBEHnzas=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722721908; x=1723326708;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xmsM9A0jTUH9hEbkvaffoss4achMsZIbmzuS5sWZ+ps=;
        b=fG+HqOdUcJZvA/lsLgh1G5GCi96rLvZ8OLwFchDYdjUlpJHW3FcwIsMBZJOvTziUwi
         GuR3NGGcbd0qh3T/+4rEqBl2Qk3LChCWOGQchvojSzKITAWGlyyK8HkpDjx8EM0bLq9S
         AEdve9Az0KtoWE+yR9HD/elwSYlR3AEtnjM9YwriXlSDdFGMUysKDyHBhteLzaw87DnS
         tnxNN/1tlv8Z2+ubnuZ3eQr8mT5+gXA+WkU8KlWQjoPE6bLKS4O3IuUY2tP8PFs6iI80
         0qJFRbpAxucr7Emwvgj81IOTwE8pSeGdneoTEfUAoR4pMCOCMZZw0w8owcXahNMwlX2x
         AdKA==
X-Forwarded-Encrypted: i=1; AJvYcCUbVm268JN8bFLobMr1+pWTqMPdyPZbzVt49Cpp11Mg5i9lDF8+iou93patt6PxsZxnJS75uSPl4vc1JPFvO07INSaT+1AzWZCD
X-Gm-Message-State: AOJu0Yw/tkvxodqM3D7l3+6gv/W2gP/5GE8RBv2kDm32vSFu+KxmM2Wj
	c6b/savLVa0+RmhjkKm3MpiH8/u2nAZQQyCL8dgJal1PlPPec5tuW/ugP6NZIXPGMuapMCB3bCq
	mgivyZgCw0LN4MmGDvNc3+lrrDi+lQGmPHyo=
X-Google-Smtp-Source: AGHT+IFE5ALd19sYi8QXEbYGXMsrR9HWSAo1NYPrNFDF5e763zffg32zB2WnunuXTe9pqt0Cla+KjrUMEAJ0jPKmMRE=
X-Received: by 2002:a05:6512:ba2:b0:52c:850b:cfc6 with SMTP id
 2adb3069b0e04-530bb4d7602mr4919588e87.38.1722721907861; Sat, 03 Aug 2024
 14:51:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240725074857.623299-1-ukaszb@chromium.org> <121d85fe-976a-43c4-95d2-1a066234a758@linux.intel.com>
 <CALwA+Na218B0PK3QG20_XFovJMfB4ud7B9Z=4kX=xwu8bjAvHA@mail.gmail.com>
 <115eb4be-e336-4a29-84d2-bdafb84a0f9f@linux.intel.com> <CALwA+NbLsg2qfmaHagMNimN0mvU6vNP-rsY31O-9X6oZovAOJQ@mail.gmail.com>
 <8cc19d0a-80f3-48a4-9fd2-0cc42b8ed1f4@linux.intel.com> <CALwA+Na_SORXHFr-GZJtPu_HySd9dwo+UAUsv0sYanrH501o4Q@mail.gmail.com>
 <CALwA+NbUJowv3yKnSoY5e4MBi1kZg=ezE0btB5xnTC=k9+VaQg@mail.gmail.com>
In-Reply-To: <CALwA+NbUJowv3yKnSoY5e4MBi1kZg=ezE0btB5xnTC=k9+VaQg@mail.gmail.com>
From: =?UTF-8?Q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>
Date: Sat, 3 Aug 2024 23:51:36 +0200
Message-ID: <CALwA+NbLZ7cm_pSc7Bgh-q7YOr3Ez5_AsG-dyqSzoDyOF=E_JQ@mail.gmail.com>
Subject: Re: [PATCH v2] xhci: dbc: fix handling ClearFeature Halt requests
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lu Baolu <baolu.lu@linux.intel.com>, 
	linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 1, 2024 at 5:02=E2=80=AFPM =C5=81ukasz Bartosik <ukaszb@chromiu=
m.org> wrote:
>
> On Wed, Jul 31, 2024 at 3:42=E2=80=AFPM =C5=81ukasz Bartosik <ukaszb@chro=
mium.org> wrote:
> >
> > On Wed, Jul 31, 2024 at 2:47=E2=80=AFPM Mathias Nyman
> > <mathias.nyman@linux.intel.com> wrote:
> > >
> > > On 31.7.2024 15.28, =C5=81ukasz Bartosik wrote:
> > > > On Tue, Jul 30, 2024 at 5:45=E2=80=AFPM Mathias Nyman
> > > > <mathias.nyman@linux.intel.com> wrote:
> > > >>
> > > >> On 30.7.2024 3.17, =C5=81ukasz Bartosik wrote:
> > > >>> On Mon, Jul 29, 2024 at 4:11=E2=80=AFPM Mathias Nyman
> > > >>> <mathias.nyman@linux.intel.com> wrote:
> > > >>>>
> > > >>>> Hi
> > > >>>>
> > > >>>> On 25.7.2024 10.48, =C5=81ukasz Bartosik wrote:
> > > >>>>> DbC driver does not handle ClearFeature Halt requests correctly
> > > >>>>> which in turn may lead to dropping packets on the receive path.
> > > >>>>
> > > >>>> Nice catch.
> > > >>>> Looks like a halted endpoint is treated almost as a disconnect.
> > > >>>>
> > > >>
> > > >>
> > > >> I pushed my thoughts to a "fix_dbc_halted_ep" branch, it compiles =
but is not complete.
> > > >> It mostly focuses on getting the STALL case for bulk-in working wh=
ich this report was
> > > >> about.
> > > >>
> > > >> I think the code itself best describes what I'm trying to do.
> > > >>
> > > >> git://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git fix_=
dbc_halted_ep
> > > >> https://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git/co=
mmit/?h=3Dfix_dbc_halted_ep&id=3D8532b621314e93336535528d5d45e41974c75e01
> > > >>
> > > >> If you can try it out it would be great.
> > > >>
> > > >
> > > > Sure I will test your patch and get back with the result.
> > >
> > > Thanks, that patch was missing a "ctrl =3D readl(&dbc->regs->control)=
;" line
> > >
> > > It's now fixed here:
> > > https://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git/commi=
t/?h=3Dfix_dbc_halted_ep&id=3Dcf99b473a1477c1b3510af0021877197a039c43f
> > >
> > > Can you try that instead
> > >
> >
> > I will. Thanks for the update.
> >
> > =C5=81ukasz
> >
>
> Hi Matthias,
>
> I ran the test with your fix cf99b473a1477c1b3510af0021877197a039c43f
> however the issue still exists.
>
> Trace capture:
> # tracer: nop
> #
> # entries-in-buffer/entries-written: 12/12   #P:12
> #
> #                                _-----=3D> irqs-off/BH-disabled
> #                               / _----=3D> need-resched
> #                              | / _---=3D> hardirq/softirq
> #                              || / _--=3D> preempt-depth
> #                              ||| / _-=3D> migrate-disable
> #                              |||| /     delay
> #           TASK-PID     CPU#  |||||  TIMESTAMP  FUNCTION
> #              | |         |   |||||     |         |
>      kworker/7:1-418     [007] d..1.   103.737275:
> xhci_dbc_handle_event: EVENT: TRB 00000001943ae000 status 'Stall
> Error' len 0 slot 1 ep 2 type 'Transfer Event' flags e:C
>      kworker/7:1-418     [007] d..1.   103.742975:
> xhci_dbc_handle_event: EVENT: TRB 00000001943ad000 status 'Stall
> Error' len 1024 slot 1 ep 3 type 'Transfer Event' flags e:C
>      kworker/7:1-418     [007] d..1.   103.742976:
> xhci_dbc_handle_transfer: BULK: Buffer 000000017988e400 length 1024 TD
> size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
>      kworker/7:1-418     [007] d..1.   103.753393:
> xhci_dbc_giveback_request: bulk-in: req 00000000f2919fbe length 0/1024
> =3D=3D> 0
>      kworker/7:1-418     [007] dNs2.   103.753407:
> xhci_dbc_gadget_ep_queue: BULK: Buffer 000000017988e400 length 1024 TD
> size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:c
>      kworker/7:1-418     [007] dNs1.   103.753409:
> xhci_dbc_queue_request: bulk-in: req 00000000f2919fbe length 0/1024
> =3D=3D> -115
>      kworker/7:1-418     [007] d..1.   103.767607:
> xhci_dbc_handle_event: EVENT: TRB 00000001943ad000 status 'Short
> Packet' len 1000 slot 1 ep 3 type 'Transfer Event' flags e:C
>      kworker/7:1-418     [007] d..1.   103.773260:
> xhci_dbc_handle_event: EVENT: TRB 00000001943ad010 status 'Short
> Packet' len 763 slot 1 ep 3 type 'Transfer Event' flags e:C
>      kworker/7:1-418     [007] d..1.   103.773260:
> xhci_dbc_handle_transfer: BULK: Buffer 000000017988e800 length 1024 TD
> size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
>      kworker/7:1-418     [007] d..1.   103.773261:
> xhci_dbc_giveback_request: bulk-in: req 00000000eb22d5f2 length
> 261/1024 =3D=3D> 0
>      kworker/7:1-418     [007] dNs2.   103.773281:
> xhci_dbc_gadget_ep_queue: BULK: Buffer 000000017988e800 length 1024 TD
> size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:c
>      kworker/7:1-418     [007] dNs1.   103.773283:
> xhci_dbc_queue_request: bulk-in: req 00000000eb22d5f2 length 0/1024
> =3D=3D> -115
>
> A 24 bytes packet is dropped which is confirmed in kernel logs by "no
> matched request" entries.
>
> Kernel logs related to DbC:
> [   55.569943] xhci_hcd 0000:00:0d.0: DbC connected
> [   55.861946] xhci_hcd 0000:00:0d.0: DbC configured
> [  103.702190] xhci_hcd 0000:00:0d.0: no matched request
> [  103.707882] xhci_hcd 0000:00:0d.0: Stall error at bulk TRB
> 1943ad000, remaining 1024, ep deq 1943ad001
> [  103.726161] xhci_hcd 0000:00:0d.0: DbC Endpoint halt cleared
> [  103.732517] xhci_hcd 0000:00:0d.0: no matched request
>
>
> > DbC should respond with STALL packets to host if HIT or HOT is set.
> > Host side should react to this by sending a ClearFeature(HALT) request =
to DbC,
> > which should clear the halted endpoint and HIT/HOT flags.
> >
>
> I would like to ask you about it again because I wonder when the DbC
> endpoint is not halted and it
> receives the ClearFeature(Halt) request whether this is correct
> behavior for the DbC endpoint to report a
> STALL error in such a case ?
>
> Thanks,
> Lukasz
>

Hi Mathias,

One more thing which I would like to add to the previous is the observation
which I made during debugging the issue. Looking at the above trace
there is stall
on IN endpoint:
xhci_dbc_handle_event: EVENT: TRB 00000001943ad000 status 'Stall
Error' len 1024 slot 1 ep 3 type 'Transfer Event' flags e:C

And then when 24 bytes packet arrives
xhci_dbc_handle_event: EVENT: TRB 00000001943ad000 status 'Short
Packet' len 1000 slot 1 ep 3 type 'Transfer Event' flags e:C

the same TRB is being used 00000001943ad000 but the DbC driver already
moved forward and the IN endpoint's pending list does not include a
dbc_request pointing
to the TRB 00000001943ad000 which results in "no matched request"
error and dropping
of the packet.

Thanks,
Lukasz

> > > Thanks
> > > Mathias
> > >

