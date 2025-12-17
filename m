Return-Path: <linux-usb+bounces-31555-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 76FE3CC9B79
	for <lists+linux-usb@lfdr.de>; Wed, 17 Dec 2025 23:32:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 380BD300E4C3
	for <lists+linux-usb@lfdr.de>; Wed, 17 Dec 2025 22:32:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C76D31B132;
	Wed, 17 Dec 2025 22:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BlS+9TqY"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDDC831A803
	for <linux-usb@vger.kernel.org>; Wed, 17 Dec 2025 22:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766010724; cv=none; b=QGsmseCxPOcJyLLgZwQslqgnmA7+PCs8OCToXdwP/bfmkCRD2KJnQd9RTQWGfTXs0rctToJUUP1tSTHK9F9KQGwQihN8kaYJuHgu5L4ekJkEDMYI5WJwYiChlMw3iNncxR1VdPyNqA6cI3TlrSE0pn1nVzsT+/YQVpW/9j8vpc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766010724; c=relaxed/simple;
	bh=T0qprnyzkCqllee0y3moUHDkLXu8Ov8u+m2G0gde7TI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bSuvhsQ3lqoWF/+/Z3yr86TG7p1Nz+2GE/BuS22m3EkTwCLs1lVPkGFvDRy4eOjHs0vQn2YVCMmIKZHw3bWNb/yvBv2PFRFcHGlAeoSzEqaezV3FIlYVBYzmjextQQ3fYkYlTJmmIsNPCzyP6BKuhhgKFdSOpqxFr316b/0RiUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BlS+9TqY; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-42b3b0d76fcso3807351f8f.3
        for <linux-usb@vger.kernel.org>; Wed, 17 Dec 2025 14:31:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766010718; x=1766615518; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L9xZC3AkWLvoYCE+LC0bupKfq74kKT5/LfsWMU3Z49U=;
        b=BlS+9TqYrE/HXv66I+FpgfH/iXbVtlJjxxSwpUJmz2S0iREc4gPZMlCsqGgK1jRQkq
         34HCZGDrIk+0SXRmhtIIajeZcBo83Ym5128v+1/pryMtVN52ZV6E2Yx3KFLXoZhSRLkA
         ysPR0gFtHcm1gq7Ig4K6qlbCEfmOg7AcOVv3/GdRyh6ATWzttzQFED475a+YYRgS7YLD
         aMViq+JF2yJomUMr3Sa+Ke4JT7rcQfCJSj2ccV657aJfXtWhK722T8F5RSqTATLKolo3
         wAejyZEa0vxTckStDoY5bgZeFsYoIwfP1BXnnPgP/auayZ34xTMcYhpS3k2sda7x1WO6
         0VNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766010718; x=1766615518;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=L9xZC3AkWLvoYCE+LC0bupKfq74kKT5/LfsWMU3Z49U=;
        b=sPCIdiMMZjAOXdGK5quysWqob53LZky8bDRwmDuU/l9GYvdAMT2n5Cx/wK33mJc9GC
         +BSFHUCFbE7drVALopxDlU4VrlDC6yL5dMxCeMI2aSztC6uEFAlh136J9/5027oL0KIG
         czLpr9CqY7qHZncgiazH8CJw/MqeeHbec5LC2WYiywEJ1J7XohNauFYe13/TkVPETqed
         XWXZ/+VXicd3tiQW/Ckwr3JAUtNorZ8ifQOhe7lHny4xOksc8/Unl6cqWG5TOeTHGWNk
         uu+6n2uCOvyPko1HfryS01wuNkyNK1pMPZ8JSNgAK6lsh3yZpGXRmf5FBa/XukSbZhTx
         pU7Q==
X-Forwarded-Encrypted: i=1; AJvYcCWaZfC46VGre32rB2w/BqDHwzAx5mXI6VpJGaJr0911tbPNDFNiDmqDVwGOyvFClg4GMTUefiayji4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5gbrnK6xtGTiMgEcj9C30tEbfuNVJ/Uo2wMQuKIvsIShLLerV
	mfsMJSAhoygVPxcb7AhLjlGXMSHZGNeq5aj0/urIVpi2B3WqrthowYkM
X-Gm-Gg: AY/fxX6ccGlNvZy83rnvhPrLkglspaNhnxsspdZlFahLeCv4JUtdybesnijWxTE38jr
	aW+xjIAzd1O4ytNR5ccKYJPrK2PPn9E4U395cb13/x0SEdUeoG1khx+mpOlUihdmruLlQqCyUDC
	/ZEUxMaHRdH7DjV60d9ncUKkkqaRfi9f5r9ylnj8qgOQUY42E5eWLY+u281WB/zP9PNAgWDvAJb
	I6uMqyr4XgLtko2KeTTt97xfWk2SNAaKeIVbz4dp9p9YZQFU3kb7X8TRTk7eFn+GtmO/PRRk7N/
	r2ZbL5mAQQKrzM/pG9hp4zFJZMF83NY9yUCAjdI7SnCWx5hgGe33q9FllNX6V6992jjZf5PDViP
	RmEv1hfuq/WkJU8O3VzPHK3gR/QjqTECHdZ/OCmtqVBEZl2g3ItdJfLwKesqbEEMUCq+vrBIdn5
	GpVj4qtNWf6fKWsaOVdMgg1bRPa51Bzj2ggo0sly210a4kbaS0CQsU
X-Google-Smtp-Source: AGHT+IGAjtsCe1CgOB6Bh4/hmtqRmC0JIqrqfOPjJTopW3ABFAivzVOgBF7fd2YchRnO35zq0uHieA==
X-Received: by 2002:a05:6000:2311:b0:430:ff0c:35f9 with SMTP id ffacd0b85a97d-430ff0c37damr11656138f8f.48.1766010717494;
        Wed, 17 Dec 2025 14:31:57 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324493fda5sm1364377f8f.17.2025.12.17.14.31.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 14:31:57 -0800 (PST)
Date: Wed, 17 Dec 2025 22:31:55 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: Yury Norov <yury.norov@gmail.com>, Rasmus Villemoes
 <linux@rasmusvillemoes.dk>, <linux-kernel@vger.kernel.org>,
 <linux-usb@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Crt Mori
 <cmo@melexis.com>, Richard Genoud <richard.genoud@bootlin.com>, "Andy
 Shevchenko" <andriy.shevchenko@intel.com>, Luo Jie <quic_luoj@quicinc.com>,
 Peter Zijlstra <peterz@infradead.org>, Jakub Kicinski <kuba@kernel.org>,
 <netdev@vger.kernel.org>, "David S . Miller" <davem@davemloft.net>, "Mika
 Westerberg" <mika.westerberg@linux.intel.com>, Andreas Noever
 <andreas.noever@gmail.com>, Yehezkel Bernat <YehezkelShB@gmail.com>,
 "Nicolas Frattaroli" <nicolas.frattaroli@collabora.com>
Subject: Re: [PATCH v2 08/16] bitfield: Simplify __BF_FIELD_CHECK_REG()
Message-ID: <20251217223155.52249236@pumpkin>
In-Reply-To: <20251217102618.0000465f@huawei.com>
References: <20251212193721.740055-1-david.laight.linux@gmail.com>
	<20251212193721.740055-9-david.laight.linux@gmail.com>
	<20251217102618.0000465f@huawei.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 17 Dec 2025 10:26:18 +0000
Jonathan Cameron <jonathan.cameron@huawei.com> wrote:

> On Fri, 12 Dec 2025 19:37:13 +0000
> david.laight.linux@gmail.com wrote:
> 
> > From: David Laight <david.laight.linux@gmail.com>
> > 
> > Simplify the check for 'reg' being large enough to hold 'mask' using
> > sizeof (reg) rather than a convoluted scheme to generate an unsigned
> > type the same size as 'reg'.
> > 
> > Signed-off-by: David Laight <david.laight.linux@gmail.com>  
> Hi David,
> 
> Just one really trivial comment inline. Feel free to ignore.
> 
> Jonathan
> 
> > ---
> > @@ -75,8 +59,8 @@
> >  	})
> >  
> >  #define __BF_FIELD_CHECK_REG(mask, reg, pfx)				\
> > -	BUILD_BUG_ON_MSG(__bf_cast_unsigned(mask, mask) >		\
> > -			 __bf_cast_unsigned(reg, ~0ull),		\
> > +	BUILD_BUG_ON_MSG((mask) + 0U + 0UL + 0ULL >			\
> > +			 ~0ULL >> (64 - 8 * sizeof (reg)),		\  
> 
> Trivial.  sizeof(reg) is much more comment syntax in kernel code.
                                     (common)

Hmm. sizeof is an operator not a function.
Its argument is either a variable/expression or a bracketed type
(I don't usually put variables in brackets).
So 'sizeof(reg)' is nearly as bad as 'return(reg)'.

	David

> 
> >  			 pfx "type of reg too small for mask")
> >  
> >  #define __BF_FIELD_CHECK(mask, reg, val, pfx)				\  
> 


