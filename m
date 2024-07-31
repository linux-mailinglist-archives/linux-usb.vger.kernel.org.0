Return-Path: <linux-usb+bounces-12724-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 341ED942FC4
	for <lists+linux-usb@lfdr.de>; Wed, 31 Jul 2024 15:11:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DC7BB1F29E0C
	for <lists+linux-usb@lfdr.de>; Wed, 31 Jul 2024 13:11:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 172B11B150A;
	Wed, 31 Jul 2024 13:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PaX3JNIz"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7835F1B1423
	for <linux-usb@vger.kernel.org>; Wed, 31 Jul 2024 13:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722431448; cv=none; b=UFdZu60GyWX7Z+61RqJ5WsNfW1oVPMCBV8RF8SR8ZiY5zjOtrek+F1Ipb72t+i4EpOztwfSlTJaB8f6jghZDIO7QFl6ortM3x7HB5Tyk77RcyM/L3m5mKzRv08U+Lcbi1VZBCCiBlnE/NGfVXmvcgSGg/Xiltt3/ywQkUcAHSR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722431448; c=relaxed/simple;
	bh=dX9kVn4xUeFUcfWVpo/tCIEzYvdt9I8uq2wPXw5+h4M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QT07AMNdhGT9cQW5kbg9g+9oLg2AEe729Uv/jHdwn1eKfh8A320XakhLyePcOsMBXXkCygpVh20Hw+ZZfpxqbZddYsB1Q8mJJ97q4MuQScpMK9TzN7AJDFzW+1zQ3Psnq1W9uOXKW5hL7xWJpINQfcN5l+VVOcC3KzKvGrcE4Sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PaX3JNIz; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2ef248ab2aeso85822571fa.0
        for <linux-usb@vger.kernel.org>; Wed, 31 Jul 2024 06:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722431443; x=1723036243; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BtHopVaA5DnFXJsXndmzbhLYPQA3VMI9Krw2dYXiGpg=;
        b=PaX3JNIzFYbsCPDfbtmZfIW7qx9/DubdYdvDdxTxqwxogNPETLetmlgRF9pzbfd6p9
         mITEV62n3OGwGaO0xCyRQBjYTT7EaKaHUK/j+G9WIcKgdHEs07L9BSnVhV1YKOH8X+MX
         FlmCOHZ3AwVBNGoSBqB5+DhpwDnYYbr+vFPtmNUnT25mL8qUwtRAzfvLfrE6VqzU9aiH
         g5+gP5Piv1V7BcafR7OEbjP8gruO3n4KJjgpUeDLCd5fxgfleiJ+aQnSIeNQDSYGfYDi
         l9h52r20BwNGKN51j+cOASuathL35kiLaF+eP6oHtP0+8IRhMqbZbpaUCaQTVX1LUdBb
         RzWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722431443; x=1723036243;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BtHopVaA5DnFXJsXndmzbhLYPQA3VMI9Krw2dYXiGpg=;
        b=I88IbEQYsG1HAw0sTdedBjTC5+KnH4AqKD4dHaTblGFHITHyFBK3EkqhPp4KZnzDxh
         n+SfGQZ+Imt2kuFlLlWNN3guTUx28WxfiamdSftY69R8FvXJj4MkgiP7DEPmn/saGEml
         SbuwV3TSFnk0fL0rhnAiR2slvoc9JVjG9GKBc9KwN8GQJKvK3dM8LVly1BvFxOW5qaaA
         vgEkTYY3iErHrihgf3GhN+FWuHIUO/h4vdmJAQSeG/r8N2U+in51yjAmQYhyWd/j6n/Z
         A+RtqeS92bvbsJhzhYYfvwS4kVqvPYveU2vh6l2DI6DVZy8zFi3a0WK9xXQKIPlyntrd
         0sdw==
X-Forwarded-Encrypted: i=1; AJvYcCWu1tdATe8v3BZiX3cnKUc5uGtKWPa/LoFI4TXTcilZuWwi5+EbtHrSqECJuEhEu6NYdkQrbVKHn5mlwOMzPW23ugJI5Si65E1j
X-Gm-Message-State: AOJu0YzM759RB97xRrH9sSpV6Z6pZBHPrOxDa/VYGvsTRbvwmQliMK3X
	3udzrC7RvYlFdGb1DFUi2DdR0w7yEg2TUG4W515l0kHEFWW4gfr+AZ7FVPSlN68=
X-Google-Smtp-Source: AGHT+IFKydn1H0rLRwTRWvuLChZ8ue/chEQn7wpdnSNhAgn3Eg7AyBP8EzlGjX88wgzpDyvecJjSEw==
X-Received: by 2002:a2e:a30e:0:b0:2ef:18ae:5cbd with SMTP id 38308e7fff4ca-2f12ee289ddmr117984021fa.27.1722431443345;
        Wed, 31 Jul 2024 06:10:43 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f03d075447sm19696621fa.121.2024.07.31.06.10.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 06:10:42 -0700 (PDT)
Date: Wed, 31 Jul 2024 16:10:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Souradeep Chowdhury <quic_schowdhu@quicinc.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: misc: eud: switch to fallback compatible for device
 matching
Message-ID: <blagk4fkptszkmuk7qkeiptpi6uzigw4t4t6djlb3uxsu66eoz@vrt5u6ag2arg>
References: <20240731054438.9073-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240731054438.9073-1-krzysztof.kozlowski@linaro.org>

On Wed, Jul 31, 2024 at 07:44:38AM GMT, Krzysztof Kozlowski wrote:
> The bindings require two compatibles to be used: qcom,sc7280-eud
> followed by fallback qcom,eud.  The convention is to use fallback
> compatible in OF device ID tables, unless some device-specific quirks
> are needed.
> 
> This will also simplify matching any new devices - they will use
> existing OF device ID entry, instead of adding a new one.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/usb/misc/qcom_eud.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

