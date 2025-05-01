Return-Path: <linux-usb+bounces-23608-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0040AAA60D2
	for <lists+linux-usb@lfdr.de>; Thu,  1 May 2025 17:38:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6A4924C39B8
	for <lists+linux-usb@lfdr.de>; Thu,  1 May 2025 15:38:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B4011FDA6D;
	Thu,  1 May 2025 15:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="LQFf8QFk"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B62718C011;
	Thu,  1 May 2025 15:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746113898; cv=none; b=EDDepPEKJ6LwbJ7WVu9h3oqHYKPgi+HhZW87rgXVNOrd2lTrHqWpmPr5wuDzT0UVDypKx6NOy8KAuSeVe5B7YJor34/4BXun4Q81wOFmMVxwEXgGf/GoUHCvw7QgA+O5OGnW/f5mlp9uIvUhPnkdqVoBikofH1dRs/I1xfQO5zU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746113898; c=relaxed/simple;
	bh=XFFOTdP/3i3niIEuMBBcyJrNjW1QjuABGAb6m1NknNs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=srGkDkbddQZbhPf7rVl42QH7xevRPdAPCAmUsjSgSB7DHOa8pslsmTQ1xhHCwfYRYJhsNERTmqmXet7n1k3HwPdIuQesYyE+HooDeIu2ilsTJMZnCIDF4ukcmgDicpsmYb1gkXZwQHTgqYBuYjFKQbd8ivFrD2pWDvuq0DZO8mQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=LQFf8QFk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F01E2C4CEE3;
	Thu,  1 May 2025 15:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1746113897;
	bh=XFFOTdP/3i3niIEuMBBcyJrNjW1QjuABGAb6m1NknNs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LQFf8QFkg9xartG2fb/Sf2lau8ALekMhViwng4WjSIJTupiajzvvSwtZgcOsf2DvD
	 rhglop+yqL0FI6xBMktUYIVWiBLuSUnXtWsAqeszyAPDi7HaqGCghkFjK7X9ZCgukN
	 cpNzYesEMP78VqIWrU7yz4T3EwhBHE0vYXawsOLI=
Date: Thu, 1 May 2025 17:38:14 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Peter Chen <peter.chen@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, kernel@pengutronix.de,
	Fabio Estevam <festevam@gmail.com>,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>,
	linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
	imx@lists.linux.dev, stable@kernel.org
Subject: Re: [PATCH] usb: chipidea: ci_hdrc_imx: Fix NPD of usbmisc_data
Message-ID: <2025050100-getting-curler-88aa@gregkh>
References: <20250422185601.80199-1-wahrenst@gmx.net>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250422185601.80199-1-wahrenst@gmx.net>

On Tue, Apr 22, 2025 at 08:56:01PM +0200, Stefan Wahren wrote:
> The commit 74adad500346 ("usb: chipidea: ci_hdrc_imx: decrement device's
> refcount in .remove() and in the error path of .probe()") introduced
> a NULL pointer dereference on platforms which have no usbmisc_data
> (e.g. i.MX28). So add the missing checks in .probe() and .remove().
> 
> Fixes: 74adad500346 ("usb: chipidea: ci_hdrc_imx: decrement device's refcount in .remove() and in the error path of .probe()")
> Cc: <stable@kernel.org>
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> ---
>  drivers/usb/chipidea/ci_hdrc_imx.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Does not apply to 6.15-rc4 at all, can you rebase and resubmit?

thanks,

greg k-h

