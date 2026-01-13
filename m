Return-Path: <linux-usb+bounces-32257-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EA714D19038
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jan 2026 14:06:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3449F303BF82
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jan 2026 13:05:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F13638FEFE;
	Tue, 13 Jan 2026 13:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RRyPBOk7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MlZkdwm3"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A115138BF71
	for <linux-usb@vger.kernel.org>; Tue, 13 Jan 2026 13:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768309508; cv=none; b=IC0faUhwvX4O10U15rDqVNKjtMoV0nJOqplWaCME0mqMXP+OxWW/jGKNid9ZJDdDoG7b1iyaUcIpP8JWd41rT/PVQwV0gY2xYJbO3MGrSJRTQxy+089OnqC39JWSKcM+wThn6vsjOL3g5HJvEgu5qQBOuyQg4DhKlBQaduS5JBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768309508; c=relaxed/simple;
	bh=bdsxR1lkTR1NMiMQrWc6Z5waeQ593rIW/DnTKDqARn0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LxZzdg3Rg4g6Uht5LD8rp0Ph/NQLkU9RoPqfdlzCNcsgFxZgzun6L/JiB+X8xynBhyZgpZxXT8QLLRAtmld6gCL6ufeqPcuLGFGWFfcVD3pT435xPvyH6J6ISdwqtMbfvtEUXkc4GrZ/OQ0PDmpZBimJAlkLz9GbQCpDAm3JLzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RRyPBOk7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MlZkdwm3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60DC2Ncx3870136
	for <linux-usb@vger.kernel.org>; Tue, 13 Jan 2026 13:05:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	neiMhCUlfo05tbI3e1iPEgmhFazGW0tLIbSzyaNtg+M=; b=RRyPBOk7Nm8g+wrP
	laZKyGWES6UbvCouMzZeoOuzf8FL9tTHXKT92tF8tvKtlcX/MJJA60yEUDbot+OG
	OkcaicScs18pH1EnSLwUiY1f1Irq9LKXpPudlDgZ5bqUrUQvnKzivW4/4t4vfkv7
	deejTZSFYcurz/5KpfKVF/Hh06lEPoIUmbM4j3SsSqjo4q9Nak7BAYUGJLn0KJ2A
	HA1uu32dPeaMDbPc3jGhzmwgjxMpZEbsF53i7djb4LiI3h3AxHC/1S4WQ7Z9hd3D
	xaNtIvOgMjmyMQxYseanZCyLySGvoAzm/GaSlG90H69mN+Ybg4eij/XMfOtJx7pZ
	Tskgbg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnfxk9b1v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 13 Jan 2026 13:05:05 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ee05927208so27088961cf.1
        for <linux-usb@vger.kernel.org>; Tue, 13 Jan 2026 05:05:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768309505; x=1768914305; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=neiMhCUlfo05tbI3e1iPEgmhFazGW0tLIbSzyaNtg+M=;
        b=MlZkdwm3i2o41mr8+6gEzv30XbVWy5T0UkerAGD0WzoyUpFor9IwbV646xX00TsWJE
         Kux5QhJNWc70ldsXAljP3HyAbh4U/oRHEFP0WGOSlRo8+2LWsxAe+iux7yaetC6pEDXf
         2li6zBQhskwA1hM16qgVp0QVFueatFl1VFAY2+ounk2ylKXDzCd6nqaCVKn/Y0iLwDkF
         hJaafP58GIUTtzzeHeMPCqLykp9Ohj0yNmV9F9/KtNPqjZfvBiR5r6G0t0zp1cASrETY
         mYdScuemzCCQcE+MQXrqjaLRWuJQhfRmu7pvhiOGdcLWhIuJJqUKQZO8TE6B4KCUFmNp
         neUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768309505; x=1768914305;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=neiMhCUlfo05tbI3e1iPEgmhFazGW0tLIbSzyaNtg+M=;
        b=K1cA4RwjtU0mJrmwNXmDztn5wfjEqVH8WQ6Qz1DiOfLjv7hXukjAL6O7KlB1YJMXz+
         O34PRDsNxBckh1N7cUMDwHCTgiBpW3F76mYco1Lm4kiLbKjb9eFnIznadWmqJ5I55ZTF
         To4dfT3ix3PNuqieo95lSRokzexcGZaMJ6MimWgyvRYBJa6E9RS5hiL4hkuPNzB0ACUh
         YaOvQ3wqXlWjTPdOlTtmyHeYHrjwDtdy6lQVYgzkEAkr0qqMOcyuKgaoT6juhrRkDwzo
         YP3ILv1RGI3vVCkIwYYnwKD1j+Ry6f8R/Ex81LVMiZ82tUA7Pn1zW8N4wZTNHnbiWukh
         1xww==
X-Forwarded-Encrypted: i=1; AJvYcCWjnADsLfRYcAeg24Qlect1eF6DVK0IW2C1Hw8hGzkggMBqxfey+F1LV9R9GtRoqnc1FdNvpRKJwxQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZxUAv1xlQyH5IYhNms9O/Yh5/2/HbKfbSAwf7rY2Zdrf9IXt6
	XDKc4tZ7blA4vFu2JJSnzyJIzqTq2Id0T3heWLVjP6rimTEF92ze+KLF8+pp5nSlgQPskdG3e40
	3tiAqNNRF+AzN/odYdBP4WD0i8rcUdHyS9tBJ7DP5r6t+2FplM+cTSmIu+lPZkP8=
X-Gm-Gg: AY/fxX4DKFCHdZEdtUNmrky//L4D2UQojAhtxxBFHgJ17XOIxVw3gsFofwax9u6ICb4
	We6JKCMVtvw7wnz3hgCOg55CKKFxHu1U89X7CQzfvD5F93KDRONS4AbEtEid1i0ztU+jxenUsCM
	Ejvi7K3Gc9XremGz7kVeYwY74kJcJ9Npw2rRcMBoYQUYuFPyuq3JZ1Z7RrVINC29iswt0dXTZsV
	6tisrHqrwuHkc345IgnokRKeLarcvebTo1zH1iwsugFKw18Uk+qyojCvALEqNEBtjQ+kylTSk4r
	Ds0OosPQCqWCzCL6tnqfgWwwclrjqcmXMbDEQn9FNdfY7RQq5FA3RrInSYEuOqNKkk4QXN/Bzrw
	a8LTp5s9MpXDdVkopotdn0lShsb2lwEH+foKh/ukowDt1Ta1WKUn7tfk4wR+B7wM+aZc=
X-Received: by 2002:a05:622a:211:b0:4ee:1367:8836 with SMTP id d75a77b69052e-4ffb48b6d14mr240324571cf.5.1768309504801;
        Tue, 13 Jan 2026 05:05:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEcplFnlt2Sv4raFaeWXiNUyu2EYwm++k8ojATvugdaV3zGrnz0m/KWdSnZbVGQVoSM6EZpUw==
X-Received: by 2002:a05:622a:211:b0:4ee:1367:8836 with SMTP id d75a77b69052e-4ffb48b6d14mr240324181cf.5.1768309504347;
        Tue, 13 Jan 2026 05:05:04 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507b9d4c89sm19171192a12.10.2026.01.13.05.05.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jan 2026 05:05:03 -0800 (PST)
Message-ID: <3ad20ed6-d870-4532-9559-9e6c39e545e4@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 14:05:01 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT 1/3] dt-bindings: usb: qcom,dwc3: Allow high-speed
 interrupt on Glymur, Hamoa and Milos
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc: Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
References: <20260113-dts-qcom-glymur-add-usb-support-v1-0-98d6d387df01@oss.qualcomm.com>
 <20260113-dts-qcom-glymur-add-usb-support-v1-1-98d6d387df01@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260113-dts-qcom-glymur-add-usb-support-v1-1-98d6d387df01@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: o56PCPB5tj8SYHbjwr7_Gm7552toXA8W
X-Proofpoint-GUID: o56PCPB5tj8SYHbjwr7_Gm7552toXA8W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDEwOSBTYWx0ZWRfXwhoCGu2XLczR
 0B++a5OTmsYJObUJoPjd7tC3435TfG8FOvGQlgvi2UvHGY/Gimt1fMegtRMyOwQv0k5uyujfksF
 MPU2XaAfhllQKRgmwrD6+X1j1V0BPLVYLo5Q3T+jHLTLT3SIBHH81I4jCM8RONJEA+Dn6rZmemf
 3Hv73PboA7BzjAK3P+46GqlmlEyEdtXE65SX668M6EyDxKWVo44hf4gT8Chuihxb9O3+7lm7s1N
 eyi63C6BEPVh536uYQrtsiSXxs+QV5DdCwjukp/WS+exvF3FTmpzNKlvnvrXRmvJrGusvhYF+5X
 aHTMHQX/lXQRVhzqNiC8plFsTWeB/3f3kizmm876x3v4DWEQ8GBja1dYuTR2++mB8X9xh3CmSha
 qPuscb/fehTP5EeRyYxC7x1FxSXM2o4/8tFJicL9Jgx4/Y/X7NDlnW/B6syOl7xLhZlEXjiO5xb
 A3SrCISOAACDnejq5Zg==
X-Authority-Analysis: v=2.4 cv=PvSergM3 c=1 sm=1 tr=0 ts=69664301 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=iuyhanrI9R5_42HSFcsA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601130109

On 1/13/26 1:33 PM, Abel Vesa wrote:
> Some of the controllers found of these platforms can be tied up to a
> single high-speed PHY, basically rendering them as USB 2.0 controllers.
> So in this case, the interrupt to the Synopsys DesignWare Core is coming
> from the high-speed PHY, so allow the interrupt to reflect that.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
> index 7d784a648b7d..f879e2e104c4 100644
> --- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
> +++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
> @@ -500,7 +500,7 @@ allOf:
>              - const: pwr_event
>              - const: dp_hs_phy_irq
>              - const: dm_hs_phy_irq
> -            - const: ss_phy_irq
> +            - enum: [hs_phy_irq, ss_phy_irq]

I fear git may mis-merge this.. if you send a v2, please tweak the config
to add more context

Konrad

