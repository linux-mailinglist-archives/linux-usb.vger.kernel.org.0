Return-Path: <linux-usb+bounces-29425-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CAF8BEC293
	for <lists+linux-usb@lfdr.de>; Sat, 18 Oct 2025 02:20:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3CB183A4DAC
	for <lists+linux-usb@lfdr.de>; Sat, 18 Oct 2025 00:20:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4FD186352;
	Sat, 18 Oct 2025 00:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MXPI+bT2"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B69A83597B
	for <linux-usb@vger.kernel.org>; Sat, 18 Oct 2025 00:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760746833; cv=none; b=rjU72fi8rrIOQKyDtFwsUtRJWs+BtUc+xd0nncc6ingo/zg4nAEiztZu4ZNpQkAsIDKrO2EBuYyxxOYYBZffMzB0XfwEbZCpVlDc7HgHJ2GcsAz93V74Z5DVp+Azieq3fHImKDVv0Iu8JGHaGK0CidaPbYsH9ZO4Dd8vyvjmHlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760746833; c=relaxed/simple;
	bh=WvLGMq6zaEqJpDFxOd0WICtejDxrRPkTC0W5GIZXWRg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ggUm1eIzNYhaONFAySRfFn+T+UK5v9zcIUipcPG9CUlqPOFXDEPzup4+axsVr+RTkffFJqcwcPs6N7FUPH/Iyf8wACruXn+Ls6CpOO+NxbcxPRSGDx4a0JxBLSGosgEdnpnJ60D8aCKbqd7q1/9575QSR2+flYr8TNpayyXJ19Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MXPI+bT2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59HJGwno004149
	for <linux-usb@vger.kernel.org>; Sat, 18 Oct 2025 00:20:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DjsyPZCjZ7kk7o9g7SmG+YtODp+fuqqn2GA/QpUkm0c=; b=MXPI+bT2vhUKjU85
	seAudb4lWbh4zhIYJ4n7mtMLncvAGQy8hEB7AhZh4ouq/KGyZ9aHN1JbfAGLrdVw
	oS7PK7FhCPB0WeiR469ssPCk0xAUOqdNLnLmWBb7CSpTJhDH7fMYcaBtqFHtI1Yo
	sU8wdD9Wr/IY41E3KsiOvIeQr3trmAyhp5EOu7zVQe1SVV46xgHAkTshcpI/K0+M
	YYn0Daz8DLAnXxDpFwt/ayik4CnQ79u9nzUYbaRnK4GZPlQLhuJJAmQoVsBrYe6V
	5NqccF0tXQgtcSlCTiJiVegzQHZoa/hBV3rCdVBj7SZ93XQkVe1zV/EE4LEm3VAr
	teVRDw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49rw1at932-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Sat, 18 Oct 2025 00:20:30 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-290d860acbcso28513225ad.1
        for <linux-usb@vger.kernel.org>; Fri, 17 Oct 2025 17:20:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760746830; x=1761351630;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DjsyPZCjZ7kk7o9g7SmG+YtODp+fuqqn2GA/QpUkm0c=;
        b=K7qT25zaDoZtxH6tb/LwI9x/9wFVvLnkyz5JIO+QWpal3sWV3IOk7TXEbwmMGlWKQl
         S9iIOFUM7PHhtmgkdfoTA57Q3EOdliiumfT/MItlkjg6Qg5+K44UFg/b2GXMxVmo/IoV
         8GHgdo8o05aeaaUoLhYBujr8yWoYCXUJU66o+nWLJybNIjYTSM6CEqhzii0NGT2inWPW
         Xx63Qwh5LzsAcBdyNH46JNkYOk2J6Mv58C3OFyf/xHZIiWt9niPucRfrhK8v9aBk5pz6
         9wOGeEO8TX2eTsG3uV8s7aQI+xCDQi1yWgPno9rwEwKFr0/54WtCJ8KX2z4gD06zz4FE
         MnYw==
X-Forwarded-Encrypted: i=1; AJvYcCUC0B/5LR+gkeemYjnS5muRwTz/PcJ7AFwb6YzMqaMSPbwrlL1Fn8ciffQNgUNnUT8h9HhuobslTso=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAJ2EvoXZGBhnLpwiVFZ5kkdTg96b1pG/UW2JWX/Y3XA76bxi5
	aZcZiDtzetySXNTA2Nx9TqqIDlIROBzJxX5j+91AwCCYck2z0SE/b80vMszK0JUqPyGdWmgch6B
	LQbDtog383o8qqHayMbktBlRtfP3TuDxP2uqeYrFcs1CYUPw5tKqcwB6O+S8NPtA=
X-Gm-Gg: ASbGncti4Cq6JGJrTJgWJZnmakKQ+eI/bPH2DODpYSvj7tECTAG9bvo8sqz4zlzYAfD
	5RArbwLlb7Fi1deko5m6UfwT4Fm18X4nmadsDIa6rII8bZFtmfWVaoBsy0vh6or5BI25SM9VdjJ
	P7Ab48iiEXTzoKWAqwGECkNrvKvnLzxya1oAaMZHi1Bne7wDq1B3JkuSfIIIWr2V9u865I4bi13
	GAYAIQ28Gs+N9Rq2bp4haDz0VMzJwHEXNoIVvMPMassccKgybou7Gw/jKwzGZgO48ejm//ztQJd
	6lcgTVh8dHvjq1KMMLRizpn2d79+JJ2sapbeEBjt5PfEHm/ixzn5cWRj442jgSePRfwRpVLR1aK
	Gr07FLSsOr26C6gWdIPxX6uQ/eNWowhGjUHQnd7AH
X-Received: by 2002:a17:902:f691:b0:278:bfae:3244 with SMTP id d9443c01a7336-290cba4382amr68119115ad.54.1760746829975;
        Fri, 17 Oct 2025 17:20:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFh0Fb6P08hVeeiHZb3EJs27ayrDuP/pdtr+A0nVEst6kPRjwP0b3hwHB5SCbsS0Kix1+iX4w==
X-Received: by 2002:a17:902:f691:b0:278:bfae:3244 with SMTP id d9443c01a7336-290cba4382amr68118775ad.54.1760746829523;
        Fri, 17 Oct 2025 17:20:29 -0700 (PDT)
Received: from [10.73.53.19] (pat_11.qualcomm.com. [192.35.156.11])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29246fcbe80sm7840285ad.29.2025.10.17.17.20.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Oct 2025 17:20:28 -0700 (PDT)
Message-ID: <da34ecf0-c2eb-2afa-bd4d-9dc30fbe5cf5@oss.qualcomm.com>
Date: Fri, 17 Oct 2025 17:20:26 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v5 02/10] dt-bindings: phy: qcom,qmp-usb: Add Glymur USB
 UNI PHY compatible
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>, krzk+dt@kernel.org,
        conor+dt@kernel.org, konrad.dybcio@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com, kishon@kernel.org, vkoul@kernel.org,
        gregkh@linuxfoundation.org, robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251006222002.2182777-1-wesley.cheng@oss.qualcomm.com>
 <20251006222002.2182777-3-wesley.cheng@oss.qualcomm.com>
 <f5e4ae02-b8fa-4406-b2e0-3602b07b7e23@kernel.org>
 <00408896-2e25-2dd1-6e6e-2195317ee7fb@oss.qualcomm.com>
 <14bc2a85-0f1d-3834-9b9c-32654348603a@oss.qualcomm.com>
 <387c707e-613d-433b-a76d-16ef10dabc59@kernel.org>
 <2a70f878-269c-1b40-2e8c-77b5851de9a1@oss.qualcomm.com>
 <99ab26d3-eb44-401d-8a7c-1d9efd2a1a10@kernel.org>
 <b2b68430-5127-5eca-6bd8-4af31eb9fbed@oss.qualcomm.com>
 <bb299df0-58b9-4a6e-9625-305785d38eb4@kernel.org>
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
In-Reply-To: <bb299df0-58b9-4a6e-9625-305785d38eb4@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=K88v3iWI c=1 sm=1 tr=0 ts=68f2dd4e cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZdW6uxA9NKXbfdqeeS2OGA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=JAPtGALJ81qCqeSEnE8A:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: bMNArVhPzEgFBBifKFmengkWULI-_Slo
X-Proofpoint-ORIG-GUID: bMNArVhPzEgFBBifKFmengkWULI-_Slo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDAzNSBTYWx0ZWRfXynWqwcszxySl
 fsh2+FLzjm/JY2VQOvt1odRUo62mQw7iANJpE2w5IyCgTdoqiucjulrZtDnmn/Xb9EHqatbeXTu
 0QQPZFqAwau5apDhwbYWLuZ8m7IBwrZ3FFUQOutXPBSITh+ffFTVH0X6AvICiuws5OyTuDXjftb
 8Oy1l4AFrFeLWDEu4TQ9eNUeGZDnqwwMUOO26kUyLmC4FbhAgSEQhmlwuYMv9R03vodlx5KF4ml
 b/U08BD8vznpGOI1nq1QKWVuTp9sScWUYNuw4imKY+wB+yqp1msx9nd6oYiHfDFgXEm+yl7D6dn
 6TI3v9KvLdxOnA4nl0dSw1bsHFzSjO5WtvN1/rOYx1AacBiHsTuh/KS8nHwlJUiSatwFKDdxVht
 ZI7tPGXCk68ArlF5xZXTnpGg1TqqAQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_08,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 adultscore=0 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130035



On 10/16/2025 9:41 PM, Krzysztof Kozlowski wrote:
> On 17/10/2025 02:15, Wesley Cheng wrote:
>>>> Technically its all handling the same clock branch (CXO), we have the
>>>> TCSR clkref register that allows us to gate the CXO to the USB PHY, as
>>>
>>>
>>> Ah, exactly. Then clkref is not a clock. You need rather proper clock
>>> hierarchy.
>>>
>>>> CXO is shared across several HW blocks, so it allows us to properly
>>>> powerdown the PHY even though other clients are voting for CXO on.  Then
>>>> we obviously have to remove our vote to the overall CXO, so that it can
>>>> potentially be shutdown.
>>>>
>>>> Maybe we can rename it to "clkref" for the CXO handle and
>>>> "clkref_switch" for the TCSRCC handle?
>>>
>>> Naming is better, but it is still not correct. This is not independent
>>> clock signal. It is the same clock.
>>>
>>
>> Hmmm... I guess that's why I kept the same clkref tag, to denote that
>> its the same clock, but one is a switch/gate for it.  Would you happen
>> to have any suggestions you might have that makes it clearer for
>> everyone to understand?
> To me it looks like:
> 
> |-----|            |-----------|           |------------------|
> |clock|------------|TCSRCC gate|-----------|clkref to this dev|
> |-----|            |-----------|           |------------------|
> 
> So you need proper clock controller for TCSR (TCSR Clock Controller, in
> short TCSRCC, what a surprise!) which will take input, add gate and
> produce clock for this device.
> 
> Nothing non-standard, all Qualcomm SoCs have it, every other platform
> has it in some way.
> 

Hi Krzystof,

Yes, the design is exactly how you outlined it above.  How about clkref 
for the clock and tcsrcc_switch for the clkref switch?  That removes any 
notation that the gate/switch is an actual clock...

Thanks
Wesley Cheng

