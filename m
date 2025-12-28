Return-Path: <linux-usb+bounces-31787-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B5756CE5063
	for <lists+linux-usb@lfdr.de>; Sun, 28 Dec 2025 14:18:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 490183009F80
	for <lists+linux-usb@lfdr.de>; Sun, 28 Dec 2025 13:18:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BBE921146C;
	Sun, 28 Dec 2025 13:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="zc8lD/Nk"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E927A5CDF1
	for <linux-usb@vger.kernel.org>; Sun, 28 Dec 2025 13:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766927885; cv=none; b=jy9JMJ+ZkkXsmnTiiBhMuFFuxli0sLQ+8B4ieFzmKL9olRAFhHoKHOgJfyp/Ss28RyvCrjsZQ05Z/Rt3n+4Me93FKD9/zyN014Gg2XFhLYcY/b/T/Cn2BV8O55gJ5E/cqUC8vwSOs0I18hsJEyrmdjBmzM0lT4lJSFcz7rkqxCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766927885; c=relaxed/simple;
	bh=jatR+YU310OmSeoIzp2G5Iu/V9w/Q0meZGofURdi/oY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lU//lhQwqcUjOnRvkwsbIhfUfvWeBGmlE9ZYZI0MSxnHHbNTMiVmLZab7cLwkQ6DIvabwuSq9Vwxu3e+xVWQI6wekwtWKM75yzCqGTjBVdkUywBLwoddfZXUV1/cXsQPdKIJcgIBXgtU+6lFVVXRp/9jnoLbpBIGFmbv6UV9Zxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=zc8lD/Nk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED563C4CEFB;
	Sun, 28 Dec 2025 13:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1766927884;
	bh=jatR+YU310OmSeoIzp2G5Iu/V9w/Q0meZGofURdi/oY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=zc8lD/NkdrNQ0jadZ9iQei+KsiwF7NiKlbapZsLV60rmx8HeH7MEu0z2seIsERHE9
	 9f7aOhU2lN+IRfkHtDIDfxdcZ1uVpvYSdvygkx/loIjPQQj3S5H3Sw/LwQ2wNaR0WP
	 bGnnN1gUfMNmga8oYPnn4xX2Pn0jJ1tr9aXFSLhU=
Date: Sun, 28 Dec 2025 14:18:01 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Johannes =?iso-8859-1?Q?Br=FCderl?= <johannes.bruederl@gmail.com>
Cc: Oliver Neukum <oneukum@suse.com>, Michal Pecio <michal.pecio@gmail.com>,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH v2] usb: core: add USB_QUIRK_NO_BOS for devices that hang
 on BOS descriptor
Message-ID: <2025122837-creamlike-motivator-8dcb@gregkh>
References: <20251207012059.7899-1-johannes.bruederl@gmail.com>
 <20251207084012.7c232e52.michal.pecio@gmail.com>
 <CAP=XvD+dNNDj75DYjjByE3o7F8i-QxusAdz-5+hG24fCesWYRw@mail.gmail.com>
 <20251207104505.1d5f3718.michal.pecio@gmail.com>
 <CAP=XvDJJP2orxYcgiKzp0FrQE2UMiXndZe8Z6BdBRFvkujWu5w@mail.gmail.com>
 <2025120748-extras-retrain-16eb@gregkh>
 <2025120846-nearby-breath-e5fe@gregkh>
 <dacafa36-10dc-4f2a-95fd-10ff785e4670@suse.com>
 <2025120941-unhappily-smilingly-59e9@gregkh>
 <CAP=XvD+LDvjyX7XRueuQ-NnHvuZEoJ7zH=nWOJhoOzupKMjuOQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAP=XvD+LDvjyX7XRueuQ-NnHvuZEoJ7zH=nWOJhoOzupKMjuOQ@mail.gmail.com>

On Sun, Dec 28, 2025 at 01:54:34PM +0100, Johannes Brüderl wrote:
> On Mon, Dec 8, 2025 at 9:46 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> >
> > On Mon, Dec 08, 2025 at 09:58:55AM +0100, Oliver Neukum wrote:
> > > On 07.12.25 22:12, Greg KH wrote:
> > > > Ok, I can duplicate this here.  Maybe we just don't ask for the BOS
> > > > descriptor if no one needs/asks for it.  I can play with that later and
> > > > see if that helps as I'm sure this isn't going to be the only device
> > > > that can't handle the BOS descriptor if Windows isn't querying for it,
> > > > so we don't want to make a huge quirk table if we don't have to.
> > >
> > > 1. That means we'd let lsusb crash devices. Not a good idea.
> >
> > I don't think that it will crash.  hopefully not, as just reading a
> > descriptor after enumerated shouldn't cause that.  I'll test it out...
> >
> > > 2. It is, unfortunately, possible that firmware authors simply
> > > script a detection sequence. That means devices would crash
> > > if you request a descriptor at a time when Windows would not
> > > request it, not just in general.
> > > I am afraid I need to point you at the horrible example
> > > of HID_ALWAYS_POLL
> >
> > That is horrible, hopefully we don't have to do that here :(
> >
> > thanks,
> >
> > greg k-h
> 
> Hello Greg,
> I apologize for the "blunt bump" of this topic.
> Are you (still) open to considering the quirk ?
> 
> A small number of users have started using the Patch, and it seems to
> solve a real problem.. (ref:
> https://www.reddit.com/r/elgato/comments/1lw1e0v/comment/ntrdjpb/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button)
> 
> Given that the options for 4k60fps recording are very limited for
> Linux these days - I suggest it might be worth it. AFAIK, there's no
> good other option in terms of hardware as of December 2025.
> I understand it's a special quirk for just this device, which is not pretty..
> 
> (Note: i've submitted a v3 patch that addressed the feedback).

Sorry, I haven't had a chance to dig into this due to travel and the
holidays.  Give me a few days to catch up...

thanks,

greg k-h

