Return-Path: <linux-usb+bounces-28138-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9980EB58FD1
	for <lists+linux-usb@lfdr.de>; Tue, 16 Sep 2025 10:00:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9FD3F5259CD
	for <lists+linux-usb@lfdr.de>; Tue, 16 Sep 2025 07:59:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A4062848A0;
	Tue, 16 Sep 2025 07:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aZqfDEOl"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93E34284671
	for <linux-usb@vger.kernel.org>; Tue, 16 Sep 2025 07:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758009551; cv=none; b=nIxFaqbYSD2wet5Gpzn2Qjs3gtn9XmnBOH1svuXG0ikznxWHloRvZ8TBRKnTDD79Mpc4pMeHEZ6E5X7wM11VOfPdwuF4nCihd0iEd1USu//cFhhpsMXthAg7ovJrdq8KexLhFVOEO4J2diUwXCFT+aGyZvf+hutPMnTMJF5SjVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758009551; c=relaxed/simple;
	bh=luXA3BAxwfQykxsWgqlH1n5LzWlMt8n5hBlB3Owwr/I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fco6q/xP3r6PbLIcBVzF9uCIbyBpw7inf3mYwyGBP5X6+x7JWoUuVf07bYzEUNqx8dY61/l7b5qNDyFoAVDvmolAT9n+6C54MpqyJL3jQheBrAn2KnAp29/t6+PUVoXCZxOxDuTpdjjzAtGoJkdigw+/xZ0wCKoPswN8J6PBK9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aZqfDEOl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58G3qL9l021231
	for <linux-usb@vger.kernel.org>; Tue, 16 Sep 2025 07:59:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Bl6XIkWkFljciR/SPXMo9xgXQdmc9fkaHnQt4AwcHd8=; b=aZqfDEOlATWoThDM
	ovnK8QdibZ7MoP6MD4xtyQjIMUXl5SGGabYbOV0MOFfRcCtNDw1M4lwluURmWhKm
	iRLViQFxuKsDeTUoEFgpX4h6P0Qc4V+g4S16QTRdV4bozcGIXbbcNt8bNR0iOQ/n
	KXurKArH5gI0jOf/XdBpKcVmvJV9dPPb3YChdbIrJBjRs9+rUT9Xre3Sjv7DQimj
	11KucwtHUmvuDfIiZlVI3rRoBs7AaqThTRrwHVk4rrW/daJfMGJ+7DTBmG8r37us
	yipYnAwNOOG+xRAvLiIFtQG3HWw3Ox/VKdnogaOKwe2ZLYuvm1do6iwXRFfuel2k
	VGCn2Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 494yma7yq1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 16 Sep 2025 07:59:08 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b4bcb1e32dso16601381cf.1
        for <linux-usb@vger.kernel.org>; Tue, 16 Sep 2025 00:59:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758009547; x=1758614347;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bl6XIkWkFljciR/SPXMo9xgXQdmc9fkaHnQt4AwcHd8=;
        b=fTS5DfHct4wSysqfKacUet76Bq33v7HTNQO0lUG1WIIY9ASlHPmMaSVml2tiemL/D+
         tKD5t3DwF8mFEijI3AFz2W9ltRJwXcDmEVqTzCJz7G2L4s2vW+5nqEBOtr/qtKLB3lnP
         iKxaJ4lWpM15n85taQ1JkREsuqPHufuuwBmiy/R5mQ1cYhoGeB2gwUHZHq5vJ/xyduJw
         xkPBaDLAtX6vm6Az5ELkKvC6cnXXbL4Hgdjpx06IBBhRlpWwSMoIT0WySPr2oz4JVIpg
         O//1XJUx0hBJ5ScY2RMd5Ig/1EsmrEe+Z5gKFCM6k4hiuVQum3fs8jkxMTT7uxg85jjC
         wTqg==
X-Forwarded-Encrypted: i=1; AJvYcCVU8DEwdNn7Ec3GLKeXikqikAQZPtK6f25aJUNuwTId008rbxSWQkeJhrdJKkBY6V5SfI7OgO2sInw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzyk4z13V7I17l4RvYKb5HX0ZP8ljpYwF8SsxpyWojPYxBujFcZ
	6Ly+b3zee7vs9EcCQ93HFaKPEIzU3QvP6atTdW6E1jgxc4TWT+gnlmVqDOu+JpJ0lNPgGMWz+2Y
	ejkqhpimg/2jf5jfuK5rxPgl8mpgIg3kt6vuhnnooAx8Epk7YOHXOLcJSFn0q1pE=
X-Gm-Gg: ASbGncs/o9KxCbDw+vauqas07r6zzLzYjRHJRDeqXAWKQZKdoqI12svtighPfxCpsJe
	qIZ4UKU+EpPKZsnikQpcdfSyI3SjaUvBJWzEt5z9EsQecZCRUlPYmRXkaeZXD9Jzx4/ZkdYqbd4
	REAxBz7YJIA6mHHWXS8p5bGlbqN5WDeKPofhfC0m8zg6Z+Oz2v4F+yWnu3si3sXdVb9eMAyUWa+
	+aOeCn83kS2PfPtUvVpGlaLRmstQNwH2MKfgq0pSj79CHEB7kQNRh+omXdZQfhrGtfMwNnWGKEt
	gmAFTbZ9s/0XaFZhICv2eyzNIabkdBCuwEx5wmmAcvykjMpQRjth5iV9bg/YWzG4mRyeeIBCstU
	Ks9sMC3uQTbd3SgICtBGBxQ==
X-Received: by 2002:a05:622a:1819:b0:4b7:9ae7:4cdd with SMTP id d75a77b69052e-4b79ae7518amr65238601cf.8.1758009547481;
        Tue, 16 Sep 2025 00:59:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHmODftrEEwDnmk4gqtDucReWHiHbxT+KlMqX2icp9tsQ6afSGP7fT1h5VI8YPit50d0g7z1w==
X-Received: by 2002:a05:622a:1819:b0:4b7:9ae7:4cdd with SMTP id d75a77b69052e-4b79ae7518amr65238401cf.8.1758009546833;
        Tue, 16 Sep 2025 00:59:06 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62f416db508sm3528606a12.32.2025.09.16.00.59.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Sep 2025 00:59:06 -0700 (PDT)
Message-ID: <5736df73-c90e-4f11-b461-c38da4e811e1@oss.qualcomm.com>
Date: Tue, 16 Sep 2025 09:59:04 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/8] power: supply: qcom_battmgr: Add resistance power
 supply property
To: Fenglin Wu <fenglin.wu@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Sebastian Reichel <sre@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        David Collins <david.collins@oss.qualcomm.com>,
        =?UTF-8?Q?Gy=C3=B6rgy_Kurucz?= <me@kuruczgy.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel@oss.qualcomm.com,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
References: <20250915-qcom_battmgr_update-v4-0-6f6464a41afe@oss.qualcomm.com>
 <20250915-qcom_battmgr_update-v4-3-6f6464a41afe@oss.qualcomm.com>
 <gk2ho7ugp35kb4x65meqsm3aufnry6srr4p7jspf6xyn7ywzkh@vd5ca7txjdk6>
 <0cf4b0fd-e468-4aab-9ec2-38da93435557@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <0cf4b0fd-e468-4aab-9ec2-38da93435557@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAxOSBTYWx0ZWRfXzzKygPl473DV
 B3ccSY/4fu1x/ilm80L4TNC+b9l4D4MDMWUC+Nb0txlxgEOJ1wbscQjmt+3E9lcbE0l8XOErpsd
 bG+AUX5fGbs3RlB9zzEHvWuoBXMbhBNQaCx1rlYTBdWPagUkMaSqP+2dhYLZVjGfJvv/GE/ecjy
 FRfwKjpyGvaFYli9GI4N1NcAnPGReW26HpcAV96l7j9Mj2oMgXAO1bDNMsZkkO3mrPMJdT+hUQt
 hvVeELRpjQm6jGMC0gG9Sw5kbqOJurFQkLuHW9AMdYOrPBEBCza4560REm8gaBgeeHl41TpgLd4
 xrR5L8VDzW4HEjcPtGVCm1pDlUdpKGp3Jg9MJW1R3Q2pFWMFz4qZsX8SOPxzBr+ZEngonc6zV80
 SYWIPiQh
X-Authority-Analysis: v=2.4 cv=cdTSrmDM c=1 sm=1 tr=0 ts=68c918cc cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=mNYpJT6RAAAA:8 a=BliEHdnzWw9z4Hsov9QA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22 a=eybOJ6GWDyyBfQoUqdmp:22
X-Proofpoint-ORIG-GUID: zHYyVZ_G4gYKGgF5hpi48kJZt5gN4E9P
X-Proofpoint-GUID: zHYyVZ_G4gYKGgF5hpi48kJZt5gN4E9P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 spamscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509130019

On 9/16/25 4:31 AM, Fenglin Wu wrote:
> 
> On 9/15/2025 6:18 PM, Dmitry Baryshkov wrote:
>> On Mon, Sep 15, 2025 at 04:49:55PM +0800, Fenglin Wu via B4 Relay wrote:
>>> From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
>>>
>>> Add power supply property to get battery internal resistance from
>>> the battery management firmware.
>>>
>>> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on Thinkpad T14S OLED
>> T14S is X1E80100, which uses SC8280XP-specific sets of properties. This
>> patch changes only SM8350-related data. How was it tested?
> 
> I assumed that Neil has picked the series of the changes and tested the charge control limit functionality on his T14S device.
> 
> When I run "b4 trailers -u", the tag was added on all patches. I will remove the "Tested-by" trailer for the patches with functionality not applicable for X1E80100 platform.

+ Konstantin

It's quite common to see someone leaving a T-b on the cover letter,
trying to say "I gave this series a spin" and then seeing the tag
appear on unrelated commits within the series (e.g. bindings or some
cosmetic fixes". Maybe some sort of an interactive (opt-in is fine)
dialog for "which patches to apply t-b/tags to" could be worth the
effort?

I was imagining two options:

$ b4 trailers -u --lalala
> Grabbing tags..
> Found:
> [Patch 0/n] Very Nice Changeset
>   Tested-by: Foo Bar <foo@bar.com>
>
> Which patches do you want the Tested-by tags to apply to? [all]: 2-5

or:

$ b4 trailers -u --lalala2
> Grabbing tagsd..
> Found:
> [Patch 0/n] Very Nice Changeset
>   Apply to Patch 1 ("soc: qcom: Fix all bugs")? [Y/n/a] y
>   Apply to Patch 2 ("dt-bindings: foobarbaz")? [Y/n/a] n
>   Apply to Patch 3 ("clk: qcom: Fix ABCD")? [Y/n/a] a
>   Applying to Patch 4 ("clk: qcom: Fix DEFG")
>   . . .
>   Applying to Patch n ("clk: qcom: Fix XYZ")
> Tags applied!

As I'm writing this, I'm thinking option 2 offers much more
fine-grained control, which is always nice to see..

Konrad


