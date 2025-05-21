Return-Path: <linux-usb+bounces-24190-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 99944ABF8F3
	for <lists+linux-usb@lfdr.de>; Wed, 21 May 2025 17:13:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DA7DE1889A6A
	for <lists+linux-usb@lfdr.de>; Wed, 21 May 2025 15:09:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 698691DB548;
	Wed, 21 May 2025 15:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K/zyHxDP"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E386C17A2F7
	for <linux-usb@vger.kernel.org>; Wed, 21 May 2025 15:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747840167; cv=none; b=f2xPpxUvv7T+e/CPpIDd0eXQmB8to5T0T61zPukT+zz0U9iRzKm+yHdvGr4xFBIcNrP6Am2Av9ZG8tYBj10HdEQ4FO2tv1FWxvCPrGcDKzZohvQ5TAq0dNYFHeuI1ihtF1A7FG29btN+8xo7jM+MY/Trf5NQ1Ybn4Ix296OWlXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747840167; c=relaxed/simple;
	bh=KaaT6H8JzwJWZHo6e7aBliN1Ze1h8xdJ3Gjjs6fufVM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZwL3NGa/hRoHa8slWR6PCBLoLsqUFUlBg/gJnqWZv1m8bRwR76FSUerJc2gnGJsd1MLFOwkzmlZbql4gOuj9D9A+WCkkplbcnyoOAm1bQVM+iIdDWZOCIceDvJggo2z9uBd4EotS1dc0s4hYso1DH0+qHuwOxWCvPOtRrJtV3DQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K/zyHxDP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B930C4CEE4;
	Wed, 21 May 2025 15:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747840166;
	bh=KaaT6H8JzwJWZHo6e7aBliN1Ze1h8xdJ3Gjjs6fufVM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K/zyHxDPFTYNxfjY5hBix79mVHoFePntwb7gu2EAlICF503qzCNZH2QFI1XjyxXWw
	 R3jr0vQetbWN8FRi1pkF0lylWnI0cpwhdMbjToB+H9zfP/VH7YwedwMwjjx6qtXXXM
	 l30DCu1BFpcq4RmpPWMCESOoV1BXcTeIvYbghdgjf0whMvRsjaapU9+E/ajaHAZWJl
	 bMoEBWfj/JcT7LlEFPDNVERaHQZARU0yoVcjYPykcxJ3w/I6RzRx7qzGgx+BdC7i+O
	 NlYV0zDP6s3NonXzhPTI3JazJ8/9f32l1vSKSgXnSYGxEuDsKH2B3T6sKHo16+uTHO
	 q6XOPNS8fNubg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1uHl4N-000000000Pc-21UG;
	Wed, 21 May 2025 17:09:24 +0200
Date: Wed, 21 May 2025 17:09:23 +0200
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: Re: [PATCH] USB: serial: bus: fix const issue in
 usb_serial_device_match()
Message-ID: <aC3so4VSWcqLy-Nx@hovoldconsulting.com>
References: <2025052133-recreate-attitude-c564@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025052133-recreate-attitude-c564@gregkh>

On Wed, May 21, 2025 at 03:41:34PM +0200, Greg Kroah-Hartman wrote:
> usb_serial_device_match() takes a const pointer, and then decides to
> cast it away into a non-const one, which is not a good thing to do
> overall.  Fix this up by properly setting the pointers to be const to
> preserve that attribute.

I think this deserves a Fixes tag as this is a recent issue introduced
by commit d69d80484598 ("driver core: have match() callback in struct
bus_type take a const *") (even if we only use the address of the
pointer).

> Cc: Johan Hovold <johan@kernel.org>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

> @@ -17,7 +17,7 @@ static int usb_serial_device_match(struct device *dev,
>  				   const struct device_driver *drv)
>  {
>  	const struct usb_serial_port *port = to_usb_serial_port(dev);
> -	struct usb_serial_driver *driver = to_usb_serial_driver(drv);
> +	const struct usb_serial_driver *driver = to_usb_serial_driver(drv);
>  
>  	/*
>  	 * drivers are already assigned to ports in serial_probe so it's

Now applied with a Fixes tag added.

Johan

