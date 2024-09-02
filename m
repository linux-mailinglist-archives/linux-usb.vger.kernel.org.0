Return-Path: <linux-usb+bounces-14465-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC61967F26
	for <lists+linux-usb@lfdr.de>; Mon,  2 Sep 2024 08:08:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4131C1C21A20
	for <lists+linux-usb@lfdr.de>; Mon,  2 Sep 2024 06:08:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C2C71547DE;
	Mon,  2 Sep 2024 06:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="DA4gOo1N"
X-Original-To: linux-usb@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 487FF76048
	for <linux-usb@vger.kernel.org>; Mon,  2 Sep 2024 06:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725257329; cv=none; b=HPG3xxxyN4CFcmR7U2yuJhf0l0bSIF7eu507DTGLhZ1uDLCYOKrO1HkqW5iCLjH5Vg4luK/YMiooWvJMjQPgKnlTYuWm9kn+bF5gyWCPFjSKKWGb4kHVnG/Xu1QsmXZ2alXR/rkDLUG0d0eV/LSflCTjN28hebSaT4504M89j/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725257329; c=relaxed/simple;
	bh=6Bxfv7IWTfGMqXvP09wgPAjsJSPqEGWP2h/kzb5Mctw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=auixt3a3HmFmAqV9m4BSlC8+m3ynkdJ9a8KXrA0UIi0pZA1UKOz2REuzAiLeXhAnUpIO97ZbnT5VFCa4SuhJrsZjPa3s6AEFkfSDnAf9cG+JbvgjGfRjQebZBT8jlI+Pe48geG2TINOHIshz4mAoKI+crIFwWZlrv2i5j1NuHZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=DA4gOo1N; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2F92D4CE;
	Mon,  2 Sep 2024 08:07:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1725257254;
	bh=6Bxfv7IWTfGMqXvP09wgPAjsJSPqEGWP2h/kzb5Mctw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DA4gOo1NQuMftVyi+mk52siZeOTXtwaOs6R/qiCT8SGbi9VJewRSIAq6WTYWHCNE1
	 h+hmRRQG9PG6X36Yg6ZsB/wATFWDeQw8VSs+ZhtzNZTYsjLL868uLRnC7iEDvIEPnD
	 JPr0Nbw2BJ1qph5wVZwiR2RZgPRu+klE9AD5eFy0=
Date: Mon, 2 Sep 2024 09:08:13 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Amil Sanan <amilsananak@gmail.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, dan.scally@ideasonboard.com,
	linux-usb@vger.kernel.org
Subject: Re: adding a new device in uvc_driver
Message-ID: <20240902060813.GI7282@pendragon.ideasonboard.com>
References: <CABprV6ReozmBsi5Db-MQw2iHt1mXXjy735yfHwQdeC6RX92RLw@mail.gmail.com>
 <2024083035-recovery-babble-df48@gregkh>
 <CABprV6Rj9VZFFeuA5LSmrw3WR3tNPn3rUs4B3ad=MqDgHx3UdA@mail.gmail.com>
 <2024090220-elite-duvet-c6af@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2024090220-elite-duvet-c6af@gregkh>

On Mon, Sep 02, 2024 at 07:57:02AM +0200, Greg KH wrote:
> On Mon, Sep 02, 2024 at 09:37:22AM +0530, Amil Sanan wrote:
> > I don't understand what is the issue
> 
> The bot said what was wrong:
> 
> > > - Your patch was attached, please place it inline so that it can be
> > >   applied directly from the email message itself.

I previously pointed you to git-send-email and
https://git-send-email.io/ and I highly recommend using that workflow to
submit patches. Some people use different tools, and you could decide to
do so as well, but you won't receive much support from the community
regarding the tooling in that case.

Also, as requested before, you *must* disable HTML e-mails or your mails
won't make it properly to the lists.

> > > - It looks like you did not use your "real" name for the patch on either
> > >   the Signed-off-by: line, or the From: line (both of which have to
> > >   match).  Please read the kernel file,
> > >   Documentation/process/submitting-patches.rst for how to do this
> > >   correctly.
> 
> Both need to be fixed up.
> 
> Please see the hundreds of examples on the mailing list for details on
> how to do this in a way that we can accept it.

-- 
Regards,

Laurent Pinchart

