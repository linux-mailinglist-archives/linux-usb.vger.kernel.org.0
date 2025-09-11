Return-Path: <linux-usb+bounces-27924-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC9AB52D60
	for <lists+linux-usb@lfdr.de>; Thu, 11 Sep 2025 11:35:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 14A7D564EC4
	for <lists+linux-usb@lfdr.de>; Thu, 11 Sep 2025 09:35:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC5492EA46E;
	Thu, 11 Sep 2025 09:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="akpV0ZK1"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96B13207A32
	for <linux-usb@vger.kernel.org>; Thu, 11 Sep 2025 09:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757583300; cv=none; b=jmi0Q5v7EoUabNp7SfQ/5FRvi5+g9G9iSc1Z1v61OEXDzUnXdJFmv2IuGZnTkG+IPXuECyL95YAW/woKKscg1w/BlziTaWFzK+d5UXxF3Gz8/SHIhsZA5VMKYIamU/NRutNmouT/xDFpl6M/sSLaS3a0kwqJ+TnH987yB0uXJOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757583300; c=relaxed/simple;
	bh=r9s/EIxq3BZtkFCRMvtNk5enf8wPAReL7h341hOzFtc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jvWL99WAR6WQyUx73zkcXgzkUre4jOagxBGCmNTplUuDlMinp9iHVCOLa9YP1SNQAbeKu03zd7kOJCjb/U/oW4axfcw8izz0iWgINcvDFBznTpPzX9HCooDhjIzKE/eJFw7U00gFBjA7ON667YkQ4xb+MASkYtwz4q0bDwVo31I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=akpV0ZK1; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-55f6f434c96so497588e87.2
        for <linux-usb@vger.kernel.org>; Thu, 11 Sep 2025 02:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757583297; x=1758188097; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3VHJ3eLE2JTAdQD70ozvpzX40ebZs1KUNphDLr31u2A=;
        b=akpV0ZK1BdyMHy9mW3qf6Jwk7BvNykKxsYmKDeQ1Y46ZWcsO0qJLCcfMOt6ZSijneL
         EVe+/ceMFro4fHHEkxVUoaQV8vOx9W3qIK/Fk2ZvsM9uAhyoVa5/JH3xKWam7KScpNOE
         RProsu1JpqexOhRnxFa/m5r8la4hdgwPUGPVckzReF4/t4c/jDmPiMEuMDK1oCiFrCMO
         xrsQ+fpkGIcaFWcq8cT/s0q2zb4D9hpoyvN0vNZKx+7pwrQ7f8NisiARDZtKPxc0YMxA
         lxrHY5xEVdaCbmTHz8s+A+3sHZNf0zVuh+PC4RmpVmydUs6+34zHpIj1kVbFh4GIM3Ko
         eQyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757583297; x=1758188097;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3VHJ3eLE2JTAdQD70ozvpzX40ebZs1KUNphDLr31u2A=;
        b=ASPoIw5eUbzMjXObj5EZV3yOQ144UzuFoD5KI8aAmnWcf8VGhc9/4/1Z94IyTUruyW
         YZJcW/QIpNYO4AIO3iYFoyjmTNZELfZpMzy+upvrXbiBkQkGkg7C6D8kFd7HbBCjAyHB
         gJcsOJyS7y16MlxpZDWcs+HsUjy0NKGdIApj93me93/SB1GOZT/mpQFNfhVtrfFZCuVO
         q/xEhlDrp32HmgCa07KN5FTpwN28yUl1E0Lr30Y/PnKw9CUn5wavPRvuGcx+dAMUy61R
         aUM/98XBjgW297QEGPfPmA1R2p2no4eJ2XfKedeLc3tmJRBaOsjOPVr+AmOdPNovOK/Z
         R52w==
X-Forwarded-Encrypted: i=1; AJvYcCVtt2vcaNnsRWJwMH1IL3BZI2P+4jvVaVxjlp/Yf06sk5jcA7ksiUsUB0zk1lujaUPXObyMwAR/Xs8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzfcn/K3PJIty8Ii/48C+JU69HDdWgUOfa24NtmjHpRoEFUCX3m
	f140rnKyq3URzZ71lJ0yBqsxrTBVAUjoPldiy9h7wLIfOEsDWz8koqt8uRzGJQ==
X-Gm-Gg: ASbGnctTr3IFnhYf8X2t8g2C35XTs+8w+tq+b1x1vQGDO4/uy60Legas7o2hTsyqG2x
	IXBaCEiVhWZWa/3S9zzImvNYxFUAFLWjyLk51d/fi1mlKIl9DnAo3XBy489kGpVQHl7Wor8rOZB
	EsmoB0kdkFT0gOzp/VuLjQ3n/4GiS9TGML9iGr/T86M+D/jEft2N73vCrKhInTg1C06FNvXSWSW
	KJ6bSAWzuhfiO1T8Got5md4ZkqTQzLgbAVELaTGrxhAvNDaIMh/0Y8R9lt2O3N0UGSWzpig1MEP
	+RwQ+bXHFBPmQNijZAZ0ROQubK5OGEp4V0KRxxNaV14FjbSufcyHMwCJZ1Y5IpXc9OIGGqlDR6T
	3vKqr3WNknGYJU1jQpG9KsYKZxOrdpbvcKAc9FmmaacPrzg==
X-Google-Smtp-Source: AGHT+IGWr8b33ap8OrcCgPnda8UifHRVVytczREy6SvtgumPWIXHt7SSWVWD+QJDMReeIlxlWM13mQ==
X-Received: by 2002:a05:6512:23a9:b0:553:2c58:f96f with SMTP id 2adb3069b0e04-562603a3159mr6671973e87.1.1757583296292;
        Thu, 11 Sep 2025 02:34:56 -0700 (PDT)
Received: from foxbook (bfg216.neoplus.adsl.tpnet.pl. [83.28.44.216])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56e5cf2f670sm302008e87.36.2025.09.11.02.34.55
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 11 Sep 2025 02:34:56 -0700 (PDT)
Date: Thu, 11 Sep 2025 11:34:51 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Niklas Neronin <niklas.neronin@linux.intel.com>,
 mathias.nyman@linux.intel.com, linux-usb@vger.kernel.org
Subject: Re: [PATCH 2/7] usb: xhci: use '%pad' specifier for DMA address
 printing
Message-ID: <20250911113451.1f5e5ca4.michal.pecio@gmail.com>
In-Reply-To: <aMJ9PbOxn3CCuaYJ@smile.fi.intel.com>
References: <20250903170127.2190730-1-niklas.neronin@linux.intel.com>
	<20250903170127.2190730-3-niklas.neronin@linux.intel.com>
	<20250909115949.610922a3.michal.pecio@gmail.com>
	<aMAPkH5-4rLdmx_9@smile.fi.intel.com>
	<20250909224416.691e47c9.michal.pecio@gmail.com>
	<20250910075630.0389536f.michal.pecio@gmail.com>
	<aMJ9PbOxn3CCuaYJ@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 11 Sep 2025 10:41:49 +0300, Andy Shevchenko wrote:
> > -       xhci_err(xhci, "Event dma %pad for ep %d status %d not part of TD at %016llx - %016llx\n",
> > -                &ep_trb_dma, ep_index, trb_comp_code,
> > +       xhci_err(xhci, "Event dma %#08llx for ep %d status %d not part of TD at %#08llx - %#08llx\n",  
> 
> How is 0 will be printed with %#08x?

Oops, thanks, this won't work indeed.

> > +                (u64) ep_trb_dma, ep_index, trb_comp_code,
> > 
> > These zeros only add noise, and in many cases make difference between
> > line wrapping or not because this is longer than 99% of kernel messages
> > and some people want their terminal window not to take the whole screen.  
> 
> I disagree on this. The 64-bit platforms are 64-bit. If the address in use is
> _capable_ of 64-bit, it should be printed as 64-bit. Otherwise make it u32 in
> the code and then I will agree with you.

Maybe some people unfamiliar with this driver would want to know the
width of those fields for some reason without needing to grep the code
(thuogh off the top of my head I don't know who and why).

But when I see this line, I mainly want to know if the 1st pointer is
less than the 2nd or more than the 3rd. Padding only spreads them apart.

I can see how padding beyond actual variable size (as in example above)
can be dangereous, because people might see it and not even think about
verifying if the code isn't truncating something. The opposite should
be less problematic.


As for the %08llx format widespread in dynamic debug, I think it was
used in the past because it does approximately the right thing on both
types of systems and it's the only format capable of giving consistent
result on both dma_addr_t and u64, used for some DMA pointers too.

If dma_addr_t really *must* be padded, then I guess it would only make
sense to also convert those u64 %08llx to %016llx. But I see later in
this series some reductions to %llx, which decision I find puzzling.

Regards,
Michal

