Return-Path: <linux-usb+bounces-26327-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB72B1896D
	for <lists+linux-usb@lfdr.de>; Sat,  2 Aug 2025 01:27:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9DBE83BB3EC
	for <lists+linux-usb@lfdr.de>; Fri,  1 Aug 2025 23:27:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 404F228CF70;
	Fri,  1 Aug 2025 23:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KG8ggaha"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F8C2238157
	for <linux-usb@vger.kernel.org>; Fri,  1 Aug 2025 23:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754090832; cv=none; b=uvqeW2C9m8sKotSXfHRcSb8ByX3Zml0Lu2AiqzHk9C/MW60AlidtLGYjfgDBoMVlKOAjG9CTtZwgyRAO6tPTJ4jacM7954U9BPACQPz6nCuPvw+HQ/jULZRVea+9RaIrw3c9V2+zloBj8dMsrKQA/UqPjO+YNJDiep1mcXKGinQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754090832; c=relaxed/simple;
	bh=5zD2wU0RPedSB71xOIG2wO/sVyEkf/oGBni2oquUu7E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P6MUfWmmKka5y8tdHE0Gamku6iE6qpD3oVMsblXUiCst0CdmZm8aVEdUIPjn6r0uiB9pgHRXyHRJQZLxN4z2t36yck/POxhkZzkxIGYxP8l5NlUY30owRX4NymWregcivcE1qeUgELsci1hGC8xiCcHVhBLoyRJjbE70Gn54tXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KG8ggaha; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 571Lfe9r020607
	for <linux-usb@vger.kernel.org>; Fri, 1 Aug 2025 23:27:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a4iwmGaik7FqRWxLvl/RYLwX7bMNVlJbG3lnXv3lDsk=; b=KG8ggahazOlKfkrC
	h1/JP4JFgeXGN1oNnvOGbsbH1MAxLqSXxn1NMWvcY6tfzZMZyXpapwxna3WQh8jE
	Wy7xd7qfIw83BnnGZ/XDMCxBtYIHni+0bjDdPJMQc+ssPi1tXrfr9R2NYb4zSF4o
	LzjP5osb9NgW0hJReKl9KAd6DB09d9LpMeX1IA5srt/k7reN2cJe4lp4hJY2Boa6
	jNlNbFXJldK6bEMopFHyDtu/74JjnCaTxTk8O7T2rrafbbtJnlDATtsMIdAhb9ZJ
	OEYHDTCjjfOVP0+arLMw37tevRMCM36JY33EOYJ47j3eyMCFnyN6WbgfA09xaV2i
	42RlRA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484nyue2uw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 01 Aug 2025 23:27:10 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7641e7c233cso2401301b3a.1
        for <linux-usb@vger.kernel.org>; Fri, 01 Aug 2025 16:27:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754090829; x=1754695629;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a4iwmGaik7FqRWxLvl/RYLwX7bMNVlJbG3lnXv3lDsk=;
        b=evNVOJwqARQ6NgxYGNT27sEyQNR9zhcBtmRQMVZ2NYPKeRZ/0nk8VS4qPQHdBSDy7T
         MSsv+x3aJO73IhjYEGOU8E/GKBwnKEB9h/skR75tio36S03pLdgkUjprrpzAutdeKpgI
         SIfGYfVxwx+YRl+1HMC4ZxnNEvYukeLKabpSEdDJwKVt1PlzW3axVJOVKj+QFWFmFcSZ
         aHqVjn6qA/ORAFf5Bv/LWq2TFzxqG/e/P3mXuyBhsonpCzUQW6iP049+1tmNNi65ohWN
         xxGdgf2MZbgdShYUwHYP/wIyHIROrYH2LllIsqTTbJodlHxeDa3JMNNuDFA3P4WgfmT5
         N6dg==
X-Forwarded-Encrypted: i=1; AJvYcCWaVckPQdn0G08sFX2ny3KgG7BDrWi+/VrTnNt/9RhHcJQo9DNwmsRZkY6x/+GGoL2K5Fo5a/GJQbw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwymrZMdc2MqG7GIm38hvebjbW8BUtDu6Ee155c/lrpfqc567by
	ZQVMFh4BFPk42HDdxocotuSY+mpilxe8P3ekOteB0UcUq6uK1KITqQ3hflWnbbzG//umh+9vO2r
	AV07IvxrX5L2gcQj8bmgB9xl26X1IUV1PW0t+43EznIZ/s0CfWGcQK7D03L/esfE=
X-Gm-Gg: ASbGncs047jEp04hMxFHNDxBvA2LZLxn/ZPXgffrJSdryVWpW+7bvJMEMaQG+hXG1B7
	9F8KrZZA6pv1xqzsyVPBv2yW6+5E4U5FHTp+uA2Ir4QLoG7bqd05LJDqvj5uPm0IJ88TchtS2J/
	tVyUJ/uyECeMbB2lliBJLC58O0FaeRDjDr0I8lJna3iRgFksUd01epC87y1oMY41Y8rZAzQDjAN
	SDLvfc+eWFo5gdeP9yh9vg0iqJ1OZlkvX0F6qHeN5PG6ikkpPwxHUNrbx6QNYy+ZoY5gG2R1EHB
	Xu8aW15XVr9ZfvqSNHpbp4MfGLjRVA+uSytq1rIs8rFPECDbwk/A1NJh6PhUGva8L0R7bWK3aF6
	m4TsrhPsLogaBpXqsmXPTHK3sBU6WfA==
X-Received: by 2002:a05:6a00:88d:b0:749:4fd7:3513 with SMTP id d2e1a72fcca58-76bec4c5440mr1401694b3a.16.1754090829191;
        Fri, 01 Aug 2025 16:27:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGru+DQkMQeTX4Aq4nDQHiVYbj42cjgkZZ7g48nRXf2BhgxKbCqcIJO1LIRLpdO2wrIjqiEXA==
X-Received: by 2002:a05:6a00:88d:b0:749:4fd7:3513 with SMTP id d2e1a72fcca58-76bec4c5440mr1401668b3a.16.1754090828736;
        Fri, 01 Aug 2025 16:27:08 -0700 (PDT)
Received: from [10.71.113.238] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bccfbd174sm5037659b3a.63.2025.08.01.16.27.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Aug 2025 16:27:08 -0700 (PDT)
Message-ID: <b0ad575c-068f-4f39-b086-c82ef6bad120@oss.qualcomm.com>
Date: Fri, 1 Aug 2025 16:27:06 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] usb: typec: ucsi: ucsi_glink: Increase buffer size to
 support UCSI v2
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org
Cc: lumag@kernel.org, neil.armstrong@linaro.org, johan+linaro@kernel.org,
        quic_bjorande@quicinc.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20250716005224.312155-1-anjelique.melendez@oss.qualcomm.com>
 <697bb6b0-ecca-4392-9e7c-8d4ef75ec96c@oss.qualcomm.com>
Content-Language: en-US
From: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
In-Reply-To: <697bb6b0-ecca-4392-9e7c-8d4ef75ec96c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 4GdAr5ewtbTDsNMpqhldRFSJ_aFpw2q9
X-Proofpoint-ORIG-GUID: 4GdAr5ewtbTDsNMpqhldRFSJ_aFpw2q9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAxMDE4OSBTYWx0ZWRfX/vQnzkVfBQkY
 0w9hTLG/coM8NfdHDjcKUwONmYt5CFjHnWxdo2SW+UOmFG1MBPi63a6MkhHn+8n1n7cn+CnIfuZ
 2qppalt0rl++GL8qK4xBf0R9fmu7tn7EzALzavY9T9cJhlX/R6P9p/Wvq+Vm/tWp6v88uYmnNaN
 oWDmSgGE2vbVR5f43DfY23Oi0nkdHbZtTLAtgJxpu97opu+Ud5Wc28D7oGO0WfoW8E4XyVdcV9V
 c7j5GQ42M1IwyIRV+feKedL9HDKMwG0uJmwf0Q42b3EwMV73htfL3M/ap1dQ75sE60JnX1bRnFV
 smUVmw+Joc1k4Q9jeHhNrXCl40y0ryT7xLv5EhkcXAQm66JmxWoHFeJ3tNg04Diys6saXrynXU/
 WTu8XwzeYFzsRzdo6ASbck9fKRAGCIu2zCZHP5w9Ud0ncyUGd1fmsxkCKugWawFxN7SRLjpl
X-Authority-Analysis: v=2.4 cv=CLoqXQrD c=1 sm=1 tr=0 ts=688d4d4e cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=JTuwudAkkWYWUMqqoE4A:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_08,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0 suspectscore=0 mlxlogscore=407 spamscore=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508010189



On 7/16/2025 3:44 AM, Konrad Dybcio wrote:
> On 7/16/25 2:52 AM, Anjelique Melendez wrote:
>> UCSI v2 specification has increased the MSG_IN and MSG_OUT size from
>> 16 bytes to 256 bytes each for the message exchange between OPM and PPM
>> This makes the total buffer size increase from 48 bytes to 528 bytes.
>> Update the buffer size to support this increase.
>>
>> Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
>> ---
>> Changes since v1:
>>   - Defined buf size in terms of other UCSI defines
>>   - Removed UCSI_BUF_SIZE and used the explicit v1 or v2 buffer size macros
>>   - Removed Qualcomm copyright
>>   - link: https://lore.kernel.org/all/20250624222922.2010820-1-anjelique.melendez@oss.qualcomm.com/
>> ---
> 
> [...]
> 
>> +	if (!ucsi->ucsi->version || ucsi->ucsi->version >= UCSI_VERSION_2_1) {
> 
> You mention V2 everywhere, but then check for V2_1 here - is that
> intended?
> Konrad
ACK - Will update to check for UCSI_VERSION_2_0

Thanks,
Anjelique


