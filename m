Return-Path: <linux-usb+bounces-11792-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EFEA091C6D9
	for <lists+linux-usb@lfdr.de>; Fri, 28 Jun 2024 21:48:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7C461B24ECE
	for <lists+linux-usb@lfdr.de>; Fri, 28 Jun 2024 19:48:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 384847581A;
	Fri, 28 Jun 2024 19:48:46 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 4123974059
	for <linux-usb@vger.kernel.org>; Fri, 28 Jun 2024 19:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.131.102.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719604125; cv=none; b=CWt78cDouWul/c9BphxwMR30QMCM5gBQ5LfqfB9PYz4o4h07Tj4GeUBgA4d2rJD6jHQg39RJ8lBVCWhYl9u1PyAZ0X6haEfQbOmcK5VkDeFdT3tjAeojz2ZBWjNa2YpVVE5q5GWYqPlhZL7fKZ4Wiwpdjea1GVTbAQvNF9J8KLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719604125; c=relaxed/simple;
	bh=nsE6LH6Eo2F8s1zL58V7Rsip6Gm3IaK/nom0A3OunDc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dex9AZ2yz1pz+by1RdnUX27J1W5yvjURGz6SgXKmmiuJZXsQi4I9Tz1OwFOtD5ZEj/oUQj9dQ9Y8qoKyBzQib+14YTbmi6pRQN+xROodIMMwZob+ORpxTaB/xX9kVzSeeS57kqpUNWbiT+soNYxqLPVLt1ThIsww1n0A7A2DtTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=netrider.rowland.org; arc=none smtp.client-ip=192.131.102.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netrider.rowland.org
Received: (qmail 781140 invoked by uid 1000); 28 Jun 2024 15:48:42 -0400
Date: Fri, 28 Jun 2024 15:48:42 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Andrey Konovalov <andreyknvl@gmail.com>
Cc: Darrion Ramos <darrionramos@gmail.com>,
  USB list <linux-usb@vger.kernel.org>
Subject: Re: Remote wake up in gadget drivers
Message-ID: <de698284-c603-4fe3-aab9-8cb486aef657@rowland.harvard.edu>
References: <a306a653-b6cf-41e4-875f-6c520569b1fdn@googlegroups.com>
 <CA+fCnZdZ96yW5tRfm-c1qXWfmNrVg9J1Yb779Ryht6M9v9FQbQ@mail.gmail.com>
 <612f3eee-35fb-4888-b5d9-c17c223d40df@rowland.harvard.edu>
 <CA+fCnZcrn1sr-sMbwk6i5RDMMh3q9TpBgkGAN+4cg4RaCo9S+g@mail.gmail.com>
 <28b478e2-4b17-483a-9584-0e6342677ef0@rowland.harvard.edu>
 <CA+fCnZegQV87=h13tbk=2c=RxuJi1njHTBO9nr64L-dfVtHsMQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+fCnZegQV87=h13tbk=2c=RxuJi1njHTBO9nr64L-dfVtHsMQ@mail.gmail.com>

On Fri, Jun 28, 2024 at 09:39:10PM +0200, Andrey Konovalov wrote:
> On Fri, Jun 28, 2024 at 8:33 PM Alan Stern <stern@rowland.harvard.edu> wrote:
> > Checking whether the device is suspended is subject to races.  The
> > result would not be fully reliable.
> 
> I see.
> 
> I assume doing a wake-up-if-suspended procedure within a single ioctl
> would not be race free as well?

That's a reasonable thing to do; after all, if the gadget is already at 
full power then a wakeup request will simply fail.  In fact, raw-gadget 
wouldn't even have to do the test; the UDC core takes care of it.

Of course, there's then nothing to stop the host from putting the gadget 
back into suspend right away.  But that's not the gadget's fault.

Alan Stern

> But overall, I don't view the userspace <-> Raw Gadget <-> Gadget core
> <-> UDC driver <-> UDC approach to be very robust in general. My
> understanding is that you need to be very close to the hardware to
> implement decent USB emulation. So perhaps, we could just add the
> ioctl and document it as being racy.
> 
> Thank you!

