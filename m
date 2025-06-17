Return-Path: <linux-usb+bounces-24833-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4DEAADCF92
	for <lists+linux-usb@lfdr.de>; Tue, 17 Jun 2025 16:24:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7B499178D61
	for <lists+linux-usb@lfdr.de>; Tue, 17 Jun 2025 14:18:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 703CA2E9737;
	Tue, 17 Jun 2025 14:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="oJ3WvqhK"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B09B2E265D
	for <linux-usb@vger.kernel.org>; Tue, 17 Jun 2025 14:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750169579; cv=none; b=XKBCPtDy3egIa3WLlircHg+n7t3vCFDx3cAqrTTc/zP22/imwVCiJaGJP/odUpwzqABWkjqsiJd7QLBb0ahGR2+xstdvdpIqci9BynYIwI0KZxjj9QevPVjdJBUlWCqNuLGTrik57entTPQeTl5Ly5/u5g1RBe0rolOx4Zn8cDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750169579; c=relaxed/simple;
	bh=iXFWqOrb+/Jnfho8Pu3WTaW8yur5lMtfl0eVlqQfmrk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z0Or5PstIXx19jmn3LPKM18ZYmTg79WqttOvIT8mQ1hlj/3VdO8lZDqi3JXGYpT/nrCVGgYEi2jf4HWb5g7p0eHryFMTDQH0Dy2z1ymiq0t0PhDMSRELeWFHYMHV2REJyeZMJruADhx81r9VLKn4hG/m2PKnhSUkLFRtCqTm98g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=oJ3WvqhK; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4a6f0bcdf45so71832661cf.0
        for <linux-usb@vger.kernel.org>; Tue, 17 Jun 2025 07:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1750169576; x=1750774376; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0s0DAhwLG2vmOgwqQDSJ2RWGZLNBfRIYPMMOb2htwqc=;
        b=oJ3WvqhKK0jE8ek3aFENWu3zZqU2Dbjs9cC1AncuQ5UIUfgIoW1pVISayxbjS109kM
         g/krkRI/uQmNyyJ4ceFFdO9/n+TLU9LOPoqXI/ugl364xGwpIR38zA1Rap0/zR6r4Zuz
         8Rq6I4k+XyScjdgN8n/mMe0bzYxD2biBJwYp1FwuNoHgsmU1aDwmV0649Rk5H8xto7HT
         9VD9NL+4Td5SW/zCHqzFdg4AO+Hi+E1y6i6/CO4Qf+FoXUTCWFUms8m0s84WU8hu3SfS
         hSoxHZ9/3zkxRst24oPO+G6PaxclZeoA6Y2NPh/EnPYejz8WrT7jbiffZ2nS4Vcu9NXN
         VpOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750169576; x=1750774376;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0s0DAhwLG2vmOgwqQDSJ2RWGZLNBfRIYPMMOb2htwqc=;
        b=jQBvYsYH5n0TwZK5Lum0cprFOySrY58mRb/S27IAxi64jeKsniln/2MaOv9kQzI5D6
         VEeZPvaMzcc7Il2A/YvoU038ckhMFcAdkTbrXNzzTR9767nPqEj20o4YSV8Z9PSsQ+jm
         H2uvHqv+vTjuJg9Vf2zzHd5akKwXhhJMPpN6UoIgj97Bi+zR4KRbXwyiU9crvDKxOSFr
         cxKk4GTctdsqhQfHodCqJKnb0MSDVfHh8fZ7+mbeU+qljQB38sTNynIVCcjpxTHb2eNK
         fkk5UL4bguNGrC54Pt1JxEWc4pRPU1TOpg58XWPBNJN4HwTnbOwwa3bV/4MCv9uK/Kv3
         1CUg==
X-Forwarded-Encrypted: i=1; AJvYcCUpPz24i8UGrbUDCsXgJIo5/hEjApjdl/oSbHYxElRjMgQhUZhviEXhyYCAlhh96/YmPYF6Ag1egA4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYM8hkgYvZclOJtv71U7ex29D9MwFTOBvedyXybdH12RPNs2Of
	921r2ZuFvXRCbuLBpXr2WJZfBl3bjbH2MzQRbNI3kVpUL5Dat4SUdiB7U3aYgJqUbg==
X-Gm-Gg: ASbGncvSJYVGIEu/QhUQVNsWJ1owNw58TMxScxFRuvNyMb0/12Gq7QFF+ka3KXfbL0Y
	fXFZIez1232fiH4lW/2k7+IgRvrYsi2sR2knDOzXqMXJR6+subJy0blg+9/wZPKJAvigq3SXGbK
	0M5Ao9SgASWYsuPZk6YF/Ncx1lX3N6dA+eNOcuGbkSucPfOI/rHRsMf6UXlRmgIzOvFs0z5gbOm
	qRMuU57lFWAEI3YE5qllCVNCger0V28f4gZdkvwoqR6GYb4EXDlcq8hnCndRYq3l5K4FdQAA0Kz
	sMamNFEE+QkOEtIc0ePVZJc+SYGvGclmQVGDg/tHwyVtAda+lk6pczrvXc82sIi3RVYf+BcSr02
	C3eYG
X-Google-Smtp-Source: AGHT+IGGcniDBP3SWlANTec+HJ71BhVMTML0YMUxfK7tDS3/o0KB69JVRk+rjJDhnEFWiDvo2nce4Q==
X-Received: by 2002:a05:622a:1309:b0:4a4:330f:a796 with SMTP id d75a77b69052e-4a73c62dd7amr230360571cf.28.1750169576347;
        Tue, 17 Jun 2025 07:12:56 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a72a2bf125sm61138851cf.13.2025.06.17.07.12.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 07:12:55 -0700 (PDT)
Date: Tue, 17 Jun 2025 10:12:53 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Chen Ni <nichen@iscas.ac.cn>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: ohci-spear: Remove unnecessary NULL check before
 clk_disable_unprepare()
Message-ID: <0a36b344-33dd-47ed-8140-76b9535e34ea@rowland.harvard.edu>
References: <20250617042050.1930940-1-nichen@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250617042050.1930940-1-nichen@iscas.ac.cn>

On Tue, Jun 17, 2025 at 12:20:50PM +0800, Chen Ni wrote:
> clk_disable_unprepare() already checks NULL by using IS_ERR_OR_NULL.
> Remove unneeded NULL check for clk here.
> 
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
> ---

Acked-by: Alan Stern <stern@rowland.harvard.edu>

>  drivers/usb/host/ohci-spear.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/host/ohci-spear.c b/drivers/usb/host/ohci-spear.c
> index d7131e5a4477..6843d7cb3f9f 100644
> --- a/drivers/usb/host/ohci-spear.c
> +++ b/drivers/usb/host/ohci-spear.c
> @@ -103,8 +103,7 @@ static void spear_ohci_hcd_drv_remove(struct platform_device *pdev)
>  	struct spear_ohci *sohci_p = to_spear_ohci(hcd);
>  
>  	usb_remove_hcd(hcd);
> -	if (sohci_p->clk)
> -		clk_disable_unprepare(sohci_p->clk);
> +	clk_disable_unprepare(sohci_p->clk);
>  
>  	usb_put_hcd(hcd);
>  }
> -- 
> 2.25.1
> 

