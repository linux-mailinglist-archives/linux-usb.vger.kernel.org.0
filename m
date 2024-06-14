Return-Path: <linux-usb+bounces-11334-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 38837908B86
	for <lists+linux-usb@lfdr.de>; Fri, 14 Jun 2024 14:20:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 388EE1C2252F
	for <lists+linux-usb@lfdr.de>; Fri, 14 Jun 2024 12:20:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB64919645D;
	Fri, 14 Jun 2024 12:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="NxejRGnh"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 654F0195F03
	for <linux-usb@vger.kernel.org>; Fri, 14 Jun 2024 12:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718367602; cv=none; b=NEaPRp/hXCIYjk3U4m5Vv/cFdiWSE6w4T9n0qo8nKS5bCWfquUnFm4CZl/P7PzTEHJnWaSLkCXs93sBYL9nTLfssBpsQg004LX+36eKAQSreIh4z7DGHwXnT0/vksyj5Wj9rLgSTzYZON1l/C/MMafKaUQQ4MobyINYXSnazTeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718367602; c=relaxed/simple;
	bh=rcblBbCdGpe990TbwKyeMXohm3XAf40sIHXzz3ZMpDA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DLnXagLBrTnnZe7I/jCWG5+olQs3Duc+CkZrSQZ+55JwbiWbe60Jut/0Lz4HCEPcZdRn8LLz1VHSF+vXsXhEPjT4XHiYM5c7ZCH3wGO8NyeRKf51K4EaKkN9k/KxIIJz8wwvSqrRqjoClm3uGd2LLiqiKSGeslk5nPl0tjurVOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=NxejRGnh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEE41C2BD10;
	Fri, 14 Jun 2024 12:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1718367602;
	bh=rcblBbCdGpe990TbwKyeMXohm3XAf40sIHXzz3ZMpDA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NxejRGnhm4B5UoFuNuUM/N3n3ovKOKDKUWukVhhacyvZAsxAVcBGheFsNshh7rPVo
	 qSumhqLvKlHBIP0cab4QPhyQ59U9Zx/LJ76askFM3xHw91Nu2aeMPRv3LCpPh/I5hW
	 Z5UDudRDh4dzs3vLxjwxHji++TS3XSKgCRNux0dw=
Date: Fri, 14 Jun 2024 14:19:58 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 0/6] thunderbolt: Sideband access and retimer lane
 margining support
Message-ID: <2024061449-wilt-goliath-8248@gregkh>
References: <20240614121512.1361184-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240614121512.1361184-1-mika.westerberg@linux.intel.com>

On Fri, Jun 14, 2024 at 03:15:06PM +0300, Mika Westerberg wrote:
> Hi all,
> 
> This series adds USB4 link sideband access through debugfs. This can be
> used to run port operations etc. from userspace usable for example in
> manufacturing. The other feature is receiver lane margining support for
> retimers with similar use case.
> 
> Mika Westerberg (6):
>   thunderbolt: Move usb4_port_margining_caps() declaration into correct place
>   thunderbolt: Make usb4_port_sb_read/write() available outside of usb4.c
>   thunderbolt: Add sideband register access to debugfs
>   thunderbolt: Split out margining from USB4 port
>   thunderbolt: Make margining functions accept target and retimer index
>   thunderbolt: Add receiver lane margining support for retimers
> 
>  drivers/thunderbolt/Kconfig   |  11 +-
>  drivers/thunderbolt/debugfs.c | 623 ++++++++++++++++++++++++++--------
>  drivers/thunderbolt/retimer.c |  53 +--
>  drivers/thunderbolt/sb_regs.h |   9 +
>  drivers/thunderbolt/tb.h      |  45 ++-
>  drivers/thunderbolt/usb4.c    | 183 +++++-----
>  6 files changed, 655 insertions(+), 269 deletions(-)

No hint as to what changed from v1?

thanks,

greg k-h

