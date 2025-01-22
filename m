Return-Path: <linux-usb+bounces-19612-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 579F1A18ADB
	for <lists+linux-usb@lfdr.de>; Wed, 22 Jan 2025 05:02:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F3A99188C237
	for <lists+linux-usb@lfdr.de>; Wed, 22 Jan 2025 04:02:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DFD9156F2B;
	Wed, 22 Jan 2025 04:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="COAe9b4e"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE5A13A3ED
	for <linux-usb@vger.kernel.org>; Wed, 22 Jan 2025 04:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737518562; cv=none; b=NR7Mt1UYPB/z2a9TQWY7qNN5iL/qm73+buZjNkaXOmYm7RepnqBFl4RiMYBfbFiKdEWIU6IM+qWe07mF80NUiu+KnYw4GqhklGej5ZuFUNePKkk1rbUcSdzu5mHWmJbTraAlb46MJcIEZ1c3Y4+F75isehAFwlHYHJWJF6D1Ck0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737518562; c=relaxed/simple;
	bh=q2/yQ+HJ4K6dvq7XV+7PbEgrXxx5ffehLe8LXjHMsc4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b9jnrtHB62KyT9pnM6l5tLWG1NO74hkbCe2MpeJoRMB8oySidSQVHzNQCleOnZ8xlN1L02NyS2oV6eTsmwS+Zs5IvcG5kynVAqSdnPcTxilmBXCHfTozwVZYGFYIKF5CTuJ2K0NmMdk22j47I1LT3r2VxB6tYDbW86HKgOYYhUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=COAe9b4e; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50LK1TFa024298
	for <linux-usb@vger.kernel.org>; Wed, 22 Jan 2025 04:02:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CgnKW/lprSaXHjYZCAcgFP2Y6Vw+SJnvWi9cj41ou/E=; b=COAe9b4eWVzMyi0G
	xI/xhBu2O/re8c56heKTgGHPXaunbnrklGiUL+URx4a96C6lv8/B8Dnwnwr0lOR6
	GQE4WuEJFIB3Z9oLY5WlicP+9PJ9OMBGnfLxQR10wK4I4e9+C5T/HZ++oTwUY+Bh
	NSLPa9NlUpmiecbaGg0uYgRuPY8CX+Tj/92ZMoIS7nS1xF2YEiS1EitNT0OYVpdo
	+zVlyWcefKx46l7str3YNp9NAujQ1Z5UZsL0PvMPVQxmJZFUrZF7dOa0iIJVfjO3
	2c9ZLlrzxNzLAk660bnctrnSk23oL/eyQCLyCNHuouRYlzE8L3lzj45AOXunGbCe
	FirPZw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44aj8n0x7n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 22 Jan 2025 04:02:39 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2f2a9743093so11716079a91.3
        for <linux-usb@vger.kernel.org>; Tue, 21 Jan 2025 20:02:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737518559; x=1738123359;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CgnKW/lprSaXHjYZCAcgFP2Y6Vw+SJnvWi9cj41ou/E=;
        b=n5N2D5j2/cnqr2RN8fZf7TKkVJAOsTf/DWKYCpjdDmMpLs84VZjfCQujCTR47HfGMh
         NawCuOMXkP/6pQA9FtmsEkG2sqGOErpcvaExV62gnxj0m9GtFR5+xYbth0bsO5Z5RgCw
         674VdeCphfMWaVx0yI1zVVs4AmIWd/FohwTuGlNfhOov10iDlrU8m7uzlufiYTegJiK8
         2mZSl7TVsCM3Nss7tmw6u5JLkeiGzcmxtZIJkdlVqLWUGZXneTbUOyWHpaVglfCZtENd
         krKf8DYBIgKUEeVmkH2b8RgHKdKY661D4AVZEaiSu7ltDxhgeo29PHcGUEuoxxrLESCE
         3H+A==
X-Forwarded-Encrypted: i=1; AJvYcCX9Oxym61b5ysiZHCXaGrWL+w7vBh2ahsh9AgZgwphox1VQD9KcAWj3kHAUzpWFWvt0GfLBE1sdhSU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwtjROWtYVOOAN8sFGu/2KPlb/isSR6E0wjrkaL8LKkshOi5Q12
	UjcOeCbng8Ln94lcdW6dXJllBYfFHSE902yNcRmG6CL/nyDC5KWR1EkBLXl7hw3LHmk4UnXwHsW
	Ngfhet+qG7v7oUtd8FLr66ux+5mT4jDuX1ReBlPqxLzpNzKgq0J/H5G2SaLM=
X-Gm-Gg: ASbGncuoYWBiXbJ93HA0Aa/5/WtOagVhAyEEzY1r2vGm8zjpZdpQBsBvpndIhfbVAQz
	yqmnKEtEQKOQPEB3Lw9BR069i5yPM9MmQZ98Aps1VFZzXSd4HWrhgN+sx3GTV0Q/g2Ciwxz5/kH
	gQqugaINuHS1vmd/GuJGK5T3gSEewOAc441m1DVCFRnYZrFdIOlMYkKxu2y7kG0Y83GV00YV69G
	bLQWDX3Zz2yjv8ZqGpdIT2NUPTtdULz8XGsWbImia7wwH9bRzYtWehNV5vGx4fjLQY99ww+evaF
	zhjZ0HXB9rDEgXydK8E=
X-Received: by 2002:a05:6a21:6da5:b0:1e1:c07b:b087 with SMTP id adf61e73a8af0-1eb21183620mr30082880637.0.1737518559060;
        Tue, 21 Jan 2025 20:02:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF7WBHgfmx+jOv3WydHcQ2xLxRGZKdS+BOXXHQERIidQqWEGdM1D0en16E4UBbTjvqYdVd9xg==
X-Received: by 2002:a05:6a21:6da5:b0:1e1:c07b:b087 with SMTP id adf61e73a8af0-1eb21183620mr30082844637.0.1737518558675;
        Tue, 21 Jan 2025 20:02:38 -0800 (PST)
Received: from [10.218.35.239] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72dab848b08sm9881406b3a.71.2025.01.21.20.02.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jan 2025 20:02:38 -0800 (PST)
Message-ID: <005c13c7-db28-4014-985c-1091d411bb95@oss.qualcomm.com>
Date: Wed, 22 Jan 2025 09:32:35 +0530
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: gadget: Increase the limit of USB_GADGET_VBUS_DRAW
 to 900mA
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Simona Vetter <simona.vetter@ffwll.ch>, Takashi Iwai <tiwai@suse.de>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250120111702.3738161-1-prashanth.k@oss.qualcomm.com>
 <894f42a7-50a5-401e-a705-a06eafd6161d@rowland.harvard.edu>
 <1b1587e8-5c38-4138-a27a-1de71ff07ce3@oss.qualcomm.com>
 <e36303c0-9d1f-4c66-bc40-891958507275@rowland.harvard.edu>
 <d308300f-2559-4d13-8d15-5a2416ac00c9@oss.qualcomm.com>
 <e823a961-a0a1-46c3-84a9-7da3cd718f4c@rowland.harvard.edu>
Content-Language: en-US
From: Prashanth K <prashanth.k@oss.qualcomm.com>
In-Reply-To: <e823a961-a0a1-46c3-84a9-7da3cd718f4c@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 1j80JmvNkCcvvLNC7PZd4fdtvI0zCxw4
X-Proofpoint-ORIG-GUID: 1j80JmvNkCcvvLNC7PZd4fdtvI0zCxw4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-22_01,2025-01-21_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 adultscore=0 spamscore=0 suspectscore=0 clxscore=1015
 phishscore=0 lowpriorityscore=19 mlxlogscore=379 bulkscore=19 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501220026



On 22-01-25 12:56 am, Alan Stern wrote:
> On Tue, Jan 21, 2025 at 10:19:08PM +0530, Prashanth K wrote:
>>
>>
>> On 21-01-25 08:36 pm, Alan Stern wrote:
>>> On Tue, Jan 21, 2025 at 09:50:08AM +0530, Prashanth K wrote:
>>>>
>>>>
>>>> On 20-01-25 08:17 pm, Alan Stern wrote:
>>>>> On Mon, Jan 20, 2025 at 04:47:02PM +0530, Prashanth K wrote:
>>>>>> Currently CONFIG_USB_GADGET_VBUS_DRAW limits the maximum current
>>>>>> drawn from Vbus to be up to 500mA. However USB gadget operating
>>>>>> in SuperSpeed or higher can draw up to 900mA. Also, MaxPower in
>>>>>> ConfigFS takes its default value from this config. Hence increase
>>>>>> the allowed range of CONFIG_USB_GADGET_VBUS_DRAW to 900mA.
>>>>>
>>>>> Is this the sort of thing that really needs to be a Kconfig option?  Why 
>>>>> not make the decision at runtime, based on the needs of the gadget or 
>>>>> function drivers and the connection speed?
>>>>>
>>>>> Alan Stern
>>>>>
>>>>
>>>> Right, set_config() in composite.c does this in runtime based on the
>>>> values of MaxPower (from configFS), VBUS_DRAW defconfig and speed.
>>>> If we don't set MaxPower from configFS, this config helps to set it
>>>> during compile time. In fact MaxPower in configFS takes its default
>>>> value from CONFIG_USB_GADGET_VBUS_DRAW . Sent this patch because Kconfig
>>>> has this limitation where it's only allowing values upto 500mA.
>>>
>>> Why does MaxPower need to be set at compile time?  Why not set it at 
>>> runtime instead?
>>>
>>> If MaxPower gets set at runtime then it can take its default value to be 
>>> 500 mA or 900 mA depending on the connection speed.  There will be no 
>>> need for CONFIG_USB_GAGDGET_VBUS_DRAW.
>>>
>>
>> Yes, agreed. Can we mark CONFIG_USB_GAGDGET_VBUS_DRAW as legacy and
>> maybe also avoid configfs/composite from using it?
> 
> Indeed, the whole idea is to avoid using CONFIG_USB_GADGET_VBUS_DRAW in 
> configfs and composite.
> 
> If nothing will still be using it, just remove it entirely.  No need to 
> mark it as legacy.
> 
> Alan Stern

Sure, let me work on that and send a v2 (or another patch). Thanks for
the feedback.

Regards,
Prashanth K


