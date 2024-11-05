Return-Path: <linux-usb+bounces-17139-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 349549BD72A
	for <lists+linux-usb@lfdr.de>; Tue,  5 Nov 2024 21:42:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CC99D284690
	for <lists+linux-usb@lfdr.de>; Tue,  5 Nov 2024 20:42:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C59262161F7;
	Tue,  5 Nov 2024 20:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="nb0IBvxg"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADEFE2161EF
	for <linux-usb@vger.kernel.org>; Tue,  5 Nov 2024 20:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730839338; cv=none; b=pIFglOFh7VMOmEW0rorkQtt2upUk10HOEtjO2/K0ZL7fZQfZA4k/wBRV4fxjjpTBOGBj+1r8SvPXCtOyQtg9vexkHS6jQKqh+vwoXdOA7AYs8j9H7n8CFCrdv5Iamo7D/tjfJtf+LEVLPSyGD+pHfjcm4iM1NV6J1nxSkkRst0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730839338; c=relaxed/simple;
	bh=7ON9W20Xj5wUtlNid6FvqrSm4m3tZah7hwTkMZJMwBQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q7WXHQjdHQCjRNRgzVFItcZGyY+LJ1+qnn1JEA2c4P1ob5fws1zBxFbugdY5kvgwMqHoeCXW/WeOx0dqnWVJbV0v6m+2LtE9nnul+JFEFSgXjJQWK82PnFrzojtGps+K0Ixh3sLCha2r7b7W2yJ9+nu/ZI8YNwr6C+1/sHPeKNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=nb0IBvxg; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7b152a923a3so405464085a.3
        for <linux-usb@vger.kernel.org>; Tue, 05 Nov 2024 12:42:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1730839335; x=1731444135; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PKa9cHj9kGwvPwp2QSl7YFPTHIINj3Z23PWuU6t00+k=;
        b=nb0IBvxgqxmC9BvMTxW3mn8Ngqdiu1Amztlz1OX9ixMo1WnxVGrlIbuEJviwUN6nyt
         yd/yZuBcBXMUSdKXKwq1hF6EXaehOlpMTHb2OjOVgwX0A83dxksk8xL+xR5OFrT1LQwF
         OMECFRPwD1M4MXo0QyH5Zgp5LGW9aBocOmUpyLGo6TzsLEgAxAy0iYV1TTI7Ya9JwIHQ
         v37UO1KNrju5O9EQS8VfiJ6q5d9RxqNaeeA/546Dedsiz5ebzoidlcWJ5fqrOb4KTtjL
         CeDTui9Gx77fgX1m1ugEgs3qsApoGpwRFQNBi/a+NOXOfjk5EVLfZxs3yWBfHLs9ji5U
         JnAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730839335; x=1731444135;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PKa9cHj9kGwvPwp2QSl7YFPTHIINj3Z23PWuU6t00+k=;
        b=q5odLW5SkTY865xf1IUOr1OrXM4+8E9faP9lmFd2y5pH/yPsu7KH70ayhdWlbHesFL
         P0m0HRUzXQtye+Twi5FnX9vvngy6AyGiN/hR73E5lVshrPjQpBVmX1mgHOvbT06S9usR
         atXREiwIqgpJNpJyyLbtFPlnRU/Mj3FcMHjizccQVhzf1CnFkJNvRf7wyOGM42ZlORvj
         eqB0n9anEsdXYJfsA4NzbHP0ncmwPMP+W4zKLDueNmu8/ZixRMWmNJAoBMrRnPSllO34
         SXX5Qt223lrMauTFfAYPdJ5K3mofFp8X9Zzrta2qBRnPZY5kkE81xPTPrjDoMI8k/Wwr
         tIZg==
X-Forwarded-Encrypted: i=1; AJvYcCWbEdhqZC+z81AwchfMnkScTFhjDli1EwwhEnTPo/tT5793nMiQhVDnbmT6OV7TwQy6YB8EzruNLgw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMnyUZzIi/a92lHIg3g0yldeSqtFfA3uVq9JeT961+f08f+mD4
	tpCZq3mLL1H8zl9BrUrg2Mm+nIzRcy5bo9fNcdV/VAouWFAcKLz937zc42HT5w==
X-Google-Smtp-Source: AGHT+IGLtHVQCozvs2LpnAtMWfAj3RRmkYSf+6MmmzJ7Zm3md0giCBLprcvqMrc91E/bZGIm2mFmlg==
X-Received: by 2002:a05:620a:2415:b0:7b1:50ba:76e8 with SMTP id af79cd13be357-7b2f24dd667mr2787603485a.23.1730839335584;
        Tue, 05 Nov 2024 12:42:15 -0800 (PST)
Received: from rowland.harvard.edu ([140.247.12.5])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b2f39fb2a4sm559966985a.47.2024.11.05.12.42.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 12:42:14 -0800 (PST)
Date: Tue, 5 Nov 2024 15:42:12 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: syzbot <syzbot+ccc0e1cfdb72b664f0d8@syzkaller.appspotmail.com>,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	pasha.tatashin@soleen.com, syzkaller-bugs@googlegroups.com,
	linux-usb@vger.kernel.org
Subject: Re: [syzbot] [mm?] kernel BUG in __page_table_check_zero (2)
Message-ID: <c5a71213-ca55-4165-8e50-2686d05614e3@rowland.harvard.edu>
References: <67230d7e.050a0220.529b6.0005.GAE@google.com>
 <20241104200007.dc8d0f018cc536a4957a1cd0@linux-foundation.org>
 <f94f3351-be53-4d61-a31a-2bb07925c5ad@rowland.harvard.edu>
 <20241105110236.40819b7effad3f44de73dddf@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241105110236.40819b7effad3f44de73dddf@linux-foundation.org>

On Tue, Nov 05, 2024 at 11:02:36AM -0800, Andrew Morton wrote:
> On Tue, 5 Nov 2024 11:39:59 -0500 Alan Stern <stern@rowland.harvard.edu> wrote:
> 
> > On Mon, Nov 04, 2024 at 08:00:07PM -0800, Andrew Morton wrote:
> > > On Wed, 30 Oct 2024 21:54:22 -0700 syzbot <syzbot+ccc0e1cfdb72b664f0d8@syzkaller.appspotmail.com> wrote:
> > > 
> > > > Hello,
> > > > 
> > > > syzbot found the following issue on:
> > > 
> > > Thanks.  I'm suspecting some USB issue - fault injection was used to
> > > trigger a memory allocation failure and dec_usb_memory_use_count() ended
> > > up freeing an in-use page.  Could USB folks please have a look?
> > 
> > Andrew, I'm not sure what to look for.
> 
> Thanks for looking.
> 
> > Can you read through 
> > usbdev_mmap() in drivers/usb/core/devio.c, along with the four short 
> > routines preceding it, and let us know if anything seems obviously 
> > wrong?
> 
> All I see is lots of USB code which I don't understand ;) It seems odd

Well, I wouldn't expect you to understand the USB-specific stuff.  I was 
really asking about the memory-management calls and error handling.

> that usbdev_mmap() calls dec_usb_memory_use_count() on some error
> paths, but goes direct to usbfs_decrease_memory_usage() on others.

The paths that call dec_usb_memory_use_count() are those on which a 
memory buffer has been allocated and needs to be deallocated.  That 
routine then calls usbfs_decrease_memory_usage() as needed.

> Did you try running the "C reproducer"?

No, I haven't.  I haven't had much time to work on this.  In fact, I 
couldn't even tell exactly which call in dec_usb_memory_use_count() 
caused the fault; the line number listed in the bug report didn't match 
up with any obvious suspects in my copy of the kernel source.  Was it 
the kfree(usbm) call?

Alan Stern

