Return-Path: <linux-usb+bounces-18691-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B029F8CD6
	for <lists+linux-usb@lfdr.de>; Fri, 20 Dec 2024 07:40:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B4763163736
	for <lists+linux-usb@lfdr.de>; Fri, 20 Dec 2024 06:40:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2600919F41C;
	Fri, 20 Dec 2024 06:40:12 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D80AA1531C8
	for <linux-usb@vger.kernel.org>; Fri, 20 Dec 2024 06:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734676811; cv=none; b=ar/PeMWFmJ5yDRp1S98rgewKa0z1jIe9VtbrvDZPnBhIRsVp3j7WRjgfMQ0E8viqqbH8EkL5zMnpsQSiu8vcF+B7OPgUp/0apCgFg1A6zqeV+C1Yh6fO6dy9yALIrOT1SvrwFD7GN/ubsnfaPXo1EM/O8iDwDlpDS4s7LEtvRTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734676811; c=relaxed/simple;
	bh=Yaor65BoHUv1BGGEarVEny6rgLkY+x9atQUhbYY8Bds=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JXrsv9F1HssAp188l4Jj4821ce9vnB8btd+lQXlTYxKGARsZ9IScYxQnkyAselYZFIPMinQzp6RqY+m21OnO8PKiPJJtaRiW/8Vx8WosszuDIyjv8jvmcgHlkKfCthLHwmhM1OdkFxRWeyLh+TbuxLVDMwqwbfWjxYo0MmWOB3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tOWg7-00044k-Lf; Fri, 20 Dec 2024 07:40:03 +0100
Message-ID: <9e9248c1-d9d2-4b25-a272-53e52420d301@pengutronix.de>
Date: Fri, 20 Dec 2024 07:39:59 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: dwc3: gadget: remove not used field dwc3_request.sg
To: Renjun Wang <renjunw0@foxmail.com>, Thinh.Nguyen@synopsys.com
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <tencent_0BEB55520D6C9419EC1AC6647AF19BF34E06@qq.com>
Content-Language: en-US
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <tencent_0BEB55520D6C9419EC1AC6647AF19BF34E06@qq.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org

On 19.12.24 16:12, Renjun Wang wrote:
> Based on commit 61440628a4ff ("usb: dwc3: gadget: Cleanup SG handling"),
> the field dwc3_request.sg is no longer needed and not used in any
> other files, remove it.
> 
> Signed-off-by: Renjun Wang <renjunw0@foxmail.com>

Reviewed-by: Ahmad Fatoum <a.fatoum@pengutronix.de>

> ---
>  drivers/usb/dwc3/core.h | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
> index ee73789326bc..3be069c4520e 100644
> --- a/drivers/usb/dwc3/core.h
> +++ b/drivers/usb/dwc3/core.h
> @@ -956,7 +956,6 @@ struct dwc3_request {
>  	struct usb_request	request;
>  	struct list_head	list;
>  	struct dwc3_ep		*dep;
> -	struct scatterlist	*sg;
>  	struct scatterlist	*start_sg;
>  
>  	unsigned int		num_pending_sgs;


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

