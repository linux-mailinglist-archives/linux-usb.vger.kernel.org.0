Return-Path: <linux-usb+bounces-31262-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D20CCABE42
	for <lists+linux-usb@lfdr.de>; Mon, 08 Dec 2025 04:00:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 404653003F86
	for <lists+linux-usb@lfdr.de>; Mon,  8 Dec 2025 03:00:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E80BF2BE7AC;
	Mon,  8 Dec 2025 02:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GNs3tGcw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VCrqn3ha"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 017411F874C
	for <linux-usb@vger.kernel.org>; Mon,  8 Dec 2025 02:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765162798; cv=none; b=GoNU41uNb2OdZRFyq7Ey9iKHVwD38yJExcCS4tDqZ+mmNuOlnTspbvC8XO1GMvvqy10eWR8XrsU+8SdUTPbb4w1r7ASiSpjXXtxbhwgxFVNXrLgDfs2EokIb+hbvxZg0xVqPhNPEmQjpTccJqIWm1SOkp4XxwVg0U9wCVqqK18A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765162798; c=relaxed/simple;
	bh=EmnNpNylXff6gLC4nWgx7aCQP39NH2ZbdcQ3kT/OWhc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SjjUECueJTIaZQQgSQq+xIL8p9iHEFKrE16A2eMZ9MjT5WdauXwZqB6lw1RhNjT5VQi/9/JDiE7Py8coMcE+qt4YbtN/l2x6x3NUgaqdMWENosev/sJdJCCkVZ3Kur8N0gq28J9ObeOZXGPt+uLaM0IAxTo/SDixlLa8YIWtpJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GNs3tGcw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VCrqn3ha; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B7NpXml2655198
	for <linux-usb@vger.kernel.org>; Mon, 8 Dec 2025 02:59:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DMQpxJAWnBPA1vcyks+2JdXxmwHcChjtbs02WLtXkiA=; b=GNs3tGcwwPMv+dBZ
	hIicOg3N67yA4UPTJy3BQEEonHDwSawPU6bjA8078n8PnxlDFOwM06YYdm4dRvvt
	OPHDpXuQ7WEnFcXlMKW5XyhEAWj+2fst7KaeFBvKO01wpFAAI0RotAp6GKw22aVK
	hJaO5s18561vMDSRD435XoE7MG5DQIA3o/gIbOdMaxxqJJdsuCgdMAJDOzMNMn3e
	N5VtusOmNSwHh2QqzV68OBY2diAUjc5nhV/44RYTBPbayuqEiBykKxbwDitAVjkt
	LQ7MM+Qj1CR7hlLdNF15gjK9JGa72WIA7fHvIPP1F/fVGSwPPbIYaWzSUwdizOLR
	bDR+pQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4awha1ge04-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 08 Dec 2025 02:59:56 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3438744f11bso7855405a91.2
        for <linux-usb@vger.kernel.org>; Sun, 07 Dec 2025 18:59:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765162795; x=1765767595; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DMQpxJAWnBPA1vcyks+2JdXxmwHcChjtbs02WLtXkiA=;
        b=VCrqn3haR0BsxoRrVsHaBvuVmBWXtDQtGRKjJEh20crY/OMPeeMWQeLmzJyeRFV2GB
         K4MWM4nDo/Qwg5u4b78kNBWh9z1IGwLq6atlwVlQ6hbNxLbRffbnzfuBk2daIxT6knxQ
         zyBSY8I433rVTsSte1KeRA9EWVsupBDYKrjUd0YRbBhg9n2yQaowTDBiXQ8ZitmJQ1R5
         Y3H5M41p7bKl6wO9sZ1vPkSmE0FiPb/7oWxyPOwVKjoCFGWf+z+wgsoNAT5ZtuyKdlAJ
         WW4gchOvxeotSlaPqTqt4+vdZh5AUq3mrmUyTvmekHZwU9vQ8k7Re6qB7QqqJIklAKs0
         P+Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765162795; x=1765767595;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DMQpxJAWnBPA1vcyks+2JdXxmwHcChjtbs02WLtXkiA=;
        b=ei2rRhC5tlAM0G1q4EWnRDJ4VJ+XnObiukxNMgk/3flCwKxSyHNeBwhgPkXwDwnfpg
         ftPFyS2dmL4xYpbOlvCH0q2opcjQ69BLEBbUp/ENpbIYfmc2UDp8hEHY5imAtO9FMbTU
         A+iTAQZ6kajBXGEa4eoh073gg5Dl3hgeVMUedk5kxI7UswzrxwDsffespDJeoITFTHgR
         C364tda5GqmWUoHu09p/UgVzSBi0fGMZA8LjdejSv6gc/0my7lsvXrklG7jmgX4rXX95
         I3LZRWc3YIafyI3hWWMcCW0NHYusDs160swPlKKhdCn8ewtdMt2Kbska+rqYkaUJRcUn
         Wfkw==
X-Forwarded-Encrypted: i=1; AJvYcCUyvWy8NB3fptPVceCHAbgrmSrJqCSJ1ZZAgZxvsJEu7+dB87Z9bjV7djfKRJEBIIn6HqhfoOOz8LE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzWdb+4F1MawcQiIG2X2zg3lujEfWh9bCgOLKI8i5vvVo+f3dv
	jRMQ91UnrScFoWEy2yuTUTrFqUH0a3eVHB2yOl2zoP6uo1ylxUKpVaiAlD3s+Jk/ATQoQXBAsGB
	YrWiwKoFyly7/r1zPd+v2fl/smVx746aqPX1+eEHwgFnA1B1S/p7/yKqNOkAdbQvUTwYMPeI=
X-Gm-Gg: ASbGncsAss9Dj1tvfJxizdqaI9ltBN+TiKwwkb22TG9Dek0aXv3pSpeKI/Z0HZ/htbH
	4+dZ+w8CIS1SeIUK6u8sTMbWgE+MlUXWcVCSUReeM4gMNsk89NqwHb4vswqIxSZpG54FfaEtTFQ
	cB3SVCspz1DaM3SLAXj+QHiyJZ6NROXeW4nKhvk1nnhiMXsyOgWQY4E+AbF8pgIP7q4gitnd1Er
	TS6AUdJCNpHw9QYBHWo0Q2u3LhRzk9OIm5+Mnq1a8FApcq5ripDCXYBxjtLwLfIoattCL1d+ac9
	ti6E02nHjXIcSxBQWMynFRnQtqmNInkccyctuk8HPfYAAo1N+RPLalggDrMAIbFgvCJ5dQ4zWY1
	dpafM+JXutDms05b0HYdeEkM8bpCVY2ws8iU+HoVdRN5feyLpeyTJ/UUnmNDZ4CdP5uW/
X-Received: by 2002:a17:90b:384b:b0:335:2747:a9b3 with SMTP id 98e67ed59e1d1-349a2608217mr4635728a91.32.1765162795483;
        Sun, 07 Dec 2025 18:59:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG6GGCrPmNLvATa9kpYv1DHAeS2e77A+vMLvwB/DKSNYIuM9Y5dnD6wH9b1uMlc4dAYFiGXGw==
X-Received: by 2002:a17:90b:384b:b0:335:2747:a9b3 with SMTP id 98e67ed59e1d1-349a2608217mr4635717a91.32.1765162795037;
        Sun, 07 Dec 2025 18:59:55 -0800 (PST)
Received: from [10.200.7.150] (fs98a57d9d.tkyc007.ap.nuro.jp. [152.165.125.157])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3494f5b94cfsm10256762a91.17.2025.12.07.18.59.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Dec 2025 18:59:54 -0800 (PST)
Message-ID: <370bde1d-75f1-4ae2-a720-07fac8afaf5d@oss.qualcomm.com>
Date: Mon, 8 Dec 2025 03:59:50 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: usb: maxim,max3421: convert to DT schema
To: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
Cc: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, davidm@egauge.net, ~lkcamp/patches@lists.sr.ht,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251107001812.10180-1-rodrigo.gobbi.7@gmail.com>
 <20251107-agile-alligator-of-philosophy-03d923@kuoka>
 <de0b9059-30c0-4704-b0b8-9f4f5abfaa04@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <de0b9059-30c0-4704-b0b8-9f4f5abfaa04@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=b6q/I9Gx c=1 sm=1 tr=0 ts=69363f2c cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=vTE1kzb4AqIx7XBf0Bkr0A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=xH0NOncFEGY6xPEGJjIA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: GQp7EDS5E8wsE6JVP9B_D5rSIV_gneXj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA4MDAyMyBTYWx0ZWRfX0EF48wBMFULN
 03qNMmSZzOb9p/DE1UAULXpSFuC0DcBy9qAnFagYrBJph+tjfPfby8yddTYu86J6vbuUcvP7LA8
 0GMkklPVesuSS3dvN9nPHX/b5hPW3utAB4FFlv4sAIEajfXBC3lNIA6ZHEHobLuhehMJ+FZJ/wC
 QPW4Eij1GTeKbG94B1l0Z8N4zVe0ad97uF27O/96Bz/BK9uS/4QidUwgtjJ2qAyCprtmyhxtNAy
 Z5KVRbzpzDt77VWKzumpz0co/HnopdgULUN1AyJshxSZHIdtpEkl+8j98F9E96AF9GuMhLLqpHh
 O5i8t6gkT9mCHpssMEntBO4vl8AQmKA0SYVY2WaFeQi+Rfm5CYghbqkpcRBWIxqTYeaOvYlQ0u/
 lcHou5V/WxFbClPTV1cFEdetKnXiSA==
X-Proofpoint-ORIG-GUID: GQp7EDS5E8wsE6JVP9B_D5rSIV_gneXj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-06_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 malwarescore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512080023

On 06/12/2025 14:38, Rodrigo Gobbi wrote:
> On 11/7/25 05:03, Krzysztof Kozlowski wrote:
>>
>> You commit msg explain any unusual changes - like modifying binding
>> while ONLY converting it - and WHY you are doing the unusual changes.
>>
>> Best regards,
>> Krzysztof
>>
> 
> Hi, Krzysztof,
> I was wondering about this again and I need to clarify the expectations here. 
> So my v2 patch is only doing the conversion from txt to yaml without any additional
> changes. That being said, at v2, there are no new properties and no unusual changes.
> 
> What happened was that under the ---, in order to save the lore and the previous discussion
> from v1, I`ve quoted the sentence about the "maxim,vbus-en-pin" prop from v1. Here, at v2,
> what I meant under the --- was that the "maxim,vbus-en-pin" was not new and it already existed
> in .txt file and the driver is already expecting that.
> 
> So, even if I send a v3, it will be exactly the same direct conversion with the same commit msg
> because nothing was changed from txt.
> Maybe my intention was not right, my idea was to just save the lore/"answer" a previous point
> raised inside ---. 
> 
> Tks and best regards.

Indeed, I think I misread or went too fast through your changelog.
Everything looks correct, thanks for clarification.

Best regards,
Krzysztof


