Return-Path: <linux-usb+bounces-29995-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 57BBEC2A980
	for <lists+linux-usb@lfdr.de>; Mon, 03 Nov 2025 09:40:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1844C3A744F
	for <lists+linux-usb@lfdr.de>; Mon,  3 Nov 2025 08:40:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01A502E091B;
	Mon,  3 Nov 2025 08:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="br2j3Pyr"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D6E2D77F7
	for <linux-usb@vger.kernel.org>; Mon,  3 Nov 2025 08:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762159245; cv=none; b=h9IASfSdhRl4WycLehUO8TWM5P+Gox3kT+easEioO/wFvffdX86xR4e929QWU1VBKsOnEGPCRvuNPnnhYlfMyb7X6urorfZwH1SweU9pORmGrDIWR6NI7hLXUydUlVzzDdRdFKdQP/MBGi8Fm6P2iBGr/FUOzMyQMDtqXSgGkRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762159245; c=relaxed/simple;
	bh=29HFx4zP5TuqH7uQu/O1fuNnD/tVpYqYDYodAqZeBmE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e9o4MYdjeSPnLbqyW7eWj0a5fpyMRvQbvWBiXVtcCMx9Wn9DxhvHwhJgUHKNNE0kKRfINt2G3MGC4251ufFsQ2TCLK+GicV04EY9jkBVbD3eXYl6h85OLoA+2n8EudjVCA2Je9y+PfsEWUug/jksKMPEQLXR97ssQBIlhoe4QIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=br2j3Pyr; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b7155207964so62845766b.2
        for <linux-usb@vger.kernel.org>; Mon, 03 Nov 2025 00:40:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762159242; x=1762764042; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7rGUbe9xbBxnFtXv4tRwbVKKr3k/buEiL+8Ja5DgwC4=;
        b=br2j3Pyr+iIwYtFqWffaXsnBuGo9C+qM0u+YB+Ng1oj0wLL3Y4bRjOa/10dW/R3hN4
         lKQMfM5V1Q22cAldAQhg3Kfk+6azI3fhh/Rr7AoB1hcFE3gy9ka0WJ83XL7kqDO77yMn
         yMNXLHuYB1mFy+4scZrINNdUJJS9YcjhHQSGGeoOazwvloQAHrc179We4f3zhVAWW3c3
         fpOnjZiIcXElTm657+YKosK9ebQ7TaK14jcBEyQYaUlf2qwIs/Y4+/FtlWYzHABNqf+8
         ucVoQ1Yt3lhAYV3WvOYPEoPKdIGZjKrOIiOO1GzHilhEhkmTCfYUwnpoUlV+CL+y8WAS
         j/QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762159242; x=1762764042;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7rGUbe9xbBxnFtXv4tRwbVKKr3k/buEiL+8Ja5DgwC4=;
        b=E4eGcx+PXAKWPt3dkYl/PcpiSVb/K4Aqq4zMIOM2VmxILiZ6ZBmUsP5vlvlATAI6uD
         XsotLy+/tf3vbZYum7kIDXTWvatSQ8drFAvCJxhrtO7w11Gn7f/yyCkj+o+keTRorpVZ
         5C8eGUC1dl3tRwKAwC9hhoVPy8gwPjk7QVmFvjcVSb5KH2iuEMO9Tb6PdeaLpnitjatV
         mZsNNG2K6crWq9fPEWeTJ70Lzt+Ly7BTObguOanOt6w2PJggh1SikuzwCL/2mVoEPmhn
         VdZLDl+rp/UDcGgmg9vX13pgohC3nx3kipr3mK8DEiY8RmEjoCKmmKLcE7J2iird8eMr
         6cHg==
X-Forwarded-Encrypted: i=1; AJvYcCWM1JejSHME4I7GhneQ5HDcJrDd7/UlsbmLuX9YaJseWH3FEJ/nUFdz7fXV5oV97EGZnZM/OzALO1o=@vger.kernel.org
X-Gm-Message-State: AOJu0YwcU2yWyeAZajCfU9VhnUGTPOolPis1ms1xZrkDXw0cWc8u4SZ7
	SPXFJVhsx7albFR0lo7FJATWEE0KVLOK2QPqk+1Cta95aLhstB/8s2Lo
X-Gm-Gg: ASbGncveqeGir3SihKDYRG5Gk9QLgkIP6i8M0MvQV7mqg4C1jHZHAhmA08AnUM2PNY5
	bsRb+EFdwhoa9mmJnCQdvMInD/XbbZos/GKL3ND/KtuWHIh+VTXMxblhQBKfM59ThKDOTFHVNcX
	NCNdjn1ieF4xu8ua3qlf2aVZ8KghyAwVCQlXSYkMaT3ssTh5CD2g434+H8BoK2BHSERtmRPT+3l
	U2xf2/YFqWRBvBfGBJwrpG4EnESR7ernHvwp/NFWt4+CLarGY5W1jiCBIBWZu5LDe5E/xRVeNTU
	kf6MG0g4ocmV36P6eKoXl2Id/ufdJr1YVND1iFA5uvxj/BNhcGmvJXlCulGTHAekxi1qHON0Khk
	Y3+/DgqMzSYdmhyJ6d1JZs3mfoabX5UzXDru54AJ9LhRa4Qz5rf4Y5KvJ2jRG0Xnjy0AF0mi5E5
	yL2D7zLFrXSn95h8zFY9auzag=
X-Google-Smtp-Source: AGHT+IFpmxasMMQzw06+y85COr1wqLp8qW16dzYeDOlLZQvniK+scWKjZBeCw5HSwxFEJ0bUijUNZw==
X-Received: by 2002:a17:907:968b:b0:b47:2be3:bc75 with SMTP id a640c23a62f3a-b7070848658mr1145584866b.60.1762159241950;
        Mon, 03 Nov 2025 00:40:41 -0800 (PST)
Received: from foxbook (bgu110.neoplus.adsl.tpnet.pl. [83.28.84.110])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b70779e45a2sm967489266b.31.2025.11.03.00.40.40
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 03 Nov 2025 00:40:41 -0800 (PST)
Date: Mon, 3 Nov 2025 09:40:36 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Cc: Guangshuo Li <lgs201920130244@gmail.com>, Wesley Cheng
 <quic_wcheng@quicinc.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] usb: xhci: Check kcalloc_node() when allocating
 interrupter array in xhci_mem_init()
Message-ID: <20251103094036.2d1593bc.michal.pecio@gmail.com>
In-Reply-To: <20250918130838.3551270-1-lgs201920130244@gmail.com>
References: <20250918130838.3551270-1-lgs201920130244@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 18 Sep 2025 21:08:38 +0800, Guangshuo Li wrote:
> kcalloc_node() may fail. When the interrupter array allocation returns
> NULL, subsequent code uses xhci->interrupters (e.g. in xhci_add_interrupter()
> and in cleanup paths), leading to a potential NULL pointer dereference.
> 
> Check the allocation and bail out to the existing fail path to avoid
> the NULL dereference.
> 
> Fixes: c99b38c412343 ("xhci: add support to allocate several interrupters")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> ---
>  drivers/usb/host/xhci-mem.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
> index d698095fc88d..da257856e864 100644
> --- a/drivers/usb/host/xhci-mem.c
> +++ b/drivers/usb/host/xhci-mem.c
> @@ -2505,7 +2505,8 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
>  		       "Allocating primary event ring");
>  	xhci->interrupters = kcalloc_node(xhci->max_interrupters, sizeof(*xhci->interrupters),
>  					  flags, dev_to_node(dev));
> -
> +	if (!xhci->interrupters)
> +		goto fail;
>  	ir = xhci_alloc_interrupter(xhci, 0, flags);
>  	if (!ir)
>  		goto fail;
> -- 
> 2.43.0

Hi Greg and Mathias,

I noticed that this bug still exists in current 6.6 and 6.12 releases,
what would be the sensible course of action to fix it?

The patch from Guangshuo Li is a specific fix and it applies cleanly on
those branches. By simulating allocation failure, I confirmed the bug
and the fix on 6.6.113, which is identical to the current 6.6.116.

Mainline added an identical check in 83d98dea48eb ("usb: xhci: add
individual allocation checks in xhci_mem_init()") which is a cleanup
that has a merge conflict at least with 6.6.

The conflict seems superficial and probably the cleanup would have no
side effects on 6.6/6.12, but I haven't really reviewed this and maybe
it would be simpler to just take the targeted fix?

Regards,
Michal

