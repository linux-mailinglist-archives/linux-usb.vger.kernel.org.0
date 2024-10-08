Return-Path: <linux-usb+bounces-15879-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D5570995875
	for <lists+linux-usb@lfdr.de>; Tue,  8 Oct 2024 22:31:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 133981C21935
	for <lists+linux-usb@lfdr.de>; Tue,  8 Oct 2024 20:31:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5A6E215F64;
	Tue,  8 Oct 2024 20:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=ijzerbout.nl header.i=@ijzerbout.nl header.b="BiZIvYIB"
X-Original-To: linux-usb@vger.kernel.org
Received: from bout3.ijzerbout.nl (bout3.ijzerbout.nl [136.144.140.114])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C08B5215F5A
	for <linux-usb@vger.kernel.org>; Tue,  8 Oct 2024 20:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.144.140.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728419241; cv=none; b=SilUH/vaIicfltH0rlVrpn0ERF/ikTvLqS79r57C0xjid5XnLh/Nov5E0hIfA80Ns6mJPhSu+xIGxjvOC1NvQ3palUgFMbK92N6mHB1az14BH2aYJuFmYp9JVozuZ5tLGmfe/StR552yO+0ENOjbseMxfjvABuuVefg1PAFnQdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728419241; c=relaxed/simple;
	bh=04yxXAVCx7PccPuqz7i5PZGdGMcjC51G/fYHjBE/s9o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hW4MR+H8HE4IT74vnEhESbq70cesQ1QttiONTwkxQ8bRO3JNtBqq/kErMPwo6LHLLoNO/6O/myeWc81oUsvLudJaU4MOrMxbtWTjQOq3HE22St4VeAChFx1e7SLQia3wkPVCZqOlJa07U4Jm3PMRwsmDSAdW4tOjZqnedX0IWI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ijzerbout.nl; spf=pass smtp.mailfrom=ijzerbout.nl; dkim=pass (4096-bit key) header.d=ijzerbout.nl header.i=@ijzerbout.nl header.b=BiZIvYIB; arc=none smtp.client-ip=136.144.140.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ijzerbout.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ijzerbout.nl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ijzerbout.nl; s=key;
	t=1728419238; bh=04yxXAVCx7PccPuqz7i5PZGdGMcjC51G/fYHjBE/s9o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BiZIvYIBRE9a+BKE28dvrEBzpQ1GjijYz81TFPdCbKv9/rcvP9ESh01ZZBWtyce9s
	 cW08cUfDfSVtpEO4CnAyaBBhZVu6axQu2i2HS2riLUF9TtUr9i03fkozNaFaLI8Jv8
	 0ck+vl7VFHuQAF42YgMXPa1uQ0j0wmkba13SAXxSCD0+GO1+2OurARMVVcFNgoOtvp
	 lyq5/Pf6SLMlEemFEGsfHBQPvFG7IYp52zbwFzWL9iSfdw2tsyXt7HDHhM1X9mua5T
	 50Y7vvGU/XVGO/jWoElWP2hkyiVZ3bfy9Zd+zBgSl779rzs94YOwbQ4gd8PzROXWJW
	 SYUEY0tcHlAPubI7HeYyvjEshuUp9+KJQjDI60PAlOCkJcgJv8laczMMzCrl2gMB9L
	 Ei76oDI30zdxaAnqZqeet1VJl2FHnkOoO2S5RUjtNsZGmwFLbz/c3pahVhLj59MI7x
	 oCiv+yDrCCR8bxoCbzyliyQsDi3Izu513RgUtSdR7dq2TEToPK3B8cD8j4d8OYxOfr
	 Jf0a9oivTZyu3OTUugPWZIsZ+LIH7dC+PUebM0ukTnz/mQGcfW/R6ItckECKJYz1dq
	 6T090yy797Dkh4lpOeag/BG4erqIsK7A9TQcwcuy27FWC3uVrtmZ4hmNfXoaUD5081
	 Mk0CiBsD5De8WNks2MiZhYTc=
Received: from [IPV6:2a10:3781:99:1:1ac0:4dff:fea7:ec3a] (racer.ijzerbout.nl [IPv6:2a10:3781:99:1:1ac0:4dff:fea7:ec3a])
	by bout3.ijzerbout.nl (Postfix) with ESMTPSA id A944318D6D9;
	Tue,  8 Oct 2024 22:27:17 +0200 (CEST)
Message-ID: <9da1ef03-8e29-4564-9d81-4ac7cee1ddff@ijzerbout.nl>
Date: Tue, 8 Oct 2024 22:27:15 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] usb: chipidea: udc: create bounce buffer for
 problem sglist entries if possible
To: Xu Yang <xu.yang_2@nxp.com>, peter.chen@kernel.org,
 gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, imx@lists.linux.dev, jun.li@nxp.com
References: <20240923081203.2851768-1-xu.yang_2@nxp.com>
 <20240923081203.2851768-3-xu.yang_2@nxp.com>
Content-Language: en-US
From: Kees Bakker <kees@ijzerbout.nl>
In-Reply-To: <20240923081203.2851768-3-xu.yang_2@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Op 23-09-2024 om 10:12 schreef Xu Yang:
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
> Acked-by: Peter Chen <peter.chen@kernel.com>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
>
> ---
> Changes in v2:
>   - judge ci->has_short_pkt_limit
>   - add Ack-by tag
> ---
>   drivers/usb/chipidea/udc.c | 148 +++++++++++++++++++++++++++++++++++++
>   drivers/usb/chipidea/udc.h |   2 +
>   2 files changed, 150 insertions(+)
> [...]
> @@ -552,6 +673,8 @@ static int _hardware_enqueue(struct ci_hw_ep *hwep, struct ci_hw_req *hwreq)
>   	struct ci_hdrc *ci = hwep->ci;
>   	int ret = 0;
>   	struct td_node *firstnode, *lastnode;
> +	unsigned int bounced_size;
> +	struct scatterlist *sg;
>   
>   	/* don't queue twice */
>   	if (hwreq->req.status == -EALREADY)
> @@ -559,11 +682,29 @@ static int _hardware_enqueue(struct ci_hw_ep *hwep, struct ci_hw_req *hwreq)
>   
>   	hwreq->req.status = -EALREADY;
>   
> +	if (hwreq->req.num_sgs && hwreq->req.length &&
> +		ci->has_short_pkt_limit) {
> +		ret = sglist_get_invalid_entry(ci->dev->parent, hwep->dir,
> +					&hwreq->req);
> +		if (ret < hwreq->req.num_sgs) {
bounced_size is only initialized here
> +			ret = sglist_do_bounce(hwreq, ret, hwep->dir == TX,
> +					&bounced_size);
> +			if (ret)
> +				return ret;
> +		}
> +	}
> +
>   	ret = usb_gadget_map_request_by_dev(ci->dev->parent,
>   					    &hwreq->req, hwep->dir);
>   	if (ret)
>   		return ret;
>   
> +	if (hwreq->sgt.sgl) {
> +		/* We've mapped a bigger buffer, now recover the actual size */
> +		sg = sg_last(hwreq->req.sg, hwreq->req.num_sgs);
bounced_size can be uninitialized at this point, if the earlier if 
condition is false.
> +		sg_dma_len(sg) = min(sg_dma_len(sg), bounced_size);
> +	}
> +
>
-- 
Kees

