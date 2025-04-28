Return-Path: <linux-usb+bounces-23534-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ABDDDA9FC6B
	for <lists+linux-usb@lfdr.de>; Mon, 28 Apr 2025 23:43:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F0C2B4678CB
	for <lists+linux-usb@lfdr.de>; Mon, 28 Apr 2025 21:43:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C72FB20E6F3;
	Mon, 28 Apr 2025 21:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LtCtNG1/"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 137DD78F32
	for <linux-usb@vger.kernel.org>; Mon, 28 Apr 2025 21:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745876609; cv=none; b=bm1RpY76vySofCh4ihOZlvS/coX7m4/la72kC7X9tpuRguNGJI4Mmh5evxtuBQNWusR/R443979dSyW5RzOPyVecyY2wj2DedaGG6jx0SqhNPx9472Wtj7CiChVJTssd1NEODhWtcKmkdjdUwDXMhNd8cgvRXWzAt2TcBg+GC9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745876609; c=relaxed/simple;
	bh=YTnMjhzE/BjUN0TK1uZwvOxxyGpbZ9aQZQnvvzTr+X0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Or3fDzsoZb5X6nFpD9wpXt4Xx8Ae2Vid8//Fjg4J+Sy0xfbJv4l91HL7vqa0fUh31ZfRta1aJYTPH7bRsykPD69XEghQ7JBwShAQspN5+k//qqpyg0t9gvJsWfG/OF9dKKYK/Gz5RRhWq2lgrviVhRZc3YQEJb0CwCO8CpCTJkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LtCtNG1/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SAD7N7026376
	for <linux-usb@vger.kernel.org>; Mon, 28 Apr 2025 21:43:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mlNHPkDq8VtO2sN9kbS8a7K+7GptveuqapgS2ZKB1jw=; b=LtCtNG1/HwSWHBdS
	4mMMkVl+BOOdBiSvGrOBFUydhM6ktS3gC36g6q0ALV84mzpJmnXWrwAbeuuU7LCI
	kZMXysl/YuY2AVKAf5wzFM4Qva3EPIr6/Lh7ey60Yrkk86mqi9lo/EaKuJo6W+E3
	b+BM4tVFCIoU1wP/Etq41dwTrcnVsZAOosefbWpWDzOCWOfI4mLCarc6l3W+qPwc
	dFIhZ23d8e1mATwots197gql9CQ6vVN+Tz1LBcmmo+8JD2VuoJDSH+MfaK7K+dqG
	9DRTtRaf8CtI6UuN8Ph2VuanXJ+m4r9cvsnqSXrO4dGQOBisIAu3XcNVTjs4CJfL
	9EocaA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468q322ebw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 28 Apr 2025 21:43:20 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-476a4a83106so6801981cf.2
        for <linux-usb@vger.kernel.org>; Mon, 28 Apr 2025 14:43:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745876599; x=1746481399;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mlNHPkDq8VtO2sN9kbS8a7K+7GptveuqapgS2ZKB1jw=;
        b=qlbojoldWDSjza/Jmhd+0a9wzl3KdWQFNafc5QFY/AhxleUDQLbgqtkGKi+e0OqAss
         62ihd4jCFdt9c+HjpbplFj3mZQnNqaSEkQTNSoayGIbaabIDQnAR72MJv9rfLDOsjyNN
         adnA4oMbbCP82xexRH7LPV2gRsAGfgPc64/ZFIsTCXknYmQ0vUA+gFUzNDfFnrtVnvf+
         FuQeSN83CSCw4P3C5nIgMFMK3IlPmCgOuHRL8fSzoeB6nHINh2pzrwG/kaeIcxQPskbs
         0XWsovsJd6/mzF6lqbu5+hN5v8Er9KTdJxG4r8XMAdNZ6r9tf29Gue7fK7UcbIZpDjCG
         AIgw==
X-Forwarded-Encrypted: i=1; AJvYcCXDX56rgik14lDhljqYXzruhtYOYQAhd9hGiSq5V2lsqsHbdW1VX7wnvBq3MZIO7Uj2E3azy2BnCr8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZwIogDiQzf+MfuL+X85l8ogigX5uJR2PWpo8JmIr6jRm7PWuR
	t+4/pApgH3cd83nJnUJhpfkbKUorWgdeesPcfY7JHzIUs3terK1QkP8rCOHewmpGWm8KjoS9TQe
	MTr6bs//23zE1NkrZTXpLW/mbIe8ZT8noNSMM+0dvpDhthAJKRMt/CQt+VXg=
X-Gm-Gg: ASbGncuOWlMBbjSlOuQoMnU/or2q9HASySLSV8cSEjCf/R6XQtJ4XZYhdWo4zCRHwTR
	Mjy/aXuF0pChXSKko8VPScdRAhjRpluw9iJDgXcRX48m6bH1OKfHF6jv0feS2v1dYHbP727i2vb
	z9M3CWTMq+JdXjuPNmBRQEwLIiRYQSrhEg1/brj68iImKHdJ11+P4JvY4NvRbrQRtUSQXPIkZ9p
	E/dVHmZ1ZPMZ4udp7t+Z8CVBG6AjEhvNeqqF5AMMf2uvFR+q+Of9ttpBG7ucBh3uTpjRqubZ5R8
	DBkHkB6waC0pQo1+4xWUzPVROauViqbeMh5kOTOh+W/0SlWbGXZCzDLlp3NAZ37hZQ==
X-Received: by 2002:ac8:5f12:0:b0:47a:e6e1:c071 with SMTP id d75a77b69052e-4801cf53297mr89377251cf.7.1745876599673;
        Mon, 28 Apr 2025 14:43:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGB14JfdvwUEuts397Yzw1zfG/EZZ6u2NY8Lwvpyqt/0PuxJTkGDBKBH4rJkTKOaxHlOXgrcQ==
X-Received: by 2002:ac8:5f12:0:b0:47a:e6e1:c071 with SMTP id d75a77b69052e-4801cf53297mr89376901cf.7.1745876599300;
        Mon, 28 Apr 2025 14:43:19 -0700 (PDT)
Received: from [192.168.65.47] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6edae042sm677449966b.169.2025.04.28.14.43.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 14:43:18 -0700 (PDT)
Message-ID: <8e152cf1-24a5-4883-8c5a-887d3c4bd888@oss.qualcomm.com>
Date: Mon, 28 Apr 2025 23:43:15 +0200
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <D9I3OWQF8T3Y.1Q5U9E2RI5YZX@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=M7xNKzws c=1 sm=1 tr=0 ts=680ff678 cx=c_pps a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=6H0WHjuAAAAA:8 a=u-BiFtGUy6h0pWOPBk4A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: Y6YEJrRaAQcsT-x2dGWnFhHaMvqLYKCk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDE3NCBTYWx0ZWRfXxECr1+CpMMAC FxIZC+D8PKhU0sR0h8L07DryWdwMsPo3YB+P/ixvAJ7FAfbp+Fxd9NFb6Q+I23spUpIey9MzUs8 j4h4PhvfSjJY6NxOIi4gmikzShKMs6k5L0zHLYfWRGSTNrtQG34xTWxBcM+bD789VqSYdq3+TuS
 A5pKcLHGMpsMsK4a/CqNtRoak6qsBMkGEBdenF2D3Z+yLnh0hfxxi0wyc0hO/2Uci9wmB+wivJ5 gnoQRSBAr0oxz2EpPzBHyEicQSIiOXiIIsiHaNxjt4Kz7k8/T0NBIXbguMdDCNYUDjU+dblP0P1 eMxYydgwm1pGp6HYhVGDn3whkkgVFWsiLejdp7/QRceXv2B6CYMGNbDP1ZT/wCA4YHjOJL7f0a0
 uonatE4NHjgjnqW/nbJuCSRuHcHTO564SqUh7oLhbPaS1njxfwzgpgnn68Rlf29EehMj3m1c
X-Proofpoint-ORIG-GUID: Y6YEJrRaAQcsT-x2dGWnFhHaMvqLYKCk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_08,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 clxscore=1015 mlxlogscore=922 spamscore=0 phishscore=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504280174

On 4/28/25 9:41 AM, Luca Weiss wrote:
> On Fri Apr 25, 2025 at 11:06 PM CEST, Konrad Dybcio wrote:
>> On 4/25/25 12:44 PM, Luca Weiss wrote:
>>> Enable USB audio offloading which allows to play audio via a USB-C
>>> headset with lower power consumption and enabling some other features.
>>>
>>> This can be used like the following:
>>>
>>>   $ amixer -c0 cset name='USB_RX Audio Mixer MultiMedia1' On
>>>   $ aplay --device=plughw:0,0 test.wav
>>>
>>> Compared to regular playback to the USB sound card no interrupts should
>>> appear on the xhci-hcd interrupts during playback, instead the ADSP will
>>> be handling the playback.
>>
>> "should" isn't very optimistic - I assume this works for you? > 
> 
> Yes it does!
> 
> With 'should' I meant to describe the expected behavior from using this
> since most people are probably not familiar with how this works.
> 
>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>> ---

[...]

>>>  &usb_1_dwc3 {
>>>  	maximum-speed = "super-speed";
>>>  	dr_mode = "otg";
>>> +	num-hc-interrupters = /bits/ 16 <3>;
>> Where does this number come from?
> 
> I'm honestly not 100% sure. As far as I understand it, with
> 'qcom,usb-audio-intr-idx = /bits/ 16 <2>;' in the qcom,q6usb node (which
> I've checked against downstream) we declare which "XHCI interrupter
> number to use". Without the num-hc-interrupters property we get an error
> that not enough interrupters are available (I assume only 1 is then), so
> this value practically needs to be higher than the <2> from earlier.
> 
> Why it's this value and not a higher value e.g. 4 I'm not really sure.
> Downstream code looks somewhat different and "max_interrupters" in
> drivers/usb/ doesn't come from a dt property. I'd need to check more in
> details what this code does - or maybe Wesley can help.

I got word that it's simply hw specific - please move it over to the
soc dt with the value of 3

Konrad

