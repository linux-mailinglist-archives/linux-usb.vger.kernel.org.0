Return-Path: <linux-usb+bounces-4945-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6085A82BC51
	for <lists+linux-usb@lfdr.de>; Fri, 12 Jan 2024 09:24:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 007F8B22D4C
	for <lists+linux-usb@lfdr.de>; Fri, 12 Jan 2024 08:24:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E69755D756;
	Fri, 12 Jan 2024 08:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="YyVsVSKJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6182F5D73C
	for <linux-usb@vger.kernel.org>; Fri, 12 Jan 2024 08:24:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63FCEC433F1;
	Fri, 12 Jan 2024 08:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1705047853;
	bh=Y9yfVVVpdmCG+kXbhzAr8vlCy4p39zZnHKBNVuKtA7c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YyVsVSKJUS1OIfchy9l8+vpTmLVFYojgIU0tolVWFFv8JNAeJG6foFDQvBa2FewYl
	 B6ARAqhtb4Sk5+bGTD174hSiTu629RPgYtcdms4ZmPsLv+c9R8rYuYkJPJ5SqADvf9
	 1WtHSfKlLqRr0pcQxElEQHH/+hdHngIFT5qDRhvo=
Date: Fri, 12 Jan 2024 09:24:11 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: benjamin.tissoires@redhat.com, hdegoede@redhat.com,
	ivan.orlov0322@gmail.com, heikki.krogerus@linux.intel.com,
	linux-usb@vger.kernel.org, linux-imx@nxp.com, jun.li@nxp.com
Subject: Re: [PATCH] usb: roles: try to get/put all relevant modules
Message-ID: <2024011213-situated-augmented-64a4@gregkh>
References: <20240112080108.1147450-1-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240112080108.1147450-1-xu.yang_2@nxp.com>

On Fri, Jan 12, 2024 at 04:01:08PM +0800, Xu Yang wrote:
> +void usb_role_switch_get_modules(struct device *dev)
> +{
> +	while (dev) {
> +		if (dev->driver)
> +			WARN_ON(!try_module_get(dev->driver->owner));

You just crashed all systems that have panic-on-warn enabled, which is
by far (i.e. in the billions) the huge majority of Linux systems in the
world.

If this is something that can fail, then properly handle the issue,
don't just give up and say "let's fill the kernel log with a mess and
reboot the box!".

Also, are you SURE that module owners are what you want to track here?
That's not usually the real solution for things like this, remember
module reference counts deal with code, but the driver model deals with
data...

thanks,

greg k-h

