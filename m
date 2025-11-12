Return-Path: <linux-usb+bounces-30448-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD5CC51F10
	for <lists+linux-usb@lfdr.de>; Wed, 12 Nov 2025 12:24:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B8E9F3AF105
	for <lists+linux-usb@lfdr.de>; Wed, 12 Nov 2025 11:17:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E96F42ED846;
	Wed, 12 Nov 2025 11:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="xBD7d4ud"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63E6124BBE4;
	Wed, 12 Nov 2025 11:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762946252; cv=none; b=cjtXv80wu2hm5wcevhQ2vhYqyX3gTCZoDzWFed5gfrQSN7WESYYxiw9+CadEqoShgjNCABWWrpG9gJWT5/UG279Z1YRYyJPSI3IY9SMRSQScZrzGJHLsV2nhayDXXRfWorrsyeqV5qlDqSpHeJ5Tk0E5AdxEzb4/8RGKyLtpmg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762946252; c=relaxed/simple;
	bh=C3Pikbs4TXWmhNUQZgZZdYh7M6rtBYk1Xt8bX4v9r0A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PD7Gxx2m9BFUdoe9fWPQewGhh6KJqTmq9GCmsBPeibhObHnwwlGvYR2htqXW3i2RFfx7JzmBItnufrwIjGzEAj/rK1zWKMAGgMbNJKB0F04zxIEj1QGLmOvgr8EJjGUmkTL54E5eSaGOO+wtBI14fUtxMvyCwALPijDQsaXJdyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=xBD7d4ud; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2F8DC19422;
	Wed, 12 Nov 2025 11:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1762946251;
	bh=C3Pikbs4TXWmhNUQZgZZdYh7M6rtBYk1Xt8bX4v9r0A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=xBD7d4uds7L6cNx8nGIiMjmWYAPiP018l6niiA0Lnm4qwi8JVMr1+jj1umErLnzdf
	 q1L5YGRrrp6UN0L5+/lpOMFtjOso4yhDaSfyID/nUnGGMi2awq7vUARAUh0Cq2m3yu
	 zrWSXeK/Dp2G03IvPKfwrPLq0XxHWHL12VeT094w=
Date: Wed, 12 Nov 2025 06:17:30 -0500
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Johan Hovold <johan@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] USB serial device ids for 6.18-rc6
Message-ID: <2025111221-profusely-footwear-daba@gregkh>
References: <aRRFEgF2SJGb9uhe@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aRRFEgF2SJGb9uhe@hovoldconsulting.com>

On Wed, Nov 12, 2025 at 09:28:02AM +0100, Johan Hovold wrote:
> The following changes since commit dcb6fa37fd7bc9c3d2b066329b0d27dedf8becaa:
> 
>   Linux 6.18-rc3 (2025-10-26 15:59:49 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git tags/usb-serial-6.18-rc6

Pulled and pushed out, thanks,

greg k-h

