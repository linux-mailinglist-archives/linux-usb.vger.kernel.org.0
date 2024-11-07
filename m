Return-Path: <linux-usb+bounces-17297-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A079C00C9
	for <lists+linux-usb@lfdr.de>; Thu,  7 Nov 2024 10:04:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 136E71F236A6
	for <lists+linux-usb@lfdr.de>; Thu,  7 Nov 2024 09:04:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A969D1DF725;
	Thu,  7 Nov 2024 09:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="YT/wrdNF"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 318311D7E4E
	for <linux-usb@vger.kernel.org>; Thu,  7 Nov 2024 09:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730970257; cv=none; b=VqOLaYhe3X0cv1mW43HADlAPpznzgUkIiWZ+/bvKyo8/h5Q7vYgUkJHWFQXbfZBi+1SNOjZB2N7SGQo9kG0XvIX9g1us60UPidujNy5vt30C8UzCt2XTETO6Jnmqw6cpQZjb6UixnXuhCWP/TCyFSwRUKo/WIDzRNC14nu1KWow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730970257; c=relaxed/simple;
	bh=anAifvboBCygx/LOzgnPBo0/wJ2pL7yGHvcqERjFGOw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d6xk/T1twrsxkeCDoLYFcVXpYBE3updyI+dztcNy3WeukWANBCJwXsgk34rKkr3reWo/zxiL4jyNOkcB9UKhR4D8jbN21ULVv16SRo87maxWgHWJf4E1ovo/EZOk1sL4BY7tiuoRrwe5pgqwdBtOUSS35ARi2MBuPTGULVw9zmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=YT/wrdNF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30550C4CECC;
	Thu,  7 Nov 2024 09:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1730970256;
	bh=anAifvboBCygx/LOzgnPBo0/wJ2pL7yGHvcqERjFGOw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YT/wrdNFDZK8hzux6yD1lEADbnuBv8THZyXpUEUea/EKix2m1v6Jg3JMU1UKzZxAU
	 GBXJVjd4EODUNnIR17hkVb7Zj368eiiIApL/bsvMDcxjSGQvAZzEadqIcAphyRU+Ue
	 zGZDJnT6HGF6208QN1ypHdLV8jX2Nn4OyjaQv/B0=
Date: Thu, 7 Nov 2024 10:03:56 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Cc: linux-usb@vger.kernel.org, Wentong Wu <wentong.wu@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v3 1/3] usb: misc: ljca: move usb_autopm_put_interface()
 after wait for response
Message-ID: <2024110710-duckbill-commodity-d1b5@gregkh>
References: <20241107073718.405208-1-stanislaw.gruszka@linux.intel.com>
 <2024110743-dragonish-jokingly-8459@gregkh>
 <ZyyAZaUNJ0kCEHG7@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZyyAZaUNJ0kCEHG7@linux.intel.com>

On Thu, Nov 07, 2024 at 09:55:01AM +0100, Stanislaw Gruszka wrote:
> On Thu, Nov 07, 2024 at 09:16:01AM +0100, Greg KH wrote:
> > On Thu, Nov 07, 2024 at 08:37:16AM +0100, Stanislaw Gruszka wrote:
> > > Do not mark interface as ready to suspend when we are still waiting
> > > for response messages from the device.
> > > 
> > > Fixes: acd6199f195d ("usb: Add support for Intel LJCA device")
> > > Cc: stable@vger.kernel.org
> > > Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> > > Tested-by: Hans de Goede <hdegoede@redhat.com> # ThinkPad X1 Yoga Gen 8, ov2740
> > > Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
> > > ---
> > > v2: fix handing error of usb_autopm_get_interface(),
> > >     add R-b, T-b tags from Hans
> > > v3: add A-b tag from Sakari
> > > 
> > >  drivers/usb/misc/usb-ljca.c | 12 ++++++------
> > >  1 file changed, 6 insertions(+), 6 deletions(-)
> > 
> > For some reason you aren't sending this to the usb maintainer to be
> > applied, oh well...
> 
> Sorry, I thought sending patches to the mailing list is sufficient
> to get them applied. 

Please work with the Intel internal group to get their approval and
review before sending out your next round of patches for this, as they
know how to catch trivial stuff like this before forcing others to point
it out :)

thanks,

greg k-h

