Return-Path: <linux-usb+bounces-15074-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A629777FD
	for <lists+linux-usb@lfdr.de>; Fri, 13 Sep 2024 06:34:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7838C28395E
	for <lists+linux-usb@lfdr.de>; Fri, 13 Sep 2024 04:34:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 503BE1C68A3;
	Fri, 13 Sep 2024 04:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NRT3d5Jo"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EE011B12C2
	for <linux-usb@vger.kernel.org>; Fri, 13 Sep 2024 04:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726202074; cv=none; b=S60MKPtvGTAFHfeCzP/GDowtk4xivu44E5ZYbp8DLYobR/8gSS7uKgjitVg5P5oE0B45zXKJcatAeyFR+W/0zhtFcgUiTlvt8k8jrtWtwWasNY8osQkTPBLh7nG4HpmPEhNJ38LKMLhSMrXrJgyzjfUYahTlpqaMPsvxgykuGSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726202074; c=relaxed/simple;
	bh=i+YW5x3oXdOe6aNA3F6jdabVaAjdXbLrU49a6yZAwfQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YHZ3c+oQPb2JLtAz3xOqGUhWnM51alOOluDCyGxz7VDrAuynrY6zojTOJfRXyPf+kbK55uQpcYtufUIKBHcp27kR99OFbqRZf/4cEp9jv2mT02Ecnh1cu7yGTpGceTvY9nId9Z0N+lVwTKql0m/vqmY2owDdFWBOfvTqsigWxVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NRT3d5Jo; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5365c060f47so2040776e87.2
        for <linux-usb@vger.kernel.org>; Thu, 12 Sep 2024 21:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726202071; x=1726806871; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=D3zCgHcIRWIuwL2pE1w8r+7GPLuANjcy7y4koldLja0=;
        b=NRT3d5JogQNhQB8T3BiGykgH99ftf+C97E3A1gOZZWL4jUG9ClATrgCSwPNCTzDo9z
         id3UJoUe0HrLBtU1rnqfy8HsSLyUwpJwVvlpvQJYYuUSydrcvcWecGOLd/2Gb2+zFsA5
         u55ihY7tYOmLQ9YnVxo91MRIaqOgnJE2ip7YbOzxcavy+FaegUE88vx/Hbe3eJDINnxA
         QKYi5MLhw+QPlhCcW3U7/OFmMViYAAviOoAjFRjQqpqwFMqc9PpDLclrw15tpUxlLZTs
         uUkBb4gu86eeb7LAKUvjmaeZ9AqS951fCSoIv91ta8g+sBCZOCkxDh3Z7XgqwOU05mtO
         0yxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726202071; x=1726806871;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D3zCgHcIRWIuwL2pE1w8r+7GPLuANjcy7y4koldLja0=;
        b=VwxmrGlodmcktBhqHWkIfwwhsBUdiVszH2cTHEOV683YwTzzAk4b5HRC4liQUYnpOS
         7VxDrrFU5ZXxKLqtxfheLCnIpMYF1KZXUlOMXEHlS5DyYc9fXH4cZXIfrh/MsPoJEas+
         lOAq1K/BsCQkgxYZwsrw7nrbIDPlzkCCZlLWklAt6AF4r9zhe23gz1O6a0z3+JZyG6xA
         eqezgf+79ifS3152z49dTMA87o+PGnZ8YY818YSEyndIrzeOa+GrG9qfjCyFh7hQCtFx
         1hdoJWHX7bAf7oWmRY5VgRzba5N0Qe9WKvIXpK1auivH2GjEhbv9QXxdU/RmqioIyX+r
         EL7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXlW42mu0tzEHH08ThyftALe64NR3S6CzLwNLA2kWA3ePbsM+35EACzF8Offq+JyfTJew1jFw/iQ8Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+eCSOk+MWzP9UU3nRvZAhdZ1M9xLJswQqa50o30vz73i/Pzng
	ZwF09Av2ls46gS1XsEZImkVfcuGkd7Ew7WFsKUrGNHtklj5RAmz7zzotk6D0CWQ=
X-Google-Smtp-Source: AGHT+IEHYmu7PuWpkUAILMsrBo9Hk21qDDXsGW7HVKVukK3J/+968wa2wvge4FlAOf/lAp103OKBVA==
X-Received: by 2002:ac2:4c48:0:b0:52f:c27b:d572 with SMTP id 2adb3069b0e04-53678ff6301mr3174235e87.59.1726202070212;
        Thu, 12 Sep 2024 21:34:30 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5365f8cad26sm2105854e87.136.2024.09.12.21.34.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 21:34:29 -0700 (PDT)
Date: Fri, 13 Sep 2024 07:34:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Amit Sunil Dhamne <amitsd@google.com>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	conor+dt@kernel.org, heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, kyletso@google.com, rdbabiera@google.com, 
	Badhri Jagan Sridharan <badhri@google.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [RFC 1/2] dt-bindings: connector: Add property to set pd timer
 values
Message-ID: <ascu5yztalk62fernydttkywnqemnmjlcflzdyfmt7dzuzngho@vvxrnvwhfdmk>
References: <20240911000715.554184-1-amitsd@google.com>
 <20240911000715.554184-2-amitsd@google.com>
 <5iakowhmqc3hbstmwbs6ixabr27hf2dfz2m4do4qvsrtgrdn72@r7xqawwgebla>
 <dc323138-3bbb-4e23-91f1-d6b80cb7bb72@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dc323138-3bbb-4e23-91f1-d6b80cb7bb72@google.com>

On Thu, Sep 12, 2024 at 04:26:25PM GMT, Amit Sunil Dhamne wrote:
> Hi Dmitry,
> 
> On 9/12/24 3:05 AM, Dmitry Baryshkov wrote:
> > On Tue, Sep 10, 2024 at 05:07:05PM GMT, Amit Sunil Dhamne wrote:
> > > This commit adds a new property "pd-timers" to enable setting of
> > > platform/board specific pd timer values for timers that have a range of
> > > acceptable values.
> > > 
> > > Cc: Badhri Jagan Sridharan <badhri@google.com>
> > > Cc: linux-usb@vger.kernel.org
> > > Cc: devicetree@vger.kernel.org
> > > Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
> > > ---
> > >   .../bindings/connector/usb-connector.yaml     | 23 +++++++++++++++++++
> > >   include/dt-bindings/usb/pd.h                  |  8 +++++++
> > >   2 files changed, 31 insertions(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/connector/usb-connector.yaml b/Documentation/devicetree/bindings/connector/usb-connector.yaml
> > > index fb216ce68bb3..9be4ed12f13c 100644
> > > --- a/Documentation/devicetree/bindings/connector/usb-connector.yaml
> > > +++ b/Documentation/devicetree/bindings/connector/usb-connector.yaml
> > > @@ -253,6 +253,16 @@ properties:
> > >       additionalProperties: false
> > > +  pd-timers:
> > > +    description: An array of u32 integers, where an even index (i) is the timer (referenced in
> > > +      dt-bindings/usb/pd.h) and the odd index (i+1) is the timer value in ms (refer
> > > +      "Table 6-68 Time Values" of "USB Power Delivery Specification Revision 3.0, Version 1.2 " for
> > > +      the appropriate value). For certain timers the PD spec defines a range rather than a fixed
> > > +      value. The timers may need to be tuned based on the platform. This dt property allows the user
> > > +      to assign specific values based on the platform. If these values are not explicitly defined,
> > > +      TCPM will use a valid default value for such timers.
> > > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > Is it really necessary to use the array property? I think it's easier
> > and more logical to define corresponding individual properties, one per
> > the timer.
> 
> Thanks for the review. The reason I did it this way was for
> convenience. If in the future someone else wants add a new timer,
> it'd be convenient to just add it as a new macro definition in pd.h
> rather than having to define a new property each time, especially
> if folks want to add more timers (scales better).
> There are 3 timers already and I am working to add a fourth in a
> follow up patch if the current RFC gets accepted.
> 
> Please let me know what do you think?

I'd leave the decision to DT maintainers, but in my opinion multiple
properties scale better. Having a single value per property is easier to
handle rather than changing the tagged array.

> 
> Regards,
> 
> Amit
> 
> > > +
> > >   dependencies:
> > >     sink-vdos-v1: [ sink-vdos ]
> > >     sink-vdos: [ sink-vdos-v1 ]
> > > @@ -478,3 +488,16 @@ examples:
> > >               };
> > >           };
> > >       };
> > > +
> > > +  # USB-C connector with PD timers
> > > +  - |
> > > +    #include <dt-bindings/usb/pd.h>
> > > +    usb {
> > > +        connector {
> > > +            compatible = "usb-c-connector";
> > > +            label = "USB-C";
> > > +            pd-timers =
> > > +                <PD_TIMER_SINK_WAIT_CAP 600>,
> > > +                <PD_TIMER_CC_DEBOUNCE 170>;
> > > +        };
> > > +    };
> > > diff --git a/include/dt-bindings/usb/pd.h b/include/dt-bindings/usb/pd.h
> > > index e6526b138174..6c58c30f3f39 100644
> > > --- a/include/dt-bindings/usb/pd.h
> > > +++ b/include/dt-bindings/usb/pd.h
> > > @@ -465,4 +465,12 @@
> > >   	 | ((vbm) & 0x3) << 15 | (curr) << 14 | ((vbi) & 0x3f) << 7	\
> > >   	 | ((gi) & 0x3f) << 1 | (ct))
> > > +/* PD Timer definitions */
> > > +/* tTypeCSinkWaitCap (Table 6-68 Time Values, USB PD3.1 Spec) */
> > > +#define PD_TIMER_SINK_WAIT_CAP		0
> > > +/* tPSSourceOff (Table 6-68 Time Values, USB PD3.1 Spec) */
> > > +#define PD_TIMER_PS_SOURCE_OFF		1
> > > +/* tCCDebounce (Table 4-33 CC Timing, USB Type-C Cable & Connector Spec Rel2.2) */
> > > +#define PD_TIMER_CC_DEBOUNCE		2
> > > +
> > >   #endif /* __DT_POWER_DELIVERY_H */
> > > -- 
> > > 2.46.0.598.g6f2099f65c-goog
> > > 

-- 
With best wishes
Dmitry

