Return-Path: <linux-usb+bounces-26485-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56411B1AE65
	for <lists+linux-usb@lfdr.de>; Tue,  5 Aug 2025 08:32:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 10EEC3A6F5E
	for <lists+linux-usb@lfdr.de>; Tue,  5 Aug 2025 06:32:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 269FA222594;
	Tue,  5 Aug 2025 06:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wmr+uJwb"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE81222562
	for <linux-usb@vger.kernel.org>; Tue,  5 Aug 2025 06:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754375462; cv=none; b=DAwoDb9GZBQ8TbKj05JzYiiARb0rZixraBqYooF8KxIjMBfxE7DuviSXM2HjwT5jgID411UJcLf2EMrOxh67hJrF/emjhdfWsZrJQYp7BowxYwgpbqkIcy8+LH9kV7KZA+McYO4lQPbnuGXm8RWYUWnIKCD8mBBN6zhJf2/A1n4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754375462; c=relaxed/simple;
	bh=j4NGPp9VaFnGFUx9rXSZLw81UeQeNpRciHGBKHrhjSk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EKKTRCX/cCg5mPAraiwMo/xr5F+dalTI6vakCzezmNjZA5rS+ApHrD7PhIh7C8Qza2Nkpu4IKbTC9+jyEBY9saSk5/rKRVK1ltmRLDq4eKm7X/kaQBNpzgddEo3TZj0gaRTc0IaemXhvp9kj0C9uyZpTJSV/2Dys81+7gAChe8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wmr+uJwb; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-55bae0b6b50so1335e87.0
        for <linux-usb@vger.kernel.org>; Mon, 04 Aug 2025 23:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754375459; x=1754980259; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tjt9G2y2gclTjM4TF8PRpe+XCHgzqxVfWjoTVQCasd0=;
        b=wmr+uJwbx+jdT2EhKn/TIENC6MAhBuSabB3/aGOtMcTmF+Gkt2s+R9ZUuOfs9dnGD+
         9gW/WmkE5RTp3Iu8xIjjKB+eEHXl3wCL3RqNo+tF4m5jy4cYdCJoVQXg3IYPfc/41PaI
         8ZhusWue1JImFA1SoNLmT+b94nYZJeR7b1GxAsFmQpHUQ6sxSs2Ay8BZgz8mrpiL/Y2T
         Fx7YnCJGQqXqSu9wNVGAMPbZGcCR/i/PeuIz/pQZ2pP2+SgYs/jdUZ1NSqkOf2Gq7tBT
         jw/C5qtl61JW1Q/ijMNDtne5/56JZH+6EyhFFswJ2f9kyAlPWu7dWX5yIxZ/N/sDWSqr
         p3ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754375459; x=1754980259;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tjt9G2y2gclTjM4TF8PRpe+XCHgzqxVfWjoTVQCasd0=;
        b=M2WDWH8HQZoI8iiXgYurpok6jcgP2noVCZMndtl624AjrIetgL/ulIolcwOW/Pt8eM
         UpqTM7hnojyqDqLmo04FhewHQhVyxN5lmR2OFS0aJa6wBnXfTbhQI3WZdX1Ui/vzC3EP
         zJPOW0QwY0HQbHN8MyhtR+XzxCDnL/5LNKTCCccIAt8lk7jXnzgUxLIOhi20GEYKHG8n
         5rBzLJPYTRgMybkZNmTaTO5VaTvnsAS/sbWykDogLO1EbfUPFxYROQiU4R2MomYdS2RR
         z3m7/DX1bly6ADACLS/2sumlxgvWMZFWMjTuvfe99L10+43pWV89X/bgBOKfEPGt1HEV
         Y2FA==
X-Forwarded-Encrypted: i=1; AJvYcCWc1wk7fIZZ0shbx4f8HltsnfifIQPWURuVLuDdDxeKeXEpCYHoYvSnkF+V33rq2+EzNtHzhRwyKvw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/4rMCYe2w0K3/tXCJbmMtuwoGYht6OByf6JFSE7owU9mBgk0L
	1MN4M0SuWNSKve/zXxhcGRwwzQgRh4CN3lyPZiDmmtQI6lcyfnR/Ez8QvUdAfr+Bim0/gAANttj
	ZsCulX6Wre0W0laItzy0BJAvDR7+k7GI8fb9JspNpkBr//3ITExwCMbc4
X-Gm-Gg: ASbGncvKb3acxT0oaPAEFQDeP5cucdpfhEEpP5TrIf6ttgCK5GKqaJha/UXGi663FcZ
	qPRJOIA8raXaNs2Q8kaI4cTIAyH8DiqcHtHYdRtJjxaBbxAQgQH7bd4e8xmwD/KZ/9c9Sr+tf9b
	Q+0nPObV/PX/Zk2uAtP1D302jRAgYnzYTs13kqYXwLlGKeCk9ioLd9bcYPxa+wNKzJrkG0AOt8E
	ZpI8H5pqyJxRlZUkMBrTQQjR4cr0JtiiA==
X-Google-Smtp-Source: AGHT+IH5w9MRUES9L0VP1bjNRzGoTswsTku6upjE74sws7QAjbnj9qsLbG1dbqddm9aI22Jn3ENEInyRXGoK7oSxiMQ=
X-Received: by 2002:a05:6512:6410:b0:55b:af2d:393b with SMTP id
 2adb3069b0e04-55baf2d39a8mr24728e87.4.1754375458906; Mon, 04 Aug 2025
 23:30:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250804080809.1700691-1-khtsai@google.com> <2025080456-grip-thwarting-2424@gregkh>
In-Reply-To: <2025080456-grip-thwarting-2424@gregkh>
From: Kuen-Han Tsai <khtsai@google.com>
Date: Tue, 5 Aug 2025 14:30:32 +0800
X-Gm-Features: Ac12FXxwyS6UTJdKetRrX_qEul9fl5YHif6lgaN570EvgDdKqy7j9PYbE530fBg
Message-ID: <CAKzKK0p5Vkncudu3Bu=rM8x7b+nPe2PVDgdjP_Hp057NNcFGiQ@mail.gmail.com>
Subject: Re: [RFC PATCH] usb: dwc3: Ignore late xferNotReady event to prevent
 halt timeout
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Thinh.Nguyen@synopsys.com, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Greg,

On Tue, Aug 5, 2025 at 12:43=E2=80=AFAM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Mon, Aug 04, 2025 at 04:08:05PM +0800, Kuen-Han Tsai wrote:
> > During a device-initiated disconnect, an xferNotReady event for an ISOC
> > IN endpoint can be received after the End Transfer command has already
> > completed.
> >
> > This late event incorrectly triggers a new Start Transfer, which
> > prevents the controller from halting and results in a DSTS.DEVCTRLHLT
> > bit polling timeout.
> >
> > Ignore the late xferNotReady event if the controller is already in a
> > disconnected state.
> >
> > Signed-off-by: Kuen-Han Tsai <khtsai@google.com>
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
>
> Why is this RFC?  What needs to happen to make it an actual submission
> that you wish to have applied?

I'm not sure if this solution is acceptable since I couldn't find any
guidance in the programming guide about ignoring xferNotReady events
depending on the controller's status. I was thinking marking this as
an RFC is more appropriate to solicit feedback on the solution.

I will send a new patch without the RFC tag soon.

Regards,
Kuen-Han

