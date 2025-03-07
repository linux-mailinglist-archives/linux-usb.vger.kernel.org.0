Return-Path: <linux-usb+bounces-21484-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E73CA56056
	for <lists+linux-usb@lfdr.de>; Fri,  7 Mar 2025 06:49:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 78166176A94
	for <lists+linux-usb@lfdr.de>; Fri,  7 Mar 2025 05:49:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBA36198A37;
	Fri,  7 Mar 2025 05:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="T/55rvlU"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B68821946A1
	for <linux-usb@vger.kernel.org>; Fri,  7 Mar 2025 05:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741326592; cv=none; b=QWN8lcg297TLeCAqrIInxKTKnqjgXaVoiflxT9FGe+izNbRLpCQ23Uzo6fWgkpXCysusBr55qUvMulHTpgv5ORzCEotCNhLeivBbbosZfm6cDP6mWfagIid8NA6GYdyEc0z+KZrxUBZPMFPiCrcK6yfj51esXcmmVdghuRSohjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741326592; c=relaxed/simple;
	bh=jmPY4fuI4EYqhmDWogqXXGjUVpVNhWMCq4sELYHNKNA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KMrb/0dQBY12flAxeMTIT/GnvMAnkbk/ohnGWo4OdP4Ry1csevglIIjTrl0nb5o2RadOa70Kym1rouyrBFWUtlre7uMAdvLYyxfp3Wt7fPKVOqYNNPjGrAcRb+0PoKTlTWOuOY1Fy3AMekKphy3HJHetTGZzphwVN/An4yQ39lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=T/55rvlU; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5498fd0bce9so868455e87.3
        for <linux-usb@vger.kernel.org>; Thu, 06 Mar 2025 21:49:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741326589; x=1741931389; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jN6ZIl4heduOl3aV1Xlhy1GPaNYpaPeTUI2tGOU7POw=;
        b=T/55rvlUh25RsVHscYadgioQaRtNAUtwIxuxn5AloVvgZGmmHiubDcW613Wzrdlnpy
         ZjS6q8cJRxq9fgMTrSs1JEFJj2xnc9t33N6lN+zv3w6lYV482sGwnPB//JcuUGhRRFnL
         0fQ0GQND4GJxmXh37EmwSqyOO7xS6dfeyh1M2svWHchxQ0489vOqTGEehbek/z4NbZxW
         1BCgLIm2Bmv6KPc5sb/9uCSW3GuR5XJqrIZcTQzJX3JdLrp9IxLfLmrgTsGecY3kTPjA
         5AOFq23KS7GKTq/eUF83lPpov8KWtaYdppiBEZ4mdwex+qgCghKsXxAoykhH8OjP5XW2
         lDHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741326589; x=1741931389;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jN6ZIl4heduOl3aV1Xlhy1GPaNYpaPeTUI2tGOU7POw=;
        b=BvNRdFgtqRDGE09B15n0HuKZTNz9HxPVkZOmNjENe1FQtj/wtmcOu5CfQyK9MotuDu
         coleabMhJhDo1QpS+kocxzePfr6f3Qru2fkDdZkWZX5mqL/W2rcGbXT5ZaE9oB9Gwdxa
         cbU5YkfmQYJQ93ER2YKfEPK7xmbmWOxGaiCZCpPARja+p7ve7edd0Qmc2B7+pjqN+dPb
         D1CaWWpJGzohthE/3BQw8jd1VaZ978ii5NroyxQrm5Cmnf01uA3fqaAw3Kqe/jTEvEjw
         C84JSWLOiWyAjoR0iYs0Ax+6SirtxlZ+jpr+qg7bjm16ZoJ6IO26V0fD9pDyemDoRhvg
         ycSQ==
X-Forwarded-Encrypted: i=1; AJvYcCVWeVAjY3NDgWm/0LdvPBKrfe593aXzkPfSP3iq2nBmkojsXt9/BGquwLDBeP90zNFxT0hv4uNDWao=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywn9FmOd/itjp+LcrIm0/f9WCBMVXieHaWdv6ZFvIA9UvEHCjNJ
	3AhyPwydtUgHGnCUqTiubTZIHO0yon0+OM9t2uuU9Oo1da9nDvcDNNuX+iletWE=
X-Gm-Gg: ASbGncvr7DI0oFMDEvnCFWuUBdMOfybac47td7zZmIhkRiGu9BAFMffRU5UV66byADL
	V+n9ggu40J7ieWMBWE/6Ub0qBf3E1unp3Ej+SSzLc3SZlfPf06zLegQ9eGlL+Qk9NHA41rRoM8C
	7Jk6ryI0G2fnRkPRB0wp4fJWmR3NB2xkYPI/DqliyvIpO2wArKwcYi1ACh7H7itXAaSS1r2fCe1
	XWLao7UMBq6Cnmr3xxR8m2wAYtAYCBU7+Iib4qkpTER8uwo2cX0OG9kPGHNIZwsM0J7adjsN2O/
	yP6nPvqKlGmRPn/KycRgzNThmecFvPi7CcQ3Nfpstd897hxydwTeAoyKIdyE/tZcI7zRoPjvcfz
	EKJXoRopJyFTpi6Xy/FOUwxTv
X-Google-Smtp-Source: AGHT+IGP9JChyCLN8oP+7KejrIg47v5OBKkR88FiJPVHk9F4HcqJxHQhiZKSP3fE87nRAiAkngPRQA==
X-Received: by 2002:a05:6512:2804:b0:545:2871:7cd5 with SMTP id 2adb3069b0e04-54990e3ed57mr611055e87.15.1741326588773;
        Thu, 06 Mar 2025 21:49:48 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5498b1b2d66sm382417e87.153.2025.03.06.21.49.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 21:49:47 -0800 (PST)
Date: Fri, 7 Mar 2025 07:49:44 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Robert Foss <rfoss@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, Christian Marangi <ansuelsmth@gmail.com>, 
	Bjorn Andersson <andersson@kernel.org>, Rohit Agarwal <quic_rohiagar@quicinc.com>, 
	Kyle Deng <quic_chunkaid@quicinc.com>, Vinod Koul <vkoul@kernel.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	linux-usb@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 10/11] arm64: dts: qcom: x1e80100-romulus: Drop
 clock-names from PS8830
Message-ID: <737cuybby2fsp5hl2c75q4dajax2keymfe7ka4w2b7omw5b4yx@elprmcldts5r>
References: <20250306-topic-dt_bindings_fixups-v1-0-0c84aceb0ef9@oss.qualcomm.com>
 <20250306-topic-dt_bindings_fixups-v1-10-0c84aceb0ef9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250306-topic-dt_bindings_fixups-v1-10-0c84aceb0ef9@oss.qualcomm.com>

On Thu, Mar 06, 2025 at 07:11:22PM +0100, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The preemptively-merged node contains a property absent from the final
> bindings. Remove it.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi | 2 --
>  1 file changed, 2 deletions(-)
> 

Fixes: b16ee3d0cda4 ("arm64: dts: qcom: x1e80100-romulus: Set up PS8830s")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

