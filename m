Return-Path: <linux-usb+bounces-16686-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9597C9AFA21
	for <lists+linux-usb@lfdr.de>; Fri, 25 Oct 2024 08:37:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1DCB91F230BB
	for <lists+linux-usb@lfdr.de>; Fri, 25 Oct 2024 06:37:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A22B71AF0BA;
	Fri, 25 Oct 2024 06:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GYs7q0Xf"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C83CD199FD3
	for <linux-usb@vger.kernel.org>; Fri, 25 Oct 2024 06:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729838222; cv=none; b=la4bGdnaIruRaIiFgAUbBXOmqRyCM2LBaFiD8BCR6F0AVJUF7FePLAYJoUPXsQxtJljpKUmDgBlzwhGqYrib1W8xX82cS9RWqSYRO1mbuH8O7ITrtJ8rD7Qy8ZFy2HMjDDtmGofpRM1RJDK9P2ifEvCAE5Ef+05NlcF9AMxfKZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729838222; c=relaxed/simple;
	bh=76iF+HoeaObIOvzYVxcE5SrRSGI44xQ5VLVhbj7HBHw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oNmshJcMANpdwr37A9PqYF7ZsacGUTq1khDuysvouZQOBRb5YDeYRRvd7sxxsfoIke32wstuoLsnrywE5AqE+E0IzAw5o9lTRMCpDcvY0siffnscQ/gE7mLGb7pX8c0Um0lC6sHB7f9Ht6Iks8Gu+MxPJ57t+q58v3XqEFup+l8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GYs7q0Xf; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-539e7e73740so1522355e87.3
        for <linux-usb@vger.kernel.org>; Thu, 24 Oct 2024 23:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729838217; x=1730443017; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Db9W0DcUi/dDjwgp0S1+zwbk/KalyyaD0ylTsRWE1NQ=;
        b=GYs7q0XfOvlwoMF2SSTCedPhsAh7B7f9WmfNIzEBNIfbaxwQysPvEIo+uAvfDNREJZ
         TqF9NMvUuH7870whJdZ4kcIMipDYedq8cOJYlhclHzaf+5tCb7RR+eYIyE41Q1a5gGDC
         AvgDCYwlkhd2gjcVGRJhGF4rlq63LBT4qx/yjbBRSmLedTVua6qTqgKRGZA7mqLFeSJl
         /NzaGK2Kw2eOs8xygTqcsyWA8/XJwP6/CrfXGlDkJBkRxaIuLrxTHn/iyBJJuKQTQV6d
         xLCGJerYbznOao6iPX8eq23hub15ckbvAa9kSkBzShWq7NEmK64FXnjYqZo4HxtmEP8R
         rIyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729838217; x=1730443017;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Db9W0DcUi/dDjwgp0S1+zwbk/KalyyaD0ylTsRWE1NQ=;
        b=V7XSl+QtAes9qheDknSraClXDf5MwOfuPQ7Dp/rMxGGqAMxANMOdhBmTdSX3eJpYks
         Dc3IqMF5rIu2OMHhgk95ovsrVtLrTMRwG7Ll4xn8y+GQj3gq7Jhl82DuHAIZF1ZQhTzF
         ilvMa46WlfTX7PcZ5+SxyAQ72x5mgepLE+Nx2VCi8rME1kLwFy6AXgmea1EmTUiJACiC
         fCdf129wwGXo1pt1kojg9Df3UQ8zXMbOQZ3brUPgwOVw+kY5ozdIYJdFbx+sMy6yPNLb
         g1LaEDLz7+6lfOmEQFywgALs3dkxy/P60+QQ4FZ+aqY15Lw3KJZdGwntBtq17XEh4o/a
         tzKw==
X-Forwarded-Encrypted: i=1; AJvYcCVVuo3BZaouylHt9Dr2l2Kkt7Bm8xW3f47ILeum0IjGkT8niPYRgho6Xj+bc5/SNSZ9dxZVHdQZLqg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+E/2WGo4eYJNff70sSw9e31Jp4IoHWSkSW+XeQtGSRLrbTWFz
	K7yhUv+jhrI9fqp0U+mOBJGae31gfQpD+9xtqyuBYbGaXanrkk8YTbFcmVADXUE=
X-Google-Smtp-Source: AGHT+IHWV57T+/9EhAWqxTiykSOfZ5lc9WHgI9sMVd6VKkCShvL2exL1I+UVy6hyP0AKb8v0iecgSw==
X-Received: by 2002:a05:6512:3e0d:b0:52e:9fe0:bee4 with SMTP id 2adb3069b0e04-53b1a2fe533mr5111135e87.9.1729838216924;
        Thu, 24 Oct 2024 23:36:56 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e10a53csm72820e87.55.2024.10.24.23.36.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 23:36:54 -0700 (PDT)
Date: Fri, 25 Oct 2024 09:36:51 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Stephen Boyd <swboyd@chromium.org>
Cc: chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev, devicetree@vger.kernel.org, 
	Douglas Anderson <dianders@chromium.org>, Pin-yen Lin <treapking@chromium.org>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Benson Leung <bleung@chromium.org>, 
	Conor Dooley <conor+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>, 
	David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org, 
	Guenter Roeck <groeck@chromium.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Lee Jones <lee@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Prashant Malani <pmalani@chromium.org>, 
	Robert Foss <rfoss@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Daniel Scally <djrscally@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Ivan Orlov <ivan.orlov0322@gmail.com>, 
	linux-acpi@vger.kernel.org, linux-usb@vger.kernel.org, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 13/18] dt-bindings: usb-switch: Extend for DisplayPort
 altmode
Message-ID: <yatu2snt2w7lrveftlfbkw6yfvso3jbsma5v6jij4rn7v37hjt@ww42wer6bytj>
References: <20240901040658.157425-1-swboyd@chromium.org>
 <20240901040658.157425-14-swboyd@chromium.org>
 <27acewh6h2xcwp63z5o3tgrjmimf4d3mftpnmkvhdhv273zgsp@i6i5ke4btdqx>
 <CAE-0n53S2dFz74_rgx22_1i_bbEC6kj1SL5LAEq_F2wrdCgBNg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAE-0n53S2dFz74_rgx22_1i_bbEC6kj1SL5LAEq_F2wrdCgBNg@mail.gmail.com>

On Thu, Oct 10, 2024 at 06:43:35PM -0400, Stephen Boyd wrote:
> Quoting Dmitry Baryshkov (2024-09-19 03:40:19)
> > On Sat, Aug 31, 2024 at 09:06:51PM GMT, Stephen Boyd wrote:
> > > diff --git a/Documentation/devicetree/bindings/usb/usb-switch.yaml b/Documentation/devicetree/bindings/usb/usb-switch.yaml
> > > index f5dc7e23b134..816f295f322f 100644
> > > --- a/Documentation/devicetree/bindings/usb/usb-switch.yaml
> > > +++ b/Documentation/devicetree/bindings/usb/usb-switch.yaml
> > > @@ -52,6 +52,14 @@ properties:
> > >            endpoint:
> > >              $ref: '#/$defs/usbc-in-endpoint'
> > >
> > > +      port@2:
> > > +        $ref: /schemas/graph.yaml#/$defs/port-base
> > > +        unevaluatedProperties: false
> > > +
> > > +        properties:
> > > +          endpoint:
> > > +            $ref: '#/$defs/dp-endpoint'
> >
> > Is it a separate port or is it an endpoint of the same upstream-facing
> > (non-connector-facing) SS port?
> 
> I don't quite follow this comment. This is an input DP endpoint/port.

This is the question: is this a separate port or just an endpoint on the
port?

> 
> >
> > > +
> > >  oneOf:
> > >    - required:
> > >        - port
> > > @@ -65,6 +73,19 @@ $defs:
> > >      $ref: /schemas/graph.yaml#/$defs/endpoint-base
> > >      description: Super Speed (SS) output endpoint to a type-c connector
> > >      unevaluatedProperties: false
> > > +    properties:
> > > +      data-lanes:
> > > +        $ref: /schemas/types.yaml#/definitions/uint32-array
> > > +        description: |
> > > +          An array of physical USB Type-C data lane indexes.
> > > +          - 0 is SSRX1 lane
> > > +          - 1 is SSTX1 lane
> > > +          - 2 is SSTX2 lane
> > > +          - 3 is SSRX2 lane
> > > +        minItems: 4
> > > +        maxItems: 4
> > > +        items:
> > > +          maximum: 3
> >
> > What is the usecase to delare less than 4 lanes going to the USB-C
> > connector?
> 
> I'm not aware of any usecase. The 'maximum: 3' is the max value in the
> cell, i.e. 0, 1, 2, or 3.

-- 
With best wishes
Dmitry

