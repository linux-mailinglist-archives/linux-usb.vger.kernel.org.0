Return-Path: <linux-usb+bounces-16810-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 844FC9B4114
	for <lists+linux-usb@lfdr.de>; Tue, 29 Oct 2024 04:36:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B58831C21900
	for <lists+linux-usb@lfdr.de>; Tue, 29 Oct 2024 03:36:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C2031FB3C7;
	Tue, 29 Oct 2024 03:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="QXK+pODi"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E584A16F84F
	for <linux-usb@vger.kernel.org>; Tue, 29 Oct 2024 03:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730173014; cv=none; b=hGlgD5MlayyNnhRg6v3VVoUi3mnbf0TtX0qpuH26q/kOtAxrILAgURAKUTD4ikB+j9AefrC9PzHLN9Fkv98NSxhvmdRH+dU+4wrZsFew6wz701zSfmMYldYRgwq/+oE98HPSgD16Ws/qxcZ/TAxrxa8v280FFnrygn9XD7hDZbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730173014; c=relaxed/simple;
	bh=yK51zFimLwsJhhtjNbuQjyRV5dRn0PvbfI0ErUIyxQQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HrzcyglPXfDGjDX5su6jy4joYoTnxMGmmqaw2FZzLnI+kdkLykC2umbfa88TmfiEV0olRrrNPj+yxqv/Rb5wzqoi19Uvf5y9WvyRZNkadHWEQdOTLAf9+t5lAJ4kGxANgPT9nghUMGANSPxueV05P+0/MgdB2CsCUb1iHWAWdHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=QXK+pODi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43E48C4CECD;
	Tue, 29 Oct 2024 03:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1730173013;
	bh=yK51zFimLwsJhhtjNbuQjyRV5dRn0PvbfI0ErUIyxQQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QXK+pODiXk2/m+dt8UFQ7+ucDMY1VjNmBXgITpI+orcjqehjJA7fBba/yHRsrq7aP
	 QlS7hma7wGTcVqShMLAPY4S+UwdVXYi0SKSR8bXh5Nt20p5oh1TGNDtsxBjP2j1mw4
	 JOW/XBfbSWWSKXjjW5iEdxFUV0ivud9m2J9ZKx2E=
Date: Tue, 29 Oct 2024 04:36:40 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Yi Yang <yiyang13@huawei.com>
Cc: kees@kernel.org, justinstitt@google.com, u.kleine-koenig@baylibre.com,
	yuxu@marvell.com, balbi@ti.com, linux-usb@vger.kernel.org,
	wangweiyang2@huawei.com
Subject: Re: [PATCH] usb: gadget: udc: fix possible null-ptr-deref in
 mv_u3d_req_to_trb()
Message-ID: <2024102928-chemicals-compost-d995@gregkh>
References: <20241026102740.2653458-1-yiyang13@huawei.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241026102740.2653458-1-yiyang13@huawei.com>

On Sat, Oct 26, 2024 at 10:27:40AM +0000, Yi Yang wrote:
> The mv_u3d_build_trb_one() will return NULL when kzalloc() fails, fix
> possible null-ptr-deref by add check for mv_u3d_build_trb_one().
> 
> Fixes: 3d4eb9dfa3e8 ("usb: gadget: mv: Add USB 3.0 device driver for Marvell PXA2128 chip.")
> Signed-off-by: Yi Yang <yiyang13@huawei.com>
> ---
>  drivers/usb/gadget/udc/mv_u3d_core.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/usb/gadget/udc/mv_u3d_core.c b/drivers/usb/gadget/udc/mv_u3d_core.c
> index 062f43e146aa..c882c377c4f4 100644
> --- a/drivers/usb/gadget/udc/mv_u3d_core.c
> +++ b/drivers/usb/gadget/udc/mv_u3d_core.c
> @@ -417,6 +417,8 @@ static int mv_u3d_req_to_trb(struct mv_u3d_req *req)
>  	 */
>  	if (length <= (unsigned)MV_U3D_EP_MAX_LENGTH_TRANSFER) {
>  		trb = mv_u3d_build_trb_one(req, &count, &dma);
> +		if (!trb)
> +			return -ENOMEM;
>  		list_add_tail(&trb->trb_list, &req->trb_list);
>  		req->trb_head = trb;
>  		req->trb_count = 1;
> -- 
> 2.25.1
> 
> 

How was this tested to verify it works properly?

thanks,.

greg k-h

