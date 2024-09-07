Return-Path: <linux-usb+bounces-14820-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A699702C7
	for <lists+linux-usb@lfdr.de>; Sat,  7 Sep 2024 16:46:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A3CA21F225A9
	for <lists+linux-usb@lfdr.de>; Sat,  7 Sep 2024 14:46:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4642E15DBC1;
	Sat,  7 Sep 2024 14:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="i/UyB2wu"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7601A28FC
	for <linux-usb@vger.kernel.org>; Sat,  7 Sep 2024 14:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725720358; cv=none; b=Qcw8fCQt1YF3e1xhEu0eSxsX2qFO8Hy1p89yUrVmd+OzplZklYnJUxBVTiozW+byzZWJw8BZCrEKtNOksYcuR4qn8/AHeSkuMpMlO3phtv3TpeK/eeNx25SO/FaL2/22D1kzM+uESUubBp9nc3maOXBohIJYcJozNKyBpJ/vdF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725720358; c=relaxed/simple;
	bh=3KW+8vZDn7bmreH0NvLasVcUOw54kaykTkEoTe24RvQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QHPi09DCRf94QHs5zVdicWurox5cMDl30mu2p0Tdlum2NHnbSqeViFagNILuPNgXErpz+6GUuikCEZuanbrBTOvDMCtD4bmSRC18rsrLCZ9EF2ugZdZOCmJaLP7gWzxiDQCL4GzXwVdE68v2KqgpUDiX2fXMDuf1zbbpts5DXNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=i/UyB2wu; arc=none smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=g.harvard.edu
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-49bf3b4d07bso73598137.1
        for <linux-usb@vger.kernel.org>; Sat, 07 Sep 2024 07:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1725720355; x=1726325155; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oxOrFNaty7JNsfbJoX0oXukafoOW9gJNMYUI/wybL6s=;
        b=i/UyB2wuMM3JhBqxYcnnYsRlAXTwx0pMQD8bQySwpTW7YJi++O2hV2ku6+aoSPbe0m
         mgSQ82AnX1YJGxd/QIYUQz/DLkn4Gnt1aglStvAVqZiSPKL5OcI71rnokQcug++rEMYw
         HO5e14MygM0zF0LH8qI78SpXwk6e0SqMtvSvNevhQZWC4EOI+d7gGooiyUNxinvXXJrY
         ljiqp+lZtgncVCBdFTqbZJCzgPNj9s5PyefwgG5qqJovgjfRiXhCKo523xN9A6tsqBze
         gRYciHm/K0Kr+JFxzCte9P8e9cSezIijLCdhw5HDZDV50ln98eghgCJcmVUS5zdbOAvY
         gA1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725720355; x=1726325155;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oxOrFNaty7JNsfbJoX0oXukafoOW9gJNMYUI/wybL6s=;
        b=QVKUMbLhmj5hrMNaN1jMe4V1XDvAvcWzNf2PrVR/ayA95D7lwmkim8ILnQUh45j02V
         BsFdaSXKu/1kySsXPBKHIQma+YTRO+e23EEmKjEALmkmzJSIWdvvJP7Sq437aqdk/WcG
         Vgr+4mH/XlY2BCiUBEdPb0jmnDA1jT9SQEEQc5o7ZXivbQ/wvqrht17ZnZOXV9patf+a
         oByje/EDcOkhR5yvu7BEBfRdZFMcYFJFI3Y2YyU/2l1zehg9XJalRnHMIeds24nOh8Ma
         hLoYwjUsVUil1dzX/LGPPW+WkTHI6k966+mJ1IMx71Q7HipmGso39jeVyRXrzg1UDO5f
         +YdQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRMyar7lO4aY/GvwyzmnsxdFo3cvOHyIbhumGv8x3k0PTEqGJmWjVMoV2w6xRuGQlw3BpiuPRHUFk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKYBrf8RPE6OTTPSjYP3/tMHGB8JrtWDrRi7snag5E2iKFsXPW
	1XYjdabX7FNmUln57mCJPEYupd6PBGAamZOtNrnRI8e8LAoyHmsQ0j1milE9pQ==
X-Google-Smtp-Source: AGHT+IET8oByV6Z94LoxErKMm+WE11lJykrg7SK9vQGvNbjMgBF55Fn4F1bqx/m6Z9q0Mr0kbbEp/Q==
X-Received: by 2002:a05:6102:3748:b0:49b:d7e0:1052 with SMTP id ada2fe7eead31-49bde1472b7mr6507041137.1.1725720355341;
        Sat, 07 Sep 2024 07:45:55 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::24a8])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6c53477d348sm4912566d6.132.2024.09.07.07.45.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Sep 2024 07:45:54 -0700 (PDT)
Date: Sat, 7 Sep 2024 10:45:52 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Edward Adam Davis <eadavis@qq.com>
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	syzbot+9d34f80f841e948c3fdb@syzkaller.appspotmail.com,
	syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH V2] USB: usbtmc: prevent kernel-usb-infoleak
Message-ID: <608621b0-6a6b-46d3-bfa8-ff907fb83148@rowland.harvard.edu>
References: <25d5853a-7156-4892-a383-4547e9c95472@rowland.harvard.edu>
 <tencent_F437644B027489769D66E43D51361E965A09@qq.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_F437644B027489769D66E43D51361E965A09@qq.com>

On Sat, Sep 07, 2024 at 10:08:57AM +0800, Edward Adam Davis wrote:
> On Fri, 6 Sep 2024 10:28:11 -0400, Alan Stern wrote:
> > On Fri, Sep 06, 2024 at 10:11:03PM +0800, Edward Adam Davis wrote:
> > > The syzbot reported a kernel-usb-infoleak in usbtmc_write.
> > > 
> > > The expression "aligned = (transfersize + (USBTMC_HEADER_SIZE + 3)) & ~3;"
> > > in usbtmcw_write() follows the following pattern:
> > > 
> > > aligned = (1 + 12 + 3) & ~3 = 16   // 3 bytes have not been initialized
> > > aligned = (2 + 12 + 3) & ~3 = 16   // 2 bytes have not been initialized
> > > aligned = (3 + 12 + 3) & ~3 = 16   // 1 byte has not been initialized
> > > aligned = (4 + 12 + 3) & ~3 = 16   // All bytes have been initialized
> > > aligned = (5 + 12 + 3) & ~3 = 20   // 3 bytes have not been initialized
> > > aligned = (6 + 12 + 3) & ~3 = 20   // 2 bytes have not been initialized
> > > aligned = (7 + 12 + 3) & ~3 = 20   // 1 byte has not been initialized
> > > aligned = (8 + 12 + 3) & ~3 = 20   // All bytes have been initialized
> > > aligned = (9 + 12 + 3) & ~3 = 24
> > > ...
> > 
> > What is the purpose of aligned?  Why doesn't the driver simply use
> > USBTMC_HEADER_SIZE + transfersize instead of rounding it up to a 
> > multiple of 4?
> I just found out that the logic of aligned calculation is like this. 
> As for why it is calculated like this, perhaps Guido Kiener can provide
> a clearer explanation.
> It was introduced by commit 4d5e18d9ed93 ("usb: usbtmc: Optimize usbtmc_write").
> > 
> > > Note: #define USBTMC_HEADER_SIZE      12
> > > 
> > > This results in the buffer[USBTMC_SEAD_SIZE+transfersize] and its
> > > subsequent memory not being initialized.
> > > 
> > > The condition aligned < buflen is used to avoid out of bounds access to
> > > the buffer[USBTMC_HEADER_SIZE + transfersize] when "transfersize = 
> > > buflen - USBTMC_HEADER_SIZE".
> > > 
> > > Fixes: 4ddc645f40e9 ("usb: usbtmc: Add ioctl for vendor specific write")
> > > Reported-and-tested-by: syzbot+9d34f80f841e948c3fdb@syzkaller.appspotmail.com
> > > Closes: https://syzkaller.appspot.com/bug?extid=9d34f80f841e948c3fdb
> > > Signed-off-by: Edward Adam Davis <eadavis@qq.com>
> > > ---
> > >  drivers/usb/class/usbtmc.c | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > > 
> > > diff --git a/drivers/usb/class/usbtmc.c b/drivers/usb/class/usbtmc.c
> > > index 6bd9fe565385..faf8c5508997 100644
> > > --- a/drivers/usb/class/usbtmc.c
> > > +++ b/drivers/usb/class/usbtmc.c
> > > @@ -1591,6 +1591,10 @@ static ssize_t usbtmc_write(struct file *filp, const char __user *buf,
> > >  		goto exit;
> > >  	}
> > >  
> > > +	if (aligned < buflen && (transfersize % 4))
> > 
> > Shouldn't this be
> > 
> > 	if (USBTMC_HEADER_SIZE + transfersize < aligned)
> Logically, it seems possible to write it this way.

In fact, what you wrote is wrong.  Consider the case where buflen is 32 
and transfersize is 17.  Then aligned = (12 + 17 + 3) & ~3 = 32, so your 
condition would fail to initialize the extra 3 bytes.

Alan Stern

