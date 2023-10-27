Return-Path: <linux-usb+bounces-2248-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BE3227D8F8F
	for <lists+linux-usb@lfdr.de>; Fri, 27 Oct 2023 09:20:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EF2641C20E3B
	for <lists+linux-usb@lfdr.de>; Fri, 27 Oct 2023 07:20:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E2FAB66D;
	Fri, 27 Oct 2023 07:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="nOPH7MxC"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 823BC28E6
	for <linux-usb@vger.kernel.org>; Fri, 27 Oct 2023 07:19:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7146FC433C7;
	Fri, 27 Oct 2023 07:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1698391197;
	bh=eAzGncuNN+h/nEmL0ZN/dcXM9fGW6dn1TaiHf0175Cw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nOPH7MxC1fgBZD4Sr2OY9INWba7SOjh03byjzEY0Hg3jA6SPPpqqHDuT4zAnESK0o
	 STR/y3RVFPBeVW+1Gu7xEUbXIGNhlWS/0jsqyKjR2j2QvR9z999NEiYDcuEdQFSlcv
	 gURLO0OKq7yCHZDh3THAX4hJIsBmzZD3aqYa+BI0=
Date: Fri, 27 Oct 2023 09:19:54 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jayant Chowdhary <jchowdhary@google.com>
Cc: mgr@pengutronix.de, Thinh.Nguyen@synopsys.com, arakesh@google.com,
	etalvala@google.com, dan.scally@ideasonboard.com,
	laurent.pinchart@ideasonboard.com, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Michael Grzeschik <m.grzeschik@pengutronix.de>
Subject: Re: [PATCH v2] usb:gadget:uvc Do not use worker thread to pump usb
 requests
Message-ID: <2023102739-reproach-salute-0d22@gregkh>
References: <ZToOJhyOFeGCGUFj@pengutronix.de>
 <20231026215635.2478767-1-jchowdhary@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231026215635.2478767-1-jchowdhary@google.com>

On Thu, Oct 26, 2023 at 09:56:35PM +0000, Jayant Chowdhary wrote:
> This patch is based on top of
> https://lore.kernel.org/linux-usb/20230930184821.310143-1-arakesh@google.com/T/#t:

That doesn't work in the changelog of a patch at all, it goes below the
--- line p lease.

> 
> When we use an async work queue to perform the function of pumping
> usb requests to the usb controller, it is possible that thread scheduling
> affects at what cadence we're able to pump requests. This could mean usb
> requests miss their uframes - resulting in video stream flickers on the host
> device.
> 
> In this patch, we move the pumping of usb requests to
> 1) uvcg_video_complete() complete handler for both isoc + bulk
>    endpoints. We still send 0 length requests when there is no uvc buffer
>    available to encode.
> 2) uvc_v4l2_qbuf - only for bulk endpoints since it is not legal to send
>    0 length requests.
> 
> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
> Signed-off-by: Jayant Chowdhary <jchowdhary@google.com>
> Suggested-by: Jayant Chowdhary <jchowdhary@google.com>
> Suggested-by: Avichal Rakesh <arakesh@google.com>
> Tested-by: Jayant Chowdhary <jchowdhary@google.com>
> ---
>  v1->v2: Fix code style and add self Signed-off-by

Great, but as signed-off-by kind of implies you tested it, no need for
the tested-by now, right?  Not a big deal, and normally I'd ignore it
but I know you at least have to do one more version of this based on the
above problem...

thanks,

greg k-h

