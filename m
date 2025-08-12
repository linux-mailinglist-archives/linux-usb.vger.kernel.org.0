Return-Path: <linux-usb+bounces-26743-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 33456B22472
	for <lists+linux-usb@lfdr.de>; Tue, 12 Aug 2025 12:20:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 22D093ABFA7
	for <lists+linux-usb@lfdr.de>; Tue, 12 Aug 2025 10:18:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3989F2EAD10;
	Tue, 12 Aug 2025 10:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jfbPMLTS"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4038723B61E
	for <linux-usb@vger.kernel.org>; Tue, 12 Aug 2025 10:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754993875; cv=none; b=HXdS7EpPbSdp326wTX9HL/4eUVaXMpOEvNw2niRFhE8qfzTCkGyO15o2ym4AzoLpd7OZLmqk6O80kSQemnroF4omwfd4nAG99t60ox0eufaALfySdPQfsROLnWVyD6XfmCFRiSdLwyOMjvj7XNy/02pGzfGfZXxSlLKToj3Uozk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754993875; c=relaxed/simple;
	bh=5xTFZMaGiWcbIultx3Ov/tihiBM2v3Q5D3nA5FEdCuQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D4806Ehn0sRS8bkHetvzAnvRCFsegqOSNractEjJ/oT3aSLcqiwlVcBmydzU9LavWXoNvt82/DES8sgXxY0zEgtP6FxgXWEqN+aOYguQfih5XMwK4ZCLO2c7jDo68RecGWSqzFZ6+imbth7nC7c/Naxl6bBybpOU8C8NHjhjvNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jfbPMLTS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57C8lRQD020829
	for <linux-usb@vger.kernel.org>; Tue, 12 Aug 2025 10:17:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Joum4cPJuzcFCJ6jwG3eOeh/Lj78lfvkkD/S8tyc/mk=; b=jfbPMLTSm4qZ5F6J
	RdsG/Dxha+U43bD9277GYspsA6Oq3pMLBf6AnCdYDoDfLmahK8bL1R5IOva4I1Y4
	ctaWqQIhgtNp4fr8kUDlTrhKsRDNOvc6yR9WOoHJ4pmZL7gcCWDpNEP3q1V0qTZg
	FIETShWFYIix0a4DTBADcRL0tXBW8l/UNFT7b0TKHbGOgOsOmUWvNyPlv7aCZ06N
	zI5080zWU3xc+cSOMvUfZ8SpEl1XzvpJOYlnsWw0qvh0EIIe4q3KCyoi+Grss2t7
	V2xIGueAwQzSCgqUPDZZ5asCBR5HQN45/THiWnQDFxRmwF6ok+6of4sfu/y5eyz3
	fTceZA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48eqhx5wuc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 12 Aug 2025 10:17:53 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4af1219f29bso4831071cf.3
        for <linux-usb@vger.kernel.org>; Tue, 12 Aug 2025 03:17:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754993872; x=1755598672;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Joum4cPJuzcFCJ6jwG3eOeh/Lj78lfvkkD/S8tyc/mk=;
        b=LUvBkfzvx6dSkSRMzyRJ00uyMEm9Ew1zG6uhaWOY6kIDh18pl2U70ZJLY/+wWTyPhN
         aYo3zuvZ6u5qUt69ozbJBZViftC8S6ofawnqRmHIb9REppXqmnHRMiZBpvDEKlcAa8X8
         KE2bT36aZg1/ps/jsrSFltVTLAoUEgO0P48JVfVyEO2Ks5AHG4uaqzFS0xevVBIwedzx
         QVnZ1YXvFd/FPql7QHySBbFPQf0es6IAxMHSIPgJWM4JfK/wbrHNC2IyFIwujI1LjhDA
         hBbbXiOFgn3Q65yqe0peU3NZ/Q31EbhxsYYVxjCEmZRw3R8bya0qUGyB+fpfbocxyEFv
         OY/A==
X-Forwarded-Encrypted: i=1; AJvYcCULsi3X8wH5WSBUo6VL1m4tPupmnrW+2D7DAaUPPwfRR3IawRCEkvWBjeoCcSMhXI6yNkUJOg7nGCA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZdPQPNUmHn1YdL6OiYvQbBczcNKNtQ14duOaGzdUMq5Qqfvzl
	F3YhN+dhMaKS4eBDYArf8z2NHkRjT/kkmcPhcDX6w2PyfMu7Vl/ew4yzJr49xGVpR5DpFKp/3eA
	gr4/uPLz/OjgNIoV5w4vxgYxmVm4+0bxbedK6lD/KjRxipqzh8yCtoGoMB79fE2I=
X-Gm-Gg: ASbGncvQtl7Jz5zavytVs1h131ClMvnqN/z4OaxCdZ4kDmWccJTTvU/pf6RCMYXahCe
	tygamcTxVy0sH1ivq2KvPoECqhfMdNf5uEnOqM4YQ9hMRxbU9VV/GLZ9S1V5SvrZYHe9gEZEt6M
	K2vyaps0ema+/oZwgLBtYviuTMCHlI5EvKdht+BZCAE3KRaKQU0JFRwGTZO2Qq7lIDAVzIMmqVn
	yneNNMx2mmNm2ygpsg2iWSNseCk4mG/5aHd3LJvmtxoT1ELe6RN2QNl/nVtkV5ji1IkOwezZacT
	EhtzgjeeUWZVHBp7Yn+Jbe4v6uYAOyi/KBsK7r08QnO3i8bJS5Re/fFdgoq27wEiqVDyvtX8pq5
	UcTzGqrb2sBqM8UJgVA==
X-Received: by 2002:a05:622a:1111:b0:4ab:63f8:ef30 with SMTP id d75a77b69052e-4b0f5fdd314mr3057671cf.3.1754993872356;
        Tue, 12 Aug 2025 03:17:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFPkCuR7hKbWLepCftfHhwJeoBWg8LIVdoaoNSaobyw9K/hydlnviqBV3h7JP0nDkYRnuy8/g==
X-Received: by 2002:a05:622a:1111:b0:4ab:63f8:ef30 with SMTP id d75a77b69052e-4b0f5fdd314mr3057591cf.3.1754993871879;
        Tue, 12 Aug 2025 03:17:51 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a23fb8bsm2153333966b.123.2025.08.12.03.17.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Aug 2025 03:17:51 -0700 (PDT)
Message-ID: <388aed37-03c1-4a5f-a425-5ed8c4f9cb34@oss.qualcomm.com>
Date: Tue, 12 Aug 2025 12:17:48 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 3/3] arm64: dts: qcom: Add Lenovo ThinkBook 16 G7 QOY
 device tree
To: jens.glathe@oldschoolsolutions.biz,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
References: <20250810-tb16-dt-v10-0-0bfed6d75c69@oldschoolsolutions.biz>
 <20250810-tb16-dt-v10-3-0bfed6d75c69@oldschoolsolutions.biz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250810-tb16-dt-v10-3-0bfed6d75c69@oldschoolsolutions.biz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEwMDA1NyBTYWx0ZWRfX4c8eiQL1sjzj
 c6Dzq4OKFpKHx+aHOya8+IXl9hdbIAMHteKEm+k8v43KzzfM94k0MqLJKm6OwDfWs9UAzxtAba7
 zfb7F7Lw85lkVFxQOGw8cWQPqDeic+juGBZZpJOpkofOJSgZMko0lGtXkcElzNAmcVgRpy9erj4
 zIpBeXfh37PEO06CTf8FonUrsYNk0GJl8j1YBihjI9kolyQxIvlK/6uNmfdYkO210MhZdrYsCd7
 vMSZ2aSBAnrdyfNzwSJ1LXasyX0rGrwXXNfYzMqPFmreF1edTenubfsf8gIUxdbX27jPlxM2z7L
 h6NahnTMLZCFNBTufa0gly95mmGBK2rQdC1zxcLJvXYsM7aHbpVa7PWM36yxKuvViVk4k+T7Ice
 5miGck84
X-Proofpoint-GUID: 3NZfRYB6-RKXgNwYnthfIqEVsHv8rRN5
X-Authority-Analysis: v=2.4 cv=aYNhnQot c=1 sm=1 tr=0 ts=689b14d1 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=gxl3bz0cAAAA:8 a=nGu91fQrwdChBjrFTg8A:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-ORIG-GUID: 3NZfRYB6-RKXgNwYnthfIqEVsHv8rRN5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_04,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508100057

On 8/10/25 7:37 PM, Jens Glathe via B4 Relay wrote:
> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> 
> Device tree for the Lenovo Thinkbook 16 G7 QOY
> 
> The Laptop is a Snapdragon X1 / X1 Plus (Purwa) based device [1].

[...]

> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 4bfa926b6a0850c3c459bcba28129c559d50a7cf..6b1d71daff5a778237c5e3706aaea8e29dafa001 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -333,3 +333,5 @@ x1p42100-asus-zenbook-a14-el2-dtbs	:= x1p42100-asus-zenbook-a14.dtb x1-el2.dtbo
>  dtb-$(CONFIG_ARCH_QCOM)	+= x1p42100-asus-zenbook-a14.dtb x1p42100-asus-zenbook-a14-el2.dtb
>  x1p42100-crd-el2-dtbs	:= x1p42100-crd.dtb x1-el2.dtbo
>  dtb-$(CONFIG_ARCH_QCOM)	+= x1p42100-crd.dtb x1p42100-crd-el2.dtb
> +x1p42100-lenovo-thinkbook-16-el2-dtbs	:= x1p42100-lenovo-thinkbook-16.dtb x1-el2.dtbo
> +dtb-$(CONFIG_ARCH_QCOM)	+= x1p42100-lenovo-thinkbook-16.dtb x1p42100-lenovo-thinkbook-16-el2.dtb
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts b/arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts
> similarity index 77%
> copy from arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts
> copy to arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts

I understand that git may have gotten confused, but the diff is now
impossible to review

Konrad

