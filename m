Return-Path: <linux-usb+bounces-31236-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F7F9CAB347
	for <lists+linux-usb@lfdr.de>; Sun, 07 Dec 2025 10:45:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7B7D53012BEB
	for <lists+linux-usb@lfdr.de>; Sun,  7 Dec 2025 09:45:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EEE3254B03;
	Sun,  7 Dec 2025 09:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XXuSEQ9S"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BCE820C48A
	for <linux-usb@vger.kernel.org>; Sun,  7 Dec 2025 09:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765100714; cv=none; b=PsfR68MWzHDx1WVcEkc77pEckGY8/a0w0XMYKL5lr8MOiyCc+td9RTB26aoAP0w3lOjoSmWCkmybxIGBOXRfSwaEcy3FkxrbpkdHlnDgdYB2pp8kRdowGh92WoiRs+G5itA5NS7oZKGKSCNUSoJreE0KdrD9vYDFc7iXNMnQd0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765100714; c=relaxed/simple;
	bh=7er6n01szZ7wG2F6I14Y9LyVYZ3+7bbDuG3+ahEhQ5Y=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AmMyt5DY24+z2RZkJ5a6tl41wiwzYMliWxzbPd+bpz7i/g7izoZCgjbhW5ef2YnR2C0Ckg6GKn7D2UgyZ3coj8GNKNfPGdl99VXFRFApuNwbbVswADV9NJwtBIYpP/26q/x8ridgDuTv+VnHTUgrVODxDJ1qYtgqL3QtfUCvi+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XXuSEQ9S; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-640c1fda178so6229109a12.1
        for <linux-usb@vger.kernel.org>; Sun, 07 Dec 2025 01:45:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765100710; x=1765705510; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oMcDknpHejH9uheeMjsFy7BVr9C+Tm+1e6n5vfiHgQQ=;
        b=XXuSEQ9S5qs6ojgmyLSrXOz1NcZrA1BRkw//4sgV5JXrw8uPNDJR1CY+rQVYc638o1
         SzqXrJBogy7dYMUIz07pGw89V4aoVyHzdFwRNYbTR34gLba4HPgD59QqYJxYakvNMtyN
         TzF6dQhBCi/jYVzuorqeJprcjXJWj8a2317WsAk3+9nrGn4rrE66Lf5aRlG9tmLBtsDr
         gsBZtQIHwZSXphrqReizsx9/UQ+QKEVGcYsnz50E/Y3REx4bjVThc2baiVxi4v87Fm9e
         RXXr5tljQeqKfArY0NdA3fPl1L9i3Era+AuEgIVYiZTQtY+EApKF/R9uSFIn1KZZftAI
         sNTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765100710; x=1765705510;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oMcDknpHejH9uheeMjsFy7BVr9C+Tm+1e6n5vfiHgQQ=;
        b=L2qZVG3IhYCJ8doPed0GrMefOb8Syq8CTEk32k1TergYjdEyt7elnjurPrNWxOfp+s
         VrgpDEI65VSzUzEJuvRnriopUimO+eoxuB4o56WCifbZXHSQ/NlLbBuGBVOyY5HjM0Vw
         Nnttt6uu2vrYRarZFeNgzfCm1gpLQRofEdOSUCfpK90xL0vpRZ3wRNBk1hqUx9jmkoSX
         92s0ZE5wy+UcGfPvWfVaiYqq2IsCry2yA70cdumt8H5Mup6/UsqUMnlGu0/QZTvs72FL
         CZUefk0CPKNSIhd+eycUxja1lfKmbvcFtsGmaAkGFvx3X18jo3B3NU0ElKnA/taK9KXA
         YLUg==
X-Gm-Message-State: AOJu0YzgeHLbLyZ1/8SvZJQ4MNQ6gJTdoCMP3dVhJiWL6UWAWoeqqIeS
	HOPCOy/ju6eYLx+gfI+0S6fBUz90hZDN79wHyq5ZKrxfTMKCE0X8odwK
X-Gm-Gg: ASbGncs6bRKpQNz31BPvFXG9KzJH/jparRPiFy4H+bWxkl/21KyF9xVwtIKIefjmZ3j
	B3u6PyYUrZnUJryNR+S4hGcuj1r/ziG1dTuQmXZLNOd9RzJ4Qaz6jMRfnQGGDQAoKotU1f5QvMN
	uZPTEVrdPVYVEzk/qAIx1G2I85nE4pf5Ex+5OFGwqZYGQimHcbxGcf6NhhdesI+bRp+5CEfP0xX
	4ZIfhzYCzQqBR7N1MFIWMmwmtFPqb3uQ4NwlUkEOhbmOS9ZYeDiC7nwWnHkt3cO14X0+/4ws385
	YWdHQUvvzoC99+x0Xhj/1kk0A5yc3gQHaGZAosQaRDTbTxvXdaiXzCRMUAfqFUMTLvxnaRhtKIo
	b2GZBRGpUixq6aiX9C292nbVtj6ID0eqPLWfd29uPjK8s0BTcpjbtbJAWnduP3sU0wVXXFx5AGl
	gcq13GHmhp+UCfzrTUCgR1Dn0=
X-Google-Smtp-Source: AGHT+IFuk9Vf4oqZ3QZiu1H745Q48pFbkKU723h4ArMeG2adwm9EDUAxPcv1CMfOkBQWgXp7di6Ndw==
X-Received: by 2002:a05:6402:2710:b0:643:18db:1d82 with SMTP id 4fb4d7f45d1cf-6491a3f1870mr3573182a12.11.1765100710257;
        Sun, 07 Dec 2025 01:45:10 -0800 (PST)
Received: from foxbook (bfg212.neoplus.adsl.tpnet.pl. [83.28.44.212])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-647b2ec2ff8sm8180041a12.7.2025.12.07.01.45.08
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sun, 07 Dec 2025 01:45:10 -0800 (PST)
Date: Sun, 7 Dec 2025 10:45:05 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Johannes =?UTF-8?B?QnLDvGRlcmw=?= <johannes.bruederl@gmail.com>
Cc: linux-usb@vger.kernel.org, gregkh@linuxfoundation.org
Subject: Re: [PATCH v2] usb: core: add USB_QUIRK_NO_BOS for devices that
 hang on BOS descriptor
Message-ID: <20251207104505.1d5f3718.michal.pecio@gmail.com>
In-Reply-To: <CAP=XvD+dNNDj75DYjjByE3o7F8i-QxusAdz-5+hG24fCesWYRw@mail.gmail.com>
References: <2025120708-header-startling-ffaf@gregkh>
	<20251207012059.7899-1-johannes.bruederl@gmail.com>
	<20251207084012.7c232e52.michal.pecio@gmail.com>
	<CAP=XvD+dNNDj75DYjjByE3o7F8i-QxusAdz-5+hG24fCesWYRw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, 7 Dec 2025 10:22:41 +0100, Johannes Br=C3=BCderl wrote:
> Here's the BOS Descriptor section when running w/ root.
> This is without this patch, so it "reconnected" with SuperSpeed (5Gbps).
>=20
> Binary Object Store Descriptor:
>   bLength                 5
>   bDescriptorType        15
>   wTotalLength       0x0016
>   bNumDeviceCaps          2
>   USB 2.0 Extension Device Capability:
>     bLength                 7
>     bDescriptorType        16
>     bDevCapabilityType      2
>     bmAttributes   0x00000000
>       (Missing must-be-set LPM bit!)
>   SuperSpeed USB Device Capability:
>     bLength                10
>     bDescriptorType        16
>     bDevCapabilityType      3
>     bmAttributes         0x00
>     wSpeedsSupported   0x000e
>       Device can operate at Full Speed (12Mbps)
>       Device can operate at High Speed (480Mbps)
>       Device can operate at SuperSpeed (5Gbps)
>     bFunctionalitySupport   3
>       Lowest fully-functional device speed is SuperSpeed (5Gbps)
>     bU1DevExitLat           0 micro seconds
>     bU2DevExitLat           0 micro seconds
>=20
> (Missing must-be-set LPM bit!) seems to be weird? As it looks like
> just nulled data.

OK, so it's broken during enumeration and after enumeration.

But that's the "fallback" case after hanging during SS+ enumeration,
which we would like to prevent from happening. What about 5gbps ports,
does it work correctly at SS or still report zero LPM?

And running at SS+ with the patch applied, does the device produce
sensible BOS descriptor? The previous one did.

What if you extend the patch to also apply at SS? It won't fix LPM
during enumeration, but would it fix the descriptor seen by lsusb?

