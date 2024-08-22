Return-Path: <linux-usb+bounces-13837-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A723A95AC06
	for <lists+linux-usb@lfdr.de>; Thu, 22 Aug 2024 05:36:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2A8FB1F21F79
	for <lists+linux-usb@lfdr.de>; Thu, 22 Aug 2024 03:36:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5259249F9;
	Thu, 22 Aug 2024 03:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="WGHuMK+8"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5558C24205
	for <linux-usb@vger.kernel.org>; Thu, 22 Aug 2024 03:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724297752; cv=none; b=gyPrV0IUJo8qtulCNP7/UVMkT76yW1kLrgDJ8ENHI36B+DOKDRVQu0ABunTaVxgtWJODRYP00EggtUjiVFr6XCRD0leoKwqUWt2SqFTWVFXkMY/ak1GgDZ/xB9984kQGJ8rwJGmYGO+s4wmBSRAOnD4Hn83JxRRGX2rm2FWjT6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724297752; c=relaxed/simple;
	bh=zZo7CK71DsyAHgNX6qZQdVDYSkWgUTK8Muh4eKSUtAU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HQ3zUnlZy2SDdNLXoFiAQr9vNyprDba6PmtmbWrGTTu8iJ7iw3xkSGpGb/KFijuUlz+jg14T1XregZfpASKW6hj+1N6C9IvMf8W/GgaZ8Bf7HklkSXBykGTKIGqtE1amJ36GkrIRhYpgMgiMjo0DZePIvBSrTmw5tequdnbrx3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=WGHuMK+8; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5320d8155b4so343597e87.3
        for <linux-usb@vger.kernel.org>; Wed, 21 Aug 2024 20:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1724297748; x=1724902548; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=koFChdZKi+s587yBpsHEVZdtL5nd67l55Fy/Eyb6xqA=;
        b=WGHuMK+8uQxUb0m+bf3vL9R4QvEytzRAnLgXX4cNCNKaNlzHZ9A11UFy/k8ecTI2UJ
         QLT+gbMkSm5Gh9OvRuugyTLJEwjINeQyvJONZWwL6Qjm3u3hlZRJhXrwoazXm5INnixC
         Dz3eB+HLn72lOEedwkGK32MTd0EtNkNitp4mc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724297748; x=1724902548;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=koFChdZKi+s587yBpsHEVZdtL5nd67l55Fy/Eyb6xqA=;
        b=CUO0b+yy5fRTrCr8y5lJUZ1GwyzAz4fL2j+3GTaruOVem8HsBF0luOPeLxdfpQ4bDx
         hGfMw0SVjY8G1bhe/j+8Sq1hSNrYfykUImT1hL/pHMhA9OXYFka+v40wJjQSiDsQsIoN
         mbg6b+0rtfrJSjolo3/vNC6255aViws51Q7ySmrmc1ccc4M7ccjD3iZI3xnJo7gFqAb8
         Aq30gxOn85mtnXMUiiSJ8PqE2fmftXp9qsCGm0UrtHqXh3OF17SmWcs1S3MxmqiTDKkS
         gyM6tqyTjtigE5YqvqJYa3EKkwN8wiagvLr+KcaalmClK2tkw1SO1qEGXnhOcYTp+Gg2
         ns/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUPvn286ICh5N6pKmqiExR6kLYLi3ukYxMMroEbxduMAqwyZnfiCsxZ176GbWNBY6wZ/o1sRz6miMg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwfLHNHJN//DLhJvA1M+inL97MC0lR6V8mJFalJNc7vU/jy3zRt
	iDIvzH+wWpmDqS7bz35ZAdR5HopWhgyIsO2EE+s7zIwmoWhDlYu6M6Xh1QKUHbBeauZFMyLqNB+
	vNzOE+Ua87F+R1iLM84Sqk+o6B39F3crYROSELH0gW6WsjDDUpfQ=
X-Google-Smtp-Source: AGHT+IHrJ3Vf3ZG8vW2S/kO9QLGvVgbawnx/JJcj2I5vxTmoyCVu2NpMtK5x4MJTycvTfaLX/iXW5iKTI2NWzNrIqdI=
X-Received: by 2002:a05:6512:2204:b0:530:ab72:25ea with SMTP id
 2adb3069b0e04-5334fd03e94mr212929e87.28.1724297747707; Wed, 21 Aug 2024
 20:35:47 -0700 (PDT)
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
 <CALwA+NbLZ7cm_pSc7Bgh-q7YOr3Ez5_AsG-dyqSzoDyOF=E_JQ@mail.gmail.com>
 <f803fe92-5b52-4c11-a35b-8cc4759f9a7e@linux.intel.com> <0f1a54a6-7a7c-429e-8134-88ea3e1e67ec@linux.intel.com>
In-Reply-To: <0f1a54a6-7a7c-429e-8134-88ea3e1e67ec@linux.intel.com>
From: =?UTF-8?Q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>
Date: Thu, 22 Aug 2024 05:35:26 +0200
Message-ID: <CALwA+NaH7VC5SjnbQRyXt2NXugZkXyZJa70u9Cw7vdPYe53KqQ@mail.gmail.com>
Subject: Re: [PATCH v2] xhci: dbc: fix handling ClearFeature Halt requests
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lu Baolu <baolu.lu@linux.intel.com>, 
	linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 5, 2024 at 5:50=E2=80=AFPM Mathias Nyman
<mathias.nyman@linux.intel.com> wrote:
>
> On 5.8.2024 9.49, Mathias Nyman wrote:
> > On 4.8.2024 0.51, =C5=81ukasz Bartosik wrote:
> >> On Thu, Aug 1, 2024 at 5:02=E2=80=AFPM =C5=81ukasz Bartosik <ukaszb@ch=
romium.org> wrote:
> >>>
> >>> [  103.707882] xhci_hcd 0000:00:0d.0: Stall error at bulk TRB
> >>> 1943ad000, remaining 1024, ep deq 1943ad001
> >>>
> >>>
> >>>> DbC should respond with STALL packets to host if HIT or HOT is set.
> >>>> Host side should react to this by sending a ClearFeature(HALT) reque=
st to DbC,
> >>>> which should clear the halted endpoint and HIT/HOT flags.
> >>>>
> >>>
> >>> I would like to ask you about it again because I wonder when the DbC
> >>> endpoint is not halted and it
> >>> receives the ClearFeature(Halt) request whether this is correct
> >>> behavior for the DbC endpoint to report a
> >>> STALL error in such a case ?
> >>>
> >
> > Ok, Setup was unclear to me, I assumed the STALL transfer error was due=
 to an
> > actual transfer issue on a bulk endpoint.
> >
> > I don't think xHCI DbC should send STALL error transfer events for non =
existing
> > bulk transfers as a response to ClearFeature(ENDPOINT_HALT) control req=
uest.
> >
> > Especially as it seems not a single byte was transferred on either bulk=
 endpoint.
> >
> > But we need to handle it in the driver properly
> >
> >
> >>> Thanks,
> >>> Lukasz
> >>>
> >>
> >> Hi Mathias,
> >>
> >> One more thing which I would like to add to the previous is the observ=
ation
> >> which I made during debugging the issue. Looking at the above trace
> >> there is stall
> >> on IN endpoint:
> >> xhci_dbc_handle_event: EVENT: TRB 00000001943ad000 status 'Stall
> >> Error' len 1024 slot 1 ep 3 type 'Transfer Event' flags e:C
> >>
> >> And then when 24 bytes packet arrives
> >> xhci_dbc_handle_event: EVENT: TRB 00000001943ad000 status 'Short
> >> Packet' len 1000 slot 1 ep 3 type 'Transfer Event' flags e:C
> >>
> >> the same TRB is being used 00000001943ad000 but the DbC driver already
> >> moved forward and the IN endpoint's pending list does not include a
> >> dbc_request pointing
> >> to the TRB 00000001943ad000 which results in "no matched request"
> >> error and dropping
> >> of the packet.
> >>
> >
> > I noticed yes, this is why the patch compared the TRB pointed to by the
> > STALL transfer event with the one in the endpoint context.
> > If they match the patch attempts to turn that TRB to no-op, forcing xHC
> > hardware to move to the next TRB.
> >
> > The check did however not work as it didn't mask out the cycle bit.
> > Lops show we compare  1943ad000 with 1943ad001
> >
> > [  103.707882] xhci_hcd 0000:00:0d.0: Stall error at bulk TRB 1943ad000=
, remaining 1024, ep deq 1943ad001
> >
> > Code in patch:
> > +if (ep_ctx->deq =3D=3D event->trans_event.buffer) { // FIXME do we nee=
d to worry about cycle bit?
> > +            dev_warn(dbc->dev, "Stall error TRB matches ep_ctx->deq, c=
lear it\n");
> > +            trb_to_noop(req->trb);
> >
> > With the new information that the STALL transfer event can be completel=
y
> > spurious and not related to any actual bytes being transmitted on bulk
> > endpoints I think we shouldn't give back he transfer req in those cases=
.
> >
> > I'll make another patch
>
> New patch ready for testing:
> https://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git/commit/?h=
=3Dfix_dbc_halted_ep&id=3D96cd909cc8115b3d2dff1bdcf265171bb0fdab18
>

Hi Mathias,

I finally tested your latest patch 96cd909cc8115b3d2dff1bdcf265171bb0fdab18=
.
It resolves the issue.

Here are trace logs from one of the runs:
# entries-in-buffer/entries-written: 23/23   #P:12
#
#                                _-----=3D> irqs-off/BH-disabled
#                               / _----=3D> need-resched
#                              | / _---=3D> hardirq/softirq
#                              || / _--=3D> preempt-depth
#                              ||| / _-=3D> migrate-disable
#                              |||| /     delay
#           TASK-PID     CPU#  |||||  TIMESTAMP  FUNCTION
#              | |         |   |||||     |         |
     kworker/4:0-30      [004] d..1.   427.334578:
xhci_dbc_handle_event: EVENT: TRB 000000019dbcaaa0 status 'Stall
Error' len 0 slot 1 ep 2 type 'Transfer Event' flags e:c
     kworker/4:0-30      [004] d..1.   427.340272:
xhci_dbc_handle_event: EVENT: TRB 000000019aef5960 status 'Stall
Error' len 1024 slot 1 ep 3 type 'Transfer Event' flags e:c
     kworker/4:0-30      [004] d..1.   427.340273:
xhci_dbc_handle_transfer: BULK: Buffer 000000017255a000 length 1024 TD
size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
     kworker/4:0-30      [004] d..1.   427.382584:
xhci_dbc_handle_event: EVENT: TRB 000000019aef5960 status 'Short
Packet' len 1000 slot 1 ep 3 type 'Transfer Event' flags e:c
     kworker/4:0-30      [004] d..1.   427.382586:
xhci_dbc_handle_transfer: BULK: Buffer 000000017255a000 length 1024 TD
size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
     kworker/4:0-30      [004] d..1.   427.382587:
xhci_dbc_giveback_request: bulk-in: req 000000005c9bd064 length
24/1024 =3D=3D> -6
     kworker/4:0-30      [004] d..1.   427.382592:
xhci_dbc_handle_event: EVENT: TRB 000000019aef5970 status 'Short
Packet' len 763 slot 1 ep 3 type 'Transfer Event' flags e:c
     kworker/4:0-30      [004] d..1.   427.382592:
xhci_dbc_handle_transfer: BULK: Buffer 000000017255c000 length 1024 TD
size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
     kworker/4:0-30      [004] d..1.   427.382592:
xhci_dbc_giveback_request: bulk-in: req 00000000f836aa56 length
261/1024 =3D=3D> 0
     ksoftirqd/4-29      [004] d.s1.   427.387396:
xhci_dbc_gadget_ep_queue: BULK: Buffer 000000017255c000 length 1024 TD
size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:c
     ksoftirqd/4-29      [004] d.s..   427.387397:
xhci_dbc_queue_request: bulk-in: req 00000000f836aa56 length 0/1024
=3D=3D> -115
     ksoftirqd/4-29      [004] d.s1.   427.387397:
xhci_dbc_gadget_ep_queue: BULK: Buffer 000000017255a000 length 1024 TD
size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:c
     ksoftirqd/4-29      [004] d.s..   427.387398:
xhci_dbc_queue_request: bulk-in: req 000000005c9bd064 length 0/1024
=3D=3D> -115
       sock->usb-4089    [004] d..1.   427.388796:
xhci_dbc_gadget_ep_queue: BULK: Buffer 000000017255d400 length 24 TD
size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:c
       sock->usb-4089    [004] d....   427.388801:
xhci_dbc_queue_request: bulk-out: req 00000000653a50a0 length 0/24 =3D=3D>
-115
       sock->usb-4089    [004] d..1.   427.388857:
xhci_dbc_gadget_ep_queue: BULK: Buffer 000000017255d000 length 371 TD
size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:c
       sock->usb-4089    [004] d....   427.388858:
xhci_dbc_queue_request: bulk-out: req 000000006de24797 length 0/371
=3D=3D> -115
     kworker/4:0-30      [004] d..1.   427.388869:
xhci_dbc_handle_event: EVENT: TRB 000000019dbcaaa0 status 'Success'
len 0 slot 1 ep 2 type 'Transfer Event' flags e:c
     kworker/4:0-30      [004] d..1.   427.388870:
xhci_dbc_handle_transfer: BULK: Buffer 000000017255d400 length 24 TD
size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
     kworker/4:0-30      [004] d..1.   427.388870:
xhci_dbc_giveback_request: bulk-out: req 00000000653a50a0 length 24/24
=3D=3D> 0
     kworker/4:0-30      [004] d..1.   427.394600:
xhci_dbc_handle_event: EVENT: TRB 000000019dbcaab0 status 'Success'
len 0 slot 1 ep 2 type 'Transfer Event' flags e:c
     kworker/4:0-30      [004] d..1.   427.394601:
xhci_dbc_handle_transfer: BULK: Buffer 000000017255d000 length 371 TD
size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
     kworker/4:0-30      [004] d..1.   427.394603:
xhci_dbc_giveback_request: bulk-out: req 000000006de24797 length
371/371 =3D=3D> 0

Short packet was processed instead of being dropped as it happened
previously without your fix.

Thanks,
Lukasz

> Thanks
> Mathias

