Return-Path: <linux-usb+bounces-36213-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id TOrZEyEt3Wn1aQkAu9opvQ
	(envelope-from <linux-usb+bounces-36213-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 13 Apr 2026 19:51:29 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD513F1ACB
	for <lists+linux-usb@lfdr.de>; Mon, 13 Apr 2026 19:51:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CC869301CE76
	for <lists+linux-usb@lfdr.de>; Mon, 13 Apr 2026 17:51:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F1D53A5E84;
	Mon, 13 Apr 2026 17:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="XlRkKdQ9"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-vk1-f227.google.com (mail-vk1-f227.google.com [209.85.221.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F1D9382385
	for <linux-usb@vger.kernel.org>; Mon, 13 Apr 2026 17:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776102682; cv=none; b=U/doHHf7GP/1xyZYQD3toJdVbl8krcxx1VoqHNU6fwdMQ1YIe6x6I3J4OSehjB+xwG8PLHwIqK7DtEpKlZLTFkhCa+d2hvgtEOTghMaKoRwSdDU3+azxYgO9ZxL7aIfDZdp35J3+Fn4JsTYKV7oaxODE3Wkdvghs2qHsCBOZ54w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776102682; c=relaxed/simple;
	bh=93I+Xu+Ho0+KJ1Wx9pdA3mEt2KEaHAtZqLLThZJyPGA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dMX67WXfUZlhL2Kn/f7AnM9j8sRMs4XLu2ECSXP8m+WSFjFqMHlup+Ybnn1go9Ckr8qKkc8ONnOqcTPss5xVmScJhWsgdD56PZT5E9prw3O9WHSE3iFiKT5RW9cmCA33wCoszwp0/0fm4kiIfw7UBu8N/JjeZL2J8dqqG9LSq8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=XlRkKdQ9; arc=none smtp.client-ip=209.85.221.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-vk1-f227.google.com with SMTP id 71dfb90a1353d-56daad0fdbaso1567119e0c.3
        for <linux-usb@vger.kernel.org>; Mon, 13 Apr 2026 10:51:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776102678; x=1776707478;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RWKO9vDsSjUTJZzAKzLLCDdYMLbrt3D+hRWkiFgwafM=;
        b=U8ve5AtiiI+k3CjQxBJ7PPJRYx0fdkg1rnqK0THDTfyVIJN6y0nAaAw7JTzjvvqsmd
         65ouF9Q2MqcABfAR+IGizT8hat38GijOyv4eoOqWksYEgMcyFklUX3JtPD6saxTOm6SN
         PRRNK6HQq7BPJuCLvukbhQrnf/Np+ujsEoC3WHubLH8qM6q/3tkm1LRFdTuQKepzy1ck
         hE7KwOeYTNsoQ5ZKwzKUSsvl1wSJ1T8kWdAU8j+SLwWUXNAACLt4eBFHRWAfP3P3jgCj
         T0qNCvTfll6YgVLwdC7uxkTpz5fYWloaQQrxuF0qg7P+EiUmuPjnT9B8hceS5LZe8Qs5
         BFrQ==
X-Forwarded-Encrypted: i=1; AFNElJ/gbs510K58wlWkI/RtUfRyOaBmgt6sh8AwkIydUPU6PeIVDKrXQNJrCvRZ/L2vI5PhLdUMOkHmc+s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1tXuOg8nHpZFnj9VxuY0KO8fjYJG4EeU/1hYgRotiznWo0GfJ
	YijqTKXzP9Spyj4wFvsA+LhKgtjHsyk9SUEufsMEUJ2fjH/1XvhC8+v79PP5ikqogGr++4LNjvg
	/XTZ5P8PR0M+lVzJHUwQM5hyzO3FOgs9vvNZVT56WlkRB6D1RhFT04n6qmmRB2ShIQ9nxRP4Tnt
	/6DDAwoLCLnzvXlmnWdNHUuXwksQkyb79kFqzYpFtDm6tZIjXdxls8o4unltMZnF0JVw+4rq64e
	fEOQhSGYo5yfA==
X-Gm-Gg: AeBDietlGc6Rhb3XN2Eb0/W0ZbzeJqMiXeqZNH8f3gi4vPu2ISwTXioIf9RC+O5vn1N
	GAi0/0DhMw+XgkxqU00v+/d/2Mfc1pseqVmCJRZkoj6XJZQY2OzXW8+NErH1uUKWkLvXrGvrN68
	BH1W52DiWjJdhdL7HTnn7Ei7yVGyqbMW2o6sUy1xazmbbaSKZ83dXVsmoNVQXQ48he/5eaarpnp
	p45b5SA7GaAW0AYJW1Y+sxIKGaIwEDvUVnSui0caHLXNCD66N6j7kd8B/J7C+zRKbtR+n4PZhFv
	P1Li1092xQs95CZ4Vb+kBRwsIvGRzvl2azosVirTx2gaDduKGimp+/gsC6CZIovqLmBk6EVcvHC
	CWAP6o14w71DgvXA6gly3jJhHtD52pzEpdKvujW05cBhi6ezLc3CuwPgvjyPFQqCaxRplXhLw2L
	zO2pceZbERxi2/PK5LWAO6fB0cQpnYaqMoJoYsV6wGw+c1FctpRRgOpa0=
X-Received: by 2002:a05:6122:80a8:b0:56d:b639:5c0d with SMTP id 71dfb90a1353d-56f3bd019aemr5880260e0c.13.1776102678043;
        Mon, 13 Apr 2026 10:51:18 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-29.dlp.protect.broadcom.com. [144.49.247.29])
        by smtp-relay.gmail.com with ESMTPS id 71dfb90a1353d-56f3b7ffabdsm1042597e0c.1.2026.04.13.10.51.17
        for <linux-usb@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 13 Apr 2026 10:51:18 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2d9da2559aeso3541959eec.0
        for <linux-usb@vger.kernel.org>; Mon, 13 Apr 2026 10:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1776102677; x=1776707477; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RWKO9vDsSjUTJZzAKzLLCDdYMLbrt3D+hRWkiFgwafM=;
        b=XlRkKdQ9iB92WbrwWAW2P9tluHDOzsvsOlnCqWriOUx1IiGBJodpFCmwVx97vQa2ii
         FyRqdoKDjnWufsiz6UXrhiVwxgJ/q1DzdYmuZCJReeMAXsTfdUmD+vFERZiLYY8JJI1C
         LLwBPcEFeTRiQP5hzF0vxoPp+pohSPWpl8YgU=
X-Forwarded-Encrypted: i=1; AFNElJ/WliKqg1+c3LdiuGolX3/FMr0mnvZlKx+b68s829HM0j2wka4NOMGH7lrpd1S7RD1IqIZntY16FCo=@vger.kernel.org
X-Received: by 2002:a05:7300:cb0e:b0:2ce:f3d7:221 with SMTP id 5a478bee46e88-2d589463e5cmr8023456eec.17.1776102676808;
        Mon, 13 Apr 2026 10:51:16 -0700 (PDT)
X-Received: by 2002:a05:7300:cb0e:b0:2ce:f3d7:221 with SMTP id 5a478bee46e88-2d589463e5cmr8023420eec.17.1776102676145;
        Mon, 13 Apr 2026 10:51:16 -0700 (PDT)
Received: from [10.14.4.141] ([192.19.161.248])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d562db64c4sm17140089eec.27.2026.04.13.10.51.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2026 10:51:15 -0700 (PDT)
Message-ID: <f8ea0484-6f6f-4426-aea6-fc45f566f692@broadcom.com>
Date: Mon, 13 Apr 2026 10:51:14 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: bdc: allocate phys with main struct
To: Rosen Penev <rosenp@gmail.com>, linux-usb@vger.kernel.org
Cc: Al Cooper <alcooperx@gmail.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kees Cook
 <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 open "list:KERNEL" HARDENING "(not" covered by other
 "areas):Keyword:b__counted_by(_le|_be)?b" <linux-hardening@vger.kernel.org>
References: <20260411041252.166816-1-rosenp@gmail.com>
Content-Language: en-US
From: Justin Chen <justin.chen@broadcom.com>
In-Reply-To: <20260411041252.166816-1-rosenp@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[broadcom.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[broadcom.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,broadcom.com,linuxfoundation.org,kernel.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-36213-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	DKIM_TRACE(0.00)[broadcom.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,broadcom.com:dkim,broadcom.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[justin.chen@broadcom.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DCD513F1ACB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/10/26 9:12 PM, Rosen Penev wrote:
> Use a flexible array member to combine allocations and simplify code
> slightly. No need for a branch deciding whether to allocate or not.
> 
> Add __counted_by for extra runtime analysis.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>   drivers/usb/gadget/udc/bdc/bdc.h      |  2 +-
>   drivers/usb/gadget/udc/bdc/bdc_core.c | 20 +++++++-------------
>   2 files changed, 8 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/usb/gadget/udc/bdc/bdc.h b/drivers/usb/gadget/udc/bdc/bdc.h
> index 2f4abf6f8f77..cc961161eb46 100644
> --- a/drivers/usb/gadget/udc/bdc/bdc.h
> +++ b/drivers/usb/gadget/udc/bdc/bdc.h
> @@ -409,7 +409,6 @@ struct bdc {
>   	spinlock_t	lock;
>   
>   	/* generic phy */
> -	struct phy      **phys;
>   	int num_phys;
>   	/* num of endpoints for a particular instantiation of IP */
>   	unsigned int num_eps;
> @@ -453,6 +452,7 @@ struct bdc {
>   	 */
>   	struct delayed_work	func_wake_notify;
>   	struct clk		*clk;
> +	struct phy		*phys[] __counted_by(num_phys);
>   };
>   
>   static inline u32 bdc_readl(void __iomem *base, u32 offset)
> diff --git a/drivers/usb/gadget/udc/bdc/bdc_core.c b/drivers/usb/gadget/udc/bdc/bdc_core.c
> index 438201dc96ca..4b16b85da450 100644
> --- a/drivers/usb/gadget/udc/bdc/bdc_core.c
> +++ b/drivers/usb/gadget/udc/bdc/bdc_core.c
> @@ -487,14 +487,20 @@ static int bdc_probe(struct platform_device *pdev)
>   	int irq;
>   	u32 temp;
>   	struct device *dev = &pdev->dev;
> +	int num_phys;
>   	int phy_num;
>   
>   	dev_dbg(dev, "%s()\n", __func__);
>   
> -	bdc = devm_kzalloc(dev, sizeof(*bdc), GFP_KERNEL);
> +	num_phys = of_count_phandle_with_args(dev->of_node,
> +						"phys", "#phy-cells");
> +	bdc = devm_kzalloc(dev, struct_size(bdc, phys, num_phys), GFP_KERNEL);
>   	if (!bdc)
>   		return -ENOMEM;
>   
> +	bdc->num_phys = num_phys;
> +	dev_info(dev, "Using %d phy(s)\n", bdc->num_phys);
> +

This feels like a step sideways instead of an improvement IMHO. And we 
are also moving the allocation and dev_info() print. Is there a reason 
to change the ordering?

Justin

>   	bdc->regs = devm_platform_ioremap_resource(pdev, 0);
>   	if (IS_ERR(bdc->regs))
>   		return PTR_ERR(bdc->regs);
> @@ -508,18 +514,6 @@ static int bdc_probe(struct platform_device *pdev)
>   	bdc->dev = dev;
>   	dev_dbg(dev, "bdc->regs: %p irq=%d\n", bdc->regs, bdc->irq);
>   
> -	bdc->num_phys = of_count_phandle_with_args(dev->of_node,
> -						"phys", "#phy-cells");
> -	if (bdc->num_phys > 0) {
> -		bdc->phys = devm_kcalloc(dev, bdc->num_phys,
> -					sizeof(struct phy *), GFP_KERNEL);
> -		if (!bdc->phys)
> -			return -ENOMEM;
> -	} else {
> -		bdc->num_phys = 0;
> -	}
> -	dev_info(dev, "Using %d phy(s)\n", bdc->num_phys);
> -
>   	for (phy_num = 0; phy_num < bdc->num_phys; phy_num++) {
>   		bdc->phys[phy_num] = devm_of_phy_get_by_index(
>   			dev, dev->of_node, phy_num);


