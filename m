Return-Path: <linux-usb+bounces-24034-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E060BAB9B18
	for <lists+linux-usb@lfdr.de>; Fri, 16 May 2025 13:32:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2DAA51B655FC
	for <lists+linux-usb@lfdr.de>; Fri, 16 May 2025 11:32:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4771E23909F;
	Fri, 16 May 2025 11:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dRqR66ap"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FAAA238C2F
	for <linux-usb@vger.kernel.org>; Fri, 16 May 2025 11:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747395116; cv=none; b=sFKQYOI+UNdtkz3RKvt7gIjMQlgilCgFbVwAQjPIvVp0PWVASREr4Be1SeKKgPclWsOniDL6cCK2etbn5mZFc9j0faVS4H0+pAoQ3adoDeiLopAtyqbkTTpezyDU77FBY9F5LMmhTcby3oiZp9IUqmSZ+l3lLhgtb0e96uSQYZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747395116; c=relaxed/simple;
	bh=FycK2ZODVKZ+lpAYgjUK8m4GTFrVQc0AVRZfmvA+wIc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mvdpEUWXPg+09tQ8I+e/3Is218LSIYd5a+EnXel/rjd73pvwbjm+O/JpsD233VOrxVrOekvSUGMfQmMNZvbacbj7/TWEN3gf1SGKl6jfo4H7HklC0zNq6oSouXMohm+BSuC517EebDqodF1nb8+McbwQHI8b2SGKMsN0OJdi0wM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dRqR66ap; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54GBQhKo014760
	for <linux-usb@vger.kernel.org>; Fri, 16 May 2025 11:31:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fnzC285t3rkaZwxrXZ55mpC+N/Zc/3Ny+FfdlNU2kLY=; b=dRqR66apEnvPjJPH
	yeID3G5+Rg5NPfrXuFh3aGQIqGG5DIuplLekO0sl+RQJkooeU4ONUMMXJ0X3RCvW
	3ktUwywPWGnVeY1XUpZknIlM92ZBbQnmZ/6Qiwd3kftYppZep6jrqsPQPMFWhENh
	xEzh2sxpEvSN384z8sFftn/0k5TDMkA28Seumy3ILgk4y47lJP+qd0EDaFDHkDb5
	9Y+Sxf368DK8pHZPpczNgJCcuwn7tuICBNS9tbuEEVrD+4iITgb9J6uAK3pKCwcz
	cwcAVUEcDhUXO3WeyLd1zzUHSvWV5Wo64a2CFcFCFV1fFgZbE83sbPvkwxzo2cnM
	lbLKNQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcphwnt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 16 May 2025 11:31:54 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-49452798bd4so5105671cf.1
        for <linux-usb@vger.kernel.org>; Fri, 16 May 2025 04:31:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747395113; x=1747999913;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fnzC285t3rkaZwxrXZ55mpC+N/Zc/3Ny+FfdlNU2kLY=;
        b=hBIhd9ZGrA4vJHvgv4dlImvZnTogpmbkhit/yoGGSB2AHBXJBBL7Ev0kcuZf6FABX1
         LBlUaYVsdEXLkny+5Czbq+uqffHljYPigb7lTFj7XCX5bV04/dyxcltepLBBROlhhnzn
         Cza1lEIsSdM/nDH3O6lSgTo5xP1CK5pcfSlIxkm2wNAb5JDBxlKdw6nbg1zZQq4LVAOx
         0bBgMXQrmFBvVCUx1owngRNBTzoyeJBQCcatczrUFjVQwbn1Vha0O1TF4jdlyK6KfASe
         KIfoIFmnJZ3OwGZLLKppTHkpxUG0v9l028FxUZXM0Un3jxSn4e4UKZaE2ME/A9rS68o2
         u8Rw==
X-Forwarded-Encrypted: i=1; AJvYcCUDgMCizJli1CUYUmm3moebWhnOpQPvh6B+Ve7gjYva/e2dqHohqv68mkNvekReuSXu+jbO5Jx+TCQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOHo1/uHUBuEwCxJh9cHc92hWeTO247eM4AvYGgMVYPzl1idWW
	ToAxX4txQseUawXBGeVicA/J43LCmmCFj9tQGR/pyoV1pJOqYY8+p/pvgOhKV3rNhj0aXiaHjJF
	GDKw/FDolAkCKj3QGpf6Wk84U3CXmY9jIRFHbt5f297hBjgk/+fCdMl1puKh9L5g=
X-Gm-Gg: ASbGnculkEz/2wmp8BiVxMj1CmoXRwzaDq83Bb5zAiQpTC4GGEdtGLtLML3XPoAltJF
	fVEMb4TQqyNHt2r+pyvycg4VSbnIvqsNeweOPGj7SdN4FeAf+GMeRpobGnTldVyrAU/YecAQma1
	jNYj5NqIMs1JqGPasFpbnz/49rrsZeCdG1HSSlflnNbdoOYFXzlUsFAqomv5VZhiGYnHXmH60+G
	dpW4yUwHJ6bGJwXhTmx+lGSFA72pwfud9+GICvK8K+2iWqGQ0Pxb+RwVtCTnlodBZgYVTUWxZwZ
	rwKT/pLhy2O60e9kcgLU3qpnkc2R8CFmOwMw8fQzkpH0LjV7960L4nLIVdFYTnfxgg==
X-Received: by 2002:ad4:5765:0:b0:6f6:d4a8:1a6c with SMTP id 6a1803df08f44-6f8b0806decmr20294306d6.1.1747395112929;
        Fri, 16 May 2025 04:31:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFCEBLp3n/whIhi4REkgwi84pjCbz7w5PCZVecxxq7YLAuV1dBIWRpjJYZo6uKW+5BD+6N3Pg==
X-Received: by 2002:ad4:5765:0:b0:6f6:d4a8:1a6c with SMTP id 6a1803df08f44-6f8b0806decmr20293946d6.1.1747395112304;
        Fri, 16 May 2025 04:31:52 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6005a6dfd41sm1294532a12.35.2025.05.16.04.31.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 May 2025 04:31:51 -0700 (PDT)
Message-ID: <f8e44e19-0c86-435e-adc0-b9cd5b24b1ed@oss.qualcomm.com>
Date: Fri, 16 May 2025 13:31:49 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v15 5/6] usb: dwc3: qcom: Configure wakeup interrupts during
 suspend
To: Krishna Kurapati <quic_kriskura@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>, Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Mathias Nyman <mathias.nyman@intel.com>
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, quic_pkondeti@quicinc.com,
        quic_ppratap@quicinc.com, quic_vpulyala@quicinc.com,
        Sandeep Maheswaram <quic_c_sanm@quicinc.com>
References: <1651740973-7944-1-git-send-email-quic_kriskura@quicinc.com>
 <1651740973-7944-6-git-send-email-quic_kriskura@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <1651740973-7944-6-git-send-email-quic_kriskura@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: bK-i7NDcc486VvPw2dqgYAvyuJRcOI4R
X-Proofpoint-ORIG-GUID: bK-i7NDcc486VvPw2dqgYAvyuJRcOI4R
X-Authority-Analysis: v=2.4 cv=cO7gskeN c=1 sm=1 tr=0 ts=6827222a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=bXvnuBKqF766Z0xgLQAA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDExMCBTYWx0ZWRfXxXyKVB4xphw/
 o0OwZZ+BcTYOlew6ld3fSttGPCZtuV2YrqkcBHB8tLZHpBSIQOSTv1shAXF8lZJdYuO4D5pguKJ
 4+OsHPJiw/DJdNHk25KXiDQBguSZVFJMpbFIqKEIlh6CRGYf0T+sAnO91lQyte3Tr69wrVdWhyb
 ci6B2AYpu6gFvWM31DiVtdGUFfJEL6M8UnfqPnIhDVIbEu1qtmZE+c4TibSuXw2BU9EJ3AupVLO
 FIeynKOwqVZ575aW2LxB4Sed2M4tj1jcz0WozeMXNMNcyvRToRgvDo6na83QbcUEpOio4RC9IX3
 5CXvRpSwJPegEM1DsWn8O9KMlFEADHvM59nyS9JZ5oKTQ9cGXFZrNGE9jdujqZcQR5JyoNdbkN0
 bSTuQkxRR9MSNje+vMMlY7zOezpNU9HZyomB/R/nhGHyyVtbU24BlxbId1sj+UjnRNiSJTQs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_05,2025-05-16_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=877 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 bulkscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505160110

On 5/5/22 10:56 AM, Krishna Kurapati wrote:
> From: Sandeep Maheswaram <quic_c_sanm@quicinc.com>
> 
> Configure DP/DM interrupts to detect line state changes based on
> hs_phy_mode. Enable the triggers opposite of what the current
> DP, DM levels. For HS/FS mode enable DM interrupt and for LS enable DP
> interrupt.

This is not what the patch does for FS

[...]

> +	if (dwc->hs_phy_mode & PHY_MODE_USB_HOST_LS) {

to do so, this check should cover FS too

Konrad

> +		dwc3_qcom_disable_wakeup_irq(qcom->dp_hs_phy_irq);
> +	} else if (dwc->hs_phy_mode & PHY_MODE_USB_HOST_HS) {
> +		dwc3_qcom_disable_wakeup_irq(qcom->dm_hs_phy_irq);
> +	} else {
> +		dwc3_qcom_disable_wakeup_irq(qcom->dp_hs_phy_irq);
> +		dwc3_qcom_disable_wakeup_irq(qcom->dm_hs_phy_irq);
> +	}
>  
>  	dwc3_qcom_disable_wakeup_irq(qcom->ss_phy_irq);
>  }
>  
>  static void dwc3_qcom_enable_interrupts(struct dwc3_qcom *qcom)
>  {
> -	dwc3_qcom_enable_wakeup_irq(qcom->hs_phy_irq);
> +	struct dwc3 *dwc = platform_get_drvdata(qcom->dwc3);
>  
> -	dwc3_qcom_enable_wakeup_irq(qcom->dp_hs_phy_irq);
> +	dwc3_qcom_enable_wakeup_irq(qcom->hs_phy_irq);
>  
> -	dwc3_qcom_enable_wakeup_irq(qcom->dm_hs_phy_irq);
> +	if (dwc->hs_phy_mode & PHY_MODE_USB_HOST_LS) {
> +		dwc3_qcom_enable_wakeup_irq(qcom->dp_hs_phy_irq);
> +	} else if (dwc->hs_phy_mode & PHY_MODE_USB_HOST_HS) {
> +		dwc3_qcom_enable_wakeup_irq(qcom->dm_hs_phy_irq);
> +	} else {
> +		dwc3_qcom_enable_wakeup_irq(qcom->dp_hs_phy_irq);
> +		dwc3_qcom_enable_wakeup_irq(qcom->dm_hs_phy_irq);
> +	}
>  
>  	dwc3_qcom_enable_wakeup_irq(qcom->ss_phy_irq);
>  }

