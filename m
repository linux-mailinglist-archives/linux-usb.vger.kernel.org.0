Return-Path: <linux-usb+bounces-11030-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB613900C44
	for <lists+linux-usb@lfdr.de>; Fri,  7 Jun 2024 21:09:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CA6E91C21A71
	for <lists+linux-usb@lfdr.de>; Fri,  7 Jun 2024 19:09:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C445143876;
	Fri,  7 Jun 2024 19:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="U1IArb9c"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98971D2E5
	for <linux-usb@vger.kernel.org>; Fri,  7 Jun 2024 19:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717787336; cv=none; b=czi2yqMbDucbfLE75Tj05MBXC/pm35VZiI78kiNTh9HuXDKLCr8chdwRx2ZTbhIB5Iv78jJsGmOUl9xfnrzKtri12gx7EtH97rIboZpbeRbc1wyb3D31ERX3qLfkh57FKdY/Zbgln505Lf5lX6Qyj2QZneqnG7jjWkeYVtAuv3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717787336; c=relaxed/simple;
	bh=8/eVsCU3Qi/TY7cSw/o82VsjeQE2GXCJqsWRqDG5Nmw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IrXUOoVw9paPPytp3GO7I9vcnPIeuvZwgd5jZNpSJT040QTVFIfVgRIcOkCzb9w3rHvy5+j5gfG34IjUXxfy8vkvWrH+MvpJFsvSRN8O3YMFHvf1/MKRerxt5R5h1tvC8adjxu/BOzYnoR2xm3FEplWkcyI959nXuyRHv8FAiAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=U1IArb9c; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AD90C2BBFC;
	Fri,  7 Jun 2024 19:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1717787336;
	bh=8/eVsCU3Qi/TY7cSw/o82VsjeQE2GXCJqsWRqDG5Nmw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U1IArb9cRyPs+6RQLxYUR1qAu0W85gdnFWJocN3JkLadsZDeMBj8tmE9uDmhWRrJN
	 m9P9AMneDi6bHu2qkUHq0dhE1nuB9KR5PSCoGz/irdVgsasYblOQnMreWmM0HUsiqd
	 /wS4iiAh7bz+VUfy9sgXR4bNkVb0OPxvtu0UJmfc=
Date: Fri, 7 Jun 2024 21:08:54 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] USB4/Thunderbolt fix for v6.10-rc3
Message-ID: <2024060741-void-nursing-6931@gregkh>
References: <20240605055229.GH1421138@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240605055229.GH1421138@black.fi.intel.com>

On Wed, Jun 05, 2024 at 08:52:29AM +0300, Mika Westerberg wrote:
> Hi Greg,
> 
> The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:
> 
>   Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v6.10-rc3
> 

Pulled and pushed out, thanks!

greg k-h

