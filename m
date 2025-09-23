Return-Path: <linux-usb+bounces-28543-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 029A5B962B2
	for <lists+linux-usb@lfdr.de>; Tue, 23 Sep 2025 16:16:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B09D2447F43
	for <lists+linux-usb@lfdr.de>; Tue, 23 Sep 2025 14:16:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 751C3221269;
	Tue, 23 Sep 2025 14:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="KN175lqR"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C60586359
	for <linux-usb@vger.kernel.org>; Tue, 23 Sep 2025 14:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758637002; cv=none; b=hG6JFe+aFKxcFYPjjzYoNYQijjud/cL/RNMf5P5txQH9a60pmYAdzdnxD0GuFlI4ed1q8fRTOgHF2tz0Uj9Nvzep9oKtoWwAOWZl6F/PtcBU3O7k67f+jhMnID3cDCXAp4p0BC8EoJUxl4XECxPGK/tlEn30feczEED1xGznMQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758637002; c=relaxed/simple;
	bh=dc0LTmBu+dOpA+A+NZjK2VnTaiUPLbi5QPaHxg/XqmU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VD9BPkIqjcuPrmKMhk2HW7yL1Wr+MdiY9/PGEJd4/azzdO44cb49QEYfOsSGme/R9nt5iYMAQKuwQnKWrlA7y+DeNRDazwcSjmF+k/pTVS0uepXM7iwEjkmCG+fdE/69Pz6Mt37gjNMZq/gqlTkmgVHmx6764Nu8IKL2ASV1DcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=KN175lqR; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b3194020e86so50243366b.1
        for <linux-usb@vger.kernel.org>; Tue, 23 Sep 2025 07:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1758636998; x=1759241798; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yZb80l+O1E6xQBvd+VRgbjxn94X8U/j59tKSQYo1uxw=;
        b=KN175lqRjx4eQP6T58FgKuTwjDr7oHD9QnbPl7291jq/XjHfTlGSkOQHhLJU0hof3a
         1EzxkeyIiYS5L6BCpDtRUe3yhuWcDVhOBYDowhn1fm2+YNVl0tW2/OsrCSV0foTvjZVP
         TDybNUhmzUI9EZkFs5lRIlIaflUNlHHYLRLaCcqjLkBUXRQxwAod96uQJAybqpuCI4ti
         4b/LxDZkVpIUieU9skzTQg7/iLHnMVS+1fkZN3f2UICzKzcyz0Vjurc4eoe9JsfSIHYQ
         I1tn+mCtNsvD3ZJKckXvRixMfFI0CFSZm2vGZKOqdqp1XAjYSadPiulz/Cee/2i5PTUn
         CjqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758636998; x=1759241798;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yZb80l+O1E6xQBvd+VRgbjxn94X8U/j59tKSQYo1uxw=;
        b=FTvku2PDcvySHKtsddcyb9eL3Yr3GGVfANMwmwELo0bC/zLiK6+B5VwwemF1rjzoeU
         T7sHDtvhREYR82K2DuPh2ptqjHkJncvJWgcSdhCNINsAdVxYEVsp0/YWeBXu7IZkshRP
         3ZZdKS6hbtYUmIsumig76q8fOMV1v8Q+PB0XJpyvT4FirOQjWWSg5rVNx1m1X9TNCi7Z
         qiGlcASBU9j5yrbrOwZYgfMLra24anBClH8timvORcqtK88L/75srMtsNkmJDvEMMAzg
         AgqjJS5q4hXSqaDoY08kXCimwFU24/tPWM0ZvqCQiuhc4AQz0lybeDGYYG+oKfNrbyDZ
         Ginw==
X-Forwarded-Encrypted: i=1; AJvYcCWvk/ZrDYwHJeWcjHL+2jJUc7Seqn/DmJZoIyW3M1XxvcogjTXJzOxMDnXzDq5sWBJD5JE+rhuOCmI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyqj2SRLIKwloFdm0WO/AT0f66HCAhCZiFmNNAPv4GrcNTJ+xAE
	kqdMcFrUm/M0MsCzdNAoCNLjrbqEdSmZV5GK3t+i705ubwRqu00/5QvPaTb70iJSwUU=
X-Gm-Gg: ASbGncuBugDtNAJOrp+MrkVyNlOgkpWFHoFJQHIic49qx62bFeqlLvS3+B/iwXFSTUH
	3Z7pdS+GQvYD0IB/uxnFTC2XdWJofUWCbF/G2eFP3pPgHzvLkUU4GGmFirY0yDhY7Ffv0q0cjVs
	MtgQWUej6YqDBXAT6ltIF/H+UO1VQB5wJMAtxzPZZ947lkW5mzbKzt+AUxjlnMckvlhQSfbHDwd
	CkZyTjZDwzUPw8oCxmrH5Fc8Jrf73Fn7scOfbq3o58WgQBNyVJ39t5j9VL9E3qR2OnrPBoxz30j
	OSrNcnccO6WbnAgRC7XZ9is/cbn5/6VdAjBZYDbz6ZrmQ7Hi9uWCHMRZG+3NdyJgR+3nEVdiFkr
	WrljR19HyWSPMhL6zZ1eYNgzbkBy7DPrnihNvhvAa3mFZkTkwgY/+3BS6LJy86GyS
X-Google-Smtp-Source: AGHT+IEBzQ2i1Adt3iCXJ4XnxKAN2NtFXYdtXtl8S+XU9JKg1rsZ+VFiaHRRKP8LO02MhtH+JmPQOg==
X-Received: by 2002:a17:906:c10e:b0:b07:e207:152a with SMTP id a640c23a62f3a-b302764dbafmr282212266b.19.1758636998268;
        Tue, 23 Sep 2025 07:16:38 -0700 (PDT)
Received: from ?IPV6:2001:a61:136c:1301:bd1:21a5:4846:e6d8? ([2001:a61:136c:1301:bd1:21a5:4846:e6d8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b27217f616esm944449166b.72.2025.09.23.07.16.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Sep 2025 07:16:37 -0700 (PDT)
Message-ID: <f5a802a4-ac9b-4b45-8d1c-871e2e06d7ac@suse.com>
Date: Tue, 23 Sep 2025 16:16:36 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] rust: usb: add basic USB abstractions
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 linux-usb@vger.kernel.org
References: <20250825-b4-usb-v1-0-7aa024de7ae8@collabora.com>
 <20250825-b4-usb-v1-1-7aa024de7ae8@collabora.com>
 <DD07LUJXNZN9.3RHH9NJNRFVNN@kernel.org>
 <2025092356-rounding-eligibly-c4b7@gregkh>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <2025092356-rounding-eligibly-c4b7@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23.09.25 16:13, Greg Kroah-Hartman wrote:

> Functions like usb_fill_bulk_urb() takes a pointer to a usb_device, not
> an interface.  Yes, we should fix that, but that "mistake" dates way way
> way back to the original USB api decades ago.  So much so that I didn't
> even remember that we used that pointer there :)

How would we do that? We need to be able to send at least control
request to devices before we have established which configurations
or interfaces the device has.

	Regards
		Oliver


