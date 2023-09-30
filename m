Return-Path: <linux-usb+bounces-840-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA7247B42B6
	for <lists+linux-usb@lfdr.de>; Sat, 30 Sep 2023 19:26:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id 594BE2836EF
	for <lists+linux-usb@lfdr.de>; Sat, 30 Sep 2023 17:26:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2504182C5;
	Sat, 30 Sep 2023 17:26:40 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 599278F55
	for <linux-usb@vger.kernel.org>; Sat, 30 Sep 2023 17:26:39 +0000 (UTC)
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF3E1E1
	for <linux-usb@vger.kernel.org>; Sat, 30 Sep 2023 10:26:37 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-503f39d3236so23614695e87.0
        for <linux-usb@vger.kernel.org>; Sat, 30 Sep 2023 10:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696094796; x=1696699596; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TTIc3zh0i/l45HBIix9dYf04hAusch+32uqlKVY6qbU=;
        b=BE4qDhBI17ONQWjWEag1i6EB6kM/zQc5YVrCb6B1AlGdMXmmwagHYBO80Qu/RrLJlZ
         n9vR7XZfAg2RtnA6pQsBl6CTI6Bwg0jZJOSS+3q/Y76nmA86M9b14rCkgQSpEaR+DJRX
         gKnb0LBx2ntq1Gk8sAJ4tqajH/CFyUZJGQyKYbmewzKUqE7fUteVHcbGWnD9E0Ydnjpi
         b6EEJA8r8VMWCYZQYC3se66teed/GwxPi5i1URqSBnjAHb8dcv0fr7UT4x5a5RNFZsnl
         BRs/kv1YuQpNyN0br8mFsPW66O7LNh+/XDbi271zYfYjaQZ1rMFDVV0n9UKPGZm3r0fM
         AHfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696094796; x=1696699596;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TTIc3zh0i/l45HBIix9dYf04hAusch+32uqlKVY6qbU=;
        b=jwWJkAMtMFx12oOVh/40zfUyGOu4UdYmXk9kXYEr0xiloIRa4L0DRJb9Q995ae/Qdz
         E2E4lCEtLH2DJxK90QScUH6eddjtSUv25OPQd6apU47P6Ho9mKYfJUn5LNZhRLbmh3li
         QsHVbdaM/ch0Wwpa49skCz7IW39GByAdZ8wGM9af2qDTrMXDz06ffSVjtfotM/m6CbF8
         8N/JKikNjWwf7qPEc9JpbVtGAiPZAJrMXQMWThVxxBcElpDYCDn4OTfhFs2neZWLEiCX
         j3uuJ7LDDdl5dAm/na20RsG0SETGjnXPZATMf5wQl3q0dyIxi40ILQGXW9yealtquYj2
         lQaA==
X-Gm-Message-State: AOJu0YyZr4MF/4iJz9i4KgGgk4l/COV4G4aLYUAeF2+rEOmnyfkXpMis
	ledqwhhUngONWP0EF/LQ/3PCbw==
X-Google-Smtp-Source: AGHT+IF+QJ1JktLXNhzwX2l7EIixDHi+uB7yhFVUgiL1XWhNJTeQllLnlrNI/3y+6WeiEN8VlSdDlQ==
X-Received: by 2002:ac2:4dac:0:b0:503:eac:747 with SMTP id h12-20020ac24dac000000b005030eac0747mr5603752lfe.47.1696094795994;
        Sat, 30 Sep 2023 10:26:35 -0700 (PDT)
Received: from [192.168.246.189] (85-76-98-178-nat.elisa-mobile.fi. [85.76.98.178])
        by smtp.gmail.com with ESMTPSA id z8-20020ac25de8000000b00500ba43a43asm3994414lfq.86.2023.09.30.10.26.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 30 Sep 2023 10:26:35 -0700 (PDT)
Message-ID: <1e3af927-52b0-42ab-9643-db4bf3f2d2c4@linaro.org>
Date: Sat, 30 Sep 2023 20:26:32 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] arm64: dts: qcom: ipq5332: Add Super-Speed UNIPHY in
 USB node
Content-Language: en-GB
To: Praveenkumar I <quic_ipkumar@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, agross@kernel.org,
 andersson@kernel.org, vkoul@kernel.org, kishon@kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 gregkh@linuxfoundation.org, catalin.marinas@arm.com, will@kernel.org,
 p.zabel@pengutronix.de, geert+renesas@glider.be, arnd@arndb.de,
 neil.armstrong@linaro.org, nfraprado@collabora.com, u-kumar1@ti.com,
 peng.fan@nxp.com, quic_wcheng@quicinc.com, quic_varada@quicinc.com,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: quic_kathirav@quicinc.com, quic_nsekar@quicinc.com,
 quic_srichara@quicinc.com
References: <20230929084209.3033093-1-quic_ipkumar@quicinc.com>
 <20230929084209.3033093-7-quic_ipkumar@quicinc.com>
 <618992fe-4c76-42ef-af47-ee66f74c5bb6@linaro.org>
 <3f89e0b7-189e-4cf7-bec5-b03c903c46b5@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <3f89e0b7-189e-4cf7-bec5-b03c903c46b5@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On 29/09/2023 16:31, Praveenkumar I wrote:
> 
> 
> On 9/29/2023 6:44 PM, Konrad Dybcio wrote:
>> On 29.09.2023 10:42, Praveenkumar I wrote:
>>> Add UNIPHY node in USB to support Super-speed. As the SS PHY has
>>> pipe clock, removed "qcom,select-utmi-as-pipe-clk" flag.
>>>
>>> Signed-off-by: Praveenkumar I <quic_ipkumar@quicinc.com>
>>> ---
>> Patches 6 and 7 should be swapped, otherwise you may get no
>> USB with this commit. Incremental patches must not break
>> functionality, unless it is truly inevitable.
> Understood. Will swap the 6 and 7 patches in the update.

But just swapping the patches will not work, the patch for the board 
file will break compilation. I think you have to squash them.

> 
> -- 
> Thanks,
> Praveenkumar
>>
>> Konrad
> 

-- 
With best wishes
Dmitry


