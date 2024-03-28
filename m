Return-Path: <linux-usb+bounces-8575-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7897890A99
	for <lists+linux-usb@lfdr.de>; Thu, 28 Mar 2024 21:06:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4B54EB216F2
	for <lists+linux-usb@lfdr.de>; Thu, 28 Mar 2024 20:06:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8B75138481;
	Thu, 28 Mar 2024 20:05:57 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 03D157460
	for <linux-usb@vger.kernel.org>; Thu, 28 Mar 2024 20:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.131.102.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711656357; cv=none; b=JjiK2yUZN1qiRf+7Qtx4hoUMlfAH+nwlLk6dPJ58eQTKMwBlb+30amVTzhES3r8qe5bZsN5g7cfEdOd8xpn2YiUUIzX6WLPYzzrbJd1PIWKURxc+UkJC8tuFDJc+imz1BTnLBBQJ1ttVEBedjh0lnIaXydkanRbyxGo/lqYQmRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711656357; c=relaxed/simple;
	bh=NEvX9pFq1k2urOEVK9lj7KFRP0HXKNaKnXe5KjjiMmk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rWAN3YJpreZgAIPYQquRRtbJzLSfJS9dkOtw/1S9gZWFslXYdlnBfQYkdBRjv9y1McGscG/z/45g+lmys+xGeDrRLq6dij9lukLSa+A/7S7LqlfO4C2BMb8euZbxPfdkmF5S9X2Xch1p2UlmupUVwk5oOPNfN42cKiGz+p1XdMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=netrider.rowland.org; arc=none smtp.client-ip=192.131.102.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netrider.rowland.org
Received: (qmail 971481 invoked by uid 1000); 28 Mar 2024 16:05:48 -0400
Date: Thu, 28 Mar 2024 16:05:48 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Bitterblue Smith <rtl8821cerfe2@gmail.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: Device with two interfaces - what is the probing order?
Message-ID: <8bc3a7ae-bf8a-486e-946b-ff75ef2ac727@rowland.harvard.edu>
References: <f4df8e45-5dc5-4d81-a414-e19a83b71403@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f4df8e45-5dc5-4d81-a414-e19a83b71403@gmail.com>

On Thu, Mar 28, 2024 at 09:08:43PM +0200, Bitterblue Smith wrote:
> Hi all,
> 
> Given a USB Wifi device with two "identical" interfaces,
> in what order are the interfaces probed? Is the order guaranteed?

They are probed in the order that they are listed in the 
Get-Config-Descriptor output.  But this is not guaranteed.

Alan Stern

