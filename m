Return-Path: <linux-usb+bounces-10778-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 55CAB8D7FC0
	for <lists+linux-usb@lfdr.de>; Mon,  3 Jun 2024 12:10:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C6ED11F213A4
	for <lists+linux-usb@lfdr.de>; Mon,  3 Jun 2024 10:10:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D71282489;
	Mon,  3 Jun 2024 10:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WeahWID4"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 254A881735
	for <linux-usb@vger.kernel.org>; Mon,  3 Jun 2024 10:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717409411; cv=none; b=Nggn3SmH8tEAlLRrTCVI6rds6je5et5RkNqaPPL3+rGpFg9kTepZ0gH9fS0IRDtjWwHW2vO2aZ9F217bqomsBjHpyJnWYIo0IPjs9ICarD37rSzlrzJlaGLUd5D4CQq5bq/GC27WPVeR7RkS6MTo/uSFgcuRa7fU6MTPqZsxHQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717409411; c=relaxed/simple;
	bh=axCaytBs4Nv5HrnZxUnB+aeuBj8JrqMrdedG5ZfR364=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iuaOo/7N37QedT8VHadsleWIMe7nOmkcAe8ye77L1yZwR5lQEnOXct8XFTr262xGs6paz0Cinz8TW6mvd/0pLYBdoT384EdKxOXQ1ZEo+1Wlp7yTRguT2rjy2UfSgvxlrFrhXmbbWjBuEoGBKs5j0VOyAaRy7lSQqjwGTwcc+zU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WeahWID4; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2e73359b900so48611101fa.2
        for <linux-usb@vger.kernel.org>; Mon, 03 Jun 2024 03:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717409407; x=1718014207; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/oQILeAKHOw/6kmTRnoLAXLSnuKdCsLUhNLs5GdUc34=;
        b=WeahWID4PFQSo+SmAHT5DaUUwVp2NjBxfgdvPVQhFTaCsd18cuzlEXE3gMbktt9UpR
         TlpdYFJ8RZYv46dvvHJzCk4alEPGZuwrKVRHivKH8Xzzh4pb47vRR2mWSSEokzdlFeVU
         qx0sJMjy2TrB2WuohOOKeAfWn4nj/Cu1lZ0rQnE3iCPLuVfEjjpBve2fYUKrCjpy59Q2
         /2z9TDsx65CH0JucJbEU7N3UJA5pklTg+xJ1WzoZ5nYmCeRxTGGHOuLKalxQKQzAeG+t
         0Kj3bjQZj3z+r0nV1gB2arZlgY3tpKW2iv4UyIc/PUMeKpJKWJ/kKvEgazymXKIDPNn/
         Focw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717409407; x=1718014207;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/oQILeAKHOw/6kmTRnoLAXLSnuKdCsLUhNLs5GdUc34=;
        b=mGoqvr1ZA38k/P4e8WLa/23Yc0u2TyN7CSo22n4y4rs+RZ+VVfSIOXtO2cGqhT4Uom
         Wh8PW2i0LcCgqcV0p59u6bXlnTNtVChZVOYMTU6UxxR0sRRmfeYWTIGQcgcog9rMmH7b
         rAhgbT5Ocx1eCut4/yFxV4bEQjtX+z2rTyi4D9TTacV7n5FmIrBO9zrz+fbvErBaETSg
         y0WUjbedJbU0WfcYfqOgd21vuNxWMtOD6t0XLFIuBpHNgGs/+SQSuX6H2u9fEvMvHymi
         siq9NIz6q3xaMR36kxFmVS0KW3w7Q9ecYCR/fYV2+Pv/vCA1Z6QVV5FF31g8S64TgH2x
         MYWQ==
X-Forwarded-Encrypted: i=1; AJvYcCVyEpZrvtCUxnPkPBMoH+bMiNXZ9Uc5OgJ5sqtg0VcqRfwLZBB4UvWTKvmpSE0duM4h8QfMWaB+VpSxX/OAokmMZ/gRgbnGGvEG
X-Gm-Message-State: AOJu0Yx6PSsE0vmvtZV2nUMLVhxw2RtIAVjwEjwSFlhPsJpoApmQOPoD
	WIXl648XYtTi2JzdEAMC/pfOCIvVdC2lZBr2NCCLtKVbMOoOUr65yexto1oPtWY=
X-Google-Smtp-Source: AGHT+IGn3CzzELML6N16hK8AnLGIUEFMcTTvwgUdRPEpFKKFP4W6B3EpYysrx8TTkgAynFdvKb3M2w==
X-Received: by 2002:a2e:be85:0:b0:2e6:b00f:da92 with SMTP id 38308e7fff4ca-2ea9510c2f2mr63295851fa.24.1717409407334;
        Mon, 03 Jun 2024 03:10:07 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ea91bb4c07sm11274131fa.45.2024.06.03.03.10.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jun 2024 03:10:07 -0700 (PDT)
Date: Mon, 3 Jun 2024 13:10:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Francesco Dolcini <francesco.dolcini@toradex.com>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>
Subject: Re: [PATCH v2 2/2] usb: typec: mux: gpio-sbu: Make enable gpio
 optional
Message-ID: <mkrpe3w54u7dkwjzhbakcvjry2ot5uvwjd4fasgirdcgsjbgdb@53q4a4f5ecix>
References: <20240603083558.9629-1-francesco@dolcini.it>
 <20240603083558.9629-3-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240603083558.9629-3-francesco@dolcini.it>

On Mon, Jun 03, 2024 at 10:35:58AM +0200, Francesco Dolcini wrote:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
> 
> The enable gpio is not required when the SBU mux is used only for
> orientation, make it optional.
> 
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> ---
> v2:
>  - removed useless NULL check for optional enable gpio
> ---
>  drivers/usb/typec/mux/gpio-sbu-mux.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

