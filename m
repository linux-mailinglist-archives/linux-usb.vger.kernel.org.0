Return-Path: <linux-usb+bounces-27568-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA63CB44B0F
	for <lists+linux-usb@lfdr.de>; Fri,  5 Sep 2025 03:04:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 60E973A70A9
	for <lists+linux-usb@lfdr.de>; Fri,  5 Sep 2025 01:04:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8FC31DE2C9;
	Fri,  5 Sep 2025 01:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lxnPFCXF"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C415F186E40
	for <linux-usb@vger.kernel.org>; Fri,  5 Sep 2025 01:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757034243; cv=none; b=UwUKTmEvxCQzp1makd4Wf5lZUNpJf1KcD3/q9l1b2+cqLot7E0De5bSl/lzqxt8x244WXKroga/w39BQj9mgKAzwKRICZ8Q3S1MOTyzPH04J4EquK8gn7uwtNbRDLsvHamwNwtnBEQNxJ+cVzkuWZfYUUk+lhzlFycDzbRCFOXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757034243; c=relaxed/simple;
	bh=E60oZCvVY2XQC5MKAz3hSZqG5cJY22Czhkp4QdVVK0E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U6jWedjtYnaISh2w1eZN4kwX+DeD/Y2CK3jm4Khap+sAF0dJebLGGuxyM2Qsa4opL3KSO11NKJJx0fYu3qNzM65OkI2bUwloj9Kzzc+Qw8YN8u+pZ6pbabKczLJnWSMWWlcLtxbaVC1afJmdfdFQu7hRuDPmIgZer/4SokvT0UA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lxnPFCXF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 584GFvix028221
	for <linux-usb@vger.kernel.org>; Fri, 5 Sep 2025 01:04:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9x/ZnBgm4svQLivjO5lFYu5fqyWw8hoi1jnTAaS2pOs=; b=lxnPFCXFMyLZb9AV
	X7ffLjgtvcqL2/6lLBrlZcUNg+kauiZcZo42GKmwsofn19Ry5flHl2HMRIR6P11H
	5r2PYbyEFe+WoS3bL5DpivX/ej1D/yLd4jWblkAuKqHQRxVBU+PN0ZerITKwbPq3
	Jzwg5izzv+6/NUywDnTNx3UI3iEr6VY18T/yFEqTYhRD9e0hu2GCbZ+v/rJDJ9ri
	mXyamNeHb+IPEuC7DKyobtiPNptI/RN2jS1CmPcVr6xPs7Uhn0xuQSwlt3ETZ1OG
	8DcXjD+TW9607Z75ANPR4g6GNs8Whx58d12fG4nnI1eRYXZu0gwSc1V8CUAeLXJ6
	B0yxvw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48uq0esfru-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 05 Sep 2025 01:04:00 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-24457ef983fso30244775ad.0
        for <linux-usb@vger.kernel.org>; Thu, 04 Sep 2025 18:04:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757034240; x=1757639040;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9x/ZnBgm4svQLivjO5lFYu5fqyWw8hoi1jnTAaS2pOs=;
        b=Owcgz76Lt7xtjc+2x9yvfRCbqPckslNBYqgFwQj9olEmf3L3Oj1V2JqBe99sy+ohfn
         yzNMWNa3UEkeBszC9emlMrxyo+7H4Ps2Kr269V8gGpNYHv0elXyFnzTNPs5HlD+P82Kv
         BgEMhf3iYxbMilWmofD/gBa0gK73LxRqSXac93vMRWFdjk5yGU+XfP3F4ycJiQvTSiBv
         XiufHswLjQDo2Mg6K3n2o0LRN5emfKOj3mf6aQRPxXBdaAH65Zg+nRhF+EjJgijZJ2T8
         HRmK1s9xVtplyG4kR8qSLfDRyKpsIkK4YXROUxnfOP0LnhMoLtQZDf82iihq9WLEply6
         Muiw==
X-Forwarded-Encrypted: i=1; AJvYcCUHtFhsT6uyOfLa/gEGIQug+LqS/X3rx9QFEMQZ2PIvcRZ+TeBNGAzV4n9/vjNmQATBw1l/80U/5s4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwlHheyBj+eaRQfTF1yEzI9ehwvmfJhJP+kgrNBf9nU1qmInh9F
	296l/1m7xyZGACdYpd+Z31V5CAmhYRf3O5OXHGPgOakTp4jSLDph7ovEYT3OLNLM11SmQY7c6bI
	RmrNnd7LByIvdG25NUGuMF8alZtQVnYro2cAFndd1q56MFkL7hggx3ila7VXo7pE=
X-Gm-Gg: ASbGnct1FOHx+on+0PC2h/fDND48YRVOkklBrwq76cgSVPpmm25ce58IX4yL3Q6ofM3
	T6VHKV5ophtHldql/O7Kva+DNCcWrF00JYyocMHK6V3AKNJPzuD1ndHfcGR0pig5tAn6tgFjamz
	qX5o88BvMMg+V0G3zjOSDonPOb2kUzbt3bsQ3xacfNqArKPRsIcUqGwCL0c3i58E6mIyUMJ09qB
	BJYUXxCO9Fqs0hOStBti2Q8p6iGbRK0WP0TDN5cgF9QGVJSGE7qkx3zeNbxsh+Oq/En0PD93QWd
	NdQKwNzUwVXocnq24E4ncZ01wX3sQ93UxIOibIRsaM+TMIZjuYsqXqteCCDHnOaIDl8cTl56mDr
	Z+2vuyK/+ImGjq4Aer91I6n5+6uRVZEej
X-Received: by 2002:a17:903:1a0e:b0:248:c96e:f46 with SMTP id d9443c01a7336-24944b81c37mr262422405ad.60.1757034239979;
        Thu, 04 Sep 2025 18:03:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE7PL5Q1tEpk5K+qxnrlMkRx3Zfh4Hi5/r47t4WUi+YB3Zb3IhsOhnnrsNU7IDSjiEHTamUJQ==
X-Received: by 2002:a17:903:1a0e:b0:248:c96e:f46 with SMTP id d9443c01a7336-24944b81c37mr262422075ad.60.1757034239485;
        Thu, 04 Sep 2025 18:03:59 -0700 (PDT)
Received: from [10.133.33.84] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24c8945d925sm58656885ad.36.2025.09.04.18.03.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Sep 2025 18:03:58 -0700 (PDT)
Message-ID: <af7cf6cc-d558-435e-b406-374ef92914a2@oss.qualcomm.com>
Date: Fri, 5 Sep 2025 09:03:50 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 8/8] arm64: dts: qcom: x1e80100-crd: Add charge limit
 nvmem
To: Maud Spierings <maud_spierings@hotmail.com>,
        devnull+fenglin.wu.oss.qualcomm.com@kernel.org
Cc: andersson@kernel.org, bryan.odonoghue@linaro.org, conor+dt@kernel.org,
        david.collins@oss.qualcomm.com, devicetree@vger.kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, gregkh@linuxfoundation.org,
        heikki.krogerus@linux.intel.com, kernel@oss.qualcomm.com,
        konrad.dybcio@oss.qualcomm.com, konradybcio@kernel.org,
        krzk+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-usb@vger.kernel.org, me@kuruczgy.com, robh@kernel.org,
        sre@kernel.org, subbaraman.narayanamurthy@oss.qualcomm.com
References: <20250826-qcom_battmgr_update-v3-8-74ea410ef146@oss.qualcomm.com>
 <AM7P189MB100958EDD985483DB1F32EC5E301A@AM7P189MB1009.EURP189.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
In-Reply-To: <AM7P189MB100958EDD985483DB1F32EC5E301A@AM7P189MB1009.EURP189.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 4IrEhhsh-7I-RVGIyhVpgmr6BqggK6Wv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwNCBTYWx0ZWRfX9aK8CFeCuL26
 o8PUuxZ9BCw3rgJnJ2+vzy8Li8kPSqER77Aue+hdLttE/0EYWKdGZ9gJGDBUMBe65/U1xdWoEeY
 m2uBzdx8OZktE/Kolnz9QXElwPLDelWgHl4mHGJLx0TCgK0cq/33D0nKxinfFUEC1xrCSvd8dlW
 beHpiJRA0AFMOmq7/DcborVj2hni0sP8zXgyf+TS5vm6Fsa7Xew3GJ/kTWX0xlaUA2UYGyghp2y
 wY8nyZ47ybhcXE1lHbxfbVGXSdwTNzZCWLqOk5L/NoymLYjvu1BpidyUzGk82i7uBOdhQznSKEj
 lQ/ttLYXRgErzh0HBnxoXO6oR+9iOBCaM+mZj/np1vjVHgz+WseEaJhYa7pREf39jmvhbdxT0lT
 Rrx/yPR8
X-Proofpoint-ORIG-GUID: 4IrEhhsh-7I-RVGIyhVpgmr6BqggK6Wv
X-Authority-Analysis: v=2.4 cv=ea09f6EH c=1 sm=1 tr=0 ts=68ba3701 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=065pQyBIx5i4jwDuaBsA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_08,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1011 malwarescore=0 phishscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300004


On 9/3/2025 4:41 PM, Maud Spierings wrote:
> Hi Fenglin,
>
>> Add nvmem cells for getting charge control thresholds if they have
>> been set previously.
>>
>> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/x1-crd.dtsi         |  2 ++
>>  arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi | 20 ++++++++++++++++++++
>>  2 files changed, 22 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/x1-crd.dtsi 
>> b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
>> index 
>> c9f0d505267081af66b0973fe6c1e33832a2c86b..8c3d30dd936ef9b12867971f5f237dd12484072d 
>> 100644
>> --- a/arch/arm64/boot/dts/qcom/x1-crd.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
>> @@ -82,6 +82,8 @@ pmic-glink {
>>                      <&tlmm 123 GPIO_ACTIVE_HIGH>,
>>                      <&tlmm 125 GPIO_ACTIVE_HIGH>;
>>
>> +        nvmem-cells = <&charge_limit_en>, <&charge_limit_end>, 
>> <&charge_limit_delta>;
>> +        nvmem-cell-names = "charge_limit_en", "charge_limit_end", 
>> "charge_limit_delta";
>>          /* Left-side rear port */
>>          connector@0 {
>>              compatible = "usb-c-connector";
>> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi 
>> b/arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi
>> index 
>> c02fd4d15c9649c222caaafa5ed2c777a10fb4f5..abf7afe5127d7b8b572513234e00009ce837837d 
>> 100644
>> --- a/arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi
>> @@ -239,6 +239,26 @@ reboot_reason: reboot-reason@48 {
>>              };
>>          };
>>
>> +        pmk8550_sdam_15: nvram@7e00 {
>> +            compatible = "qcom,spmi-sdam";
>> +            reg = <0x7e00>;
>> +            #address-cells = <1>;
>> +            #size-cells = <1>;
>> +            ranges = <0 0x7e00 0x100>;
>> +
>> +            charge_limit_en: charge-limit-en@73 {
>> +                reg = <0x73 0x1>;
>> +            };
>> +
>> +            charge_limit_end: charge-limit-end@75 {
>> +                reg = <0x75 0x1>;
>> +            };
>> +
>> +            charge_limit_delta: charge-limit-delta@75 {
>
> I think this is supposed to be @76 given the reg property below and 
> the other ones above.

Thanks for catching it. I will address it in next patch.


>
>> +                reg = <0x76 0x1>;
>> +            };
>> +        };
>> +
>>          pmk8550_gpios: gpio@8800 {
>>              compatible = "qcom,pmk8550-gpio", "qcom,spmi-gpio";
>>              reg = <0xb800>;
>>
>> -- 
>> 2.34.1
>
> Kind regards,
> Maud

