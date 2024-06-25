Return-Path: <linux-usb+bounces-11627-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D7B91686F
	for <lists+linux-usb@lfdr.de>; Tue, 25 Jun 2024 14:57:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6EB29B222C8
	for <lists+linux-usb@lfdr.de>; Tue, 25 Jun 2024 12:57:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58BDF1581E0;
	Tue, 25 Jun 2024 12:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="2aLTWC8n"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D444D15884A
	for <linux-usb@vger.kernel.org>; Tue, 25 Jun 2024 12:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719320243; cv=none; b=CNSSFS48MwSCisSSwf7P6awyAHkesWfJAQ4MFMd5ZlssVp72clyArQGNf0Hk5RFxL93tys9yTAyS4mZKE+yVZw0wvRO95G2mChHZn5y38tkjD3skk6PdUPpAC4l8C0asgvOax+p2woGRcjfKQWVsHj9KMaR9FENLmizv8hbx5GM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719320243; c=relaxed/simple;
	bh=Y6tFxvgq2VTXEdylLs8H7qyrwfqGpW7UsIRdL9nV/ig=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P//04/mbice/WJd/FR1uKmCWUdijaXbWa8kF+JkeoP3xSMdMz66oWiAMxdFyWzgenA1KnOV90UMchiQORGSmQWI1o0VbLjV9bDry401uSx7pN5dXsAVYobPS+ddnmnB+s7+nK4RsSr5oWy7YVaimdbgSOQ69j7bmCgICm3g9ze4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=2aLTWC8n; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04CEAC32781;
	Tue, 25 Jun 2024 12:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1719320243;
	bh=Y6tFxvgq2VTXEdylLs8H7qyrwfqGpW7UsIRdL9nV/ig=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=2aLTWC8nYzda+3p1CnUheoPop6IPFsDgYeF8u/8zRiwJnAtz5eI/vBgw5RVL3aOIp
	 uiVPqoql8ir8XQGhKG7OrwphdjbJpt+kFDjsJqgtvUDUEg8hQJJeJ2+ffcTb23wj0W
	 TzuIHctIhmxSdx6HBpqGHhmNcce5kQnKzPVMxLxQ=
Date: Tue, 25 Jun 2024 14:57:20 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] USB4/Thunderbolt changes for v6.11 merge window
Message-ID: <2024062507-hardship-sponsor-f08f@gregkh>
References: <20240625095832.GT1532424@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240625095832.GT1532424@black.fi.intel.com>

On Tue, Jun 25, 2024 at 12:58:32PM +0300, Mika Westerberg wrote:
> Hi Greg,
> 
> I'm sending this early because my vacation starts after this week. I
> hope it is fine for you. Thanks!
> 
> The following changes since commit 6ba59ff4227927d3a8530fc2973b80e94b54d58f:
> 
>   Linux 6.10-rc4 (2024-06-16 13:40:16 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v6.11-rc1

Pulled and pushed out thanks.

Have a nice vacation!

greg k-h

