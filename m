Return-Path: <linux-usb+bounces-15346-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 15BAC984154
	for <lists+linux-usb@lfdr.de>; Tue, 24 Sep 2024 11:01:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B35A41F23A50
	for <lists+linux-usb@lfdr.de>; Tue, 24 Sep 2024 09:01:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD7E11428F3;
	Tue, 24 Sep 2024 09:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="jdAbu7Ye"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA8EEDDA8
	for <linux-usb@vger.kernel.org>; Tue, 24 Sep 2024 09:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727168463; cv=none; b=KrFWl5qz7NYsK/Zxc+m1qFM9kVd/LnOeKwYewurxg1TgOVuagUa6VVtKihInI94l/mh14BozLBJDD5fCYCzv2dcnWCgx/f0m/7hJ3pq/n221Kh5xMvIVenNJk4Eqzn+gOi27pFBkbMOpBdgM424An5z0acTRIb+6hmjLsOEa0m8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727168463; c=relaxed/simple;
	bh=cbR7TTlsosW1c4C6VA9hsbIKq4DdcL3B1WfjeY/jhvA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c+YXRIoV57/EQyJt04R0nrK9TS79S4jBDcGh2igB2p4O0IpiLx/9tkdng8znHLtgaGW+zVEXCA3q+UhuOsFbEWiSlZHvpiJY85LhY/ACax8w6ebxScrarfkX5J7X5ZsTuemXCHQ2IIhZKS9+9u1V9ZigdP6jPJ8LXzKtNpKimJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=jdAbu7Ye; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19458C4CEC4;
	Tue, 24 Sep 2024 09:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1727168462;
	bh=cbR7TTlsosW1c4C6VA9hsbIKq4DdcL3B1WfjeY/jhvA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jdAbu7Ye1ZcIlJbS91ozpw9kml48jk3D0uKrzlF0FxzcBynhSKwM2pQRMt+HZA65w
	 SxqBRUGNpbwTP+jVlSIyZ04v1wRBfEcfaUSFGMugWb9YLrmT+O8g/s6jHh8lyZZG+A
	 1+EBSpegeCFeH6yZkD2oyA/RD+PmCKBmBSmsWsMs=
Date: Tue, 24 Sep 2024 11:00:34 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: Switch back to struct platform_driver::remove()
Message-ID: <2024092418-utensil-albatross-930c@gregkh>
References: <20240924084329.53094-2-u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240924084329.53094-2-u.kleine-koenig@baylibre.com>

On Tue, Sep 24, 2024 at 10:43:29AM +0200, Uwe Kleine-König wrote:
> After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
> return void") .remove() is (again) the right callback to implement for
> platform drivers.
> 
> Convert all platform drivers below drivers/usb to use .remove(), with
> the eventual goal to drop struct platform_driver::remove_new(). As
> .remove() and .remove_new() have the same prototypes, conversion is done
> by just changing the structure member name in the driver initializer.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
> ---
> Hello Greg,
> 
> given the simplicity of the individual changes I do this all in a single
> patch. Please tell and I will happily split it for an improved commit
> count :-) I based this on today's next, feel free to drop changes that
> result in a conflict when you come around to apply this. I'll care for
> the fallout at a later time then. (Having said that, if you use b4 am -3
> and git am -3, there should be hardly any fallout.)
> 
> Note I didn't Cc: all the individual driver maintainers to not trigger
> sending limits and spam filters.

I'll take this after -rc1 is out, no worries.  thanks for the patch!

greg k-h

