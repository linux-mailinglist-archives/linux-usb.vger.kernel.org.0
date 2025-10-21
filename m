Return-Path: <linux-usb+bounces-29488-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 06988BF7045
	for <lists+linux-usb@lfdr.de>; Tue, 21 Oct 2025 16:18:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DA42319A4626
	for <lists+linux-usb@lfdr.de>; Tue, 21 Oct 2025 14:19:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E5DD2737F4;
	Tue, 21 Oct 2025 14:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PBs96o1a"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38A94212F89
	for <linux-usb@vger.kernel.org>; Tue, 21 Oct 2025 14:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761056326; cv=none; b=AHxLW7Vb3BB5OYPXg//K50H93JKwZrOqRbc8MF4UkrqMipwLx/nHg8K+hRTMjUQSwuKQDwXPMmYaTV0s6UO14cJnIr+STQMRt2MzummNBz4fxjX13QyNG4f4iRpY9P/V5viwNgxhVt5CMoUDhIBWqv9Aev4h+ZUp7jTl+MWuPLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761056326; c=relaxed/simple;
	bh=td0wxdJvwksCsQ8szApwyuadUAHIWrEX7VEhKsxp9ow=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lO7eTLdqaXucz7EwYfIAoehbeAhfPxTuJBd9aBHYKwOS7bGCmldD6kSuZPDDbRyirmVEaH0Ru7aHgEwsGyPoVD/MwZ7X1zs9tg2oNg6XoQ48OwATXcOEGgjik2mR9es5J/7HZCKVyfMAtuPfO1Kph80L9D42YmguCBxWFzJwN+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PBs96o1a; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-426edfffc66so4242096f8f.1
        for <linux-usb@vger.kernel.org>; Tue, 21 Oct 2025 07:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761056323; x=1761661123; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DTg6iWTU9Y0FmHMWVr7mpqpsIik70Dq7Hr+fkZkn6eg=;
        b=PBs96o1ah+w8aX0y9oKe7fpZGAOu+zu+VpZA+sClRj0ZqIvIRIN1YOvUh6F5NtPzyS
         8mSsy9/uArSliWIBBMxPkzBP8aQYL8cS5464cU3eTZG2IhGgFUcrE2WCNEeUl0/eIbZ4
         zhNi5HalEiUG5GWsIcQDLF+XVZob0jBSP2POq+nBYpbxUyIIleC93j7fItiBGHaby+QZ
         8FlCq5rwcnTM6s711duD4aKwJ2ucWymccpdZKnHsk4hSsS5iZ/f+uKXlJyfzLD2znLL6
         tns2UN3WiT2t/mcyprUsvuqqGRV4aIDZC83yocuouLJFNir0b1ttUl6T7u6ITzh0pC8O
         rlzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761056323; x=1761661123;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DTg6iWTU9Y0FmHMWVr7mpqpsIik70Dq7Hr+fkZkn6eg=;
        b=ghwm3oebP5auzYombkqOEmkUEasoaYLXfox1H4pbKMUybBrUYdY0YlSlUWGIk7/Z1J
         dzmFx9+Qw9Fjr/fsidKxWLBrp/IxnbTgvsFZMceuI069Ac1AYCYII1na6CjLAjnZ8cOJ
         YLlvRoJ+Z7x8Y+G2yMGC3Ny2rewxuQk9B7FPNum/7Dt2oUSaUhSEYjN8weRLMTThu4NJ
         xfBbZQuIphgDYH7tYIqokrfAIb+HfbWhlowZywO2HFbeCXSEEnQs5BnLrK+inOoV4hIJ
         3TeaAvLF18X0gBAL915RHCwuF4CCyITn1KPHjiK8UWtO2RXdaGjkbrsW1LpFWidTfU7G
         aDfQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/C4fL/5LQi+B6fMSiVUSdvGDR+mh/iFP6HKAqZiYoOtw8mc0CW+bMA09NbOk6x8XPyXlAD0GaLqU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyE87WqrzivjheCQg5NnHo4oixIQYZifNvBkb5ch+BDm8AvIx+r
	+qNqBeBXrpztVw10sky1Sh9glOUz1Uid+Am1uj5MN/UJgaJK1agJkEDMGI9X0eTnoHD+tQDbaT9
	NiKWvydjuHKKBapKR4qpdckcQlYTXG28=
X-Gm-Gg: ASbGnctHECPLqzfHaFm06gYsLfUTqijY74yo3G2KDD9eTs/OxynOKNCAaJC5U+ypb0+
	LsxPobT7X5k9zLpZ0mOZCW6JZOl93MVUnEvtBSkSXT22zEo4+rH0ieqwmZkVOzRrQsp66MeutN8
	+auRpjxWjim2otfe8e30a9UVvYe0Hp6ZtraHfmaZr5jgpEnXZnIq01iF0MQYp6bbYV0bYbO46eJ
	uqpsG1AhWd5gPyFaqM4r7owhYjOa/tBJUA5+peRfVJAh09HjrnEGs85I8tls8Mk2ExKieFoY5W1
	DzSYO4oX5GvI6YptJIk=
X-Google-Smtp-Source: AGHT+IFa3o4oRIU+3qLtptCG5zaP5IZUIUu7lzLKc3QkSze+Ys7kW5YhqHaljicbPhcJw59uJZEAVQ42kFJjUoq0zdA=
X-Received: by 2002:a5d:584c:0:b0:401:8707:8a4b with SMTP id
 ffacd0b85a97d-4285304a024mr45398f8f.13.1761056323420; Tue, 21 Oct 2025
 07:18:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <a6024e8eab679043e9b8a5defdb41c4bda62f02b.1757016152.git.andreyknvl@gmail.com>
In-Reply-To: <a6024e8eab679043e9b8a5defdb41c4bda62f02b.1757016152.git.andreyknvl@gmail.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Tue, 21 Oct 2025 16:18:32 +0200
X-Gm-Features: AS18NWBzXNiBqt2jGmlRH7AZ1KVpx77wzAqEXOoi8Zzb_trF3c5-FIFSgDdxD7c
Message-ID: <CA+fCnZdG+X48_W_bSKYpziKohjp1QVgDzUzfYK_KOk42j58_ZA@mail.gmail.com>
Subject: Re: [PATCH] usb: raw-gadget: do not limit transfer length
To: andrey.konovalov@linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alan Stern <stern@rowland.harvard.edu>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 4, 2025 at 10:08=E2=80=AFPM <andrey.konovalov@linux.dev> wrote:
>
> From: Andrey Konovalov <andreyknvl@gmail.com>
>
> Drop the check on the maximum transfer length in Raw Gadget for both
> control and non-control transfers.
>
> Limiting the transfer length causes a problem with emulating USB devices
> whose full configuration descriptor exceeds PAGE_SIZE in length.
>
> Overall, there does not appear to be any reason to enforce any kind of
> transfer length limit on the Raw Gadget side for either control or
> non-control transfers, so let's just drop the related check.
>
> Cc: stable@vger.kernel.org
> Fixes: f2c2e717642c ("usb: gadget: add raw-gadget interface")
> Signed-off-by: Andrey Konovalov <andreyknvl@gmail.com>
> ---
>  drivers/usb/gadget/legacy/raw_gadget.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/usb/gadget/legacy/raw_gadget.c b/drivers/usb/gadget/=
legacy/raw_gadget.c
> index 20165e1582d9..b71680c58de6 100644
> --- a/drivers/usb/gadget/legacy/raw_gadget.c
> +++ b/drivers/usb/gadget/legacy/raw_gadget.c
> @@ -667,8 +667,6 @@ static void *raw_alloc_io_data(struct usb_raw_ep_io *=
io, void __user *ptr,
>                 return ERR_PTR(-EINVAL);
>         if (!usb_raw_io_flags_valid(io->flags))
>                 return ERR_PTR(-EINVAL);
> -       if (io->length > PAGE_SIZE)
> -               return ERR_PTR(-EINVAL);
>         if (get_from_user)
>                 data =3D memdup_user(ptr + sizeof(*io), io->length);
>         else {
> --
> 2.43.0
>

Hi Greg,

Could you pick up this patch?

Thank you!

