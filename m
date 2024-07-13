Return-Path: <linux-usb+bounces-12189-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6050E930354
	for <lists+linux-usb@lfdr.de>; Sat, 13 Jul 2024 04:23:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1A80B281283
	for <lists+linux-usb@lfdr.de>; Sat, 13 Jul 2024 02:23:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5675F17591;
	Sat, 13 Jul 2024 02:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="ifBQmJ7h"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 540F917557
	for <linux-usb@vger.kernel.org>; Sat, 13 Jul 2024 02:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720837349; cv=none; b=BrWVPwLAcnI4zC80j+abFUDTrdg18mZW11VcI+T+N0HciC+h8HYVbkqQ5wq7loVNnUlXYj1Nf2Sjp+k+VfANHE5THmQNqkWPqgS8zOpDhpufpXL5Esihw7x6jG+/LyE/6nJ88n4DQiK4gyJKN08oADXN3ucn8O587t3jYh7yskE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720837349; c=relaxed/simple;
	bh=lXqgkt2H22OrWd0Xr/ds8mNtVYxJTGNWblZs/3ShZU8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=auByjlRnZ1E5QaEhS04DIodCIfRxUJPpfJvr9oq953+QT0BTLtABKrfKV163KzyxnGFflIkz0J3oBuHceaDDdjeExOdF5XG6vX83kOVlv3oxMkUnSZEKDDeLeoS419T+F4xHL/iT16GnvZZz+mlEEWm9t8dX8DEa33WqGwLhjhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=ifBQmJ7h; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-79f0c08aa45so181108585a.0
        for <linux-usb@vger.kernel.org>; Fri, 12 Jul 2024 19:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1720837347; x=1721442147; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KcCJozulqARBvuu4ti/BgXI4cG4IJiyyKAoDsbuvkyI=;
        b=ifBQmJ7hifOOeiJtURNJ5zcqjDfweQa8HxFZJOFQ7bphSMGl3KOyrVh2X15Jyh/dFo
         YS0Xxs4ZWN2mzjvamMxvQrt4y1fYCI1Gnj1dGu6OZTTReAwxlYScvJ9SpUjIQXc278Sg
         eo1XxmdSEi5w86KDVWUVwjJ2LXmyKPFc33eb0y2zi8CxLz4+aOghxvL9uH7Sk+nFBsGY
         iO4xVLbepcR/8AZBc8PY7pgg2qcoPN85ECUu16Q56ZgSjd14cO465002OVru0w6VN0P8
         /efj9tPdbZAEKje3Nigm508CxkcFGdRiiZnmb6mlJXgVdz8jPVy4a9dR9V/0gb+QmXfv
         70tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720837347; x=1721442147;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KcCJozulqARBvuu4ti/BgXI4cG4IJiyyKAoDsbuvkyI=;
        b=OPwBx2fkSqx6C4fdVFhMCOMOzICocYR10tirSyOkc1Vigwdgp6ZWqgBmNLijQczq7W
         TT9fNKBpHGvLG1QwzRrgVNmhqsD4VKJ0v04nMRaRSQhzEkPyp1v7J+moPXUsUgdcIpvp
         STYGfa4VHPzsG3eqIMxTquxbfTKGZz3ek3WdJcvAqA1lEGV5teytRDHQl95PKoH79Qdd
         zFtoj2FUzUFaGbgIMZHDyG6arZJIpjE2fffaQDBukAVALenN4dAwwFM24O5KRuPScIfT
         N124JzOwrkrjhLXaSLQk3bNnKGSikSIb6gzORZLB6t2KXFOE0IjnxOnXP2QGltc5NRoV
         UaFA==
X-Forwarded-Encrypted: i=1; AJvYcCUOWBefj7Blv7Mcr5XCqZrEv7lzLAqOiqTiQO4pQIot6uhmUanVw9EQEmoFVLWhO717b4FJJYKyfqkF1GHkWp42/P2u2Ovqph3n
X-Gm-Message-State: AOJu0Ywy0ojfTilmR3n0+FcSGqss9NqMA8IbHFrUBO9ncFtAaduRNR0/
	Uy0lXrx2AxaxX0KKU5UJpXiZ+8Z8XWnAC6qnN+kHGMnz0kBQwu48TXXTU7O1NlbLi0P1tH9lqc0
	=
X-Google-Smtp-Source: AGHT+IHI0rkfaG2cSk9khBWAyN7byMc87Kw8sb7ZOHvEZC2TVKLMXwflVSRFs9KJYlTz3UJkFFzIZA==
X-Received: by 2002:ae9:f717:0:b0:79f:f1:2a with SMTP id af79cd13be357-79f19a64fa4mr1324430585a.28.1720837347270;
        Fri, 12 Jul 2024 19:22:27 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::cad7])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a160c63880sm10444485a.72.2024.07.12.19.22.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jul 2024 19:22:26 -0700 (PDT)
Date: Fri, 12 Jul 2024 22:22:24 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Hongyu Xie <xy521521@gmail.com>
Cc: gregkh@linuxfoundation.org, oneukum@suse.com, brauner@kernel.org,
	jlayton@kernel.org, xiehongyu1@kylinos.cn, jack@suse.cz,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH next] usb: usbfs: Add reset_resume for usbfs
Message-ID: <8a16e1c2-fd59-4279-8b36-806a214385b6@rowland.harvard.edu>
References: <20240711084321.44916-1-xiehongyu1@kylinos.cn>
 <527927b8-9475-47da-bf2b-7a5d9e81e470@suse.com>
 <a782c5bc-fc8b-43ad-9c6e-1e6799243364@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a782c5bc-fc8b-43ad-9c6e-1e6799243364@kylinos.cn>

On Fri, Jul 12, 2024 at 11:10:57AM +0800, Hongyu Xie wrote:
> From: Hongyu Xie <xiehongyu1@kylinos.cn>
> 
> 
> 
> On 2024/7/11 16:59, Oliver Neukum wrote:
> > 
> > 
> > On 11.07.24 10:43, Hongyu Xie wrote:
> > > During hibernation, usb_resume_interface will set needs_binding to 1 if
> > > the usb_driver has no reset_resume implimentation. The USB interface
> > > will be rebind after usb_resume_complete.
> > > 
> > > Normally, that's fine. But if a USB interface has a matched kernel
> > > driver, and a userspace driver or application is using this USB
> > > interface through usbfs during hibernation, usbfs will be
> > > detatched with the USB interface after resume. And this USB interface
> > > will be bind with a kernel driver instead of usbfs.
> > > 
> > > So add reset_resume to fix this.
> > 
> > The device has lost all settings, yet we continue like nothing
> > changed. That strikes me as a very bad idea. If a device has undergone
> > a reset user space has not requested, we need to return an error upon
> > the next interaction.
> Sorry I don't understand your concern.
> When will "a reset user space has not requested" happen if there is a
> reset_resume in usbfs?

That's what a reset-resume is: a reset that occurs when the device is 
resumed, rather than when the driver has requested a reset.

Alan Stern

> > I am sorry, but this implementation has some fundamental issues.
> > 
> >      Regards
> >          Oliver
> > 
> Regards
> Hongyu Xie

