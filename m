Return-Path: <linux-usb+bounces-24397-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 28589AC8A05
	for <lists+linux-usb@lfdr.de>; Fri, 30 May 2025 10:36:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DCAF11BA711B
	for <lists+linux-usb@lfdr.de>; Fri, 30 May 2025 08:36:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECAA021C9E4;
	Fri, 30 May 2025 08:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aYM3JQng"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78932219300
	for <linux-usb@vger.kernel.org>; Fri, 30 May 2025 08:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748594135; cv=none; b=h8Wa/MXSjgwjb6FW7l5GoVhGhXcLvYp57qkLQlDKXkOxifltpWuXZenI974AFTfhSf/x7CesWuE3in6ec4LR3SGPHMIGIQDGjwoiqCDbp24m8lmb9Qn4h4nmesGLQm9hsiE4BzGuu2V7YrCkkoJH/GTB1z4Ve9CSfj7ptc79z+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748594135; c=relaxed/simple;
	bh=h33LQrSnZ+i8qVEFwmpF+DBn7mv4bG9TT0CnxcqbDcg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SmwFhbB/s+GJ7Z2ykeSc6qOtNzJpX6piV5w08R7i3Ilkq8DBZXydCAsDQJZR75d994Z9ZZeOMd6BfH52kfwUxhRr+QOPYcB2x+nHNfM/XCpcKupdEAt+68qOzCFBk6EUz3M9GEg4X8N4jd6hryaJL5lyYrtwSpwTilJi+9QFetc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aYM3JQng; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-442ea341570so11815375e9.1
        for <linux-usb@vger.kernel.org>; Fri, 30 May 2025 01:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748594131; x=1749198931; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YLQbWS2tM1c5F0xZTSwzJwZIihpwvcGvimBEFrvn6y4=;
        b=aYM3JQng0blGw3SmaQI5JmljMBday+4uJAlvvlTqIlSYT851VrQDqpofaGRYsEmrTk
         92HsXvbpqk5Q/t+TvX1rT5lNNxLwnPPmFIp/BHhDqf1Oi44ZGVaJUXTrTpI/FitO+Qmy
         K1PYALKE1wwn6Gk8bxvCOPxDUEp/fsM2AIOd0rPzbpvvGIetIHA0WMIK/DmLkNTZQCkg
         YyPg30fFCD4ZPA+eSDK2BV0ZopWlDhwohe4FhV7av+AZMq391q2U5+y6b/oqoYqA9Et3
         H/42pOp05GjQ4e9CUixM4tIGuRObzCAuXxnPj7qAQHrLnUTzdnEEUoy2j3qSnXsYMDmG
         7YDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748594131; x=1749198931;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YLQbWS2tM1c5F0xZTSwzJwZIihpwvcGvimBEFrvn6y4=;
        b=o2UZ5OjDe1e+rZS6nK2HSpb2L+HQSLurzwYaKOYYiH3v6EJGSVCIaVAM0Fs6CJo7yo
         CEa5oVXrWoNoIuXVKxKevjtNy0bARAi57HAaSemtdxxanO3KEO7dgpZ3hLUqI+PilSSP
         fwLkCN2lu85mkkC97fvEgU0Fr4uA6D06NyzueCuVh33+nkcXAS1UKE/UbSGQptbz2iVV
         5RhMSh6+Y5ZQeLV56x/dtdfSdDnpvbW/H8/MAlkQibXLFqQG8nTI29rdswTnT6QSR4Pi
         MH3+h1Bo5HKV/rZlPcDLnkeA2MJ0mVMdhBQCNgPrQGwjSfuFMhi/0jsNCg0pM9pB2T2Y
         lSmw==
X-Forwarded-Encrypted: i=1; AJvYcCVAdfFG1vg7WX8SC8NKPQksnABzfInTnCCFzH9m3Kalfo7MZf/gBxXlX1C2CXHvmLnV4unt8ANX74Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9UzoPjvux7HoPsU1XucC4D9lPBirj9t050Yaa8C2ni+HKr8rq
	nmZcPr+HLBLb2pYJoFpNHCnnxOKB/PHyO9jn1tA/9ImkA5cr1P+39MnV/yaCCFqh+NQ=
X-Gm-Gg: ASbGncupq0RrksTvCMiocIodrzgU+fSpuNzpVZuYiUzp7AmWBQZ6bxUKtHlfYIZczgq
	IbG1GEvdki+J97kfwsxiy6jzrZ14LxSvlcAmXgoXGFTKVzFprLkJmx2ygsvtwU/YXV9rAObY3EV
	TpmIIYu+tXeFp6idcsXCypo1+LwkVmtVxot+9Z3BPAFJOkeRYA0/1pzPANEo6LSVNRNe81KGB7G
	zse5H0pQ4cizROWg7wLRQrgOlquKCSpk62vdpt+XXV6JTXnVk6qiXHhbEUii7oXKtKcBwiDKSci
	JWb+2VnfXMav7z/CLvG6YTf2JlMaZfewt3iKyKO5BIOJX4pKM1QhX8SkSB6/OwE7uI0hKRgdD/F
	luytlSO6qty/SDxCx
X-Google-Smtp-Source: AGHT+IHehfnKYCHEwgQg2UA1/7tKSJAulXBmZ2VniP+tL7uxdRKGux7eY9b2KcvJXyj56PkW8C6bfA==
X-Received: by 2002:a05:600c:45d0:b0:43d:26e3:f2f6 with SMTP id 5b1f17b1804b1-450d882b456mr9757105e9.5.1748594130712;
        Fri, 30 May 2025 01:35:30 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d7fb80e9sm11450035e9.27.2025.05.30.01.35.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 May 2025 01:35:30 -0700 (PDT)
Message-ID: <e8f3386b-de5b-447f-af7d-5f521662ba31@linaro.org>
Date: Fri, 30 May 2025 09:35:28 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/8] usb: typec: ucsi_glink: Add UCSI quirk for
 X1E80100 platform
To: fenglin.wu@oss.qualcomm.com, Sebastian Reichel <sre@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
 David Collins <david.collins@oss.qualcomm.com>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 kernel@oss.qualcomm.com, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org
References: <20250530-qcom_battmgr_update-v2-0-9e377193a656@oss.qualcomm.com>
 <grJaz_699sNeLfZ0Kp0u8e13em1Y1VWTlH3dSqSpQE_mHdD7iVKUwHkrvjZ74i3nDzn9c5_Hwg-8IAW40N1iPA==@protonmail.internalid>
 <20250530-qcom_battmgr_update-v2-7-9e377193a656@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250530-qcom_battmgr_update-v2-7-9e377193a656@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30/05/2025 08:35, Fenglin Wu via B4 Relay wrote:
> From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> 
> Currently, the Qualcomm X1E80100 is treated as a fallback of SM8550
> in pmic-glink support. However, the battmgr driver, which uses the
> same pmic-glink compatible strings, has implemented charge control
> functionality differently between SM8550 and X1E80100. As a result,
> X1E80100 is no longer a fallback of SM8550 in pmic-glink support.
> 
> Therefore, add match data for X1E80100 separately in ucsi_glink driver
> but keep the UCSI quirk the same as SM8550.
> 
> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>

Small suggestion for your commit log.

Call out _which_ commit makes that change.

---
bod

