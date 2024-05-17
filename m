Return-Path: <linux-usb+bounces-10327-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 913778C8E6C
	for <lists+linux-usb@lfdr.de>; Sat, 18 May 2024 01:13:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2F5DA1F22E13
	for <lists+linux-usb@lfdr.de>; Fri, 17 May 2024 23:13:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8C3B1420A0;
	Fri, 17 May 2024 23:13:17 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 0D3F71411E0
	for <linux-usb@vger.kernel.org>; Fri, 17 May 2024 23:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.131.102.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715987597; cv=none; b=m32zaqqFFke/GVOgyIPsVTarNr3gzH87a/WkXO1rsIh0y1GvKhaHy9iWv/ntA8Cr1RR+1HgxaBI1a/ptiNpLlQ/dt2j10jSWXysVxfh0pjZvN/OYkGG6mKY4znKY8sZa5ut1fYOOrLSPsFVw3FVEiKaJKM4pVGKsC3jVoMAACmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715987597; c=relaxed/simple;
	bh=CCoIZI+obFL8qg5nXqHwidGkGOMSdfpY/cxUGlTLFDY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fdC7aY6QxQjJ/lzSKvNUZMPGGBVtCmaUrdqvQoU5VBUW6oD+ociH3/rDe6PQk7osU8aO3DOQp14u8rza/gxx/D1MGWU+4FdBouRr7A/PQjRD90HZw/NsWbj/DUWjqeDaIhp8iioQLZJpShG3xYeIDpbMulG6TUzCj+RmOOPhXzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=netrider.rowland.org; arc=none smtp.client-ip=192.131.102.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netrider.rowland.org
Received: (qmail 325649 invoked by uid 1000); 17 May 2024 19:13:07 -0400
Date: Fri, 17 May 2024 19:13:07 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Andrey Konovalov <andreyknvl@gmail.com>
Cc: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
  Tejun Heo <tj@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
  Andrey Konovalov <andreyknvl@google.com>,
  Dmitry Vyukov <dvyukov@google.com>, Marco Elver <elver@google.com>,
  USB list <linux-usb@vger.kernel.org>
Subject: Re: [syzbot] [wireless?] WARNING in kcov_remote_start (3)
Message-ID: <0a3a96ce-e082-41d5-9314-3eacf2a06c6c@rowland.harvard.edu>
References: <0f4d1964-7397-485b-bc48-11c01e2fcbca@I-love.SAKURA.ne.jp>
 <4e8b9f94-326b-4370-9d69-94ee10b644f8@I-love.SAKURA.ne.jp>
 <CA+fCnZdymR9NiVW=XTWD-45rv+QGRdCkDo8X3odSsVqqD9-9Kw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+fCnZdymR9NiVW=XTWD-45rv+QGRdCkDo8X3odSsVqqD9-9Kw@mail.gmail.com>

On Fri, May 17, 2024 at 11:16:31PM +0200, Andrey Konovalov wrote:
> > Hello.
> >
> > syzbot is still reporting warning in kcov_remote_start() from
> > __usb_hcd_giveback_urb() path. I guess that commit 8fea0c8fda30
> > ("usb: core: hcd: Convert from tasklet to BH workqueue") broke
> > the in_serving_softirq() workaround explained in commit e89eed02a5f1
> > ("kcov, usb: hide in_serving_softirq checks in __usb_hcd_giveback_urb").
> >
> > How can we fix this workaround?

> So the problem here is that __usb_hcd_giveback_urb gets called from an
> interrupt that comes during a __usb_hcd_giveback_urb call from
> usb_giveback_urb_bh. And KCOV annotations don't expect that
> __usb_hcd_giveback_urb can be interrupted.
> 
> We had a similar issue with USB/IP before, and AFAIU the resolution
> was that it's invalid to call usb_giveback_urb with interrupts enabled
> [1]. But I'm not sure if the same applies to usb_giveback_urb_bh.
> 
> Alan, is this a bug in usb_giveback_urb_bh? Perhaps we need to disable
> interrupts before calling __usb_hcd_giveback_urb?

Well, the code which used to run in a tasklet now runs in a work queue, 
so it's not surprising that some things can go wrong.

Perhaps the simplest approach is to disable interrupts in 
__usb_hcd_giveback_urb() around the kcov_* calls.  And change the 
preceding comment, of course.

Alan Stern

> Thank you!
> 
> [1] https://lore.kernel.org/linux-usb/20201006012333.GA399825@rowland.harvard.edu/

