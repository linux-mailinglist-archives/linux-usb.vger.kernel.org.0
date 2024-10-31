Return-Path: <linux-usb+bounces-16911-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 621E69B815D
	for <lists+linux-usb@lfdr.de>; Thu, 31 Oct 2024 18:37:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7DFF71C21E7B
	for <lists+linux-usb@lfdr.de>; Thu, 31 Oct 2024 17:37:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70B1A1BF7FC;
	Thu, 31 Oct 2024 17:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WT74AqwS"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB413142E76
	for <linux-usb@vger.kernel.org>; Thu, 31 Oct 2024 17:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730396271; cv=none; b=csHH2m8skTX+NKF+53/AamChBLcA4PDTcT/qK0FGqrzbGeHbheLMbfUpF3+qJohmQWpOTrAuc4pln3AmeMBtNAr6eBXQRWW5uhKsvK9V36+pe7+BXV372BxeXT1DmvLsqoafJ9muIrw4So0QAHfoyc2ucs4HPYRwIZ+dT31wV2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730396271; c=relaxed/simple;
	bh=4sXu8HvrmNTEWnjIBowrah7u8asTbv+L1Lm8apIdGq8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fyQEKC0gqM/yR8sKn3coC34sU/ltssTIC7sfsA8lndGubCwtpCcubTEOwztRVZOCx14803huIhC43MnON1y/2yc+8fHm9utoQ7peZSdeDbumcpUEBcIdtF5Rni6rH0JB2/1xX0Qfzn5HXaQMjXpX+pCntnFNiyeQ4eI+eZ3+ito=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WT74AqwS; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-539e5c15fd3so1092894e87.3
        for <linux-usb@vger.kernel.org>; Thu, 31 Oct 2024 10:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730396267; x=1731001067; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wvGN26v9h9TbcjLka9mTWi25+1w0LLwGx8pUqzN3ads=;
        b=WT74AqwSUi9S+t5vgUKUlJDFnhCGqst4KW+esiduxiYDGL+kiKF8fiIVRlP9NR9eSo
         d8tm8LPAevHLM/2W50W9cRiwEyi/6pV4ofYF3QnoUedsQQgTCaqHMpyXr8ljNfMLSs2h
         u/oaEv0rxACtSst3M6lyizvsf3TuykwywhrWdcVKGhkrgvqlAckDpklkm4duaPsZykpx
         sLKA78EcMKQ5tfUhBl59Myunl6Sm6FhiGPdM9K0pNx29oIooX0zhkpzL2dT7IoNcGpIU
         OZ/O2SKRhR6UZYaWLlZ3UeieUq+v415QhLlsLXm30K9E0xnv/JCO8cnY64RVGiZpgeh3
         9K8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730396267; x=1731001067;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wvGN26v9h9TbcjLka9mTWi25+1w0LLwGx8pUqzN3ads=;
        b=uNVtA+dvpZTxoluEIliNZ1Xnw7IrI8NZR6tkw7CXY4M15QZ2cANXpoY+SS3I2/rrkh
         J2vsHnc/vF+XXL0Mb7Cj+18hKcauoQl31mWHLcWj8MntLGw3wZwv06PhdvqGbQreXbzo
         R0SFnPB2TUQJ9REK++l3vsEk/ByoW3z9UjZfBdNr/SyyMXQQZlRjy9EN0sl9WhM5eQ48
         BxJ07elvw1GBvSrCubhgZhSFZTQEuzLfaduGnYWbmVcbU+8Tljo9b15d8G/jIKktfhCe
         h8y5Lk/OB/474PKI0iLilZ9zU/NL8v7o84OpMqsYuMzHWoNhoLxO8V5KINqsNI/Mh2Nl
         HRvA==
X-Forwarded-Encrypted: i=1; AJvYcCUj6Zq1l7zWeM1va1m/yC3KgEWTpnGy51Xlpe2bvFxBXzOFJ3t57CD+MbkLxpwNgKHyPycg0aQSEns=@vger.kernel.org
X-Gm-Message-State: AOJu0YwrD2X5v3nAhiUEqF/NY2v5EIcrHwV05qqKOd8kUchaIRCbTIxB
	8DvHBPy/THTnL706+AjT2F52dw33ZWRYPDCivnnIyShzkYg7hClKfx894Wz0zrw=
X-Google-Smtp-Source: AGHT+IFE9Tc/KwIa08fOm+rRk9qcX0N0CjkqJe28X/XFmYGijFLr3vURwiH/MupERjY9bYlHsddgIA==
X-Received: by 2002:a05:6512:3d94:b0:539:f754:ae15 with SMTP id 2adb3069b0e04-53b34a1908emr11541751e87.41.1730396267059;
        Thu, 31 Oct 2024 10:37:47 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53c7bdcc3b9sm273696e87.223.2024.10.31.10.37.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 10:37:45 -0700 (PDT)
Date: Thu, 31 Oct 2024 19:37:43 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: usb: qcom,dwc3: Add SAR2130P compatible
Message-ID: <gohuncowxxud4rilmr23q3zc6rnkoqpbkl6v4puiexegvzr3fm@2zt4olzo64bu>
References: <20241017-sar2130p-usb-v1-1-21e01264b70e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241017-sar2130p-usb-v1-1-21e01264b70e@linaro.org>

On Thu, Oct 17, 2024 at 09:16:38PM +0300, Dmitry Baryshkov wrote:
> Document compatible for the Synopsys DWC3 USB Controller on SAR2130P
> platform.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  Documentation/devicetree/bindings/usb/qcom,dwc3.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Gracious ping, the patch has been acked by DT maintainers, but is still
not present in linux-next and got no other reviews.

> diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> index f7be056419307069c67b8f2d53bc88417a19b9ce..935e204b607bbd3bc9bfbdcd03519202197c9eb4 100644
> --- a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> +++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> @@ -29,6 +29,7 @@ properties:
>            - qcom,qcs8300-dwc3
>            - qcom,qdu1000-dwc3
>            - qcom,sa8775p-dwc3
> +          - qcom,sar2130p-dwc3
>            - qcom,sc7180-dwc3
>            - qcom,sc7280-dwc3
>            - qcom,sc8180x-dwc3
> @@ -340,6 +341,7 @@ allOf:
>            contains:
>              enum:
>                - qcom,qcm2290-dwc3
> +              - qcom,sar2130p-dwc3
>                - qcom,sc8180x-dwc3
>                - qcom,sc8180x-dwc3-mp
>                - qcom,sm6115-dwc3
> 
> ---
> base-commit: 7df1e7189cecb6965ce672e820a5ec6cf499b65b
> change-id: 20241017-sar2130p-usb-0e9ccdef61d6
> 
> Best regards,
> -- 
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 

-- 
With best wishes
Dmitry

