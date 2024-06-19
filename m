Return-Path: <linux-usb+bounces-11414-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BCCE90E165
	for <lists+linux-usb@lfdr.de>; Wed, 19 Jun 2024 03:47:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 12E762845E1
	for <lists+linux-usb@lfdr.de>; Wed, 19 Jun 2024 01:47:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4950ED2E5;
	Wed, 19 Jun 2024 01:47:06 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 160633FD4
	for <linux-usb@vger.kernel.org>; Wed, 19 Jun 2024 01:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.131.102.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718761626; cv=none; b=P1qDSTbOWErNDEiKje2VJsU89coHSjx+mPmDIy62cZNeT9QaHyjquaTX3Tbt15AQNm2ebgAMydc3nZk+5ERRZKtPGnMoZIUbTi9H+3UUTK6YxZGw8XWI5eiv7qTIXxh9etdtrjdfJJ75xkaR5yT1CHkEeQiWShZrmGsFuSRVZG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718761626; c=relaxed/simple;
	bh=dGiYaKBsn4OL1hkMjY8rWZ97h+rbv7G8znXR9jHmGoI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k0mPEHKx6vwfMHpISpIXu282iaremhpOBtPv0MUfKyTHtXjb+OdO78JGP9a5cl7YrhNHBbGDlm11Xp9WKSFmoRDmihTnzS9XFsDpK/pI7S1iCZd1/91xRqQZnTaPvvnHbvRyiQNHV8IKHnI+Aa1WdVNMlwaKqGW8FBm+Qsjo1jI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=netrider.rowland.org; arc=none smtp.client-ip=192.131.102.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netrider.rowland.org
Received: (qmail 450286 invoked by uid 1000); 18 Jun 2024 21:46:56 -0400
Date: Tue, 18 Jun 2024 21:46:56 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Paul Elder <paul.elder@ideasonboard.com>
Cc: Andrey Konovalov <andreyknvl@gmail.com>,
  USB list <linux-usb@vger.kernel.org>
Subject: Re: Stalling non-0-length OUT control requests in Raw Gadget/GadgetFS
Message-ID: <fb71949f-fada-4138-b67a-879dc4d03571@rowland.harvard.edu>
References: <CA+fCnZeLRqk-FOkJ81qMY0NMZC7YnW=beTw=w_DVA=OhOnywRw@mail.gmail.com>
 <8b7aa23c-9976-46c2-b64f-1d4614aefe89@rowland.harvard.edu>
 <CA+fCnZd1UOqCiH7L1FMMqLhepiMSBfgVb-tXfc81F_VuX_zy4w@mail.gmail.com>
 <73838855-fe52-4d2f-a826-c5757f75bd92@rowland.harvard.edu>
 <ZnI376uuUb34I1go@pyrite.rasen.tech>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZnI376uuUb34I1go@pyrite.rasen.tech>

On Wed, Jun 19, 2024 at 10:44:15AM +0900, Paul Elder wrote:
> On Sat, Jun 15, 2024 at 10:33:28PM -0400, Alan Stern wrote:
> > On Sat, Jun 15, 2024 at 10:49:46PM +0200, Andrey Konovalov wrote:
> > > On Sat, Jun 15, 2024 at 4:12 AM Alan Stern <stern@rowland.harvard.edu> wrote:
> > > > There has been a patch posted to support UDC drivers that don't
> > > > automatically acknowledge non-zero-length control-OUT transfers.  But
> > > > the patch hasn't been merged, and even if it were, all the existing UDC
> > > > drivers would still need to be updated.
> > > 
> > > This series below is the one you're referring to, right?
> > > 
> > > https://lore.kernel.org/linux-kernel/20190124030228.19840-1-paul.elder@ideasonboard.com/
> > 
> > Yes, that's it.  I'm impressed that you were able to find it; I had lost 
> > track of it.
> > 
> > > Do you know why it wasn't merged? (CC Paul). There are no comments on
> > > the latest version I managed to find.
> > 
> > I guess Felipe Balbi (the USB Gadget maintainer at the time) just wasn't 
> > very interested in fixing the problem.
> 
> So that's why we never continued with merging it...
> 
> Is it time to dust it off and try to upstream it again? :)

You certainly could try.  But be sure to add a supports_explicit_status 
flag to the usb_gadget structure.

Alan Stern

