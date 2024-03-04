Return-Path: <linux-usb+bounces-7475-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D24168701BF
	for <lists+linux-usb@lfdr.de>; Mon,  4 Mar 2024 13:44:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 890B41F220BE
	for <lists+linux-usb@lfdr.de>; Mon,  4 Mar 2024 12:44:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DAEB3D0D0;
	Mon,  4 Mar 2024 12:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Dqyp5NRA"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93D811E506
	for <linux-usb@vger.kernel.org>; Mon,  4 Mar 2024 12:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709556256; cv=none; b=swUfmdwkJVsVmF/UAUimzg5xbV384sSg4I4sJKiMzlfvnV+ikmsFX6SnEUsVIe61XnMFKQIertqN7H6VGU8SSUUeY0mKwV3nsnPjxgipzsStR6n5wR8sKKzy0Opy9/4R9y9enbSLB8DGCWZ/t80GQxpqcvp1+MALR4cEcpwAsig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709556256; c=relaxed/simple;
	bh=ibr0m6bwybrat6p5oKhqSPl9lIKu4xO6Eqo3Au5t4N0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WbzGLW/p2pNueljVXlGoQhpVevdjfww7wylY8ggxUzBrRHKp6+u1fMUaKizFwlX2vU8a4BRSNF52TrBR45u/xAxRxZIsBX/ZcsQ4hXvvEe9AHbV16/0ndGZct2b2IFgHSI2WEyRdRh0z3bKS/sWVa6rLu4UzzQBOw90bqr/2QqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Dqyp5NRA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD03BC433C7;
	Mon,  4 Mar 2024 12:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1709556256;
	bh=ibr0m6bwybrat6p5oKhqSPl9lIKu4xO6Eqo3Au5t4N0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Dqyp5NRA/ASPQgQoh8YmxL2xQ00ZlwdxOuHf0qBz1794AGQKGEbzyygfuZJQYaIsC
	 Qkg1BfzqVoYTszvukj68S9J9rOWQQvQnJzz1Kgb9DS7dJI8ju9PEiUyUNyhLDiCBVI
	 LsitKlvmRJreBxCBbAUUyHSSO5zQjttXJQ8v6t34=
Date: Mon, 4 Mar 2024 13:44:12 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Li Yang <leoyang.li@nxp.com>, linux-usb@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, kernel@pengutronix.de
Subject: Re: [PATCH] usb: gadget: fsl-udc: Replace custom log wrappers by
 pr_{err,warn,debug}
Message-ID: <2024030429-oppressed-crispness-ac9d@gregkh>
References: <20240304121153.750165-2-u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240304121153.750165-2-u.kleine-koenig@pengutronix.de>

On Mon, Mar 04, 2024 at 01:11:53PM +0100, Uwe Kleine-König wrote:
> The custom log wrappers ERR, WARNING and DBG don't add anything useful
> that cannot easily be done with pr_err() and friends. Replace the custom
> stuff by the well known functions from printk.h.

These really should be dev_*() as there is a device structure buried
down in there somewhere :)

thanks,

greg k-h

