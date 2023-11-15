Return-Path: <linux-usb+bounces-2904-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 357FF7EC848
	for <lists+linux-usb@lfdr.de>; Wed, 15 Nov 2023 17:17:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E3745281440
	for <lists+linux-usb@lfdr.de>; Wed, 15 Nov 2023 16:17:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6361033CD8;
	Wed, 15 Nov 2023 16:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tyUzCfXU"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E37333CCE
	for <linux-usb@vger.kernel.org>; Wed, 15 Nov 2023 16:17:21 +0000 (UTC)
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D083CC
	for <linux-usb@vger.kernel.org>; Wed, 15 Nov 2023 08:17:20 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-507962561adso10772104e87.0
        for <linux-usb@vger.kernel.org>; Wed, 15 Nov 2023 08:17:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700065038; x=1700669838; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3qRdRIQB+SyLD/2SSSnhRbTBC1T+kT3kqoQQAJb6ZGk=;
        b=tyUzCfXUfjuyWxENabaWJnV2OSyvqNR7EAWA0zT2WntfZHI3s6xG04BXO/R8sk/+YD
         MXsDRtoBW2LdtRzcmpIk/h/N9xBOCTRkC6sdyqv+pcMpwCWHI8RpfNKosESC9/ca/q1T
         /mV5SXOA5FvbpJ7WCnt74/AjFRRi1SGDG3deh979EwjPtLFfjpVWCDj3vdD3F6bNhZE8
         Y+yBlGGVcPbx3gEjSH2NvfnM1WQF5W6jm/9FdhGandDK5j7w1DNn1xFx3okl1Thzft/7
         XAXqHup/En7RKolTYnwn328dVHmm+2BK/1oHwFX3Z9qqr/bV/yWaUAAruY3OgnZ0LCIB
         nZhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700065038; x=1700669838;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3qRdRIQB+SyLD/2SSSnhRbTBC1T+kT3kqoQQAJb6ZGk=;
        b=oLscovPlD5VmnoxOWFSs+bQ/5Wptcphxz2S7yWN8LKi8yh9ddZBe1Za16tmSB68joR
         TWXlxQ289POuoOGJc+iwPb3wbrj7dDXzjCL2obU+EN0z4m6sZOzzFJumM18+U79ioBBf
         P2fCkH0MF84M8Y/X0rubE+joOy02so58KkmDx/hEUJ8NdhcB+O0IggCLKbejdoETZh06
         Khc0LfbM/r+fTTt/C4L4W3FK/2sLON29kyrX+9sMkqUGShFjjj9F1E6qlc08zCqfYf7x
         A3lnTPjKMWL6pFZJ5Zg6nwBN7M4zpw15etJHtRVLfOIFMr2QHTmp9c7NntC8LMVdKuxe
         kikw==
X-Gm-Message-State: AOJu0YyCV35PozIms6aO2HBaSOokcRA0wjemkPe2nZ/rZCH1KxCcH9fD
	6fYXo+7FI8nqxhf72FysOJzNaw==
X-Google-Smtp-Source: AGHT+IGDqUKQj8i4ksmCvgTifMSpJYI6UUhnm2dFhWerlnxd1hBxKHSzpcMr+i8toBc2SR9Oy0cD/w==
X-Received: by 2002:ac2:43a3:0:b0:509:3bba:e8a with SMTP id t3-20020ac243a3000000b005093bba0e8amr8552355lfl.39.1700065038548;
        Wed, 15 Nov 2023 08:17:18 -0800 (PST)
Received: from [172.30.204.150] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id x17-20020ac24891000000b00507962dd2aesm1692517lfc.207.2023.11.15.08.17.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Nov 2023 08:17:18 -0800 (PST)
Message-ID: <1df726c4-745c-4b41-be04-d3081525210d@linaro.org>
Date: Wed, 15 Nov 2023 17:17:16 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: qrb5165-rb5: use u16 for DP
 altmode svid
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Mark Gross <markgross@kernel.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-usb@vger.kernel.org
References: <20231113221528.749481-1-dmitry.baryshkov@linaro.org>
 <20231113221528.749481-4-dmitry.baryshkov@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231113221528.749481-4-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: *



On 11/13/23 23:13, Dmitry Baryshkov wrote:
> Follow the bindings and use 16-bit value for AltMode SVID instead of
> using the full u32.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Fixes: b3dea914127e ("arm64: dts: qcom: qrb5165-rb5: enable DP altmode")

(because it was previously not compliant with bindings)

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

