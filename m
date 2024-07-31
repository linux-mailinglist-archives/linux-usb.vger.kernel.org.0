Return-Path: <linux-usb+bounces-12680-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0515894290B
	for <lists+linux-usb@lfdr.de>; Wed, 31 Jul 2024 10:20:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A26771F20F67
	for <lists+linux-usb@lfdr.de>; Wed, 31 Jul 2024 08:20:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E9DE1A7F85;
	Wed, 31 Jul 2024 08:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="AYAdf0Gt"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E21101A76B3;
	Wed, 31 Jul 2024 08:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722414041; cv=none; b=BBebYcsyZHFRyq116qw1hgTb1vIHOmQMwmv2T+kMT6SP9PNcKv53/jwFqHaVSFGABZAv5fSE13tfsEI/JeFxHQfP207qdX3jRWFdNIPoXJ0Vc31GiDbmfjl/hO9fZiK38VLXipgw1OHqs7wQaxVgtEtU9+UNLBWndL0V0lbIIL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722414041; c=relaxed/simple;
	bh=om43aKASU793K0N4gd1w31XPTjATtLQ+XdXzAviVw4g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UvQvb41nCvnujbRhT8eHWosUFTkbLIZs9P5q7W3I5rYMHIhKwggstlnp6W6UZXH5eSIxAM/8TnIJAZ+VCJafqufnrSKY0Hfh7zz3WfDRzvl2KEygxPF5uRCT2T2BRPSZGRE6uSM/Fo6MjvRIIwGfyS2chRguzqkaZ+Ey7Ha/Bhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=AYAdf0Gt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9F6AC116B1;
	Wed, 31 Jul 2024 08:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1722414040;
	bh=om43aKASU793K0N4gd1w31XPTjATtLQ+XdXzAviVw4g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AYAdf0GtaEDcmj73MNbltRiU3NGm2GhJYyBIgimyfmzOYfeBtrzrNyB7NntCBfJo9
	 HFReU8ZZwvE/muKa9fkVRvV852lSyqwBs3mimpMguKToIK/7SPi84+OFI6WXuC2WR6
	 rO0E8r33UMBRGqgG34TdG/LR9umC3Mc2MxUEcaUo=
Date: Wed, 31 Jul 2024 10:20:37 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Peter Chen <peter.chen@kernel.org>, Pawel Laszczak <pawell@cadence.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Roger Quadros <rogerq@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>,
	linux-usb@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com
Subject: Re: [PATCH v2] usb: cdns3: imx: simplify system pm using
 _force_suspend/_resume
Message-ID: <2024073113-overstep-credit-57fc@gregkh>
References: <20240726150731.297443-1-shenwei.wang@nxp.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240726150731.297443-1-shenwei.wang@nxp.com>

On Fri, Jul 26, 2024 at 10:07:31AM -0500, Shenwei Wang wrote:
> By utilizing _force_suspend and _force_resume, ensures a more consistent
> and simple approach to handling system sleep states. It also aligns the
> driver's PM behavior with the other drivers' common practices.
> 
> Fixes: db3c4e366287 ("usb: cdns3: imx: Rework system PM to avoid duplicated operations")

This is not really a "fix" but rather a cleanup, right?  Please don't
add Fix tags that are not actually fixing things.

thanks,

greg k-h

