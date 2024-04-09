Return-Path: <linux-usb+bounces-9202-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6357489E5D8
	for <lists+linux-usb@lfdr.de>; Wed, 10 Apr 2024 01:01:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EB7801F22D73
	for <lists+linux-usb@lfdr.de>; Tue,  9 Apr 2024 23:01:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE215158DA0;
	Tue,  9 Apr 2024 23:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rwczPZCv"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9787B158A3D
	for <linux-usb@vger.kernel.org>; Tue,  9 Apr 2024 23:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712703674; cv=none; b=Ztxp5f2KpHsSA39EW2CoMXu7tZyjSO4QNFw7spyCT8tydXGPlHDnj54My+OXnCI8l3AzdzJ4+/5mqb04c7oIW51VUdv3NbvuJaFAob1/tTWe6CVJ6Djx5+XT27yzlYq1e223Vfb9zAG37MSVPjW78dMk/gMQpgl5eS0xLrZfeo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712703674; c=relaxed/simple;
	bh=JeppPCTETs93zcY8Nce9AbwilLKNhb+fARd6mCkiHYc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nRY9ZonTWTAh1ipbg+WyQRIaXFaHLvPXk1YtL+tCPe++BRERh7TVf0fj3ZCOjBFOkxw1e/nmC9j3y4JA6pXgFn4WTJvWw89fWPRKOAb0vRneY4KvCEgGszOlZ8jy+pRK/s7GLuYwgc4cXbPnhQ4QLpq23SwXxyTzbZqPfCMeDmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rwczPZCv; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2d4886a1cb4so74004701fa.0
        for <linux-usb@vger.kernel.org>; Tue, 09 Apr 2024 16:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712703671; x=1713308471; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=i7xaqNIsZ+2qWZG1Juv6VR/X6zHaDdpvuvJrk66LyvY=;
        b=rwczPZCvJ+hc5ESQzu7ON1usV/3aj2hkQR7eNDZsVqit1aJi46WAZ1HmoRgpQ3HctC
         41KfozStthmuRaAE7UfSc/iH6fWuSobDB4OtQtt6jNqXO13TCPyqJina1QpcpQdxefQ1
         I5IdV5COItAbzN2ZYTzEH7ZAIF7EYCfwjt3ggA8JZOWvKwyMsOl+nNZiHuoS1mKVJQra
         ZptYj4YXjeiHGc6p48Ew6J+ORMS11aHlaHNFyGWuBb0dcDcos0Oawk6Et1KlRWLiBbMw
         oYMxjGGUR5P3tCLCgLHtMr0LL2P+MEUWsqRj4NtLy10I87PIOkpxzNyXellMgTDlKhEe
         VBIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712703671; x=1713308471;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i7xaqNIsZ+2qWZG1Juv6VR/X6zHaDdpvuvJrk66LyvY=;
        b=xUhSXAiAfUju7c6UlfEZ4TdsaX9EjxI90Zg++K8N968wpWByiaU4wuzTtzrn8gocqs
         kJRF8bn+1WW3LEVEUT6UItGR3fEhQislaqFxxBpwSsUEhvTYLuljTzd8NjdN1z4nm/ZK
         z+ikGLWePx20z+DbcauUP0vpO0S0Fz9kqwUnTNQIKeR8667Y/7hPR/WwKok2W7GRMYdI
         UauHXdIx7j1jf8xSife6FK1LEQPgaqvqaZeUl9Gr5+75le1Y66QTM0W+WYgJGnUk6I6f
         t8Bo+43jzX+cUTYifH9R0Z1LuPWVq4vKgcwj2WL1LazjfwXHlBZsN3ShskEII60PelWy
         xmhg==
X-Forwarded-Encrypted: i=1; AJvYcCVJ7UEL/lhFz+C3nw+yFe3MQo2w1l4PIClCdgaCqhbTB0iXpptnUgDjXuZ8HJRDBqkox6HGI6qnBzxqzDJ1jUihI8mFkGpxH0lD
X-Gm-Message-State: AOJu0YypKoZ8D962eWTSgIlYpzrlwvzWdybJK9xOs954Lp6sbdvF3BWa
	zzHuQeMvJOqmvsI9Snhr7e4f/z2phSiPYutTabRDtPwFiu0Fryzmh87XRjCj2lg=
X-Google-Smtp-Source: AGHT+IGAoCmmmkHVr8d4K2/bjCs9PjNxBVhrWn3RLt45OCDpf+HOu7K+ghHtnL1+EaX1IlLjp1IOjQ==
X-Received: by 2002:a2e:b94e:0:b0:2d8:1249:a047 with SMTP id 14-20020a2eb94e000000b002d81249a047mr799800ljs.41.1712703670372;
        Tue, 09 Apr 2024 16:01:10 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzyjmhyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a00e:a300::227])
        by smtp.gmail.com with ESMTPSA id o10-20020a2e9b4a000000b002d71b89f93bsm1689846ljj.27.2024.04.09.16.01.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Apr 2024 16:01:10 -0700 (PDT)
Date: Wed, 10 Apr 2024 02:01:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Francesco Dolcini <francesco.dolcini@toradex.com>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Alan Stern <stern@rowland.harvard.edu>, Bjorn Andersson <andersson@kernel.org>
Subject: Re: [PATCH v1] usb: typec: mux: gpio-sbu: Allow GPIO operations to
 sleep
Message-ID: <gehd2jmb6aellgcafld5qtitfv42fjzeouq2vvhynkoyu4kjpx@tilmbn6r3bq4>
References: <20240409190910.4707-1-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240409190910.4707-1-francesco@dolcini.it>

On Tue, Apr 09, 2024 at 09:09:10PM +0200, Francesco Dolcini wrote:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
> 
> Use gpiod_set_value_cansleep() to support gpiochips which can
> sleep like, e.g. I2C GPIO expanders.
> 
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> ---
>  drivers/usb/typec/mux/gpio-sbu-mux.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> 

-- 
With best wishes
Dmitry

