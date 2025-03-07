Return-Path: <linux-usb+bounces-21486-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C9DA56064
	for <lists+linux-usb@lfdr.de>; Fri,  7 Mar 2025 06:51:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0E3BB3B4147
	for <lists+linux-usb@lfdr.de>; Fri,  7 Mar 2025 05:51:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 336091946A1;
	Fri,  7 Mar 2025 05:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MaiPhB2E"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0295B194A66
	for <linux-usb@vger.kernel.org>; Fri,  7 Mar 2025 05:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741326675; cv=none; b=F+yhs+OYFOa6I9xTPwYXjswuLBI+feNFcMAubes/7IOBiyM1Ubh9ZYDoH5hioaVoDTkia3SEe90vxf0K3rZ1FMn9P3y8z/JRKB+dLH5HRI7Vo13swFf8vPwh3m5OiNrtzULriN3tWCUAG9niLOgxMkDnxn7CmcPQLAtaLTE2YfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741326675; c=relaxed/simple;
	bh=i0+vWPXN2cdkzD1NTQZZWBolbNXz27fwbs3BiMXdQ9M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NWr/4FQBtqjA0dsYcX2t5gJPKVBaCPLLPa5m+LwFfNEIGK4CWG/24A41eJmFkFNwUkkMiGwfh677mEYfO5xHzOMAPsh70UnHQpriudJEG7P+8Rvla3InEK08jOFumQV+XnBm7+HGQPo8ealdWHiIiuw7dWpV45slykrNA5YJe4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MaiPhB2E; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-30bf5d7d107so2957031fa.2
        for <linux-usb@vger.kernel.org>; Thu, 06 Mar 2025 21:51:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741326672; x=1741931472; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tXmSK8/WMVoYp/YH6Up96+HRQthxxadTxRUuQDlSb80=;
        b=MaiPhB2EOvjjLPWLCzyqtKFLvB98B6FCAOdU3qv48A1AxEGKYkWG1rzxw5VoHd9l6j
         IFLnoW3ffmqGHcz1cp+5gjl5TrlW2pbIpuNDhn1hHVCHFqVdoyneywDveYVciR2N3np+
         OMfZ9j+92f01e9TRBq7ZVvMtvT1uNMWa0FjBLyMs6CvvsMPQNF7CtmcY8oakN+OxwWtJ
         CJuJFc+0jnovxB8eCL+jHdrUCTVFJoT9VzwajsdOwsiPI/9nv6SFEC7D1NyuHQZd9yzW
         qWi5ug0GXGhMwevMpw7+J0B3EQ6jQHXd4stP3F2tti+BpG8QIOBBWqlhJJCO2oR+08LK
         o7XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741326672; x=1741931472;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tXmSK8/WMVoYp/YH6Up96+HRQthxxadTxRUuQDlSb80=;
        b=qk1Rdv8dhubat+jkICHHyw8n1A6mjrVt4cq0BYdPY0vVYdzvXanA9SUZLfAFXjib9B
         yCnyJwXi+YheeOBTN+oE4bvK6p46T86Iy5KgplfJl0IqOI/5rygIZwr2m3lacC4BsPUU
         9nLNUcjI/oioNHGDjUByPo5em9v6wO98hnBDX88F3IbMBCWbSujJf2Ydx03TezOIKQ7U
         QkSRMZf8olcPslOytZ32uPsQ9r3eBTi9ARn3lEjsfk4uE0hAVnUae29bjEz7cYlqbyxq
         FqnbnzFpXw9D/GmynR1XAZ1vd8kUDZ/tV25jJhT9no0vQws3XqFkSNVV0fNf1wsXoG0i
         C+tg==
X-Forwarded-Encrypted: i=1; AJvYcCXq/AhEl+11cxeFe4OVhsASuw/id3wJpOF6M1PKuZMGqEAlx8/gSmEy29I+auNC0xnQX7yhD5OXbJk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyqiovLf3K8IWHPo1h+w32AEGwR087CCWdb2R7YhjPnBYgmxa34
	ivjgmt8u8fRjPIby9s+LQQwccE9Zn1Dpzwe/Aq/dYAn9SVrbwH41Dxp0YPvmLPM=
X-Gm-Gg: ASbGncswZ1yP9qj+ZkNBQQ1YxFE5vC0urFDcLHnLDd/bbDIUX0lis4V7OLKROMG6GZJ
	dWo7ITFqnFYflVQNg/W0U2nnu5kQJZ6MITKTpN8Jg4BYUOx8sK25wuNc0RRdVFDm4qMc69qonPY
	jA0K42C2rc3fRRPRkCNYrBWIaETbAIuqPL0gsDJRPmFHqfwjjHQ9esCcjSggQcfsHGTfPklKs3q
	to9rOCmckQWFvvQmoub/MbJXphiovEgn7iCPQsU/H4JabpXyBUGdbxcBOUXPiH/qIRtOF9mIeWD
	vEcwuyCmy27OknmwBBtzDSQ109Fxlj/t0paltP5ohVc5hJ4EwbhRB8pi7UpFAh152bf4Rr6GwpA
	3lfjL08b7U9f6Iv4jfm+z0/dG
X-Google-Smtp-Source: AGHT+IGZcu2fypEgK7clxXmR93TzJ7unEXU/+kahsKp0+Qev+odXPrrlaC4iINRI4Yd2AzKHpypLwQ==
X-Received: by 2002:a2e:330e:0:b0:30b:eb08:53e3 with SMTP id 38308e7fff4ca-30bf45360acmr4804561fa.17.1741326672025;
        Thu, 06 Mar 2025 21:51:12 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30be9a073d0sm4291591fa.112.2025.03.06.21.51.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 21:51:10 -0800 (PST)
Date: Fri, 7 Mar 2025 07:51:08 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Konrad Dybcio <konradybcio@kernel.org>, g@eriador.lumag.spb.ru
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
Subject: Re: [PATCH 09/11] arm64: dts: qcom: x1e80100-dell-xps13-9345: Drop
 clock-names from PS8830
Message-ID: <bth4rfqqu2bat24avosimvxuqmruc52taues4wljnhfcmxnx7m@zkjvf32oiogt>
References: <20250306-topic-dt_bindings_fixups-v1-0-0c84aceb0ef9@oss.qualcomm.com>
 <20250306-topic-dt_bindings_fixups-v1-9-0c84aceb0ef9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250306-topic-dt_bindings_fixups-v1-9-0c84aceb0ef9@oss.qualcomm.com>

On Thu, Mar 06, 2025 at 07:11:21PM +0100, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The preemptively-merged node contains a property absent from the final
> bindings. Remove it.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts | 2 --
>  1 file changed, 2 deletions(-)
> 

Fixes: bd2dbbb1f35a ("arm64: dts: qcom: x1e80100-dell-xps13-9345: Introduce retimer support")


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

