Return-Path: <linux-usb+bounces-26913-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B69C0B284AE
	for <lists+linux-usb@lfdr.de>; Fri, 15 Aug 2025 19:08:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8AC131CE455C
	for <lists+linux-usb@lfdr.de>; Fri, 15 Aug 2025 17:08:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B85A304BB5;
	Fri, 15 Aug 2025 17:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="lle6220b"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4307304BA8
	for <linux-usb@vger.kernel.org>; Fri, 15 Aug 2025 17:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755277667; cv=none; b=UK8x03XZ06UBGIUYDZHHxp+Pp40rVJF+We4Hw3daCU/xWAv/JHiv0nHl7CTGQd0MObcD2e+ivCV6rKGhqq9ygDpxJCr9uGivygMNlI/uHXG1IPBcOtnRSLHqnO4LHCKDdgk/HO2Lg4rnknAd0zc+jzAM7Sxv+5NFFVPeqh+bWLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755277667; c=relaxed/simple;
	bh=HHOCqI+GxKSp4HVvcTDrpEj2ugrkQvktGvi7XM7uODg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wa1kjt4Hazyg5y/orqDsNpnFVmk5kPoziSAfU96WvvG0jl6xl66S8HWKAg7w9g5Gtdy6A/fDzp1xpuIjTpPccsT6FzoqbAaXKcSiidvL6cfiXAuQ9+ZFGFQvMaBeW4JGTHuIxrUoD4fgB0P2s6qeVUXpd6U1FOQYdzjMTxXQo7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=lle6220b; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4b10993301fso23153921cf.0
        for <linux-usb@vger.kernel.org>; Fri, 15 Aug 2025 10:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1755277664; x=1755882464; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=loAQ9i8ZCUz0u98r2sCBn8fWDd/UQjxcK2jpsH1mxEA=;
        b=lle6220b0RvWLJWNobAk16JZjLzfEFJeSXSAEOSqreVWwZn61Uj4YIxYQYhVh++mKG
         +9k1/KnpfZL/fq8c1kyP/Kqpws2Qk1LQJBjkmrkdmh5zhaRSKEYaJ4KidQlpRwBUtbWD
         12ypfGH5Dfq+vM6KNZRHDNkN+vkB7eo4RCPY1jd7XKSV/sWyXVNuynZ98BeADXD/4JAe
         bqflFWF5vIumCQeydAkRZQAH0g6PU4vArIPCtvjgZsEeY3p4qecHZkn1GS7Ki43/cHSO
         helEa5whI1s1/ClhbRI3cMboNKckWfCJYDEkLbDDDd0A5/SO7CIwMyzXGWQtUpBMxbKX
         dBhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755277664; x=1755882464;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=loAQ9i8ZCUz0u98r2sCBn8fWDd/UQjxcK2jpsH1mxEA=;
        b=FRm0f7h2WnP+pDbKqRbxfplylR18I2zArSEXKkhgrz+X/nOFfLm20yTfP0D7y/NrJ8
         AzPQSGw5mQxZ2bYM3PXVWSS6KNfKL09ucBAP7D90APVxmw8v2ugNX/x8nrrm8vILPJvw
         BTWFBVdBE12M+Ybt/DbjiTZywe84/pe6fGeYv/Jh8VrHtAcmNchASmb9ylbggdovnX/z
         qrmg4lUc0bIgAd/AQ8k/z21ZdI4CheuwlR4nIasKfWu3tiYOrxQnv82N3fWct1OVX9Aj
         5Kuxb+dLQnZFFQoNQUE7CJleWgYnPVcbvUzEwSut/ZRhGVxw3C7bV5t4VWlpfagL3vT3
         zCUQ==
X-Gm-Message-State: AOJu0Yy9g4qsagQ8xodSr9rAMp9UiG8/dwRjrLmjHplg2/UJovo3WLbs
	kudQvkTkw4Pf3li9LEDwtc27BkH6uNp4k7pdQlGROp3p6Jz/QD31711mqGbRywtzQhgmhrNxX5A
	OseU=
X-Gm-Gg: ASbGncvMnvCfcvlGm2rUfVkajndbz+SdKPM6qoW8wahXre8wliE2742TvB0EdxrgHq/
	eHhbfePEyjUDtKV0npIxwl/Ex+pLWTTibQmgJ+ZrcQL2ikjnK1D4E8ci4oRnDYAjXXfJmyqIaWo
	7cGqxO5bAisQO5Dx4hdprPl9Hdi+l9m34X8QOqE4WT3o5GK4B4rsskJBzQepIB48HmT0Bz12zso
	V5fUlW5p7OLuCv8I6uSqVTQ2x6FgLutmFS4Wf11Y+lQdW9AwM6DPezaiZWwkXQJpiaLrrKKJTnP
	1LHNTN5/8bbB6kfLBYFsBGN+sHmZN6Rcfr72fNipx616tEbIj6sGhmpmYJ9E9gAfIKfmeRgBbg5
	DnOQgk2rvXZSniuk2uD1IYUTQWHFU/5G859+V9DLhGbPE08U+MajrVCMFfUiswHTQhIyTNA==
X-Google-Smtp-Source: AGHT+IEEPUZIsj28HTuc6xbCcgx+0pfam2YbieAbgSJda0D6j0W8jynjCGl+6nqCNsygYsiS+Xyftw==
X-Received: by 2002:a05:622a:6111:b0:4b0:8773:9b0f with SMTP id d75a77b69052e-4b11e0fe147mr30327781cf.10.1755277664256;
        Fri, 15 Aug 2025 10:07:44 -0700 (PDT)
Received: from rowland.harvard.edu ([2607:fb60:1011:2006:349c:f507:d5eb:5d9e])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b11d8e560fsm12418371cf.0.2025.08.15.10.07.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 10:07:43 -0700 (PDT)
Date: Fri, 15 Aug 2025 13:07:41 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: ValdikSS <iam@valdikss.org.ru>
Cc: linux-usb@vger.kernel.org
Subject: Re: USB 1.1 Full Speed OHCI slow/high latency
Message-ID: <da6326e4-9b47-4347-a044-879b4be58560@rowland.harvard.edu>
References: <3fe845b9-1328-4b40-8b02-61a879bea6df@valdikss.org.ru>
 <6017298f-fc03-41c9-b0e3-a74180f4c9a1@rowland.harvard.edu>
 <f2c433ae-f9d0-4beb-a2c7-84d2fd68e02e@valdikss.org.ru>
 <d41d8488-9438-430a-88ab-f845df3655e1@rowland.harvard.edu>
 <2bf5c54e-7dac-4673-a696-e09eb8d459d5@valdikss.org.ru>
 <7bfaeea9-6eb1-4e49-af8a-77940fdb70fc@rowland.harvard.edu>
 <e5d73b85-9c7f-4c74-9a00-700b4b6e7d70@valdikss.org.ru>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e5d73b85-9c7f-4c74-9a00-700b4b6e7d70@valdikss.org.ru>

On Fri, Aug 15, 2025 at 06:53:33PM +0300, ValdikSS wrote:
> Thanks Alan, this definitely makes things better
> 
> Before the patch:
> 
> Avg delta: 1.916 ms
> Min: 1.443 ms
> Max: 2.891 ms
> 
> After the patch:
> 
> Avg delta: 0.944 ms
> Min: 0.722 ms
> Max: 6.904 ms

I guess that 6.9 ms maximum occurred because the test process was 
preempted.  Not the sort of thing you can easily prevent.

> However the printout is still not in full. Now the same picture prints about
> 4/5 of the page, but still not 100% (previously it failed on 1/3).
> 
> Would the .pcap of the printing process be useful?

I rather doubt it.  You might be able to figure something out by looking 
at the timing of the various transfers, particularly near the end when 
the underflow occurred.  But I don't even know what the printer's timing 
requirements are (and maybe you don't either).

Overall this probably isn't a battle worth fighting.  Either just attach 
the printer to a high-speed hub or get a better printer.

Alan Stern

