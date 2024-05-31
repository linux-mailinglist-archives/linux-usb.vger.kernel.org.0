Return-Path: <linux-usb+bounces-10706-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D8FCC8D576C
	for <lists+linux-usb@lfdr.de>; Fri, 31 May 2024 02:59:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 78E991F24F74
	for <lists+linux-usb@lfdr.de>; Fri, 31 May 2024 00:59:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1162F6139;
	Fri, 31 May 2024 00:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LYwyhbK3"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0383515B3
	for <linux-usb@vger.kernel.org>; Fri, 31 May 2024 00:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717117142; cv=none; b=OVNOKS8OpclWuicHP/1xSx4raTP7x5A477iLbdBu+gQEsEXQ5pFslluiU3LRq7r5zQZDOOh09XwCMaqUFOusqoTCjd7LtSCc9cSeFjTMtJRlMvtDG6+H++aNk6IVYqDZPqYiihRX5g2B4IckZfdqaTYTynAdCMXrVHF60H59530=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717117142; c=relaxed/simple;
	bh=bG+7N/6ZBRzyPqoSKv4Si9VHH6RWf6RrJ2vJAjp+SIw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M4Ez1oEXYNmlEPjibLgSWpGyPx4rUBL3UsZUrgUwJy7eQhmduEBREvWfF9tTMwK5QMpVJcVUpZGvYnE1ME0C0gcnjFF3NG3YdRzbXOzLmjNIHSY2uqbERzgE5AiVFOJ8nADFzr1me1mAxO9HES1ThCDVavlTHu1d6A7pzVsHuKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LYwyhbK3; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-52b78ef397bso1537282e87.0
        for <linux-usb@vger.kernel.org>; Thu, 30 May 2024 17:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717117139; x=1717721939; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QnFCRKDrZ3vO/pkEAc8zl9OdD2pxO44AabYMP/pb1KM=;
        b=LYwyhbK3t8UrsGk/nheTSAJ3TWN+Fo8uaufQ66JBi4cdbZHqUpgMTXixrqOxstULvh
         Gb/QUDbZlKyDcnSa+fzerkNU1Ksf7w10TJw4ZNVn2iizFiVEX3thRB0kR5utUN33j9Q3
         QX2OfgAgVbwxNUvRaWOlb0Ar6i8qviMKqFDIyGGnTXtHmk0QppRfTU84mKwGYFO4p3Km
         5OnMl3YtCmAr9HlCz/5dpy4s8X24yWcn9ROh0accSf0bhCj4zi35j/Ens4sbgxKKszLU
         AB4xdp9YcfpzF1OTIBh7A854fw9GaaHhkta7y968jRygOuI70Jk7Ja/Xbm35mFjua1Zr
         bubA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717117139; x=1717721939;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QnFCRKDrZ3vO/pkEAc8zl9OdD2pxO44AabYMP/pb1KM=;
        b=QMn8NP+mtSJBERQHNOJjOeLc7pJwixuHx9IdDMSHL1dKxPqbl25/djFfTKZb4MOXiZ
         /iCXnud1hddfQKKEEJiAXbSY0QpfSx5OEcEIDmnyMsqua+gqyJgnc73uIFEVUiUEeMAh
         4PRPSrYHsGkcdy6F2iRR2viR2rPzkJKUC37bE7DF3vvAeLrIQEv4pvyZ7JZazj6R8uhN
         AwP8RFpsqcQ52/xuP2xuyO7OF6saOaUHlWDspSxlZW8hJv/C9YfvN1FsUZcFh7j9/RmP
         dGwrjWWE6+D4YNATdpTyPBg9uxtvA4G0DVstfwUbU7BF2aGtRV5Yas/hgvZhdnG+liO+
         ri7w==
X-Forwarded-Encrypted: i=1; AJvYcCWQrMzd7dCrV8P4nUorqaolB6N4sBjlzAmPRynP/VKd4eBZnmLKEJsYEnQ35qVJobHZ2RnOzuQ+fVXTCkSBWxGxNja7yXSxFtdq
X-Gm-Message-State: AOJu0YzTjMfiyZKnSfYOWGQMN1qES7q+G+vGeRtzE/6MtrZeS0ClSgft
	HGpneRr/QZRp7ngRuUhVhLJePkwkDuaNKGDVWwobGFObvr1gpABPApSv1QIl0sY=
X-Google-Smtp-Source: AGHT+IHW0DtGLMnQVs266dCybPR/6QxvGMTnPIV7eNFOlCzbPInTMDNv6MIo4HjAP0v2fgbbnnu7jA==
X-Received: by 2002:ac2:46f4:0:b0:52b:8366:27c6 with SMTP id 2adb3069b0e04-52b88783f7amr136279e87.23.1717117139073;
        Thu, 30 May 2024 17:58:59 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52b84d3f835sm143476e87.115.2024.05.30.17.58.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 17:58:58 -0700 (PDT)
Date: Fri, 31 May 2024 03:58:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Hans de Goede <hdegoede@redhat.com>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
	platform-driver-x86@vger.kernel.org, linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Nikita Travkin <nikita@trvn.ru>
Subject: Re: [PATCH v4 4/6] power: supply: lenovo_yoga_c630_battery: add
 Lenovo C630 driver
Message-ID: <hggfy3pwu4du7msmeg2hz6y5i4kvogpbwzw33lcubhso7angob@q7llvdyz4x2b>
References: <20240528-yoga-ec-driver-v4-0-4fa8dfaae7b6@linaro.org>
 <20240528-yoga-ec-driver-v4-4-4fa8dfaae7b6@linaro.org>
 <d24f720d-66e1-7fa1-5a99-6fa1defebf2c@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d24f720d-66e1-7fa1-5a99-6fa1defebf2c@linux.intel.com>

On Wed, May 29, 2024 at 06:41:36PM +0300, Ilpo J�rvinen wrote:
> On Tue, 28 May 2024, Dmitry Baryshkov wrote:
> 
> > On the Lenovo Yoga C630 WOS laptop the EC provides access to the adapter
> > and battery status. Add the driver to read power supply status on the
> > laptop.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/power/supply/Kconfig                    |   9 +
> >  drivers/power/supply/Makefile                   |   1 +
> >  drivers/power/supply/lenovo_yoga_c630_battery.c | 479 ++++++++++++++++++++++++
> >  3 files changed, 489 insertions(+)
> > 

> > +
> > +	val = yoga_c630_ec_read16(ec, LENOVO_EC_BAT_DESIGN_CAPACITY);
> > +	if (val < 0)
> > +		return val;
> > +	ecbat->design_capacity = val * 1000;
> 
> Check linux/units.h if some WATT related one matches to that literal 1000.

I'd rather not do that. The capacity might be either in microWatt-hours
or in microAmp-hours. Using WATT will be confusing in the second case.

> > +	msleep(50);
> > +
> > +	val = yoga_c630_ec_read16(ec, LENOVO_EC_BAT_VOLTAGE);
> > +	if (val < 0)
> > +		return val;
> > +	ecbat->voltage_now = val * 1000;
> 
> Ditto.

No, Volts and Amps don't have units in <linux/units.h>

> 
> > +	msleep(50);
> > +
> > +	val = yoga_c630_ec_read16(ec, LENOVO_EC_BAT_CURRENT);
> > +	if (val < 0)
> > +		return val;
> > +	current_mA = sign_extend32(val, 15);
> > +	ecbat->current_now = current_mA * 1000;
> > +	ecbat->rate_now = current_mA * (ecbat->voltage_now / 1000);
> 
> Ditto.

The same

> 
> > +	msleep(50);
> > +
> > +	if (!ecbat->unit_mA)
> > +		ecbat->capacity_now *= 10;
> > +
> > +	ecbat->last_status_update = jiffies;

-- 
With best wishes
Dmitry

