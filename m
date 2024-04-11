Return-Path: <linux-usb+bounces-9283-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BADB38A1C69
	for <lists+linux-usb@lfdr.de>; Thu, 11 Apr 2024 19:47:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 702861F21B2A
	for <lists+linux-usb@lfdr.de>; Thu, 11 Apr 2024 17:47:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7D89194C91;
	Thu, 11 Apr 2024 16:21:49 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 0437986AF4
	for <linux-usb@vger.kernel.org>; Thu, 11 Apr 2024 16:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.131.102.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712852509; cv=none; b=Bc2pWVze9CSDjVFN+QhSMDGBR2Vcxo0aVBE4AFGCFs5eagmtnArvBW7yDnFMIQHXdMEPkfgqs/SFAas+T3uqWEwuzEa/4xcW7k26o9kUhssqZ88sbRTFDX7bYqix5Xvr5N2W5rw6R93+aqH2rMvkpoGRVu42EqEJHmoVeH3Q/jA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712852509; c=relaxed/simple;
	bh=13WH2aRPo8G+h3BgCbNdiHKwqnWQ5f164iakCB2HehE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rX6EV47QqmLYBWXbWYfwmNLoXZGtwUrSUjd/zayMcTbZC+4fB+yJAXAfLpIZc8/I2NDqc+MqxH3OiXsJNN+awcbWLM0moLnDEQ019aUbdhCsApuu5E8jbsMry8/Q5dPY6QDT7Cjps4bl9qf6Rr05dT1pAjS3V8M3TN4E7NoLpqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=netrider.rowland.org; arc=none smtp.client-ip=192.131.102.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netrider.rowland.org
Received: (qmail 250539 invoked by uid 1000); 11 Apr 2024 12:21:46 -0400
Date: Thu, 11 Apr 2024 12:21:46 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Marcello Sylvester Bauer <sylv@sylv.io>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
  Marcello Sylvester Bauer <marcello.bauer@9elements.com>,
  Matthias Stoeckl <matthias.stoeckl@secunet.com>,
  Uwe Kleine-Koenig <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v1 2/2] usb: gadget: dummy_hcd: Set transfer interval to
 1 microframe
Message-ID: <0b9e353b-2560-4884-b826-6ff26b933888@rowland.harvard.edu>
References: <cover.1712843963.git.sylv@sylv.io>
 <6295dbb84ca76884551df9eb157cce569377a22c.1712843963.git.sylv@sylv.io>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6295dbb84ca76884551df9eb157cce569377a22c.1712843963.git.sylv@sylv.io>

On Thu, Apr 11, 2024 at 05:22:11PM +0200, Marcello Sylvester Bauer wrote:
> Currently, the transfer polling interval is set to 1ms, which is the
> frame rate of full-speed and low-speed USB. The USB 2.0 specification
> introduces microframes (125 microseconds) to improve the timing
> precision of data transfers.
> 
> Reducing the transfer interval to 1 microframe increases data throughput
> for high-speed and super-speed USB communication
> 
> Signed-off-by: Marcello Sylvester Bauer <marcello.bauer@9elements.com>
> Signed-off-by: Marcello Sylvester Bauer <sylv@sylv.io>
> ---
>  drivers/usb/gadget/udc/dummy_hcd.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/gadget/udc/dummy_hcd.c b/drivers/usb/gadget/udc/dummy_hcd.c
> index dab559d8ee8c..f37b0d8386c1 100644
> --- a/drivers/usb/gadget/udc/dummy_hcd.c
> +++ b/drivers/usb/gadget/udc/dummy_hcd.c
> @@ -50,6 +50,8 @@
>  #define POWER_BUDGET	500	/* in mA; use 8 for low-power port testing */
>  #define POWER_BUDGET_3	900	/* in mA */
>  
> +#define DUMMY_TIMER_INT_NSECS	125000 /* 1 microframe */

If the is_super_speed and is_high_speed module parameters are both false 
then the timer should run at 1-ms intervals.  So this needs to be 
something that can be adjusted at runtime, not a constant.

Alan Stern

