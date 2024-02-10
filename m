Return-Path: <linux-usb+bounces-6200-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A4C8505F5
	for <lists+linux-usb@lfdr.de>; Sat, 10 Feb 2024 19:21:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C41E31C23D31
	for <lists+linux-usb@lfdr.de>; Sat, 10 Feb 2024 18:21:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76D645DF39;
	Sat, 10 Feb 2024 18:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LzovAZFL"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CAFF5EE62
	for <linux-usb@vger.kernel.org>; Sat, 10 Feb 2024 18:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707589256; cv=none; b=lRtVIFoubJEYjKKIDg87gAalnI01oAPajDVYrD/15UXspbFO7K7GJbEn7Et9ZZac6VcztIUGNdfm0aB25h004TYbNoNFhx2w5LbAG8olJRs4EtGlRttbmabzWr7HCdUotCKebbye5+sSgTPY6JEl1iwdZ5kMUnn6CL+Xfjq1hjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707589256; c=relaxed/simple;
	bh=8GZzRk5xeM6x3+8tNiKdRlaycacYhtiviwWTOkYi98A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EuFPTBlIQt6ioxms8PMZwjHqzz6uYln1VTOK+g26kz+o9P2U6W4xg0zkLsVffKIGRxUtlYt0kC2YLEdzrwaUusM37lc76AuCnSSAQnu7dnX35tSJVIxoZDd+0cJO0xKn8czYjzmm+NQSuwqdz9sq4+xI3yaa2b2qEWfIFzH59Dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LzovAZFL; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1d5ce88b51cso631485ad.0
        for <linux-usb@vger.kernel.org>; Sat, 10 Feb 2024 10:20:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707589254; x=1708194054; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eM006jnqNS27XuEOTjcgkm/RwDZ/M1MwHFHZhtbdXGU=;
        b=LzovAZFLOhg4Kfxc8Mu4rNketxYLOaiTEZNFOeA/7QqzkzKldPuyFVLwQYpgJzSVvq
         916FiCSNbv1BKPXv6V30aUR039HurXNN4TYNzfI2CG8+DhmPpjf5GwfutZgKR6lW8epL
         1ohbeUSTvLz3uds4k5hR9VDJziftHbnF18DOXoAro/pG14YJZPAX+2oacJcabK17EXub
         sBp2i0HXeLpKcep4XbkMePDLqrZfOI4Z5ttRIs156qV7w7reuMK1+rKBRYilGaWFXk4x
         OMzVc3doukrf3BHSfTzsAlAD9icKL7unhdnHpcNfG5cNgkrdwpPEe0khPMCsF3CbQVD6
         9f6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707589254; x=1708194054;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eM006jnqNS27XuEOTjcgkm/RwDZ/M1MwHFHZhtbdXGU=;
        b=NLt1Ta4QLzQ9KOk96w2noU+fZYoobdM5d/cFVtTpZiDGWCWnZSlcD08B2Xw6Y3NIuq
         wFcmejbYRl5xGOqh6aAtSp+9CaJwYqag5AxQGMBZTMosSZWmzIWcn+G2GIlbEY+2FeDh
         7MsJeDjTj9G2RM8QaCYho9Vcuz4l6nkyoXWM+rxATPSWUWZlyaTEpILG5cmtg3eCRf5p
         uOl6mZcRWEX/wFFp7I+HGd54FFDf6uVndDCkrioGsrfpQ/6lJm7/mqqoEpPEJy1ILAQR
         5FshYOyt1yYPBQThjAcFiJYgok3RLp2L80PncX/IIezN0R+um91IKUieCp0nNwKEPRSd
         xdnQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOeoORfvuTcpuSpC73jizBbaDl2+KaytA1N3lfixsoWX+oXQQj94f+txvSnULiqCUIBoeKybBZoBMc4gqaeCBBLhQ1IyFZsHim
X-Gm-Message-State: AOJu0Yzq/b3lEjod4zfsCg8Rxj85DTH7J+o+4PRMWi3RxX9/C6oxNvhI
	Yl4aErtFBr82YKOJm0whnRQ6DrrzFjOzoA0+9s7utIseqsR1cwvgpYvtCgQr+fzCNek826VsD07
	6Dx4qhfRS6W3e605Gp193AMvvgOtaRpI//Elm
X-Google-Smtp-Source: AGHT+IFn7VS0qUFcuTAoirS2l2uHvveeU/0a+FF/US7LvcwIJrfLKB4uRaqoY6MiHCwKDFll3QKuRX/y6TmKUXIR9j8=
X-Received: by 2002:a17:903:6cd:b0:1d8:ffbe:82d0 with SMTP id
 kj13-20020a17090306cd00b001d8ffbe82d0mr97706plb.12.1707589253533; Sat, 10 Feb
 2024 10:20:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240205104049.48900-1-christianshewitt@gmail.com>
In-Reply-To: <20240205104049.48900-1-christianshewitt@gmail.com>
From: Grant Grundler <grundler@google.com>
Date: Sat, 10 Feb 2024 10:20:39 -0800
Message-ID: <CANEJEGuVPfdteBfY_LyQ+D=t4HGHLvDut-Vj2xFjRM4e8kgh=Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] net: asix: add 0b95:1790 to AX88179A device list
To: Christian Hewitt <christianshewitt@gmail.com>
Cc: "David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Grant Grundler <grundler@chromium.org>, linux-usb@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 5, 2024 at 2:40=E2=80=AFAM Christian Hewitt
<christianshewitt@gmail.com> wrote:
>
> Add a generic AX88179A entry for the 0b95:1790 device id:
>
> kernel: usb 2-1: New USB device found, idVendor=3D0b95, idProduct=3D1790,=
 bcdDevice=3D 2.00
> kernel: usb 2-1: New USB device strings: Mfr=3D1, Product=3D2, SerialNumb=
er=3D3
> kernel: usb 2-1: Product: AX88179A
> kernel: usb 2-1: Manufacturer: ASIX
> kernel: usb 2-1: SerialNumber: 00D24DC0
> kernel: asix 2-1:1.0 (unnamed net_device) (uninitialized): Failed to read=
 reg index 0x0000: -32
> kernel: asix: probe of 2-1:1.0 failed with error -32
> kernel: ax88179_178a 2-1:1.0 (unnamed net_device) (uninitialized): Failed=
 to read reg index 0x0040: -32
> kernel: ax88179_178a 2-1:1.0 eth1: register 'ax88179_178a' at usb-0000:01=
:00.0-1, ASIX AX88179 USB 3.0 Gigabit Ethernet, 20:7b:d2:d2:4d:c0
>
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
> The change is tested by a LibreELEC (distro) user who reports the NIC to =
be working
> fine (and logs support this) but the "Failed to read reg index 0x0000: -3=
2" errors
> suggest ax88178_info might not be the correct choice. I'm not a serious c=
oder so I
> need to "ask the audience" for suggestions on what more might be needed?
>
>  drivers/net/usb/asix_devices.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/net/usb/asix_devices.c b/drivers/net/usb/asix_device=
s.c
> index f7cff58fe044..9a7b1136cd98 100644
> --- a/drivers/net/usb/asix_devices.c
> +++ b/drivers/net/usb/asix_devices.c
> @@ -1506,6 +1506,10 @@ static const struct usb_device_id        products =
[] =3D {
>         // ASIX AX88178 10/100/1000
>         USB_DEVICE (0x0b95, 0x1780),
>         .driver_info =3D (unsigned long) &ax88178_info,
> +}, {
> +       // ASIX AX88179A 10/100/1000
> +       USB_DEVICE(0x0b95, 0x1790),
> +       .driver_info =3D (unsigned long)&ax88178_info,
>  }, {

Hi Christian!
Seems like there are two problems here:
1) The USB output is telling you this device is a AX88179A : the
changes most likely should be in ax88179_178a.c using the
ax881798_info:
   https://elixir.bootlin.com/linux/latest/source/drivers/net/usb/ax88179_1=
78a.c#L1690

2) What Andrew Lunn said. I'll add the asix driver should not be
probing (or claiming) this device - or at least be quiet about it when
it does.

Thanks for looking into this!

cheers,
grant

>         // Logitec LAN-GTJ/U2A
>         USB_DEVICE (0x0789, 0x0160),
> --
> 2.34.1
>

