Return-Path: <linux-usb+bounces-25096-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E46C6AE81F7
	for <lists+linux-usb@lfdr.de>; Wed, 25 Jun 2025 13:51:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1572A172AAC
	for <lists+linux-usb@lfdr.de>; Wed, 25 Jun 2025 11:51:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1326125D54F;
	Wed, 25 Jun 2025 11:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ej0LtvTJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD4025D8E3
	for <linux-usb@vger.kernel.org>; Wed, 25 Jun 2025 11:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750852282; cv=none; b=Uw6ZiFuq7yDWoDXb//EqpsP6mngkIw9aFVoQWv9wNmZdld1KQZBAcKJcni7QuQdHzLer4Drh3gM5OTGurE7WRX4JzDf4vz3bvcE+m8AkRqm+yeJkqwm6fxrOCHCKPLxUkULkfxBoDqzXGBBsYc6VDkIVT+kmc1b1TZqKCYhzepg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750852282; c=relaxed/simple;
	bh=fs7c8Qyu5BrfvUyh4WP843ByKBeqVCKxGmA3+fES+jE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j0Gte3oewKolRnnC687wp+/URJXU3SjoIRQ2sW17nTAnIwaBsxSWUXxYziM8KFmMXmnnibFEDRk/LYIAMMcsPBPz0S6QogHa6u2lhBMLNUsSncYRIVmzrHVPypyoUO/ELlRdXAVy3FcEDOlzQxTPwQB6TbZJGg5efRr6EaEu8m0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ej0LtvTJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55P4N2XD020068
	for <linux-usb@vger.kernel.org>; Wed, 25 Jun 2025 11:51:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uRfQCMJPJ6I6xt/lsb5RiX86zBh0KuNZA9Flm5VJRyQ=; b=Ej0LtvTJLh+M6FeV
	IpxDKqLh59EosLSa0ArOiC/IdoB5oFywQQSaMN9UOAu+528/6cOO+3HkHRWcx+eZ
	0jT0JNFfqT3nwlmkII6vBB25GITh5GOGzuM/WCmOwHtibkfQ2fVELQC/mlsWdLN9
	wkBi8SHN6I7tMUPFT/FScHUJp0NCJqQ7qTiekP6jqlq63IzQjIV9kP6letvWDmdR
	03MPl4ft6GCNb+F+ofB1DWHx9fJ2fyE9zKg5OHpljk7vS5DqcgRGwaT+DEQJIW8x
	iFwpIiDYVIlIugDWxa5VqsufcYATT7Df8Wp/sDHjUzJEk8M0JQcmvwvVk5ls0vhZ
	qOVP4g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fdfwx151-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 25 Jun 2025 11:51:19 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d097083cc3so181877985a.3
        for <linux-usb@vger.kernel.org>; Wed, 25 Jun 2025 04:51:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750852279; x=1751457079;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uRfQCMJPJ6I6xt/lsb5RiX86zBh0KuNZA9Flm5VJRyQ=;
        b=D0NXFh9nztXIozqvu9Vz6i9PFyfyNiK41pcVxJQQ0qps3OAAhIY9zaNBXk6PEryHHR
         jiDPGdb43oI0bKYVPtwQo7jafhV7+cOSWsH9d20xwz00u6kNuP8KVXCbOqsrk214k8cs
         JH/X3RkgPJV39J0AplDQa5FNuynOnJAWIgfGvNXDBEQaeyivSCU4/P3h0fHCST1WNEdt
         vHU2wOMuiRSMwlQNqwi55XkVO6gNvxTxYXvzXYExkE35G6s98Ar3KooSMUymP+kysePF
         q0eK9cusmQJtJ6mGQDZ3Z5TugHiHBPSwhANtxy3ge+lt2ZrT8kHo7tjMfcDDWnSFrvZW
         cr2g==
X-Forwarded-Encrypted: i=1; AJvYcCXww21kmg3SdCJGpKdTKjU0gxNIe+x0v1VKLA0qbXMIBViF5kHTzmq+ITtx74jSFfKKPgczDT4YXU8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxkoZ0AOeOymzx+Uw//ezyy0ad3XjHswM1+OgXPL8Kwq/i/pdhu
	A/q+mB/kdDYlfgKx9VHElVTHp9mirJ0CgIYDLMtSVo6nSSNZGgucLaX+OFvovkZTBZOj76ZS4e7
	/AsGeVmRTy3w5sG3jaFxSjGjhCrUqkzZZSJXArMc/zjmT7ZbAc0kPIzWighKiorA=
X-Gm-Gg: ASbGnctHWyzaow4OsSCz5ZLwrmJvt5hfrXhfNPhN6x8RKQQGXJuwamFAb1vfovreVQp
	g4c/ZyGqtXOsN2CIvIfm/Q/XzyaycKOG5sQjqN0hS5Z88bhFy5Vf6hcIvQ3JNEjlWG5dlt7s47I
	hTkOP+Sn3H6GlxbRn/ssB6A0qhorxi+STPJVngNh7Tj2Ib7qVIf2eAy/uJIB17+lwVV4i94By2c
	i50uffBFUEIw1utjwp0e9PJ4I16ROSp1kVEJduRzLMgU3h3GPH2LBGXctpiK8jNT62BGCubsqYc
	yimlpS3MXVX2vZdg5+YM3V2AmZYayAbHtCZvl0v/V6yrSm+gUC7LYbybfif4nQkflIPJW6Vw4qh
	sxlg=
X-Received: by 2002:a05:620a:4802:b0:7c5:8f36:fbeb with SMTP id af79cd13be357-7d42973e679mr128603485a.12.1750852279217;
        Wed, 25 Jun 2025 04:51:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHccfvELeUXoP8b1jBpiU9AZeQNg48frmRiDDZy9qYIkV5bzxU9h6vBSLu6n9Ur83kyw9tsMQ==
X-Received: by 2002:a05:620a:4802:b0:7c5:8f36:fbeb with SMTP id af79cd13be357-7d42973e679mr128601585a.12.1750852278731;
        Wed, 25 Jun 2025 04:51:18 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c2f485d0asm2360299a12.64.2025.06.25.04.51.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 04:51:18 -0700 (PDT)
Message-ID: <4d215791-35da-4139-9cc8-33da5d46469e@oss.qualcomm.com>
Date: Wed, 25 Jun 2025 13:51:15 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] phy: qcom: phy-qcom-snps-eusb2: Add missing write
 from init sequence
To: Luca Weiss <luca.weiss@fairphone.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Abel Vesa <abel.vesa@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org
References: <20250625-sm7635-eusb-phy-v1-0-94d76e0667c1@fairphone.com>
 <20250625-sm7635-eusb-phy-v1-3-94d76e0667c1@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250625-sm7635-eusb-phy-v1-3-94d76e0667c1@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: sIUADN3WHf-vfB0e13ZY119S-Sy_jdn8
X-Proofpoint-ORIG-GUID: sIUADN3WHf-vfB0e13ZY119S-Sy_jdn8
X-Authority-Analysis: v=2.4 cv=MtZS63ae c=1 sm=1 tr=0 ts=685be2b8 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=qC_FGOx9AAAA:8 a=6H0WHjuAAAAA:8
 a=EUspDBNiAAAA:8 a=SHKt8ETI8ElOVTnc0VsA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=fsdK_YakeE02zTmptMdW:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDA4OCBTYWx0ZWRfX2blq3SPLrdT0
 RZHytw4MM+s30+5dSY3Db+bRl8X0wAx9b8CYoDYyDjQ0SaGGT6LhkFH2wxB3oI0y3iF1niLfdIL
 karw4fnJCM2B8Q+0NnPZA+Un68gjCvjESKslxV0XzQlQSPRyhihxNHXtk06ip9UmeuMSrOrvyXJ
 2sELkZb/45AukUxZgYirlR8Sl9uq+2btg7J+KTOEXx7twOypmcPaUNe/KX0zzxRYPh4eHbjIAPJ
 dWBuzR4W24XT87o4LOTvSNt7gu2ePR6DXpzx79hksZ87vEQfrldcla93gDP/W2nYHa5p8P75qr1
 lArCd+fi1TExyVHXyWqVSUcstTnXmhsU0S973xRTFnoEByrsyN4wyHwLGX1ZNzowDSZ2pACpHeu
 gUAf7Fbor8vL/HwbkM68JOjvbzMnJxCo65LEKY4rDxKsOnAFl2ddgIHa9XoAXbJPvgDTA06l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_03,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0
 mlxlogscore=999 spamscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506250088

On 6/25/25 11:14 AM, Luca Weiss wrote:
> As per a commit from Qualcomm's downstream 6.1 kernel[0], the init
> sequence is missing writing 0x00 to USB_PHY_CFG0 at the end, as per the
> 'latest' HPG revision (as of November 2023).
> 
> [0] https://git.codelinaro.org/clo/la/kernel/qcom/-/commit/b77774a89e3fda3246e09dd39e16e2ab43cd1329
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Both the original and your commit messages are slightly misleading, the
HPG (and the code which is indeed in sync with it after the change is
made) only sets the value of 0 to BIT(1), a.k.a. CMN_CTRL_OVERRIDE_EN.
You most definitely don't want to set the entire register to 0.

With that fixed:

Fixes: 80090810f5d3 ("phy: qcom: Add QCOM SNPS eUSB2 driver")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

