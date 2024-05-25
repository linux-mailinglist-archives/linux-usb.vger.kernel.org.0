Return-Path: <linux-usb+bounces-10555-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E3D38CF154
	for <lists+linux-usb@lfdr.de>; Sat, 25 May 2024 22:17:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C00451F22227
	for <lists+linux-usb@lfdr.de>; Sat, 25 May 2024 20:17:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 100301292F3;
	Sat, 25 May 2024 20:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iyLuhf1Z"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26083127B70
	for <linux-usb@vger.kernel.org>; Sat, 25 May 2024 20:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716668208; cv=none; b=VOvDc06EeOSiDc5lepxtqH1LMsiSA8YsetVc4Hh2EUCsoeYdo9YxKYUT8u1IxuakKG5paNBQ5/cx/TSoLr6zwIyWxdbkHdlf0IWftZN85FMijAl+OK9fZaBxVwCWTyHomZ/9p/Q5RWm4AGR+069g2F3nDVZEWPpB2ByWvCT3wTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716668208; c=relaxed/simple;
	bh=2HHhiCt8GLLLa8Gr8o58I0NCI8HzVXKCVVmS/vYl6jw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QTffaC+/ozGEah98l4AKzMzisyjMQnEKI2KYUsLVLtosi+zzV/tSCpEev//5QQ46Eu0iBYd9OIvWAh6dhirYDjPM7cZOIgN/HllBiHuXxaN0sLMoucf46NZNh5EU+PL7MvtyKwvgeUZlB7BGV4VcNcnEupabSffPwVBzmiTG4ZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iyLuhf1Z; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2e6792ea67fso119719061fa.1
        for <linux-usb@vger.kernel.org>; Sat, 25 May 2024 13:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716668203; x=1717273003; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vxSNjzTuJf4atAWp41vejpcFG0wlQeaP+5dXZqy6R+0=;
        b=iyLuhf1Z6c2i08uFYfcGoxKDkZnElnVmtX6Rlcg25Odhw5mC7SvLZXvYIWD3Q/HWCq
         Z5iL441LviOVASqAqYTNIA5f2Zen+XTE4pwB7GR9sdHLWdvbuPuM807+faNepgZHD0JA
         CAtomdSqfQei0PLkV1gc9WUott/skesHrSYhOypIodDjCPA2dZ9DlK/Jfpsj2plXcVdR
         x1EEJi67HkzpAfRFG0DyqPvoNsN4KSAljdMB25VdSPhApwpiZJkPP/Uo9d+xF1q/v68D
         U8sTlGuoOvGDyCnElWLPDeUM+BbUQzdt8+TATlh/CgW2kZ6oVepn2H0/49SYyTDIPNjJ
         B+cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716668203; x=1717273003;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vxSNjzTuJf4atAWp41vejpcFG0wlQeaP+5dXZqy6R+0=;
        b=kHARPBW/Mn3z2GQg3ghf3gKaZFTXgixbqpLT/JeqwU+FBj/edm4EoLDRAaJ3Z9Wy9l
         Hdu07wqylm3ntD2Ari/uuyeavk1C3vB2gEQGE57u2oE+31fDIV833MhiHJa0XGIa7lMb
         WgplwauMXkBgDTN6GVzOJ/+xiN5ZEQrfhjSRkgbgEV9lnNgP2M/lXOlIPsSFO0WzF7cH
         n1Gqa0Kpb8uWXCv21r8J6VVvXsbFd/tM1U14LcbhmSiGZF9QCoTScyY57xftSc/3RZwZ
         aqputQBt+A0YLK6f5yXvWJMa9W9ujmz+HCVKEm70Pzf360rbJps+vF+hpYBXjKnnJuo7
         I5gQ==
X-Forwarded-Encrypted: i=1; AJvYcCVzfamx/GsPfbGvdhxpuBzrgNk5mM7ZaPOuV1u0QWYRzgf/d4zzyj+FhNHckTJZDImygCw/imuq9vxaS2tNXrY7JvLjTHx3syJp
X-Gm-Message-State: AOJu0YyoUn94BycOw3b2k8XtX2odOVj0BLnudRv8bw0fpc3Aj6HduBNm
	ZkCpNnUJLjJkGmvuhgANsi8S7gfb1t3A86IRP5WqrB4OlKNB9fbtppzwcx7LnWw=
X-Google-Smtp-Source: AGHT+IGqRSHwvMo1bs7rJRPMNeOrxq/sWSDnSnLjjibtRkPVSgOa8OApgnvVYNKAuqZszWWcJU2yVQ==
X-Received: by 2002:a2e:3e0e:0:b0:2df:b63:a8 with SMTP id 38308e7fff4ca-2e95b278708mr30593201fa.50.1716668203490;
        Sat, 25 May 2024 13:16:43 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2e95bdd1517sm8813861fa.82.2024.05.25.13.16.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 May 2024 13:16:43 -0700 (PDT)
Date: Sat, 25 May 2024 23:16:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-usb@vger.kernel.org, Bjorn Andersson <quic_bjorande@quicinc.com>
Subject: Re: [PATCH 09/10] arm64: dts: qcom: sc8180x-primus: Enable the two
 MP USB ports
Message-ID: <yqpnfhh5cdi3uxzg5ii5677lsjrt7nothm2neysf32mjce22fk@erbpp5lhmqrq>
References: <20240525-sc8180x-usb-mp-v1-0-60a904392438@quicinc.com>
 <20240525-sc8180x-usb-mp-v1-9-60a904392438@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240525-sc8180x-usb-mp-v1-9-60a904392438@quicinc.com>

On Sat, May 25, 2024 at 11:04:02AM -0700, Bjorn Andersson wrote:
> From: Bjorn Andersson <quic_bjorande@quicinc.com>
> 
> The SC8180X Primus comes with an AUX card with two USB ports, fed by the
> two multiport ports.
> 
> Enable the involved nodes and define two always-on regulators to enable
> VBUS for these ports.
> 
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sc8180x-primus.dts | 60 +++++++++++++++++++++++++++++
>  1 file changed, 60 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

