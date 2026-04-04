Return-Path: <linux-usb+bounces-35972-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WMaAGkj+0GkIDQcAu9opvQ
	(envelope-from <linux-usb+bounces-35972-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 04 Apr 2026 14:04:24 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BD57B39B007
	for <lists+linux-usb@lfdr.de>; Sat, 04 Apr 2026 14:04:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E69C93013247
	for <lists+linux-usb@lfdr.de>; Sat,  4 Apr 2026 12:04:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F10F2DEA95;
	Sat,  4 Apr 2026 12:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ewGMqpLk"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5D8678F2F
	for <linux-usb@vger.kernel.org>; Sat,  4 Apr 2026 12:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775304256; cv=pass; b=WOYAHZKNKMRq1x2kfc+mMznXLSbFve0QiKWudXi5RIEh2RuDJJZjd+HHyJfxRNkHpDgOhIt8pHOcCKE7cfHhg6peX+kNjnc8AU0RYxHBx4W/louP5CxsYDZBmhS7OceNq+38tWqANVhKM5fxp61QzDtp3sQiCdZvLg7eg65w1C8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775304256; c=relaxed/simple;
	bh=6LXnZS3mrrT+I1xo2V0aYtTSB/7nY3yTZw75JvKo4bo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d2mJFSCo95zSKcZ1eI1Hz93E7Tgd4wIwFFvjAze8GQPeIpD4yAmXs/mEFk18CZU7uwXs+6hoTu4qd0sPn1awl/NTUWuHrjy0hKomUZNfwPs6OhEU1ojnFFWeCUUMIxk7kk4r1oFdkT47SlYJthy+nnYKdEL9miJot9ev4Z/YkB4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ewGMqpLk; arc=pass smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-8d4694105e5so98583085a.1
        for <linux-usb@vger.kernel.org>; Sat, 04 Apr 2026 05:04:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775304254; cv=none;
        d=google.com; s=arc-20240605;
        b=je2oI9K9JZdabOuFcbg/lIS2n9qHxtIiZznQ/hVhIpBKfBHT8ZF0O+IUYUeU9ZhJZk
         T+KvQ8T7ZEE5D+2IeAGOaMXD8n7UTA/YwCf3XRQFSTLOXnnSKcSr3jG2o32dzNOx7OgJ
         Kqes46Wvj9jqCfXfMT185jp3x5Xf17xDHC74NIYbUkiDDjJn4dzpOh4y/8YQwjGuo25f
         lquIKcT66o9huvLauyhFWKcQLP2lSqEkY9qE6YnJlYG0g1kLiiZfGowfuRXaauJNjLaO
         9d2I126S7AgtBehHwHFiqcx8rQY1LKS/yjd/e5aKB1rdlMIpOU4eXdsE0rx4mCbW5eiu
         IRTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PUNos3JyGgqN9C24ydkPkYRHs2ac3HTUhTPsjfWxUFE=;
        fh=oGZB+fAxv3AmVqbpiw6ECejp+zM9/E6xPnWpMntTYL8=;
        b=FEGkYcWt+pVNYdgTHBxcGfMuHylOmfvvg4xwpUbqJ6Q4BLSWVxwFq+k2lUMs1aVwT1
         IR55lPhBzF9HA0IpWEmO0tXgzDPz1ap3iQwsabkAG33ajCmdkMU1eJmian6QPI43LyTg
         aEcKIuzuwrr8BFGbTs7wtGowesRDcdH/S//hjAa2WA4wss6A4mcCrD5UQ3TS1CjlMde/
         QVV7XjRl8JfFXBwe0xtzhMsly2aD1BwLkp2RYaA8wcSOoRkiBuL+kyxLD5b6XDZyELhC
         nfvhVpO9zSC8Dx0GBzvdkIO5AXdvhy72d5FYYEWHTJ8+QC96WTkwtLe1+XvVbRYFFZbM
         qsbQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775304254; x=1775909054; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PUNos3JyGgqN9C24ydkPkYRHs2ac3HTUhTPsjfWxUFE=;
        b=ewGMqpLkL43RcbGx1ePP17yNizrbNCJLVv3MnBmRWCEP8FZCXk6Pp/zVfwzQ6hTI47
         94OpB0DFJ5YIU/6ZwLDRSOsd50AmLugytbZFT4RKHnBRr8LXevI2ZWpgYwRelPu04g6L
         3GgYf249vgenWMiAgCwTTUTIhg2LeEx3oEe4AuO8sqVKFUbe+VXKkn/BK8FywLx1IOa1
         dHR6JUPXxS6XZv3HMPVLuU3k9gUdvs86Tkz5BIihy1X5dB+AbmIY/JnZht7/LXyNMnD8
         8zI1ojLMooC6PXF+Jh6UX/S8U4PKmUU9LCvz9p/zeLcR28SHvUdZ1LExRdmiOu/lylZG
         LmjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775304254; x=1775909054;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PUNos3JyGgqN9C24ydkPkYRHs2ac3HTUhTPsjfWxUFE=;
        b=J7ij4GZzvVFzsrcS6elRHi6tYFwW3TzMnCYvK7Oa/N5bb0thbC3HSVIrZx7u8K0GYW
         GzKbvblcfW5pReiPBjCfQ6MOwh/hhThi2FtH2QKdYLbI/Tvnjh+AHpHhWwsmr4/vTOI+
         5I+jGBnHwirdZ+FqoUKw7lZRWq7WN+zP+gzxJ/lPIgfJub4Usp1rjy9XuiTygNB3woo7
         ZGV+3yUrikNrwFTMHbygWUUW4hXFlbISEHo0+iwR6zCzLCG9+K/xxqFxh7+TPXShGMej
         V2Lch41IOfKv9eGouchHFZ6G5+CypKcXz46kWZ3aciXXraxQGM1SoYgqO9rduYftKkUW
         tSKQ==
X-Gm-Message-State: AOJu0YxRjRWgHZXLl4DKLfUD5c4HRVFdaOTHdmN8uOY5ZGMdz5ksHPK5
	VQHpGr6Xr6lOmkGx9jejR+q1OQyqbwbcLTeDkCTHZSNohHOqa91ZFKmJRKndYXNt+FkeduKuG3S
	BZQG95yb1cxGxtpXj5jb7mWWeZCpUP44=
X-Gm-Gg: AeBDievVnl2h++1s6Ka17p49Yro/vgtLbyq6238kiRH8tmXEv6YNhn74b8gu2YeW9Kl
	dYZfFBKjATOJFDmxoqmC0Rk7c/wtzcGaVuNKmYL6uPaQ4ukfw2tRQso5qES65AP9k2mUna1NF8i
	Yis0c1Ys3dyTc1mgG1IDz4oSQ4mWEuNWatdZvdZzfnDNyPb9NoTff2TGWWE+cGtzf5gw1tyzQIz
	wUjcvhLjaaLi5uFp7N2qf1IYU8RinrLQMb/AJTkyoyszUfLuvgPVCjZ4k3XR4skS0XjVj9yT5cW
	YHFzvuCPZyPe6v1XfCCOKzh8+WQq1ZvAzJ+CfA==
X-Received: by 2002:ad4:5aa4:0:b0:8a0:d08c:a721 with SMTP id
 6a1803df08f44-8a70345e395mr108827426d6.22.1775304254428; Sat, 04 Apr 2026
 05:04:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+_z3hRjPnQOrEp7uXsNsu6wzqQp9O6FT18i=XcSC7k74Xd2QA@mail.gmail.com>
 <20260330020749.18fbe433.michal.pecio@gmail.com>
In-Reply-To: <20260330020749.18fbe433.michal.pecio@gmail.com>
From: Martin Alderson <martinalderson@gmail.com>
Date: Sat, 4 Apr 2026 13:04:02 +0100
X-Gm-Features: AQROBzCBM1n9nIz9foLrvtdxao65WFwefiHJWqEFl1nkkG5rLCC2GyhwXVy6Yvs
Message-ID: <CA+_z3hRTD-QAgv3jZhOZUUPA0sNZ8946jfYwYsZ=RnQJ0LG7cw@mail.gmail.com>
Subject: Re: xhci_hcd: AMD Raphael/Granite Ridge USB 2.0 xHCI [1022:15b8] dies
 on resume from suspend
To: Michal Pecio <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWO(0.00)[2];
	FREEMAIL_TO(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-35972-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[martinalderson@gmail.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com]
X-Rspamd-Queue-Id: BD57B39B007
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

Just for clarity this never happened to me with the 6.19 kernel I was
on before (suspend/resumed many times on that kernel with no issues).
It's happened twice now (once with rc5, now with rc6) in a short space
of time. It may just be random luck though than a specific regression
- sorry if I confused things there.

Not sure I'm able to do a bisect because it's very intermittent so
would take an age to reproduce it sorry.

Previously I was on the Fedora 43 default kernel series, now I
switched to the COPR for 7.x (to try and fix something else).

Thanks for the bugzilla, I'll look at some of those workarounds.


On Mon, Mar 30, 2026 at 1:07=E2=80=AFAM Michal Pecio <michal.pecio@gmail.co=
m> wrote:
>
> On Sun, 29 Mar 2026 17:52:39 -0400, martinalderson@gmail.com wrote:
> > [BUG] xhci_hcd 0000:0f:00.0: controller declared dead on resume from
> > suspend
> >
> > Hardware:
> >   CPU: AMD Ryzen 9 7900 12-Core Processor
> >   Board: ASUS PRIME B650-PLUS
> >   Controller: AMD Raphael/Granite Ridge USB 2.0 xHCI [1022:15b8]
> >   Subsystem: ASUSTeK Computer Inc. [1043:8877]
> >   PCI: 0000:0f:00.0 (IOMMU group 30)
> >
> > Software:
> >   Kernel: 7.0.0-rc5 (commit be762d8b, built 2026-03-28)
> >   Distro: Fedora 43 (Workstation)
> >   Desktop: GNOME on Wayland
> >
> > Description:
> >   On the first suspend/resume cycle after boot, the xHCI controller at
> >   0000:0f:00.0 (AMD Raphael/Granite Ridge USB 2.0) fails to resume and
> >   is declared dead. A Logitech Unifying Receiver (046d:c52b) on this
> >   controller is disconnected and the mouse (Logitech M720 Triathlon)
> >   stops functioning.
> >
> >   A second xHCI controller on the same system (0000:0c:00.0, AMD 600
> >   Series Chipset USB 3.2 [1022:43f7]) also errors on resume (USBSTS
> >   0x401) but successfully recovers via reinit. The 0f:00.0 controller
> >   does not recover.
> >
> >   Regression from rc4: suspend/resume worked correctly on 7.0-rc4 and
> >   earlier kernels on the same hardware.
>
> That's interesting because there were no USB subsystem changes
> between 7.0-rc4 and 7.0-rc5.
>
> Any chance you could git-bisect this?
> Are both kernels built with the same .config?
>
> > Reproduce:
> >   1. Boot with USB device attached to a port on the 0000:0f:00.0
> >      controller
> >   2. Suspend (systemd suspend)
> >   3. Resume
>
> By the way, are you using this affected controller to resume
> (with a keyboard or something like that)?
>
> > dmesg on resume:
> >   xhci_hcd 0000:0f:00.0: xHCI host not responding to stop endpoint comm=
and
> >   xhci_hcd 0000:0f:00.0: xHCI host controller not responding, assume de=
ad
> >   xhci_hcd 0000:0f:00.0: HC died; cleaning up
> >   xhci_hcd 0000:0c:00.0: xHC error in resume, USBSTS 0x401, Reinit
> >   usb usb1: root hub lost power or was reset
> >   usb usb2: root hub lost power or was reset
> >   usb 1-7: WARN: invalid context state for evaluate context command.
> >   usb 1-10: WARN: invalid context state for evaluate context command.
> >   usb 7-1: USB disconnect, device number 2
> >
> > Workaround:
> >   PCI remove + rescan recovers the controller:
> >     echo 1 > /sys/bus/pci/devices/0000:0f:00.0/remove
> >     echo 1 > /sys/bus/pci/rescan
> >
> >   A simple PCI device reset (echo 1 > .../reset) was insufficient -- th=
e
> >   controller came back but did not re-enumerate the attached device.
>
> What about the unbind/bind procedure described here?
> https://bugzilla.kernel.org/show_bug.cgi?id=3D221073
>
> > Notes:
> >   - The 0f:00.0 controller is USB 2.0 only (USB3 root hub has no ports)
> >   - hci version 0x120, hcc params 0x0110ffc5, quirks 0x0000000200000010

