Return-Path: <linux-usb+bounces-17695-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E7269D110C
	for <lists+linux-usb@lfdr.de>; Mon, 18 Nov 2024 13:56:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4424328331E
	for <lists+linux-usb@lfdr.de>; Mon, 18 Nov 2024 12:56:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C477F19ABAB;
	Mon, 18 Nov 2024 12:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QowslvRV"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9692C1991B4
	for <linux-usb@vger.kernel.org>; Mon, 18 Nov 2024 12:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731934571; cv=none; b=rCQm1ojPmlB926WIhno+S/ixYrxYl7IYLcwLMB2qEY87+eXxSZyblF6n3w8tDrMLwZn9i3uz4f3/7DoC4fPsNVWYu6bZ115O0AtZ+I7CY/j1YW/SsF42k4sZvYSL/5YUyJ7qwBQgdubA2FRM5e5pRGP+gzb6dH5u99swElxb8MU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731934571; c=relaxed/simple;
	bh=GeWAFYEO669F+1bbu0zR8yfp+pZj13YEcoliIrUfJzQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TzO5FRcsdqc1iCymLaDPW+ic+YeFjenCk8qZKBB2ZmnhwktpWH96ScPKAVI5qrxKP0XwLxXtQYrsY+NjOK4NEHwfcZO/cdM0DpMT2deNljnczn83t7uIK7bfiLc97DyX5fIi/7vLd0/AGbEGUNeJzCCxsxNWHUO3d1fQo5xrC+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QowslvRV; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-53d9ff92b14so4275065e87.1
        for <linux-usb@vger.kernel.org>; Mon, 18 Nov 2024 04:56:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731934568; x=1732539368; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jAqwMGBkTmHKZ4CNoWBz4QXL8qsRGD9BwJ8T1sZ1LU8=;
        b=QowslvRVYHIVzOIctggEZqu/EQzBnqzrAC0R1WBT/Oaa/WRvODHeupezsjz/VlC+mU
         es0NDSZ0n7OLA18On4OMFa7RwqJj8O3wdjhYmKzAgxZAUpumiwFX8SXEsfau2ziiqWc2
         sWI47f3x38ojxkHr39NztTpz6Y1MaS2ewHT1SeLvokVjSuo1VXhFMRzzkaZVeb1BUMnd
         R/nHlcE6ey173ZHpB8gC19dS5gHDUE52cpRcTp66ynMIXNZYHLZBcCO/PhxMxiXRpMZt
         L9AtQq3qRCwJhPnG2NmQBMCWwnJxnFf6BLfpNa9+WqqbDmbpahP/xtoRtJHv+1mZj3mQ
         s7OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731934568; x=1732539368;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jAqwMGBkTmHKZ4CNoWBz4QXL8qsRGD9BwJ8T1sZ1LU8=;
        b=IvDfCxIOVzNv71yCUZwht2WMSozt74IKomirFerPFeUUQN15NZdBLVjxgyBhF3xfQY
         MLXBLsA+qtLiSWHMFlYz1ypjxfBoAKvDHLNvtkvykN3S96Wg2nIit3Rn/YRNCTLwAKSb
         PvqdEp0nxVTpt+BSIY49x2T8GDY8rOhxABzChnvRTwkTMyvGzcwfmPl5Wo4paQiOKhdO
         rr/X/YVk8n+MHJGQtvoPzMrQm/TnGInSJ+UNz1N/8fAOIOpaYII4E7WzQxgkAhARUmVD
         +rlw963fAOanCZqeiFgAPzVPdfWFlcUVvZ1EEc2JI0VDrGgaOvjxeKhXdwvUi4INMVLq
         E8cw==
X-Forwarded-Encrypted: i=1; AJvYcCXqcYL72fQMRk78wW68fPSjuQpqWRELjXC7iW3KYukrltN/5ohIX3ZMGgzOrcCLudU3OCfmE41i984=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxvYpr//dQK96pF8NgPs2lrN6MkXAGSkGezVtyB+7dUeKv/2rt
	7wuh1B9NqT+zSJiGL7P4Hub3sy41aGrUrANhjUwp0N+NdB/GoStreM5SQSoj46M=
X-Google-Smtp-Source: AGHT+IE1rwlqvuyY2O92e5DgZac5q8JPauzE9y+A00EL2MXWGS+FvI+OvGI5kWfZ80rMTLt0Z01AUQ==
X-Received: by 2002:a05:6512:398e:b0:53c:7652:6c7a with SMTP id 2adb3069b0e04-53dab298aedmr3661459e87.8.1731934567633;
        Mon, 18 Nov 2024 04:56:07 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53da6548e40sm1594497e87.258.2024.11.18.04.56.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2024 04:56:06 -0800 (PST)
Date: Mon, 18 Nov 2024 14:56:04 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Varadarajan Narayanan <quic_varada@quicinc.com>
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, gregkh@linuxfoundation.org, 
	andersson@kernel.org, konradybcio@kernel.org, mantas@8devices.com, 
	manivannan.sadhasivam@linaro.org, abel.vesa@linaro.org, quic_kriskura@quicinc.com, 
	quic_rohiagar@quicinc.com, quic_kbajaj@quicinc.com, quic_wcheng@quicinc.com, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v4 6/6] arm64: dts: qcom: Add USB controller and phy
 nodes for IPQ5424
Message-ID: <q3twp57aiwvsj2wimvszp7ecr5s4ldacxghzzepmxzcasgy5a4@nnqvq6tgruaa>
References: <20241118052839.382431-1-quic_varada@quicinc.com>
 <20241118052839.382431-7-quic_varada@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241118052839.382431-7-quic_varada@quicinc.com>

On Mon, Nov 18, 2024 at 10:58:39AM +0530, Varadarajan Narayanan wrote:
> The IPQ5424 SoC has both USB2.0 and USB3.0 controllers. The USB3.0
> can connect to either of USB2.0 or USB3.0 phy and operate in the
> respective mode.
> 
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---
> v4: Fix regulator names to match with other Qualcomm DT files
> 
> v3: Regulator node names, labels and 'regulator-name' changed per review suggestions
>     Stray newline removed
> 
> v2: Add dm/dp_hs_phy_irq to usb3@8a00000 node
>     Add u1/u2-entry quirks to usb@8a00000 node
> ---
>  arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts |  66 ++++++++
>  arch/arm64/boot/dts/qcom/ipq5424.dtsi       | 159 ++++++++++++++++++++
>  2 files changed, 225 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
-- 
With best wishes
Dmitry

