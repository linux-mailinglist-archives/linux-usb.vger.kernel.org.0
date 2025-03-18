Return-Path: <linux-usb+bounces-21843-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 56149A674AD
	for <lists+linux-usb@lfdr.de>; Tue, 18 Mar 2025 14:15:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 91145422861
	for <lists+linux-usb@lfdr.de>; Tue, 18 Mar 2025 13:14:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8224B20CCCC;
	Tue, 18 Mar 2025 13:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Bcf4iqYd"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E8220C46A;
	Tue, 18 Mar 2025 13:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742303645; cv=none; b=QgCIkCr+55qoRLCZ9nxnE7HIlkHWL3bUqg1CLzHRpBXNdwMjM4cdAj4G7twQlYQDoeSdyf82K3AzE7Ryw+/6WofttaGcLUE2B6EGZ+fh3H4kbyMkgEKjep6i9LU13t+Po3UGg21LizlSajPHxADSyytvdwHKdmB7V5nQkApHLJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742303645; c=relaxed/simple;
	bh=WzM66xIHTbmz3TlxtlPdmB+DWTWd2fsKUEx8GAB4jFc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IFg+u5N5Hlnnt3R6cNJmYU8V5RSxNOkZyJqu58jUjg5qa/uXWEJEVioKdyzVFo5HYWysH0eDFsOZ/S0VV8emW3EfxX95bkqmHoR17fViftrkncHUEnC9sgPgtccWkyo67jlAeLPjNg1MvwnK44oYXyzyFQyqmWXcCF1Jg45VChE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Bcf4iqYd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53CD7C4CEDD;
	Tue, 18 Mar 2025 13:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1742303644;
	bh=WzM66xIHTbmz3TlxtlPdmB+DWTWd2fsKUEx8GAB4jFc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Bcf4iqYd9/VZQZDY7zmHH1nIEz45x2vf+DHLPF3fOG3zYMnTSRZbJ1Pg69PNmEdEg
	 kbN8o6ccr5Tg5241Wfi7wJ51JGIqC5cN4pR3mRupwl0fDXaGEzb0hVsnbFMu75YM1z
	 YtCU2CFv3ccAoIQ9ztjQ2+Pitp2rMP+uPwA6gQxg=
Date: Tue, 18 Mar 2025 14:12:46 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, peter.chen@kernel.org,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH v5 0/6] add USB2.0 support for i.MX95-19x19 EVK board
Message-ID: <2025031823-certainty-crewman-b90c@gregkh>
References: <20250312082700.260260-1-xu.yang_2@nxp.com>
 <2025031443-rounding-subject-1f60@gregkh>
 <20250314092137.6m3gmj4irxqwpy22@hippo>
 <2025031404-elite-critter-05b7@gregkh>
 <20250318072414.x5y4kbe2ahl24uzg@hippo>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250318072414.x5y4kbe2ahl24uzg@hippo>

On Tue, Mar 18, 2025 at 03:24:14PM +0800, Xu Yang wrote:
> Hi Greg,
> 
> On Fri, Mar 14, 2025 at 01:37:19PM +0100, Greg KH wrote:
> > On Fri, Mar 14, 2025 at 05:21:37PM +0800, Xu Yang wrote:
> > > Hi Greg,
> > > 
> > > On Fri, Mar 14, 2025 at 09:18:51AM +0100, Greg KH wrote:
> > > > On Wed, Mar 12, 2025 at 04:26:54PM +0800, Xu Yang wrote:
> > > > > The i.MX95-19x19 EVK board features a USB 2.0 Type-A port, with this
> > > > > series primarily introducing USB 2.0 support. In the i.MX95 architecture,
> > > > > the USB wake-up handling mechanism is integrated within the HSIO block
> > > > > control module, utilizing a dedicated wake-up interrupt. Therefore, we
> > > > > also implemented corresponding wake-up logic code to properly manage this
> > > > > functionality.
> > > > > 
> > > > > For detailed changes can refer to patch commit log.
> > > > 
> > > > Does not apply to my tree :(
> > > 
> > > It'd due to below dts patch #2,3 not in usb tree. However, linux-next already
> > > have them. I see Shawn just send pull request for 6.15. To make it easy,
> > > let me ping you when usb tree have them, is it ok?
> > > 
> > > https://lore.kernel.org/linux-usb/20241204050907.1081781-1-xu.yang_2@nxp.com/#t
> > 
> > That will not be until after 6.15-rc1 is out.
> 
> In this series, patch #1-4 should go to usb tree and path #5,6 should go to Shawn
> tree. You can't apply patch #5,6, right? However, you can ignore patch #5,6 and
> pick up patch #1-4, am my understanding right? Shawn will pick patch #5,6 to his
> tree.

Ok, can you resend just what you want me to take so I can suck in the
whole patch series at once and don't have to do it "by hand"?

thanks,

greg k-h

