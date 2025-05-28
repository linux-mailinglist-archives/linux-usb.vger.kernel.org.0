Return-Path: <linux-usb+bounces-24369-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B7DA3AC6E9A
	for <lists+linux-usb@lfdr.de>; Wed, 28 May 2025 18:59:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5756E1C003D2
	for <lists+linux-usb@lfdr.de>; Wed, 28 May 2025 16:59:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7650328DF2B;
	Wed, 28 May 2025 16:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i9A7msKs"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6900628DF18
	for <linux-usb@vger.kernel.org>; Wed, 28 May 2025 16:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748451561; cv=none; b=pE3HWQRepZFJ/eY0CAW2FV7igPVeOZwNhPiitVS0QQ2GUff2pzqWWBRW8scRHd5TlKzKlh4S+q1f0H2ywcKfQ8uET1tapNp5w5rdLe3u+s/ePvRoldpIJbFrmqCRvb3vj0tQsQH00cLwptnApISJ5gkWYKbqUBbrsWL4FckcBI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748451561; c=relaxed/simple;
	bh=bbz83AfdKHYzzOPGEeednRwLoLYcbCnR8BtMwWBiaqQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uPzib41+mar8cg16bwkfg7I7qlkQ6cbCtBK7W+Mqo/3NB/Ui+y1vsL+cO+U3RyZPQUBUpLMhwKWMtWi7C2jiIF2a3jzvto3Rzhkwq7381LUW6rUmNxp9hRmqBd7vSoBWK933m6WEtXbbo89xB+qAAhTHCohwpWxFWQosbqmpFto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i9A7msKs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54S9hl56009833
	for <linux-usb@vger.kernel.org>; Wed, 28 May 2025 16:59:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OZ/GIA0WSr9eJOkPJDxd+ZEymhaMmc/jbzotcFP/Tp0=; b=i9A7msKs9T4m7sQ7
	9TD0U0CZGjMVxxWKsjjZmpIQsmp7adNbwlUWZXuzAZKzX5KDDt1EoS4kEuZhEYr/
	IiAeunODH+51QL6PYly/6Y1PXn5EtynYXcqJWvcXzgfPa3TVHq8eFVNcltF/FXdO
	TpitkVRaBXjkrp8FcuuaQDqCYGOmHvdNBX33NKDPpctYR5KWk64UG/6Njg1fmw2Y
	0KzcgDVF2XdtNG4pLKnpDb7TSUfM6QFM1Pr+lpV4iyRepkMNFoVvgIyVImeWqCZL
	rW+Jkzhwvdif3WtjI3WJnY9WIwAlVRtKvESEtEz66/fHq6y5wkL4NPDdc2FHSpak
	am3X3Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46x03ms53v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 28 May 2025 16:59:18 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-476783cbdb8so8353301cf.1
        for <linux-usb@vger.kernel.org>; Wed, 28 May 2025 09:59:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748451557; x=1749056357;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OZ/GIA0WSr9eJOkPJDxd+ZEymhaMmc/jbzotcFP/Tp0=;
        b=FP4eTxmlzlQ5ybqGyKkaJA4VcahCDRQMUMjdAhX2zFeJpCkbOZ5/wEJkK/G/Ah9ppZ
         JiMJlY181oQeB4wrLHLzYnVYvSfLe1u0sUHfBIKJRmWl0N2qvspc+gJrK3wTleKdH5Bc
         4Az/LaGyE3dEcxSHDAth0579DtZQYBzPFNq6833PreABRsQgQPWhe+fwkxVsYz1br+c6
         sZqrLaqmUTGPzDmFYRWFJQZwgW9r8gy5iMqLtsbiZRAtTMQwnvkw5+DSQepXj5NRsKAZ
         ZMPV4UizHnYSKs/WbBuD7kMatd/1q2VCPIZ/3AGVu7gVx9QbWDdDR/yFSSg22O/BG91u
         wwrg==
X-Forwarded-Encrypted: i=1; AJvYcCUtrY1F6GRxJToQ9u6XinXUgkexCKeELAc0Lfihl3gHHY16S2L8wS7QxEZ2PxRxy0tL7vNr7oVSJQg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxujUY+V4EF3LsgJyia47P/Zm24VDS+njpDfVluN3UrcRTdqi6F
	xpvA3U/kxwDM4jfp2vfEYxLt1fgyw2mSDqDPwCDUXE2CzHYHEhsVB8Tu5IUrlDX4dFAT3GKILS4
	q3ZFnv/lw7zpTf5YfYuGiE/LLPGz0tf+33wftArAo4y2eBGvdicX+qzgjDiifyCU=
X-Gm-Gg: ASbGncv2f+KvrmGEjQ2fVFx7/wY4pIXelZYSVhzfTunonO5My0+aj8Qznl1smbQzNhC
	X5ShRmE+tE2Y2/pfQ5ZjObgrhnNNSNzgdpvPxOzq146hrGek5r0nDp2ElUs59uvDb2Y6+sz6Vdy
	LUlE8MR1gNEbC7h5xgL4k+Zx5DBcfJo5zLuziu0dDcS/2CG4TkR9nGp6u5p5i6hloUUw/Gk/T2y
	LV8Ch8e2Zv++7k6JUs6KVQQl6/a1gKB22Ih7Y44ACDj1jeOGxffs3+OSbewWIgxT0RfAwhHZM0K
	HAKVt7fb9KkArQS1XFvLizm/a7T11be4KT4UidcpqqA35ZVLaSe/V59DuNYVkjJctw==
X-Received: by 2002:a05:620a:40cd:b0:7c7:5384:fa53 with SMTP id af79cd13be357-7ceecbf4af7mr968130185a.6.1748451557379;
        Wed, 28 May 2025 09:59:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHAL+YqMQeWpvXAQsu9NOtyQO1XUv8gfuWwheXdpWcfFgbiPN1ZK8NrIvSTpLX2pyw7cfpnQw==
X-Received: by 2002:a05:620a:40cd:b0:7c7:5384:fa53 with SMTP id af79cd13be357-7ceecbf4af7mr968128385a.6.1748451556936;
        Wed, 28 May 2025 09:59:16 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad8a1b29351sm136692966b.98.2025.05.28.09.59.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 May 2025 09:59:16 -0700 (PDT)
Message-ID: <a669eb4a-8e4d-4bdf-8bf0-7699d9a99e63@oss.qualcomm.com>
Date: Wed, 28 May 2025 18:59:12 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/5] arm64: dts: qcom: Add Lenovo ThinkBook 16 G7 QOY
 device tree
To: Rob Clark <robdclark@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        jens.glathe@oldschoolsolutions.biz,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>,
        linux-usb@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20250524-tb16-dt-v4-0-2c1e6018d3f0@oldschoolsolutions.biz>
 <20250524-tb16-dt-v4-5-2c1e6018d3f0@oldschoolsolutions.biz>
 <g7vlyqma6ow6tdsaqt2rfwvblxqwbqlwmoueio7i4vqvjy76kw@5bz4g33pq4t7>
 <CAMcHhXoYkQru_0n5siMGGkTcHu8yWRZWfT4ByiD8D0ieZHF+wQ@mail.gmail.com>
 <vwoixgdyjjzcjlv4muwrzv7wztnqyidtj7ghacgkjg6hgkkyl7@ji53bhiltaef>
 <CAMcHhXqDFuo+x99KOK0pQFj-FyTdQoZS_JvehNE2AC_JSoQ2gQ@mail.gmail.com>
 <rvyfkow43atquc64p6slck6lpfsot67v47ngvfnuhxqo222h6k@kdvbsmf3fwsr>
 <CAF6AEGvr_foMVwaE_VSVWLT50cbGi8i3UGwo2e=rORD-1JmTmA@mail.gmail.com>
 <152f5150-30b0-400c-9816-13e4710a4156@oss.qualcomm.com>
 <kbmqr7gjkd72hgorbhbwb7ttvmecfbb6pg72st7zwt5ogxju6p@itycxk6vriy5>
 <CAF6AEGsTtEA=So1CDhvg8H5+Z-RJ9OnhgSzDoa+zkWSPO3cvnA@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAF6AEGsTtEA=So1CDhvg8H5+Z-RJ9OnhgSzDoa+zkWSPO3cvnA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: f1UnUs08cAlSN-8KtjdSXBM4ghnKDxDA
X-Authority-Analysis: v=2.4 cv=FuAF/3rq c=1 sm=1 tr=0 ts=683740e6 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=fSamKcmLYGn2YG_ZD4IA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: f1UnUs08cAlSN-8KtjdSXBM4ghnKDxDA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDE0NyBTYWx0ZWRfXyo+RjM+kcMGS
 xHA+bgsSCj7fDQFwB+7EzeJSx6iJqzpDW4ri1+zXY/xOYGyk2pk18XXdMznA3FVkclYFP6IyIXE
 qZOBkMBRqZ2wKvaS5dBH3+qrD5PHO3aF66Z2a0T/YyBvbLvV+oM7ruDLzRzU7wDQbpNr71gETIM
 huy7trpuR9dwZNFJYMWcIyxbG4ukXZj4gOhjlFngqf0C3xgKDSCI0lquOp4JCZjO+WJfiyN00Hw
 MBBtJejY9ikhizra2PrbrQFHDUa5k3U/AEGi2V9zOdQsQlSpw0flJ7DRT5GQLgCSdnN0W9QbE/H
 0Ssfhd78LYIWpAk6xeOgTokWul5TtV6dDKodhlb4AQiuUYOaT2/urjWxJPNZlC92XzwtHQoZeP6
 ZQZ2rmVEPq5Ds9x0xg0fC86QQ3BALFvSZrWCInJ3m2MdMf1OqSBZfPmgO50KkEhg7JYAO/Fy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_08,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 mlxlogscore=968 mlxscore=0 impostorscore=0
 bulkscore=0 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505280147

On 5/28/25 6:50 PM, Rob Clark wrote:
> On Tue, May 27, 2025 at 11:18 AM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
>>
>> On Tue, May 27, 2025 at 12:55:06PM +0200, Konrad Dybcio wrote:
>>> On 5/26/25 5:28 PM, Rob Clark wrote:
>>>> On Mon, May 26, 2025 at 1:36 AM Dmitry Baryshkov
>>>> <dmitry.baryshkov@oss.qualcomm.com> wrote:
>>>>>
>>>>> On Sun, May 25, 2025 at 09:43:36PM +0200, Aleksandrs Vinarskis wrote:
>>>>>> On Sun, 25 May 2025 at 15:33, Dmitry Baryshkov
>>>>>> <dmitry.baryshkov@oss.qualcomm.com> wrote:
>>>>>>>
>>>
>>> [...]
>>>
>>>>> Yes, please. Don't set okay status for the GPU until it gets enabled.
>>>>
>>>> Drive-by: Shouldn't the dtb describe the hw and not the state of the
>>>> linux kernel's support for the hw?  Ie. if bad things happen if we
>>>> describe hw which is missing driver support, shouldn't we fix that in
>>>> the driver.
>>>>
>>>> (In the case of the GPU there is the slight wrinkle that we don't have
>>>> a gpu-id yet so there is no compatible in the dtb yet.)
>>>
>>> My two cents are that it's okay to enable it, at least in this case..
>>
>> That would most likely make display unavailable as DPU driver uses GPU
>> as one of the components.
> 
> Hmm, perhaps we should allow the gpu to probe, but just fail to create
> priv->gpu, similarly to how we handle missing firmware?

Yes, let's stop killing the entire combo-stack in all scenarios..

Konrad

