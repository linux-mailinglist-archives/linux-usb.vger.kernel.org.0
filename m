Return-Path: <linux-usb+bounces-28293-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D2752B85B5B
	for <lists+linux-usb@lfdr.de>; Thu, 18 Sep 2025 17:43:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4EC5A3B6C19
	for <lists+linux-usb@lfdr.de>; Thu, 18 Sep 2025 15:40:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F3BC31065D;
	Thu, 18 Sep 2025 15:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O+NQbqf2"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA30A313E01
	for <linux-usb@vger.kernel.org>; Thu, 18 Sep 2025 15:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758209925; cv=none; b=qY6Wqvw4+W9pZGaMENo4D3HSoXb6XPs7wx4OMG7dtxm9lt31FyZw9J8Pp1mu7Vr7zHE9fanG0+4/2ggV/10ZPWg/ko7jDlyGIUgCw9jq0lgCxeIdnbJaekicMPRs6ydg9iOP8pMrgyn2dwkahclAKymfKO1QzzVn2CWG/Xn9JLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758209925; c=relaxed/simple;
	bh=WXZzoEkr5HMQOA3/Bzjsdzdf1qJeWiNkpcYemh5e3Vk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=F30PYflsnLUxWUc/WyhVHmPr/b7lEdd53dY9XK6JdcAW5kdVFEqncsRSvwQfkuZjdtuIYhz4Jf6E2t67RyxU02fgMPQNf/bmH6RYYYll9HWT7KktP5VsCbtqYoZ9Gi60kOvts4wFnayHYoGwtcXD/wFo6AL1gBdCedBf8h0NmV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O+NQbqf2; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5688ac2f39dso1398265e87.3
        for <linux-usb@vger.kernel.org>; Thu, 18 Sep 2025 08:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758209922; x=1758814722; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8uU1Yqis+8TjWDixzlQWTPOERfCi/hGhUBKZOoxLfOA=;
        b=O+NQbqf2YVFVjjRoQoT4JMuMM7ya14jitHasgd7TTI2shbA83BRnpd9nF3NLGw4irk
         lnYdF/AznE1ACaoZCSuvSCV80vVb/TKqvrZoCQM7BwL/LnhwQmptvMnlnQhLWPRtoyWs
         iB3GJmHGh/J7oRD1C0DCGgk7Gt/CypHpUJCzvtk5zrlve+dGyOrNIaEtHS/aWxFSUpfd
         4i5iMsl9iWSqtpyp5s7aU7hFZ37CcQmfIaT07XVpOl7JoNM/wA8xI3fv/ZqrQp0S8w/E
         R8Cphnr5n0mzzWkDrdaHlqlLbECXAEK94Dn75qpGnqh6xeQVY4sbpagcndtbmEvOeK+4
         h24Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758209922; x=1758814722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8uU1Yqis+8TjWDixzlQWTPOERfCi/hGhUBKZOoxLfOA=;
        b=R6jYHgedZyBqB2kUweI6mmVjsN4zzGhV5Winva+XUWJFoxybuRW4ebKvdwVAecxWre
         LDCTmZTrvRdM8pyk2DAjbE50NEsS/0oOPyftQDn5fCWQm58G4HHybhNdJP055QUliwxt
         DPz+dh4gQZw1O+mXiaQGPUvhquge54/LOdTUjQshR7MXJAqKbIIjCzRFj/6wmiAmaOsy
         ESMbHhPIg9LNAM1pk2scO1gzyM2FCjTrWst6rlY+r6K74TP7ThzmkxTXCDck6j14Waf5
         sDTat+rcsupK/qFXLzdbwmEqxFl1M3NB+Nw/yWDrB0CbEc+6+oA/DJUz2zbzWStTHPUG
         AZaA==
X-Forwarded-Encrypted: i=1; AJvYcCUCWESVG29ZhRs7tpX4FV600WFHRMZ+zuzE9E50pmJHf6/SZDPPRGAY3Z3ol5k488cJcfLdjuHvdgY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7UAyp/NoC714UarWaNCbye8sJ85c0SB1B4M3X+hDzDrD98u66
	cOahAsseW6rZkXgcyZ4oHdRcPxqUhEwaHA03nZMz+8suqDaa9S66M21x
X-Gm-Gg: ASbGncvVrXWZN5yqsIV0v/0sNP52wHI/w6nc18QABnPtxbjpBXMuCzsokXiwjaqt6Dr
	BO8UQIXu6438mlI67aI6ncnJDpgHfC5L2ZbGVWWRdq9fCGypt7W3W8/8lw3OAALOUISyHl2l0Zl
	nrKZYIseAABkIks2tDi2InJTVM/fD/lDkiq0mEXN9mpadhk4hPxKfkQyY7AaDrZTsDpbCpWd956
	nOmmWNpNYLFuLmEpRrHC+V9jkA5++IGmhURi8/s4JTHG4fpKsfzAZWdOatrrokXRPnj3ZOLWw3x
	0GsZJFT/ddZ1/htzS9eXNiA+vUXEmjpDHnd9QpXbzy1DuwiiP0/6UfvPQSfIKtDykjBSQZcXWcj
	N3Ii+7u1M3KkuvtJiKDkzs3gX0fHGcCS6uCFp2hpJf2u5cKEO8aDK5g==
X-Google-Smtp-Source: AGHT+IGPk7ZNmXlXU2ixuYtToZHIHGFguajk9+7DwOwXUT5jca2TARiZv+la7RKAwfynRhSAjFV3bQ==
X-Received: by 2002:a19:6a12:0:b0:573:68fd:7ad2 with SMTP id 2adb3069b0e04-579e2131278mr36626e87.35.1758209921620;
        Thu, 18 Sep 2025 08:38:41 -0700 (PDT)
Received: from foxbook (bfg216.neoplus.adsl.tpnet.pl. [83.28.44.216])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-578a90a20e8sm733118e87.76.2025.09.18.08.38.40
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 18 Sep 2025 08:38:41 -0700 (PDT)
Date: Thu, 18 Sep 2025 17:38:36 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Guangshuo Li <lgs201920130244@gmail.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Wesley Cheng <quic_wcheng@quicinc.com>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH] usb: xhci: Check kcalloc_node() when allocating
 interrupter array in xhci_mem_init()
Message-ID: <20250918173836.0def4d12.michal.pecio@gmail.com>
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

This is a patch against some old kernel, this exact check has been
added in v6.16 by 83d98dea48eb6.

But it's missing Fixes and Cc:stable, so 6.6 and 6.12 were left broken.

>  	ir = xhci_alloc_interrupter(xhci, 0, flags);
>  	if (!ir)
>  		goto fail;
> -- 
> 2.43.0
> 

