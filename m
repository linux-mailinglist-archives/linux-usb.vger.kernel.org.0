Return-Path: <linux-usb+bounces-4946-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 98FA182BC56
	for <lists+linux-usb@lfdr.de>; Fri, 12 Jan 2024 09:27:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3FFB6285660
	for <lists+linux-usb@lfdr.de>; Fri, 12 Jan 2024 08:27:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 643435D8E0;
	Fri, 12 Jan 2024 08:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Cf5j2ZMX"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E30765D756
	for <linux-usb@vger.kernel.org>; Fri, 12 Jan 2024 08:26:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDEF5C43390;
	Fri, 12 Jan 2024 08:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1705048017;
	bh=L4MUFnB/aMZEy5deEVs7xpVtIZOdRCfjIhOP7Bk0jn4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Cf5j2ZMXruWNIf3+Qd1YGcAvSRWdtyEVvBISs3Mk/YP1iy/GMbeup5N50LPpS0tbD
	 /WPO1ydT/aRGk8j2Sm6hHS3T4c8+jnrqHFqHXxsLpsKK1sAah6koMZYQdcamOMAvZI
	 gY/4HL7qLRm9tSMfLrOxBPHcznNxO1thvpCIiTrE=
Date: Fri, 12 Jan 2024 09:26:54 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: benjamin.tissoires@redhat.com, hdegoede@redhat.com,
	ivan.orlov0322@gmail.com, heikki.krogerus@linux.intel.com,
	linux-usb@vger.kernel.org, linux-imx@nxp.com, jun.li@nxp.com
Subject: Re: [PATCH] usb: roles: try to get/put all relevant modules
Message-ID: <2024011220-asleep-dragster-1e39@gregkh>
References: <20240112080108.1147450-1-xu.yang_2@nxp.com>
 <2024011213-situated-augmented-64a4@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2024011213-situated-augmented-64a4@gregkh>

On Fri, Jan 12, 2024 at 09:24:11AM +0100, Greg KH wrote:
> On Fri, Jan 12, 2024 at 04:01:08PM +0800, Xu Yang wrote:
> > +void usb_role_switch_get_modules(struct device *dev)
> > +{
> > +	while (dev) {
> > +		if (dev->driver)
> > +			WARN_ON(!try_module_get(dev->driver->owner));
> 
> You just crashed all systems that have panic-on-warn enabled, which is
> by far (i.e. in the billions) the huge majority of Linux systems in the
> world.
> 
> If this is something that can fail, then properly handle the issue,
> don't just give up and say "let's fill the kernel log with a mess and
> reboot the box!".

Ah, I see now you are just moving the code, but please, let's fix this
properly, don't persist in the wrong code here.

thanks,

greg k-h

