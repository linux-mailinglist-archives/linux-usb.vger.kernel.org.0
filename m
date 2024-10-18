Return-Path: <linux-usb+bounces-16405-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B81BD9A3B07
	for <lists+linux-usb@lfdr.de>; Fri, 18 Oct 2024 12:12:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D88311C21B20
	for <lists+linux-usb@lfdr.de>; Fri, 18 Oct 2024 10:12:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 278E42010EB;
	Fri, 18 Oct 2024 10:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lY7c+Abl"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F131118FDB1
	for <linux-usb@vger.kernel.org>; Fri, 18 Oct 2024 10:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729246318; cv=none; b=phbWa1tW+8tCVTEuog5FslW1d0Rmbh7h6p3XM7c/HrD+VRxn2nrexZ6VkkmOY1G+KOIOsByYzddEG7vkUSjwf6bYaC/uhksgDa83uZmLTanjDE90ovuz4DZD7J95Xt1SmcizaLEAmRXvXNVR62warKtWWP5ty6nncBAg0+tZZIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729246318; c=relaxed/simple;
	bh=kRK4/BKBi0JXML0QAlq/7TuHFKd7W2th9qWUj6ShHEY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bolSWWx/CuVfxTYxpD3MbPeTrTwoxaCyw/wYc4sU/KHHJ4oiwfCkbinMSn8FT4GAezQckqFkKaJ5lEjoI7p2alyfGyAkwa6o1j2blR5jYEJLBTeC6q3bK6QvGi4oMT2xcArv2fJm8dJgmLKXUxDV3OzHz3syYBneRKeky5JXv8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lY7c+Abl; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2fb501492ccso20975561fa.2
        for <linux-usb@vger.kernel.org>; Fri, 18 Oct 2024 03:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729246315; x=1729851115; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jvY8KYiHaZqzdfBn2meM7L0X9I9zbwo+MC/72l11qcc=;
        b=lY7c+AblIJR5m6SRvIf1y47AIC0qHNJtNGeWTodpotUKSlDk3u2n+RNrBKK5RcZ3uD
         DYAPqkGN+9pQeeaYb77no7B1oEfhX8lHLgEBWzfrbItq6VCfCDwyfb/AkbIS2Aihr47e
         yfLV+8AfXPUN6TKCy2slTuzgS6EtB64gzP6UU6Iksk6ELiUR6K2F4lYRO7a0j1zFbFTn
         lSYC+CaFYYim2W9HPAX8iWrwN/fXS96PCnIrw9OjLDrbINl2OGm03pJsIpiCY02WTZUA
         pYezMiuKoN7ejzcGXZsPDjweDeYk7njapikDBzZUBtPyB705UOiWY8VEd5DDg78p13o5
         8fow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729246315; x=1729851115;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jvY8KYiHaZqzdfBn2meM7L0X9I9zbwo+MC/72l11qcc=;
        b=pNzoB3ldnevH9edH7OJf88buv9+jo3IUz+XD74WSL4bCLONPlXl5CvadD3XkUIfpX9
         zY+GN/OHIaKXaCMDWLpCVl2Qi/82HFtaZaoaZR10Z+VLH3H36v0OoPBaRwllT2GKNGcg
         KZcLdUrXAXDHr/Vj8qXggX+1IYU6DYzKzj0ygQAuKR3xQfiQxo4M/cmBMBXU1UUjxeXs
         vw/5jEl0Z3yItqLWVlecUqY2dtdKO/7bijcSONZymVyYyTUCMm3yfF/SOxsNSCw2wCS/
         YPzNff2OFtxZvYBEEYFzhsWo4wRF2gNDXu+++y6/ZVy9btt4kFe3un66SOfhr5LDHC+5
         wBAw==
X-Forwarded-Encrypted: i=1; AJvYcCUCzLA2x41aVSNkiPfxKJj4wQcRoP4XC60c4TaCKhCImdPMrRWid1Ss9Ze8LyDkTquUIw+kT0/k5FQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyaByk+pnejHXJp8JICd1ynfXKAM7JzpeN1sWfrGaudVod8H5ms
	SEz/4FNImvZyNT01DsKOGSRx1G8Kzr43m+ZOwz3EN6pJS57MXmjTIjWRSBbnwdg=
X-Google-Smtp-Source: AGHT+IG3sYPji9qicEvtFNlcAs92ChQJkMrU6bQriug80NS0HFO4UZ/qbgCf38X9ZiV302DAIpmCeg==
X-Received: by 2002:a05:651c:542:b0:2fb:2e27:5334 with SMTP id 38308e7fff4ca-2fb82e98f77mr7417511fa.15.1729246315128;
        Fri, 18 Oct 2024 03:11:55 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fb809b2ab8sm1878671fa.48.2024.10.18.03.11.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 03:11:53 -0700 (PDT)
Date: Fri, 18 Oct 2024 13:11:51 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Tingwei Zhang <quic_tingweiz@quicinc.com>
Cc: Krishna Kurapati <quic_kriskura@quicinc.com>, 
	Vinod Koul <vkoul@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Rob Herring <robh@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Bjorn Andersson <quic_bjorande@quicinc.com>, Wesley Cheng <quic_wcheng@quicinc.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-phy@lists.infradead.org, quic_ppratap@quicinc.com, 
	quic_jackp@quicinc.com
Subject: Re: [PATCH v2 5/5] phy: qcom: qmp-usbc: Add qmp configuration for
 QCS615
Message-ID: <l4wpt5qin3ezkowf3puvodrm5wjsptd4a32f4qrzcuuquo6kq6@j2orv5z5quln>
References: <20241017130701.3301785-1-quic_kriskura@quicinc.com>
 <20241017130701.3301785-6-quic_kriskura@quicinc.com>
 <CAA8EJprcOU6qeJvHH+MVoPnQ+mGcos=pDOVBSeSUfBGw-KR6tA@mail.gmail.com>
 <aa68e5ab-86a6-430e-92d8-ed89b4eb37f7@quicinc.com>
 <CAA8EJprkq-Cct9Uk1Jwqc5Rn8mx8THTRgwCzDx=8ZgbCpwD7qw@mail.gmail.com>
 <684582c3-3559-4c54-8257-cb952bbfe2ec@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <684582c3-3559-4c54-8257-cb952bbfe2ec@quicinc.com>

On Fri, Oct 18, 2024 at 05:01:48PM +0800, Tingwei Zhang wrote:
> On 10/18/2024 4:06 PM, Dmitry Baryshkov wrote:
> > On Fri, 18 Oct 2024 at 10:48, Tingwei Zhang <quic_tingweiz@quicinc.com> wrote:
> > > 
> > > On 10/18/2024 2:27 AM, Dmitry Baryshkov wrote:
> > > > On Thu, 17 Oct 2024 at 16:07, Krishna Kurapati
> > > > <quic_kriskura@quicinc.com> wrote:
> > > > > 
> > > > > Provide PHY configuration for the USB QMP PHY for QCS615 Platform.
> > > > > 
> > > > > Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>
> > > > > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > 
> > > > After checking platform details,
> > > > 
> > > > Unreviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > 
> > > > Please perform global s/QCS615/SM6150/ and s/qcs615/sm6150/
> > > 
> > > QCS615 and SM6150 are different variants of the same SoC. QCS615 is an
> > > IoT variant, while SM6150 is a mobile variant. We are currently adding
> > > QCS615 SoC support to the upstream Kernel, as it is in an active
> > > development stage and we anticipate many products based on this SoC. On
> > > the other hand, the SM6150 is an older mobile platform that is unlikely
> > > to be used in new designs. For a product introduction of the QCS615,
> > > please refer to
> > > https://docs.qualcomm.com/bundle/publicresource/87-83838-1_REV_A_Qualcomm_IQ6_Series_Product_Brief.pdf
> > 
> > Yes, I guessed so. It would have been nice if it was documented this
> > way from the beginning.
> > 
> > Please note that we usually get support for the mobile SoC first. So
> > in most of the cases devices use mobile compatible even for IoT
> > platforms, see qrb5165, qrb4210, qcm6490 and other similar platforms.
> > I simply asked to follow the established pattern.
> 
> Yes, we start from mobile variant for most of the platforms. There are some
> exceptions like sc7180 and sc7280 which we started from compute variant
> since they are widely used by compute platform on upstream Kernel. I think
> we have similar case here. QCS615 will be widely used by IOT products on
> upstream Kernel. We should have clarified this from beginning so there's no
> ambiguity.

After offline discussion with Krzysztof, I'll lift my objection, so
still Reviewed-by.

-- 
With best wishes
Dmitry

