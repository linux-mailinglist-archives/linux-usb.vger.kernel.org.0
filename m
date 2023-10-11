Return-Path: <linux-usb+bounces-1455-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9677C5096
	for <lists+linux-usb@lfdr.de>; Wed, 11 Oct 2023 12:52:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 865D42823F4
	for <lists+linux-usb@lfdr.de>; Wed, 11 Oct 2023 10:52:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72F7317999;
	Wed, 11 Oct 2023 10:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexus-software-ie.20230601.gappssmtp.com header.i=@nexus-software-ie.20230601.gappssmtp.com header.b="Ugcfb81P"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 522B61078D
	for <linux-usb@vger.kernel.org>; Wed, 11 Oct 2023 10:52:07 +0000 (UTC)
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 597EDCC
	for <linux-usb@vger.kernel.org>; Wed, 11 Oct 2023 03:52:05 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-32d849cc152so507645f8f.1
        for <linux-usb@vger.kernel.org>; Wed, 11 Oct 2023 03:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexus-software-ie.20230601.gappssmtp.com; s=20230601; t=1697021524; x=1697626324; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TwWT4IYbpXX6DFtsyZBSiSeurVMLjbNbulZ+VeIuYDs=;
        b=Ugcfb81P4Ooh6vAxTH10lY2xWbJv8OHAPNyoPWhWPPIWXFAfckMtuzYl7PCqHlG1rU
         61zaUANrACN/0oMVBdtrENsPpeu+zDIW1/tatgORDsV0N9UmP6rlCRQ2mTD1za/7LSAh
         Na4ET+OuwFuCOHnU+4YMjRT7BST/PhQN2Abzmqh5xYsbitvCO4f36q1zpilKoDRhJX83
         x0WSxWtVxXsT1XwsF1rHQsLHnx5wO575ZH9Z24PtuHEK0dAaJA2/r7cJ8PGaW27cDZKq
         tQs9arelqmc91U5Qw5o2fA7/u/40VV892rg2zhzQekAOMz1K/i1Rk5xCZC5/TrTNI+vo
         51ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697021524; x=1697626324;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TwWT4IYbpXX6DFtsyZBSiSeurVMLjbNbulZ+VeIuYDs=;
        b=g2L5hbyOyRik6RPjkBPX6u1iYIkgv129y1qOepoOeA1I8oPrJfRHxNjjWLI/7CU/7e
         Jj5D+Il20PiJK7OaGgUSCYeFVAIMaleAE512xZSd5z4ngGSw6OCRCGzkX23WL4R3kL9b
         NLpy49yeFI1l/2NFrMgkatZ/8zq+NSOcdZd5ftmP3Q9u4RU7bm68epn0RFpr2/I3pEdy
         ZE+dd2SgJNlf9Yix52SWG3fC+5IJjRP9VNhYuNWi7Qkh3KHGY5YodgDbLjtAqs+0c9XG
         17iXka80au6GuochC+NXbNMFXjoaKSJeWandvrUxiqUbWsoyGxr2nKxv0fd67EI72Kve
         A17A==
X-Gm-Message-State: AOJu0Yxrei+q5Kp1+GmezFRKgE7J1i1uPuWofHtmIzfzvVNfPcn5LMP/
	4YQckJXyyMKQywST8qrC22lEZQ==
X-Google-Smtp-Source: AGHT+IEXISshUTVPtxuyUeL4wx1qW+uUDwVadrLh4BOqT5XeQ1RR0hjE1Eq8bw6kFW7kfimA7KekTQ==
X-Received: by 2002:a5d:4149:0:b0:31f:eb8d:481f with SMTP id c9-20020a5d4149000000b0031feb8d481fmr18571149wrq.29.1697021523796;
        Wed, 11 Oct 2023 03:52:03 -0700 (PDT)
Received: from [192.168.100.102] ([37.228.218.3])
        by smtp.gmail.com with ESMTPSA id t4-20020a0560001a4400b0032763287473sm15312339wry.75.2023.10.11.03.52.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Oct 2023 03:52:03 -0700 (PDT)
Message-ID: <81b1f92b-92ce-4e4d-8385-bab3a2acece4@nexus-software.ie>
Date: Wed, 11 Oct 2023 11:52:02 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: defconfig: enable DisplayPort altmode support
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org
References: <20231011103245.96638-1-dmitry.baryshkov@linaro.org>
 <20231011103245.96638-2-dmitry.baryshkov@linaro.org>
From: Bryan O'Donoghue <pure.logic@nexus-software.ie>
In-Reply-To: <20231011103245.96638-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On 11/10/2023 11:32, Dmitry Baryshkov wrote:
> Enable the DisplayPort altmode, it is required to get DisplayPort output
> to work on devices like Qualcomm Robotics RB5 platform.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   arch/arm64/configs/defconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 9509a73db774..5807397e645a 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -1048,6 +1048,7 @@ CONFIG_TYPEC_MUX_FSA4480=m
>   CONFIG_TYPEC_MUX_NB7VPQ904M=m
>   CONFIG_UCSI_CCG=m
>   CONFIG_TYPEC_MUX_GPIO_SBU=m
> +CONFIG_TYPEC_DP_ALTMODE=m
>   CONFIG_MMC=y
>   CONFIG_MMC_BLOCK_MINORS=32
>   CONFIG_MMC_ARMMMCI=y
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

