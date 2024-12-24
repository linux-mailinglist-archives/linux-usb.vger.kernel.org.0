Return-Path: <linux-usb+bounces-18798-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D99919FBFB5
	for <lists+linux-usb@lfdr.de>; Tue, 24 Dec 2024 16:38:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 14C841884714
	for <lists+linux-usb@lfdr.de>; Tue, 24 Dec 2024 15:38:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C77931D8DFB;
	Tue, 24 Dec 2024 15:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yGxUSAoZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85AF21D63E1
	for <linux-usb@vger.kernel.org>; Tue, 24 Dec 2024 15:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735054707; cv=none; b=Q9b+uqdMs1mdqJo4erpYXcmegmo6LpwaMiIrkdHt0tYnHL8v/VnC86s27ItgAwydLP4XWAmsxFFePdFUQVPEivv9b1u6y13pXKTjcEaFFNFdg2eXBS/CXnZ4JgdlCUq+Jl0nT21Imlhf7dsTlx/Hb3Wlng1A4o1cAWseHruROxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735054707; c=relaxed/simple;
	bh=4faCyAp6YUI2QFv+LIi3qUT7Ak2rNFEGQf5yxrWK81M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r/Qa1fcXTBTOntuO/3ermBdwZ8mepexOZcslOa/AxbhfzSTDrBFkQU+wXkhNH5Aezau0MFccNq29/ToOoaySaCTThKtPBRMENRprI0XwNawnkxYWR6fNAVa/feihDgb3WsjDj6JK1CJ48CcSKVz4M6VxZj9Z1Pwlr/DZYrpuFVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yGxUSAoZ; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-53e3a37ae07so5572749e87.3
        for <linux-usb@vger.kernel.org>; Tue, 24 Dec 2024 07:38:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735054704; x=1735659504; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=h0Oia5cSyFNAwnllDfYlykDp3sapNQ002K1yDD8Y/30=;
        b=yGxUSAoZBXyVdHAETd69sP8rcl8obnIekwSw4qIrTXrpJfUpAXkZQcuATYaD82ptrc
         8FINixam3V4dXcQY/lm1lsIV1lWEOibnOLq3CNlQKKU3cQdDJZFBUbxixl3iKV9d279f
         f8zLdtF+P1JrXGO46gVm5z1fdpmzB0ZGe9GhUhaHVYrk6DhhCsyn/2oU/tfPjcu7e87h
         /9vjq8xi3QU2mk28D6X0ZJvGXiPW1RpGx4qRxiwrDd0dAC8LC07uLjT0TLAv4ZZwISLR
         17yTcpMO30hN+ctth6MKDsCJ7KSBekgnGYfSQYqgDk31SbTGjfO+ZoUfZHpHsUbyizU7
         c5SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735054704; x=1735659504;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h0Oia5cSyFNAwnllDfYlykDp3sapNQ002K1yDD8Y/30=;
        b=GhNVtwMPvz636wz+1l6/MNAvnGKtosovwWRAiM4sRnmbL+Ia4CqmUyjK5UrUChUjLQ
         jaJIHu0HRL1EQ9UFw5MJd1xXy/gC0aoNdMKN23/tSHXZi0Hz7UuqutcDVsQavFR65vEQ
         61/AiVDHLbYknVmiWNKGoUA13uDFJ6p/SQ+Dsk+CcpgMO57oQsQiA2asJ7oXsdqMWuEl
         9Tn424wcFBeibGsVa8IkYBPuhAwLKFMWiT78zP9OM9UCcSRqmZ6Yu4/ElVJL7WS2RwT/
         aIFj3fCa11HzX1RpXj5zQKwyyQuzBEBo3lcCXVJYZCe4603ETe/qs/+sJ1wpYgkE1pqo
         kSHA==
X-Forwarded-Encrypted: i=1; AJvYcCUrM1TCnFQWwOgX51mWVrwcY0YYlkcI5OWCYvGQjhyCg9MXsElRCjCEKxvvAp/Phs5Q1zlKYYdmpQM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgY43tpGM91UwTOuahq4FFREC+5meBVlg2WO7XqWmFOBHjqdKd
	34J/bDLzAyvCyM4m/RcdA3SPgFqdtRJfwNXDCFSY0r0wbUgOVXn1gjUSQF9HuVE=
X-Gm-Gg: ASbGncsj0TBLqT5G329G4FBcH34AcNPbxg/X908PR5gxQRU8skORdEma6al51S8Uboz
	x/uc3MhwpOipxno+FQZO/lVOMEad030KMrhbbTV3FfMemKA5dP0r141ScHHLL+T9vqNAHQqgZNf
	LawGtvByagNTZP/eajYBpr/mlssezzG56fCGgNGOOuSFDFCuH9bwGZhIAVe9ozRZMFC0JdKIlgB
	9gxGK4Yzs2YXj+ayFaRNsWC8TJGUuUDk1hz5F/RbuUgB3EgHtSfLijQr3PWmuXVE4TY8PvO1ql6
	SoG6BkLzrXKKlRvZPY43eh0HERKwzfVdxpRQ
X-Google-Smtp-Source: AGHT+IGG9MpHakOcbbBjdzGFiZ6xINKKS0ADYfvgfkXApWfdFrPdrKibPUeTf/TxOY9JR4fZcJeuig==
X-Received: by 2002:a05:6512:3d22:b0:541:3175:9775 with SMTP id 2adb3069b0e04-54229533622mr5573238e87.22.1735054703594;
        Tue, 24 Dec 2024 07:38:23 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3045b096cafsm17159991fa.123.2024.12.24.07.38.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Dec 2024 07:38:22 -0800 (PST)
Date: Tue, 24 Dec 2024 17:38:19 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vinod Koul <vkoul@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Johan Hovold <johan+linaro@kernel.org>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Varadarajan Narayanan <quic_varada@quicinc.com>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, quic_ppratap@quicinc.com, 
	quic_jackp@quicinc.com
Subject: Re: (subset) [PATCH v3 0/3] Add support for USB controllers on QCS615
Message-ID: <anfqf3jvh7timbvbfqfidylb4iro47cdinbb2y64fdalbiszum@2s3n7axnxixb>
References: <20241224084621.4139021-1-krishna.kurapati@oss.qualcomm.com>
 <173505391861.950293.11120368190852109172.b4-ty@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <173505391861.950293.11120368190852109172.b4-ty@kernel.org>

On Tue, Dec 24, 2024 at 08:55:18PM +0530, Vinod Koul wrote:
> 
> On Tue, 24 Dec 2024 14:16:18 +0530, Krishna Kurapati wrote:
> > This series aims at enabling USB on QCS615 which has 2 USB controllers.
> > The primary controller is SuperSpeed capable and secondary one is
> > High Speed only capable. The High Speed Phy is a QUSB2 phy and the
> > SuperSpeed Phy is a QMP Uni Phy which supports non-concurrent DP.
> > 
> > Link to v1:
> > https://lore.kernel.org/all/20241014084432.3310114-1-quic_kriskura@quicinc.com/
> > 
> > [...]
> 
> Applied, thanks!
> 
> [2/3] phy: qcom-qusb2: Add support for QCS615
>       commit: 8adbf20e05025f588d68fb5b0fbbdab4e9a6f97e

Is there any issue with the two remaining patches?

-- 
With best wishes
Dmitry

