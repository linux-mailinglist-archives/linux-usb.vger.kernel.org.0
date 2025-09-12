Return-Path: <linux-usb+bounces-28025-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB7E7B54FFC
	for <lists+linux-usb@lfdr.de>; Fri, 12 Sep 2025 15:47:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 111EC465C1C
	for <lists+linux-usb@lfdr.de>; Fri, 12 Sep 2025 13:47:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77B8F2FD1C3;
	Fri, 12 Sep 2025 13:47:35 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from outboundhk.mxmail.xiaomi.com (outboundhk.mxmail.xiaomi.com [207.226.244.123])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BE3D2DC779
	for <linux-usb@vger.kernel.org>; Fri, 12 Sep 2025 13:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=207.226.244.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757684855; cv=none; b=Tddl0ytWqaJdscKaVM/uERzEahJZZJcO4Z59qdGT7mGhws/DkkPcXfcpmsOmRGCv1KTyeTMPjdOvdlImEuMFaPAZ4tzIcfUb+GQ7Tb4jTpRZbRfpxvOYpRPU4X9V/4DZcdT16fikvTXAHaCsmcI0JW7y0ZyG1fzdIU9xznzPqCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757684855; c=relaxed/simple;
	bh=WXKRQVCVk8/Wcmy+TTTtXBq2npq7gMGmTzJ+JkuZL0U=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ETj2hwdrrG9F3TtqYYt0eAVRCKiYGo7M7u9ZK4OY6HM8QShusDcDT5gZAuU7Cw1DrWLo1PADKrVkhW/tc8jplsjastpL8Qbc2iDTbHCNctr9M2pYylbtRKW3LejjKNUiiQrxAymYO2wZmecd+jkFSchLfAnIYb72ECpmij4MEPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=xiaomi.com; spf=pass smtp.mailfrom=xiaomi.com; arc=none smtp.client-ip=207.226.244.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=xiaomi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xiaomi.com
X-CSE-ConnectionGUID: z8kMex75QLakQu35MWYsZQ==
X-CSE-MsgGUID: umtB1NhtQwCm/QZeoiZgbQ==
X-IronPort-AV: E=Sophos;i="6.18,259,1751212800"; 
   d="scan'208";a="152247380"
Date: Fri, 12 Sep 2025 21:47:26 +0800
From: Owen Gu <guhuinan@xiaomi.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: <linux-usb@vger.kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, "Ingo
 Rohloff" <ingo.rohloff@lauterbach.com>, Christian Brauner
	<brauner@kernel.org>, Chen Ni <nichen@iscas.ac.cn>, Peter Zijlstra
	<peterz@infradead.org>, Sabyrzhan Tasbolatov <snovitoll@gmail.com>, Akash M
	<akash.m5@samsung.com>, chenyu <chenyu45@xiaomi.com>, yudongbin
	<yudongbin@xiaomi.com>, mahongwei <mahongwei3@xiaomi.com>, jiangdayu
	<jiangdayu@xiaomi.com>
Subject: Re: [PATCH] usb: gadget: f_fs: Fix epfile null pointer access after
 ep enable.
Message-ID: <aMQckhj2UotZZpVa@oa-guhuinan-2.localdomain>
References: <20250912040506.142146-1-guhuinan@xiaomi.com>
 <2025091255-bluff-next-ea2b@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <2025091255-bluff-next-ea2b@gregkh>
X-ClientProxiedBy: bj-mbx09.mioffice.cn (10.237.8.129) To BJ-MBX05.mioffice.cn
 (10.237.8.125)

On Fri, Sep 12, 2025 at 07:32:04AM +0200, Greg Kroah-Hartman wrote:
> On Fri, Sep 12, 2025 at 12:05:06PM +0800, guhuinan wrote:
> > A race condition occurs when ffs_func_eps_enable() runs concurrently
> > with ffs_data_reset(). The ffs_data_clear() called in ffs_data_reset()
> > sets ffs->epfiles to NULL before resetting ffs->eps_count to 0, leading
> > to a NULL pointer dereference when accessing epfile->ep in
> > ffs_func_eps_enable() after successful usb_ep_enable().
> > 
> > Signed-off-by: guhuinan <guhuinan@xiaomi.com>
> 
> Please use your name, not your email alias for the From: and
> signed-off-by lines.
> 
Okay
> > ---
> >  drivers/usb/gadget/function/f_fs.c | 9 ++++++++-
> >  1 file changed, 8 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
> > index 08a251df20c4..f4aae91e7864 100644
> > --- a/drivers/usb/gadget/function/f_fs.c
> > +++ b/drivers/usb/gadget/function/f_fs.c
> > @@ -2407,7 +2407,13 @@ static int ffs_func_eps_enable(struct ffs_function *func)
> >  	ep = func->eps;
> >  	epfile = ffs->epfiles;
> >  	count = ffs->eps_count;
> > -	while(count--) {
> > +	if (!epfile) {
> > +		pr_err("%s: epfiles is NULL\n", __func__);
> 
> No need for this debugging line, right?
> 
Okay
> > +		ret = -ENOMEM;
> > +		goto done;
> > +	}
> > +
> > +	while (count--) {
> 
> What prevents the pointer from changing right after you check it?  This
> will still race :(
> 
> You need a lock somewhere to fix this properly.

Dear, 
The ffs->epfiles pointer is set to NULL in both ffs_data_clear() and 
ffs_data_close() functions, and its modification is protected by the
spinlock ffs->eps_lock.
And the whole ffs_func_eps_enable() function is also protected by ffs->eps_lock.

Thanks

> 
> thanks,
> 
> greg k-h

