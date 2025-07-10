Return-Path: <linux-usb+bounces-25673-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1372AB00144
	for <lists+linux-usb@lfdr.de>; Thu, 10 Jul 2025 14:11:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EC1E61C85216
	for <lists+linux-usb@lfdr.de>; Thu, 10 Jul 2025 12:11:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B88A255F27;
	Thu, 10 Jul 2025 12:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HC4i460z"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 312D8248F51
	for <linux-usb@vger.kernel.org>; Thu, 10 Jul 2025 12:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752149455; cv=none; b=OiBCZCBpbEltNN9fgmVCKHBCE0WyN31jfihgOj6XvrLloR0quxkXxsxlcA4NPbmBery0ak1Ip13hOdKoZUDcoxPtfBvx3Fh9+evdqGgPrc0VUFPYCNxpsCAAUwF12QYivxeX2vvBNhJy3cfI1cPJUZTntASP/8sctYCR4MUA/R4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752149455; c=relaxed/simple;
	bh=3WpSLx1lOvBgBlWtCmaes9/MUjWZbRyaDXKVUI5jEkg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gaPaEP65GB+ZZjdIVnIOglq+Lg9iv1rShBosO4Iw3J5Jd3fIznZKCYjb9/VziyGRr0im/l4RoGzzVkqsW0Li63S4/fJ2TgERHE7oaCTdEdeW7xvODbxjct/0yIYeB5eVjAmbEg8KqFPpcRawRsDI9UZRNhfK73HcOFPc9lXDYjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HC4i460z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56A6H60A023580
	for <linux-usb@vger.kernel.org>; Thu, 10 Jul 2025 12:10:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qylshFqGhjqdpqss4EWahA3a0P0XpI5R9ccWJmm4pUM=; b=HC4i460zUPUFENA3
	MjRi8M3dzKhyuwssANgdh7k8mfip5nLU8X7F1JLj/sxneVaa7iaUdR15UzXVOO1F
	ImzFzHvTm3/blYiN9gmEt4eFM+SKwfcWqWcLM5UUWm+cNkd4TvGlDZQkev5fv2sT
	TcFrMkRA6al43ifj2jkubAJs3FrUfNvtZkkkcVcB4X5gGng2otxgKTuXqt6KlQyp
	dcUR+PaPy4JSoiLFp59cAR7s6aGWZ6mI3ejAN7yQdgXz2XAOshrFt26Xpk6Yu27Q
	bXAA1+6Ihl0EE1FsykzY+81TpsEqFSxeR8ojjOmPNiMs9ZCfJm++Ekb9bCaLzkT1
	Z5N+Cw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47t83u141p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 10 Jul 2025 12:10:53 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d097083cc3so23366285a.3
        for <linux-usb@vger.kernel.org>; Thu, 10 Jul 2025 05:10:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752149452; x=1752754252;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qylshFqGhjqdpqss4EWahA3a0P0XpI5R9ccWJmm4pUM=;
        b=DiXaeMueKCAt/mFPAaUP4UXdA8gT0G0mLo4dCUsffRJpz0u8ar/XUvANxxYG0Jdau6
         iF9iJOxhG7dCDzxxc9d3Cni9Ca0xxNf/IpCQJeJ7GIg+amjGbfPuX6yPFX+Kt6AJE5sp
         QhhmYYT2w/q0gB1x+dTj7g0dkHbm1LeIt/cqUloMSdZ6bb/ZQPwpS2Uq1llf57P9ghvu
         ou/dSmMxiW7jlpgle3X5TUGEvT11hERI/C9AENORZeUKNKAbU9QfPJA4FmUx5fsi+KQb
         Ax+AIHNZ8tcqJukPOea7hCd+DE+c2zQq5eZViUJoKvvbnWNxCAgpHbq63c7gNmsqfuiS
         Je9g==
X-Forwarded-Encrypted: i=1; AJvYcCVmVaZ6nmrkSEkEXwwohzANNVxdrAgiE23MXJ009/Lxa3faAat6YDjJFjuopn0mvhVdhxp6b9L9LUM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVnH3pbm1iDsbzRv3N5vAb4RZeq4K9roKlB39cEQz0X24JMjm1
	nseWgjZMWsFJcVs7L0QiVxOnY4vlteQss02jwPJJYLlMVnFB9DiVveX2lVL86Xjq2JIN1nKozRI
	HIbYPXzvAPrupOkXkSs7d3vlpJeBOcGsgh8C+08kkw9Y32jTYDYyoaVl+m1QcqTk=
X-Gm-Gg: ASbGnct46wsee2scNOB+kdeee62Eth9vHT3MwWq7TzHG1feoRzC4rd9AdlTEPw832W6
	EGMS3/YFbYks3qLJQdx/pSYPc/M4USHanUjnNogea1gIZjXx2bRivxtbzj05t6fE+n59GMOZvmA
	gvdgbnM3/XOqSiErHRYX1al1GgEBeQaTMJSR0TYM4XyvojwONK8ewKuUku2YRWBmAju/uQ6P/+Q
	1Fi72wMkGYmRwxnn2Z5A0taQ5x/6x6vHMBrB4fLR2YIVHUcJno4hCaMrbhA/aiScGM2Zkk05tmq
	QBjAzDIlsaH1piZsU7Esh16uYt44VbRR32CCnRuAOCYNIsdTPRIScfADxFFJ5/gYdkuudj828Oj
	94+4=
X-Received: by 2002:a05:620a:470d:b0:7c5:687f:d79d with SMTP id af79cd13be357-7db8ec65af8mr344978285a.8.1752149451782;
        Thu, 10 Jul 2025 05:10:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGNdXIlzeTaHsQw8JV+VNgiKFo/GTeGYtHM7NPf/e+vpsxjpM2ZxW4+HG2cXIrSvCR3dYQdRw==
X-Received: by 2002:a05:620a:470d:b0:7c5:687f:d79d with SMTP id af79cd13be357-7db8ec65af8mr344975285a.8.1752149451347;
        Thu, 10 Jul 2025 05:10:51 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e8294bd9sm121061566b.132.2025.07.10.05.10.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Jul 2025 05:10:50 -0700 (PDT)
Message-ID: <7d073433-f254-4d75-a68b-d184f900294a@oss.qualcomm.com>
Date: Thu, 10 Jul 2025 14:10:47 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] phy: qcom: phy-qcom-snps-eusb2: Add extra register
 write for Milos
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
        linux-phy@lists.infradead.org,
        Neil Armstrong <neil.armstrong@linaro.org>
References: <20250709-sm7635-eusb-phy-v2-0-4790eeee7ae0@fairphone.com>
 <20250709-sm7635-eusb-phy-v2-4-4790eeee7ae0@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250709-sm7635-eusb-phy-v2-4-4790eeee7ae0@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: enZLPyQz-cvRSzulzN7Ri0P9FKkWLLd6
X-Authority-Analysis: v=2.4 cv=OotPyz/t c=1 sm=1 tr=0 ts=686fadcd cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=KKAkSRfTAAAA:8 a=6H0WHjuAAAAA:8
 a=JvZHP73eehLcbYbFTREA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=cvBusfyB2V15izCimMoJ:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEwMDEwNCBTYWx0ZWRfX32OmJiBISWnj
 8i3v+QbYnz6OyBlr8yU0TeGxExSrrrvBd4J/LZN7dcJYEIpFxUjPISHJPP2oAObE65g5c/z7QoO
 2i6X2hLwAk24jy3LTl4UCR8pXFEQKa2/BzUocAzyGVrcAw2uorcnxkiUV4LkdGrl2IqnDbrcDae
 IabowwLgSbUVV1zRmaayugx0eUQ52mlZja1gvqXamxJxVVQS5ljpXquJk3ZlGkvQS4Ya1A2Nzl2
 R9XxipFEa5WnPmyNOzCHWnw+Z1bJ9modAYiRXRMmJf9Uf7XWjb2us7A4mwrnJC3Kd0dVtiJH/3c
 E3jMLsI0/NtdNLboCWI1g9O8qnVlJ/J4WeutIPFxW4xkXVylkuJjNqb2u7VNEwUdIs313vvc/gE
 4crwIet/qlig3Oq5j1YZ/J+tXCGfAoFAAuYgsozwzDkaYUmOt30tiedMfROPGTw2pKM5w6KF
X-Proofpoint-GUID: enZLPyQz-cvRSzulzN7Ri0P9FKkWLLd6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-10_02,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 mlxscore=0 adultscore=0 spamscore=0
 malwarescore=0 mlxlogscore=999 clxscore=1015 suspectscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507100104

On 7/9/25 11:18 AM, Luca Weiss wrote:
> As per the downstream devicetree for Milos, add a register write for
> QCOM_USB_PHY_CFG_CTRL_1 as per the "eUSB2 HPG version 1.0.2 update".
> 
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
> The downstream driver supports an arbitrary extra init sequence via
> qcom,param-override-seq.
> 
> volcano-usb.dtsi has the following which is implemented in this patch:
> 
>     /* eUSB2 HPG version 1.0.2 update */
>     qcom,param-override-seq =
>             <0x00 0x58>;
> ---
>  drivers/phy/phy-snps-eusb2.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/phy/phy-snps-eusb2.c b/drivers/phy/phy-snps-eusb2.c
> index e232b8b4d29100b8fee9e913e2124788af09f2aa..87fc086424ba4d9fb3ce870aa7f7971a51d4a567 100644
> --- a/drivers/phy/phy-snps-eusb2.c
> +++ b/drivers/phy/phy-snps-eusb2.c
> @@ -420,6 +420,12 @@ static int qcom_snps_eusb2_hsphy_init(struct phy *p)
>  	/* set default parameters */
>  	qcom_eusb2_default_parameters(phy);
>  
> +	if (of_device_is_compatible(p->dev.of_node, "qcom,milos-snps-eusb2-phy")) {
> +		/* eUSB2 HPG version 1.0.2 update */
> +		writel_relaxed(0x0, phy->base + QCOM_USB_PHY_CFG_CTRL_1);
> +		readl_relaxed(phy->base + QCOM_USB_PHY_CFG_CTRL_1);

Said HPG asks to clear bits [7:1] on all targets

Konrad

