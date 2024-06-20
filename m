Return-Path: <linux-usb+bounces-11478-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B6A3910409
	for <lists+linux-usb@lfdr.de>; Thu, 20 Jun 2024 14:29:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C747E1F2188C
	for <lists+linux-usb@lfdr.de>; Thu, 20 Jun 2024 12:29:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72C4D1AD3E3;
	Thu, 20 Jun 2024 12:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="GKODViKD"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C777C1AC776
	for <linux-usb@vger.kernel.org>; Thu, 20 Jun 2024 12:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718886490; cv=none; b=N+wF5DBl/p+SIFh5uKrcKy89dIbUyn1r7/Uo2X7zMUnutTI9qYliUo8XsPzlUsKqxn/uiL6hVgtjs+fVd0tS1KlBTgrayIz/0WaS6qKV2H9dj6/5K6OUvTaQgt1Yuj+QKzsvY2ue8/1vPZVrmy7nXclMdbZM6mA4cIEr4XagwXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718886490; c=relaxed/simple;
	bh=DsL+YOT0gbcm2Wc0xnq9iYMfHWVMIv9HpUgqfp5nrYc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z6o7KpxreIStvewz6uTpAcN/c7lspf+qYmjmuEw3MZ4td4QJBRjSBfNu1Wx86oEc6LnJXrUhcObCvx22Pcxe1qOc/zdLbkbNUYC83S3wy8K5YLFcLmPmZYm4RDtMwy+cPWx9RDK4wXOKA4RNPnbiUpT1CMCag6gLNJWVBWGRx5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=GKODViKD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFB47C2BD10;
	Thu, 20 Jun 2024 12:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1718886490;
	bh=DsL+YOT0gbcm2Wc0xnq9iYMfHWVMIv9HpUgqfp5nrYc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GKODViKDluVLeG73oAxtmCx6LGhfWxjjHMp1uKwHsmc3qndKMn3bl8nSTc3UmNxm/
	 yEE1DGnYfaODstL2GzlBpn2nks9YUMrc72nbLdDa7djcUaDND1mjDtG7i0TK2Dqx5r
	 Ay/2mMPqzqcS8msSOFqlea7bwv7x2Nd1LyFs0MqM=
Date: Thu, 20 Jun 2024 14:28:07 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Oliver Neukum <oneukum@suse.com>
Cc: qiang.zhang@windriver.com, ivan.orlov0322@gmail.com,
	christophe.jaillet@wanadoo.fr, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: printer: fix races against disable
Message-ID: <2024062039-twerp-magnify-2469@gregkh>
References: <20240620114039.5767-1-oneukum@suse.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240620114039.5767-1-oneukum@suse.com>

On Thu, Jun 20, 2024 at 01:40:26PM +0200, Oliver Neukum wrote:
> printer_read() and printer_write() guard against the race
> against disable() by checking the dev->interface flag,
> which in turn is guarded by a spinlock.
> These functions, however, drop the lock on multiple occasions.
> This means that the test has to be redone after reacquiring
> the lock and before doing IO.
> 
> Add the tests.
> 
> This also addresses CVE-2024-25741

What?  Why is MITRE assigning CVEs for the kernel now?  Who asked for
this and who assigned this?  Do I need to go poke someone with a big
stick?

thanks,

greg k-h

