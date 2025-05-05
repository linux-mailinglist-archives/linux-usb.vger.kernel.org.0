Return-Path: <linux-usb+bounces-23684-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE2BAA8B74
	for <lists+linux-usb@lfdr.de>; Mon,  5 May 2025 06:32:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 69D1E18900A9
	for <lists+linux-usb@lfdr.de>; Mon,  5 May 2025 04:32:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 463B519D8A2;
	Mon,  5 May 2025 04:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ODSZkumf"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B7AB139E
	for <linux-usb@vger.kernel.org>; Mon,  5 May 2025 04:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746419532; cv=none; b=oqFw2eyevpriCaK6jyVnOlbkgKvfgkQh2n0ACnxuPOPsXMpAj5VszFpjAJIOr4+J9aWSbmolwbzeMn1hlhFFTsEgrsfdeFOq8GPQWW9QRo8laNvH3cWwE1pUqnh+EgxcpLj5oU1D2kGNfDqO37hF8A4/O2RHVyrZMs9w+r3Q2ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746419532; c=relaxed/simple;
	bh=qKyLsqHMd82QXxwMoK1lPglXYj5Shh4KEGQoUQrq7MQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RbF98NmndoIjHkU+ZgpqRlm4yoLG3P3BxL+E8dXVfFFrvMHrcZf5SynVoy8xaUUe4d2Z+85ONQsWONlMbkBeyP9+W3UADz/q+/i50OkWuLqpHPdoDjDzJMqvf1da/litQhjqdCiwGt34BzODSwOsb9+hh0HvJxnAUuicDdsHxuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ODSZkumf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 544NNPBo009423
	for <linux-usb@vger.kernel.org>; Mon, 5 May 2025 04:32:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jhhINkAZNQ1HFEf2SMii7PH58AWcv7zkJD04P+FM7j0=; b=ODSZkumf4rSHcDcs
	a2TfSK52m2FufOd88yz8ixkT2qGrDzihZUGbDnkkz1QfCYdHR8Km/sfP0vnaza7P
	V4sMIXoqWKfsRCbsZ3PNmtXtI01NJj4bOc9acA/U5SVVxtoosQfzyOZcLJRCRaEI
	d999j/yScn2fjnefSALFIfLwsHX8B+VMRmdgNVs/Ms3UX0uthKFB/wq+rEwb010n
	HwISdBzJG3H6XpLVRAdLb3TQjQAFqk4AqACDuTZpCleiMMbpvhZO9Mb/M2R4BNXE
	y+WI09hlAdJjyI6URMJBOUOgYQX3xCA6HhEfJ1VmpxdZQkkS7tX2vqsUXMHmrJdo
	eQS+bA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dbc5ay1t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 05 May 2025 04:32:10 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-73c205898aaso2790496b3a.2
        for <linux-usb@vger.kernel.org>; Sun, 04 May 2025 21:32:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746419529; x=1747024329;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jhhINkAZNQ1HFEf2SMii7PH58AWcv7zkJD04P+FM7j0=;
        b=rRtSuW+QRNEX6dcYeKhNq8nlXN5M2Ss5djCJIXwIDf0P5qVc2H/TOPEwRUpcZvoIeW
         G25Z5flMB0PqpnteckUxgd2YgDR/ac++L4svcB6mDxRzPBIdhfT3NkDPdAHeu1UCh3a/
         uWF2kD0vU5vGkH7PB+cDAN2kkVD6ysbhtDEmjxt3k1tyhMfWAUMp+K5hNhcoP+/ydAGo
         UK+6opeg+on/X2cl29s/Fru/JOQu+wW2fCg5M8cEb6QbUNluf+UlWdY/zQrHkVIkA8wT
         Z1mZe8x2D2R4qphu2gl/YyrJ8NFPHp84uEfQzNJGvpqfjv5C+hCVfHWUBDQHqY77JLyi
         CoZg==
X-Gm-Message-State: AOJu0YyV5m9ioh3LaV4qd/kJq6FLsz98Xtgc+R7s7V/rU1P8kAvzBUZ0
	3xio7OMAhj/Im4SNPwFdjv8ojFnTnBp4WQ8I/A/4n8R/3bvXcJnPDkvUYgv+75BX4Yt9seDHK0V
	HXiiogfHtkDjT+OkIM3SqME7n7Q7feBBMQGwO46N3rtntFy66EH6Nrf7jkTI=
X-Gm-Gg: ASbGnct1vutVh5jKfoDQFVLzJsHJXoP63THr1rFmzfVHqsoTjkJUCkDRWWry0tb8v/b
	XavlCDjSHpDp4l70nBNM7iYxJ5WOLM9Sz4N9Rku3gud8wvT1B/BPOA2VM4fLc1tRBn9bOfW/iJo
	eqr3t7qOhwsJ7599w/Il0BQdzo/9SH7lj2vWVA3uqSDecMFlyK0tsY4Sbk/8VOzfnlighMd6OTU
	V+kpHAJhsFvwiQTZmWBNqi9Ln3oWNLsvN8FEJJ7IGwOp6cy8ANCjZNG5P0NPV7qNwQY2S/YZ9vr
	1Mw/aNrjNYC5NDmjF/AWti4An0v2SSzOTB2v
X-Received: by 2002:a05:6a00:aa0b:b0:736:4e67:d631 with SMTP id d2e1a72fcca58-74067422defmr11272006b3a.23.1746419529427;
        Sun, 04 May 2025 21:32:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFLuEj73Fhq1qF2MI+zXBDkItR8PmfQtPaO8WMVBj8ULLWXmL1dUCnonNLvpyiqoahF3LBHAA==
X-Received: by 2002:a05:6a00:aa0b:b0:736:4e67:d631 with SMTP id d2e1a72fcca58-74067422defmr11271986b3a.23.1746419528961;
        Sun, 04 May 2025 21:32:08 -0700 (PDT)
Received: from [10.218.35.239] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1fca324a9bsm1985171a12.0.2025.05.04.21.32.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 May 2025 21:32:08 -0700 (PDT)
Message-ID: <f177cbd3-dbcd-4487-ae9f-25c656dc1572@oss.qualcomm.com>
Date: Mon, 5 May 2025 10:02:05 +0530
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: gadget: u_ether: Continue to send skbs if remote
 wakeup fails
To: Zhilin Yang <zlyang_001@163.com>, gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <2025050321-apprehend-lavish-ea92@gregkh>
 <20250503141958.584143-1-zlyang_001@163.com>
Content-Language: en-US
From: Prashanth K <prashanth.k@oss.qualcomm.com>
In-Reply-To: <20250503141958.584143-1-zlyang_001@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 11HwMXM2CFNbKi9oU2HUfDLrpZ3-EiU4
X-Authority-Analysis: v=2.4 cv=O7Y5vA9W c=1 sm=1 tr=0 ts=68183f4a cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=Byx-y9mGAAAA:8 a=Ht1ddUJqX6ZoSwiRCh8A:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: 11HwMXM2CFNbKi9oU2HUfDLrpZ3-EiU4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDA0MCBTYWx0ZWRfX3Gf0hPVbNrvl
 JEN4IsLeqDNPDWSFOg+ylKm/vBcxDFp4IR9X97N+iCg2UOuDd+ubc2kDkYSDbmF8KOy8XHdgu5h
 A5u01s6sfOHDu4WmNVZMzn0ewqblBU64rkisGcOVzhz2ltdKQ79i6hRRt/oibd1U2QdDhMPLaE4
 ADnKxdV9bCb81SD8y/dfnfMtdvYd8m1CpQ+CUjV01pKJ3/uil/Ri+zwI1bjZfa8fpuR0q8FnK/K
 9GcyKngUNd1OIvUCwiENPHdEf7G2sraAUr0WU3lzH4M5UwGtRdL4H8tBS6j/c5RCMkM98aorlAt
 SRTxMWc4Yz91PVnjMuwOiMPMLSzWPdHRM0VezDsxPzwF2kEJH3Rl1bFbFoBeTIPhfZFwCGYzNxF
 WEmqB0JLKKjMuBDVzwckMj56aPc7W406rfDnJd8mgo8jNzSeHLnN/9KfTyN/jpBjk31bu8l2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-05_02,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 mlxlogscore=501 mlxscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 bulkscore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505050040



On 03-05-25 07:49 pm, Zhilin Yang wrote:
> While UDC suspends, u_ether attempts to remote wakeup the host if there
> are any pending transfers. If there are no pending transfers, the
> is_suspend flag is set. If the is_suspend flag is set, it attempts to
> wakeup the host when start to transmit skbs. However, if wakeup fails,
> for example, wakeup is not supported, skbs will never be sent.
> 
AFAIK, we shouldn't send any data over the bus until host resumes UDC.
So either the remote wakeup has to be successful here, or we need to
remain suspended until resume signal comes.

And the SKB won't be lost here since we return NETDEV_TX_BUSY, and
gether_resume() calls netif_start_queue() which starts tx again.

> To fix this, stop to queue skbs and return NETDEV_TX_BUSY only if remote
> wakeup operation is successful.
> 
> Fixes: 17c2c87c3786 ("usb: gadget: u_ether: Set is_suspend flag if remote wakeup fails")
Is it really "fixing" the above commit?

> Signed-off-by: Zhilin Yang <zlyang_001@163.com>
> ---
>  drivers/usb/gadget/function/u_ether.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/gadget/function/u_ether.c b/drivers/usb/gadget/function/u_ether.c
> index f58590bf5e02..9d746ed3f072 100644
> --- a/drivers/usb/gadget/function/u_ether.c
> +++ b/drivers/usb/gadget/function/u_ether.c
> @@ -473,10 +473,11 @@ static netdev_tx_t eth_start_xmit(struct sk_buff *skb,
>  
>  	if (dev->port_usb && dev->port_usb->is_suspend) {
>  		DBG(dev, "Port suspended. Triggering wakeup\n");
> -		netif_stop_queue(net);
> -		spin_unlock_irqrestore(&dev->lock, flags);
> -		ether_wakeup_host(dev->port_usb);
> -		return NETDEV_TX_BUSY;
> +		if (!ether_wakeup_host(dev->port_usb)) {
> +			netif_stop_queue(net);
> +			spin_unlock_irqrestore(&dev->lock, flags);
> +			return NETDEV_TX_BUSY;
> +		}
>  	}
>  
>  	spin_unlock_irqrestore(&dev->lock, flags);
Regards,
Prashanth K

