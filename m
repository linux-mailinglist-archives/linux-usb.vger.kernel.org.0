Return-Path: <linux-usb+bounces-12494-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 192D293DD69
	for <lists+linux-usb@lfdr.de>; Sat, 27 Jul 2024 07:22:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 38C59B21BC0
	for <lists+linux-usb@lfdr.de>; Sat, 27 Jul 2024 05:22:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBF7A1864C;
	Sat, 27 Jul 2024 05:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="SMckoCKn"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 444CF27456;
	Sat, 27 Jul 2024 05:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722057753; cv=none; b=peblsnSRKai4hwJoZ75hF3aDIIo1oq3HQF3b/iw5W8gEdm4+5wWQuClUkVUnwUiAXVzazAzJoCc1GDdt3UkG3FX8i1K1EqHtjHb+BnZgB+6sjgVYjzzxEqhRFFHQfsMT493OPod6SrYeyjyP4SQH8FkJ7eZjwGHDrEQlVAr5m6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722057753; c=relaxed/simple;
	bh=xfmPjovjBZYxb8DvcFlLYvxe6heCIypeNSTl0cbSwrA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hVH0YkDS6PBQe/SstxI7QsKbO8INACdC3/J9Ml2OV1n1dRoB+FfI5d6zS4VDJBkgf7gnUcsgVbzbBIDK0TcahVlQcgO9fja1l4aEElKMlURTNqIsX/e5WAOA4MZwRAptvcSnqYyuqfNngGNxU1zOBUX/dVnHrOLWek2bN4rsLPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=SMckoCKn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06372C32781;
	Sat, 27 Jul 2024 05:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1722057752;
	bh=xfmPjovjBZYxb8DvcFlLYvxe6heCIypeNSTl0cbSwrA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SMckoCKnoft6xVCwglZ/nkpqahk1hA471IQIR4kxwf04c+WHGnzyuAPkXb0bP4pmv
	 2Hiz5JyFXjQ0usV1wK4+1QPBhsEU0faqO5uQXtsvzFgunmjA50d8TOljVl7gKlT3LD
	 Mf0D3ecgv2ukBG16aAlqEJq48BgCaFhc1b0hFUXk=
Date: Sat, 27 Jul 2024 07:22:28 +0200
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
Message-ID: <2024072718-revert-kangaroo-37c7@gregkh>
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
> Reviewed-by: Frank Li <frank.li@nxp.com>
> Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
> ---
> Changes in V2:
> - revert the unneeded change of removing an extra blank line.
> 
>  drivers/usb/cdns3/cdns3-imx.c | 17 +++++++----------
>  1 file changed, 7 insertions(+), 10 deletions(-)
> 

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

- You have marked a patch with a "Fixes:" tag for a commit that is in an
  older released kernel, yet you do not have a cc: stable line in the
  signed-off-by area at all, which means that the patch will not be
  applied to any older kernel releases.  To properly fix this, please
  follow the documented rules in the
  Documentation/process/stable-kernel-rules.rst file for how to resolve
  this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot

