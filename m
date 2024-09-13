Return-Path: <linux-usb+bounces-15063-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F75297766E
	for <lists+linux-usb@lfdr.de>; Fri, 13 Sep 2024 03:35:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CF7361F249F9
	for <lists+linux-usb@lfdr.de>; Fri, 13 Sep 2024 01:34:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 528623FE4;
	Fri, 13 Sep 2024 01:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lER63ki/"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE106443D;
	Fri, 13 Sep 2024 01:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726191293; cv=none; b=VcvsqrS0SZ2KwPDNTuQ9iz4EIJ4QVCJUPNENieSRJdzlNnnwp0p0UR/b8hxAAjRnXXycQyroftGJU5svfbld5MBcAgUT5xqew1h0+EmoPxxO0szK6o2gTpzrGW0NQj4i/MqhDBoSIn/z9PBqP+u+YY9e9xTzFtsLyfxO1drxH9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726191293; c=relaxed/simple;
	bh=GBa90cpQO4bdwxqTlAy3EnRRdCl548M4R4K/5s+El4k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CZKnuG2ZOXc87QHhIrjV5TEKa3rEKdx/XEgIkdm8Hr2zlbZ4RJrrZKBjwgGIsFEjsbVBn01l2likXDZqukGA+Wah27EbyFzzQ9aaf8GKYmuxmcgLX221bnKAnpCH8qx3rhF5wmVIRPJ0o8aSDDAJ3hJqoxAP2gAEmhCRBHwIgUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lER63ki/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5199AC4CEC3;
	Fri, 13 Sep 2024 01:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726191293;
	bh=GBa90cpQO4bdwxqTlAy3EnRRdCl548M4R4K/5s+El4k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lER63ki/Q7YCO/TEKNeYrwC0yKuv1cW0Ud2PVp9WnZPpQfy71+jihd71uDnDhnJzi
	 Fgc2VnGwN+ZVRCtOE0ubrEXcCD9hAH477m7hCHpRKNbRpVRVrwWW236jbk+Ah4pJFX
	 CbjxEcGb6jg49KGZPfiQtkTwOFBYyTJQrL6K0pvwv9TNSjh5v6DPF53+wP4TZjSLp3
	 reTPyLR5sSK3D6+bhqiE9GtFyufL40EM8lgznpn834inxbtHJCzlW2TGlezqMUfFxJ
	 RBhxr/gCBXJvyaYRNOTm+KHgzmo15CJfRoo1GktI3iDHk4nIDh/fvBrCxRzKezWbA7
	 i8zh1Hptht1lA==
Date: Fri, 13 Sep 2024 09:34:46 +0800
From: Peter Chen <peter.chen@kernel.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH 2/2] usb: chipidea: udc: create bounce buffer for problem
 sglist entries if possible
Message-ID: <20240913013446.GB320526@nchen-desktop>
References: <20240912045150.915573-1-xu.yang_2@nxp.com>
 <20240912045150.915573-2-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240912045150.915573-2-xu.yang_2@nxp.com>

On 24-09-12 12:51:50, Xu Yang wrote:
> The chipidea controller doesn't fully support sglist, such as it can not
> transfer data spanned more dTDs to form a bus packet, so it can only work
> on very limited cases.
> 
> The limitations as below:
> 1. the end address of the first sg buffer must be 4KB aligned.
> 2. the start and end address of the middle sg buffer must be 4KB aligned.
> 3. the start address of the first sg buffer must be 4KB aligned.
> 
> However, not all the use cases violate these limitations. To make the
> controller compatible with most of the cases, this will try to bounce the
> problem sglist entries which can be found by sglist_get_invalid_entry().
> Then a bounced line buffer (the size will roundup to page size) will be
> allocated to replace the remaining problem sg entries. The data will be
> copied between problem sg entries and bounce buffer according to the
> transfer direction. The bounce buffer will be freed when the request
> completed.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Acked-by: Peter Chen <peter.chen@kernel.com>

> ---
>  drivers/usb/chipidea/udc.c | 147 +++++++++++++++++++++++++++++++++++++
>  drivers/usb/chipidea/udc.h |   2 +
>  2 files changed, 149 insertions(+)
> 
> diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
> index 5d9369d01065..dc4dae2c31b4 100644
> --- a/drivers/usb/chipidea/udc.c
> +++ b/drivers/usb/chipidea/udc.c
> @@ -10,6 +10,7 @@
>  #include <linux/delay.h>
>  #include <linux/device.h>
>  #include <linux/dmapool.h>
> +#include <linux/dma-direct.h>
>  #include <linux/err.h>
>  #include <linux/irqreturn.h>
>  #include <linux/kernel.h>
> @@ -540,6 +541,126 @@ static int prepare_td_for_sg(struct ci_hw_ep *hwep, struct ci_hw_req *hwreq)
>  	return ret;
>  }
>  
> +/*
> + * Verify if the scatterlist is valid by iterating each sg entry.
> + * Return invalid sg entry index which is less than num_sgs.
> + */
> +static int sglist_get_invalid_entry(struct device *dma_dev, u8 dir,
> +			struct usb_request *req)
> +{
> +	int i;
> +	struct scatterlist *s = req->sg;
> +
> +	if (req->num_sgs == 1)
> +		return 1;
> +
> +	dir = dir ? DMA_TO_DEVICE : DMA_FROM_DEVICE;
> +
> +	for (i = 0; i < req->num_sgs; i++, s = sg_next(s)) {
> +		/* Only small sg (generally last sg) may be bounced. If
> +		 * that happens. we can't ensure the addr is page-aligned
> +		 * after dma map.
> +		 */
> +		if (dma_kmalloc_needs_bounce(dma_dev, s->length, dir))
> +			break;
> +
> +		/* Make sure each sg start address (except first sg) is
> +		 * page-aligned and end address (except last sg) is also
> +		 * page-aligned.
> +		 */
> +		if (i == 0) {
> +			if (!IS_ALIGNED(s->offset + s->length,
> +						CI_HDRC_PAGE_SIZE))
> +				break;
> +		} else {
> +			if (s->offset)
> +				break;
> +			if (!sg_is_last(s) && !IS_ALIGNED(s->length,
> +						CI_HDRC_PAGE_SIZE))
> +				break;
> +		}
> +	}
> +
> +	return i;
> +}
> +
> +static int sglist_do_bounce(struct ci_hw_req *hwreq, int index,
> +			bool copy, unsigned int *bounced)
> +{
> +	void *buf;
> +	int i, ret, nents, num_sgs;
> +	unsigned int rest, rounded;
> +	struct scatterlist *sg, *src, *dst;
> +
> +	nents = index + 1;
> +	ret = sg_alloc_table(&hwreq->sgt, nents, GFP_KERNEL);
> +	if (ret)
> +		return ret;
> +
> +	sg = src = hwreq->req.sg;
> +	num_sgs = hwreq->req.num_sgs;
> +	rest = hwreq->req.length;
> +	dst = hwreq->sgt.sgl;
> +
> +	for (i = 0; i < index; i++) {
> +		memcpy(dst, src, sizeof(*src));
> +		rest -= src->length;
> +		src = sg_next(src);
> +		dst = sg_next(dst);
> +	}
> +
> +	/* create one bounce buffer */
> +	rounded = round_up(rest, CI_HDRC_PAGE_SIZE);
> +	buf = kmalloc(rounded, GFP_KERNEL);
> +	if (!buf) {
> +		sg_free_table(&hwreq->sgt);
> +		return -ENOMEM;
> +	}
> +
> +	sg_set_buf(dst, buf, rounded);
> +
> +	hwreq->req.sg = hwreq->sgt.sgl;
> +	hwreq->req.num_sgs = nents;
> +	hwreq->sgt.sgl = sg;
> +	hwreq->sgt.nents = num_sgs;
> +
> +	if (copy)
> +		sg_copy_to_buffer(src, num_sgs - index, buf, rest);
> +
> +	*bounced = rest;
> +
> +	return 0;
> +}
> +
> +static void sglist_do_debounce(struct ci_hw_req *hwreq, bool copy)
> +{
> +	void *buf;
> +	int i, nents, num_sgs;
> +	struct scatterlist *sg, *src, *dst;
> +
> +	sg = hwreq->req.sg;
> +	num_sgs = hwreq->req.num_sgs;
> +	src = sg_last(sg, num_sgs);
> +	buf = sg_virt(src);
> +
> +	if (copy) {
> +		dst = hwreq->sgt.sgl;
> +		for (i = 0; i < num_sgs - 1; i++)
> +			dst = sg_next(dst);
> +
> +		nents = hwreq->sgt.nents - num_sgs + 1;
> +		sg_copy_from_buffer(dst, nents, buf, sg_dma_len(src));
> +	}
> +
> +	hwreq->req.sg = hwreq->sgt.sgl;
> +	hwreq->req.num_sgs = hwreq->sgt.nents;
> +	hwreq->sgt.sgl = sg;
> +	hwreq->sgt.nents = num_sgs;
> +
> +	kfree(buf);
> +	sg_free_table(&hwreq->sgt);
> +}
> +
>  /**
>   * _hardware_enqueue: configures a request at hardware level
>   * @hwep:   endpoint
> @@ -552,6 +673,8 @@ static int _hardware_enqueue(struct ci_hw_ep *hwep, struct ci_hw_req *hwreq)
>  	struct ci_hdrc *ci = hwep->ci;
>  	int ret = 0;
>  	struct td_node *firstnode, *lastnode;
> +	unsigned int bounced_size;
> +	struct scatterlist *sg;
>  
>  	/* don't queue twice */
>  	if (hwreq->req.status == -EALREADY)
> @@ -559,11 +682,28 @@ static int _hardware_enqueue(struct ci_hw_ep *hwep, struct ci_hw_req *hwreq)
>  
>  	hwreq->req.status = -EALREADY;
>  
> +	if (hwreq->req.num_sgs && hwreq->req.length) {
> +		ret = sglist_get_invalid_entry(ci->dev->parent, hwep->dir,
> +					&hwreq->req);
> +		if (ret < hwreq->req.num_sgs) {
> +			ret = sglist_do_bounce(hwreq, ret, hwep->dir == TX,
> +					&bounced_size);
> +			if (ret)
> +				return ret;
> +		}
> +	}
> +
>  	ret = usb_gadget_map_request_by_dev(ci->dev->parent,
>  					    &hwreq->req, hwep->dir);
>  	if (ret)
>  		return ret;
>  
> +	if (hwreq->sgt.sgl) {
> +		/* We've mapped a bigger buffer, now recover the actual size */
> +		sg = sg_last(hwreq->req.sg, hwreq->req.num_sgs);
> +		sg_dma_len(sg) = min(sg_dma_len(sg), bounced_size);
> +	}
> +
>  	if (hwreq->req.num_mapped_sgs)
>  		ret = prepare_td_for_sg(hwep, hwreq);
>  	else
> @@ -742,6 +882,10 @@ static int _hardware_dequeue(struct ci_hw_ep *hwep, struct ci_hw_req *hwreq)
>  	usb_gadget_unmap_request_by_dev(hwep->ci->dev->parent,
>  					&hwreq->req, hwep->dir);
>  
> +	/* sglist bounced */
> +	if (hwreq->sgt.sgl)
> +		sglist_do_debounce(hwreq, hwep->dir == RX);
> +
>  	hwreq->req.actual += actual;
>  
>  	if (hwreq->req.status)
> @@ -1588,6 +1732,9 @@ static int ep_dequeue(struct usb_ep *ep, struct usb_request *req)
>  
>  	usb_gadget_unmap_request(&hwep->ci->gadget, req, hwep->dir);
>  
> +	if (hwreq->sgt.sgl)
> +		sglist_do_debounce(hwreq, false);
> +
>  	req->status = -ECONNRESET;
>  
>  	if (hwreq->req.complete != NULL) {
> diff --git a/drivers/usb/chipidea/udc.h b/drivers/usb/chipidea/udc.h
> index 5193df1e18c7..c8a47389a46b 100644
> --- a/drivers/usb/chipidea/udc.h
> +++ b/drivers/usb/chipidea/udc.h
> @@ -69,11 +69,13 @@ struct td_node {
>   * @req: request structure for gadget drivers
>   * @queue: link to QH list
>   * @tds: link to TD list
> + * @sgt: hold original sglist when bounce sglist
>   */
>  struct ci_hw_req {
>  	struct usb_request	req;
>  	struct list_head	queue;
>  	struct list_head	tds;
> +	struct sg_table		sgt;
>  };
>  
>  #ifdef CONFIG_USB_CHIPIDEA_UDC
> -- 
> 2.34.1
> 

