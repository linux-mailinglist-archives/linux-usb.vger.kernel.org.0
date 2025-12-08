Return-Path: <linux-usb+bounces-31292-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F1784CAE2C7
	for <lists+linux-usb@lfdr.de>; Mon, 08 Dec 2025 21:47:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1F419304D565
	for <lists+linux-usb@lfdr.de>; Mon,  8 Dec 2025 20:47:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C52E2E7645;
	Mon,  8 Dec 2025 20:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="bK2NYXO6"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84EEC2C1585
	for <linux-usb@vger.kernel.org>; Mon,  8 Dec 2025 20:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765226819; cv=none; b=Q2sH7rRiZUyRLQ+HajJ13DhHg/bnFMHxok18wopX46BsXRa4rOV1nfnBO1fYkYCUa3GcIGMiJnuI0sO8UaSqDW3gwpxZ1XtCl9b8jhNQXxsAFdmrJ+5DgCzhyvFLrWWfvlfInLN6MkWiHlNizsLX83C3Lt/qYi7+zsahje9psNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765226819; c=relaxed/simple;
	bh=7ECStkgKknfrB12ySmtX5+VyraVoEvM/nkxGS+AmefU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=li94adiOYAz2c1RhWmDQanU6Suz9iAh3LKyuC/71aGE54bODeLsm3FF1NiHW/jwCT77j61qavZv3JDVnfWlMU/br6KkEz97tJP4vlNshyFQXmAnIMzFmrX12OsQpawhvHBg55kCwmZXwo3IxW+avIjHriQFuQ7TXfBvsja2xon4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=bK2NYXO6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2ACEC4CEF1;
	Mon,  8 Dec 2025 20:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1765226819;
	bh=7ECStkgKknfrB12ySmtX5+VyraVoEvM/nkxGS+AmefU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bK2NYXO6GwUPvimYnysnQmrXWwZ4pfOehJVOr8mZNxe2pXkupQM78ZRMb9Bfj07PL
	 5wbWItqSdN356hJLcjJld6XQv6q6al7p+SCL1lAre/oNo8hLGJcy04Gu6KcUN0GTjj
	 pHtEqYp8ltRyZIjfQoYSb1Pb4tGbYMGo5abq+/t4=
Date: Tue, 9 Dec 2025 05:46:56 +0900
From: Greg KH <gregkh@linuxfoundation.org>
To: Oliver Neukum <oneukum@suse.com>
Cc: Johannes =?iso-8859-1?Q?Br=FCderl?= <johannes.bruederl@gmail.com>,
	Michal Pecio <michal.pecio@gmail.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2] usb: core: add USB_QUIRK_NO_BOS for devices that hang
 on BOS descriptor
Message-ID: <2025120941-unhappily-smilingly-59e9@gregkh>
References: <2025120708-header-startling-ffaf@gregkh>
 <20251207012059.7899-1-johannes.bruederl@gmail.com>
 <20251207084012.7c232e52.michal.pecio@gmail.com>
 <CAP=XvD+dNNDj75DYjjByE3o7F8i-QxusAdz-5+hG24fCesWYRw@mail.gmail.com>
 <20251207104505.1d5f3718.michal.pecio@gmail.com>
 <CAP=XvDJJP2orxYcgiKzp0FrQE2UMiXndZe8Z6BdBRFvkujWu5w@mail.gmail.com>
 <2025120748-extras-retrain-16eb@gregkh>
 <2025120846-nearby-breath-e5fe@gregkh>
 <dacafa36-10dc-4f2a-95fd-10ff785e4670@suse.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dacafa36-10dc-4f2a-95fd-10ff785e4670@suse.com>

On Mon, Dec 08, 2025 at 09:58:55AM +0100, Oliver Neukum wrote:
> On 07.12.25 22:12, Greg KH wrote:
> > Ok, I can duplicate this here.  Maybe we just don't ask for the BOS
> > descriptor if no one needs/asks for it.  I can play with that later and
> > see if that helps as I'm sure this isn't going to be the only device
> > that can't handle the BOS descriptor if Windows isn't querying for it,
> > so we don't want to make a huge quirk table if we don't have to.
> 
> 1. That means we'd let lsusb crash devices. Not a good idea.

I don't think that it will crash.  hopefully not, as just reading a
descriptor after enumerated shouldn't cause that.  I'll test it out...

> 2. It is, unfortunately, possible that firmware authors simply
> script a detection sequence. That means devices would crash
> if you request a descriptor at a time when Windows would not
> request it, not just in general.
> I am afraid I need to point you at the horrible example
> of HID_ALWAYS_POLL

That is horrible, hopefully we don't have to do that here :(

thanks,

greg k-h

