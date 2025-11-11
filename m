Return-Path: <linux-usb+bounces-30428-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E1CF5C4EBEC
	for <lists+linux-usb@lfdr.de>; Tue, 11 Nov 2025 16:18:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8E9AA3BB450
	for <lists+linux-usb@lfdr.de>; Tue, 11 Nov 2025 15:08:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4277735B141;
	Tue, 11 Nov 2025 15:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="EvsOj+aw"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F7D35B140
	for <linux-usb@vger.kernel.org>; Tue, 11 Nov 2025 15:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762873692; cv=none; b=RreMkd5ANEH5+3krrSu8eWq6ZASvoSknvQ1xMYo26+x2dyK57fsb4t95iaaDSt0MyDsj1T3K+dI/yqI5Zy5GPfRAPdHzV9oG1tiNNEF/FwtKJFEnXc9iCBIub5Z8Zz7LGbmwCbGaw2EmVpSbHG80PgTY3sDEOptNX6qj/XNKHTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762873692; c=relaxed/simple;
	bh=DAt5LtmL6m5oArkUGnBm1bgOgLbg+gEeBc0aZ8x0sF0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OOqV0GBk0N6y64qCsjLy7lVF0gc78OrBgr4b/9Fgo9qd8W+tqLIaxpTGTLs5GDHYJXtZkx55SGf3eLZVeFezv+BlquUDqYmTdJUFTrJlCdHE9WYrFFVJURntqfDZ3SkC4PyH+P0uOq0VePej5pm8dKD1nt/BVQF37svVgUooiVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=EvsOj+aw; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-880570bdef8so48339626d6.3
        for <linux-usb@vger.kernel.org>; Tue, 11 Nov 2025 07:08:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1762873690; x=1763478490; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3lJT5ZSJMOrp2Um3w1eEC09oiv0bY1tvU8jyZkoYyro=;
        b=EvsOj+awzYxqnrvFd6n5fZq7wZzm8A3L839dhxHDRubaLMqTaTVRX12uRGeZWJQfaJ
         KVfWVKuP1rR6ie8Qd/v21QGdospewIx/rru2tnr9eKwM922FYblciRcWIfOyGsE7W8XL
         ABk5kYiefYFBFGHATQtxaQgf+pU0mR5ZSsqmVXSZZACjExe3Mwc5/kYLgxmUVIFZEYtX
         UHwjKcJ+AxP/pOdO5weKSL+QJu7N2KteNoZWYNGz6rs4kwKV5wGPJPOTZDXh8/xEevdv
         wPVaNQj5mv0HieM96Qh/net6EzHVJaXiZnXHvOAeXUmfU4KkU0x7T0F3wxJLlwynh+3/
         k3Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762873690; x=1763478490;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3lJT5ZSJMOrp2Um3w1eEC09oiv0bY1tvU8jyZkoYyro=;
        b=u9PI+lzPU2bFWckm6ls0p8DC0qsuOHk5cgfQQKSdQVZ14vbxDzStVy2xVWWXj8Cb/R
         2KIK4AfBxDsP+NWL2RnTBcMGz7Fin2WnBpy89jn/eKsf5FHhcEp5oBnO71tKSFoWpx8r
         mfbr7ByKnEfCN1C6ITlCeS1PYht+saHbvQrqa2nRNrWiExPw+2JjD0quS+9iBkv9LWwc
         HKiak/u9gTxrdLoV23xRAtzZ10W2cMtMdI1WrwIxewdKdZsGn3TfMuYma58kyuvGEHtR
         g0ott0owQXJgyBkKZhjvlBfi5rhKuDtCdV7T5xVPiBrwab6P+Tcnja6MLpCnnRNos+ZQ
         tSww==
X-Forwarded-Encrypted: i=1; AJvYcCV/31u6kxwslRli6oBRXWeCRFxDPdYbzPa/xru7yejgvS22dgcCZTPpPpfRpwaT0ILfWIQrpLzMMMw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxtZNkNbKLnTZMSmZxTWV/Rcpve3WxuhN5BB/+VQyFQAxnTvm4g
	xX3pKzXvo4MDEQbK7mnNqlxmE7PP4zQodh/agnLVr/Drp94XMWZOjhpK+4Wi2LTixQ==
X-Gm-Gg: ASbGncufIYj8hz561TtAnT5i0yqS9WZz4rbScG3i72EDvMGLHcBPNQuF6TkFmHfie0j
	YBC4ngxHhIkKa3FtsTm4IQptrymyQ8lvmGYJszDaft7ZYaz1yiv8x+unIIDr1VOgqVaXY4j6tUl
	/43EGxdqTPT/eNEbmSamjThGVuUmN3ol5q2LwBrLDAAZd+R5inKzAu1DGjPuRZ+Tq+pNmXyaFBB
	uQ1tRDfYUe4M3jNm05Ge7MlrtmwnJGEEaSjswMcQTNrTr+NMg3zRzufSuX0MBEQ1Asd2uPkRezk
	KWLaf+KOJVbPGH9QTD2uFzb1Cagm95We/0ebxnmXp5Mj4d1fg6YkateXh1sUhprVY6TNfJVi4LJ
	l0tt2V2b0N68nC9YfPKxiicDhpJ5jA6abWSwDekPMo2KHmR0z/Sf5HHKyMMmz2XZYERhrKytjcT
	poZA==
X-Google-Smtp-Source: AGHT+IFgUb+2Gl34Fb0q5W9YamyNK7hzqSSthFYGdVLDl5NkdFz46yfwatDwjuvgJWFBBIQqtTtPZQ==
X-Received: by 2002:a05:6214:240d:b0:880:4d78:89ea with SMTP id 6a1803df08f44-88238702c86mr173354936d6.60.1762873689882;
        Tue, 11 Nov 2025 07:08:09 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d03:1700::ba76])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88238969ca6sm76561276d6.15.2025.11.11.07.08.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 07:08:09 -0800 (PST)
Date: Tue, 11 Nov 2025 10:08:06 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Terry Junge <linuxhid@cosmicgizmosystems.com>
Cc: The-Luga <lugathe2@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Michal Pecio <michal.pecio@gmail.com>,
	Terry Junge <linuxsound@cosmicgizmosystems.com>,
	linux-sound@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-input@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Subject: Re: [BUG] Edifier QR30 (2d99:a101, Jieli Technology) reboots itself
 when RGB brightness button is used under Linux
Message-ID: <732b03e1-ff0f-4428-8b50-725758962ad3@rowland.harvard.edu>
References: <CALvgqEBD05PwMpm00cAbFkpSWpCFP9jaBU0r-8+op+RGPtkktg@mail.gmail.com>
 <7adc816d-169d-4213-bb67-9d070af3c4a7@cosmicgizmosystems.com>
 <30528153-95f1-4ec7-a6bf-5da396441f86@rowland.harvard.edu>
 <xrfmda5rohporc3bjax35fc7xjziai6cmdt5svjak5rps6y6jz@k6h4zlt3jgg2>
 <CALvgqEDZ=g+uvdSYqbD22sL_VP+n6Pda2xXuFAJyKkh3bjm6HQ@mail.gmail.com>
 <CALvgqEC6UW96NEYOCM5v0m4x8Si0A7AwPuMpwXt3PMqkO3eqww@mail.gmail.com>
 <52fc4350-2930-44d3-b844-03f00806f142@cosmicgizmosystems.com>
 <1ac9d1dd-822a-487a-bd42-45c163dfbfe7@rowland.harvard.edu>
 <CALvgqED5NCNjrtv_YSfg9rzerK-xWAE5TaJjZtMBMcY=8MSk3g@mail.gmail.com>
 <c6d506f7-f13b-4d57-a522-a2ccd09e7a1f@cosmicgizmosystems.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c6d506f7-f13b-4d57-a522-a2ccd09e7a1f@cosmicgizmosystems.com>

On Mon, Nov 10, 2025 at 09:11:25PM -0800, Terry Junge wrote:
> 
> 
> On 11/10/2025 3:48 PM, The-Luga wrote:
> >>> Are you sure?
> >>>
> >>> HID_QUIRK_ALWAYS_POLL = 0x400
> >>> would stop suspending the device.
> >>
> >> Actually, it forces the kernel to poll the device's IN endpoints even
> >> when no program is holding the device file open (see where
> >> usbhid_start() calls hid_start_in() if the ALWAYS_POLL quirk is set).
> >> This is exactly what the speaker seems to need.
> >>
> >> As a side effect, it prevents the device from being suspended.  But that
> >> doesn't seem to be the important thing here.
> 
> Polling for input reports is handled by the hardware at the interval 
> requested by the device during enumeration.

Only if the kernel tells the hardware to poll.

(Also, the interval used by the hardware is what the kernel tells it to 
use.  Yes, the kernel generally does choose to use the interval 
specified by the device, but it can use some other interval if it wants 
to -- and in some cases it does.)

>  There is no intervention by 
> the kernel to poll for an input report. The only way the kernel can stop 
> polling a device for input reports is to suspend it.

This is simply not true.  Consider: Where would the hardware store the 
report data sent in response to a poll if the kernel hadn't given it the 
address of an input buffer?

> So ALWAYS_POLL means never suspend.

As Oliver explained, that's only partially accurate.

Alan Stern

