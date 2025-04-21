Return-Path: <linux-usb+bounces-23261-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C846A953AC
	for <lists+linux-usb@lfdr.de>; Mon, 21 Apr 2025 17:41:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6724B188B981
	for <lists+linux-usb@lfdr.de>; Mon, 21 Apr 2025 15:41:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C008D1DE4DB;
	Mon, 21 Apr 2025 15:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="tUAItBqF"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3BDA1DE3A4
	for <linux-usb@vger.kernel.org>; Mon, 21 Apr 2025 15:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745250099; cv=none; b=kWIlg+zdHS6ttWMesDf5YAEXv9SuZZkbiLF2mAXx/K/LGo9g4hneLYWr/JZUgL60hiayWLT39bXW35NC2dvOL388POvlVVfNL5GeTMCoM+gYyrzHmTku7moMhHaN45b5rwiWJBpl7BGl1dbBxj+Rgo1WYbcNJLNytimOUFPmFzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745250099; c=relaxed/simple;
	bh=PQa09r6j/8ooGdQtXiPa1g4Vr9JUS1TpaWAV/y+J4Ho=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ecUjUNPPofLz4zQbq238BpvvEokrcnidYYgdKntZ+GnQ1FhghA9//KLO86ebFaGny19lvK/8PE0SkdUa5PtSxsjty8eFqcegeev+h/21nCCEYDCyEQroybGTcqhznTX5DAA3QUjB8d1hjKwvil0/r35Rnhsvi6DIm2CNemebMD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=tUAItBqF; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7c560c55bc1so411563185a.1
        for <linux-usb@vger.kernel.org>; Mon, 21 Apr 2025 08:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1745250096; x=1745854896; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4TPkLFjyaQsZeuebMek2/SMUS9oNfyPtxNemBHcNa+4=;
        b=tUAItBqFLj1rflLXyQlEur7uCzQbBhXctYAU53fLNMR+mmy+DJTVw6Cv2ZCFeAknio
         xpgFPJGujd8LMQTDW8Wzz1e0BHmqvh0iwJC877FD/icOUeyhtFyAv0pZmA+npjU7rV5F
         1t7xaQ/RdCfROf1OgXvHAzaJ5pSsxXoX2Mz+fdhbSXZxp1umx9CqOl1umj7rc/pBCsXX
         ew80mQ9mh/sjmwCMt4XknZKD4cePNTHEMssMvxp8jMTL/Cd3wKe+vGUXf4Z9/XEUTd8j
         atHAoWUEY1l/wKNTR4GXv1cq7NOyUhogXGkl7ej/lygkDBb/8zemeCGpytcsq9mI65hi
         uyYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745250096; x=1745854896;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4TPkLFjyaQsZeuebMek2/SMUS9oNfyPtxNemBHcNa+4=;
        b=fy+XjBsA0AZD67AfX4InGi26oL72jyn0nhSgTxaR+5U+kXuM20qXx3uUxUPr07MaLd
         MPFwbnUbFwZVpWi0HtNDuLGYmGMO7iiC7rjb4Y1r2hVOQfaF2DfUiOV8uOCbyFHU88ii
         ExjcoFGYumO8uG81um01XbEYH0elBd6Adfd96VSmS9ZIJs3KKYE5JHDODQKrua4K+dAm
         4ODIOiQih18DjDL9tGdA4art5tzrF2BL35R+udZKZCNEKPTZSExMYuFinCxFtH2mqrgL
         b4xR/4C+sThdgicxpojb9uQ8CsOUxkGRaPJz7buC8Rqr2GOtso5HEE1GNT5j0v0Wqhtu
         jo0Q==
X-Forwarded-Encrypted: i=1; AJvYcCXTyNeaHwWG95pdgHfHtYc7FfqAPT0DXUvewaCD6KMS6t+JHB+X2ZsNWNsW4F8aUiPEVGl2Hf0ViWU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yze12O2O2zOJopfyTagoTaM57zrtr7CQOgxnVU1Q8TtWquQhgGu
	wT/tT6mfkmU8tUs3L4OaMSYnycJSaHHBlpDJZj2umVbWyjXFqE83ZCOLUSgPgg==
X-Gm-Gg: ASbGncuBtmAKLkLcItBSK9ZEUGp0pwcLyiCPG243OwVjN0nnflOJy98S+tqd5eaYnhk
	Ehl3TjEWVvgFpdCFsLxqM4G/MktsCsfMsUacthzKGDXdPFYyEPl5GrUh8IaeTHkEEmgTsw+xRCS
	9bSpxDxMCzWzpiwBOtgZEiuhdJ+PgukIt+aNILwM5Q2RctvvtRkG0mI/pPZC39kBLS0DEQAGJhl
	2mJjqYfWOPa6A7j82MmV1FpAQh9wB2X/vQU//4/rr8Gj8LxjddqLV+27t7nmAH7QZ2jKPGwz/pD
	BRoSaZLSVoL6MWb//b9jfCLs3lEhm01Dr1IkW/Oeor55H/LpuFBKkjql23o=
X-Google-Smtp-Source: AGHT+IFxk4QgWq+qBc70K4SqcUEOg6xHeTtZfd/Gn5+LywPh1UsOhJQ5xbD3fV49o91sTnL+bSml+Q==
X-Received: by 2002:a05:620a:4149:b0:7c5:3cf6:7838 with SMTP id af79cd13be357-7c92805dcd3mr1994536885a.49.1745250096433;
        Mon, 21 Apr 2025 08:41:36 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c925b4dc09sm434539385a.73.2025.04.21.08.41.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 08:41:36 -0700 (PDT)
Date: Mon, 21 Apr 2025 11:41:33 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: "Alexey V. Vissarionov" <gremlin@altlinux.org>
Cc: Jon Hunter <jonathanh@nvidia.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Uwe Kleine-Knig <u.kleine-koenig@baylibre.com>,
	Nagarjuna Kristam <nkristam@nvidia.com>, linux-usb@vger.kernel.org,
	linux-tegra@vger.kernel.org, lvc-project@linuxtesting.org
Subject: Re: [PATCH v2] usb: tegra-xudc: check ep and ep->desc before deref
Message-ID: <54fc8e1e-6d6b-4c4c-9ca4-164d24552477@rowland.harvard.edu>
References: <20250415174204.GB6814@altlinux.org>
 <79265b11-c23a-4e4e-b7c3-6cf5b89b9977@nvidia.com>
 <20250416095555.GB27292@altlinux.org>
 <6e0b8bb7-c9c4-4625-bad0-552dcad89ea0@nvidia.com>
 <20250416120000.GD27292@altlinux.org>
 <f17d63cd-14a0-44bf-af9c-358d2a36b69d@rowland.harvard.edu>
 <20250421150728.GA32725@altlinux.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250421150728.GA32725@altlinux.org>

On Mon, Apr 21, 2025 at 06:07:28PM +0300, Alexey V. Vissarionov wrote:
> Good ${greeting_time}!
> 
> On 2025-04-16 10:13:05 -0400, Alan Stern wrote:
> 
> 
>  >> +	/* trb_phys_to_virt() dereferences ep; check it here */
>  >> +	if (!ep) {
>  >> +		dev_err(xudc->dev, "unexpected NULL pointer: ep\n");
>  >> +		return;
>  >> +	}
>  > Is this condition something that is totally under the kernel's
>  > control? That is, is ep always passed in by a driver and there's
>  > never a valid reason for it to be NULL?
> 
> IIUC, the endpoints are reported by the device. But the device
> may be something like STM32 uC with malicious firmware.

That doesn't matter, because the code you are changing doesn't run on 
the host.  It runs on the gadget.  If a gadget with malicious firmware 
crashes, who cares?  It would be a good thing, not a bad thing.

Besides, the condition you are testing for, namely !ep, can never happen 
anyway.  Here's why:

This routine -- tegra_xudc_handle_transfer_completion() -- is called 
from tegra_xudc_handle_transfer_event() in the case where comp_code is 
TRB_CMPL_CODE_SUCCESS or TRB_CMPL_CODE_SHORT_PACKET.  Either way, 
comp_code will be different from TRB_CMPL_CODE_BABBLE_DETECTED_ERR, so 
the code immediately preceding the function call will already have 
dereferenced ep.  If ep is NULL, the system will crash before your new 
code is executed.

>  > Then there's really no need for this check. In real life it
>  > will never trigger.
> 
> With real devices. But ready-to-use STM32F103C8T6 boards are sold
> for only 10...15 CNY, so one would need only to write a firmware
> and to flash it in the board using 20 CNY program-and-debug tool.

Do those boards run a Linux kernel?  If they don't then they won't run 
the code you are changing, so your statement is irrelevant.

>  > Of course, if it is reasonable for ep or ep->desc to sometimes
>  > be NULL, then the checks should be made. But if that were true,
>  > I don't know why you would call dev_err().
> 
> This was suggested by Jon Hunter on 16 Apr 2025 08:43:58 +0100 and
> I've agreed that would be wise.

The more I look at this, the more this change seems unnecessary.

Alan Stern

