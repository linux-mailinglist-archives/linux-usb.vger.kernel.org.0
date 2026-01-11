Return-Path: <linux-usb+bounces-32140-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 072D8D0E077
	for <lists+linux-usb@lfdr.de>; Sun, 11 Jan 2026 03:04:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 34AAC300B2AB
	for <lists+linux-usb@lfdr.de>; Sun, 11 Jan 2026 02:04:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51A502139C9;
	Sun, 11 Jan 2026 02:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="MfLO26u9"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7058D13D8B1
	for <linux-usb@vger.kernel.org>; Sun, 11 Jan 2026 02:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768097050; cv=none; b=EgpXICSnZntJndcxfYJqz+s184b4tjQ/IgX0wIiGC4d3Ji2f0AR45RjvNSO4ng9RUx5rNnA+uzoITSGlWxSrBYbjJqhRFu/5E2z+ClowiuUmwgL8dUJi6gzPVc/uH5P5N5XHFwM78JKR38SKvr/motFQGbFVMpj7lDgpY6rjZk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768097050; c=relaxed/simple;
	bh=/y3MJqxnxKWv80IY7GSOjbdDcEBZO2HeOEUId8ASFfM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VHGhpRnyVLAoqhnBIRHhqcoD48Kte4gDdlPu1r00setxJCSa5H37DxuySbPeNzi7Om+J6SuKZYAiBQCHBhlXnrkijHIIFzy1/VerZFlDp4tJ73jCrBdnpdCBQ7B/jRSSGJYr321DeuMPrsZ0sA9rIfFfVZfASolg401DUBFmbZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=MfLO26u9; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-8b25dd7ab33so406552385a.1
        for <linux-usb@vger.kernel.org>; Sat, 10 Jan 2026 18:04:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1768097048; x=1768701848; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sPlKshfxSpQ0HQa+lmV2aHIJv8iEBO5t6UJUCMI+nJY=;
        b=MfLO26u9GVOMrkGy5Q+/96cIjxKxiNVtu5LO8zT+1aJA9B/S510PmXOyA5/+bZwDMD
         mKzdA9oYnTGQYLGAZXlUSh3L9+IZtr2ClLrQIEBRfpstgaWTPdVWnfzMgREkeeqIhyZt
         APWw78oXZ1bUk5H4fyRhAbnnIDlKnwz1T209iylbZaHGoV7rO5zX/1gvfEAMpVH99MsT
         Tj0eJVkY7t8ybaMohIixc6qGCCZfCD8cffFNsoixZ13JY6rRxqV3wUdIc9E1gISnQTfK
         YU59GLpf+Pxbi+EvKpd7uw/C9/krY1do5oFvwWdMcw0nShLiroJaqSUTgTpXzSP9xTLZ
         VeYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768097048; x=1768701848;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sPlKshfxSpQ0HQa+lmV2aHIJv8iEBO5t6UJUCMI+nJY=;
        b=UZtJeG3Won/ekSkaplwo+9LOnJ5xuoFZNN1SwweuZyKtPoaZaVMP/6WL96tOofiSnh
         J1S4WmhlrzufvfObxgTTViB/TGr4PlWnyjjpCEZ88mPxhX/irY8QCIYy34BnVu1oJDIn
         fJSbXuPMns3nCC4dRd4fZjCFRwP8XfMPiMTpt0D1hhwz9dUgM/NX9PNyeNf7mjYx/Bmm
         E+DXACZfAkwWsxcLfbubgMaaz7vOQCPMO7HabFR93Fugfp7ZrPEyKiI5OMe+d8aVoAJ1
         fa2wNliuIDbb77az7F2vVQXRvS0K3NGmJfjsjcXhueESrYSMh7nRDPVLQxEVsfK8H3Ho
         lfuA==
X-Forwarded-Encrypted: i=1; AJvYcCUAN3s25a+14kVqK9NiCn5z+BJ0dxEhUJM0wAQgQoZidtOcy9kIBwJ7o8GWsMPOvbyh9fUQeCSO9vg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVsUPncTAdtVhhu3xUpnCfqravOEmII7ny6NNAsG9isrYzJcIB
	KHdCDXDlkpGeZHZ0hK6X5qOEAVvS9jHlOVaweP7zc8ieRrQj0jl16+rEp00NOYemKQ==
X-Gm-Gg: AY/fxX769PJkdrcIw9F3Jsv7r9nSkZ4a68qMWX/Ul8BeGNfpiuTRDsu0udJfGzdFCeE
	E4ZJX1VXUEtcVXzQakFdbhf8DzMjC5tA5IsIt0X6kNyFyZSJx4yvRNrjutpfy+Lndv0V2XfEdUH
	V/uPOTCcwhA5Mf0JqQ/lZLVjGKyYsVtjsOw6CsWco60A487krnU+GwgEe6Z8BA2+aitcaw2hjg6
	2O/elfmIkd5RhvEs/1cZL+mdlhVcTASMb1GlG0esdUvAq22aplWbCH54Db0B3aLanwk6UOg9IGv
	Frk26/vUB/QzXELnx0Gm+93xsf26hnS92/5xK8Bc/WXQFeJGTUXRchA+yxbnInsDc5l01CpJz37
	CgHlr/jdP6BG/3V21jLvn+S7FEOg+UQQg1QntyWnJJzLIBPo7ir0VBT0HK6xLAmt1mNdv5Qb5tN
	hylh5tBW1ZfDgQ
X-Google-Smtp-Source: AGHT+IEPoPxAASdkOxBaAhyPye/IRL7zCXaZI4BaqOh1vZW3Nvc9rK2Dm+ItuSNWSSdIg7p2Nkke7g==
X-Received: by 2002:a05:620a:7006:b0:85d:aabb:47d4 with SMTP id af79cd13be357-8c38935623bmr1936873885a.6.1768097048130;
        Sat, 10 Jan 2026 18:04:08 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d03:1700::daa9])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f51bf8csm1186499685a.28.2026.01.10.18.04.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jan 2026 18:04:07 -0800 (PST)
Date: Sat, 10 Jan 2026 21:04:05 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Diederik de Haas <diederik@cknow-tech.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Huacai Chen <chenhuacai@loongson.cn>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Shengwen Xiao <atzlinux@sina.com>,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH] USB: OHCI/UHCI: Add soft dependencies on ehci_hcd
Message-ID: <f5af98cd-6482-40c9-90b9-c8777d86f8ad@rowland.harvard.edu>
References: <0c85d288-405f-4aaf-944e-b1d452d0f275@rowland.harvard.edu>
 <CAAhV-H5GdkMg-uzMpDQPGLs+gWNAy6ZOH33VoLqnNyWbRenNDw@mail.gmail.com>
 <34c7edd0-3c0c-4a57-b0ea-71e4cba2ef26@rowland.harvard.edu>
 <CAAhV-H7j=cD9dkaB5bWxNdPtoVR4NUFvFs=n46TaNte1zGqoOA@mail.gmail.com>
 <98e36c6f-f0ee-40d2-be7f-d2ad9f36de07@rowland.harvard.edu>
 <CAAhV-H601B96D9rFrnARho4Lr9A+ah7Cx7eKiPr=epbG17ODHQ@mail.gmail.com>
 <561129d8-67ff-406c-afe8-73430484bd96@rowland.harvard.edu>
 <CAAhV-H41kwndL+oz2Gcfpe3-MCagaQd2X21gK9kMO2vpw_thhA@mail.gmail.com>
 <e6a02bff-6371-4a03-910e-b47c5eec726c@rowland.harvard.edu>
 <CAAhV-H7NGgHhrZ+oC2ZbzURj0--yVL8rpn4Z42xk9VzKD3E1Qw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAhV-H7NGgHhrZ+oC2ZbzURj0--yVL8rpn4Z42xk9VzKD3E1Qw@mail.gmail.com>

On Sun, Jan 11, 2026 at 09:54:46AM +0800, Huacai Chen wrote:
> On Sat, Jan 10, 2026 at 11:00 PM Alan Stern <stern@rowland.harvard.edu> wrote:
> >
> > On Sat, Jan 10, 2026 at 12:05:19PM +0800, Huacai Chen wrote:
> > > So I think we need a softdep between ohci-platform/uhci-platform and
> > > ehci-platform, which is similar to the PCI case.
> >
> > Yes, on your platform.  But not on other platforms.  (For example, not
> > on a platform that doesn't have an EHCI controller.)
> For the PCI case, OHCI without EHCI is also possible? So I think they
> are similar.

That's a good point.

> > I think the best way to do this is to create a new CONFIG_EHCI_SOFTDEPS
> > Kconfig symbol, and add the soft dependency only if the symbol is
> > defined.  Normally it will be undefined by default, but on your platform
> > (and any others that need it) you can select it.
> >
> > How does that sound?
> From my point of view, keeping it simple may be better. I think an
> unconditional softdep is harmless.

Submit your patch and let's see what Greg thinks.  You should include 
that log extract with the extra disconnect/reconnect messages in the 
patch description, to indicate clearly what you want to prevent.

Alan Stern

