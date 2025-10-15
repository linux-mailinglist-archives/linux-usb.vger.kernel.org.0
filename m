Return-Path: <linux-usb+bounces-29309-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B01BDC474
	for <lists+linux-usb@lfdr.de>; Wed, 15 Oct 2025 05:08:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A31754FB395
	for <lists+linux-usb@lfdr.de>; Wed, 15 Oct 2025 03:07:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E92AE296BA4;
	Wed, 15 Oct 2025 03:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="O9YSI76P"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6CA426B2D2
	for <linux-usb@vger.kernel.org>; Wed, 15 Oct 2025 03:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760497655; cv=none; b=Ty17PGVg/K6F/6y1bdBEmbkV8kW+VafKEEzcq6e/hEbHzZXTJGNVNQHVUvLRftfK5FaGwIHVEygHInopspYBTkgUoBMCC7PtV3g9IO75a6M6P5sdmJJJ1bRgkI2cv+Vvp/HtMidvgoEA+QjYrSSdZMohwx+XcK0jDjUpIopltoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760497655; c=relaxed/simple;
	bh=4FztB+wmWkCqTcyqk43FQ/ijvv8lF01IQlzMj1iMpxg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dyAdVjoqbQ+UDNAD1iRE0Vwol+Y8Ky1jSG9V8qtkc7Q6VlJnTtJaZbLmDO4ldkmqo2ONXGTaDMpcz+LqkRNe+F8th0p5Gxw5Ct6497OKpohJip/0kCffMjVaasYc5X6Y8bJcDBdKMuE9uvENJfjwnpA+2WHUes25G1ePaxg28Oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=O9YSI76P; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-78f75b0a058so78498736d6.0
        for <linux-usb@vger.kernel.org>; Tue, 14 Oct 2025 20:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1760497651; x=1761102451; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LYOi/uzG+pxWc7qB8Kx+PDOI9ywodBDgq0X5/pl/onc=;
        b=O9YSI76PLg8LLQyzOFgvg+LLyDtXQgW8tIIETX0va07hEiNvIfaX35zJl390Syw37a
         /O/DfQULKVokt6wunQO1Ke5s9mQBN4sNC8iapXCW/SxirK9FTVBbiDYvgbUN27jVFXZ/
         ZdHNhjGaMckLLMGBhYz3bzIEufzuphoseo+ZoUntujgvxOwB1K/bg7uwqXaTi2S6J/tL
         EgdZBKr1lOIia5qwiN9OvftNoEliJlO/BYLzUTU2YiGT/8kEfN93sz0H/JsFEsHIgR4S
         FW32L/7yvKxKEiqJck03D1R9ThgrGBf3tPAO35pYwgRBMTq3iAtzr9duanHjsnVqPlGc
         5nMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760497651; x=1761102451;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LYOi/uzG+pxWc7qB8Kx+PDOI9ywodBDgq0X5/pl/onc=;
        b=IWS77iFg3EQ2mpvxSCf47VFWzO351QCfXJF7YLq56DIOhdAi3DN3kcUmhEEAPk/4X9
         6AfAy/dPri0nOyUVIgr5li/jdB27g27UscmcVhqriqemuK9qV2u787x9zKTtt5da5yQn
         F+dnSvC+alKjZGT0F6vLMP9k1G40lM1JagL3efOCT7iX3HJhErqmlJbVPYnYKDlx5lqE
         Hpdc6eROnpLZTZ0J/tX3x/+vVEj/QdtmJq32iGjMlxUCHkr+Mn54/nylmcNIZZ6An9aX
         1xNIm9Qb6b1OuSPBxox2wJrQ5tQkHF1vMVDe7wTvW1bq3F1kL9wrkmjPp6uG6T52GOUO
         EsmQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJJ/izB4QkByjbCkYA6fRcgk2wP/7osIT8I76GqFvFLkIqu4vaWmpCl5xamL6ROeCx+sSMtsiUbdo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyeSYZvbHRile2rsZL0oLPNzoWIgvD7wCsetix+k39Fyz/uB6FO
	hB01MZ2b+wXK/JruuI7DAR88babzF9VkFNYTITSz3NRVTCB3xjUCiclbN5IbxqO+Aw==
X-Gm-Gg: ASbGnctXCrn+7YOHaTCr3yH51y83veHzch1ekmiuakqAdOQ+/x4c0dMG7Fb1nV3qg4d
	nQfxpHoez1XObHdTZYm1zC+RSqMh+qB4soQuJYVdcNnqg4AEYfzguDFzzcKUMcOLRaTp0t6Kx2d
	rwvGW1p9x/Al6OSEJiXgI1gtJPjwWH4YQE9oS1yNZZhuMZyLmlndDYtpmCOl42Z07SfhtLZhBi8
	YyzeW9gPcsuOJcTw+t8YIZsS4ynxGd8uk4eQ/I88XjurSBZmMm31D67SV3vxAVyWSnNetlGxUyu
	KjJwIe1P/P1WCREVONycQoX+kbBLrYx63qUVHTtrwUDKEM7cIY8q6+gi4ll0JSzQxqUU8ZdlC/7
	RB1FjgrXdfgPt8HKEy2lxbm5se6PRFNyp9vr4MZmWj1r7hDyV
X-Google-Smtp-Source: AGHT+IFAjPLGiMuXqey8nUwdA4Iw0xkYkiAWc5b2GEtlEYT/1lGTfUT34pPAOluVQ9gpFjwEo2ePNQ==
X-Received: by 2002:a05:6214:2121:b0:782:3caf:668e with SMTP id 6a1803df08f44-87b2efa9a8fmr314904506d6.40.1760497651363;
        Tue, 14 Oct 2025 20:07:31 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d03:1700::9c4])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87c012b153dsm9788976d6.57.2025.10.14.20.07.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 20:07:30 -0700 (PDT)
Date: Tue, 14 Oct 2025 23:07:27 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ryan Chen <ryan_chen@aspeedtech.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] usb: uhci: Work around bogus clang shift overflow
 warning from DMA_BIT_MASK(64)
Message-ID: <c0d1dc65-6f55-40b9-bbfa-09e8639a28e0@rowland.harvard.edu>
References: <20251014-usb-uhci-avoid-bogus-clang-shift-warning-v1-1-826585eed055@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251014-usb-uhci-avoid-bogus-clang-shift-warning-v1-1-826585eed055@kernel.org>

On Tue, Oct 14, 2025 at 04:38:19PM -0700, Nathan Chancellor wrote:
> After commit 18a9ec886d32 ("usb: uhci: Add Aspeed AST2700 support"),
> clang incorrectly warns:
> 
>   In file included from drivers/usb/host/uhci-hcd.c:855:
>   drivers/usb/host/uhci-platform.c:69:32: error: shift count >= width of type [-Werror,-Wshift-count-overflow]
>      69 | static const u64 dma_mask_64 = DMA_BIT_MASK(64);
>         |                                ^~~~~~~~~~~~~~~~
>   include/linux/dma-mapping.h:93:54: note: expanded from macro 'DMA_BIT_MASK'
>      93 | #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
>         |                                                      ^ ~~~
> 
> clang has a long outstanding and complicated problem [1] with generating
> a proper control flow graph at global scope, resulting in it being
> unable to understand that this shift can never happen due to the
> 'n == 64' check.
> 
> Restructure the code to do the DMA_BIT_MASK() assignments within
> uhci_hcd_platform_probe() (i.e., function scope) to avoid this global
> scope issue.
> 
> Closes: https://github.com/ClangBuiltLinux/linux/issues/2136
> Link: https://github.com/ClangBuiltLinux/linux/issues/92 [1]
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---

Do you think you could instead copy the approach used in:

https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/commit/?id=274f2232a94f6ca626d60288044e13d9a58c7612

IMO it is cleaner, and it also moves the DMA_BIT_MASK() computations 
into a function scope.

Alan Stern

>  drivers/usb/host/uhci-platform.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/usb/host/uhci-platform.c b/drivers/usb/host/uhci-platform.c
> index 37607f985cc0..f532d3a0acbf 100644
> --- a/drivers/usb/host/uhci-platform.c
> +++ b/drivers/usb/host/uhci-platform.c
> @@ -65,16 +65,16 @@ static const struct hc_driver uhci_platform_hc_driver = {
>  	.hub_control =		uhci_hub_control,
>  };
>  
> -static const u64 dma_mask_32 = DMA_BIT_MASK(32);
> -static const u64 dma_mask_64 = DMA_BIT_MASK(64);
> +static const bool use_dma_mask_64 = true;
>  
>  static int uhci_hcd_platform_probe(struct platform_device *pdev)
>  {
>  	struct device_node *np = pdev->dev.of_node;
> -	const u64 *dma_mask_ptr;
> +	u64 dma_mask = DMA_BIT_MASK(32);
>  	struct usb_hcd *hcd;
>  	struct uhci_hcd	*uhci;
>  	struct resource *res;
> +	const bool *of_data;
>  	int ret;
>  
>  	if (usb_disabled())
> @@ -85,11 +85,11 @@ static int uhci_hcd_platform_probe(struct platform_device *pdev)
>  	 * Since shared usb code relies on it, set it here for now.
>  	 * Once we have dma capability bindings this can go away.
>  	 */
> -	dma_mask_ptr = (u64 *)of_device_get_match_data(&pdev->dev);
> -	if (!dma_mask_ptr)
> -		dma_mask_ptr = &dma_mask_32;
> +	of_data = of_device_get_match_data(&pdev->dev);
> +	if (of_data && *of_data == use_dma_mask_64)
> +		dma_mask = DMA_BIT_MASK(64);
>  
> -	ret = dma_coerce_mask_and_coherent(&pdev->dev, *dma_mask_ptr);
> +	ret = dma_coerce_mask_and_coherent(&pdev->dev, dma_mask);
>  	if (ret)
>  		return ret;
>  
> @@ -200,7 +200,7 @@ static void uhci_hcd_platform_shutdown(struct platform_device *op)
>  static const struct of_device_id platform_uhci_ids[] = {
>  	{ .compatible = "generic-uhci", },
>  	{ .compatible = "platform-uhci", },
> -	{ .compatible = "aspeed,ast2700-uhci", .data = &dma_mask_64},
> +	{ .compatible = "aspeed,ast2700-uhci", .data = &use_dma_mask_64 },
>  	{}
>  };
>  MODULE_DEVICE_TABLE(of, platform_uhci_ids);
> 
> ---
> base-commit: 877c80dfbf788e57a3338627899033b7007037ee
> change-id: 20251014-usb-uhci-avoid-bogus-clang-shift-warning-a80166a24472
> 
> Best regards,
> --  
> Nathan Chancellor <nathan@kernel.org>
> 

