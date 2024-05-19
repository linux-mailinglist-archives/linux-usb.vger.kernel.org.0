Return-Path: <linux-usb+bounces-10329-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 604B18C93CC
	for <lists+linux-usb@lfdr.de>; Sun, 19 May 2024 10:00:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 798731C20AB1
	for <lists+linux-usb@lfdr.de>; Sun, 19 May 2024 08:00:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EEFB182BB;
	Sun, 19 May 2024 08:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ESZunMs+"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E35918AE4
	for <linux-usb@vger.kernel.org>; Sun, 19 May 2024 08:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716105606; cv=none; b=BSka8Ee52BMFhNdRJ0BNqcHWNiCgNSJhfx3fZPd8j9ZFDbrv2JDUsx4c9sp3dBaXij0FhkPvX1GvxDk4SSO4zHb4ElHMgpgMnuTJErFqnKZuFtKEEkSkfYnlCaa/4/3enCM4KJTgZCuRgAUSbkdA5k/mt8F6NnZFcgIYFrhchbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716105606; c=relaxed/simple;
	bh=m4rWVSXHJ6/Vt1/TsqI+krQspjxUNxM2H7KmtGzkn1M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N2nHTgjVmCYILz2SjQLKDbenLTL596jYrZQM/ACTHvBIslz0PIKVgh0Bxq6hg9apZYSeo9nNVYReAnBM7mOIFEz+8FA7qXy4TGAuCgECskd5L6NQKurmNh6cfAJTQntfUhjD0nchM9aO1aIiZTF6hO4NP2sGO79xVW9LLkWukzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ESZunMs+; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2e6792ea67fso37038711fa.1
        for <linux-usb@vger.kernel.org>; Sun, 19 May 2024 01:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716105602; x=1716710402; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ki1c9fDiZ1GCrj1ZoT6mLgSAUoMndehPLBXp5wK4ZPg=;
        b=ESZunMs+CDqwKXHYC/2cCFn3nkLjWwyo9R+Ybnzq+H6sa+9o/cf5T9+8uBkXnUjC24
         1ZQMboy9sxzx6dNjY2ZH6PXwAutwhwQVNDVn7aC3XO8/Fzai/EkSqB3xPAk1Nj2T6LRt
         Tg/uoA1fUzBZglv0y+xmaP/nkKmcA4c+k6A+NuzLg0/lh8dY5BkiOKpCjmA3z1Ci9kl2
         nqWRvnD+HWbVUyb/VdPnhMIVWxBPLwOZZfwEarESicdyOjXfRSLngWRo5b37fH2yYcTH
         FQm6uIB2E3Eef8LqH7GaEwdqZufa1H8FA6PaNpCPsqUKNFSL5QR/K1x18wqTDbc0URQ+
         0toQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716105602; x=1716710402;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ki1c9fDiZ1GCrj1ZoT6mLgSAUoMndehPLBXp5wK4ZPg=;
        b=aCSyK7L+vfgyeOJSXnIqDuEHX0VWENIUzUGGXAX5IUkmzlpapSH86o/J2CUl6FXsnx
         AJTOHU38g8P5WIflDBuT0Dws5WdTSV0GvSTu8Lgs5rcDdvUnqK958Zu8Vhw6U3QWGVfH
         8SBsng+UideSEyoHFIv6hS8QY/wTkr8RYVMNNpEqdkQgD0dhwZ9TsCGr4ZcmBWIOza86
         CdsPQ6sIvBe7Sir375+jYSFxg9hIhVbiVwV1oiUQoI3kvRcEw9cdF292jSXraxmwF5HO
         CSAZUje3QyMZ0oZr6b29sSiw9suYC9At47KLF+MhHaS5SrxJEGGmGufe6lMwqC4pfBfe
         NJ/g==
X-Forwarded-Encrypted: i=1; AJvYcCXjKvaF/goKrUBgwnepT/N6MDjBeD/73NiZ97mOn0yDX2sBQ8WZgd4RhGGdJ1bwDH5wSe+POzfpnpjrgjU4Am4AwFSQKAoknRCF
X-Gm-Message-State: AOJu0YzmnDQCwoCfGzyaw+Lf1gSxM33ddPiJSdNvrGqK16aC7Dq3UL7K
	idcLtZG5e3RwQE7EuuS44sMTCt7fMdC/LiAozFdgriAJFU/qrzWiiEHhIrzZMaOt1sSBwSQ0n2H
	a
X-Google-Smtp-Source: AGHT+IF0LURVQ5dYBvsSGbruvFCB97XFgZLY94N0zD6E2Ytq59xIKVYQNiFn8mBYpdi+1fGK9bErCg==
X-Received: by 2002:a05:6512:3e1e:b0:523:2ed9:edf9 with SMTP id 2adb3069b0e04-5232ed9ef10mr14396484e87.63.1716105602221;
        Sun, 19 May 2024 01:00:02 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-521f38d7f38sm3839288e87.183.2024.05.19.01.00.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 May 2024 01:00:01 -0700 (PDT)
Date: Sun, 19 May 2024 11:00:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Amit Sunil Dhamne <amitsd@google.com>
Cc: linux@roeck-us.net, heikki.krogerus@linux.intel.com, 
	gregkh@linuxfoundation.org, megi@xff.cz, badhri@google.com, rdbabiera@google.com, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v1] usb: typec: tcpm: fix use-after-free case in
 tcpm_register_source_caps
Message-ID: <begphn3f6rdcwgmyewnk6chmws643zd2gcucphntjcrpwhxxmp@75v7gll7non6>
References: <20240514220134.2143181-1-amitsd@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240514220134.2143181-1-amitsd@google.com>

On Tue, May 14, 2024 at 03:01:31PM -0700, Amit Sunil Dhamne wrote:
> There could be a potential use-after-free case in
> tcpm_register_source_caps(). This could happen when:
>  * new (say invalid) source caps are advertised
>  * the existing source caps are unregistered
>  * tcpm_register_source_caps() returns with an error as
>    usb_power_delivery_register_capabilities() fails
> 
> This causes port->partner_source_caps to hold on to the now freed source
> caps.
> 
> Reset port->partner_source_caps value to NULL after unregistering
> existing source caps.
> 
> Fixes: 230ecdf71a64 ("usb: typec: tcpm: unregister existing source caps before re-registration")
> Cc: stable@vger.kernel.org
> Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
> ---
>  drivers/usb/typec/tcpm/tcpm.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

