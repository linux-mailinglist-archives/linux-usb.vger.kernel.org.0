Return-Path: <linux-usb+bounces-31330-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 97293CAFA88
	for <lists+linux-usb@lfdr.de>; Tue, 09 Dec 2025 11:36:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F2F4D3017EE2
	for <lists+linux-usb@lfdr.de>; Tue,  9 Dec 2025 10:36:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8C902EB861;
	Tue,  9 Dec 2025 10:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XTu86gN5"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C15462773C1
	for <linux-usb@vger.kernel.org>; Tue,  9 Dec 2025 10:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765276586; cv=none; b=emM4E00KPs2q/2IGu5atTjOeMD9NKk9KoYR7tQhvHzfuJ0FyySFLYJlhSpuvGl0XAx2Evd6PocgiOweQt2WZGC3xViyre1rnoSg6BjKG0Ilikc9hGie73J6t1DAeL5H3WqSX6jPLedwtWMTLAWqZdiKSNGd1mgbQ7eJOfuLGnh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765276586; c=relaxed/simple;
	bh=lMF0egJjlq3xAL+hAsO0sIoVt1a5R4W/EzgzPOaxxno=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lorce1J5p3I0gKipm9OcmL83bHGXyJC1+iOH7NVyGzHOV27NCvJiQLvFGMgjDj32GFDkbN6HwDKCGFfBBx7AZW9hx6EJwNTmFm66aF/nE3aeNHAc5YknNzwiFtyHC/n5l3O8O2htasgZigYhSiMScEs9CRCXPeskvFXLtMuQ7zM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XTu86gN5; arc=none smtp.client-ip=209.85.221.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f66.google.com with SMTP id ffacd0b85a97d-42f8e39cf89so1132574f8f.3
        for <linux-usb@vger.kernel.org>; Tue, 09 Dec 2025 02:36:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765276583; x=1765881383; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fv7PBdO3hgpUW0vcVSdnRgEgToyYluEyJcVyXFEQJS8=;
        b=XTu86gN5dND0EJwcag6OwqXmKrha5A26eG4vxK75kE1atPwA9zotuX47t5MJm6H+if
         mVk3KNRt5C6feeejifB5jdqpMjhUMm3xSqyraA2pmjcmZ6kZf7Bk90su7VZ2bfrlq/SX
         cZMW2HI/FFLs4/LOzUIBXExH7wKqfFeuxvbpKQfPlAndvQD8gVLjNDzpMFcJpcWLzT3c
         iPVux5t2Vwkvs12j4/wWAYO8cSGzDax+30q3rEXnqkLWi2E4KjgNP2FsElRXDNyG7BK7
         0YtMaPVc0ZHsAdSrbVyGpaOM7feyWRRGXOLKuJjbdy1TWb6pzJeOscPIfSmWcPk7/7RH
         /ZBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765276583; x=1765881383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fv7PBdO3hgpUW0vcVSdnRgEgToyYluEyJcVyXFEQJS8=;
        b=QmqauU/hKi6csslrOjPYqwos6lhvO69Zh7T2FaeUo9fpbyAKhSRQTs6Pcr71jkjkY0
         oKEzcZeGK7Mk7ireikFZMEDv6uJVXKeFXjy0VPRdepZabS2c/ekjSSGGU+uOgMvPQ7yF
         6n6JCusx8cqTPO8yIoRGqnBodNhFykoa1eJC2wmDRspFn2Nyt5qIhblkeoEWh+SfTRV1
         vLnIXZXxrVq9z/IxKWc/NZjKHX7z3WOoz9J6oklFwtV/x8UBQzL76eQIDoC1EcYmtE/x
         xEuJJSNwq0wu8tH4TY0aT4q0rjuN5rYGwJSQ/kD0CW8grbXfF0Go0cyfVlt86v2s7TJ4
         7y1Q==
X-Forwarded-Encrypted: i=1; AJvYcCX/Ff62tA7MJ3s49kiPYVozvqoYg7uNR/tawYzyr99TRnwZqbmvLDmGdz5oHYmTbXlyIKqLq84loV4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCy5AxUZemtzGV3ZhKbdxDA/m5BZhxPPO2zsyGAViNlY51GoD+
	tVBb+DXhPYPG5i/paJoMca3EN0w8zyrhMwcE8W8oj9B/UrqmdAtE0dZz
X-Gm-Gg: ASbGncs7URpekEfcZiKfkf/3OtDulsQoZzSwtyViN9VwR7VdGHdhOaaODYlpP4FHY6I
	fCLMx9//XzmfoVIKVTgODm/8R8qNJUxL9y12O/Wi15mmW/Ex1SL8Zmi3hIDLoO/QSBgEzL56SWk
	r99/IWmv3S1xF7IzCI3mGcnXiQoi8d7RaZths78sJwcPYG/UIgLmjfpgmYg4ILEbeAJvlXGqeyK
	vs8FD2qG40QtB5CPwXaWaJ+hLf7NYAdKP7ha70ZaDgnZFTuz2W4kpNNts9ZhHHEGa2o01U7U0Gl
	zFZylAogNTiFV885bXty91RU3hgT1ywYdbqfYDABRFMa36o+3mD5nJj8I44GJ4xEfN20PSquDWC
	FHLjUgFXG1vFRtdz+w9WRMfMSJv00RaXRb7B9WO83zL31OTcSwdauUyMpV/jacIPQtSjLZAEBuN
	/4GBMPsaqFwOA4/4ykXz3BYXvRWkLzBbu/J55nRr2RsjLUJ8cikDHE
X-Google-Smtp-Source: AGHT+IGFAgehTmw8PLHj4QJJjd7Gf/VVDyG7X98wpx4H0KiE7+sLs6BmknhUqgwIOLm/fXWIK5/x2g==
X-Received: by 2002:a05:6000:208a:b0:42b:2e39:6d50 with SMTP id ffacd0b85a97d-42f89f12808mr11214524f8f.19.1765276582774;
        Tue, 09 Dec 2025 02:36:22 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7cbfee50sm30637673f8f.14.2025.12.09.02.36.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 02:36:22 -0800 (PST)
Date: Tue, 9 Dec 2025 10:36:21 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Yury Norov <yury.norov@gmail.com>, Rasmus Villemoes
 <linux@rasmusvillemoes.dk>, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH 2/9] thunderblot: Don't pass a bitfield to FIELD_GET
Message-ID: <20251209103621.7e6922ab@pumpkin>
In-Reply-To: <2025120944-grudge-machine-720c@gregkh>
References: <20251208224250.536159-1-david.laight.linux@gmail.com>
	<20251208224250.536159-3-david.laight.linux@gmail.com>
	<2025120944-grudge-machine-720c@gregkh>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 9 Dec 2025 07:56:35 +0900
Greg KH <gregkh@linuxfoundation.org> wrote:

> On Mon, Dec 08, 2025 at 10:42:43PM +0000, david.laight.linux@gmail.com wrote:
> > From: David Laight <david.laight.linux@gmail.com>
> > 
> > FIELD_GET needs to use __auto_type to get the value of the 'reg'
> > parameter, this can't be used with bifields.
> > 
> > FIELD_GET also want to verify the size of 'reg' so can't add zero
> > to force the type to int.
> > 
> > So add a zero here.
> > 
> > Signed-off-by: David Laight <david.laight.linux@gmail.com>
> > ---
> >  drivers/thunderbolt/tb.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
> > index e96474f17067..7ca2b5a0f01e 100644
> > --- a/drivers/thunderbolt/tb.h
> > +++ b/drivers/thunderbolt/tb.h
> > @@ -1307,7 +1307,7 @@ static inline struct tb_retimer *tb_to_retimer(struct device *dev)
> >   */
> >  static inline unsigned int usb4_switch_version(const struct tb_switch *sw)
> >  {
> > -	return FIELD_GET(USB4_VERSION_MAJOR_MASK, sw->config.thunderbolt_version);
> > +	return FIELD_GET(USB4_VERSION_MAJOR_MASK, sw->config.thunderbolt_version + 0);  
> 
> This is going to be very confusing to people who see this line only.
> Can we add a comment here to explain why we have to do a "+ 0" and why
> it can't be removed?  Otherwise I'm going to get a bunch of "cleanup"
> patches attempting to "fix" this over the next few years.

I've added a comment for v2 (but not the resend I did for the cc 'issue').
I've also fixed the subject blot => bolt.

I also noticed that the 'int thunderbolt_version:8' seems to be in a structure
that maps something read from the hardware.
That isn't going to be right on any BE system, and isn't guaranteed on LE ones.

	David

> 
> thanks,
> 
> greg k-h


