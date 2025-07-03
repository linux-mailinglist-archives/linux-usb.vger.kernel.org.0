Return-Path: <linux-usb+bounces-25453-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F203FAF78DD
	for <lists+linux-usb@lfdr.de>; Thu,  3 Jul 2025 16:55:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4AB681CA1CF1
	for <lists+linux-usb@lfdr.de>; Thu,  3 Jul 2025 14:53:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12DA02EE99E;
	Thu,  3 Jul 2025 14:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="gYSi0W6h"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDA822EF9DD
	for <linux-usb@vger.kernel.org>; Thu,  3 Jul 2025 14:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751554325; cv=none; b=IZPnaFCr7Lwrk99k8G2Thm3ExKD4ihSl/yrwN/r7d84BVu7c+wINFNZz87MHkmCYIY+NhiKzTVE9Ax9hp/Lvx07e8YXY17k08IEnxrLMLHR2AGhdn1+Xz+WaVrAywQYYfNOhz/Wv3HYM8l2YlVXnytb+RsV7du0PreS5Crj+FfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751554325; c=relaxed/simple;
	bh=d0+0lXZ2xGDYC38FIser6Tvp0s7IlMQzz6aQcxfr7KI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NuY89lg953VSpifuNiVqaMFXI3uDFw28a//mGLe5AN+2g0VrR7nN7k3ZILAAx4dOc5N+J3BQFvPDxx7UPnQstNtQggtoJBWy5E+44rWDDAlAdn5AD6qaTKRCAaOiXiDABGN/5/J9tNpsbVgupf5O5GH6vtMeBg+AxQjUfVGlMR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=gYSi0W6h; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7c5b8d13f73so528914585a.0
        for <linux-usb@vger.kernel.org>; Thu, 03 Jul 2025 07:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1751554323; x=1752159123; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Az2cyM/gjMIxIEBmrX3av08IIbmE67znp+KEy+dKSZs=;
        b=gYSi0W6hPOF7DErkBTSZzNZi8/i9v3yM6IXLCbTpcYg3JsBjMg/KbhxlN0y0ziR/Ap
         SWiYtcyVd00SG7WXQGlOcCYnJ0JVknlQtK3ao7jCp9ueIOtyXfM9+kDLPa8qhka/GpsH
         fYtNqG1DLWp6F2Pnj+TB0ES89zsbCMLgMB8CwaAEfyC0vV9Jso74I81OFyvEOZg1Assf
         siFlQH6TJZbgH6Au/+T3l3q+Yq8ohysLr7hG1Bow7GFO7EsTReeWm2bwx1rxzMo+mfKG
         1zazlLI+koN5q4qIgl3l51pPZUEQrRKGgU8YRShvK4zgcq2dY38Hku6tmCP9dFjCGWY9
         mp2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751554323; x=1752159123;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Az2cyM/gjMIxIEBmrX3av08IIbmE67znp+KEy+dKSZs=;
        b=sGr5lRLiWPljHh2nr2blquDeIDsD+0o3FD98rSW9p2iwPGayHMO8fJmHfdsojZm4Xu
         msyk5ypLySYvelhJ0k0+1Mxr9+fmBDRq2bmlwTBM6vPKxMJ8w6cpLBWNC8XxKWYTPUA+
         WpATqADeECZ6ldGCux5wfFN6TlBXS5fBQ5Cvj/3MIPH8kRiZrq6WvD461UwraH4T844E
         PYwNltaIUoUd5COKWfCjGnFKZ6xJCZh2mMoTWjetZM95zYXIIx46Fmkj69nDQIk70wqU
         41MkU76xiZn4m+1Fcj/s6IWM4RkRjqEZ3I4JBQf0cNS6Aoie2qi7OTlqWFPNFy4ezxWo
         cyBg==
X-Forwarded-Encrypted: i=1; AJvYcCVEV8Yu8aJ26N5KiJCAF3Bof2cpFsidD3/b/rFUVNgwgNeSnPgTjLj9B/UcIvcyoTfy4PpfGDaOtAo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzpVt82oawzeOf/4Qkwp+onVN3CP+m4TYT+YCGzV9VWbEfrcf6S
	7AebxW4yqeMIJrcUNAT5vJ0XNc8toCrKMgMs7SslQTKZsmMH4Zl5/dBdowR3JveD+Q==
X-Gm-Gg: ASbGncv/ntBcqQe25GJeem1Py06UoTcUPA2cPNmvltjLCWbvHkCm4oX0A2fTI9RU3S8
	T4ZWqVCBUdruY8B9VntndNMWfhPV3PUTGUEaA03zuARj1hjCLj8llpVUyep3gwGPi4U3MWHz/bt
	rgt7RbwRhfVxHsoNJVoM29gUMVKOa9ZA29bzyiuJaT8TUfE1fJ/ifJ9A59U/j7MK2W/arhRCv47
	YHHNVNV7rmpjyI8qEvVcxLPJP3MR9GLiUP78H8McOyCCNQlG6DB8tAZ6dQ5bxB7h0NWRlD+Dfdj
	ydj2wFV0qcamSZYZ36MHceC7oxjyP9ZwXFQwrUGtGuypNZWVAFN4zQnthSpEr6+JbLJKhorYL2I
	hsDg6
X-Google-Smtp-Source: AGHT+IEKOdDqVDrQNfxOjGelYBw6lraeZVcm6GCMhToQ2A62O0hpizVBk+wIs+TJClOc+gapSrcZgQ==
X-Received: by 2002:a05:620a:29d0:b0:7d3:f3e1:b8c4 with SMTP id af79cd13be357-7d5c471911cmr928652085a.15.1751554322680;
        Thu, 03 Jul 2025 07:52:02 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d5dbdbd172sm674185a.42.2025.07.03.07.52.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 07:52:02 -0700 (PDT)
Date: Thu, 3 Jul 2025 10:51:59 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Manas <manas18244@iiitd.ac.in>
Cc: Hillf Danton <hdanton@sina.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Pete Zaitcev <zaitcev@redhat.com>,
	Paolo Abeni <paolo.abeni@email.it>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@suse.de>,
	syzbot+86b6d7c8bcc66747c505@syzkaller.appspotmail.com
Subject: Re: [PATCH] usbmon: Fix out-of-bounds read in mon_copy_to_buff
Message-ID: <34123da4-56ca-4ecf-ae38-71dc1e59109e@rowland.harvard.edu>
References: <20250703-fix-oob-mon_copy_to_buff-v1-1-1aa7f5723d91@iiitd.ac.in>
 <2025070322-overstay-compacter-3544@gregkh>
 <uew7bu3uxpppew5bhnpzw2oiqyrzv64co54fjthwnhqtnybv6o@lh5pzvkubzo3>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <uew7bu3uxpppew5bhnpzw2oiqyrzv64co54fjthwnhqtnybv6o@lh5pzvkubzo3>

On Thu, Jul 03, 2025 at 11:10:14AM +0530, Manas wrote:
> On 03.07.2025 07:12, Greg Kroah-Hartman wrote:
> > On Thu, Jul 03, 2025 at 02:57:40AM +0530, Manas Gupta via B4 Relay wrote:
> > > From: Manas Gupta <manas18244@iiitd.ac.in>
> > > 
> > > memcpy tries to copy buffer 'from' when it is empty. This leads to
> > > out-of-bounds crash.
> > 
> > What exactly is the "crash" that you are seeing?  What is reporting it,
> > and how?
> > 
> Hi Greg and Alan,
> 
> I ran the reproducer[1] on my machine and got the following stacktrace.
> 
> ```
> [   41.601410][  T769] ==================================================================
> [   41.601908][  T769] BUG: KASAN: slab-out-of-bounds in mon_copy_to_buff+0xc6/0x180
> [   41.602405][  T769] Read of size 832 at addr ffff888043ee6081 by task kworker/0:2/769
> [   41.602898][  T769]
> ```
> 
> which led me on a different path. I assumed that out-of-bounds was occuring in
> `mon_copy_to_buff` without realizing it may be the caller at fault, as Alan
> pointed out in his feedback.
> 
> I now notice that my stacktrace is also slightly different (or rather
> incomplete) as compared to the syzkaller report which says
> 
> ```
> BUG: KASAN: slab-out-of-bounds in mon_copy_to_buff drivers/usb/mon/mon_bin.c:252 [inline]
> BUG: KASAN: slab-out-of-bounds in mon_bin_get_data drivers/usb/mon/mon_bin.c:420 [inline]
> BUG: KASAN: slab-out-of-bounds in mon_bin_event+0x1211/0x2250 drivers/usb/mon/mon_bin.c:606
> Read of size 832 at addr ffff88802888f1e1 by task kworker/0:2/979
> ```
> 
> where it does mention that the issue is in the caller. The caller must ensure
> the correctness of write buffer.
> 
> Also, Hillf has produced a patch [2] which looks better than mine.
> 
> 
> [1] https://syzkaller.appspot.com/text?tag=ReproC&x=1770d770580000
> [2] https://lore.kernel.org/all/20250703043448.2287-1-hdanton@sina.com/

Hillf's patch isn't right either.  The problem is that 
mon_copy_to_buff() is being called with invalid arguments.  The proper 
fix is not to check for bad arguments but rather to adjust the code that 
computes the bad argument, which in this case is either mon_bin_event() 
or mon_bin_get_data().

mon_bin_event() goes through a fairly long preparation, and it may 
calculate length incorrectly, although at the moment I don't see how.  
mon_bin_get_data() seems to be pretty straightforward.

I would start by figuring out which pathway is involved in the error and 
logging the incorrect values to see where they come from.

Alan Stern

