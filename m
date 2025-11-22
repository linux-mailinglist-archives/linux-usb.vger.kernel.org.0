Return-Path: <linux-usb+bounces-30823-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC93C7CFAE
	for <lists+linux-usb@lfdr.de>; Sat, 22 Nov 2025 13:32:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 097F935548E
	for <lists+linux-usb@lfdr.de>; Sat, 22 Nov 2025 12:32:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C95F1224B15;
	Sat, 22 Nov 2025 12:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="wWd6PYdw"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 494F72773F;
	Sat, 22 Nov 2025 12:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763814748; cv=none; b=Ii99zZ/P/+vDYN5GiigHP6cTo5AK3adkUwL1vS+76PoCcz30DhruG88Gqolo+ppeG1sBbPk0k0/DAWiZllZuHzG9qRcPteQot6XTVvpGbbgjBgZGk7PsC9ItEM5fGArTOTQGWv4YUkGRqzBtGI5VErF/6JkEjLHcKIpJLPDlwzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763814748; c=relaxed/simple;
	bh=cw6eozZVVn868GPaBEa0HXMWit0FHUIvjs/z5LmxRBQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bARj6qlidDy2GLKeSF7rBB7IiCVxnBkNTss0D+4Heg0hYOtrCXWgVu4ZKIUQ42/Exz1LYdsCROhJaTkJPPqnBe+orfEmca6aDczWR4VAK3UjMBsEN734ARBni1dASlXGVc+VYHqBjUuVaHH5jt5eZkHw3WpF/fgbHyYOOUWWCnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=wWd6PYdw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C70CC4CEF5;
	Sat, 22 Nov 2025 12:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1763814747;
	bh=cw6eozZVVn868GPaBEa0HXMWit0FHUIvjs/z5LmxRBQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wWd6PYdwo8v99PVUgTeVcGH/eqPibef6NRuPfNh0O5KOQPS4sWt16TNMUuPGPHEnv
	 sFP8ZI/Rx9mKQ5vsdsw2yLD3IdCi13SjWGgBcnRMMAmyOIkHRfkiHK4jepFBjAUJK5
	 P3gmYOiVSBruFlzRkE7VUVNkD5gTyRSGuzmdWCSs=
Date: Sat, 22 Nov 2025 13:32:24 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: jerry xzq <jerry.xzq@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	treapking@google.com
Subject: Re: [PATCH] USB: of: filter disabled device node
Message-ID: <2025112206-handwork-hush-5886@gregkh>
References: <20251122112539.4130712-1-jerry.xzq@gmail.com>
 <2025112253-quintuple-colossal-fcbb@gregkh>
 <CAD48c-Vp0gJZpBu0BobooWjKBksNJ+CcCTQRw1mzspoO2Zs5yA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD48c-Vp0gJZpBu0BobooWjKBksNJ+CcCTQRw1mzspoO2Zs5yA@mail.gmail.com>

On Sat, Nov 22, 2025 at 07:49:02PM +0800, jerry xzq wrote:
> On Sat, Nov 22, 2025 at 7:32 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> >
> > On Sat, Nov 22, 2025 at 07:25:39PM +0800, Zhengqiao Xia wrote:
> > > We should not point the of_node of a USB device to a disabled devicetree
> > > node. Otherwise, the interface under this USB device will not be able
> > > to register.
> >
> > Why would a USB device point to a disabled device tree node?  Shouldn't
> > the device tree be fixed instead?
> 
> According to your suggestion, when a USB device is directly connected
> to a USB port,
> we should delete the unused USB hub node instead of disabling it?

Why are you using device tree to describe USB devices at all?  What is
the root problem here that you are trying to solve?

The use of USB in DT should be _VERY_ limited, if at all.  You should
only do so for very good reasons in very limited situations.  If this
starts to get abused, we'll just have to rip it all out :(

thanks,

greg k-h

