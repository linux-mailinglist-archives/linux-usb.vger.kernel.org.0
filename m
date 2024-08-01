Return-Path: <linux-usb+bounces-12847-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 057BF944A9B
	for <lists+linux-usb@lfdr.de>; Thu,  1 Aug 2024 13:49:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B3DAB2832D1
	for <lists+linux-usb@lfdr.de>; Thu,  1 Aug 2024 11:49:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5408518E02F;
	Thu,  1 Aug 2024 11:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UYcCNZpD"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2338A18453A
	for <linux-usb@vger.kernel.org>; Thu,  1 Aug 2024 11:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722512979; cv=none; b=cktFWQ0jVJDd2ENRmbnDOclJpjDoMH9uah5nk/32JMwvoVbX5qhaGLKQA5nJJxhpfpDFdbPV2ouBDk9IM36huX2C77kRJlMe4dSY1j7DnD6QI/JVW+WHcoqoGW479gYqfKOtYy17jnfypstJqJQR43piXycYF3O5F0CbTC3+MI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722512979; c=relaxed/simple;
	bh=voQL+RgQ/DCu+XY1zsYqJzegt9t4UFkI6SjdFRsKwG0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gLGMw6Ez/JBfnLElY/Hs9P8uEvO4yv9k71dxklhKZeQK9J/9xeqimOFQYQKJV3SAIiKx5nBjUwP1C5EispKQd2bjLhhxRf2s0Hm3Ie4/1+tYOLYeqGxrYTl/4phF8kW4kkjn5ADbMlP3JM995kN84W1qYZyo2IeP5xlDvmvCzKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UYcCNZpD; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2ef2cce8be8so86353431fa.1
        for <linux-usb@vger.kernel.org>; Thu, 01 Aug 2024 04:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722512976; x=1723117776; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=h1PUnjPeUDvBy5a/qGAVD2LWs0NJbDzW/+TnH0NDKJE=;
        b=UYcCNZpDuB41sJalJ3JNo9JP3jysGGXDg4WHzoEx2mcojR+Bwl67qqW7vENnPBhBek
         W8QCJRjHcGFtb0Yd3atwXJsEfVvnDsCk0fORkyvDyFOnPddeFYGL+PCtNjea6HGTQ5jQ
         +eLZnl4LT+9+QlXlW4dvqvRT3tXIkvgXA+hDjc4ptsow6fzNJZI2FGq0ekkgcAcbQSPm
         TfBYGCVdjADTeFq0Xrg7akThxSlMO7+hCySjT6zfl1JN1AYS2B/YHFcl7ixrRcFvxVkb
         U0XlzQS24dF9j1cuSxA3yIygibTvu3Y/FOnzkDYze4GiNo3ad/4Jcr+BnV8OqDqeLpEN
         OP7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722512976; x=1723117776;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h1PUnjPeUDvBy5a/qGAVD2LWs0NJbDzW/+TnH0NDKJE=;
        b=pPx1cnbafcuJ1GTz16DfqXLA/vGeqCkhnBq0KYhqaxkOSGMpcJ5mewqkHSgR2kQV07
         RCVyNZZnUSOEk6n4XXymcJVwoFaiGwkRqQuvolZ7mq3ra6lMzWYJ3UXWTwUylxGYvnl6
         H90MvakQfiLZixSXD2OqRVlfkPvB/ZzIGQRO6v0bPIwvwg/9G0mf+qLrNFiJv66UzNUD
         JzhYWIOsDkGwPzDHfURkRG4kVowxXdQ4ARVEZBSb/M0RdRybZxRbPjX4E0Hx1Pfp39TC
         Vu2o6GVMRUz+Scwb8t0+1mKxYjtdTB2RfirZRqld3ULp0en4Tiqb0hgCVPZjlO3xkfx5
         daEw==
X-Forwarded-Encrypted: i=1; AJvYcCXdIU+v1xVejISKoKUGI+qDa8SS8Q1PuUBYvNE4DySfw+ihj4RQHubK6aOCztCLAsfDTIopKmKvgKeJtTb7/jJUPdlk/WUSi6lo
X-Gm-Message-State: AOJu0YwiQsBLYUm0XCqi4j9bAiKpZZnHjuls6NAJuttQ+SDdHTJYZbwq
	F9yEIbX4rJpM8rqIVVPcKM9EHayHcaYOUA0Z0YXJewGNiNC3emcWi7DmrVpuRU0=
X-Google-Smtp-Source: AGHT+IFF1i0H7BZEZYcDcfJ2MYDCmYQ+0hwVe6QdDANHb1J/F4Ii5xva8aot+Gve+rt+MROR8D0bRg==
X-Received: by 2002:a2e:6e12:0:b0:2f0:1a8f:4cd2 with SMTP id 38308e7fff4ca-2f1532d3db9mr16940521fa.33.1722512976087;
        Thu, 01 Aug 2024 04:49:36 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f03d04e02dsm22968451fa.84.2024.08.01.04.49.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 04:49:35 -0700 (PDT)
Date: Thu, 1 Aug 2024 14:49:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, andersson@kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, jun.li@nxp.com
Subject: Re: [PATCH v2 1/3] dt-bindings: usb: gpio-sbu-mux: Add an entry for
 PTN36043
Message-ID: <3akk6hydu6iguqik3ek2pb67knihnjcepyxtbsnnasq74ikpsg@7txsek3mx5rp>
References: <20240801064907.3818939-1-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240801064907.3818939-1-xu.yang_2@nxp.com>

On Thu, Aug 01, 2024 at 02:49:05PM GMT, Xu Yang wrote:
> Add a compatible entry for the NXP PTN36043 GPIO-based mux hardware
> used for connecting, disconnecting and switching orientation of
> the SuperSpeed lines in USB Type-C applications.
> 
> PTN36043 datasheet: https://www.nxp.com/docs/en/data-sheet/PTN36043A.pdf
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> 
> ---
> Changes in v2:
>  - add Acked-by tag
>  - s/SBU/SuperSpeed in commit message
> ---
>  Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml b/Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml
> index 8a5f837eff94..152849f744c1 100644
> --- a/Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml
> +++ b/Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml
> @@ -20,6 +20,7 @@ properties:
>      items:
>        - enum:
>            - nxp,cbdtu02043
> +          - nxp,ptn36043

PTN36043 isn't an SBU mux, so it is incorrect to declare that it is
compatible with the "gpio-sbu-mux".

>            - onnn,fsusb43l10x
>            - pericom,pi3usb102
>            - ti,tmuxhs4212
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

