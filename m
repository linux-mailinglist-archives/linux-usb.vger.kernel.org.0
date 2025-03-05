Return-Path: <linux-usb+bounces-21372-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EBBE4A4F4C6
	for <lists+linux-usb@lfdr.de>; Wed,  5 Mar 2025 03:38:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6639E16E6E5
	for <lists+linux-usb@lfdr.de>; Wed,  5 Mar 2025 02:37:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76FD8170A13;
	Wed,  5 Mar 2025 02:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kooRwLJz"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB8CD2B9A6
	for <linux-usb@vger.kernel.org>; Wed,  5 Mar 2025 02:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741142268; cv=none; b=cKiSEU/pW781mJZlt+MXwGKTnTSxbAdYh5WuuoBEAk3cUzCR7kCrhDnTGhKVW53YE+tF+vhD7L6YwVU7zC67mgi5Amx5OlynLGsc+whXLPVSeheXECWHw5R7Mm0h56PfHAPXoI7iutKh/ehtfbaZmhEIG2Q19mEy06jufABUkT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741142268; c=relaxed/simple;
	bh=oxBgNmxdENcaCJquuWTf/U9k8IjF40VaPYhmT3ZZHy4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qwhd71dFWit2+u/4ENUfZkfgNz8G9j8ylIpWqKaqU1NQ4ZpV2T6p7EQ7d+FwUlzTXeH3PoY6TAKLRdTxI+0VSy6+z9vz652Kp0EgKog5YUdz1zMYJ0UZQeiRKrLVcGjj+Ex9599QTM8zwrQ6brYs2vki2JXJGX5AOsInzU0u+to=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kooRwLJz; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-54298ec925bso9447884e87.3
        for <linux-usb@vger.kernel.org>; Tue, 04 Mar 2025 18:37:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741142263; x=1741747063; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7+97ZVr2GLGNMwRJ+JHGTl73f9HD8d4XIQHgo+B51+A=;
        b=kooRwLJzxzEdOhokl3zQO3Xx84jqsBBY9dgmfKwi0jz7uhWiZ3G5hlD57tR7nDF8Bk
         vlXk5+mBNuZBVSflJAW6HN6F6J0U0o7LAZu3zeWUm/DPyyZoWTyph88hooWedIyZTPnd
         y4Xqd6HImr0dDeaafY97ZpmIsdCNZp5VUxSJAENc0SjaGoC8uUgKR1irXvsg0j10qUCx
         i0t18gNiJXTPhcCx92etEpud+kZWX3wTiTgm5nJqFc0MRkCEj51ENOkXiqDE+TNHnGkU
         toazh99YJ72LgD1TZeNxy3p2wYLO0rf3CbtweGU32AARYrTUi9uki0MG7NObNG4qfR8Q
         6dAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741142263; x=1741747063;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7+97ZVr2GLGNMwRJ+JHGTl73f9HD8d4XIQHgo+B51+A=;
        b=pbIFOOXY6Ul2aOP7XG9uY189LqsZEXP+JhGFCKqvMcXKyHWcMbeyG3P54GL8/icM4x
         brTpYTcg7fNQbTSK2+w5MnDOJ0SBnX4S+XrPFAryEvXTMtS9A8FNdqchtFWCj6Jhu1PL
         p9JFehLKiydY6PIcC/ariHqVTAfgNP4Cm74c8BTWIEKT0Pv62N/sRCw769xsBTry9trB
         +OTBtRM+0HY9W09jTiYkPWFqMpQexbkIZ2skZpmXVWqFvcQhhP41H/ifRaErN36li3kv
         sGMAkOv/qT9mEIbiG9JNVWX2BMdQQrG8L5DsR+2E7x80ZHu6jw2KOwXCEbOUr6MFWwNY
         Nc2A==
X-Forwarded-Encrypted: i=1; AJvYcCVljf6fwlHY10lPwP6WaoCE++5pgr1dDD9VrCaQ+RUw2tCNGAW+pCiPurnFKTTr3w+GHTjARbnMKtU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYhtgCLmwkF6bixD1ju/67zEBA9nhlgi8gJrhpq0NlhBznJ3lm
	feoZpHiio88OG9MHbQ6bQwMu8LvsOXtKSPq19UeHE13B21CH4RTBetMaAzfokyw=
X-Gm-Gg: ASbGncstX0K0u5ZuiiTfu+5EZbnZGDyduU9Fjxc4FYhfh1X7q0rThCVSCFdrdemjUiv
	GWAjGk6cPWc5TEVKvsRMZBNjxTU0pr67LxablRFTfsARHZgklOzCLKID0z/IDNkeYgji8CRGtcC
	bAJmSDH6+KboDMhCkmH26gzDSoupkJMuTHv8RqNrUO4oYrTu11KPF+33IbWrGmUqvjcrtEsuxuU
	hj3tUWTSh99iJ/rxLzmo3B3a65kBIpz3JHUuctCMre01Jt3PnvNfR6S3sNNwsSZwUUITi63Aj/V
	mHvKsZ5ixBV2tr9O8GAZox+8G3l0MfloUYzmraWbUcaF/nl3+gEF6eWX/CB5uc9SLR7Hc//DISh
	UdymCxfiwS0yZomYeJrBo3HlF
X-Google-Smtp-Source: AGHT+IExjENqSk5hjjIhys2YXSgdpIqL5VVjIyb8jsl9tsSbsyXgT3nWgdPRJ4khQWdE/LA6vVB24w==
X-Received: by 2002:a05:6512:693:b0:545:c7d:1790 with SMTP id 2adb3069b0e04-5497d336432mr449658e87.22.1741142262813;
        Tue, 04 Mar 2025 18:37:42 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5495ba98c6bsm1058122e87.232.2025.03.04.18.37.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 18:37:41 -0800 (PST)
Date: Wed, 5 Mar 2025 04:37:38 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Melody Olvera <quic_molvera@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 4/9] phy: qcom: qmp-combo: Add new PHY sequences for
 SM8750
Message-ID: <jr4lvgumvnjhybvwuo7crpjhaogjvet2d7llt65qzstjnoekuj@zx6z3npa37xg>
References: <20250304-sm8750_usb_master-v2-0-a698a2e68e06@quicinc.com>
 <20250304-sm8750_usb_master-v2-4-a698a2e68e06@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250304-sm8750_usb_master-v2-4-a698a2e68e06@quicinc.com>

On Tue, Mar 04, 2025 at 01:56:37PM -0800, Melody Olvera wrote:
> From: Wesley Cheng <quic_wcheng@quicinc.com>
> 
> Add new register offsets and PHY values for SM8750. Some of the previous
> definitions can be leveraged from older PHY versions as offsets within
> registers have not changed. This also updates the PHY sequence that is
> recommended after running hardware characterization.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c          | 221 +++++++++++++++++++++
>  drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v8.h     |  38 ++++
>  drivers/phy/qualcomm/phy-qcom-qmp-pcs-v8.h         |  32 +++
>  drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v8.h |  64 ++++++
>  .../phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v8.h    |  68 +++++++
>  drivers/phy/qualcomm/phy-qcom-qmp.h                |   5 +
>  6 files changed, 428 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

