Return-Path: <linux-usb+bounces-25819-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D9EFB05030
	for <lists+linux-usb@lfdr.de>; Tue, 15 Jul 2025 06:18:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9A20B3B289D
	for <lists+linux-usb@lfdr.de>; Tue, 15 Jul 2025 04:18:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F23EC25A2C0;
	Tue, 15 Jul 2025 04:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p1DPvF40"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6C56255F24
	for <linux-usb@vger.kernel.org>; Tue, 15 Jul 2025 04:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752553102; cv=none; b=fPsnnyOoHIIHtomFZka+rGT4xHmIHvBjfP26kvf8fgG6XmcbFDYAXnyP7b2iUmLBBkzUY4dR591G4vm4CCwUFM/dbNrOSb16YckgbrtVUorQzp8JYzNrJvWJd3SRIjDGQy+UaSELjKYZXKueg0H04Gqelj7bdyGHCWJtZX4VIbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752553102; c=relaxed/simple;
	bh=dFKWHIQddjxHUPkRV2M3jjcwPHCaNzGHYMUWZuz27pA=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=fn5KcgtofuKubObGGXs7qbWw6BVQ/fuZKu+kOlcGifivIOcp3eSu+ZhqKCIu5ox6KN6bFF2xEt8UKSnjXffq3EBHkwHRRwOKiLBb7UbPAcoBWpQEZct1FdbFKHazjGDfxliZQesrCrWWpP4/bv4Z5RkdKpNsQHsLGMEZJS9bjhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p1DPvF40; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56EGRLSn026564
	for <linux-usb@vger.kernel.org>; Tue, 15 Jul 2025 04:18:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uzm3o8XukJIfDxG+gIGMGpjKkmpbr4jLR61YoqCEI4M=; b=p1DPvF40/MI+Vnm4
	PfsCtjTRYXnwPO1N1Krud9tSW6geE5N2pGlrnKKxq+Ie6oY5Y1+gsLz5HCKoya+L
	jRbkj+WVEgFNU7QPPBxEfvIwKT6vCXNKv8WE30Om8CmV7pTL3dwAXmAm8Ght0EiX
	Tnb4kNytKs+hATELaSSnVDBTbcky7LITH+ptZ1QtPdPtGWflbOAgbFqUGSAZ3+fE
	PGGAWZX0G4cyq1wblm1aVXWN2HpAoItAZRoRv5zZ+T8rA81gv3eqge9Ew7ChwVYo
	Kq456fnOa5wVAd1hsSFD73c49gC2l0g37ZummJivcJ879Z1j3UMhnDBxAFwGma4m
	+5urAQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5drhh85-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 15 Jul 2025 04:18:19 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-234fedd3e51so48633245ad.1
        for <linux-usb@vger.kernel.org>; Mon, 14 Jul 2025 21:18:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752553099; x=1753157899;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uzm3o8XukJIfDxG+gIGMGpjKkmpbr4jLR61YoqCEI4M=;
        b=uu/54FT/PSsAQGObUKgbPdnrUBgGrPnA3JAksx/oCZHDKbM0Vl3jtjiiqN7+bHT0uV
         wn+jhjrCtBUUKuxAI6gX4BdfEiOj3WfJpwBNS+mPYkxNKG01qD/9Q7pzcvTIhQeVEzxM
         rYjl7VKMdWhYmLmIzcyfKNYcgt4s5oYiCPokJKE8VfwxPQuXecnNVxrdMMFCGNrq9omG
         CU+AncgbnW2QK0v//NHtfSeXQOzPsWS9qekUOeDq0NCoZBacv7xcaX4ZxfpkctXuMQmT
         8NqnWx5ocB5r7/UbA9+uQGRNSorax4d7rBxHU5wG8q+GeEfu13NLImVD7hK7EaBSPwLy
         gFYg==
X-Forwarded-Encrypted: i=1; AJvYcCUt4WhxW7lGCLaCRkyhYCzCgQnn5VeC8ZttzYQsIdgQKygFc3Ne1FLIooZ3pIO3dIDirEue7sQxZN0=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywj/TmEbwUEOqMiH0BFF3cjpa4uxRD+Nhh5lK2uyYSOmttMsNr+
	6IeNQ6izwJ4h/DDfzd9D6WnceFYSGMLDC9MFPH/3pa9K+AH+iO5Hh3Wr24JhbmCs0bxigxgFRJh
	8VQg0ChCPZGX2/bqtWEa4Q+r09q1zdpbj0UsDRQMUcBkrW6+a+ajm2emrr0LQ8Js=
X-Gm-Gg: ASbGncttW/ApK0aSCcP9svTBJz/eWtPhWC05vTbOCL6HHIaVNQ3/gu8XCu0qj7DBF0B
	rqFnPTeueqQRB6G/GZJROAmA9mj8hfmW5f8kJdxhcdmGgNa8XZ0msvvXBDN1rblgYZtuqpS6lCp
	NZkJLq5mhI0goTy1CFWmd8cisP5XgWuqaUYBrA0kv9H1N8Lyh3aaAzvvhew7pYGDi0dW4XA2Fav
	KZa4E9u2hz2lhRXAUzbt6nLzGzuVEDqeVyOY5oAi17ACdOQFJcfWDedyhgT6KlVY2rcfEKGNMLZ
	p7GBic6+XCJp2/RKcJ4yJ0Rtwauf2XcQelNdggm43rUtFOyEcvqGlhV/lYj0CaJoZnse
X-Received: by 2002:a17:903:2381:b0:235:1171:6d1d with SMTP id d9443c01a7336-23dede2efd2mr201885485ad.9.1752553099060;
        Mon, 14 Jul 2025 21:18:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHlSR1JCrm29sPlBvrgSPyyxQnSbvHwk6Kiv95T3q3tvlO3uU7qin2TLupU+hhFPMssDqsfqg==
X-Received: by 2002:a17:903:2381:b0:235:1171:6d1d with SMTP id d9443c01a7336-23dede2efd2mr201885145ad.9.1752553098603;
        Mon, 14 Jul 2025 21:18:18 -0700 (PDT)
Received: from [192.168.1.36] ([116.68.96.149])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de4359b6fsm99909735ad.212.2025.07.14.21.18.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jul 2025 21:18:17 -0700 (PDT)
Message-ID: <0d1e5ac2-9bf1-4fe5-b832-2e438e51d7db@oss.qualcomm.com>
Date: Tue, 15 Jul 2025 09:48:13 +0530
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] usb: dwc3: qcom: Remove extcon functionality from glue
From: Prashanth K <prashanth.k@oss.qualcomm.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250714044703.2091075-1-krishna.kurapati@oss.qualcomm.com>
 <b3767f6b-9793-47bc-9b09-70fc931ce8f3@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <b3767f6b-9793-47bc-9b09-70fc931ce8f3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: jpm9NvfRoOZeFqvAsVFTWlwkOMho3bhl
X-Authority-Analysis: v=2.4 cv=D4xHKuRj c=1 sm=1 tr=0 ts=6875d68c cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=eHFrewLOQS0FNmfAC0rGFw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=427AQKXnQCN1OQ7kLHEA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: jpm9NvfRoOZeFqvAsVFTWlwkOMho3bhl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDAzNiBTYWx0ZWRfX+AeFFR51r5tl
 s0Tv2XGhBuVBU0cz136Omcva/ZGeP0vZgv6OMmPHyEGWrQPybzvjA/8fz3v0byfuY1pjZVhCNH7
 8/JriV6n/gpHyJkXSh8E6ej76ynBqzIECoHSNbE+eTuwQrvsTr6YEYohpryS6GHr28i4z3aG0jw
 skRQHWCuEAsDbsNvkMv6elJk+/AU2gIDj/HAJhn4hLbiRBoVHg7vP48npSFGZk/pOHOI8ta4JUg
 v0pQEb/qnO5/a+/NBsGbJwDvySw9v+EEwLqOuC37hTzYByepikzI5QCOOKZe2vSL4Ey6bt/6mL6
 +DYsh1RSR/xVlGhhvmhjet7TpkIv5aLDazGYDh1F9hUg7V6mD5UUJAAyhL0WWfX5r2gFk1/3xVy
 7iKYaFPEBrEcQOkVwZKs9s/rQlqjbjcIYm0JY4Qo84YKLgSQkvtmWfBryT22Se50N/onRTzF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_03,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=779 impostorscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 suspectscore=0 bulkscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507150036



On 7/14/2025 8:59 PM, Prashanth K wrote:
> 
> 
> On 7/14/2025 10:17 AM, Krishna Kurapati wrote:
>> Deprecate usage of extcon functionality from the glue driver. Now
>> that the glue driver is a flattened implementation, all existing
>> DTs would eventually move to new bindings. While doing so let them
>> make use of role-switch/ typec frameworks to provide role data
>> rather than using extcon.
>>
>> On upstream, summary of targets/platforms using extcon is as follows:
>>
>> 1. MSM8916 and MSM8939 use Chipidea controller, hence the changes have no
>> effect on them.
>>
>> 2. Of the other extcon users, most of them use "linux,extcon-usb-gpio"
>> driver which relies on id/vbus gpios to inform role changes. This can be
>> transitioned to role switch based driver (usb-conn-gpio) while flattening
>> those platforms to move away from extcon and rely on role
>> switching.
>>
>> 3. The one target that uses dwc3 controller and extcon and is not based
>> on reading gpios is "arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi".
>> This platform uses TI chip to provide extcon. If usb on this platform is
>> being flattneed, then effort should be put in to define a usb-c-connector
>> device in DT and make use of role switch functionality in TUSB320L driver.
>>
>> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>> ---
>> Changes in v3:
>> This change was 4rth patch in [1]. It was suggested to make this as the
>> first patch of the series. Since this is independent of role switch
>> patches, sending this out separately. Removed RB Tag of Dmitry since the
>> patch has been changed.
>>
>> [1]: https://lore.kernel.org/all/20250610091357.2983085-1-krishna.kurapati@oss.qualcomm.com/
>>
[...]
> 
> Shouldn't we cleanup the Kconfig also? Anyways it's not critical, so it
> can be handled in a follow-up patch if preferred.
> 
> config USB_DWC3_QCOM
> 		tristate "Qualcomm Platform"
> 		depends on ARCH_QCOM || COMPILE_TEST
> -		depends on EXTCON || !EXTCON
> 		depends on OF
> 

Ignore the above comment, both dwc3-qcom and dwc3-qcom-legacy uses same
config. Sorry for the spam!

