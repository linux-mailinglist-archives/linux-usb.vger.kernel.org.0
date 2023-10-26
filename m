Return-Path: <linux-usb+bounces-2232-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5EAC7D8913
	for <lists+linux-usb@lfdr.de>; Thu, 26 Oct 2023 21:42:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 808382820C0
	for <lists+linux-usb@lfdr.de>; Thu, 26 Oct 2023 19:42:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC5123C065;
	Thu, 26 Oct 2023 19:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BJWPYixO"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC42D17E3
	for <linux-usb@vger.kernel.org>; Thu, 26 Oct 2023 19:41:56 +0000 (UTC)
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFC2A198
	for <linux-usb@vger.kernel.org>; Thu, 26 Oct 2023 12:41:54 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-507bd644a96so1914193e87.3
        for <linux-usb@vger.kernel.org>; Thu, 26 Oct 2023 12:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698349313; x=1698954113; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Yv9e3c0vYJpSQOu3wQ5pqkHQb4sf+fuiufdpkPLTfYY=;
        b=BJWPYixO/5WAyXDGb/3or2z+oQayR6+1u2DT8sAOy9aGFbt7mY5ubznO1G2cGncOCY
         Gvi2x8/Edg8WGbqiWF0SfpOCjvZHHUVwDXxIonKDu/gp8uYva8ZWo8Rhj4w7Bn11cnjc
         IR9ETN39R2neX+xNDxTNOXoKKDh2pRfBbQkXwG92nabJMMxSXJUF9cq98s5S3nSYsZeN
         Q+HZIOppz5i8JW/7uYeLfDIf/Fs+T7JGPIlKTXFm6Hb3L57jif46oX+GkgmPZXl14HfN
         q0OT/ERKeqC/9uGMTp2eXHmpHGH63CIoIXWXXkC3ubcCwtzBsQEC6LTKoVG61EtpQR3B
         KyaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698349313; x=1698954113;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Yv9e3c0vYJpSQOu3wQ5pqkHQb4sf+fuiufdpkPLTfYY=;
        b=P8CzrfFSGqmR9bv2k7ncsTTtXaOBVHwvKA2I8mlTbOaNMuxJ+lBm69rjIqtTS1qefI
         64aaAKJJGMTfejSBLMtZ1V+nNB8W31+CUq/xzLvU39tJ3XgYTy3IhBVJs0HFFAuzWoiU
         MSb1tHSR7dCtwNejsVTVopoWeu3J3wDnyA40eMw5DCuFA2o104uLeC0XWGA17eVRVbju
         YHOM9g6dv/1r9DyMnCIU4MqQSbqKUz7bJldVqhN0kRUUEJQjoSP4ak1UxM4lS04BRLlj
         rD7hdFsBgl+RlNl3pzdKtb6FK8fvGcyObpqLcSpIaGnPvtVIwICtMRtmkdl38JSNNEoZ
         eLZw==
X-Gm-Message-State: AOJu0Ywy9cx2yFLWnqM13PU5hokX+Lj+v7l+xLOtsP4d/yPpIMxlq8GF
	UXnmsRzphELgZUe8+liNErkMMg==
X-Google-Smtp-Source: AGHT+IEV42/WXjDvpBt1MNwbTOucybdRAINQLTcLLH26E/VA4usoRuNIF9H1t8+PSj5EnJq1P/1cHw==
X-Received: by 2002:a19:f70c:0:b0:503:3278:3221 with SMTP id z12-20020a19f70c000000b0050332783221mr250707lfe.69.1698349313166;
        Thu, 26 Oct 2023 12:41:53 -0700 (PDT)
Received: from [172.30.204.123] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id p26-20020ac246da000000b0050799f7cd6esm3140466lfo.208.2023.10.26.12.41.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Oct 2023 12:41:52 -0700 (PDT)
Message-ID: <c1929d63-93a4-4425-bdd1-d76a696b528e@linaro.org>
Date: Thu, 26 Oct 2023 21:41:50 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 6/8] arm: dts: qcom: Add pmic glink support for sm8450-qrd
To: Krishna Kurapati <quic_kriskura@quicinc.com>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, quic_wcheng@quicinc.com
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 quic_ppratap@quicinc.com, quic_jackp@quicinc.com
References: <20231017131851.8299-1-quic_kriskura@quicinc.com>
 <20231017131851.8299-6-quic_kriskura@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231017131851.8299-6-quic_kriskura@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/17/23 15:18, Krishna Kurapati wrote:
> Add Pmic Glink support for sm8450-qrd to facilitate passing
> of roe switch notifications generated by ADSP to dwc3 core
> via ucsi and pmic glink's.
> 
> Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>
> ---
No phy+redriver+dp configuration?

Konrad

