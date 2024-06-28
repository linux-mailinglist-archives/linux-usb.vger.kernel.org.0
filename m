Return-Path: <linux-usb+bounces-11789-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 628EA91C5BE
	for <lists+linux-usb@lfdr.de>; Fri, 28 Jun 2024 20:33:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1DDA8283385
	for <lists+linux-usb@lfdr.de>; Fri, 28 Jun 2024 18:33:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F2BA1CE0AD;
	Fri, 28 Jun 2024 18:33:04 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 960641E50B
	for <linux-usb@vger.kernel.org>; Fri, 28 Jun 2024 18:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.131.102.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719599584; cv=none; b=U+Kt3g0qnC64pLYky/ntYK2/EvP2Vz/wlMkHY9d02rH6RsK5FYpU53KR8NkEEm4SrYqIcNRr5EmR3dYIc855Pg9G7EDyhuMYreZ6e4+kDezrAivFpzXskF/vPXusZrshCUg5Y0lDs5HWa9nWa4qZrs9WLmK6Gf49qVWg6OFn+S8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719599584; c=relaxed/simple;
	bh=sMrwkEiyvClkNaeOwInmi5vw8IZDP6z3cJzHmYAu1Ng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=exGPbJVdydr6QGBKXRkztnR6wqgCEw0/L6O42C+to8TLg+S8mBEFJ0eIEWF5GZ08JXn4mKfgx3O0LksDMHV6sAfHT057KoTv4d5smG2OptwSfNVvtFiHNmZ83WQmJEIUHiko7kegEaRaG/MN8M/kzi9UO7xx4950EyFsdZNo31E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=netrider.rowland.org; arc=none smtp.client-ip=192.131.102.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netrider.rowland.org
Received: (qmail 779519 invoked by uid 1000); 28 Jun 2024 14:33:00 -0400
Date: Fri, 28 Jun 2024 14:33:00 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Andrey Konovalov <andreyknvl@gmail.com>
Cc: Darrion Ramos <darrionramos@gmail.com>,
  USB list <linux-usb@vger.kernel.org>
Subject: Re: Remote wake up in gadget drivers
Message-ID: <28b478e2-4b17-483a-9584-0e6342677ef0@rowland.harvard.edu>
References: <a306a653-b6cf-41e4-875f-6c520569b1fdn@googlegroups.com>
 <CA+fCnZdZ96yW5tRfm-c1qXWfmNrVg9J1Yb779Ryht6M9v9FQbQ@mail.gmail.com>
 <612f3eee-35fb-4888-b5d9-c17c223d40df@rowland.harvard.edu>
 <CA+fCnZcrn1sr-sMbwk6i5RDMMh3q9TpBgkGAN+4cg4RaCo9S+g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+fCnZcrn1sr-sMbwk6i5RDMMh3q9TpBgkGAN+4cg4RaCo9S+g@mail.gmail.com>

On Fri, Jun 28, 2024 at 08:25:22PM +0200, Andrey Konovalov wrote:
> Darrion, you can try adding a new Raw Gadget ioctl that calls
> usb_gadget_wakeup() and see if that works for you. This shouldn't be
> hard: just add another handler to raw_ioctl().
> 
> And you probably also still need to set the USB_CONFIG_ATT_WAKEUP bit
> in the USB config descriptor in the Raw Gadget keyboard example.
> 
> For a proper remote wake up support, I think we would also need
> another two ioctls: one for checking whether the UDC supports remote
> wake up and one for checking whether the device is suspended (the
> former can be combined with reporting other UDC capabilities:
> https://github.com/xairy/raw-gadget/issues/41).

While the wakeup_capable and wakeup_armed bitflags are defined in 
linux/usb/gadget.h, it doesn't look like any of the UDC drivers 
implement them.  So it may not be possible to see whether the UDC 
supports remote wakeup (but it appears that most of them do).

Checking whether the device is suspended is subject to races.  The 
result would not be fully reliable.

Alan Stern

