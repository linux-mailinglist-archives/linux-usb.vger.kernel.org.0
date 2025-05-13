Return-Path: <linux-usb+bounces-23891-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FDDAAB4DEF
	for <lists+linux-usb@lfdr.de>; Tue, 13 May 2025 10:21:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D7DB43A360F
	for <lists+linux-usb@lfdr.de>; Tue, 13 May 2025 08:20:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC410202C4E;
	Tue, 13 May 2025 08:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="HQ2L1Hd5"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 327EC19D89B
	for <linux-usb@vger.kernel.org>; Tue, 13 May 2025 08:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747124471; cv=none; b=pQWtx585lJ/Wdgrl2Zl3xrp/3OKkNkTkTqG/MvPs04PhS9BUWm1KezkRUgSWcDcI2WlOt2TBTkyxZW8+8Q61VOu67IxNAv/t7Am96CutKRXm4C0P3SZuZHIzDjUPMJzMJtX6X8zIqPUiH07smVIoKkB1tdl0yNup/BIXKzCxH1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747124471; c=relaxed/simple;
	bh=1KOdnNmnIqOUX05SbnbV5LIlCI8xHi+VUdF/PLiNndY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GkpzTHYCMs7V8PELiVLCw3KdCCmGIk5HpO170qxviydazxjmoOCDhTXsOLoTNlTYlCZ3K6VTfasGr/3IUiSgmOOxSqKQcLqnS9UyC7c+1FARQ5pGFonk42uKysELl90qn7xhb4xIUNwhu47icVApm0NkQyB+HmCIl/BLd7kUuCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=HQ2L1Hd5; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43cfe574976so38237275e9.1
        for <linux-usb@vger.kernel.org>; Tue, 13 May 2025 01:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747124467; x=1747729267; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s7f9J/hvdAFlkc7sZuIYSGpxSi3u2UaESB5uOoGyVko=;
        b=HQ2L1Hd5eymHd6MS47++c+wMl/M40Muf8mQQjs8V02pUZ6LQ1ea1VC4rLoa5Plziyj
         l7P50L6Y3Kg71eqKlB/1AX/70G99H/ZZwxYEZXkpaKdJaCp9ffBt+j3Bu94jHuN+MeIF
         d0kzzegtLaKQb9gAS/jv4LiHAjOoLEGd5MQVYfaaeDQ5GFBNiHGHy/cRt5D2EmMrABjw
         w7FGV/MBiV39KPQQZNqheUM/ntcNABWcs1OhaHNLy+neHxbN6EesXDgY6L9p7qaQq7RE
         yT0l0PSRL4L1mWFGol35A6vE7ewuTK7RiHWenLVJPsiIJ7bMFuXQPCqN6LGTTyVfNaMn
         XKRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747124467; x=1747729267;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s7f9J/hvdAFlkc7sZuIYSGpxSi3u2UaESB5uOoGyVko=;
        b=hkocvKlsv8TjzVOjPnN3JISu43ZTYHDLafe7A9WysbZyNwcCwbTDMMglZu8kZ4W1xx
         AB1omDobpI9D33urMWB0biB+DZIlixiT2XesSL6EkMbMgeos0IbL1OlaOPbkEy/ULSGp
         TJGQQBoeM/sr+8I7Op7vnBfVcAReHeyeqU96D8e1jKFLaTuJpjdvef/Ew3pi2ocmBMUp
         8aRYb12crfvVZgC8jm6NyjmX7VCecUDJkRfTrpOEbM0M28GLecowekY6n67bvanijfSM
         ttNwC5/kUuZJrXXhTj5v0Vyv5rwQFIyQcxuU/1y+EUcJucjjBpgFPl6H+A/tRHKNsOik
         1idw==
X-Forwarded-Encrypted: i=1; AJvYcCVfSisdGhAelnIq4vHeZqXN1tBCDgDYg7/q3BINTZEyzu+PG3VwU5uClIY2ZNCHDhUZTXVQPCKFLSM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYCzM+GLcR9N1S/ySd9wul9z+Tc7Tek/cmKTpyC0sy6aw/xBeU
	zmTHyFicTvZmcKa3yvrIN0YT1rrJXCesZ4oIW6XLPmeAln0Rz8dpE/tXXnkFLMc=
X-Gm-Gg: ASbGncsoPEvB0InUP639ldp1y424H4ZOQ948KItnsA95ZUvM9oD3YYoN8Fht4h3bd1J
	Njh1FLzEcG4W7wnrXGCn/q8HtwO5eeSMCgVc15UcA3tlaQZXLVtXfpQ4Seoc30tbGNCqQtHvM+i
	Y4tGNGcp+VoXkFZz7dJjTLsYsZHhlmcSZssUsPUr9DZNvf0T2S5w7ZFqlJhx7yyFRuTlDuwwiyS
	wi6gET5XhNU/iSxWNHZVmYHUdbkPBQQkac8QJmOnFJAyug/3EstligVxgyhKljiFkrQp0lGgBL1
	AThaxVBScPzBUZ1nS/SwCbc3DfqlzBhatfHOfRHPOatrppIiy2AHy8qIgHmivHw2oog1in0R+ii
	Lgn496vgGMjDWbtPFWyg=
X-Google-Smtp-Source: AGHT+IEcxmMTgov3772rlzrX11O2oD7xnMxEVaaMx9pT7r4MRBGiohY6gWKKNoJRF/yJySyPopi/DA==
X-Received: by 2002:a05:600c:3b2a:b0:43c:fa0e:4713 with SMTP id 5b1f17b1804b1-442d6d18ae0mr143603615e9.2.1747124467555;
        Tue, 13 May 2025 01:21:07 -0700 (PDT)
Received: from ?IPV6:2001:a61:1335:3601:f121:69fe:935a:67bd? ([2001:a61:1335:3601:f121:69fe:935a:67bd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd3b7e26sm201015165e9.37.2025.05.13.01.21.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 01:21:07 -0700 (PDT)
Message-ID: <875848ec-f92b-48a9-b5c2-792bb0121824@suse.com>
Date: Tue, 13 May 2025 10:21:06 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] USB: xhci: use urb hcpriv mempool for private data
To: David Wang <00107082@163.com>, mathias.nyman@intel.com,
 gregkh@linuxfoundation.org
Cc: stern@rowland.harvard.edu, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250512150724.4560-1-00107082@163.com>
 <20250513055545.5738-1-00107082@163.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20250513055545.5738-1-00107082@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 13.05.25 07:55, David Wang wrote:
> xhci keeps alloc/free private data for each enqueue/dequeue cycles,
> when using a USB webcam, the memory allocation frequency could reach
> about 1k/s.
> 
> URB objects have longer lifecycle than private data, hand over ownership
> of private data to urb can save lots of memory allocations over time.

I am afraid I need to make a comment about a principal issue.

This patch set overlooks a fundamental issue. You cannot guarantee
that an URB is reused by the same HC. For example you cannot rule
out that the next time your URB is resubmitted, it will land with
XHCI again.

That means you cannot touch just how one HCD handles private data.
Or you need to record which HC the URB was last used for.

	Regards
		Oliver


