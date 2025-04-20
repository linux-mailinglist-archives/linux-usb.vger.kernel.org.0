Return-Path: <linux-usb+bounces-23247-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DC1C6A946D9
	for <lists+linux-usb@lfdr.de>; Sun, 20 Apr 2025 08:55:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B07871896A3F
	for <lists+linux-usb@lfdr.de>; Sun, 20 Apr 2025 06:56:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E8D21BD517;
	Sun, 20 Apr 2025 06:55:46 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from fgw21-7.mail.saunalahti.fi (fgw21-7.mail.saunalahti.fi [62.142.5.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C71E1B0F19
	for <linux-usb@vger.kernel.org>; Sun, 20 Apr 2025 06:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.82
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745132146; cv=none; b=nqLfbAwtGgPYipebI7JzbiWYwAMxbuLroRu0bJ7qqwvbscugjHgaBo2bFpRq6GWiifcQQduHMdxzyyrqx2fsdVolcl+ox2EFN/ecx/n71TxqhBia4Y4MoLnPcaS4BgkIrjjJpXmaaGDSCVO6GolhxkwOY08Hbg+xanWuaaRlOUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745132146; c=relaxed/simple;
	bh=EssljxfrU/0ZQyr0hXBVw1dIjTN8kZeOHqbnHqZRwY0=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OWMn9rhNIyrPeNYG8bXCZSn12oJQMySc6dhYsXMq0I8fphVPPP7ywen2ScKvJzJsSjUAoK/iLV8FwActMwFcTxdsnpoTDV+fk0cB05I2e9R4uqnkYWrf1yGX8E2CDAS6lBKv4sqQbXlx3gLo73EJUZ7qW6/s6n3Ga/QxfYRdQYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-26-232.elisa-laajakaista.fi [88.113.26.232])
	by fgw23.mail.saunalahti.fi (Halon) with ESMTP
	id 4c3cf7e2-1db4-11f0-8eea-005056bdfda7;
	Sun, 20 Apr 2025 09:54:26 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 20 Apr 2025 09:54:25 +0300
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/1] usb: Add checks for snprintf() calls in
 usb_alloc_dev()
Message-ID: <aASaIR3e3cDxU4NP@surfacebook.localdomain>
References: <20250321164949.423957-1-andriy.shevchenko@linux.intel.com>
 <aAPO3P1_-C7Nhil4@smile.fi.intel.com>
 <2025042041-uninstall-expansive-04c3@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2025042041-uninstall-expansive-04c3@gregkh>

Sun, Apr 20, 2025 at 08:27:59AM +0200, Greg Kroah-Hartman kirjoitti:
> On Sat, Apr 19, 2025 at 07:27:08PM +0300, Andy Shevchenko wrote:
> > On Fri, Mar 21, 2025 at 06:49:49PM +0200, Andy Shevchenko wrote:
> > > When creating a device path in the driver the snprintf() takes
> > > up to 16 characters long argument along with the additional up to
> > > 12 characters for the signed integer (as it can't see the actual limits)
> > > and tries to pack this into 16 bytes array. GCC complains about that
> > > when build with `make W=1`:
> > > 
> > >   drivers/usb/core/usb.c:705:25: note: ‘snprintf’ output between 3 and 28 bytes into a destination of size 16
> > > 
> > > Since everything works until now, let's just check for the potential
> > > buffer overflow and bail out. It is most likely a never happen situation,
> > > but at least it makes GCC happy.
> > 
> > Any comments anybody?
> 
> It's been added to my tree last week, 

Thank you!

> why comment again?

Ah, I missed that, too many emails lately. :-(

> confused,

-- 
With Best Regards,
Andy Shevchenko



