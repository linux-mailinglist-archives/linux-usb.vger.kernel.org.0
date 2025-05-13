Return-Path: <linux-usb+bounces-23928-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EA256AB5D59
	for <lists+linux-usb@lfdr.de>; Tue, 13 May 2025 21:47:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D4E0419E4D99
	for <lists+linux-usb@lfdr.de>; Tue, 13 May 2025 19:47:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 689DD2BFC9D;
	Tue, 13 May 2025 19:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="iE6bub0D"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DABB3596B
	for <linux-usb@vger.kernel.org>; Tue, 13 May 2025 19:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747165608; cv=none; b=DTSAxjyDQYfLMt5RuOb/S+0NJau4CmBsGPiKg2JvPkkzXKU41w1lrtGZNlHxSOtZvT8YL4rqidS/hNCCUH3+hvOuiw07IMckMRKFiOMcm99rVUqc1ZzHoWr+rdu/TqO740Od1d63oJYodH6cbX5Qevoa19ivNIpmSwiVIZCgp3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747165608; c=relaxed/simple;
	bh=MszmKtBNtjS/mCXs9S5eoJis8nie5o+i/1key2F4EpA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ah+Osa8Gsf8iqsT8JMRAz2tMpniiu+9EhWTq1JnjhUBFOvtfCHlpqZURiUUTdA7D8hebhgJ7RqE5AvrWmEaeBran4HPZsq/gGnVFkpUOvZRML6+vu0u+WwF9ZytI2kCkxirfBRUIRyMbXWWGj8B1o68mXpz6SbJYTjxKW2sxmHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=iE6bub0D; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6f53c42cea6so57437156d6.0
        for <linux-usb@vger.kernel.org>; Tue, 13 May 2025 12:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1747165604; x=1747770404; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8Gfow+0jLuuX+jpDPFCaVboVDazQRdjtB0gETvpjt9w=;
        b=iE6bub0DTWAtC297gUbFgS9sBUm2+JTh2uqjUS3Y+Ud8vrLrIZVU/ij/k0dZlgnFod
         dXcdS89R43Lc3fe+4ljKfo9at6OFgd3ZPq1wVG3LQmf5L9JIdJoIUxLOkmzAaOZpIKdd
         mPIhw1s7B0z1h1G2m5xfhYCrpzLb8OSEMTzaJK/l02Bq+l3DcQQVJ8ZNrU42pqaDTbOJ
         rXjiJmxIKHW3FmLGH3XDT2tHecwm5xHCpXPypQvWOHmRh3hicuEsc5rqnqO4PUCRbZPc
         XpP3fmHSkOTjSWg+0Z+m3SshYfS83VmvjhyKvttNLyKnRtMyCqPnBUD3MElv9h4VArMW
         EDfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747165604; x=1747770404;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Gfow+0jLuuX+jpDPFCaVboVDazQRdjtB0gETvpjt9w=;
        b=gGcNaG2RakvSnKzbLlEyS9Gm+jKBaIXjFAZmwX8+l/BP4p/bTi1mJIn3vFWuFa2yD8
         J7UOh9aRPPD0pXgOSu0YolYzH54+09XZ4iqDEXaRiZbbzaNA+IuCnhZnl919UVprEdW0
         o8GlCdtekoofO7Uki4w7znYZ2pGJCdI/x+umDcKvfxQJUrEOC/U2/G9w0/VwXZ/u1iLb
         hNpTFLY8WPssPsmh3w8f5ubIiLiJisLUqXxJfnsgnrNcp9Iqz24wYGZ/DHI2mpEpK8TL
         kRkY1xcjemKJd+GTrPrZcbJ5mtqzQdt0Tm3e0rccfvJxsEc8zQz3MM8kIHMY4SxbNObj
         Jn5g==
X-Forwarded-Encrypted: i=1; AJvYcCVQtx7P76pPaIpWCrBJ66XsfFyon40Y0eYGf/NnALz+zf7xUzLfuS4wEPYfL6WSIb7XgRQdgYcdagY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxl05fVXayX44NKZKieodoNOlmJGTPaMIlX+ZZR9jMkijaSU+NH
	ApcEW3VUV9hdLeJxiGlE3GjHFWObS3s0nJlfSjylen0426oh+n7eY5uQdGW1ow==
X-Gm-Gg: ASbGncvBfy19iHBmP9oyi+yR+3cK2yzEMBZMVw9gMtN3NMbYqPcglFg60Fv8+yMeDoF
	jQEPvsnzKCWKbWQ1oVlOWKcHsyOueBmXQDOqv5K3XwemfrDG7JkFUHkm9sZJxMXwshRdx6XD+Ef
	xjR3uKe8YNM8age6fg7rYZYn7/qP9yVmWUlO73VCqc54wFGcPoCgwh5paDLXBjuioITH2dhcmK1
	k7FFVVxtRqtqODFCZ+O0ayoB/8rhR7kL2kcrFLX1Sd7PbNh8gKoi3E/1Io4/r+kXuTFHQCrfK0y
	b+BR7rtrVTfBRrbIPO7ljBuaB0F7iAqqo2Kqux1ExWt72wUKRwQYx/MKr36uSzXyZ7PnhFq32qN
	YSg5qPA8xdTXh7uRdaTzMfuAHaZ0Vv4bLWu9QxX/+Mgrp
X-Google-Smtp-Source: AGHT+IEQ1s26wkUIF5mIfJy/X2WZMgbORKbbBrxgLhKcXjfhLXPfNrdW83rnhJVDuRATHDAgFIYlmw==
X-Received: by 2002:a05:6214:1bcb:b0:6f5:dd5:a594 with SMTP id 6a1803df08f44-6f896dfb53emr11435646d6.5.1747165604259;
        Tue, 13 May 2025 12:46:44 -0700 (PDT)
Received: from rowland.harvard.edu (nat-65-112-8-28.harvard-secure.wrls.harvard.edu. [65.112.8.28])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f6e39e09b4sm70419606d6.6.2025.05.13.12.46.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 12:46:43 -0700 (PDT)
Date: Tue, 13 May 2025 15:46:41 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: David Wang <00107082@163.com>
Cc: mathias.nyman@intel.com, gregkh@linuxfoundation.org, oneukum@suse.com,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] USB: core: add a memory pool to urb for
 host-controller private data
Message-ID: <110b763e-30c3-4e2a-b06c-339e086a48fd@rowland.harvard.edu>
References: <20250512150724.4560-1-00107082@163.com>
 <20250513113817.11962-1-00107082@163.com>
 <8c963ad0-a38f-4627-be11-80ccb669d006@rowland.harvard.edu>
 <69accee9.accf.196ca18308a.Coremail.00107082@163.com>
 <b334ef97-1f79-4dd9-98f6-8fd7f360101e@rowland.harvard.edu>
 <40618da9.b062.196ca805193.Coremail.00107082@163.com>
 <ed0c2f75-f97b-4cad-ad35-78361edf142b@rowland.harvard.edu>
 <3aed7b55.b165.196caf9f5ec.Coremail.00107082@163.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3aed7b55.b165.196caf9f5ec.Coremail.00107082@163.com>

On Wed, May 14, 2025 at 02:48:21AM +0800, David Wang wrote:
> It is not an "extra" memory area,  the memory is needed by HC anyway, the memory pool just cache it.
> And about not freeing memory until URB released,  you seems forgot that we are talking 
> about "memory pool" .  A URB only used once could be considered a memory pool never used.
> 
> If your memory pool approach would not  "waste" memory, I would  rather happy to learn.

Here's a simple example to illustrate the point.  Suppose a driver uses 
two URBs, call them A and B, but it never has more than one URB active 
at a time.  Thus, when A completes B is submitted, and when B completes 
A is submitted.

With your approach A and B each have their own memory area.  With my 
approach, a single memory area is shared between A and B.  Therefore my 
approach uses less total memory.

Now, I admit this pattern is probably not at all common.  Usually if a 
driver is going to reuse an URB, it resubmits the URB as soon as the URB 
completes rather than waiting for some other URB to complete.  Drivers 
generally don't keep many unused URBs just sitting around -- although 
there may be exceptions, like a driver for a media device when the 
device isn't running.

> I want to mention the purpose of this patch again:  
> A lot of "private data" allocation could be avoided if  we use a "mempool" to cache and reuse those memory.
> And use URB as the holder is a very simple way to implement this,. 
> 
> And to add , base on my memory profiling, URB usage is very efficient. I think it is a very good candidate to hold
> private data cache for HCs.

All right.  I withdraw any objection to your patches.

Alan Stern

