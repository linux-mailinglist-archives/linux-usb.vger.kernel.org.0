Return-Path: <linux-usb+bounces-1110-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BEE67B9B45
	for <lists+linux-usb@lfdr.de>; Thu,  5 Oct 2023 09:13:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id 5C5CC281AEF
	for <lists+linux-usb@lfdr.de>; Thu,  5 Oct 2023 07:13:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D803525C;
	Thu,  5 Oct 2023 07:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="SM3GSVUb"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06C703C3F
	for <linux-usb@vger.kernel.org>; Thu,  5 Oct 2023 07:13:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F94FC433BA;
	Thu,  5 Oct 2023 07:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1696490001;
	bh=8OKsDsRgseQhws0CL9HUY+Fxt0nfCfk4BoGajhLR7Is=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SM3GSVUb40jlNIYxL23WMHJhlc84z0uY4+A+X4KVpX7Y3FOLf9koln1RaU05qUH6D
	 LWvH6JoKggmL+dr/2lp5o8oMyH6UOT0OY5d4twl5gqbuDvF9boIWUy1/JRI7Zp/Q/6
	 JkSn7lXFpWYlDAbkPM/drvrRlPAn30g7rs9sXQHg=
Date: Thu, 5 Oct 2023 09:13:18 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-usb@vger.kernel.org,
	linux-mediatek@lists.infradead.org, kernel@pengutronix.de
Subject: Re: [PATCH v2] usb: mtu3: Convert to platform remove callback
 returning void
Message-ID: <2023100530-degree-overlap-6aff@gregkh>
References: <20230914200251.919584-1-u.kleine-koenig@pengutronix.de>
 <2023100219-variety-genre-befe@gregkh>
 <20231002144959.jc6wwfrvwd4cyu2l@pengutronix.de>
 <2023100253-amino-pencil-9a96@gregkh>
 <20231002214158.wvhals4ywezftepo@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231002214158.wvhals4ywezftepo@pengutronix.de>

On Mon, Oct 02, 2023 at 11:41:58PM +0200, Uwe Kleine-König wrote:
> Hello Greg,
> 
> On Mon, Oct 02, 2023 at 04:53:05PM +0200, Greg Kroah-Hartman wrote:
> > On Mon, Oct 02, 2023 at 04:49:59PM +0200, Uwe Kleine-König wrote:
> > > On Mon, Oct 02, 2023 at 04:39:47PM +0200, Greg Kroah-Hartman wrote:
> > > > On Thu, Sep 14, 2023 at 10:02:51PM +0200, Uwe Kleine-König wrote:
> > > > > @@ -469,8 +469,17 @@ static int mtu3_remove(struct platform_device *pdev)
> > > > >  		ssusb_gadget_exit(ssusb);
> > > > >  		ssusb_host_exit(ssusb);
> > > > >  		break;
> > > > > -	default:
> > > > > -		return -EINVAL;
> > > > > +	case USB_DR_MODE_UNKNOWN:
> > > > > +		/*
> > > > > +		 * This cannot happen because with dr_mode ==
> > > > > +		 * USB_DR_MODE_UNKNOWN, .probe() doesn't succeed and so
> > > > > +		 * .remove() wouldn't be called at all. However (little
> > > > > +		 * surprising) the compiler isn't smart enough to see that, so
> > > > > +		 * we explicitly have this case item to not make the compiler
> > > > > +		 * wail about an unhandled enumeration value.
> > > > > +		 */
> > > > > +		WARN_ON(1);
> > > > 
> > > > Please don't add new WARN_ON() calls to the kernel, print out a big
> > > > error message and return, don't reboot the machine.
> > > 
> > > Huh, printing out an loud error message was my intention. It's news to
> > > me that WARN_ON() reboots the machine?! I thought BUG_ON() was the one
> > > with the effects you describe that I shouldn't use.
> > 
> > panic-on-warn is set for zillions[1] of Linux systems out there, so systems
> > will reboot.
> 
> The people enabling panic-on-warn *ask* for a reboot if something
> strange happens, right? If ssusb->dr_mode is USB_DR_MODE_UNKNOWN in
> .remove() but wasn't in .probe(), that's strange, right? If I don't
> enable panic-on-warn, my system just emits a warning and then the driver
> copes with what it has, right? Sounds to me as if WARN_ON does exactly
> what is the right thing here.

I really don't want to add more WARN_ON() to the kernel if at all
possible.

If this "can not happen" then just don't even add code for it, why have
this at all?  The compiler warning can be handled a different way,
right?

thanks,

greg k-h

