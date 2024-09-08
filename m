Return-Path: <linux-usb+bounces-14827-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC229704AD
	for <lists+linux-usb@lfdr.de>; Sun,  8 Sep 2024 03:32:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EF2A6282ECE
	for <lists+linux-usb@lfdr.de>; Sun,  8 Sep 2024 01:32:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A19CC149;
	Sun,  8 Sep 2024 01:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="ch5x+9N8"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9342AAD58
	for <linux-usb@vger.kernel.org>; Sun,  8 Sep 2024 01:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725759154; cv=none; b=YXO3NAFMFahCE+CR3B9Yix3LkKHw/pp9jyH294JDI8teOxKlwH6tGrUMVgM2d4V69LPox0NQM0HW+g1FPVT+MVRAEugRYy99p1gnkikS7lZjsDjTh0Ux4nEE7vq9dUNKTTmmGnda0+IWXg1if4YR0s/9DqzFek6hGpeINXrShN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725759154; c=relaxed/simple;
	bh=hKKPrhvk14EZlKerHFzr+o5mjVyRnH+68FGtfUi4GTM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sCt9y5pl58FCpwxFq70JhP1HwS++JqQx+IwFl2QtrL+4yAujkGT7tFVDzyf6xb1QVD02b+ZkktndYzMGRgaRYpbv5HwRyJv9Jrd/7W10KKIvcg4Bqk9glA39TpSoC/rRV5I3qf3sh7bmtif0M39+oPS437mt88/x8CFWdOpjqIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=ch5x+9N8; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4581923a808so13805431cf.1
        for <linux-usb@vger.kernel.org>; Sat, 07 Sep 2024 18:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1725759151; x=1726363951; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XqhzG69FhmPvUqQiSYYodLu6SyGwrpnLkUGTb3WY0+Q=;
        b=ch5x+9N858Lm8ioXzP6BdQPABV3i+ItOj9O2JRqrMX5R99N6vLBlYrSds1RAPgg1tI
         knBJgYtBgKfUEPhAog5eYbYW+qCyZ7ksVJ0AQvhVyZb8M/2EFqOgv43H4cZaJwATmFUR
         Ur1IisZXEBZkVsNkDguLkYZePcTDvKLyTzB/lenau0yic4tup+k4YKwUlZBbE8G6LXl4
         h8nDbV5uROFp8ZgjG947G7mI+E9xzcGEqxkQJXk2i9rYl/2zmi5lQTGqxtWhPSrk7B0y
         q9wMI6IOMXn8WPx3JNZGfiplpgeiLY6EnFObdbdwi+BdGynZammdyoS5P9kJySInwQ0T
         0gWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725759151; x=1726363951;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XqhzG69FhmPvUqQiSYYodLu6SyGwrpnLkUGTb3WY0+Q=;
        b=YB+/l3RBK3xTfNSrOpFAVbcNyBwq4l+p6+taqw4rPECsRDsHJgJf9F5aUkYNryhyp1
         YPEtoKhUKLbWP9h/4IgUBaLUIF6AK4h8diYbfBuIxN1q/wu8/jde0Hx974swJN9EKO8J
         ZddcQkbMqDDcwrXdr78cfWOPr1iwdW6ol/VwkFhmTgQUrYTRe6GGjkkhXJ4AE8X2k7l2
         yZlE1fWitd9dUxqA8UJcfFadiqZA4M/CvczyHA2y1ykjUEr7TMtl1SIJms6DsPTwsLb+
         RAURowduNNQtG3uWvBieQvm7imD+gn7nDb09Xz/41hgKz76xxoVbc3jV+qpHlUp8TOCk
         ttug==
X-Forwarded-Encrypted: i=1; AJvYcCWjMp10EdwdpggOxDcam21Cq0DUg7KlSNVud7AVJRdQnKFehpnVYcxVRtu5KUKXYZY17/G4bh7Nc4A=@vger.kernel.org
X-Gm-Message-State: AOJu0YyRRtpGjd58mbtcG5EneLGKy6aRPD3Mc90hX0J6XdUay5vbHEzw
	YG536PUQ0GRsyzN3hI+hp/NSQ30n4BOotIAIYbTe3Tm4nt+YHR0RH1T3Pd2DlALjWFE2zO0r/eM
	=
X-Google-Smtp-Source: AGHT+IGpUoaFReZ7CcIPfT1ltSdw6d9EzTPoPtR3kdTXbPw5IKh+JiatVZ8tVEskyhbGMorR4+lZfQ==
X-Received: by 2002:a05:622a:2a08:b0:458:27a6:a1a8 with SMTP id d75a77b69052e-45827a6a63cmr32868791cf.27.1725759151329;
        Sat, 07 Sep 2024 18:32:31 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::24a8])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-45822e7f569sm8852391cf.31.2024.09.07.18.32.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Sep 2024 18:32:31 -0700 (PDT)
Date: Sat, 7 Sep 2024 21:32:28 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Edward Adam Davis <eadavis@qq.com>
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	syzbot+9d34f80f841e948c3fdb@syzkaller.appspotmail.com,
	syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH V2] USB: usbtmc: prevent kernel-usb-infoleak
Message-ID: <3b4b8e7f-57b2-4ca1-8dc1-63faef573df3@rowland.harvard.edu>
References: <608621b0-6a6b-46d3-bfa8-ff907fb83148@rowland.harvard.edu>
 <tencent_13C00D8E12545D9DDDE1193ECFED8D83A507@qq.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_13C00D8E12545D9DDDE1193ECFED8D83A507@qq.com>

On Sun, Sep 08, 2024 at 08:59:48AM +0800, Edward Adam Davis wrote:
> On Sat, 7 Sep 2024 10:45:52 -0400, Alan Stern wrote:
> > On Sat, Sep 07, 2024 at 10:08:57AM +0800, Edward Adam Davis wrote:
> > > On Fri, 6 Sep 2024 10:28:11 -0400, Alan Stern wrote:
> > > > On Fri, Sep 06, 2024 at 10:11:03PM +0800, Edward Adam Davis wrote:
> > > > > The syzbot reported a kernel-usb-infoleak in usbtmc_write.
> > > > >
> > > > > The expression "aligned = (transfersize + (USBTMC_HEADER_SIZE + 3)) & ~3;"
> > > > > in usbtmcw_write() follows the following pattern:
> > > > >
> > > > > aligned = (1 + 12 + 3) & ~3 = 16   // 3 bytes have not been initialized
> > > > > aligned = (2 + 12 + 3) & ~3 = 16   // 2 bytes have not been initialized
> > > > > aligned = (3 + 12 + 3) & ~3 = 16   // 1 byte has not been initialized
> > > > > aligned = (4 + 12 + 3) & ~3 = 16   // All bytes have been initialized
> > > > > aligned = (5 + 12 + 3) & ~3 = 20   // 3 bytes have not been initialized
> > > > > aligned = (6 + 12 + 3) & ~3 = 20   // 2 bytes have not been initialized
> > > > > aligned = (7 + 12 + 3) & ~3 = 20   // 1 byte has not been initialized
> > > > > aligned = (8 + 12 + 3) & ~3 = 20   // All bytes have been initialized
> > > > > aligned = (9 + 12 + 3) & ~3 = 24
> > > > > ...
> > > >
> > > > What is the purpose of aligned?  Why doesn't the driver simply use
> > > > USBTMC_HEADER_SIZE + transfersize instead of rounding it up to a
> > > > multiple of 4?
> > > I just found out that the logic of aligned calculation is like this.
> > > As for why it is calculated like this, perhaps Guido Kiener can provide
> > > a clearer explanation.
> > > It was introduced by commit 4d5e18d9ed93 ("usb: usbtmc: Optimize usbtmc_write").
> > > >
> > > > > Note: #define USBTMC_HEADER_SIZE      12
> > > > >
> > > > > This results in the buffer[USBTMC_SEAD_SIZE+transfersize] and its
> > > > > subsequent memory not being initialized.
> > > > >
> > > > > The condition aligned < buflen is used to avoid out of bounds access to
> > > > > the buffer[USBTMC_HEADER_SIZE + transfersize] when "transfersize =
> > > > > buflen - USBTMC_HEADER_SIZE".
> > > > >
> > > > > Fixes: 4ddc645f40e9 ("usb: usbtmc: Add ioctl for vendor specific write")
> > > > > Reported-and-tested-by: syzbot+9d34f80f841e948c3fdb@syzkaller.appspotmail.com
> > > > > Closes: https://syzkaller.appspot.com/bug?extid=9d34f80f841e948c3fdb
> > > > > Signed-off-by: Edward Adam Davis <eadavis@qq.com>
> > > > > ---
> > > > >  drivers/usb/class/usbtmc.c | 4 ++++
> > > > >  1 file changed, 4 insertions(+)
> > > > >
> > > > > diff --git a/drivers/usb/class/usbtmc.c b/drivers/usb/class/usbtmc.c
> > > > > index 6bd9fe565385..faf8c5508997 100644
> > > > > --- a/drivers/usb/class/usbtmc.c
> > > > > +++ b/drivers/usb/class/usbtmc.c
> > > > > @@ -1591,6 +1591,10 @@ static ssize_t usbtmc_write(struct file *filp, const char __user *buf,
> > > > >  		goto exit;
> > > > >  	}
> > > > >
> > > > > +	if (aligned < buflen && (transfersize % 4))
> > > >
> > > > Shouldn't this be
> > > >
> > > > 	if (USBTMC_HEADER_SIZE + transfersize < aligned)
> > > Logically, it seems possible to write it this way.
> > 
> > In fact, what you wrote is wrong.  Consider the case where buflen is 32
> > and transfersize is 17.  Then aligned = (12 + 17 + 3) & ~3 = 32, so your
> > condition would fail to initialize the extra 3 bytes.
> The buflen is equal to USBTMC_BUFSIZE and can not equal to any other value.
> You can find it in usbtmc_create_urb() and usbtmc_write().
> 
> Note: #define USBTMC_BUFSIZE          (4096)

All right, so what happens if transfersize is 4081?  Then aligned will 
be equal to 4096, so your condition would fail to initialize the extra 3 
bytes.

Alan Stern

