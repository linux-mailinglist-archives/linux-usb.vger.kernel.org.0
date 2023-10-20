Return-Path: <linux-usb+bounces-1982-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 193D37D11A0
	for <lists+linux-usb@lfdr.de>; Fri, 20 Oct 2023 16:33:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 17E4B1C20FBC
	for <lists+linux-usb@lfdr.de>; Fri, 20 Oct 2023 14:33:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9FB21D6BD;
	Fri, 20 Oct 2023 14:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="vaidQ2/A"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 169E21DA28
	for <linux-usb@vger.kernel.org>; Fri, 20 Oct 2023 14:33:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08FC6C433C7;
	Fri, 20 Oct 2023 14:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1697812418;
	bh=OQ/SwO6+aCaGvq+wHdqRuqJZ3IwVSwwQr1DeRuGWHUg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vaidQ2/AwzPR3ZDhWoNyRO5/RMWbojeOimU4dnTV9hlxZFYtVabK3EZ8/sKdfb0Nk
	 f5grS0/wL4/uz8mE2p1GLiaSeK1FNTCZ139Uous1egdmIResk5m1ZFVdRdgZwHJp6c
	 /mTS9fK26JLoKle0HFiib1prqwQ66HUO3bDcNbpE=
Date: Fri, 20 Oct 2023 16:33:34 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-usb@vger.kernel.org,
	linux-mediatek@lists.infradead.org, kernel@pengutronix.de
Subject: Re: [PATCH v2] usb: mtu3: Convert to platform remove callback
 returning void
Message-ID: <2023102012-snowbird-trapezoid-1f3a@gregkh>
References: <20230914200251.919584-1-u.kleine-koenig@pengutronix.de>
 <2023100219-variety-genre-befe@gregkh>
 <20231002144959.jc6wwfrvwd4cyu2l@pengutronix.de>
 <2023100253-amino-pencil-9a96@gregkh>
 <20231002214158.wvhals4ywezftepo@pengutronix.de>
 <2023100530-degree-overlap-6aff@gregkh>
 <20231020095325.qgymq46sj4isaoqa@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231020095325.qgymq46sj4isaoqa@pengutronix.de>

On Fri, Oct 20, 2023 at 11:53:25AM +0200, Uwe Kleine-König wrote:
> Hello Greg,
> 
> On Thu, Oct 05, 2023 at 09:13:18AM +0200, Greg Kroah-Hartman wrote:
> > On Mon, Oct 02, 2023 at 11:41:58PM +0200, Uwe Kleine-König wrote:
> > > On Mon, Oct 02, 2023 at 04:53:05PM +0200, Greg Kroah-Hartman wrote:
> > > > On Mon, Oct 02, 2023 at 04:49:59PM +0200, Uwe Kleine-König wrote:
> > > > > On Mon, Oct 02, 2023 at 04:39:47PM +0200, Greg Kroah-Hartman wrote:
> > > > > > On Thu, Sep 14, 2023 at 10:02:51PM +0200, Uwe Kleine-König wrote:
> > > > > > > @@ -469,8 +469,17 @@ static int mtu3_remove(struct platform_device *pdev)
> > > > > > >  		ssusb_gadget_exit(ssusb);
> > > > > > >  		ssusb_host_exit(ssusb);
> > > > > > >  		break;
> > > > > > > -	default:
> > > > > > > -		return -EINVAL;
> > > > > > > +	case USB_DR_MODE_UNKNOWN:
> > > > > > > +		/*
> > > > > > > +		 * This cannot happen because with dr_mode ==
> > > > > > > +		 * USB_DR_MODE_UNKNOWN, .probe() doesn't succeed and so
> > > > > > > +		 * .remove() wouldn't be called at all. However (little
> > > > > > > +		 * surprising) the compiler isn't smart enough to see that, so
> > > > > > > +		 * we explicitly have this case item to not make the compiler
> > > > > > > +		 * wail about an unhandled enumeration value.
> > > > > > > +		 */
> > > > > > > +		WARN_ON(1);
> > > > > > 
> > > > > > Please don't add new WARN_ON() calls to the kernel, print out a big
> > > > > > error message and return, don't reboot the machine.
> > > > > 
> > > > > Huh, printing out an loud error message was my intention. It's news to
> > > > > me that WARN_ON() reboots the machine?! I thought BUG_ON() was the one
> > > > > with the effects you describe that I shouldn't use.
> > > > 
> > > > panic-on-warn is set for zillions[1] of Linux systems out there, so systems
> > > > will reboot.
> > > 
> > > The people enabling panic-on-warn *ask* for a reboot if something
> > > strange happens, right? If ssusb->dr_mode is USB_DR_MODE_UNKNOWN in
> > > .remove() but wasn't in .probe(), that's strange, right? If I don't
> > > enable panic-on-warn, my system just emits a warning and then the driver
> > > copes with what it has, right? Sounds to me as if WARN_ON does exactly
> > > what is the right thing here.
> > 
> > I really don't want to add more WARN_ON() to the kernel if at all
> > possible.
> > 
> > If this "can not happen" then just don't even add code for it, why have
> > this at all?  The compiler warning can be handled a different way,
> > right?
> 
> Sure, what do you suggest? A dev_warn()?

Sure.  but again, if this can not happen, why do anything?

> ..ooOO(But maybe there are people who reboot on dev_warn(), too?)

No, that's not a thing, thankfully :)

greg k-h

