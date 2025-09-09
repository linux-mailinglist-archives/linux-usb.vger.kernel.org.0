Return-Path: <linux-usb+bounces-27788-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 05EA2B4AA24
	for <lists+linux-usb@lfdr.de>; Tue,  9 Sep 2025 12:18:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5C8751C24F72
	for <lists+linux-usb@lfdr.de>; Tue,  9 Sep 2025 10:17:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 778FE31B122;
	Tue,  9 Sep 2025 10:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K9kreFcb"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F0A83191A7
	for <linux-usb@vger.kernel.org>; Tue,  9 Sep 2025 10:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757412801; cv=none; b=XI85GZXXIH9Ly45se6zq0vz+M5ezB0kWXZeTRmM9rHxSAD5P29uZM8Jg74Bg9i78gvKcuDw3Gp241ZJFv09Ibh804xHmB6IcYCU9gv8IpF9amsjubqO8Kuj0Bg7cUPFlso9FOP24P8XGYAk1qaunDG/3qGTTYLnqgRj7LrQqPiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757412801; c=relaxed/simple;
	bh=bv2L+tpjh0sLXh8aBysZqy5/RsfL/tC8ENo4JM1ks4M=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mMOZvDmXfPRFh9VqYcK3ghruZG2HorcycJsE1ajEAn0UtsTzOK+k73uXT9nYp3vUn6rykgiwt7XsPlnj+qSv7PH2IVkeq3e30L9B+cXGeCELgBBzLj+q1uqs9hzU3LV2r9QCkm2UkVEy3OfarqSWl7XvimBmDJ4k3fHIvW8OZoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K9kreFcb; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-55f68d7a98aso6392822e87.3
        for <linux-usb@vger.kernel.org>; Tue, 09 Sep 2025 03:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757412797; x=1758017597; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hPWKzrzm6wuMPEPmQIe1bNDIZ8eC/30TIuSLYATbn8o=;
        b=K9kreFcbBcGNhWkYlx45yJGHML2ri92nOsD2GpBESTCc/IU46xQ8U12xm9R0TStY94
         X10t5GRQKQDOZrjNOy31kf7UGckVMUt5RtxvB9KNNKHj+YbZY2jMevDemEWwcWmqhCmY
         hFUS1q46U1dgfwmRuNYwRGq78seGR/SNeJ0bm2zH3zg3jszzLIn8rT2TGDh6tnBHQCPt
         Dy3ckVUItM/j1tgyH7Gwr+IrBiPIZjwapE+RmHBdhXLXzmJg21p7rzInWBjAbnfAhT8A
         F3OUUdfeu/V1KUfLlpfyo4lrvcSaPvJOEncEV791hMdyiA69jM5PyWqe9NtMBpA+KHZw
         UYUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757412797; x=1758017597;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hPWKzrzm6wuMPEPmQIe1bNDIZ8eC/30TIuSLYATbn8o=;
        b=xSCan4EJpQ2uewd2Kleb31H+G5NNI4gThsU+L6rhPY5rHlmgiOuRIoT5PzX0bJ5zpE
         YcjtqNcaVyIXgeToDmg69h2RjgiPXBtuCyKG89BCyWUiy0LDzV6Pu4n8+RbrqKwITbci
         t1o2HlJXamhLdY15k+gCEN778L4mPKGPcu921CgQCJxRIJUTGjGLMAv1E/qXKYa0a9Ca
         29rmv4lnGTjnaIIYnOkSkiVSKZTMgR5bzFhZE06mBWfeswK4ssQCB4FGH7rSNbsQgSDR
         gIvQla3dMPZ62uf9kMC2T4fXn1t1/OppkM4qwUZt5bNUvRtZN1nVfPHeDpyQ36bPzaLW
         hXyg==
X-Forwarded-Encrypted: i=1; AJvYcCWFYxjchRCYbbnGoTxc0escTFwbzTZlbcO/GkgB6iJQRHeQM6kB5WMf+r5zWr+wtgc4r2z1L3zTafs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNFXCednRCvQYQe2QcNiEORWJya1M6IPa0azMc0iU5SUcebnTs
	QJVCtezk8BJZ/2PGZC5F1GnDocx5SdiHDnsVe6tntg1Q11PhPKaf6Ox31EKVUA==
X-Gm-Gg: ASbGnctmYyrBcNMkctqVyZCyG8qLw7D7jfmjgzotWmbayYueWFu1/C86S/sWerPevdU
	OJiafyBw5gfGgu/t2D/PRZ7SJWyuYZUles0rnpp0UL0OlkGW5grV7YnpMYEJyPwVKzh/sM4Y7h6
	x/5HFThyn4foImu/YTxrTNCfw02IvFD0oJT7nNbIQDSUzNUJ6dAc6iPiSS0NpTUC6fQyiJfAHwx
	AEaIO52kKJWwa8GR2+QGaLaN9v1QJdwEY+E4mcijNuC0e/TfsI0RlISbbIqmWMHOHWK3B4Y5npC
	EYEyW0jLVLevQoMsZcdrQOwoEZNQ1vfou6QBpm53g9W0rv3pJLEGu53HNBNknrstDtslEQywdP7
	YA9gAjEz0vsUEVs6hiF0DX7k9W2KngmOJsa6MbZ9Q3SjgsIBY0G7gCiS5
X-Google-Smtp-Source: AGHT+IFHf7FRfEsGuw2gC9x6nNFLtpCUGJ1GRsGeoJh/pm+XgpXgCwPMIjdPsODQ1vvXATrEU4utkg==
X-Received: by 2002:a05:6512:3347:b0:55f:727d:408c with SMTP id 2adb3069b0e04-56261db51a5mr3255211e87.50.1757412796883;
        Tue, 09 Sep 2025 03:13:16 -0700 (PDT)
Received: from foxbook (bfg216.neoplus.adsl.tpnet.pl. [83.28.44.216])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5680cfd9d4csm430740e87.60.2025.09.09.03.13.16
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 09 Sep 2025 03:13:16 -0700 (PDT)
Date: Tue, 9 Sep 2025 12:13:13 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Niklas Neronin <niklas.neronin@linux.intel.com>
Cc: mathias.nyman@linux.intel.com, linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/7] usb: xhci-dbgcap: correct DMA address handling
Message-ID: <20250909121313.13286b34.michal.pecio@gmail.com>
In-Reply-To: <20250903170127.2190730-2-niklas.neronin@linux.intel.com>
References: <20250903170127.2190730-1-niklas.neronin@linux.intel.com>
	<20250903170127.2190730-2-niklas.neronin@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed,  3 Sep 2025 19:01:21 +0200, Niklas Neronin wrote:
> Address the handling of addresses within the dbc_handle_xfer_event(),
> ensuring accurate extraction and comparison.
> 
> Variable details:
> 'r->trb_dma'		    : A DMA address.
> 'ep_ctx->deq'		    : A le64, bits 63:4 contain the DMA address.
> 'event->trans_event.buffer' : A le64, bits 63:0 contain the DMA address.
> 
> 1. Convert 'ep_ctx->deq' and 'event->trans_event.buffer' addresses to
>    the CPU's native byte order.
> 
> 2. Use mask; TR_DEQ_PTR_MASK (bits 63:4) to extract the address from
>    'ep_ctx->deq', replacing the previous use of ~TRB_CYCLE (bits 63:1).
> 
> Why not use 'dma_addr_t' for the address?
> The 'dma_addr_t' type can vary between 32 and 64 bits depending on the
> system architecture or xHCI driver flags, whereas the 64-bit address field
> size remains constant. Since hardware cannot be fully trusted, it's better
> to print the entire 64-bit address to detect any non-zero values in the
> upper 32 bits. This approach ensures that potential issues are easily
> detected.
> 
> Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
> ---
>  drivers/usb/host/xhci-dbgcap.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/host/xhci-dbgcap.c b/drivers/usb/host/xhci-dbgcap.c
> index 06a2edb9e86e..2f24a3a54439 100644
> --- a/drivers/usb/host/xhci-dbgcap.c
> +++ b/drivers/usb/host/xhci-dbgcap.c
> @@ -724,6 +724,7 @@ static void dbc_handle_xfer_event(struct xhci_dbc *dbc, union xhci_trb *event)
>  	u32			comp_code;
>  	size_t			remain_length;
>  	struct dbc_request	*req = NULL, *r;
> +	u64			ep_trb, deq;
>  
>  	comp_code	= GET_COMP_CODE(le32_to_cpu(event->generic.field[2]));
>  	remain_length	= EVENT_TRB_LEN(le32_to_cpu(event->generic.field[2]));
> @@ -733,10 +734,11 @@ static void dbc_handle_xfer_event(struct xhci_dbc *dbc, union xhci_trb *event)
>  	ep_ctx		= (ep_id == EPID_OUT) ?
>  				dbc_bulkout_ctx(dbc) : dbc_bulkin_ctx(dbc);
>  	ring		= dep->ring;
> +	ep_trb		= le64_to_cpu(event->trans_event.buffer);

In other places this variable would be called ep_trb_dma
and ep_trb would be xhci_trb*.

>  
>  	/* Match the pending request: */
>  	list_for_each_entry(r, &dep->list_pending, list_pending) {
> -		if (r->trb_dma == event->trans_event.buffer) {
> +		if (r->trb_dma == ep_trb) {

And here it is being compared with a something_dma variable.

>  			req = r;
>  			break;
>  		}
> @@ -768,8 +770,9 @@ static void dbc_handle_xfer_event(struct xhci_dbc *dbc, union xhci_trb *event)
>  		status = -comp_code;
>  		break;
>  	case COMP_STALL_ERROR:
> +		deq = le64_to_cpu(ep_ctx->deq) & TR_DEQ_PTR_MASK;
>  		dev_warn(dbc->dev, "Stall error at bulk TRB %llx, remaining %zu, ep deq %llx\n",
> -			 event->trans_event.buffer, remain_length, ep_ctx->deq);
> +			 ep_trb, remain_length, deq);
>  		status = 0;
>  		dep->halted = 1;
>  
> @@ -788,7 +791,7 @@ static void dbc_handle_xfer_event(struct xhci_dbc *dbc, union xhci_trb *event)
>  		 * TRB again.
>  		 */
>  
> -		if ((ep_ctx->deq & ~TRB_CYCLE) == event->trans_event.buffer) {
> +		if (deq == ep_trb) {
>  			dev_dbg(dbc->dev, "Ep stopped on Stalled TRB\n");
>  			if (remain_length == req->length) {
>  				dev_dbg(dbc->dev, "Spurious stall event, keep req\n");
> -- 
> 2.50.1
> 

