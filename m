Return-Path: <linux-usb+bounces-30728-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B0B7C6FAE1
	for <lists+linux-usb@lfdr.de>; Wed, 19 Nov 2025 16:36:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A888B4F28E2
	for <lists+linux-usb@lfdr.de>; Wed, 19 Nov 2025 15:29:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FACA2D2497;
	Wed, 19 Nov 2025 15:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="HJXMptlP"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6BB234FF4A;
	Wed, 19 Nov 2025 15:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763566159; cv=none; b=dBSfTeZUvYBh54nDaM+jO2HH/l7o1zLzIAMzkfm9++XFFzKA1/hp9VJPi8wLvBXcn9/mSVI9zess32yl1qm6O4F1zipZJmlOkb0I33LLUTg7peF4CAFiLhGlRAUf8PxPmDmP1Utr6TOJYoKUBf9Z2P/s0Wrgotodhm+1m1uqGi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763566159; c=relaxed/simple;
	bh=DCS0NQrEEF4gTVK3b/lLex/v6fWWuVAy9oQ2NCBPVnE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AxBr2md7+AO5skpHODwMtKBSOsDzpGOjsd8/ejLmDDsKmk/OTwepll4seS4F3esbHpDlHDSyhaMrQSxIZqM8DCg0kPoGrGVe5WtJdT/GA05qMqVnh43jcfLACPXhGqBva1DArJNZyiI9Nx0B0KKjv6mU6sjF9SxVdRLzZGQK7sA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=HJXMptlP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B142C19424;
	Wed, 19 Nov 2025 15:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1763566157;
	bh=DCS0NQrEEF4gTVK3b/lLex/v6fWWuVAy9oQ2NCBPVnE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HJXMptlPJ/LMCTmxF1AA9PgRSX+ufJx6nJLQb7OTMOW1YabMCjzUSn2LkhrHm2vxy
	 2pSpmdk9N+4pFG7tdaRTCG9kaaKHDE5AjcZDYs5TE3m0WkJkXkPM6KUNl0/WnGSTkn
	 /tKdVsUdDzryG1pzdJypFH+3e6zqgHmqkipWKXWM=
Date: Wed, 19 Nov 2025 16:29:13 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Clint George <clintbgeorge@gmail.com>
Cc: stern@rowland.harvard.edu, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, david.hunter.linux@gmail.com,
	linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org,
	khalid@kernel.org
Subject: Re: [PATCH 4/8] usb: gadget: dummy_hcd: fix block comments, blank
 lines and function braces
Message-ID: <2025111922-improper-sensually-13b0@gregkh>
References: <20251119130840.14309-1-clintbgeorge@gmail.com>
 <20251119130840.14309-5-clintbgeorge@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251119130840.14309-5-clintbgeorge@gmail.com>

On Wed, Nov 19, 2025 at 06:38:36PM +0530, Clint George wrote:
> This patch updates dummy_hcd.c to follow the Linux kernel coding style:
> - Align block comment asterisks properly.
> - Add blank lines after variable declarations where needed.
> - Remove unnecessary spaces before semicolons.
> - Move opening braces of function definitions to the next line.
> 
> These changes improve readability, maintain consistency, and make the code
> easier to maintain.

And are hard to review :(

Again, please break things up into "one logical change per patch", and
that does not mean "fix all coding style issues" is a "logical change".

Also:

>  /*
> -	EP_INFO("ep3in-iso",
> -		USB_EP_CAPS(USB_EP_CAPS_TYPE_ISO, USB_EP_CAPS_DIR_IN)),
> -	EP_INFO("ep4out-iso",
> -		USB_EP_CAPS(USB_EP_CAPS_TYPE_ISO, USB_EP_CAPS_DIR_OUT)),
> -*/
> + *	EP_INFO("ep3in-iso",
> + *		USB_EP_CAPS(USB_EP_CAPS_TYPE_ISO, USB_EP_CAPS_DIR_IN)),
> + *	EP_INFO("ep4out-iso",
> + *		USB_EP_CAPS(USB_EP_CAPS_TYPE_ISO, USB_EP_CAPS_DIR_OUT)),
> + */

Why not just delete commented out code?

thanks,

greg k-h

