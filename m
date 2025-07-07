Return-Path: <linux-usb+bounces-25521-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D4EABAFAEEC
	for <lists+linux-usb@lfdr.de>; Mon,  7 Jul 2025 10:50:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2DBDF3AB1AA
	for <lists+linux-usb@lfdr.de>; Mon,  7 Jul 2025 08:49:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8422128AAEE;
	Mon,  7 Jul 2025 08:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="2BUnh1cX"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B3831C5D7D
	for <linux-usb@vger.kernel.org>; Mon,  7 Jul 2025 08:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751878221; cv=none; b=OOhFLy12hq01kqdrgfEi57eT5+HKCEDQr0fx8ltpjmSymMQKEDCdt6hOUiSi9+hxSmN4kpdNGKBvfIt5aqdNuCVRNz/R6S2493z/52LhXtuaTJkD4DYZOjToni6b5Zs3ldY9e8HfkbxDtSCWqd2F2HqtULOxlIFL2FtT02IHxEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751878221; c=relaxed/simple;
	bh=PRx9MdM2YUrF7Ekev6PLUI+SDBK3VgrnsG0K+biPTMA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y8jqHcOQedykZnWaPWZ1egJOzWquAU24l6h/zVbZtxUwduSL/CaPad4WYpf7vNyF2fQ3yZ+1WhijgVNNROrkbqAAoqziuw9nURjW+svMzH4yHifYLbhao4GaItujP+HEC2pKH3ndYStP/ql/HNxyXX/049dU9UWik1rWnl+Zw4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=2BUnh1cX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47C12C4CEE3;
	Mon,  7 Jul 2025 08:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1751878220;
	bh=PRx9MdM2YUrF7Ekev6PLUI+SDBK3VgrnsG0K+biPTMA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=2BUnh1cX8OtW9Sv35bqLq5Pji3UTFs7/Zk4s/8NwToCpIdYSFsEFl6pbzfzWFYq5Z
	 wwSP/K2o7aBYE/EA5F7hMQKjN7a41G3egu3IJGaejjjAEv0sLnRp2FS9RDtklMoUaW
	 Ko4qpJWhQYmxhbJzAbplHzUYFSrOTpUJNGfVoPdM=
Date: Mon, 7 Jul 2025 10:50:18 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] USB4/Thunderbolt fixes for v6.16-rc4
Message-ID: <2025070706-catnip-flask-8556@gregkh>
References: <20250626154009.GK2824380@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250626154009.GK2824380@black.fi.intel.com>

On Thu, Jun 26, 2025 at 06:40:09PM +0300, Mika Westerberg wrote:
> Hi Greg,
> 
> The following changes since commit 86731a2a651e58953fc949573895f2fa6d456841:
> 
>   Linux 6.16-rc3 (2025-06-22 13:30:08 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v6.16-rc4
> 

Sorry for the delay, now pulled and pushed out.

greg k-h

