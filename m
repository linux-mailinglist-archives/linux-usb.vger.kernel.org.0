Return-Path: <linux-usb+bounces-28493-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B0744B93C89
	for <lists+linux-usb@lfdr.de>; Tue, 23 Sep 2025 03:04:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6D9583ABE8E
	for <lists+linux-usb@lfdr.de>; Tue, 23 Sep 2025 01:04:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7178C3A1B5;
	Tue, 23 Sep 2025 01:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U2g7pwnx"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D96C17A2EB
	for <linux-usb@vger.kernel.org>; Tue, 23 Sep 2025 01:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758589440; cv=none; b=SKf99K2518p5TFWWBgb/xyyg2c7Au4TNYS1jeThvvQnxJWqd+vZTIsiPROdfpdpWuJ/HGyHYTGPZUcxEzLDJdKzwutz3bUtZXPqms8EieKpt/xaz1BUhW9ImWxP/vxwwPIKSamxRicUPU7p6ar5Z3mSqJoQ9qQIQK5BkN1fruKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758589440; c=relaxed/simple;
	bh=AkmFWqZWKDdWgx+k3IxAC0AsHW+/Je62e22sgXDU+2Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NAlPiEaZmtohPMgW0t4cmhp3APpgn6uyPxEGZS8azGbnkte8iVx8NMMmN868BuRmMxKBgTRnPh8if69wUZ5u8WvLlZzspWpDMqto6mhCAHuxEW3IbU+z0BZxdh2bqpxlPeSC0HRRkzMGGEe2jr2JaRpksWcEvCsSfDoDmNe2fxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U2g7pwnx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58MIjTgJ022699
	for <linux-usb@vger.kernel.org>; Tue, 23 Sep 2025 01:03:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3r2gyH2o9KM3Y4VR/nSiqz6V1kwzJFKLhM9PNywxZ9M=; b=U2g7pwnx7X8Zkxz2
	z+R+FuWVj9i6fTjNhzSitDitg/0dKOsNgygJTVMxGczOSmW4fa/yp1tuZTSf09FV
	geRntp4WiiFIei/DNOpNVcvDXmvNSQSZYkjWFgKioptWGMniAb63x8pXLKrDtVLf
	UPBah2saDNqTLVn6h1RxHyuRa8ePxH6aOkXSpHospDU719xiWAK/mw8jZIafmXmp
	J6gZeOpKqxXfCMGp2l9wZb4Fsl2hl5vOnbU23h/Uzy/9k2Hq8wgvNeL1kpssCtFn
	T29DoN5oVUhwUJRkdd2l/zNMMyWbCDcVWHHNSu7ZUQuxO+14ZYvNKZcOOOYjJMuB
	vAXjrg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49b3nyaebn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 23 Sep 2025 01:03:57 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b54d0ffd172so3949807a12.0
        for <linux-usb@vger.kernel.org>; Mon, 22 Sep 2025 18:03:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758589437; x=1759194237;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3r2gyH2o9KM3Y4VR/nSiqz6V1kwzJFKLhM9PNywxZ9M=;
        b=O7XG8xinJyiB3SBD5sHbfsoB2hyLcQGtsLMmbQf8NdAqAXWRdhoECfKCzFMYg/K45U
         vaLehcX9exc3UFD4XGQhNf7R1SzYKJh1SgVG9avQL+JUbMd7vrH+dUhLnBBEMgc0MNf4
         k0wHMlKGryFZZ4uxeskrvsKUKW4AjrfWnJMU3P5OnGcTg3Rkl/gvtD/wI3k9Ew040x+D
         gyIuRko5DEiO/oclEmgGhmXWQDv99lpuFvbd3dIlb2CQfSrz2H3IMl+boAHP6TUEPxDf
         KjGHGROnatGL80NcLQrA5dt1y+dG8viasH9FtgEOuUJeEYUPaslWHnyt3vusX5aUBWmZ
         vgNQ==
X-Forwarded-Encrypted: i=1; AJvYcCVprG6OSdWUj7T9soKd5AMYojMM6tLp4uHVsy9iNwYbPSoI+buMlJYSr72vEDvqgoAX1dP305dTn4Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOI03z8tziM+2wJGEPzdJsIgzQ6VlwayAcoOYyOo/YDA0IL3Gc
	BBDBcZ6eaOla02bysyijLzBFbmutM3u7JpHVb2CDqeceD05q5HYiwchpjMAU/vmHx1DkZoskDe0
	TKhFkQhY4K5Uegkv7C080v50nFM38WKYkjifPPPBAqIjDrIvVVeoLD4N6Il/Uw5c=
X-Gm-Gg: ASbGncvjegUqDPUb5M2diad4x3EAerR+toPlvv/eVSwEgLEmiD1r30KM7RtBKrRFmlj
	96RbgMD1kKZIvF+1v8Yu1g0zlxIQRRAj5C++QMhY8BiiIg0Za9sb1SrbwL6OAXP+nCaqjYtsCD3
	K54ovky0bEC2I2RMId65mD/0X2hN7VKa+UMF3rocyEKlRy3vhEJ8xGyqAOzKq6UR8RO2SwCQlkH
	ZrKb0M2zhaGUOgNAl2Fc+MOKPYpIxBbh0Uramey5CqbSQ5yYtlZtJNRSNdqAYvRai0H7nm6C092
	8fgPSKaAu+FFr4V4Ymz6K4q31aVTF/Bm4Q5uRfP0mH4PGF8hcxVE0jmdy0MxSYk4tSGX8o0RUfb
	CrcS/F13sVsNCG2CNIfDknujVKnFzVZ0=
X-Received: by 2002:a05:6a20:a10f:b0:246:3a6:3e47 with SMTP id adf61e73a8af0-2d10ea02f65mr823602637.12.1758589436712;
        Mon, 22 Sep 2025 18:03:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGZu5szyIQ3+/h2P8RAeWjsUwtJhLpq8SVRmJe1NhdUsMWX4SpcQc49bQMtqaOjrR0EYSzmzw==
X-Received: by 2002:a05:6a20:a10f:b0:246:3a6:3e47 with SMTP id adf61e73a8af0-2d10ea02f65mr823558637.12.1758589436149;
        Mon, 22 Sep 2025 18:03:56 -0700 (PDT)
Received: from [192.168.1.239] (syn-075-080-180-230.res.spectrum.com. [75.80.180.230])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77f2deca77asm5515903b3a.98.2025.09.22.18.03.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Sep 2025 18:03:55 -0700 (PDT)
Message-ID: <95c59ba6-fd9c-ef59-c5c5-33cb2fb5db8e@oss.qualcomm.com>
Date: Mon, 22 Sep 2025 18:03:54 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 9/9] phy: qualcomm: m31-eusb2: Make USB repeater optional
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, kishon@kernel.org,
        vkoul@kernel.org, gregkh@linuxfoundation.org, robh@kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-phy@lists.infradead.org
References: <20250920032108.242643-1-wesley.cheng@oss.qualcomm.com>
 <20250920032108.242643-10-wesley.cheng@oss.qualcomm.com>
 <umoo45pmamr3qraaiommpqh37tgmqidylmtjh3iamlxs34s7wf@ouug53aqvdfd>
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
In-Reply-To: <umoo45pmamr3qraaiommpqh37tgmqidylmtjh3iamlxs34s7wf@ouug53aqvdfd>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=EuPSrTcA c=1 sm=1 tr=0 ts=68d1f1fd cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=agQD+r7xwyS+FYqxhQjztw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=2H1wgwkl3dmy4IbtCtkA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: W4ahlBN3KaZ0PIf7UuGomQQC156Aj4kI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDA5MCBTYWx0ZWRfX0TaLNG8jEppq
 SyXzB0KC9rM4Cvc0iOnN86KETAPh/7krrU7caOg8T7pI04pq+L3bZdwLwyF2Jg5iKwLzxBxqnp7
 YRJvNgx71AYe9dBB+E50s4f/syElpB0mcScn617hIvPvaGphVqFMkIZkshakMrRslF+w+/JBeIb
 POi3qTMshF4Wkx25LoKYUXaA8Hpm0KR+FXGruDXjHP/MbnFuOGdYN9RnXmjFbeHExf5ZP7lfdXW
 52BzaXJM6tRexWIvW6GKL0jIpO0byZdIqRZXxC5fl/TzF91MK2xR89qURqUwZlqvohCCkAaYVFQ
 c04JxNKcV/mL9kM05/wWPuNooAwo1Px86FiH9O46c1q3Rd2I4y5COqMHaNddgeDr/ZxqEURtXzB
 9JNaa7IA
X-Proofpoint-ORIG-GUID: W4ahlBN3KaZ0PIf7UuGomQQC156Aj4kI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-22_05,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509220090



On 9/20/2025 8:42 AM, Dmitry Baryshkov wrote:
> On Fri, Sep 19, 2025 at 08:21:08PM -0700, Wesley Cheng wrote:
>> Change the notation of making the USB repeater a required DT parameter.
>> Issues were seen when supporting USB2 across different form
>> factor/platforms, which led to enumeration issues due to improper eUSB2
>> repeater tuning.  By making the repeater optional, for SMB/QC PMIC based
>> repeaters, it can utilize repeater settings done in the bootloader,
>> which cover a wider range of platforms.
> 
> No, please don't depend on the bootloader settings. Instead we need to
> implement proper prgramming / tuning for eUSB2 repeaters
> 

Hi Dmitry,

Will update the next rev with the entries to support the SM2370 repeater.

Thanks
Wesley Cheng

>>
>> For other repeater vendors outside of the SMB/QC PMICs the repeater
>> should be defined and managed within the kernel.
>>
>> Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
>> ---
>>   drivers/phy/qualcomm/phy-qcom-m31-eusb2.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c b/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
>> index f4355d38aad9..b8ddadf78c53 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
>> @@ -285,7 +285,7 @@ static int m31eusb2_phy_probe(struct platform_device *pdev)
>>   
>>   	phy_set_drvdata(phy->phy, phy);
>>   
>> -	phy->repeater = devm_of_phy_get_by_index(dev, dev->of_node, 0);
>> +	phy->repeater = devm_phy_optional_get(dev, NULL);
>>   	if (IS_ERR(phy->repeater))
>>   		return dev_err_probe(dev, PTR_ERR(phy->repeater),
>>   				     "failed to get repeater\n");
> 

