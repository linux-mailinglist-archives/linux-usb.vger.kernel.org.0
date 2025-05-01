Return-Path: <linux-usb+bounces-23601-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 97AEAAA5C12
	for <lists+linux-usb@lfdr.de>; Thu,  1 May 2025 10:23:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 54BAB9C107A
	for <lists+linux-usb@lfdr.de>; Thu,  1 May 2025 08:23:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C93FE210F44;
	Thu,  1 May 2025 08:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cuEqgNET"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB2551E8855
	for <linux-usb@vger.kernel.org>; Thu,  1 May 2025 08:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746087828; cv=none; b=LwCdkbtRDaDE3Fn7/t1aPlcEaP5JHE0SfGBdJbH7MnSde4uSxmq+hML4OoasCkS87DttVD2wekQwgzPv/cj4Y3ksmC3cBe7gEvZTUu9VXAVEAtFJnzqvwJQSQsJgLqk9QnZqUCrloCOrjNuXlVK6gFL0bD3avLOhMDkSGYmeF4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746087828; c=relaxed/simple;
	bh=i5qIUYMGnYjh3O5bD+pGUYppyjmm+gTXmK92O4h2v8c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DlHjxZnTM9be695DaxjmDTlucuXAwcZ7YD7Yjwnns4f14FUNHya9GfSSXXw9fbu0qwP4PPGc7eFHLWPSj9FuTFKQKvIhTOvDfJzDYkUY4b3jac1UKtiFVShzT4YlzG+qfgJl8rDYsaHlABGa2m8OwDP305WhI4iVctybcRbARP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cuEqgNET; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53UHMUTn032385
	for <linux-usb@vger.kernel.org>; Thu, 1 May 2025 08:23:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	INmzJq98TweHQnpIdriujVmaMT2JtRhMol4dfGshJGU=; b=cuEqgNETSLOwnF+d
	ZFgIEOtfAFYyS4pTUChbA4F39BV2Gm/ODAl0V1wTqhUO8BQTnfzQn+9v8rqdC7Oz
	m6ht/j0Zj3/k9B1CDDciVcxTl8lVl0444rYLdRuRmrDyEglgVqjwJqut/36mtZE7
	V5SvB6sPwD07anEYlLdcDXPlFovNxs1w7gJrTtfDxRHXvQF7xXXXBrOUSBJfaShJ
	Q3FIl6xbxyBcu7gIh9xIHQqn21FSZfdpMcV5nk61SVbJPiQtBHttNIKPphrBUkEC
	m751KYZjnn6uqc5U/7/AzCa7o9ZdEM1jNe5JM4PlmaYY83IHgY8vtel7q28vYtwa
	T2io0g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u2csde-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 01 May 2025 08:23:39 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c54be4b03aso13030785a.3
        for <linux-usb@vger.kernel.org>; Thu, 01 May 2025 01:23:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746087819; x=1746692619;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=INmzJq98TweHQnpIdriujVmaMT2JtRhMol4dfGshJGU=;
        b=azh/8aHAVBmYe5EPUTKQjgsSDghnm00G0uotcqYXzytp/nHCccWDInlXz/JT7v8z7k
         gd9PD0zKGAmmEYmHPpwKgYWWYo+jHS9MIwUe0Y6oA/oFC5FY//LTlOE1tj1W5kWIfIZ6
         SqdsDzcn9Yv8xyR6HQ8xNNzVjqun08JvsAIl+wjOlXljWc8oU4pTniEDJ39/qTPUQHFY
         5iSx5QcpzXfZCbAeUvLocWjfzL5w0Eda5/f9F03Bs9p0i1cjCOofT9b3Bf+ME0BPryjs
         Z2iYBhtUdLHTtf1TEo5Ey9qW3TyhKWA/of+H+1LSNjJnXqAlFCPglrsPobaRQoGNpeqQ
         jlhA==
X-Forwarded-Encrypted: i=1; AJvYcCXvHaGbY5zFKeHEKUTeo06NnCq3J4cKAnD9ibIosMt2z1REZDV6wSvy6ofHvWI4RoRxE5ST/nNrU6I=@vger.kernel.org
X-Gm-Message-State: AOJu0YykvnJtnWrOpU3G1SXz31hrutR3GC1fSr/5QxM6qOw55i3bFdjW
	YqczU0O5POy06Gl2Plj0/D1PVA0Id8bN4bYiaWsrib7LKBaIgqhvomNuxPtQW4xG2zQcwan3wea
	cdcHaA9GbexVyDpN7xCJbyIZvZ2cR2HffP4+Rjm6AjM0jNHu0CvlAqFH7qM8=
X-Gm-Gg: ASbGncusWVhb0R0nFoUOQIlFgLQZSYQdwz+G5jOg4ictILV11hOyuzTXWIreYSB+tAY
	cH8AnhbrYAz/uGjNR3yLbeiCq2t6JNReBhoGAsnr+PkeshAlEB1ZFjZSUslc0jBJEUYzx7sGdFq
	nAYfux7T/KbEyrJVsnz1HU1Yxy2doJzTpvqpHF25d/DUyD4B+LoXis5jkIdVlJGvTBxOZLAGN7a
	VAeCXii3QRJIEsor7xnl2gxOmqrkpRl7pbGFkSgXekHF2yClUs2YLxYQXCPniA5+fgiuGhUlF6X
	7iMjYaHh+YqkXv35l6zXxZzG2x2PIRSwVbWviMNl1aQKd5WxNHSHmoVAg+OiTH8d97s=
X-Received: by 2002:a05:620a:4308:b0:7c5:8ece:8b56 with SMTP id af79cd13be357-7cacc181228mr162399385a.4.1746087819106;
        Thu, 01 May 2025 01:23:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGJbzEzGsqZkwSu1kNt92eSKw+iLzFuEHzTdaaxapBQpXXrMYs7ZN0NxD9KdvXg5kB1l+jX5A==
X-Received: by 2002:a05:620a:4308:b0:7c5:8ece:8b56 with SMTP id af79cd13be357-7cacc181228mr162398085a.4.1746087818757;
        Thu, 01 May 2025 01:23:38 -0700 (PDT)
Received: from [192.168.65.219] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad0da55af93sm7624966b.146.2025.05.01.01.23.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 May 2025 01:23:38 -0700 (PDT)
Message-ID: <a9f893cf-bb92-4acc-8d9f-5a3180b67d75@oss.qualcomm.com>
Date: Thu, 1 May 2025 10:23:34 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] arm64: dts: qcom: sm6350: Add q6usbdai node
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
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20250501-fp4-usb-audio-offload-v2-0-30f4596281cd@fairphone.com>
 <20250501-fp4-usb-audio-offload-v2-4-30f4596281cd@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250501-fp4-usb-audio-offload-v2-4-30f4596281cd@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Figmhm6ir12bsOd4np8XWnGuqbGKMGY4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAxMDA2MyBTYWx0ZWRfX0pJcfl4Mr/Zx oTbmwhwrosFz8M079cTZpEHJZSvDLhawQVjuFPyoh/Zr+miP3J01k8xqL2r77ohOAa3mB3rUc1C 9a/NH3dTp1onTUwP2BA80zbWG47waJkGiDwyuX8zDG/6DdEtzk1iPj3tJ5ZlRmysbiE7HdBEP/K
 oN5qMM0Ybn7NwSsDsM7droYV4DWTlhyc7Vz9PGt6hY/30EcVK5TFuthBiQfB5W2g4h75qySV2aj hF5bY1NGdERzjzfVClDfeNH4xv3z+1sqvGvG798nkessrG/eoQ1PjGWxG2G7fUCHpLKnaKmOciQ G5gYZNaGh7XV/sA6n7N4XErLyFSwslFueKzY8eJr6ss7NBrsPBo+6H+Nr76e2tOWCkMuEoqYV+f
 sJrDVIA+kjsvrmt7c60zYWSUaq57zVUcfTqT280ONzO1B3SMzV41fJjulhC6xIgoNsrhic+k
X-Authority-Analysis: v=2.4 cv=b5qy4sGx c=1 sm=1 tr=0 ts=68132f8b cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=6H0WHjuAAAAA:8 a=s1otzWxbid28AevFAO0A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: Figmhm6ir12bsOd4np8XWnGuqbGKMGY4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-01_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=874 phishscore=0
 mlxscore=0 impostorscore=0 malwarescore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505010063

On 5/1/25 8:48 AM, Luca Weiss wrote:
> Add a node for q6usb which handles USB audio offloading, allowing to
> play audio via a USB-C headset with lower power consumption and enabling
> some other features.
> 
> We also need to set num-hc-interrupters for the dwc3 for the q6usb to be
> able to use its sideband interrupter.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

