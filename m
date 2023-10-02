Return-Path: <linux-usb+bounces-933-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB357B5579
	for <lists+linux-usb@lfdr.de>; Mon,  2 Oct 2023 16:53:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id 594FB2828CB
	for <lists+linux-usb@lfdr.de>; Mon,  2 Oct 2023 14:53:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 719A71A713;
	Mon,  2 Oct 2023 14:53:09 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09B151A29B
	for <linux-usb@vger.kernel.org>; Mon,  2 Oct 2023 14:53:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 148B7C433C7;
	Mon,  2 Oct 2023 14:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1696258388;
	bh=+rVpKXm6Nmhq/ALGv9CKFZpidgGfpk8Y8x6TZ51OS8k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pi7CmM/WRmIoi1lEnPr1T0+EFGW9iHJMmX0utDgT3U5Y6pKnMgSmMpzBS8+er5kqh
	 ToS2ootXrmI3kY+Ey26Z4itgV+j+6zh6nMMuxbqjbr+i2Xz1871GBaNCcbFWKzNquM
	 erPN+M7XmTPxFMRDTCGAUvmhkIxoPRw4tVV8EfPM=
Date: Mon, 2 Oct 2023 16:53:05 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-usb@vger.kernel.org,
	linux-mediatek@lists.infradead.org, kernel@pengutronix.de
Subject: Re: [PATCH v2] usb: mtu3: Convert to platform remove callback
 returning void
Message-ID: <2023100253-amino-pencil-9a96@gregkh>
References: <20230914200251.919584-1-u.kleine-koenig@pengutronix.de>
 <2023100219-variety-genre-befe@gregkh>
 <20231002144959.jc6wwfrvwd4cyu2l@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231002144959.jc6wwfrvwd4cyu2l@pengutronix.de>

On Mon, Oct 02, 2023 at 04:49:59PM +0200, Uwe Kleine-König wrote:
> Hello Greg,
> 
> On Mon, Oct 02, 2023 at 04:39:47PM +0200, Greg Kroah-Hartman wrote:
> > On Thu, Sep 14, 2023 at 10:02:51PM +0200, Uwe Kleine-König wrote:
> > > @@ -469,8 +469,17 @@ static int mtu3_remove(struct platform_device *pdev)
> > >  		ssusb_gadget_exit(ssusb);
> > >  		ssusb_host_exit(ssusb);
> > >  		break;
> > > -	default:
> > > -		return -EINVAL;
> > > +	case USB_DR_MODE_UNKNOWN:
> > > +		/*
> > > +		 * This cannot happen because with dr_mode ==
> > > +		 * USB_DR_MODE_UNKNOWN, .probe() doesn't succeed and so
> > > +		 * .remove() wouldn't be called at all. However (little
> > > +		 * surprising) the compiler isn't smart enough to see that, so
> > > +		 * we explicitly have this case item to not make the compiler
> > > +		 * wail about an unhandled enumeration value.
> > > +		 */
> > > +		WARN_ON(1);
> > 
> > Please don't add new WARN_ON() calls to the kernel, print out a big
> > error message and return, don't reboot the machine.
> 
> Huh, printing out an loud error message was my intention. It's news to
> me that WARN_ON() reboots the machine?! I thought BUG_ON() was the one
> with the effects you describe that I shouldn't use.

panic-on-warn is set for zillions[1] of Linux systems out there, so systems
will reboot.

thanks,

greg k-h

[1] Unofficial number, I know the "cloud" systems set this, as well as
    all of Samsung's phone kernels, a non-trivial amount of Linux
    instances in the wild.

