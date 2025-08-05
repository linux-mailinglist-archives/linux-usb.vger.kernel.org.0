Return-Path: <linux-usb+bounces-26487-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44019B1AEA5
	for <lists+linux-usb@lfdr.de>; Tue,  5 Aug 2025 08:46:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C7CDB171222
	for <lists+linux-usb@lfdr.de>; Tue,  5 Aug 2025 06:46:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 091CE21C9E5;
	Tue,  5 Aug 2025 06:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Uf/mvNHb"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4CF6243956
	for <linux-usb@vger.kernel.org>; Tue,  5 Aug 2025 06:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754376295; cv=none; b=CMEYCAkAQ5L54haFXsPZkjrCpUFl3DBsnNbRsmGTtaaY87jqVl9LiSlvzXH6kDyd8OFCx1zlSccCScOwBNpgCQZCzA6foLZ4eDctzGSh7Kv0xbhfiaS6nNQqSUj6gpnI7U+vQMUqfh7xPhILgmAsuBsrtaeXTT038j/kXyMq5BY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754376295; c=relaxed/simple;
	bh=70KfqXyr0tc0pq9qDsSTIln2Mnzvs9JWaCq9f/Xk5Hs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZyOEqB3WkCc2gx4MQERqE1e7HbLTngu1Lky9mHIpwnVX5F91Oe/eJCBSCLgMCFB+CysMJyx0vRBq/56kt0mvh+GU1u0WKzLJHlEB66ouAAb2Bb/1RLEDbjc81LkdaHUQ7ULEkTd10ANJcOIjAHwB7U4FH8gcCENlDuEb95pl7rY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Uf/mvNHb; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-55ba0f2f081so4774e87.1
        for <linux-usb@vger.kernel.org>; Mon, 04 Aug 2025 23:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754376291; x=1754981091; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U82i/V6rRmI7haWGqVBfda5K95EEBBOxiTSSBste6CA=;
        b=Uf/mvNHbRq4iDoqmKDnwabWnQdehsJJBl4rX1MrAosCSIHJZEOwjnXmmtwvfEadNRn
         kSbfE2z6+6OYsALWWif9dJt7pUrU02XspMdK1x1j7BQZ94th5WKMkpJJtA7jzDeCxPiu
         F+LzCnOVS2msluEK2iYZpSk+RARDYdiT5Jrz4Jv8xEmumt/KSV1TgS1O5gdwwaZAPoBh
         jrau5so0nNnzZa1ggcy2VnUj/KeHWJg3iqXDJN1w0J+rW4z6Vg+6USVpHmG1jZFUqgen
         8LVyTbMoxxnNSRzADtHlyKby9p4+UuTk1LkrbIQUeueIrJ0hPzWAAzWaKajwgZcLLbFF
         2dGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754376291; x=1754981091;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U82i/V6rRmI7haWGqVBfda5K95EEBBOxiTSSBste6CA=;
        b=bYGWFgImgFH8xip49kK9l64Syz1Jl5S1iRU3/TdnX/7B1cC+j71w6Idg9MiIMdoOBw
         xRYqJx5EA0LRxhAUHQb61wlKwJFB0AzkrfhckL5UxdlSlU8u0tvwfC13J0/C0QIHRk9l
         biyXTA2XkSPH1I/QWVzaItk0NTBcNZTGvWhsoB2ifyh4i8aKo4NMworVh9AUYE7f36Jr
         KbOdSMPsIDlLkAmnNItO5AjCsVn25KJ0u7B3YXriBEwmud+d7YI69B849yTKAeNhS8jk
         xXLhK7OPBTujam1Un6sRN8MG7HEKc5aCI3ojrH7Y5VcAmaIZFdjYM0/7fz51RPiBJlAB
         +Hxw==
X-Forwarded-Encrypted: i=1; AJvYcCWaJWgdevJelF2d7AeJMO+Xc71RaQlx9POevCVzDKStFOY4Rld3ibIraiUlYeKwYsnZMbEjwlfDHQI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzlJn0qBhWXm4O+7slK6mL7bR9KzV0FBbB9nCF0AwD2IFGLnHe5
	Z4vcnsAn+juqEFNjfgYI6YEyOHMf5tvOuofF15tJUHltFgPkH9UQqxbQkEn6buhBBc1mB65TIst
	mxQQAvZFNqiYhQaC0OMLzry9EhtWVwWlWIe10CBUp
X-Gm-Gg: ASbGncsABduFNT3aOoX89wcfZI0QfpLVxPBnY37t7OnPffBCEfgRrcm7mdawBDZpCQe
	d2oFqHbLXh886TwgKllEFKqA6lrQO+NA7jsdXOSeEJ/icpry+AgpO4IvR7InduoN9stH7T0V92K
	4Ijn6AgXnnkK1qXwpAT/ShB9DdEGwbonaQs8KtZjDPDN1VS+bys7b1vmzS/RCTk1sGkCTGxWiNG
	Ppo7/Nxgb57MRtHULIYeMt71Xf5nzNgHA==
X-Google-Smtp-Source: AGHT+IHnTc9NK3KsO4pyPp3EbA6zYOS9DHaibyZ84NJu9M+17yeVwSPHZDleDDEdC2Ex0TcPSrM2GhHajuqsX3X6740=
X-Received: by 2002:a05:6512:1456:20b0:542:6b39:1d57 with SMTP id
 2adb3069b0e04-55badbe9d07mr36096e87.3.1754376290533; Mon, 04 Aug 2025
 23:44:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250804080809.1700691-1-khtsai@google.com> <20250804182220.mho2qjdtmvdkicec@synopsys.com>
In-Reply-To: <20250804182220.mho2qjdtmvdkicec@synopsys.com>
From: Kuen-Han Tsai <khtsai@google.com>
Date: Tue, 5 Aug 2025 14:44:23 +0800
X-Gm-Features: Ac12FXwF-2BWQ8k8fNwT-Q0QadlHFSXDUezgppVWbUt-En04my_PRbsxiSiU8x4
Message-ID: <CAKzKK0pJkpGu0x1VZVpSa=5O4KeCF9vRuM_WQu9gmYKKoc77wA@mail.gmail.com>
Subject: Re: [RFC PATCH] usb: dwc3: Ignore late xferNotReady event to prevent
 halt timeout
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thinh,

On Tue, Aug 5, 2025 at 2:22=E2=80=AFAM Thinh Nguyen <Thinh.Nguyen@synopsys.=
com> wrote:
>
> Hi,
>
> On Mon, Aug 04, 2025, Kuen-Han Tsai wrote:
> > During a device-initiated disconnect, an xferNotReady event for an ISOC
> > IN endpoint can be received after the End Transfer command has already
> > completed.
>
> Some more info for clarity: the controller generates xferNotReady event
> once when the host requests to send/receive data to an endpoint. The End
> Transfer command resets the event filter and allow the controller to
> generate the xferNotReady event again. This can occur in the middle of
> device-initiated disconnect and before the controller is halted.

Thanks for adding more details. I've revised the problem description
in the new submission.

>
> >
> > This late event incorrectly triggers a new Start Transfer, which
> > prevents the controller from halting and results in a DSTS.DEVCTRLHLT
> > bit polling timeout.
> >
> > Ignore the late xferNotReady event if the controller is already in a
> > disconnected state.
> >
> > Signed-off-by: Kuen-Han Tsai <khtsai@google.com>
>
> Please also add Fixes tag and Cc stable.
>
> > ---
> > Tracing:
> >
> > # Stop active transfers by sending End Transfer commands
> >  android.hardwar-913     [004] d..1.  6172.855517: dwc3_gadget_ep_cmd: =
ep1out: cmd 'End Transfer' [20d08] params 00000000 00000000 00000000 --> st=
atus: Successful
> >  android.hardwar-913     [004] dn.1.  6172.855734: dwc3_gadget_ep_cmd: =
ep1in: cmd 'End Transfer' [40d08] params 00000000 00000000 00000000 --> sta=
tus: Successful
> >  ...
> > # Recieve an xferNotReady event on an ISOC IN endpoint
> >     irq/991-dwc3-29741   [000] D..1.  6172.856166: dwc3_event: event (3=
5d010c6): ep1in: Transfer Not Ready [000035d0] (Not Active)
> >     irq/991-dwc3-29741   [000] D..1.  6172.856190: dwc3_gadget_ep_cmd: =
ep1in: cmd 'Start Transfer' [35d60406] params 00000000 ffffb620 00000000 --=
> status: Successful
> >  android.hardwar-913     [004] dn.1.  6172.868130: dwc3_gadget_ep_cmd: =
ep2in: cmd 'End Transfer' [30d08] params 00000000 00000000 00000000 --> sta=
tus: Timed Out
> >  ...
> > # Start polling DSTS.DEVCTRLHLT
> >  android.hardwar-913     [000] .....  6172.869253: dwc3_gadget_run_stop=
: start polling DWC3_DSTS_DEVCTRLHLT
> >  ...
> > # HALT timeout and show the endpoint status for debugging
> >  android.hardwar-913     [004] .....  6177.479946: dwc3_gadget_run_stop=
: finish polling DWC3_DSTS_DEVCTRLHLT, is_on=3D0, reg=3D0
> >  android.hardwar-913     [004] .....  6177.479957: dwc3_gadget_ep_statu=
s: ep1out: mps 1024/2765 streams 16 burst 5 ring 64/56 flags E:swbp:>
> >  android.hardwar-913     [004] .....  6177.479958: dwc3_gadget_ep_statu=
s: ep1in: mps 1024/1024 streams 16 burst 2 ring 21/64 flags E:swBp:<
> >  android.hardwar-913     [004] .....  6177.479959: dwc3_gadget_ep_statu=
s: ep2out: mps 1024/2765 streams 16 burst 5 ring 56/48 flags e:swbp:>
> >
> > ---
> >  drivers/usb/dwc3/gadget.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
> > index 25db36c63951..506391699a10 100644
> > --- a/drivers/usb/dwc3/gadget.c
> > +++ b/drivers/usb/dwc3/gadget.c
> > @@ -3896,7 +3896,8 @@ static void dwc3_endpoint_interrupt(struct dwc3 *=
dwc,
> >               dwc3_gadget_endpoint_transfer_in_progress(dep, event);
> >               break;
> >       case DWC3_DEPEVT_XFERNOTREADY:
> > -             dwc3_gadget_endpoint_transfer_not_ready(dep, event);
> > +             if (dwc->connected)
>
> Move this check in dwc3_gadget_endpoint_transfer_not_ready().

Done.

>
> > +                     dwc3_gadget_endpoint_transfer_not_ready(dep, even=
t);
> >               break;
> >       case DWC3_DEPEVT_EPCMDCMPLT:
> >               dwc3_gadget_endpoint_command_complete(dep, event);
> > --
> > 2.50.1.565.gc32cd1483b-goog
> >
>
> And remove the RFC tag in $subject.

I sent out a new change without the RFC tag.
https://lore.kernel.org/linux-usb/20250805063413.2934208-1-khtsai@google.co=
m/

Regards,
Kuen-Han

