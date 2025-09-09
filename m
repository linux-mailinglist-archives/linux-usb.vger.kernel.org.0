Return-Path: <linux-usb+bounces-27779-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F5F3B4A7F4
	for <lists+linux-usb@lfdr.de>; Tue,  9 Sep 2025 11:32:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ED4E017562F
	for <lists+linux-usb@lfdr.de>; Tue,  9 Sep 2025 09:31:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59CD423D7EF;
	Tue,  9 Sep 2025 09:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j0kZL3ui"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04352288C96
	for <linux-usb@vger.kernel.org>; Tue,  9 Sep 2025 09:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757409826; cv=none; b=g0IW2BadgbBs9Fh7PiBdnXBXVyiYNW4QZHxWMEw6M8A3e2Gw8dKGlkTxjtkerb3fHICl8qIiJ04YceNEDXOlvvX/2eX/cTtWLS4b3UzENAPwX7LD0HCwZ+G6c94/beSfiT7JZfGOyXa9eHlyTWdQwM8UnfBQ/UbVmzoIGEqr0Lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757409826; c=relaxed/simple;
	bh=1x2MoA5UWS/pTHQho0bKZ/nq7FY01sKAQYrLX6tgXEU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YPgEVCOPrd7nmLx8AFQ7hVtIs5xKK01pt5MblS42TFQMAA6TCkfFw991sSDDQLoZT9rVbY5g1A7ODcYzXQ9Wujsomoa3TPkS1pYAPxoCx0m+hPAud7cULoBvnFn0tKQfTVi0kF90MUSqKAuCzxlFVx18jRf4swGwsRd9vIyINqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j0kZL3ui; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-55f753ec672so6092108e87.2
        for <linux-usb@vger.kernel.org>; Tue, 09 Sep 2025 02:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757409823; x=1758014623; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jhor/ZicUvholsFe5QbIiTrWlOQxqwQ0jmOPkz5PsTM=;
        b=j0kZL3uip5DJ/jKXvomTIDOrLbLW4yZjcwsH2xpPcYURBRMU8FXDDnDal679hH1E7z
         W3HqcUZV8SwE7r0EEvQTa6lSohoG4uhEOzspgPaRcNaI144mLzhHlMm6aKYZWjL7PuA2
         J53VZj7UluRn/qBEtNlu8hIu+9dN6C/Gh5OziXrFnXs9++1MChVGHiRkaQnGukfnapni
         lQWwvMcD3XDr2pK7jLzDl0IXqDX2uSehTx5CIO720MhAD5jRy8KA9UMPEWLWnxQ76QiF
         0PR3sdM1wWcN4Jkcz6MQG7MRsX6bluERv6MvAqxAFzmhhifqh5NZhB/Ezev4oss3YcVM
         y+tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757409823; x=1758014623;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jhor/ZicUvholsFe5QbIiTrWlOQxqwQ0jmOPkz5PsTM=;
        b=q+Qrn1G6hdoogQ3DxiIeocofX7PUeVAOu/Wxxy3ANWH1bfBst1VTO0l96IqF4YC2nr
         iLQVejaC2jqh0MMmKSVk1jU0HnVSm1fjnciS5/6RT3fq73QJMyObekMAKbVYeyDySMxX
         TV3Rdm+FtRwNxWqUPV6KtDlxX+RuM6sOEOd5Y784PaJOhJP44BRTHx/xtoWxTSXbirt8
         JcqRWV1gvbWQHXGQK6v6Ts1FBKnlfV9YZA2Ir0z7ef8f6fRBq3+VCWkPfeQWlFV1TwI9
         N9dM0ubr+ynT7nch3gXVXu+i071hStDKK+VEk+POADT7A8EcXGWeJTlIvXBoiih56KZT
         eOsQ==
X-Forwarded-Encrypted: i=1; AJvYcCXiiyVqv6CPHh4Zqtrx6wnC7F6yFSXnODHQdQ58FgIJXIf+ppzPAU2HiOL989ZHIdF4KppTs5xSVx8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqaCmCVgnP1Zip1nW4tznVO78E81lWGwxFwTKV7WNPQwLt/Abb
	ba4KcpohiSNNblqxkq/eH9Y9AuPoG33eI5QNuD1SSzU523aalNvB7eApUvgbpg==
X-Gm-Gg: ASbGnctTRUbvJ8wRGzB6w31CrV1223AD+xdX9tcH9jvuuFJRGp6KlVyGMFvF2FRPTBJ
	YB1maZ8KPDAlyQx8EU3CCpOt+rc6lufR2H0xLen2NUpcrhTCj2wFTfuc6vY2uJdjhdZY34gHeY2
	dkUT+jtO0MN1Y1UAkNAt3s89oEOFhg8jgvjrR/OfEuEaTTWGNKFBAF12mKh+OXJxfjcVnsCtUsH
	y1V1HPCmsow8Y4K5jpPd45DKXdD75Q+VyAHt9QPFF68fkF+Ik3+fC2V6B7OTKfHDoMBeAPL9DAp
	VIE1Eb2WtvZK5fOOaRYW0eeVb9W/t2lW2lIAECYIVIcMQa6kl6zSgMJS4Xxg3X4mPGn2QGWqlY6
	fqnxaffO1iPCed49CAebarb9uRRWI3Iaa1ZQ=
X-Google-Smtp-Source: AGHT+IF3Hgmt+pDq/zr4rnCL9F6hG748sWYeEntYhWQ9Efg8PNAWivYsb0rz5FDNn2ZWYhpuHVtukg==
X-Received: by 2002:a05:6512:acc:b0:55b:9045:ec5e with SMTP id 2adb3069b0e04-5625f535a6amr3628737e87.18.1757409822884;
        Tue, 09 Sep 2025 02:23:42 -0700 (PDT)
Received: from foxbook (bfg216.neoplus.adsl.tpnet.pl. [83.28.44.216])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5680c4243e4sm402498e87.27.2025.09.09.02.23.42
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 09 Sep 2025 02:23:42 -0700 (PDT)
Date: Tue, 9 Sep 2025 11:23:39 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Niklas Neronin <niklas.neronin@linux.intel.com>
Cc: mathias.nyman@linux.intel.com, linux-usb@vger.kernel.org
Subject: Re: [PATCH 3/7] usb: xhci: improve Stream Context register
 debugging
Message-ID: <20250909112339.032b4671.michal.pecio@gmail.com>
In-Reply-To: <20250903170127.2190730-4-niklas.neronin@linux.intel.com>
References: <20250903170127.2190730-1-niklas.neronin@linux.intel.com>
	<20250903170127.2190730-4-niklas.neronin@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed,  3 Sep 2025 19:01:23 +0200, Niklas Neronin wrote:
> Improve the debugging output for Stream Context registers in the xHCI
> driver. The Stream Context registers consist of the following fields:
>  bit 0 - Dequeue Cycle State.
>  bits 3:1 - Stream Context Type.
>  bits 63:4 - TR Dequeue Pointer, is 16-byte aligned.
> 
> Instead of printing the entire 64-bit register as a single block, each
> field is now printed separately. This approach enhances the readability.
> 
> Remove xhci_dbg() in xhci_alloc_stream_info(). A detailed trace message is
> printed after xhci_update_stream_mapping() call.
> 
> xHCI specification, section 6.2.4.1.
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
>  drivers/usb/host/xhci-debugfs.c | 16 ++++++++++------
>  drivers/usb/host/xhci-mem.c     |  1 -
>  drivers/usb/host/xhci-trace.h   |  5 +++--
>  3 files changed, 13 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/usb/host/xhci-debugfs.c b/drivers/usb/host/xhci-debugfs.c
> index c6d44977193f..35398b95c5a2 100644
> --- a/drivers/usb/host/xhci-debugfs.c
> +++ b/drivers/usb/host/xhci-debugfs.c
> @@ -521,6 +521,7 @@ static int xhci_stream_context_array_show(struct seq_file *s, void *unused)
>  	struct xhci_ep_priv	*epriv = s->private;
>  	struct xhci_stream_ctx	*stream_ctx;
>  	dma_addr_t		dma;
> +	u64			ctx;
>  	int			id;
>  
>  	if (!epriv->stream_info)
> @@ -533,12 +534,15 @@ static int xhci_stream_context_array_show(struct seq_file *s, void *unused)
>  	for (id = 0; id < epriv->stream_info->num_stream_ctxs; id++) {
>  		stream_ctx = epriv->stream_info->stream_ctx_array + id;
>  		dma = epriv->stream_info->ctx_array_dma + id * 16;
> -		if (id < epriv->stream_info->num_streams)
> -			seq_printf(s, "%pad stream id %d deq %016llx\n", &dma,
> -				   id, le64_to_cpu(stream_ctx->stream_ring));
> -		else
> -			seq_printf(s, "%pad stream context entry not used deq %016llx\n",
> -				   &dma, le64_to_cpu(stream_ctx->stream_ring));
> +
> +		if (id < epriv->stream_info->num_streams) {
> +			ctx = le64_to_cpu(stream_ctx->stream_ring);
> +			seq_printf(s, "%pad stream %d: deq %016llx SCT %llu cycle %llu\n",
> +				   &dma, id, ctx & TR_DEQ_PTR_MASK, CTX_TO_SCT(ctx),
> +				   ctx & EP_CTX_CYCLE_MASK);

That SCT could benefit from decoding to human readable form,
but AFAIK the driver currently isn't using it anyway, so it
doesn't matter very much.

> +		} else {
> +			seq_printf(s, "%pad stream %d: entry not used\n", &dma, id);
> +		}
>  	}
>  
>  	return 0;
> diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
> index 2a414dee7233..9520e7c6e774 100644
> --- a/drivers/usb/host/xhci-mem.c
> +++ b/drivers/usb/host/xhci-mem.c
> @@ -676,7 +676,6 @@ struct xhci_stream_info *xhci_alloc_stream_info(struct xhci_hcd *xhci,
>  			cur_ring->cycle_state;
>  		stream_info->stream_ctx_array[cur_stream].stream_ring =
>  			cpu_to_le64(addr);
> -		xhci_dbg(xhci, "Setting stream %d ring ptr to 0x%08llx\n", cur_stream, addr);
>  
>  		ret = xhci_update_stream_mapping(cur_ring, mem_flags);
>  
> diff --git a/drivers/usb/host/xhci-trace.h b/drivers/usb/host/xhci-trace.h
> index 8451e9386aa9..f6a2b4cedb8d 100644
> --- a/drivers/usb/host/xhci-trace.h
> +++ b/drivers/usb/host/xhci-trace.h
> @@ -329,9 +329,10 @@ DECLARE_EVENT_CLASS(xhci_log_stream_ctx,
>  		__entry->ctx_array_dma = info->ctx_array_dma + stream_id * 16;
>  
>  	),
> -	TP_printk("stream %u ctx @%pad: SCT %llu deq %llx", __entry->stream_id,
> +	TP_printk("stream %u ctx @%pad: SCT %llu deq %llx cycle %llu", __entry->stream_id,
>  		&__entry->ctx_array_dma, CTX_TO_SCT(__entry->stream_ring),
> -		__entry->stream_ring
> +		__entry->stream_ring & TR_DEQ_PTR_MASK,
> +		__entry->stream_ring & EP_CTX_CYCLE_MASK
>  	)
>  );
>  
> -- 
> 2.50.1
> 

