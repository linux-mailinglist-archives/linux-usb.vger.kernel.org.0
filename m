Return-Path: <linux-usb+bounces-28149-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 20873B593B5
	for <lists+linux-usb@lfdr.de>; Tue, 16 Sep 2025 12:31:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 072204E21E9
	for <lists+linux-usb@lfdr.de>; Tue, 16 Sep 2025 10:31:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D412305E3F;
	Tue, 16 Sep 2025 10:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YSUqnefp"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A41FD30648A
	for <linux-usb@vger.kernel.org>; Tue, 16 Sep 2025 10:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758018582; cv=none; b=IBJlw2fkfr6l/zzYSdk3xmRL7tUHgncEfJqvCYlLWyEdAhzbXlrGG7zwr0QD66ldq8cu1n4o2KW5eQWtI9r4k3GiDqAutB9IPjKlxCjIBNr8YfXAYgi5SzAhQq1/XOKW9sPrR3kW9v398dgFfsRXYNZsiA+2NyOrHtNX5ka6WQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758018582; c=relaxed/simple;
	bh=ygtB+EvH4ZQAJq4PlbVuhMBsLl2taMUDDFSXeqxgpe4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cf0RjAmQ4g+irSja5ffAkRXSmd7uHlw50jaNsyOztlOoxqCMCTlVvUzgbjeAqClwsiSW8ET3Yn4KqvF3BMmwBCWAqlIX/r+XsFXQwj+aQIE4OA03BG95T8fmvU85k4e9wHgfCH2phCwK234QElyUibLmSgtLzBfJ0q8vGWBauTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YSUqnefp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58GARDBD020381
	for <linux-usb@vger.kernel.org>; Tue, 16 Sep 2025 10:29:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GU+SrKKCCt7QHKhnQ0Qwpe7d/gooxwsnRu7znj5bEtU=; b=YSUqnefpDpieJ5OB
	jCzjlZvaJUP4u6G1NzieAHCckj+fW/7U3s+flo1Mov0rLDcp74u44eFt263Ku2fP
	W0sNzrhQoGmTh3rWz1yaKC8A4FvmJdFtzG3u9CHrmRcI4FsN8nMejZgHI0GjTVh+
	UJQ6Mh+YiND5CVkJTc3hdvHPEnNgVZNpvII5ksQD4zxz35PZNIBAjhh8cpR/DL+L
	gUzNXNaPm2bT7Ri3CPZ+dudzZETWOnMg9LX+9W8pZCL1vvEyMtsxACjyBrNdL5MI
	EURQD72pkMQcHZh1BS+bli8Xoos7zCUPbvRqQRSAB6ZcsFygS8PXBV/ZmiKU6tyJ
	GVUzRg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4951chgex3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 16 Sep 2025 10:29:39 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b822016cd2so981411cf.1
        for <linux-usb@vger.kernel.org>; Tue, 16 Sep 2025 03:29:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758018579; x=1758623379;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GU+SrKKCCt7QHKhnQ0Qwpe7d/gooxwsnRu7znj5bEtU=;
        b=uPcaULqDJ9TgS+OrFLj3UXhKdteVgW3yLFcYLr7PGvNYaG1izV/6lABR4LA1gf3Scg
         LUE/C2BLPCHUGlHXtNIOsFlyRlhWH/FR1gQWG5eC6UMIMVhW73jdQPmjV3Q+JXi6kKzB
         P5OFla4KDr0ci4DafHkyd0gKmrTA7hxLTlvPK8uqh1HX4Ly5P/49dmC9ilQVChmdRkus
         +rzRSpaS8mr/WMA17zeAgZc4byHH54sml8wnR6nknedcHhHinj935xV8PB9j2l0B8Ewa
         SvK6DIIwYSbujrOoE3qDHjcYv1LJ6GFGiMwXfFr55IY2tJcXV4eXJewqMsl3eorigRmj
         6nfQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZYomw/5o/23I2NE2WYxODlJ5IUapf5SOKInQt3Iq9QGLselckThGr++j406qBOFmA+5bZSnew630=@vger.kernel.org
X-Gm-Message-State: AOJu0YyyXiYM6bF8WytduMHpXWQqDsBjYgvcPZwkummBVpHpfozoXQtG
	TscYSXXMYv7P1SfH2nZYWgfwD4FXgRQZnPnoeZG0WkwfbhLUsVY4BidHSGPnT8ro7lbMojJI33Q
	JLKc5/ZkBimRc60QouGtbWe4qS2P1BrtbsiX5bHtRTFbcnRiZsTCOr3h0nJQHQwc=
X-Gm-Gg: ASbGncungPL4F8ut4g3ua1pQiKWkE+e/x561wZMPtUHpWTY4BeNXnTnr+8DCegsTMER
	sfnLv3GVz2HMIK0IywgYDpx4Bn2dwxmL/JowK3GI99qbK0IofLa8fnLdE2ZSqgxolaHwBGtBEKy
	nEHnXdNbApsQCnOu8EpyQeVlioXhMNdSSauLwlErxpB4BBZp3TUiewJtW0kv3X36k3bEFWVk+6R
	TkTEG+jJz+MRh6Q4uICrHxUqT3ltlfqPocREMiwK69Z03cpTluZWIrZPr/qr4D7bGTCjcn2Ng5H
	fbmBtd+FLzDpR7jKq4ukX2AruotAnCpg7ereBdyTrhfW24cA9Cgo880XI2hjUDmV9L4PZkYBKad
	UgKygT3TOsbKZx+G4HeHDeQ==
X-Received: by 2002:a05:622a:22a6:b0:4b7:94af:2998 with SMTP id d75a77b69052e-4b794af2d57mr70829991cf.6.1758018578469;
        Tue, 16 Sep 2025 03:29:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFc/Zty3StI1tWgqDi2/Q43n+FRGSKUym0DsgirXM6iKjzPgKG47iW4ZaAI3syn3pqhogsDdQ==
X-Received: by 2002:a05:622a:22a6:b0:4b7:94af:2998 with SMTP id d75a77b69052e-4b794af2d57mr70829761cf.6.1758018577808;
        Tue, 16 Sep 2025 03:29:37 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62f3919e168sm4139507a12.34.2025.09.16.03.29.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Sep 2025 03:29:37 -0700 (PDT)
Message-ID: <40ff4fbb-1495-4374-b8ac-1bd4b2bb7463@oss.qualcomm.com>
Date: Tue, 16 Sep 2025 12:29:35 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 8/8] arm64: dts: qcom: x1e80100-crd: Add charge limit
 nvmem
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        fenglin.wu@oss.qualcomm.com
Cc: Sebastian Reichel <sre@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        David Collins <david.collins@oss.qualcomm.com>,
        =?UTF-8?Q?Gy=C3=B6rgy_Kurucz?= <me@kuruczgy.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel@oss.qualcomm.com,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
References: <20250915-qcom_battmgr_update-v4-0-6f6464a41afe@oss.qualcomm.com>
 <20250915-qcom_battmgr_update-v4-8-6f6464a41afe@oss.qualcomm.com>
 <vezlbc5onvmg3wd6tdr3cxhlvtmp24ca2e3vp6inqeegjhm7eu@viuurujdofvn>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <vezlbc5onvmg3wd6tdr3cxhlvtmp24ca2e3vp6inqeegjhm7eu@viuurujdofvn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=eeo9f6EH c=1 sm=1 tr=0 ts=68c93c14 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=x0UozUpXlkEbfjVD_VEA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 2zcX7L7tiggpourf7bBe1A93YROlsRDu
X-Proofpoint-GUID: 2zcX7L7tiggpourf7bBe1A93YROlsRDu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAzNiBTYWx0ZWRfX3b36cEivJ8yF
 J+41mNUlABhZlV0Kx3YjViV2/0YBra+8bxHlEsfDsyiTZTJkN6f7rI+MutkdesUEq7uM8x5lm7T
 cj6/GrAeA9C/QrXdE3h7srKf9i7Z+26ULmKZU+4msiODgCQD6d8QXKASa0OvODFkTirqdjQOqQW
 49f73xDq6VO78gj53pU+tbx5LY6jVh/5ZBUnTz1o+3pbtAu6+5UD+8+Y6w5CRqRkLbPdahJ7oNP
 C/ognM+9hOw15QL3jKtgNi2BKMqNsrUJ3NpTNP/A3E6T2PNP1ZXlsmGWbUxrj0Gz5WiIJn3G4A+
 FBvXviZ2ir6URZKd7GN9tLUgqRhLTQxazdCn2r+0jc68cjDbcKYhTvEvH9agdpZ7/jnOyqKQUbF
 jibLzdk6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 impostorscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509130036

On 9/15/25 12:20 PM, Dmitry Baryshkov wrote:
> On Mon, Sep 15, 2025 at 04:50:00PM +0800, Fenglin Wu via B4 Relay wrote:
>> From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
>>
>> Add nvmem cells for getting charge control thresholds if they have
>> been set previously.
>>
>> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on Thinkpad T14S OLED
>> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/x1-crd.dtsi         |  3 +++
>>  arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi | 20 ++++++++++++++++++++
>>  2 files changed, 23 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/x1-crd.dtsi b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
>> index c9f0d505267081af66b0973fe6c1e33832a2c86b..fee65391653ae9c2ee23f9f3954d9ed018c9aecd 100644
>> --- a/arch/arm64/boot/dts/qcom/x1-crd.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
>> @@ -82,6 +82,9 @@ pmic-glink {
>>  				    <&tlmm 123 GPIO_ACTIVE_HIGH>,
>>  				    <&tlmm 125 GPIO_ACTIVE_HIGH>;
>>  
>> +		nvmem-cells = <&charge_limit_en>, <&charge_limit_end>, <&charge_limit_delta>;
> 
> One item per line, please.
> 
>> +		nvmem-cell-names = "charge_limit_en", "charge_limit_end", "charge_limit_delta";
> 
> And here too.

With that:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

