Return-Path: <linux-usb+bounces-12602-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F2D940072
	for <lists+linux-usb@lfdr.de>; Mon, 29 Jul 2024 23:30:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 23E7C283937
	for <lists+linux-usb@lfdr.de>; Mon, 29 Jul 2024 21:30:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 126F918EFD4;
	Mon, 29 Jul 2024 21:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YLWmfrOD"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DD9D18E75B
	for <linux-usb@vger.kernel.org>; Mon, 29 Jul 2024 21:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722288607; cv=none; b=fx2s+hNg87syAe5265cJTjpO8bv1iAMUK1bF5+15+tpDC+Q3qrIbJyJN/6/Z1PRjAqbf3zEzNnILDxWKco3wcQst6xJmsdJjm4CXFRzp5KRIqQFCYQpGVh/7cUNUV93QO0a/HqM7n/EDkWLQKDNImDjn4wjMqa8xjq4oAoGN9lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722288607; c=relaxed/simple;
	bh=g/WJVRftOQU+p5sUv/q6VS/YTP00ki2GYTNMRQkeiXA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m1XZWOdT6a7As3K7W7eQlqBkB9+Ppk1QAP37L58Qq0pSwjV/cjBv/5OXno9jpdJbekA6UkSvCpJJJzE1ktKRB2MFxVfwVpwDHPqrQlwcJvhru6ngeYwHdG8sOHWtSeoOJK26X60k2N9hrNzJ9U7ukdiKrJSQjMzp6LWe5QWiKBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YLWmfrOD; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-52f01b8738dso3983492e87.1
        for <linux-usb@vger.kernel.org>; Mon, 29 Jul 2024 14:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722288602; x=1722893402; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GEtdATLoAu0WQzNF8Gz28caMWwGb1q0CyaodS5o89po=;
        b=YLWmfrODQuTZ6sPBEHjjwMM1FUg0TTYSOK68Li0YiVqUu42/RuEI9gVyqEaiLvvx6e
         xAbEygTGbZxeaniVECvTBiX/Jf6fE5/nPRctWAjVrZD5FgJwaxArUHwtSVCd/pqUVqCC
         XDsQv9eleLpC2igRG0MzRkYmXIpwv6NmyHImAiZlVbaJz5tajy83UViH2Jd7NYrg4ZzB
         0gS9XjXwoHOzUg65//N3sQumhGBbmQj2BqXp4M/JxbX+zOEEE4uXN1taT32wVXArqc+g
         WK5NsNMOwX1wdd1aJS7yK/q+zxwPzWUYHBezPp9i0Xl6BMT4J1L7Ck6ljq0JW2FGeFk/
         tkpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722288602; x=1722893402;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GEtdATLoAu0WQzNF8Gz28caMWwGb1q0CyaodS5o89po=;
        b=vMP0dDFLDoKZl68QrENPV7jteriBRQ9tPmhKa1nOdM233TY0TUk9KgE8+mz98hHBM0
         r5mOObVNZqoe1goyHqh4li6I5P/3MFpywYBxz0QGgUJchLjSxrHuC7jM+Im3qIbAl4xZ
         OmPDRtnA5fOSa3WQi4gCl1nlmgMuuGZ4wNbfolcoSQikDeyBkiWbYNEkIvgd9fWknQDl
         w6P5TnLC3wMfKJSwJrw12IJ2bGajy8sZDyoOlJnyKkZAXtbi5EjSGK0KNuzP0EI7Y1sO
         Qd5kQdYW8PmNnG4josob/5Te29H+/7k2mx56plyAQOOK1MEohFFOx+k2h2PdN2g65lMz
         OJgg==
X-Forwarded-Encrypted: i=1; AJvYcCVviGTxsSW5jLVo3hm6VuxpC1qwGbF2s0xySabUSmzLjpW4VGn6Po8r3Hl8B8oW/GB/Lk5shSs0BUoVK/geAdRLB3FUc/Eppe42
X-Gm-Message-State: AOJu0YzUUe5NaC4SzaUbebW4ZmfiYc7bBto4Rb+tcU98dTHLTbpjWCBW
	cYn67KAymUCA/zUOkXOILcnswGFiR0QFumxPCKizvJD9vHdTRqsXCR/6SZIFu2A=
X-Google-Smtp-Source: AGHT+IFPvmk1OwviBwRVVszZXvlS0BNlYTjVmbK6wi42PM0zXUgltu3j3dtvA+jjWTedypHUKKE+bg==
X-Received: by 2002:ac2:4bcc:0:b0:530:aa3e:f397 with SMTP id 2adb3069b0e04-530aa3ef480mr117816e87.43.1722288602194;
        Mon, 29 Jul 2024 14:30:02 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52fd5bd0bb5sm1641116e87.76.2024.07.29.14.30.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 14:30:01 -0700 (PDT)
Date: Tue, 30 Jul 2024 00:30:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Danila Tikhonov <danila@jiaxyga.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	andersson@kernel.org, konrad.dybcio@linaro.org, rafael@kernel.org, 
	viresh.kumar@linaro.org, heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org, 
	kees@kernel.org, tony.luck@intel.com, gpiccoli@igalia.com, sudeep.holla@arm.com, 
	quic_rjendra@quicinc.com, andre.przywara@arm.com, ulf.hansson@linaro.org, 
	davidwronek@gmail.com, neil.armstrong@linaro.org, heiko.stuebner@cherry.de, 
	rafal@milecki.pl, macromorgan@hotmail.com, linus.walleij@linaro.org, 
	johan+linaro@kernel.org, javier.carrasco.cruz@gmail.com, quic_kriskura@quicinc.com, 
	lpieralisi@kernel.org, fekz115@gmail.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-hardening@vger.kernel.org, linux@mainlining.org
Subject: Re: [PATCH 04/11] soc: qcom: pd_mapper: Add SM7325 compatible
Message-ID: <s7mgtc2llbn4daw3culapxfe6bbwcc7r2rla7obu2ts2q3jkqp@fpvqyvjqzkpk>
References: <20240729201843.142918-1-danila@jiaxyga.com>
 <20240729201843.142918-5-danila@jiaxyga.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240729201843.142918-5-danila@jiaxyga.com>

On Mon, Jul 29, 2024 at 11:18:11PM GMT, Danila Tikhonov wrote:
> The Qualcomm SM7325 platform is identical to SC7280, so add
> compatibility leading to SC7280.
> 
> Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
> ---
>  drivers/soc/qcom/qcom_pd_mapper.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

