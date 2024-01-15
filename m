Return-Path: <linux-usb+bounces-5059-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CEB282D64C
	for <lists+linux-usb@lfdr.de>; Mon, 15 Jan 2024 10:47:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B314A1C21477
	for <lists+linux-usb@lfdr.de>; Mon, 15 Jan 2024 09:47:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07D72DF4C;
	Mon, 15 Jan 2024 09:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IKHyU+6u"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31480E55E
	for <linux-usb@vger.kernel.org>; Mon, 15 Jan 2024 09:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-5e811c5c1adso72732067b3.2
        for <linux-usb@vger.kernel.org>; Mon, 15 Jan 2024 01:47:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705312047; x=1705916847; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KFasKVeIFS8eA29J5OC5S7BAGeeHVHQITZOFxwu8rvQ=;
        b=IKHyU+6u+lgjRbyCoCSwwGSrug6+245U2HLPFxjhv8yEBt6FyeKVAYrLG3CNHFzZzf
         Dk2FCGpsEHJ9T04siwv7YL2h1aIpSxBMVCSwxe3FPWvHPhSuSryMMe+1bXZO25NNMRiG
         vSBV0i8c/+hl2sfi+a3Q7AOrvZl/aXuFkZYt5lSiVyfCeZDx6Ebq3mCNIBq/Fofzhr1V
         irsU2QPRNqtsUf1968TcqB9towdQH6O13+vCSV8zmtiZrUaKul4ZFRLGYeG7z4wlAv73
         XMxN5AWHIcWlf07NY6l2DN4RogFuoJi0YH947NDr+LaVdwbp78RB883umf8rV3ONJIAW
         x8ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705312047; x=1705916847;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KFasKVeIFS8eA29J5OC5S7BAGeeHVHQITZOFxwu8rvQ=;
        b=KIwWTo9MtXU0zvnKw2fRWDx03WxKJ2AGlYdY8Heq5yrWwJaa5NwfntlhXHV21ltCyy
         Up52gH+qfRD/pQOvwUHK5Tc93Drw+nfw40dnsVXLRAK4IQjtxGNYwinb0R1bVWmgtXZT
         WsEhtUbOoZdcDDZA7T05Ttgj2ie7bxS4k5v2kN6BUSpToyPeaLIHE7lGQAyHgFGskur7
         fqaDk9LvxOX0ZTJAdXnSEuK3Ac/K/oGawGRb19XgysLU/V7DSr6jqk5iDhLCIIsayPis
         EzOY/ZPLqWgTvJTP1THe982sPDQaNEe/bsXNBGdc2gSjtaXMOOAkBZlIYdYsp9QB5ODK
         w9RA==
X-Gm-Message-State: AOJu0YxeSDXalllAMdjjZCHqHO9YfwQ9wF3Q+yvG/P9BvTZsw/3lz1AD
	BqO1tUNzB72GHnTbzNykzYrhtMTJ5qIWMAWRKTV6hOAe3Eo6EQ==
X-Google-Smtp-Source: AGHT+IGDxeO4T8bagcuUSUZ0vMjmvo/iXyCvviU6IkM5zpYZ/eSn970UnrLfZAjyWjqwQ+WhSzN85TavpbmAnoNw87w=
X-Received: by 2002:a81:d003:0:b0:5ee:1ca0:b7ef with SMTP id
 v3-20020a81d003000000b005ee1ca0b7efmr3089640ywi.42.1705312047014; Mon, 15 Jan
 2024 01:47:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240113-pmi632-typec-v2-0-182d9aa0a5b3@linaro.org>
 <20240113-pmi632-typec-v2-4-182d9aa0a5b3@linaro.org> <2c291056-e4c6-4c8d-a8c1-37cfd5341652@linaro.org>
In-Reply-To: <2c291056-e4c6-4c8d-a8c1-37cfd5341652@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 15 Jan 2024 11:47:16 +0200
Message-ID: <CAA8EJpquRv20NhQ2CUZaAju-=E4cFUsXS3i9fKAPHnwkd8Yf_g@mail.gmail.com>
Subject: Re: [PATCH v2 04/15] dt-bindings: phy: qcom,msm8998-qmp-usb3-phy:
 support USB-C data
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-phy@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 15 Jan 2024 at 11:16, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 13/01/2024 21:55, Dmitry Baryshkov wrote:
> > Extend the Qualcomm USB-C QMP PHY schema with the USB-C related entry
> > points: orientation-switch property and USB-C connection graph.
> >
> > Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
> Hm, this feels unusual - is really the phy handling it? Not "Qualcomm
> PMIC based USB Type-C block"?

Yes. The PHY handles orientation by switching the SS lanes accordingly
to the way the cable has been plugged in.

-- 
With best wishes
Dmitry

