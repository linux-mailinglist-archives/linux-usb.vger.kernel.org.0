Return-Path: <linux-usb+bounces-11465-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF46990FC7E
	for <lists+linux-usb@lfdr.de>; Thu, 20 Jun 2024 08:06:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 56126B22B57
	for <lists+linux-usb@lfdr.de>; Thu, 20 Jun 2024 06:06:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB3F82D058;
	Thu, 20 Jun 2024 06:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="197q90Cq"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E32D011CA1
	for <linux-usb@vger.kernel.org>; Thu, 20 Jun 2024 06:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718863578; cv=none; b=fkZkpb10wblh+u+0gyEgIRkZE8t0spoQb6OKhGPqDoqdzRuWOR3P8Wci2QZpcax756UU2Wz3n8WUFcNJ2VSeJev6/0Keo6iAe0ozDRaHLLD0CwnA3GjI4imdhOeCbLPanc3/I6nKpWSDkaRMVFZ9PqO8aWvxzHfgqZNHU+TH/TU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718863578; c=relaxed/simple;
	bh=FcHFFGbsudIEQdqv0jtX7Jn9a43ZkGazVBd7asL3Pt4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uEplZwwArUgkL0CkK3i4gNQw3Q30SHrxIyivZqwtOdLtHrWX2FZHW+zCDk8QyDgOD5ILrcAK8UgDX14ZZBteM+HBi00wKLaYIjgGB0CuCC2lAaWTPenRV2NvswJESPgYidPjsTLhVKyozI84BCNNjHLxdwSgJTUfQ7T+qfhBjIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=197q90Cq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3D7BC2BD10;
	Thu, 20 Jun 2024 06:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1718863577;
	bh=FcHFFGbsudIEQdqv0jtX7Jn9a43ZkGazVBd7asL3Pt4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=197q90Cq1PBz0bSnki9rHUyMjJyYAIrhHi0SsT0dnKxq77MA1JRhVaqLUotmsyTG+
	 A7beePPp8JQsWbIABYuNDelUGR4c9Fsk8TgwVhg3TKUq54BmZAk5nt2qqnfpzLowSR
	 SvCoFxYy8bMT65ChAXfSYZQapDXkptDOUTEpBDmM=
Date: Thu, 20 Jun 2024 08:06:17 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Giacinto Cifelli <gciofono@gmail.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: usb composition without class
Message-ID: <2024062016-robust-distance-ea98@gregkh>
References: <CAKSBH7F7LhCykPdKYRi0DvLX5yYjKtbOZbEOKhDXfvrQJA-XKA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKSBH7F7LhCykPdKYRi0DvLX5yYjKtbOZbEOKhDXfvrQJA-XKA@mail.gmail.com>

On Thu, Jun 20, 2024 at 07:58:13AM +0200, Giacinto Cifelli wrote:
> greetings,
> 
> question:
> 
> on a system (yocto), I have a usb composition that doesn't assign the
> class for the interfaces:
>     |__ Port 1: Dev 2, If 1, Class=, Driver=usbhid, 1.5M
>     |__ Port 1: Dev 2, If 0, Class=, Driver=usbhid, 1.5M
>     |__ Port 3: Dev 3, If 10, Class=, Driver=cdc_mbim, 480M
>     |__ Port 3: Dev 3, If 8, Class=, Driver=cdc_acm, 480M
>     |__ Port 3: Dev 3, If 6, Class=, Driver=cdc_acm, 480M
>     |__ Port 3: Dev 3, If 4, Class=, Driver=cdc_acm, 480M
>     |__ Port 3: Dev 3, If 2, Class=, Driver=cdc_acm, 480M
>     |__ Port 3: Dev 3, If 11, Class=, Driver=cdc_mbim, 480M
>     |__ Port 3: Dev 3, If 0, Class=, Driver=cdc_acm, 480M
>     |__ Port 3: Dev 3, If 9, Class=, Driver=cdc_acm, 480M
>     |__ Port 3: Dev 3, If 7, Class=, Driver=cdc_acm, 480M
>     |__ Port 3: Dev 3, If 5, Class=, Driver=cdc_acm, 480M
>     |__ Port 3: Dev 3, If 3, Class=, Driver=cdc_acm, 480M
>     |__ Port 3: Dev 3, If 1, Class=, Driver=cdc_acm, 480M
> Kernel: Linux version 6.1.35 (oe-user@oe-host) (x86_64-poky-linux-gcc
> (GCC) 11.4.0, GNU ld (GNU Binutils) 2.38.20220708) #1 SMP
> PREEMPT_DYNAMIC Thu Jun 22 18:03:13 UTC 2023
> 
> instead of (arch):
>     |__ Port 004: Dev 004, If 0, Class=Communications, Driver=cdc_acm, 5000M
>     |__ Port 004: Dev 004, If 1, Class=CDC Data, Driver=cdc_acm, 5000M
>     |__ Port 004: Dev 004, If 2, Class=Communications, Driver=cdc_acm, 5000M
>     |__ Port 004: Dev 004, If 3, Class=CDC Data, Driver=cdc_acm, 5000M
>     |__ Port 004: Dev 004, If 4, Class=Communications, Driver=cdc_acm, 5000M
>     |__ Port 004: Dev 004, If 5, Class=CDC Data, Driver=cdc_acm, 5000M
>     |__ Port 004: Dev 004, If 6, Class=Communications, Driver=cdc_acm, 5000M
>     |__ Port 004: Dev 004, If 7, Class=CDC Data, Driver=cdc_acm, 5000M
>     |__ Port 004: Dev 004, If 8, Class=Communications, Driver=cdc_acm, 5000M
>     |__ Port 004: Dev 004, If 9, Class=CDC Data, Driver=cdc_acm, 5000M
>     |__ Port 004: Dev 004, If 10, Class=Communications, Driver=cdc_mbim, 5000M
>     |__ Port 004: Dev 004, If 11, Class=CDC Data, Driver=cdc_mbim, 5000M
> Kernel: Linux 6.6.34-1-lts #1 SMP PREEMPT_DYNAMIC Sun, 16 Jun 2024
> 14:45:31 +0000 x86_64 GNU/Linux
> 
> This lack of class creates too many /dev/ttyACMx ports, and
> ModemManager tries to access them all, perhaps also blocking the
> device, and the whole system doesn't work.
> 
> For completeness, the device is:
>     Bus 002 Device 004: ID 1e2d:0065 Gemalto M2M GmbH LTE Modem
> which is supported without any customs in the cdc-acm and cdc_mbim drivers.
> 
> I spotted only two options not compiled-in in the yocto .config
> (compared with the arch one), but I strongly doubt this is related:
>     CONFIG_USB_G_MULTI
>     CONFIG_USB_G_MULTI_CDC
> 
> Would you know why the class is not assigned?

This is just a userspace issue, right?  Or are you saying that somehow
the same device plugged into two different systems works differently?

Note that 6.6 is a year older than 6.1 so perhaps you just need to
update your system running 6.1?  Odds are there's a quirk for this
device in newer kernels.

Also, 6.1.35 is VERY old and obsolete and full of known security holes
that have been fixed.  Please update to the latest 6.1.y release as soon
as possible.

thanks,

greg k-h

