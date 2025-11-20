Return-Path: <linux-usb+bounces-30777-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC52C73648
	for <lists+linux-usb@lfdr.de>; Thu, 20 Nov 2025 11:10:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id CBD813478AF
	for <lists+linux-usb@lfdr.de>; Thu, 20 Nov 2025 10:07:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51CDF30E0F2;
	Thu, 20 Nov 2025 10:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VBH4Ubvp"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56835272E45
	for <linux-usb@vger.kernel.org>; Thu, 20 Nov 2025 10:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763633233; cv=none; b=jMDMMdj/DvYfuPyzXq/RX5mM60gSbn5/RTBR8OhsLuCmh1RximliE4+VhrY7kDuujKDYY9ezciRZCWklZdS6deyDsyoD8NeugTfHn12yHIAoY/hI5E0bK5xbK/85VIFqGjSBq+7gE/DdNuFpySs4zgRy4gb/FXoS/IKmm8i6pPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763633233; c=relaxed/simple;
	bh=opgNxRAaOOtS/qrf0UTSLIDcpgldA90951x4nR6F3QQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mPgu+hxln4/YcTBJcgkq5kWPY7Vudq3Dugbk5TlymOinftzsK3i4zZLRMG7vNlw6ysFpqgLzoFzdNE6r/lRmEBaBMam8WIVkK5PtvWBF6tFWNX6Po35X3u7hvI4jVhiW5AiHOIQII/9FvC6yxgyAsGdDpkYdO+sSjbdeKKZoFhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VBH4Ubvp; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2984dfae043so6809915ad.0
        for <linux-usb@vger.kernel.org>; Thu, 20 Nov 2025 02:07:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763633232; x=1764238032; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wCzeYOIwu51H3UyW4Ii5cQmYLHYJ44tFCWOTtWEA5fQ=;
        b=VBH4Ubvp0g+l5VkqAHFNULhEArl+07UmjZyjyRKymV3D2JcNfirtfzCxO2y7dfDIQ4
         Okg1BCOG0JedE4L8zJ/DHssJOMbUGwVNlj/cY5wlWsRNdUz5ixldSZjAenEj9j49N8PS
         ATMOIXx11dEyS8XXCWw4KMhN8iNR5BUa2pxXL3Sm+zaKG2foO1hmRk/XRQ1lpF1PUXjL
         lApvge9QP7PxKI+xFZWeaf8W6a82pzWk6fFvYa3n8Tpt2iclW6/Rhc1yBjs1CdgRcgtz
         kYKlqjjFn95Z4L2vVkvEGzFfEWPf0AwrpAp6zKLqudsXRZSFoJ0Amic6WPXTwCrW++sS
         nqIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763633232; x=1764238032;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wCzeYOIwu51H3UyW4Ii5cQmYLHYJ44tFCWOTtWEA5fQ=;
        b=rhzzR1DnQupa/cQbanVMOZKaoQKlnpIvmFUkttHi5NwVolPsKuhVLCaBZFfwn4+OuZ
         TsT2YNufkDrXLqR8H55nVMkOcs4cPCgOMsndoEWi0k2wzCU/+NdwsFAApnd34hDZOz6d
         btBj39IxZpcvo582pmzHrlVz5QQe1s4c8ApYwrx0L8u4FWrxumnq9c62SHy5QhHvOTbx
         5MwTRezcv/kO7KkcgN4ZV3OyBug68BsscgenGtMb9I3GIa7lCVM3QmJQR3e9/R41zLH+
         4q8Fp0g+s7w88Mn4j5UOkeXlKlWzJNc2VFUU6o8L0KXcCc33bojkpV/LuHbwNlgm9fLQ
         vxlg==
X-Forwarded-Encrypted: i=1; AJvYcCWPFHsqxXBcfHIRjmhGZHsqT5/2bKlKcjXvTNtdQ47KWyj3VeNF/ql7UdLyGO++LRXvyklyy3WlB4I=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywdz61eMk+yU3IpTWr9IBL0R0onHn6nokJ+ev1n+JkV9Az/RcDB
	1Th/aOAc1yC7Oi9dCns5KRn3mfmy/weI1sendc7GJu8HMuK2DX0jHiup1AIZW39VQ0jhpQ==
X-Gm-Gg: ASbGncssXILYx5dzoK/HWSAPATYkVgoJguVroGrH8mJmacgC96UovMZw6arzy84zNVj
	OxzxrpvGDib5i07kw57CGL6BNxxMJrV3PKKhr4sMBWSul1fDQXY+ixYxa/dOYC/8rn696repfQf
	bLcUTc5A6iWARaY+LvDFnleGm9q/j3m3Z+txpd8TpO7PGPcaYRwG0Rb0rcaQ1OsidO89gkA850A
	4SRNSHBEJQ9hCGwO126muKOjFW+8hvts7oh9w/So3/tYPViAkpPJiB0ctMS5/7dlYuphucL7Sn2
	B0Z8jMwTCcy/ulJQBKVZqp1J2zKhDFdeL9NAhu2W+bD5YqLBnY9V7VjNM4InfXCbQKa5SFfmUD3
	nVR9vtenrKhtCBxIlziP41hPqOKGir7ndrNHqofduS9BuSTlbgUoe7FX4q1MNT1UYk/G7SbIpSO
	bKBKlicoTZQSBdJQ==
X-Google-Smtp-Source: AGHT+IEQXDA4eVnbwRmfp0Pn44ar1IzBX5MgtZIapxaMSNNKWSHkT2/53EC5ci2QDZoq3DsEXGghWQ==
X-Received: by 2002:a17:903:1aec:b0:297:dd7f:f1e0 with SMTP id d9443c01a7336-29b5b119137mr30569465ad.43.1763633231596;
        Thu, 20 Nov 2025 02:07:11 -0800 (PST)
Received: from localhost ([103.70.166.143])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b107ee9sm21449425ad.1.2025.11.20.02.07.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 02:07:10 -0800 (PST)
Date: Thu, 20 Nov 2025 15:37:08 +0530
From: Gopi Krishna Menon <krishnagopi487@gmail.com>
To: andreyknvl@gmail.com, gregkh@linuxfoundation.org
Cc: gregkh@linuxfoundation.org, snovitoll@gmail.com, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, skhan@linuxfoundation.org, 
	david.hunter.linux@gmail.com, khalid@kernel.org, linux-kernel-mentees@lists.linux.dev, 
	syzbot+d8fd35fa6177afa8c92b@syzkaller.appspotmail.com
Subject: Re: [PATCH] usb: raw-gadget: cap raw_io transfer length to
 KMALLOC_MAX_SIZE
Message-ID: <krqj4q5xxp5tm3ufwmoyb7qcxnz5xoj5clebegdokq6mpjqb4t@mxonqsrhx2wt>
References: <20251028165659.50962-1-krishnagopi487@gmail.com>
 <CA+fCnZeZ+c15X8BXg59ppbEmEUvp64aMaTPjXARyO_0x6KL+eQ@mail.gmail.com>
 <u3okc42qhpzi2uorrdei3jigq5wwgdqb66u3u5khtuzxhwbamx@f3dh3fivx3uo>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <u3okc42qhpzi2uorrdei3jigq5wwgdqb66u3u5khtuzxhwbamx@f3dh3fivx3uo>

On Thu, Nov 13, 2025 at 10:09:08PM +0530, Gopi Krishna Menon wrote:

> On Tue, Oct 28, 2025 at 09:15:47PM +0100, Andrey Konovalov wrote:
> 
> > On Tue, Oct 28, 2025 at 5:57 PM Gopi Krishna Menon
> > <krishnagopi487@gmail.com> wrote:
> > >
> > > The previous commit removed the PAGE_SIZE limit on transfer length of
> > > raw_io buffer in order to avoid any problems with emulating USB devices
> > > whose full configuration descriptor exceeds PAGE_SIZE in length. However
> > > this also removes the upperbound on user supplied length, allowing very
> > > large values to be passed to the allocator.
> > >
> > > syzbot on fuzzing the transfer length with very large value (1.81GB)
> > > results in kmalloc() to fall back to the page allocator, which triggers
> > > a kernel warning as the page allocator cannot handle allocations more
> > > than MAX_PAGE_ORDER/KMALLOC_MAX_SIZE.
> > 
> > Ah, right.
> > 
> > >
> > > Since there is no limit imposed on the size of buffer for both control
> > > and non control transfers, cap the raw_io transfer length to
> > > KMALLOC_MAX_SIZE and return -EINVAL for larger transfer length to
> > > prevent any warnings from the page allocator.
> > >
> > > Fixes: 37b9dd0d114a ("usb: raw-gadget: do not limit transfer length")
> > > Tested-by: syzbot+d8fd35fa6177afa8c92b@syzkaller.appspotmail.com
> > > Reported-by: syzbot+d8fd35fa6177afa8c92b@syzkaller.appspotmail.com
> > > Closes: https://lore.kernel.org/all/68fc07a0.a70a0220.3bf6c6.01ab.GAE@google.com/
> > > Signed-off-by: Gopi Krishna Menon <krishnagopi487@gmail.com>
> > > ---
> > >  drivers/usb/gadget/legacy/raw_gadget.c | 3 +++
> > >  1 file changed, 3 insertions(+)
> > >
> > > diff --git a/drivers/usb/gadget/legacy/raw_gadget.c b/drivers/usb/gadget/legacy/raw_gadget.c
> > > index b71680c58de6..46f343ba48b3 100644
> > > --- a/drivers/usb/gadget/legacy/raw_gadget.c
> > > +++ b/drivers/usb/gadget/legacy/raw_gadget.c
> > > @@ -40,6 +40,7 @@ MODULE_LICENSE("GPL");
> > >
> > >  static DEFINE_IDA(driver_id_numbers);
> > >  #define DRIVER_DRIVER_NAME_LENGTH_MAX  32
> > > +#define USB_RAW_IO_LENGTH_MAX KMALLOC_MAX_SIZE
> > >
> > >  #define RAW_EVENT_QUEUE_SIZE   16
> > >
> > > @@ -667,6 +668,8 @@ static void *raw_alloc_io_data(struct usb_raw_ep_io *io, void __user *ptr,
> > >                 return ERR_PTR(-EINVAL);
> > >         if (!usb_raw_io_flags_valid(io->flags))
> > >                 return ERR_PTR(-EINVAL);
> > > +       if (io->length > USB_RAW_IO_LENGTH_MAX)
> > > +               return ERR_PTR(-EINVAL);
> > >         if (get_from_user)
> > >                 data = memdup_user(ptr + sizeof(*io), io->length);
> > >         else {
> > > --
> > > 2.43.0
> > >
> > 
> > Reviewed-by: Andrey Konovalov <andreyknvl@gmail.com>
> > 
> > Thank you!
> 
> Hi,
> 
> Just following up on this patch to check its status.
> Thanks again to Andrey Konovalov for the earlier review. Please let me
> know if any further changes are required from my side.
> 
> Thanks,
> Gopi Krishna Menon

Hi Greg,

Could you please take a look at this patch?

Thanks,
Gopi Krishna Menon

