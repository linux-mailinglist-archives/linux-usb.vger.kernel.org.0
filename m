Return-Path: <linux-usb+bounces-11729-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DC13591A377
	for <lists+linux-usb@lfdr.de>; Thu, 27 Jun 2024 12:06:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 902081F22F12
	for <lists+linux-usb@lfdr.de>; Thu, 27 Jun 2024 10:06:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 809CD13C80E;
	Thu, 27 Jun 2024 10:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XPe0Byxf"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D29C22EF2
	for <linux-usb@vger.kernel.org>; Thu, 27 Jun 2024 10:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719482751; cv=none; b=Xu1R34U7VQUg6Wa8tl1WsANU34N4DRMQxYQT+xVPyjeHMfaPEtQHqCea4SGwKp853yrkK6wGXvNRY8+cjmzSZcGElH/+3lhwUqvFPkUORBmjoemKK8DdBeCtiB6Ks4sSDj+5aNEsrrBAI9pr0/XnW3NSrlmoKK+WyKkIRat5Jbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719482751; c=relaxed/simple;
	bh=O5udVY2QqMi/9KMEodOwRTHcslF4RcG2tjMCFylWe90=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z9vRDjDd/pAGJmeF3duBi7uNk2XFI0e+u7efIaKLO9oULzoLYm+U6PW/H1JAg1nkuFjT2/9ygfYBjoMpvoJfkXd7X4u+IQLRxbDrJE+CBKL17jX5nT7flDRpw0RDNWGI3oKou2ojte9TtRkiQdGOeu3gsNQaKj2le2dvFZs0RZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XPe0Byxf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E03C1C2BBFC;
	Thu, 27 Jun 2024 10:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719482750;
	bh=O5udVY2QqMi/9KMEodOwRTHcslF4RcG2tjMCFylWe90=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XPe0ByxfpHrBh8n6sEzqasFACNKvXK/OzydGQMNCI7TN3vk82RMWuQ1n4e2asKEk4
	 3PT7VSmg0IkZzlNzBuluWFj+Z+vviw5oGH5SnFayb9oMpFHbodqd2P2k/LuUPqKwNf
	 +CCvVCdhqV8HWfpUyzx+WfcE+8fHtrYDEmiYQJMQupag7VXOJTUw37XEOrrA23dOIO
	 mheBtQ2l/BiRSvVQ0IFWeNk6r8YJ7d2/LGPfG56ia+zm5muavC97Mi1oqw6q3EsSN6
	 m3sxhCDlcP3DE/vtbTS/KYp7Owj1E4T9t7cMjDc1X+7e57H10uxx+lK10lBv7nIUjB
	 J6SzlZspnOHgg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1sMm0y-000000003uL-1cpE;
	Thu, 27 Jun 2024 12:06:04 +0200
Date: Thu, 27 Jun 2024 12:06:04 +0200
From: Johan Hovold <johan@kernel.org>
To: Daniele Palmas <dnlplm@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/1] USB: serial: option: add Telit generic core-dump
 composition
Message-ID: <Zn05jBuPDBC9Q5CL@hovoldconsulting.com>
References: <20240530080053.1094657-1-dnlplm@gmail.com>
 <Zn0SAXwM45_XF1VX@hovoldconsulting.com>
 <CAGRyCJFsr8BLBtwyLv3oFgpwS2cqGKu8GRhFOKY4CJAx2sGdEg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGRyCJFsr8BLBtwyLv3oFgpwS2cqGKu8GRhFOKY4CJAx2sGdEg@mail.gmail.com>

On Thu, Jun 27, 2024 at 11:51:05AM +0200, Daniele Palmas wrote:
> Il giorno gio 27 giu 2024 alle ore 09:17 Johan Hovold
> <johan@kernel.org> ha scritto:

> > > +     { USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x9000, 0xff),    /* Telit generic core-dump device */
> > > +       .driver_info = NCTRL(0) },
> >
> > ZLP not needed like for the other flashing device entries?
> 
> not needed for this one.

Thanks for confirming, now applied.

Johan

