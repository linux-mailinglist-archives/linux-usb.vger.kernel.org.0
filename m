Return-Path: <linux-usb+bounces-31233-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BFBE1CAB2A2
	for <lists+linux-usb@lfdr.de>; Sun, 07 Dec 2025 09:05:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CE1643004458
	for <lists+linux-usb@lfdr.de>; Sun,  7 Dec 2025 08:05:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D28FE2459EA;
	Sun,  7 Dec 2025 08:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G5osyJex"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98B831E1E12
	for <linux-usb@vger.kernel.org>; Sun,  7 Dec 2025 08:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765094709; cv=none; b=k3PQYz19reFOdYjzbGBfl2vb7icSOmovEZ+oSUankr1S/X9Uje1ZxlFDZgPaS5smIbI2gzkgqKPo3ISM4iRlJ06ANqjPNBZyfyYrWyTStwt8e7OTBKgbQKLyoGPRIaSwEAm3a/wpZqi2ABYcDCXqgErYEWf7UQ7W7orACx/e4kU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765094709; c=relaxed/simple;
	bh=u3VBf7nZ7V6oWtVB4N88DTum6HAok9ZrSwVvYxFRdys=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oQMjQjeCgpUGWnXQMvfP38D/Kc33lkD0MpHlhuL5C5l7cKr8jUOln/mYoqxI2/5a6fwP/9yvd/xSSp84LnazUVyKnBfEw9TqJOy1aAR2GBiweoaUxSfVdNtNojF5a9Dc/ryZmINQyVS9wa6lvVJyuwkrLwB+mZfqK5rD9whF0ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G5osyJex; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-640a0812658so6155538a12.0
        for <linux-usb@vger.kernel.org>; Sun, 07 Dec 2025 00:05:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765094706; x=1765699506; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C5q5Xq0sGlEaLAo2BW6b3E5rJGoYi1LAD4X7rgAhzhM=;
        b=G5osyJexw7WwXiGvu0sfCaSe5yndcLGVFG8gjNy7xMoRVyJEa1VQ6JlLTBATW49SVX
         VldfplwuzCb+yRSSE+huJ20l0EMLg1FGBoGr3PdBP42U+uu+Zfqq0vjTQukFmIvuIXAN
         cA8mhRAD8S4IU33q00G+AgSy96LGKpF7G4bVxHwHiWxh7djyPVefDEbUuPrmPH0sFAyf
         GDlTY6yJzset+iTHbh83w5K3qA/SWEfNbBXO6CLcS3j6JyUGs5v6l7TOHI3rhW2Xxz15
         +iulWeNbpRi5bHOzORc/87XbIpLi08iRuGUnDJ8qtfde6MMI0A1hE2eWlkh6/DMD1Aqx
         lv9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765094706; x=1765699506;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=C5q5Xq0sGlEaLAo2BW6b3E5rJGoYi1LAD4X7rgAhzhM=;
        b=KfIH8PCCKNynwIj4RCwVXC+8uiVB4z5aQIbhx2HSoHXmRC2d8mBIOOx8YXXNHPXF3G
         yBrxyMO12HBhQhrC3lLrW9Hht5HEscH7dz4njMT2u/gkfR2cue94DGmtSZv4UgLsKyOm
         RfgjSjbLCNloFGwdFLUb1SsBepupWMLUaqXb/5E1/6SifQyKjNXej8lGmjpjVJ7brDCK
         bXFiSKLk9S9kVqHej3LHP/SXiAsdJHx/wKJhWjhh/4wVzkMhHTVjsJWtYvmOa/Z3iTpV
         hCJiujwcTZByMFbm3HlzJvluJQT3CBKy5g/tzLiZXdwoTofYoM7N2ETikL1SvZ/ozaFH
         uGMA==
X-Forwarded-Encrypted: i=1; AJvYcCXEfqtNQk7YjQlOIylXXbSl2s2Fa4nCLASCb2QKrUlq8L/dTwR7mlxbUSju+2SALfWel0jOROYDegc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPZdQ7Wt2VHkgCaZ6UmQBBDIJL6ZJNKnP3/4Z/NAmUJ8aiCbsP
	DY7B1L19GEg3nILm6+n9RGJp+mARuDHDKAzIknCaa5VpYEqKU3e3xETn
X-Gm-Gg: ASbGncvYLFZpETWhQPb7PZ5TpP5iM13lE6e7De8Nka2pBmrb96+hqdIOgpGTuK3FVkU
	gjAXsa+SLT4JVnM/R3SmaJ5PHfVDi1YIxtxsneJv6SiXgu++Fq0O7PHNKbt2IOfk7tVxliqffEu
	Fiipio4egZ0o8F14KhQrVTRDtUzIX3oWkLiQRrgx7XUPQ3pdnegtmoqevF5+zDT7GIs4P+qLPlc
	guoirknoyqhh1mCAHN/w8aA4YIr+mxMpUEWM3+bOq/aQF9ODalf89E5hAajDzOoLO4kbUIzBymE
	sqatoeK7iX/nmwkRAtRtNlRZUi7n0bsunNw/jVxL68Exs8dZXcNlyEE0UdZZVIqjSZZKsZIVDcg
	8hoxgQEmKQoazXSIB+2k3/blBliRmKorLfY9m2r4C5zEF/vOZBFwFAqZf7HeCvXrv5EhJOyOE5H
	h6ZYu+CLLvzGUttunnOAa/+kE=
X-Google-Smtp-Source: AGHT+IG3Fb6sFELWMDgiQ9Jhbis9xCT1Vxpk4srIFV8hPtA69hlwDRkseJRO10ljQ/uXJfKJ+qudEA==
X-Received: by 2002:a17:907:3e11:b0:b73:6e0d:4f6b with SMTP id a640c23a62f3a-b7a2476f945mr396070366b.36.1765094705602;
        Sun, 07 Dec 2025 00:05:05 -0800 (PST)
Received: from foxbook (bfg212.neoplus.adsl.tpnet.pl. [83.28.44.212])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b79f4976c43sm813393666b.42.2025.12.07.00.05.04
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sun, 07 Dec 2025 00:05:05 -0800 (PST)
Date: Sun, 7 Dec 2025 09:05:01 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Greg KH <greg@kroah.com>
Cc: Bitterblue Smith <rtl8821cerfe2@gmail.com>, Ping-Ke Shih
 <pkshih@realtek.com>, Zenm Chen <zenmchen@gmail.com>,
 "gustavo@embeddedor.com" <gustavo@embeddedor.com>, "Jes.Sorensen@gmail.com"
 <Jes.Sorensen@gmail.com>, "gustavoars@kernel.org" <gustavoars@kernel.org>,
 "linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 linux-usb@vger.kernel.org
Subject: Re: [PATCH][next] wifi: rtl8xxxu: Avoid
 -Wflex-array-member-not-at-end warnings
Message-ID: <20251207090501.41980a50.michal.pecio@gmail.com>
In-Reply-To: <2025120716-sway-hypnotic-8cb6@gregkh>
References: <ff184c0e-17f2-445f-9339-f4db9943db86@embeddedor.com>
	<20251121111132.4435-1-zenmchen@gmail.com>
	<475b4336-eed0-4fae-848f-aae26f109606@gmail.com>
	<c0d187d6fead4e5387db2a14129be96c@realtek.com>
	<44c9c325-14a8-4391-adce-4bbe8c68b446@gmail.com>
	<20251207001608.1f6940bf.michal.pecio@gmail.com>
	<2025120716-sway-hypnotic-8cb6@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 7 Dec 2025 08:55:59 +0900, Greg KH wrote:
> On Sun, Dec 07, 2025 at 12:16:08AM +0100, Michal Pecio wrote:
> > Hi,
> >   
> > > >> I got something. In my case everything seemed fine until I
> > > >> unplugged the wifi adapter. And then the system still worked
> > > >> for a few minutes before it froze.  
> > 
> > Sounds like memory corruption.
> >   
> > > > Zenm and I tested below changes which can also reproduce the
> > > > symptom, so I wonder driver might assume urb is the first
> > > > member of struct, but unfortunately I can't find that.  
> > 
> > That's what it seems to be doing, because it uses usb_init_urb()
> > on urbs embedded in some struct and then usb_free_urb().
> > 
> > If you look what usb_free_urb() does, it decrements refcount and
> > attempts to free urb. But here urb is a member of a larger struct,
> > so I guess the whole struct is freed (and this was either
> > intentional or a bug that didn't happen to blow up yet).  
> 
> That's not ok at all, it's amazing this is working today.  urbs need
> to be "stand alone" structures and never embedded into anything else.

Is it though?

usb_init_urb() is exported and documented as below. Neither of which
suggests that the function must not be used by drivers.

/**
 * usb_init_urb - initializes a urb so that it can be used by a USB driver
 * @urb: pointer to the urb to initialize
 *
 * Initializes a urb so that the USB subsystem can use it properly.
 *
 * If a urb is created with a call to usb_alloc_urb() it is not
 * necessary to call this function.  Only use this if you allocate the
 * space for a struct urb on your own.  If you call this function, be
 * careful when freeing the memory for your urb that it is no longer in
 * use by the USB core.
 *
 * Only use this function if you _really_ understand what you are doing.
 */

I see that there are some sound drivers which embed URBs in larger
structures too, so if this is some tree-wide campaign there is a risk
of breaking them too.

Regards,
Michal

