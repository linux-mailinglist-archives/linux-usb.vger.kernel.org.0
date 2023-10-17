Return-Path: <linux-usb+bounces-1751-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB7B7CC89B
	for <lists+linux-usb@lfdr.de>; Tue, 17 Oct 2023 18:18:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ECB45281A83
	for <lists+linux-usb@lfdr.de>; Tue, 17 Oct 2023 16:18:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94AF247340;
	Tue, 17 Oct 2023 16:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mfL6LNBe"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 876B444498
	for <linux-usb@vger.kernel.org>; Tue, 17 Oct 2023 16:18:45 +0000 (UTC)
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C054FD
	for <linux-usb@vger.kernel.org>; Tue, 17 Oct 2023 09:18:43 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3296b3f03e5so4965556f8f.2
        for <linux-usb@vger.kernel.org>; Tue, 17 Oct 2023 09:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697559522; x=1698164322; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lF/xhtEmkt32W02v9Ks3r21OU8ykW4jEkwDZ1zIzjDs=;
        b=mfL6LNBeAXxrXh301emgtLaoO9VZhEM0nvDiHo3ovpxKpJN5C/I6g7zWXOLlNn7TKz
         fV2utESbVU+Gw07jNUKVLWdMNetbguFGusUnsYInzvQzNm9Uf8xcLxPycFAm4/4Qv/43
         0iDFrdFhOAyOg95PG8bJGrvbvkniB0zDCwPb2aNnpX7Yd7rFJK6NzT2yA2aaDLOknYAg
         WfbaG29mPKZqa1b+aPKwzP/bjz0DWwHEPSXnlbEpRAADf6sJozLouRRnIUWSTU1G8IfP
         p+ezMYC0LQL6nDkFWYFlhQBZLuUCywmyng4HorAe4blLFYUcm66zHDnulHqzHxwF2HPe
         m9hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697559522; x=1698164322;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lF/xhtEmkt32W02v9Ks3r21OU8ykW4jEkwDZ1zIzjDs=;
        b=gyX980P1Nj8PkJIdokrLSXHkzk3Q6Sp1sysm1ylRtYk5Fv/rxvelzi9jjwfKnK/N4w
         ymUUWr3lr2nBFvOidLP/Kz9LbGPpYGX/E32Q23t004HS8/Vt+/8GlMmNWc10/PMsjjpS
         zrhQNVFBeaGklehtikfCwA3lQSc08xnO9axQEceLBQQYckafQIDcrwh4C7GEXbqo+/6J
         LG+wBwK4DM6tcKU93R4HlaWtDXoSV36QTWQlp6cqM3L5qB4AqUpzcanSKaB0PsLzFwuG
         q3aQcVBofLCNe0fX0mdphecA++TkF8UgrDVNw7fthJW30lbh8tomBb5DO/rAvO0wkrIq
         i2ww==
X-Gm-Message-State: AOJu0Yxixq26FrscszuRZHZAVOnpIS14bZQz/VVWBPTi6CBVc2PuZnki
	tzychgPgrX05aDQDayMjRjxDzw==
X-Google-Smtp-Source: AGHT+IHNYU71aP1f+DVsqkhe9ad773k2KY0LYMnkOZBZdzjSEBq6OefuWUqQzYnepa60GVzU06Lr3A==
X-Received: by 2002:adf:fc91:0:b0:32d:a7b0:62b with SMTP id g17-20020adffc91000000b0032da7b0062bmr2275425wrr.26.1697559521926;
        Tue, 17 Oct 2023 09:18:41 -0700 (PDT)
Received: from [172.30.204.57] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id d18-20020a056000115200b003217cbab88bsm112516wrx.16.2023.10.17.09.18.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Oct 2023 09:18:41 -0700 (PDT)
Message-ID: <9008f2df-9936-425b-b702-02f720dcd5b2@linaro.org>
Date: Tue, 17 Oct 2023 18:18:37 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/12] usb: dwc3: qcom: Inline the qscratch constants
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
 <20231016-dwc3-refactor-v1-8-ab4a84165470@quicinc.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231016-dwc3-refactor-v1-8-ab4a84165470@quicinc.com>
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
> The two constants for the offset and size of the qscratch block within
> the DWC3 region has the same value in all supported variants, so they
> don't necessarily need to be picked dynamically.
> 
> By replacing the lookup with the constants it's possible to reuse the
> same code path without the ACPI pdata structure in the upcoming commit.
> 
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
If we don't want more non-flagship-SoC-based post-sdm845 ACPI-supported 
platforms, using just one of N USB controllers

which I am very happy that we don't

so much so that I'd be even happy to drop this acpi thing altogether

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

