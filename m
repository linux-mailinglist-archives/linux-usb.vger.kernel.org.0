Return-Path: <linux-usb+bounces-26977-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 206C8B2A191
	for <lists+linux-usb@lfdr.de>; Mon, 18 Aug 2025 14:30:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 82249173002
	for <lists+linux-usb@lfdr.de>; Mon, 18 Aug 2025 12:22:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7567B31B13C;
	Mon, 18 Aug 2025 12:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="LzaF3Nq5"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD60C31B120
	for <linux-usb@vger.kernel.org>; Mon, 18 Aug 2025 12:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755519731; cv=none; b=L7f0Lgtpo4YEJENkckEoDQr8Vf97vE3QAYNTGYF8WaLraDCx2sgJOdszBwigaU6CMIiLPSFceQzLb+TxRA5SlLcsfbX+E4R17m8BXTpEOjzH8Fz4Fiqpsegh6wbXt1slyclPHrFGFE1ihjJv+S6aIkf0wP6kOgpL5w6c8FQiLU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755519731; c=relaxed/simple;
	bh=bTn54UHvRX0wZsgGRAWd7xVa5AiWVUeZLxCBRXpESCM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r8aybVZTesvI4/MXtbdVK5x0btT0E7F7wp1gL4weTgGNSQcqQuaT5GaVo6zc0VhzxmyKNOils4lGqRTpzw3WHpeGN+06eNN4D9/pFbi9Fuvr0/DyV82Z7lWRaNYFUS7bw6czlbKq0BYQf6t3LK1F1Anm5OrEUSLcqEZ4QJE+Mas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=LzaF3Nq5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E36CEC4CEF1;
	Mon, 18 Aug 2025 12:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1755519731;
	bh=bTn54UHvRX0wZsgGRAWd7xVa5AiWVUeZLxCBRXpESCM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LzaF3Nq5NV7CgkERPMy2cE/hDhKhMidxahRwzYKBU4Z19jTFDYgovN3EHtDc7voFA
	 1PGMCoMIg2u92YpnivVk15ai4GaxLdfnbuXzSt6imbcfFCFmYmai603Z5jbSlYdrG+
	 iKq3Ce6+Wuu1ra7sAyOBGvLqohdsLi69Iue1lZes=
Date: Mon, 18 Aug 2025 14:22:08 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Adrian =?utf-8?Q?Barna=C5=9B?= <abarnas@google.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: [PATCH] drivers/usb/mon/mon_bin: Style fixes
Message-ID: <2025081850-onslaught-slimness-9ad6@gregkh>
References: <20250818121745.1160522-1-abarnas@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250818121745.1160522-1-abarnas@google.com>

On Mon, Aug 18, 2025 at 12:17:45PM +0000, Adrian Barnaś wrote:
> Address various coding style issues reported by checkpatch.pl
> in drivers/usb/mon/mon_bin.c to improve adherence to kernel coding style.
> 
> This patch introduces no functional changes.
> 
> Signed-off-by: Adrian Barnaś <abarnas@google.com>
> ---
>  drivers/usb/mon/mon_bin.c | 230 +++++++++++++++++++++-----------------
>  1 file changed, 126 insertions(+), 104 deletions(-)

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- Your patch did many different things all at once, making it difficult
  to review.  All Linux kernel patches need to only do one thing at a
  time.  If you need to do multiple things (such as clean up all coding
  style issues in a file/driver), do it in a sequence of patches, each
  one doing only one thing.  This will make it easier to review the
  patches to ensure that they are correct, and to help alleviate any
  merge issues that larger patches can cause.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot

