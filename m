Return-Path: <linux-usb+bounces-1749-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AE5C17CC883
	for <lists+linux-usb@lfdr.de>; Tue, 17 Oct 2023 18:14:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E029E1C20CE1
	for <lists+linux-usb@lfdr.de>; Tue, 17 Oct 2023 16:14:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F8A1450DE;
	Tue, 17 Oct 2023 16:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jDPFaQj8"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3512B3B2B1
	for <linux-usb@vger.kernel.org>; Tue, 17 Oct 2023 16:14:12 +0000 (UTC)
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 747B1F1
	for <linux-usb@vger.kernel.org>; Tue, 17 Oct 2023 09:14:10 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-407da05f05aso6107015e9.3
        for <linux-usb@vger.kernel.org>; Tue, 17 Oct 2023 09:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697559249; x=1698164049; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AKmQY7BLgBndXsxrNKxMvIo95aL00rRTN4PkHuTiB8Q=;
        b=jDPFaQj81Cg+o3/JqhA2Fjvipk6Qi9gIAUB0qDnPFsNldAL/h4vp7C6B02d98kO+2p
         Xcnom30EmF9EGdCWVk3op4GX1E712IOfSXLgFGKNBpAL+YPC/j3wsVImHWGOI3H+hOB7
         eadExD/JejqnECMLUE6RWnfihC5KLVbiAcwI+g4H1LbrSt8ZbVvQECQwPrVyBEeWzv60
         mRV0+5xSkHiBKt5orZZbu+spPWXlfE/XskZp96DWpTYwL1pKjoClS9Qhexv6SR8qXWYb
         jeVPThbzCTcSpuQReUHkFebutfMF2HUbcuagqryP32fvFNw06KnwrLEQ3sOuIfuSScPd
         BfBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697559249; x=1698164049;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AKmQY7BLgBndXsxrNKxMvIo95aL00rRTN4PkHuTiB8Q=;
        b=pGGouCFdh5QmLa6XeGUzTNs7NA0vl/PR/BZV6vRQ4GZsJVbLIGd/a3OIgytX+BQLp4
         3m4PQ4Zsq+CpYvi7CBBum7dM3IjVkRG7gVt2z/YE016ZuQsnYDnKi+eGC+X/MxP9B5vS
         p8k59Q26SOmYeXN/5VPqY1UKf+/WKrservYAyqnlt/cRcnC2e07diq0EX6bUBV3ko2+p
         P17k6MhH7P5grNCig59hKhSX+5MSLbZ8appLAZU88tb8FnrJiOzmg09iyAChlXbEnpwv
         j0HSZxGY9/D3bCxpvQo/dtHHIHxy5OblyZ1ENSa5PBbUxnJ1LAl0b3/OOzWUOfxWCcdJ
         MoNA==
X-Gm-Message-State: AOJu0Yz+QPnYtzoLnoERMdH6VROh1TRnJLxF91pt7ZxPE4lARAHR/Nhh
	/42bCZ9mD5+BgRKy52+9dtW0AA==
X-Google-Smtp-Source: AGHT+IHwbJv6j6ptrNMYA09wWv9S10K/f+EjOxDnfiiQo8bvQ8vYVhH6fnAwUJNi9K2IWSbOMWqomA==
X-Received: by 2002:a05:600c:6021:b0:407:536d:47ae with SMTP id az33-20020a05600c602100b00407536d47aemr2085070wmb.38.1697559248879;
        Tue, 17 Oct 2023 09:14:08 -0700 (PDT)
Received: from [172.30.204.57] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id q28-20020adfab1c000000b003248a490e3asm101189wrc.39.2023.10.17.09.14.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Oct 2023 09:14:08 -0700 (PDT)
Message-ID: <013b76ea-82d1-4bb2-9842-b47cc4ccfc55@linaro.org>
Date: Tue, 17 Oct 2023 18:14:05 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/12] usb: dwc3: Override end of dwc3 memory resource
Content-Language: en-US
To: Bjorn Andersson <quic_bjorande@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Felipe Balbi <balbi@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Johan Hovold <johan@kernel.org>,
 Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>
References: <20231016-dwc3-refactor-v1-0-ab4a84165470@quicinc.com>
 <20231016-dwc3-refactor-v1-5-ab4a84165470@quicinc.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231016-dwc3-refactor-v1-5-ab4a84165470@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net



On 10/17/23 05:11, Bjorn Andersson wrote:
> In the case that the dwc3 core driver is instantiated from the same
> memory resource information as the glue driver, the dwc_res memory
> region will overlap with the memory region already mapped by the glue.
> 
> As the DWC3 core driver already does math on the passed memory region to
> exclude the XHCI region, also adjust the end address, to avoid having to
> pass an adjusted region from the glue explicitly.
> 
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

