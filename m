Return-Path: <linux-usb+bounces-19185-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A619A089B5
	for <lists+linux-usb@lfdr.de>; Fri, 10 Jan 2025 09:17:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 32A9416979A
	for <lists+linux-usb@lfdr.de>; Fri, 10 Jan 2025 08:17:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26C80208976;
	Fri, 10 Jan 2025 08:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="emK7NkBZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF5DD207E04;
	Fri, 10 Jan 2025 08:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736496986; cv=none; b=PL+R98yPerDPK2H4ojdn9/YmUj4eSIFFowhjkbpz5aF5ZkfA9/pLy7HP0YyeYLfD96/9M1L/26yRAokYkrQ+Zu8Rr1RBb/1ePa0qPvT9LNnBDLX5MpG3Eh5BPeW3tdrURmfd/wlVPu3r/fri8BBVjZ9OoYeshb9UuSmfV6zgAdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736496986; c=relaxed/simple;
	bh=U/bcqOXqO42rKJEq1xZucY9uqZJqGcz4YzA67LheLMA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AbnlM9ssR6jbHi47dX8YbNppmLqDRE4udsiS9wvW66HjXc/6cQTy5EFjKFM5esa5TOiRte6ABVZx1vnp1f1ExIw1IaNobdaFloFGMKiU1g5n65LEZAzovNb9flsUFSqK3pcMzKMQl4F3W15h0FKsnm3KGQrpUmwWaH5Al5rECN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=emK7NkBZ; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Received: from gaggiata.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 033361F929;
	Fri, 10 Jan 2025 09:16:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1736496979;
	bh=FYYyqgObUOGEwUYunnGLVdDuspBamffoPrIZjizg08U=;
	h=Received:From:To:Subject;
	b=emK7NkBZqgIOYWF2Rs9UogM7zjfaC1z697J5TODsuOmI+n4cjqil/eC8yrIUvd/kC
	 a1nlaS/nGrsdQYA0yYssBAcrli1EGkbmr+F404dvex9zXMT3AFAunNksjsLFXOYqde
	 G0S9l0L1h7dBTciPdC72E5Pkp702Mmx13CfqTeyIMPFaBrT2CP+N3SQIS/QK9QHOe/
	 s3xbr3h8fIKgOGIED+Po4gZnIEpQVj7elrDpLjh/B2jA+xi4P2ENDgXOk/Vax0Rghd
	 tfUaw3CtQ2qaJZ9RKFrBPuLNmjRFOEb5HzrVft8JsyS+5o1jyzZ2g+oLYjD6kvRaYx
	 Yf/mIzTMcJLCg==
Received: by gaggiata.pivistrello.it (Postfix, from userid 1000)
	id A26E07F9D9; Fri, 10 Jan 2025 09:16:18 +0100 (CET)
Date: Fri, 10 Jan 2025 09:16:18 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Xu Yang <xu.yang_2@nxp.com>, ritesh.kumar@toradex.com
Cc: Francesco Dolcini <francesco@dolcini.it>, linux-usb@vger.kernel.org,
	Peter Chen <peter.chen@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org
Subject: Re: USB EHCI chipidea regression on NXP i.MX7
Message-ID: <Z4DXUuHwTsbiir5I@gaggiata.pivistrello.it>
References: <20250108093101.GA22448@francesco-nb>
 <20250109073500.45gge4abb4h6mmay@hippo>
 <Z3-U1DXdMQ0eZaW2@gaggiata.pivistrello.it>
 <20250110065101.qxajjnu3fek4mmty@hippo>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250110065101.qxajjnu3fek4mmty@hippo>

Hello,

On Fri, Jan 10, 2025 at 02:51:01PM +0800, Xu Yang wrote:
> On Thu, Jan 09, 2025 at 10:20:20AM +0100, Francesco Dolcini wrote:
> > On Thu, Jan 09, 2025 at 03:35:00PM +0800, Xu Yang wrote:
> > > > If the USB port is connected to a USB HUB, and a device is connected at
> > > > boot time to such a hub, the following errors are printed and the USB
> > > > port is not functional.
> > > 
> > > Does this happen 100%?
> > > I tried many time on i.MX7ULP-EVK board, but I can't reproduce this issue.
> > 
> > The issue happens with i.MX7D.
> 
> Then I think this issue is not related to that commit.
> I also tried on i.MX7D, but I still can't reproduce it.
>
> Please firstly confirm few questions in last mail.

Thanks Xu Yang for trying this out.

Ritesh: can you help here?

Francesco


