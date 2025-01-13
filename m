Return-Path: <linux-usb+bounces-19263-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B82AA0BD0F
	for <lists+linux-usb@lfdr.de>; Mon, 13 Jan 2025 17:15:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 77990188806F
	for <lists+linux-usb@lfdr.de>; Mon, 13 Jan 2025 16:15:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B36D20AF91;
	Mon, 13 Jan 2025 16:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xfE+kLa9"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 170591FBBEA
	for <linux-usb@vger.kernel.org>; Mon, 13 Jan 2025 16:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736784902; cv=none; b=dBQ5hbBw2Jqaqw8r6u6sjkCa82YPGF+UhqSHkBVCEDuPlWVPOHKRizPas1IX4hNkCWTa2QwPJXsjEaMzX54GGuvh+EfYHHlEzuskRqUFlhfvgNtHH3MTYoW1lwOD2611bYS8Czz7GVD0pY20KoQT+ticXMNEZ5F5JBIkZOSuFIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736784902; c=relaxed/simple;
	bh=B9BBV050L1aecQPyYu7lAbyfZYdXk+T6yzMHGJUTUz0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QIOepjW33foyTobH8ufo/ovnqM07Y+2LcAfOAvNuYzuLm9U9mwo1J0fs6ZbIcQ7Dr6R6ByEXjhAT83Cojo9cwEBlElTL3/m+Pip8P+DGM3YNuuK1EiRXU2x8iTePSU1/zN4xxjY0GRkpo/ccy5mAT9Swfuqac10in2pRFuVVFIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xfE+kLa9; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5d442f9d285so8806a12.1
        for <linux-usb@vger.kernel.org>; Mon, 13 Jan 2025 08:15:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736784899; x=1737389699; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QShTnDTQ8IHjQQz+4aG3jXHA0yIDJFzr0SGW6gyyWZk=;
        b=xfE+kLa9vg8qurJiAEFHy4/c/qLcFIdjrooh3WmfFdlX4smWhD6ova6QCV8aFtzYvH
         DRIC0KbH5OOqO0+sB8DmbUfb8MznlOPSTt6c0AeIiFw0+DSecnCqJbCHEEWqoNLyVuzJ
         bn5YTj9xCwVKM9H0uz8yX3OK6TXZ4nURgf0JnF2ETgocTyh4TTiXjyHQUtmjDLJ45gY/
         /7ra5fyP22AMyC7duEbgAsYXtB6mx3zcC0fKwhzW0swwEM2fx5hZ6IM01NSsZVUS2RO7
         s/1duC93JFqdgPeagEXtVNTTu+rfrxmv58j6UxhQZMNKo4zDVzoq9VX+qO6b1XZJZqjM
         SjuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736784899; x=1737389699;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QShTnDTQ8IHjQQz+4aG3jXHA0yIDJFzr0SGW6gyyWZk=;
        b=sK6lYnTWSSlaaHpu0Q2HVTMh/TQgeq3cpv+EdZEucOOjlfVmODrxogRmwjJeeQ99Uy
         dNz9vfZSRyt4kYlSMJRvKnZExv8nukGPFo8aq8q3zCVOZkOHG2LvMiuFhkzNV7ytyum0
         EGgOs2z4F/GqnbOzwc4tVal8pbNLMEL1cksKIy88dZWeMb4qschLoZQulkL8USEbyhv2
         pQimlQ4bbhUDuCv7dsUY8TBQgjPX/uCNWCYkolsQd1PUlrnR/CV7w8u+cVUjdugMdw/T
         lroxdQEno4mK6kTNJg11+MpKYQxs0Ve+bjJGbq38V4KCvuShM9bkRGhf8ifaTWCgYtE9
         tNOQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5MzWYe5aM73tUt065mOYEfMKIOZontnhU20Jr8K31gO7THY3CfeqkrlFJvDR/l6wZRmNbmmT2mZQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjkNYGIELmNdHbUntHju1l2SQcQq8iPwuY7CKSQRCB0XZXUSAM
	Qa+6sLZwdiJ+z4cpltsYC3rC3Mijj7v/khbR8KN0XLKSqv71HQoFnPvSxBkymeL+frMNCPngQGc
	OXR9i9NmGGBsrXPvYj6Xm/cFTsaOpgeEahqlT
X-Gm-Gg: ASbGncsRX03KvsJit7qSyxkMCPIdgAHRvVAsNAmwv6v0rIaYD49WNF3m6U6hepk/CGU
	g7a+wcaGWQw7VYyK7TeyoUcZW5x5Cfagmn/8R0xIx
X-Google-Smtp-Source: AGHT+IEJmuDgymat/mpM2w1X1B9v8DJdUfMBCtBUnEyqa90eiWvc9ZY/XouqD+U+64QHR2U7Agi8HY3FQnq/fCx/tJQ=
X-Received: by 2002:a50:934a:0:b0:5d0:8752:cecd with SMTP id
 4fb4d7f45d1cf-5d9a0cca0a0mr219019a12.3.1736784899141; Mon, 13 Jan 2025
 08:14:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250109035605.1486717-1-guanyulin@google.com>
 <20250109035605.1486717-6-guanyulin@google.com> <e8de4837-4c4a-4acd-bb33-6811d7381d20@rowland.harvard.edu>
In-Reply-To: <e8de4837-4c4a-4acd-bb33-6811d7381d20@rowland.harvard.edu>
From: Guan-Yu Lin <guanyulin@google.com>
Date: Tue, 14 Jan 2025 00:14:00 +0800
X-Gm-Features: AbW1kvYwXaUbFjPK9wIVT04AzGYANqAMNH3YYWmL8F7mYAvOMFgPmFNG0hcSTdA
Message-ID: <CAOuDEK0jNn-nSb7Rk_0EYtFg+Mxybij6cGnOenq4FPJdTKyjng@mail.gmail.com>
Subject: Re: [PATCH v7 5/5] usb: host: enable USB offload during system sleep
To: Alan Stern <stern@rowland.harvard.edu>
Cc: gregkh@linuxfoundation.org, Thinh.Nguyen@synopsys.com, 
	mathias.nyman@intel.com, perex@perex.cz, tiwai@suse.com, 
	sumit.garg@linaro.org, kekrby@gmail.com, oneukum@suse.com, 
	ricardo@marliere.net, lijiayi@kylinos.cn, quic_jjohnson@quicinc.com, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 9, 2025 at 11:08=E2=80=AFPM Alan Stern <stern@rowland.harvard.e=
du> wrote:
>
> On Thu, Jan 09, 2025 at 03:55:09AM +0000, Guan-Yu Lin wrote:
> > Sharing a USB controller with another entity via xhci-sideband driver
> > creates power management complexities. To prevent the USB controller
> > from being inadvertently deactivated while in use by the other entity, =
a
> > usage-count based mechanism is implemented. This allows the system to
> > manage power effectively, ensuring the controller remains available
> > whenever needed.
> > In order to maintain full functionality of an offloaded USB devices,
> > several changes are made within the suspend flow of such devices:
> > - skip usb_suspend_device() so that the port/hub are still active for
> >   USB transfers via offloaded path.
> > - not flushing the endpoints which are used by USB interfaces marked
> >   with needs_remote_wakeup. Namely, skip usb_suspend_interface() and
> >   usb_hcd_flush_endpoint() on associated USB interfaces. This reserves =
a
> >   pending interrupt urb during system suspend for handling the interrup=
t
> >   transfer, which is necessary since remote wakeup doesn't apply in the
> >   offloaded USB devices when controller is still active.
>
> Does this reasoning apply to interrupt-OUT as well as interrupt-IN?
>

Interrupt-OUT endpoints seem unnecessary in our current use cases. Our
primary concern lies with interrupt-IN endpoints, specifically those
associated with the remote wakeup feature.
Remote wakeup presents a unique challenge within our audio offloading
model during system suspend. Functions typically reliant on remote
wakeup, such as key-events, bypass remote wakeup because the
controller remains active during system suspend. Consequently, these
functions are handled as if the system were active, with events
received by a pending URB. Flushing the endpoint would remove this
pending URB, leaving no mechanism to handle these interrupt events.
Therefore, we should avoid flushing endpoints associated with remote
wakeup to ensure continued functionality for audio offloading during
system suspend.

>
> Or looking at it another way: Since the device's endpoints are being
> used by the coprocessor, should the system flush any of them at all?
>
Our local experiments reveal issues when we flush interrupt endpoints.
For other endpoints, we didn't see any problem. However, since
usb_hcd_flush_endpoint() still modifies the endpoints, it'll be better
to avoid flushing the endpoints associated with the offloaded USB
devices. This could mitigate potential conflicts in the future.

Regards,
Guan-Yu

