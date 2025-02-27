Return-Path: <linux-usb+bounces-21171-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63921A48999
	for <lists+linux-usb@lfdr.de>; Thu, 27 Feb 2025 21:15:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0AA9E7A7709
	for <lists+linux-usb@lfdr.de>; Thu, 27 Feb 2025 20:14:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62E4822DFB8;
	Thu, 27 Feb 2025 20:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pYDrdXhw"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C29C1AB6D8
	for <linux-usb@vger.kernel.org>; Thu, 27 Feb 2025 20:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740687349; cv=none; b=ojyogE4I6ImZIb/conTcPagdJ0fOR05YDJ2qzL/4/V9iV1V5J6tmL4nZSLI4c+FyuhNKhMJA3O4uBpD429fed+Y6o96Aer0rgUt73tUlkER+JLDM5peJ+9YCmXbaRz33kIWhNO6eaUn233vdBNsXB5U8iYqd2M+u0c/y+mqmUAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740687349; c=relaxed/simple;
	bh=+XWik2wC1ffv2ovjVvxk5rjvVyKAKeQWJsIjHTOse/k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QFczvCchBiscJNxLnqLJ8uvy19Q5GlZPDQyDXGsLiPZr6GEi3C1nfw1GOeh3WmZViBsrQ1HxqWSgHYaoaeUf4yae5pHmLZkPYg6AmMMrKD746fu43GBRu7B0yQlIDrxGUk1Bvr+B1SfUmQ9obw4ZPUkTxAIEXRNjk284S8ZWu5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pYDrdXhw; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5e0b70fb1daso2156289a12.1
        for <linux-usb@vger.kernel.org>; Thu, 27 Feb 2025 12:15:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740687346; x=1741292146; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6Jo/OqPqJ4zSpDM0RDYOakC9S8mm3ipT209j6FvCsm0=;
        b=pYDrdXhwqXIU8Alrfsj6kOhr82EW00Yj4UDXWrRssABoW0DloZOHUVfDD0dJArCAYd
         AQKSLCDSEKHohG29S8X+UUqM/SFLavcs09hOfTYq/EeJ8usB9MYTx+RNxj4gVDoGLsK/
         m/mVQTjFFBQsPKr+OiLDwHtjx/YGbkwQIBJ16CRkWl9pAIAL+VIBMOSUumnIt+DlLQR1
         Q5Ik2gArh2Nbw5PX/u3SiUpFDuOl7uIdltoLhOPcM7XEUUoxqC4R5kGF167mo0IWRxfX
         Iyc1ofnIML2wbDFay9AT9jRUd2mwn/NDWXzVPDN4Enbb2aXtPdvb4jPqdlnfplpvlOXh
         oNFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740687346; x=1741292146;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Jo/OqPqJ4zSpDM0RDYOakC9S8mm3ipT209j6FvCsm0=;
        b=KDdp6jxoZypyg+nAF60lQniODbEGRIZviaWiXUoAqGZUDYQS8uIfmqIMJnUTPLbB/q
         cCySlN9LrpyY0hk4NknfBDOmPKgp5UJDOwVRv5L0hm/ZP3e+klP3k85yp5I/DQH9yOsX
         bFOTqSY1Nteq2nZQUZJr4WEfrmRPHqXptOw89McGRDHijvwKwxcbHeSw6kB3aNHKeX2m
         NZmHHxzvoAC9jMGncmgPCIKLoEV2pHF1tU7909Q1OhYyvZOfryWWTru4r7mAxxqVFTOK
         yB/WI+ZqkZYi58O7e+rU/7TcGynw8i+6o9lFoyK9asRr0kByFjmFeE78fOtjQnntIz8o
         fc9g==
X-Forwarded-Encrypted: i=1; AJvYcCXa7WeTVNC8mxJNQNBUSssan4knp1RXuf6EyeZ/IAsqGBbXbyjgzUFf/QnIwJmDN8uotm0KEf4r8zQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwT01mnyZEh03KBqvT7NhxvyzXPIF7ihETI6FCiJbTCR+P8kkFM
	5XoNGP+pAYDG+flTK3OAe4iODfu0V/SzqDZh15raqzVKQo4EBiTreSodW89/zA8=
X-Gm-Gg: ASbGnct1BVwXBQfGmwmVplBVxqv116D3Mby+5JC7tN4tg777xWXECkfWhSk7ZWf0hba
	vko1Sa7iS+aB7sEriY8PELAilYLvE93ZvOlLMjHY9Z3OkpnscTeodoos0iFskiHPjlxjS68M6gV
	PDvS3Aexti6jOagqLKO825m7VSJ9nf74xDKpIIP9CpStrwH4LnU4lEGv1akNsSNXdBAJ+kdW8ve
	buKSnRMje6ocInA9myE9LDz5cMDXEnYtReHc9ttHFrFOg2fPZY6tCmZmW6qpOVdq02zeBnOvD4V
	tHYJ7ZC8/acEsHEBObQlBb01tedEsFk=
X-Google-Smtp-Source: AGHT+IHEAa1ZZ8N7si4N7Iok01NnKREzA8Tp47LFBm6mrX2/YZngu4ctMzki6E6aFIm+hAJtSsGbmA==
X-Received: by 2002:a17:906:7310:b0:ab7:bb93:56ef with SMTP id a640c23a62f3a-abf25fa9fb3mr79625166b.19.1740687346341;
        Thu, 27 Feb 2025 12:15:46 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-abf0c755bb3sm173114566b.139.2025.02.27.12.15.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 12:15:46 -0800 (PST)
Date: Thu, 27 Feb 2025 23:15:41 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Abhishek Tamboli <abhishektamboli9@gmail.com>
Cc: mathias.nyman@intel.com, gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] xhci: Fix bcdUSB initialization
Message-ID: <a8659c74-ec76-456d-962f-1690581da162@stanley.mountain>
References: <20250227193400.109593-1-abhishektamboli9@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250227193400.109593-1-abhishektamboli9@gmail.com>

On Fri, Feb 28, 2025 at 01:04:00AM +0530, Abhishek Tamboli wrote:
> Initialize bcdUSB to 0 to prevent undefined behaviour
> if accessed without being explicitly set.
> 
> Fix the following smatch error:
> drivers/usb/host/xhci-hub.c:71 xhci_create_usb3x_bos_desc()
> error: uninitialized symbol 'bcdUSB'
> 
> Signed-off-by: Abhishek Tamboli <abhishektamboli9@gmail.com>
> ---

The concern here would be that xhci->num_port_caps is <= 0.  That's
probably not possible so it's likely a false positive.

regards,
dan carpenter

