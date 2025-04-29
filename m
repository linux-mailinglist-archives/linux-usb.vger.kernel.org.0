Return-Path: <linux-usb+bounces-23548-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E1AC0AA066D
	for <lists+linux-usb@lfdr.de>; Tue, 29 Apr 2025 11:00:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D655A3B5AA3
	for <lists+linux-usb@lfdr.de>; Tue, 29 Apr 2025 09:00:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F81A29290D;
	Tue, 29 Apr 2025 09:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JHycyrzi"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24CCD29DB85
	for <linux-usb@vger.kernel.org>; Tue, 29 Apr 2025 09:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745917217; cv=none; b=Rr2+NEIppjo8tD4bdskoPo48qKcZo9feDTcZuHytKNkYSQX3UiJOJQNVUiKpAgVxHJgCXc/0+7PRydTMW9lp5Ln8+qjLETlZFuZxTB7WyguOHP3sT2PeLJLKIKVwVM8SxNZxaOn4YFXJxZkN7aJDb4cUo37we4SZA70Hokg+0Y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745917217; c=relaxed/simple;
	bh=mYwV9qaC5quGigoNDzErPL97AxB0Z1lobQFByQD2FZw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KwXTdqiiqy16fuoF/kvu1MM0nFmd0cQjn0gOumIQkejy0Hl9OqWdImmMzipw3vi4rAGtr3fSrKBcFip5RFV2rVKUBlX5GcUWkIp/JvSlZSFCzlZevlz38GoD3cjDlLGGblC5XVZoKFhxr5ghbJgQnpQXZYjqMGswpK7FhOg408g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JHycyrzi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SNq9qA015314
	for <linux-usb@vger.kernel.org>; Tue, 29 Apr 2025 09:00:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zqDGdfO9/jWDyry3sjZsFjxW+nnt4/iR1gA9efn55k8=; b=JHycyrzi4i3ApBuc
	31HQXK2oDNvxJ4SHzcea+VSjsiKuOh6XnUnuVU0NSB9G7G4PWnaoow/X8X+/v8JI
	a+e3N4z51LMQvSD0wBJVsjEJb0ZNuxMFXe2nB+h6KmEX+vZs35oktuv+JFGd+wzO
	RXbTekqBjlinpqhKMpCIG3MjhVtpILlI9lLl0ho/lOLvVaIFhkgF67WGtl2gPcji
	VfDwmXVWoHIM6FuFNKcsY5lmWxXrEDHeP9lQ0wczsa0+xXpnqT9fbzQF/INJgV3T
	Rr7RSKrd8lezM+BIxvGnAXZ2td3lEbBXHzwdpelMJahwDv/V5G9tia/T7jbSGw/j
	17iOSw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468r8htut1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 29 Apr 2025 09:00:15 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-47ae537a9d6so8029241cf.3
        for <linux-usb@vger.kernel.org>; Tue, 29 Apr 2025 02:00:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745917214; x=1746522014;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zqDGdfO9/jWDyry3sjZsFjxW+nnt4/iR1gA9efn55k8=;
        b=wdQSVGMamW+2Sicu/SqhdlYEMlRJTGefcX1hDTFNtQj9L52w3M0V9VefjJCU1s29n2
         saavZvf+FYtuwzfajVmTPJWKrN+LH9CjP0kfWZkUBtKCyNbaMedC5qbrbq/yVBHYZYq/
         zD5fZkSH0WWie7ktZVHfpnZq0B86jwk9iBVFXwHu50hQ0ta3GbA3epzpblkg7q6pLCr7
         9IXpPkMd0H7krzgj5F0aZ6izvPKxoN/HmW/hcybiGS5hzXvUsEZv1YMEkk2bdZHFTmOr
         enml4Z4Mnp4LV0Y5o3PHP+RO5hSoIQloBnGrw51L7lb4n5qcHmp1hdp8+xaryyCXIWhN
         rT7A==
X-Forwarded-Encrypted: i=1; AJvYcCXI7I/r9XnidY57Girt3NjHZpDsmNvHkeCd04SlBRT2oYzjjAtGXAczyEebtFhLG5hs0boZCIvDC4M=@vger.kernel.org
X-Gm-Message-State: AOJu0YypWuz1h4WDUZHwNeKxt5IYkgcQBpb80yHSTsDjfNStmED1AeXk
	Wn27c5TaN+23eQEaEziaD4FSC8Y2MaFYFgtXh/HUy0auZyXWKXcKq3d4M4Mb20uzZcSiLVwOo+y
	nZr65jTWsNWLBLo5pxvFKPHu81Glz2RILtZtCZokEOiR7T1PE3kXVnqbCE94=
X-Gm-Gg: ASbGncttBCSJxWm/A7iPUf/0kNKwj3/W294QLwziJCg7zBoi2RJi2n3vJpl0FGKeSo0
	pfBp7vBkIunecUEh9QMBlG7tBD2Fx1VLnneCOtSWfPADzFv7RErhd62dN+ElhVl4XdUPBAigi0F
	hK8okQCPh+ynC8j5/inIgS8ZjiAUJ6Kuf+RY4pXdixxJSdhOI1iIhxSFSBb4nPcqV3ZtKRBxi/Y
	2O/cbrxKtfA+qDXy5E8f9Ob5wSZ76O1uiZ6l5+5F77unCkv20HYLltWG2FruKR9i8Hc2Bw/1yc/
	YJO3R35kJuzHUueG6B3cIlzPpxbWUDbaSrorSnWGnv0unddeBlY5vVwXgv8rqEk75A==
X-Received: by 2002:ac8:584c:0:b0:472:7a2:c3ca with SMTP id d75a77b69052e-488665065b3mr13381371cf.7.1745917213866;
        Tue, 29 Apr 2025 02:00:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHoe3LY+sQejWrjRsXICpmmof+c3/tmw3k1mD2dd7DkiBAR+7Wx53r3CiWHkEswrPutog4ATQ==
X-Received: by 2002:ac8:584c:0:b0:472:7a2:c3ca with SMTP id d75a77b69052e-488665065b3mr13380991cf.7.1745917213331;
        Tue, 29 Apr 2025 02:00:13 -0700 (PDT)
Received: from [192.168.65.43] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e4fb5ecsm747910666b.71.2025.04.29.02.00.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 02:00:12 -0700 (PDT)
Message-ID: <a1b7d6f9-13bc-49ed-bc4c-40f4c2fae8e2@oss.qualcomm.com>
Date: Tue, 29 Apr 2025 11:00:09 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] arm64: dts: qcom: sm7225-fairphone-fp4: Enable USB
 audio offload support
To: Luca Weiss <luca.weiss@fairphone.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org
References: <20250425-fp4-usb-audio-offload-v1-0-f90f571636e4@fairphone.com>
 <20250425-fp4-usb-audio-offload-v1-6-f90f571636e4@fairphone.com>
 <5c4ed073-45fe-4938-b25b-8979d96b456d@oss.qualcomm.com>
 <D9I3OWQF8T3Y.1Q5U9E2RI5YZX@fairphone.com>
 <8e152cf1-24a5-4883-8c5a-887d3c4bd888@oss.qualcomm.com>
 <D9IZWD6MS7A4.3FJ3UI3CG92OM@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <D9IZWD6MS7A4.3FJ3UI3CG92OM@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 8Pm3h4gZ--1eswcGs2cdYJuGQ6aSuAqN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDA2NiBTYWx0ZWRfX3Ak5OoPt2HYj iLcPo5DIeDkY+PlD46s048H03+XzAuGMM2I7Gm8rwpKvEXVyY0HfElInMDgGuMS2wsvY3v2ftjm KYgyoC7aCY4ks84gJzUiHE1LvQrEwl50PX78fuZfS3yoVOcyC3fHCFO0fKGa7vM630+BDX9KW2I
 b9kzDSORYyg0YIrzhtd0pwOeJLMETqBxEPOhCYCDX0DXKq0cfJzdSfAFFyjeOffmrmGcdaOI581 yZel0clQP7obwSZznvEbyQOkmIWZ+SbwnA3tsKv73ClZJJ+2Hj33rwh6l9SDjuc+p/PejIDQYo9 8IZF/iHzQeVicw9pZp5qzFqcKA1ig1xP5GZgy+rFN7kKSDEFgkiesmjqI51TP8FNgD/tLS6gaPm
 GNKHYK3egEyvZRKQzb5bwY+ucJCHTdOlbt2gJxpveUs0gizBdDtmFSfHUokvQZu32HaSOrxM
X-Authority-Analysis: v=2.4 cv=cfzSrmDM c=1 sm=1 tr=0 ts=6810951f cx=c_pps a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=6H0WHjuAAAAA:8 a=Iso9NqdAnq4PZ9IQp5IA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: 8Pm3h4gZ--1eswcGs2cdYJuGQ6aSuAqN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_03,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=971 adultscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290066

On 4/29/25 10:55 AM, Luca Weiss wrote:
> On Mon Apr 28, 2025 at 11:43 PM CEST, Konrad Dybcio wrote:
>> On 4/28/25 9:41 AM, Luca Weiss wrote:
>>> On Fri Apr 25, 2025 at 11:06 PM CEST, Konrad Dybcio wrote:
>>>> On 4/25/25 12:44 PM, Luca Weiss wrote:
>>>>> Enable USB audio offloading which allows to play audio via a USB-C
>>>>> headset with lower power consumption and enabling some other features.
>>>>>
>>>>> This can be used like the following:
>>>>>
>>>>>   $ amixer -c0 cset name='USB_RX Audio Mixer MultiMedia1' On
>>>>>   $ aplay --device=plughw:0,0 test.wav
>>>>>
>>>>> Compared to regular playback to the USB sound card no interrupts should
>>>>> appear on the xhci-hcd interrupts during playback, instead the ADSP will
>>>>> be handling the playback.
>>>>
>>>> "should" isn't very optimistic - I assume this works for you? > 
>>>
>>> Yes it does!
>>>
>>> With 'should' I meant to describe the expected behavior from using this
>>> since most people are probably not familiar with how this works.
>>>
>>>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>>>> ---
>>
>> [...]
>>
>>>>>  &usb_1_dwc3 {
>>>>>  	maximum-speed = "super-speed";
>>>>>  	dr_mode = "otg";
>>>>> +	num-hc-interrupters = /bits/ 16 <3>;
>>>> Where does this number come from?
>>>
>>> I'm honestly not 100% sure. As far as I understand it, with
>>> 'qcom,usb-audio-intr-idx = /bits/ 16 <2>;' in the qcom,q6usb node (which
>>> I've checked against downstream) we declare which "XHCI interrupter
>>> number to use". Without the num-hc-interrupters property we get an error
>>> that not enough interrupters are available (I assume only 1 is then), so
>>> this value practically needs to be higher than the <2> from earlier.
>>>
>>> Why it's this value and not a higher value e.g. 4 I'm not really sure.
>>> Downstream code looks somewhat different and "max_interrupters" in
>>> drivers/usb/ doesn't come from a dt property. I'd need to check more in
>>> details what this code does - or maybe Wesley can help.
>>
>> I got word that it's simply hw specific - please move it over to the
>> soc dt with the value of 3
> 
> Will do, thanks for checking!
> 
> Would you have a reference how to get the correct value for it based on
> downstream or the running kernel on the hw?

3 should be reasonable for most platforms, but I don't think there's
a clear value defined downstream

Konrad

