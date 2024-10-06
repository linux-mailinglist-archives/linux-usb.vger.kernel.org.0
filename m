Return-Path: <linux-usb+bounces-15780-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EBB0991F57
	for <lists+linux-usb@lfdr.de>; Sun,  6 Oct 2024 17:25:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BEFC4281CF9
	for <lists+linux-usb@lfdr.de>; Sun,  6 Oct 2024 15:25:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 925DC17BB3C;
	Sun,  6 Oct 2024 15:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GCrgXx51"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB5E17B4FA
	for <linux-usb@vger.kernel.org>; Sun,  6 Oct 2024 15:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728228352; cv=none; b=anwmFxB10IpOo4cywAL5jJDWcoTjmJLtkBkdc9E/pcn4y6NWq6sLumFPWgOrEhV4ErBGI4LlvL9TjS0FCfwAcBwVupxzjWaQJOqXHvSeNgsb/5ON8dth5B3JvRv56dBLJ7nFKy1RLKIGU04kKF3tNypREKbMogi4nYtL31VbuCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728228352; c=relaxed/simple;
	bh=r3/3Q+KPDWKzqkcmOcj+LaYbC9Z/u1HiilUN8TEN3Os=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sgiRBEodQZE2Sz2hIbAce1MA7EXL9EKUgvDw06k9F24bFrbKsD+YMu5XzEIeDeQqOPa9whD9dHgdnffndkh2PaTFMj6Jh+NzN4L/8fsvhoSSEIzvNY7rAkyGcOM5Sj1FE+maU5gJWkjQPsG6U8XPx2KTAG7oOEQr+gTXHe6o2hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GCrgXx51; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5389917ef34so4076788e87.2
        for <linux-usb@vger.kernel.org>; Sun, 06 Oct 2024 08:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728228348; x=1728833148; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZzLI2qsMavyzh3cAqBP4z+YvAku625MAo0+XLbe9zaQ=;
        b=GCrgXx51Vo4YYCCGFHXdlKqXRIbp/oSS05qOIXw+ILAR6WBq8WbG/OyiGZOT0X7Okg
         VkyUDRsLq3r8GATMiT32SWWOKWyu9iPXcZv6mf/tMKnFqvffZFFXQX1zDHqwmiKHKVER
         sRboJOcSezOd8mJ8/T5DEqQ6v+dtfn43sUPmujU9aQwlVlB99Dxtft4vYssVSWbiyYT6
         pw3fDKRmbgO+o82qBI5We9oZNJcuBzJvSRy8K8CeNVaYUO1WXnwL3vnXzBX2d64W9wT4
         GsZmQKJe4h6o00O0Z3AZw2iIdoKBb+6/MdolBIiIEOVHrLsOtTXReKa2e+hSd0hF7IhY
         XTSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728228348; x=1728833148;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZzLI2qsMavyzh3cAqBP4z+YvAku625MAo0+XLbe9zaQ=;
        b=cOZI0b7gxnp2sGZlekIz+5aTNwQ1uU74LkzI3zOki8rw7FGptQ5AXh5ykJmyi0eKoD
         Yw7BaQhMODXwdYYdFN5qbY5RIGiwDXCfsYuNuwYkh+EMa+sY9UU5apBk5VTSQj/dOXyM
         PtXM6DH7SZXugDlnHRC4XHADZQjMzBJs8YI5jZW5mI3OnPKjik1g7c3I2YpvCFlq8sP/
         SZaR8YyM8+tJl0SHlt434ymc7MI4zUL3B8Z7RDDIMn47gk6Z5DbIz91q50tFHZRGUEwl
         lIDHviVQt7nCCqp5YHcPy3SHgF+p8+3EG1QIz7BzBl2fM+4TfLUbkf4ibsGIMqSUyA4P
         UrWw==
X-Forwarded-Encrypted: i=1; AJvYcCX2bMUMMSEm6uns25DpVkLbxxviR53G+Roig1Gzr2RX+O4oJmWlThv1bTVZlrpTPob4+XtKzxmU8Xs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHGzOtK/dFlt+iprpRyzRXv6EO3odgfr2esLK13+ZS/nKp/A4K
	VB/pq5Z5A0SOK2RIEmUtStZ1lDxLa7b0DG1YIUHzZ7PI7nhfQ5yC9CUhPbZ0LRM=
X-Google-Smtp-Source: AGHT+IECldVZJLRbyUEw77R1QJexgzcuQYlKntI6amyprskw3YHEivis+8i/CE2tRuSfiTaei9K84Q==
X-Received: by 2002:a05:6512:3d0c:b0:533:d3e:16f5 with SMTP id 2adb3069b0e04-539ab9cf3cemr4241785e87.38.1728228348478;
        Sun, 06 Oct 2024 08:25:48 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00-89ea-67f6-92cd-b49.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:89ea:67f6:92cd:b49])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539afec15d7sm547115e87.26.2024.10.06.08.25.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Oct 2024 08:25:48 -0700 (PDT)
Date: Sun, 6 Oct 2024 18:25:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Herring <robh@kernel.org>
Cc: Abel Vesa <abel.vesa@linaro.org>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rajendra Nayak <quic_rjendra@quicinc.com>, 
	Sibi Sankar <quic_sibis@quicinc.com>, Johan Hovold <johan@kernel.org>, 
	Trilok Soni <quic_tsoni@quicinc.com>, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: usb: Add Parade PS8830 Type-C
 retimer bindings
Message-ID: <trfcqmexznp7igf7t345q2eb7qwjwwgg2qgke77urlwrf2wh3r@4e5bsfv3nuar>
References: <20241004-x1e80100-ps8830-v2-0-5cd8008c8c40@linaro.org>
 <20241004-x1e80100-ps8830-v2-1-5cd8008c8c40@linaro.org>
 <20241005173647.GA429341-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241005173647.GA429341-robh@kernel.org>

On Sat, Oct 05, 2024 at 12:36:47PM GMT, Rob Herring wrote:
> On Fri, Oct 04, 2024 at 04:57:37PM +0300, Abel Vesa wrote:
> > Document bindings for the Parade PS8830 Type-C retimer. This retimer is
> > currently found on all boards featuring Qualcomm Snapdragon X Elite SoCs
> > and it is needed to provide altmode muxing between DP and USB, but also
> > connector orientation handling between.
> > 
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > ---
> >  .../devicetree/bindings/usb/parade,ps8830.yaml     | 129 +++++++++++++++++++++
> >  1 file changed, 129 insertions(+)
> 
> Missing R-by from Krzysztof?

Quoting the changelog:

Didn't pick Krzysztof's R-b tag because the bindings changed w.r.t
supplies

-- 
With best wishes
Dmitry

