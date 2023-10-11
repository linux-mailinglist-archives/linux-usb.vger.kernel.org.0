Return-Path: <linux-usb+bounces-1460-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 571D07C5236
	for <lists+linux-usb@lfdr.de>; Wed, 11 Oct 2023 13:35:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 11F252823FF
	for <lists+linux-usb@lfdr.de>; Wed, 11 Oct 2023 11:35:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFB4E1E52F;
	Wed, 11 Oct 2023 11:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zHVjRcDp"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18E061E51E
	for <linux-usb@vger.kernel.org>; Wed, 11 Oct 2023 11:35:36 +0000 (UTC)
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8873A8F
	for <linux-usb@vger.kernel.org>; Wed, 11 Oct 2023 04:35:35 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2c296e6543fso83535621fa.3
        for <linux-usb@vger.kernel.org>; Wed, 11 Oct 2023 04:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697024134; x=1697628934; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9KBqo9sUaaIeq2eS6WxMJ21+iTCVV6G7DUNCrNfoNHw=;
        b=zHVjRcDphPzJ9/o4VsD9nDgdW6CCUCDP6b0EN/Ed5VyJozB0XVZUCaprye1UCGCIgu
         6n1trpe31OaCRRQiXU0enTq7Rf2iGdJDfopMuixkAPqQqcumqHvh0chcNFynfs4xsL4E
         3fnMqs/UNXWkCEVzuuaUQrV/r7Q+05NLIUqg01OvMb0jHpMb1NFDLBKFqVrXvfPp5hWP
         nG8aCmF43E2NDrKmjbOz3AecMb0MdPdhyDfcal/ZdKKpPsOTiq+4FvUgDOirFeaZanvv
         uwOs0/BvCYqny3VnKQ5IjJBv5Wr4vNv392mxVqs1AT2n4SxvT3trEwFtJCKOTzC6Jx+x
         UTwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697024134; x=1697628934;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9KBqo9sUaaIeq2eS6WxMJ21+iTCVV6G7DUNCrNfoNHw=;
        b=MZBv/A3SD+S3eee/I0Np8jTW8C5ZibfY2WDs54nBXGR+Y141wV6S5GR+NSs1uH0OsI
         cdo08peK+NtLce1uWRKC+5OnnxEhIwPCTO9l2LF6/IyyMLvuuwhjfa+4zu+1yZMK3JZ8
         uTiuYxKw/tJfeneF2VvfpmTP4Hptctqcf9r1Pj4WxhOd6Av5CizNWo/OHgX8FhMj1g7j
         cw8CdLiHQY2/H6EqHVTAn1A0BYTsArko5YcPN0GGWigYSdg4rdJURsXnWmQzBWwZ9ytJ
         +1pvBvuwQFHmmoOgk8iZR74xKvrMMqVdagG/5XsUvdUIy3naoMjErwHrcOXR7G3vvni7
         HWNg==
X-Gm-Message-State: AOJu0YzV/o5/IScRXm11zQo4IaCdzCtlSok4GkamUH3l8ANP334nToYJ
	xjWfYt99t3r2aqK/ryCBBieyHA==
X-Google-Smtp-Source: AGHT+IHW+J6PRGt0JfgEVPGwtYvACOW1jf2O7QCJoaDm9aL0rZTciQIjadJGRkXGlL7dniI9Og9iaA==
X-Received: by 2002:a2e:3c19:0:b0:2c1:5645:2a45 with SMTP id j25-20020a2e3c19000000b002c156452a45mr20302202lja.3.1697024133787;
        Wed, 11 Oct 2023 04:35:33 -0700 (PDT)
Received: from [172.30.204.240] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id c5-20020a2ea1c5000000b002bcbb464a28sm2882350ljm.59.2023.10.11.04.35.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Oct 2023 04:35:33 -0700 (PDT)
Message-ID: <88113ef7-5405-4c6e-83a9-3b4b87ad748b@linaro.org>
Date: Wed, 11 Oct 2023 13:35:33 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: defconfig: enable CONFIG_TYPEC_QCOM_PMIC
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org
References: <20231011103245.96638-1-dmitry.baryshkov@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231011103245.96638-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net



On 10/11/23 12:32, Dmitry Baryshkov wrote:
> Enable Qualcomm PMIC TCPM driver, it is used to handle Type-C ports on
> devices like Qualcomm Robotics RB5 platform.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

