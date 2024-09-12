Return-Path: <linux-usb+bounces-14995-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C434976652
	for <lists+linux-usb@lfdr.de>; Thu, 12 Sep 2024 12:05:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8088A1C2331F
	for <lists+linux-usb@lfdr.de>; Thu, 12 Sep 2024 10:05:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 851B419F11E;
	Thu, 12 Sep 2024 10:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fWDHyUjC"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB3919CC19
	for <linux-usb@vger.kernel.org>; Thu, 12 Sep 2024 10:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726135542; cv=none; b=s3KdiBe1pxJMukYIkjlkufmoopeJk4sbPKnavQ0hpkqT1kwdiixdsaWISzKHY/Dui+2W+3y/BNcU3JT2iGx+7U9mtt2SikK1lZ2X6cB+7QU4mu+c3gofl5UJaQFnGzDskR1wr9nolwOdKt4k17oF3CQ55aJiNxe15jy7fCAzvCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726135542; c=relaxed/simple;
	bh=hYu/0pKiliNNaOhUGCcaNaQSuDVUTyPvYMaGE/XgDx0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jPMIGKZ82LIeT58E/EHWkYeGIvdCql73+Bd5vC2FDbngi5/HVfE9I9i8C7dDq0DQ4WYN7q0ZvE2f82pLm0UOeuRSEt6vhZ10Z6q48TS0+BIvj1cD43WB2NHci1z1obPEyjzz668R8/PfZLQJsN2/l/K/pvPNUPoJVhtoAjYhSg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fWDHyUjC; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2f7657f9f62so9352841fa.3
        for <linux-usb@vger.kernel.org>; Thu, 12 Sep 2024 03:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726135538; x=1726740338; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=adFD0Kl33h6g1TsBUVQtVkGuwXl9NRS/lzgMPLTfIfM=;
        b=fWDHyUjC0DnNSVuAjNTPVfRlVPsqCmPWQGuFiNBZ2Zhm+Ke0rYmaHw+c3gLtBMtfvg
         RgNCyptQqIGjSaT9KZdDBKkl7QRfh3L5+t8otQrAAzqqvIKQ8oRgHO+yaLplF+AoTBMO
         qCGlCndTyW2onviDDnN9qlE5M4H7SnupuF1v81pFbyHVNwgMz7cbA3oVp6NGoevr47AK
         OzPg310rRnljVXSj4xxhQYl5qH7acWfCBx9qQauNlKlB8WvG+MVLcJVZOspYQ0XKoQzD
         obTpjlAfWZh54vaRHxUS6cp+hEt9Uvr70r81vmv8akDMSMNYjzRAFcGHqLqv2g4U3KEZ
         fvDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726135538; x=1726740338;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=adFD0Kl33h6g1TsBUVQtVkGuwXl9NRS/lzgMPLTfIfM=;
        b=B9ojn1YdzooWTa+6ZV+h2FYim1ehsfelBtbcL9lLCNnDwsjVVKcyKw7VtDZPMsis8Y
         +q77MBFw6GvwWidwC2iRyRE3HGi0/Ni2sinnaAaH+QLLjSzcx4SJsz2lL4nJRyqjcLU1
         LdiNtv7FMoPhdu7NwZV3HSeEyNCo0TAbhxDsBkUiZ9O2deTt77G52xDqetAGTu796F2q
         4p1oz4z0ZlhHb+ZzWHfwJUVpPv1K16pRotdxz0wUrdz2YmuAyunCk8lTdpU2htkicnmp
         iSaNeaDmRLG6kgERj0jlAosvQhbQDL/WN7W44SUVt+svUbYT+pv1w6k8cida6a/EODPi
         NTsg==
X-Forwarded-Encrypted: i=1; AJvYcCU06ZfhByW1sprRbTgHSGfUP+3qGggeo7VisXitFKFR5mzPcPGz/1urRyLUQtc/R/VqRsKoyn6zQu0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUcSsEXwopqxc231oFxZ7v1vzY2XbiT7vA2LQuRedWwLNtZ/+d
	WSA7AEl6b7f7ag7V0olOzDrRRQn8ZFJsOGLWIjIBYsDGmLqIaNhhXfxYviStqtY=
X-Google-Smtp-Source: AGHT+IEFyn1rrgMQ0CScgFWYq4pfR9WOEvH22bcAF4GZsfQdIo2mhT1yuCXm7GUupNryB4si7OCcag==
X-Received: by 2002:a05:651c:2125:b0:2f6:4714:57dd with SMTP id 38308e7fff4ca-2f787f582b0mr9597831fa.45.1726135537736;
        Thu, 12 Sep 2024 03:05:37 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f75c008f89sm18141951fa.57.2024.09.12.03.05.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 03:05:37 -0700 (PDT)
Date: Thu, 12 Sep 2024 13:05:35 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Amit Sunil Dhamne <amitsd@google.com>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	conor+dt@kernel.org, heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, kyletso@google.com, rdbabiera@google.com, 
	Badhri Jagan Sridharan <badhri@google.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [RFC 1/2] dt-bindings: connector: Add property to set pd timer
 values
Message-ID: <5iakowhmqc3hbstmwbs6ixabr27hf2dfz2m4do4qvsrtgrdn72@r7xqawwgebla>
References: <20240911000715.554184-1-amitsd@google.com>
 <20240911000715.554184-2-amitsd@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240911000715.554184-2-amitsd@google.com>

On Tue, Sep 10, 2024 at 05:07:05PM GMT, Amit Sunil Dhamne wrote:
> This commit adds a new property "pd-timers" to enable setting of
> platform/board specific pd timer values for timers that have a range of
> acceptable values.
> 
> Cc: Badhri Jagan Sridharan <badhri@google.com>
> Cc: linux-usb@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
> ---
>  .../bindings/connector/usb-connector.yaml     | 23 +++++++++++++++++++
>  include/dt-bindings/usb/pd.h                  |  8 +++++++
>  2 files changed, 31 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/connector/usb-connector.yaml b/Documentation/devicetree/bindings/connector/usb-connector.yaml
> index fb216ce68bb3..9be4ed12f13c 100644
> --- a/Documentation/devicetree/bindings/connector/usb-connector.yaml
> +++ b/Documentation/devicetree/bindings/connector/usb-connector.yaml
> @@ -253,6 +253,16 @@ properties:
>  
>      additionalProperties: false
>  
> +  pd-timers:
> +    description: An array of u32 integers, where an even index (i) is the timer (referenced in
> +      dt-bindings/usb/pd.h) and the odd index (i+1) is the timer value in ms (refer
> +      "Table 6-68 Time Values" of "USB Power Delivery Specification Revision 3.0, Version 1.2 " for
> +      the appropriate value). For certain timers the PD spec defines a range rather than a fixed
> +      value. The timers may need to be tuned based on the platform. This dt property allows the user
> +      to assign specific values based on the platform. If these values are not explicitly defined,
> +      TCPM will use a valid default value for such timers.
> +    $ref: /schemas/types.yaml#/definitions/uint32-array

Is it really necessary to use the array property? I think it's easier
and more logical to define corresponding individual properties, one per
the timer.

> +
>  dependencies:
>    sink-vdos-v1: [ sink-vdos ]
>    sink-vdos: [ sink-vdos-v1 ]
> @@ -478,3 +488,16 @@ examples:
>              };
>          };
>      };
> +
> +  # USB-C connector with PD timers
> +  - |
> +    #include <dt-bindings/usb/pd.h>
> +    usb {
> +        connector {
> +            compatible = "usb-c-connector";
> +            label = "USB-C";
> +            pd-timers =
> +                <PD_TIMER_SINK_WAIT_CAP 600>,
> +                <PD_TIMER_CC_DEBOUNCE 170>;
> +        };
> +    };
> diff --git a/include/dt-bindings/usb/pd.h b/include/dt-bindings/usb/pd.h
> index e6526b138174..6c58c30f3f39 100644
> --- a/include/dt-bindings/usb/pd.h
> +++ b/include/dt-bindings/usb/pd.h
> @@ -465,4 +465,12 @@
>  	 | ((vbm) & 0x3) << 15 | (curr) << 14 | ((vbi) & 0x3f) << 7	\
>  	 | ((gi) & 0x3f) << 1 | (ct))
>  
> +/* PD Timer definitions */
> +/* tTypeCSinkWaitCap (Table 6-68 Time Values, USB PD3.1 Spec) */
> +#define PD_TIMER_SINK_WAIT_CAP		0
> +/* tPSSourceOff (Table 6-68 Time Values, USB PD3.1 Spec) */
> +#define PD_TIMER_PS_SOURCE_OFF		1
> +/* tCCDebounce (Table 4-33 CC Timing, USB Type-C Cable & Connector Spec Rel2.2) */
> +#define PD_TIMER_CC_DEBOUNCE		2
> +
>  #endif /* __DT_POWER_DELIVERY_H */
> -- 
> 2.46.0.598.g6f2099f65c-goog
> 

-- 
With best wishes
Dmitry

