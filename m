Return-Path: <linux-usb+bounces-23699-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 48440AA8E97
	for <lists+linux-usb@lfdr.de>; Mon,  5 May 2025 10:53:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2A4DB7A166E
	for <lists+linux-usb@lfdr.de>; Mon,  5 May 2025 08:52:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA44C1F4C98;
	Mon,  5 May 2025 08:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RDDRTj/P"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58D881F4161
	for <linux-usb@vger.kernel.org>; Mon,  5 May 2025 08:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746435204; cv=none; b=qegjbOEQhJb/Q/GXRJv7JNyTFuFCgjNyj47DCvXBFL/O1toy2OJm5rV8HUOIEbzOgkZQHg1J0dU8eetLJHNQ0qTFgyVxPhaoRgTaor4lQVIo3CD6CFtYp3qE9pYbogVGqE2U2rTS1uxKH39PL4FisAL5zVNpRhtB2BFJ2d4h2xE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746435204; c=relaxed/simple;
	bh=3V7mXQkqusUJxPTaULdgN7N4RsGfThPFdi67rP85KI4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LhKdG9QHKYneaIEhalAIx9zQYoDmOcmspvR3loAEWKPgZVmdjvBv/wUNDbJnQaTe1e+dsCuc2yoO3bkXJSL8b2lzba7q5xT6RnNmaWGLV5Ze6ZxRP9TXTYDrf3ZK+X/Gs03Mx3flIIyo+RhjHfRhHqh3MN2X90YRvJfx9xjzk+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RDDRTj/P; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 544NDUme003852
	for <linux-usb@vger.kernel.org>; Mon, 5 May 2025 08:53:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v6VpH5xOzWwfp/Va7n+6OXQkDHL7XlzYMiA5RiMqeaM=; b=RDDRTj/PiZfas4+6
	QVnL/iGF5DvHLe1grO0paf4qzETppECgZveiogKiRW5N+KCjUHkvwqJSTGLM3Znj
	lI8Jp7D2V5fukIS9xk5Qvgda/Y6H0tT2Mq5H2xYMfnKgzkH1dDes08AjGgbr5kWw
	DdPVkFyC5VqUCpfrxJSt6CWNSfw8Xu6jCtJ8RRE9ppWRC/DFT+8m7jH2MbViHGnr
	g4+XMweADuwbLugfWsfzYFUfpUuddPjMdDyWVpLcwSq6NO8QksTjlj9PdHWUk89C
	waTPi1n/DPRKXFfbLpO4ZZr/3dphkYSnJBltDGjPbHj6NT9fOhJiZR+O4a4ia32j
	Q5kATw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46da55ujwy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 05 May 2025 08:53:20 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2241e7e3addso37854745ad.1
        for <linux-usb@vger.kernel.org>; Mon, 05 May 2025 01:53:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746435199; x=1747039999;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v6VpH5xOzWwfp/Va7n+6OXQkDHL7XlzYMiA5RiMqeaM=;
        b=YW2ZdNsGMeg+2Evp0c76nwMuzR91llYstbjy/NTmSOjpLBZHUrRbDrur4EaDNihI82
         Y0Wm4qoOI4DK2OZWOv6J5unBoKQoyjGUGwP5Pf0cSvTKTviDyoEib/aiG5bkb6ik1p67
         mHPv6ZX+EGF1TWby/iSikRlTV8VgdbZRWCIiHAfTJsTDSL/lfiOpOG6DGv5zg+yn6J/E
         lSpUFm/6U/xnlQTJz/2BVuuDy7WYeiY0suvyUMI7tWPWbCkVnVykCSBtnfEFxvgEMsWK
         OKWCq3Ol4ylz23E31SGRGP5vuLNRhhJhOB6IfmK52XhaxxTrcBvILtjZYnVk8Uo8xWsw
         cMEw==
X-Forwarded-Encrypted: i=1; AJvYcCXQx6inIslspGT5BuzJb0hOCxbp2eFtuAzGPqf1r7LpV+59a1EC2M3ZEmGMqEvR/SGL8zhpD6xjPSg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzruo8v7EK/VxwlJDggJTHUBQ7+4wUyayYsXZQmhQPTaYQsriJc
	jSYALK+r+25HfLY6FJvlBzMv9oHvEiWik9nTHcqtex5LtjHo/O0yo7KHjiYTqx4KcZUB6MIJRpa
	y0+x4t69K4QvR+zmNEFH8tsi0fCPZTYa48JcFtQMugN9s5HZ4NiaLLrKMHQk=
X-Gm-Gg: ASbGncvEnQz9jhtkc7DrbfZPX3A6DqC9Y9MwJsLUKTzVE7GVoruqLap4U1ur0yYtLl5
	hRh6C98ekU/QbNoK5VHyeg4+fmc7nTJwTC7SNM1TTI6HUCnnYMNmZ5mHuwYTumOnB9jDnSWcZmW
	UK2M8ljpa7FGyGXNGWtiY4RNvo8zNms+rr9JCSWdBMoxdrFlOq1XpWNBHKQZkhZtK26jgIiWe+Y
	NpbQFA1N45f5795ug9yoSYm2GM+ksjfU48tGYEWYqUIzoM5uw346dbl0kWrMz3OQUbvJ9fQY10Z
	4uwDOqOHMd+wntsrR0vNwabqeYCgAa4iZAlJ
X-Received: by 2002:a17:902:f649:b0:22c:35c5:e30d with SMTP id d9443c01a7336-22e102cff7amr157045375ad.13.1746435199479;
        Mon, 05 May 2025 01:53:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHsVbuev9PZCWzFn47Oi1XmvKqIM/gvReAaz1tQefROUUAAWozx8yI10cOgM+9HdHMDw+F8jw==
X-Received: by 2002:a17:902:f649:b0:22c:35c5:e30d with SMTP id d9443c01a7336-22e102cff7amr157045165ad.13.1746435199099;
        Mon, 05 May 2025 01:53:19 -0700 (PDT)
Received: from [10.218.35.239] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e15228a1asm49514325ad.173.2025.05.05.01.53.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 01:53:18 -0700 (PDT)
Message-ID: <157f6018-0f2f-4d20-ba5a-2649539ec2d0@oss.qualcomm.com>
Date: Mon, 5 May 2025 14:23:16 +0530
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: gadget: u_ether: Continue to send skbs if remote
 wakeup fails
To: "zlyang_001@163.com" <zlyang_001@163.com>
Cc: gregkh <gregkh@linuxfoundation.org>,
        linux-usb
 <linux-usb@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
References: <2025050321-apprehend-lavish-ea92@gregkh>
 <20250503141958.584143-1-zlyang_001@163.com>
 <f177cbd3-dbcd-4487-ae9f-25c656dc1572@oss.qualcomm.com>
 <9debf9b.86d42.1969ee3e6c8.Coremail.zlyang_001@163.com>
Content-Language: en-US
From: Prashanth K <prashanth.k@oss.qualcomm.com>
In-Reply-To: <9debf9b.86d42.1969ee3e6c8.Coremail.zlyang_001@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDA4NCBTYWx0ZWRfX8dOSC0uJwSKs
 sVaB/FvDSyrgnyuTfcYM1BN35Fih9DgPWir3OdB9L0lOP4J1E9YWEKzzV6EICbayWQZH9qaukYY
 7YfsfQzXQihK/WJfvQbfAI71YBjFVV/Ew1o6fzlSfaFulUAitUJ5T6fOyRQgNo+bi9qCLxp10kK
 gY0bGbcnvxsWxsyMMSBbVfZLlAkZtRcW9LnxuU2RR8UIJ7+d1G0F6p30uZQZ4s4BFx3tsbspeiz
 G2HiiDGbo0h2mZN8Nvf0MNLVtfUPnghfWpgkKGiFNmioMT+NWF24V12B7f2nO8RABxXwMPONThd
 NmEMo5uh3f/j3nMEgiuuSwX17Z0hNgbpLD7XOUMYHkIPBRLifk4sejsX8KcptASoqkFKkkHuwVa
 +JuoLlilSHcyoNukjc6agQ3PL/kMJDtDk1ltmCb2FuP+/I/gIW+tw0Tgl55yctJJlesc+Rn6
X-Authority-Analysis: v=2.4 cv=M9RNKzws c=1 sm=1 tr=0 ts=68187c80 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=Byx-y9mGAAAA:8
 a=EUspDBNiAAAA:8 a=ag1SF4gXAAAA:8 a=cpLhnZ3ILJOCubyawWgA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=Cr3pM4QKBJ0A:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-GUID: 2vRDCJ_e-Mv_aBOGYCoY7sB04qDDqTGC
X-Proofpoint-ORIG-GUID: 2vRDCJ_e-Mv_aBOGYCoY7sB04qDDqTGC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-05_04,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 mlxlogscore=999 priorityscore=1501 malwarescore=0
 mlxscore=0 bulkscore=0 adultscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505050084



On 05-05-25 10:50 am, zlyang_001@163.com wrote:
> If  'ether_wakeup_host' fails due to 'not supported
> operation'，'gether_resume' may never be called. I met this issue when
> use raspberry pi5 with debian12(kernel version 6.12.20). May be continue
> to send skbs only when 'ether_wakeup_host' fails due to 'not supported
> operation' is more reasonable.
Please don't top-post
https://subspace.kernel.org/etiquette.html#do-not-top-post-when-replying

As per my understanding, if remote wakeup is not supported, then device
has to remain suspended, and it should not send any data until host
resumes it. If host did not send resume, they you may need to check from
that perspective.
> I also consider another solution，when 'gether_suspend'  is called, we
> may check if ether_wakeup_host is supported regarless if there are any
> transmiting. If it fails due to 'not supported',  is_suspend should not
> be set.
> 
I think this is also not a viable solution here. If suspend() is
received, then the bus activity might have ceased due to the host
entering suspend mode of its own [USB2 spec, 9.1.1.6 Suspended]

> The suspend/resume feature was introduced by  earlier commits, but
> 17c2c87c3786 is the latest commit for u_ether.c. I'm not sure which
> commit should be referenced.
> 
> 
> 
> 
> ---- Replied Message ----
> From 	Prashanth K<prashanth.k@oss.qualcomm.com>
> <mailto:prashanth.k@oss.qualcomm.com>
> Date 	05/05/2025 12:32
> To 	Zhilin Yang<zlyang_001@163.com> <mailto:zlyang_001@163.com>、
> gregkh@linuxfoundation.org <mailto:gregkh@linuxfoundation.org>
> Cc 	linux-usb@vger.kernel.org <mailto:linux-usb@vger.kernel.org>、linux-
> kernel@vger.kernel.org <mailto:linux-kernel@vger.kernel.org>
> Subject 	Re: [PATCH] usb: gadget: u_ether: Continue to send skbs if
> remote wakeup fails
> 
> 
> 
> On 03-05-25 07:49 pm, Zhilin Yang wrote:
>> While UDC suspends, u_ether attempts to remote wakeup the host if there
>> are any pending transfers. If there are no pending transfers, the
>> is_suspend flag is set. If the is_suspend flag is set, it attempts to
>> wakeup the host when start to transmit skbs. However, if wakeup fails,
>> for example, wakeup is not supported, skbs will never be sent.
>>
> AFAIK, we shouldn't send any data over the bus until host resumes UDC.
> So either the remote wakeup has to be successful here, or we need to
> remain suspended until resume signal comes.
> 
> And the SKB won't be lost here since we return NETDEV_TX_BUSY, and
> gether_resume() calls netif_start_queue() which starts tx again.
> 
>> To fix this, stop to queue skbs and return NETDEV_TX_BUSY only if remote
>> wakeup operation is successful.
>>
>> Fixes: 17c2c87c3786 ("usb: gadget: u_ether: Set is_suspend flag if
> remote wakeup fails")
> Is it really "fixing" the above commit?
> 
>> Signed-off-by: Zhilin Yang <zlyang_001@163.com>
>> ---
>>  drivers/usb/gadget/function/u_ether.c | 9 +++++----
>>  1 file changed, 5 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/usb/gadget/function/u_ether.c b/drivers/usb/
> gadget/function/u_ether.c
>> index f58590bf5e02..9d746ed3f072 100644
>> --- a/drivers/usb/gadget/function/u_ether.c
>> +++ b/drivers/usb/gadget/function/u_ether.c
>> @@ -473,10 +473,11 @@ static netdev_tx_t eth_start_xmit(struct sk_buff
> *skb,
>>  
>>       if (dev->port_usb && dev->port_usb->is_suspend) {
>>            DBG(dev, "Port suspended. Triggering wakeup\n");
>> -          netif_stop_queue(net);
>> -          spin_unlock_irqrestore(&dev->lock, flags);
>> -          ether_wakeup_host(dev->port_usb);
>> -          return NETDEV_TX_BUSY;
>> +          if (!ether_wakeup_host(dev->port_usb)) {
>> +               netif_stop_queue(net);
>> +               spin_unlock_irqrestore(&dev->lock, flags);
>> +               return NETDEV_TX_BUSY;
>> +          }
>>       }
>>  
>>       spin_unlock_irqrestore(&dev->lock, flags);
> Regards,
> Prashanth K


