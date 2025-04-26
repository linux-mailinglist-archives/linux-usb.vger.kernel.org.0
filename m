Return-Path: <linux-usb+bounces-23498-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 083FBA9DD3A
	for <lists+linux-usb@lfdr.de>; Sat, 26 Apr 2025 23:25:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 80974174258
	for <lists+linux-usb@lfdr.de>; Sat, 26 Apr 2025 21:25:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13EF71FCFEE;
	Sat, 26 Apr 2025 21:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fgjrAf1v"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 009931FBC92
	for <linux-usb@vger.kernel.org>; Sat, 26 Apr 2025 21:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745702691; cv=none; b=nccOWkZ76hxpU/Pk/i2j8ORU7QJAdI7SbDYF10cLupVgtwrYmmiTyj1Ppj5LbXrwnqlThOBH4lZaXSkUma0KqgN76b27Qvd3u1wBP5Vlwwh9F8VEN8V21yw0yqZaJC9PQMCYBnz3+MkY/g0Wr2RIzD5YbWwGgcZghxsT1xdrNmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745702691; c=relaxed/simple;
	bh=+e2jnoEU0KW0QXVKjWeyp4SP2tcdhAZ7keq7BZMyPA4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bbw5wuJp3+V7NL9gVMX4YPbsga/ZRHTqgdMJ7mGW4SkHcHAQWsyB7OsU+2kMIp7IKH7Cnyqk/X90fCz4FRt2Aa68h0O777epyvoVQB7i6x83XFg5cbUy4F912gSC3M8nmjWh5L4GXjFgBg48b/czGCIlEoMqklMvZ9olSQiObYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fgjrAf1v; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53QKORbq012420
	for <linux-usb@vger.kernel.org>; Sat, 26 Apr 2025 21:24:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WR+R0rhCOjYqlZUhhYUXJ0Rz5/y0uM5IX/cfP7qDHJ4=; b=fgjrAf1vO8jRmSJz
	tWe1iBFd3RV+TWEznsjja5vdAx2BbLr45XiDh37J0Ccq9eJJNjoqgwidMInDyk5n
	iWF6d5NgwymuNCuu3oMjEDDV6DV4Up5pMfI4qFU2lFsXTM6NPOgL8c+E8RgQ33O9
	I1FRyApyHBfU1U368E/0NMZXHNFW70cqho7CUe9MrpWT/7RSvoQm9y0Y21qRGEfq
	GKxqOKuMXwloz43augz0oGF5lUKjOtRvdqsEMPxiIrT2UZUpvNhnzF8hvNAY7Qej
	Kx06axuzKbf3o135CE4mf6cMtzHdiDHaOz+zkWjCnY9WrlCxYXjx+blG5IkEQvYG
	S6Iuow==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468n6jacen-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Sat, 26 Apr 2025 21:24:49 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6e8fb83e15fso8823416d6.0
        for <linux-usb@vger.kernel.org>; Sat, 26 Apr 2025 14:24:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745702688; x=1746307488;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WR+R0rhCOjYqlZUhhYUXJ0Rz5/y0uM5IX/cfP7qDHJ4=;
        b=DRjotZqZZ91mqnv6gWR9csGVxnxTF9Gv3Dr5rdK7WNwyYTIUnO4y90am14CHsNgVUO
         KxpMzpnQ6ZsaBy7KtILmE83vyOMcoTmRx9yTwJSCbJ4yKDvVxYDIkCaYCR+wne5l2mx3
         c1SPiEKq648GFnkpsUROMSPdGu387IrH7sV4l2DX2Om5l4jwdC21ppz55KNilF7Jy2ah
         5Uy8JsA+Xv6Nx7i3h1JbhSQY1/QG1iFyqkoT1Cns9dyrdTNDfDbaGiiDU8WwvT0ze1BS
         DmUVKq+prSf3SKtJTUtJtw1gA8Gz5T/TBoPVfOvCGjkxyr/y7T5+FfmacxK1VKI4/rjy
         KENQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlhwy9pXx9x5x6a0x5a9F2Ctk3f065lr99okMCrf6yQ3eGBsgytAL6KiAiusgP/qCfe/3TAz/2iPM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBIGOP1bP5VtpylpO3tkGhq9d0t8OzBYiEUBwQFhZ75KtPAK8j
	kPiPltipuqB4rHRO81/EQOc+ngH6fJwp5FBG7q35TuXdIm36aAPqxiJo1ja+FtG476vAXImrPpM
	REKCue7gdkUZzaOwa2j0Bm5NyPav7HBfwVFU+05hu5PPeXt9+CVyejIq8F20=
X-Gm-Gg: ASbGncsr1R4z368GwcB4NERX/GHCpk1oUfl1rnHN0n/j1OxT20/HQpliQAdV2jScj79
	nq3xk/AS0Ql6z0a6vdKpt1RHEPNeoDH25T5G5MdYViPE33M1OmfgOGLkpkecLepdQBHsxpqTEIQ
	z0TgSLSlJHr7jJmMpcmBjnCiDmHcrxLzaMkBzLNvJV8BXJVi32Bu7RH6sjFfoOORATYOMhDMCbh
	JzMf57e0jbbshupMZzzeK2M/Q7wV/6125LXb0pfg/erWfcdvBNofkP8yiiiZd+a8WHgCSB/P96X
	HgEWam2OOj9FHwqG37a4Z9//E34ZXJsFMm+BqfrCNNHCzJhbW4Dv2lsiLV95ubQmVAk=
X-Received: by 2002:a05:620a:4723:b0:7c5:687f:d79d with SMTP id af79cd13be357-7c96071e76cmr432500285a.8.1745702687800;
        Sat, 26 Apr 2025 14:24:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE91mB/OTCAHM6ZPMMnYcSN+AYgw89fz7uJMpE+BIsfhFRJH7wciNvcBCPhWb0E3BpFD0EuKA==
X-Received: by 2002:a05:620a:4723:b0:7c5:687f:d79d with SMTP id af79cd13be357-7c96071e76cmr432499085a.8.1745702687493;
        Sat, 26 Apr 2025 14:24:47 -0700 (PDT)
Received: from [192.168.65.152] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e587f1csm343657866b.79.2025.04.26.14.24.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Apr 2025 14:24:47 -0700 (PDT)
Message-ID: <dafd9a80-9aec-404a-88bb-dfc91c8ac224@oss.qualcomm.com>
Date: Sat, 26 Apr 2025 23:24:44 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] arm64: dts: qcom: Add support for X1-based Asus
 Zenbook A14
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Abel Vesa <abel.vesa@linaro.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        maud_spierings@hotmail.com, dmitry.baryshkov@oss.qualcomm.com
References: <20250426130203.37659-1-alex.vinarskis@gmail.com>
 <20250426130203.37659-5-alex.vinarskis@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250426130203.37659-5-alex.vinarskis@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI2MDE0NyBTYWx0ZWRfX9qKb4m8Cr7WX cn5shzWr+SzEVggBWo7VaE12N6Ryk9mEmNmZy55oN+cgy8YDFevMlWFRkMZk/45myUXuaeHYp7S AUf8tYz8kdwLvTFDe3GgwikPP2E7jzLbxepFuJ5R3pKjLbYJJ1aQ5p+jlsGWLlymjdrBB2+DXwM
 hMFbQ+YIIbtVnA9uzVVUZC92tVwKMzFag8kXfGKAfQYQcRNjkeR8nKGWMA0K4TNGb4vRtE9ql8q k84liLVN9Of/u0AfWu2EbLlKo7fWmnPCrFXzB633Jyj2oPUtDt/izrnXBN7c4K8jjvO92sAFYk9 n4Mk6Z3GuTnaHRbFfSM5oNwHCtuaySh4e+DzC6kqHmzsVlGoogX/LBVNHz46UNqS28PJiKEpJui
 VXVfDDM3WhbAzs6sWuiOunT1uqWuEI/oT5jzSt3vdj0AESN8IYY8ErqCeCq9UN+gIZoIx+hs
X-Proofpoint-GUID: JqufXhHwEL01C_fTnUoR7nS3fWcdvxID
X-Proofpoint-ORIG-GUID: JqufXhHwEL01C_fTnUoR7nS3fWcdvxID
X-Authority-Analysis: v=2.4 cv=C8fpyRP+ c=1 sm=1 tr=0 ts=680d4f21 cx=c_pps a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=04dXdBH-sfCwm-JsXqsA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-26_04,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 mlxlogscore=999 priorityscore=1501 clxscore=1015 spamscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 mlxscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504260147

On 4/26/25 2:58 PM, Aleksandrs Vinarskis wrote:
> Initial support for Asus Zenbook A14. Particular moddel exists
> in X1-26-100, X1P-42-100 (UX3407QA) and X1E-78-100 (UX3407RA).
> 
> Mostly similar to other X1-based laptops. Notable differences are:
> * Wifi/Bluetooth combo being Qualcomm FastConnect 6900 on UX3407QA
>   and Qualcomm FastConnect 7800 on UX3407RA
> * USB Type-C retimers are Parade PS8833, appear to behave identical
>   to Parade PS8830
> * gpio90 is TZ protected
> 
> Working:
> * Keyboard
> * Touchpad
> * NVME
> * Lid switch
> * Camera LED
> * eDP (FHD OLED, SDC420D) with brightness control
> * Bluetooth, WiFi (WCN6855)
> * USB Type-A port
> * USB Type-C ports in USB2/USB3/DP (both orientations)
> * aDSP/cDPS firmware loading, battery info
> * Sleep/suspend, nothing visibly broken on resume
> 
> Out of scope of this series:
> * Audio (Speakers/microphones/headphone jack)
> * Camera (OmniVision OV02C10)
> * HDMI (Parade PS185HDM)
> * EC
> 
> Add dtsi and create two configurations for UX3407QA, UX3407RA.
> Tested on UX3407QA with X1-26-100.
> 
> Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

