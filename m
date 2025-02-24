Return-Path: <linux-usb+bounces-20968-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 335B2A41912
	for <lists+linux-usb@lfdr.de>; Mon, 24 Feb 2025 10:29:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 52A531895B31
	for <lists+linux-usb@lfdr.de>; Mon, 24 Feb 2025 09:27:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 778C818DF65;
	Mon, 24 Feb 2025 09:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gU3yJHce"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5795524169C
	for <linux-usb@vger.kernel.org>; Mon, 24 Feb 2025 09:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740389048; cv=none; b=IDdSHV5vky1JXkxiCqUcCsnoxwccC98T+apfTRcou0pkt8JHJ27ST88dy8i2GFNBEUQK5GJtf+M2JmIfrXJzLUx2rCqX0pIniFngI71Pv+BlBFY98Rz99fRxNV4muuOYuNUhcEWvI92S4jA75C+xDDR7bM6T1SKn44ds4nsB9Zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740389048; c=relaxed/simple;
	bh=dyeqdBYmU1W+D9Gm1ZB+2caL2N2lkgoYRXJAkJxfxWI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZOVTj26FpfxDLDWjABGifYcT2Lg1ulPaOlx75X4VX7mmvIpr33EF7+eKLHxq4cExl4o3+PCtAJLNreAcwmCmqkKhz93IedGL/P+o9yutGYZL7u+Dm5B0KnQLyl95MII/qXa6oCc6HZ61gMX+V7489dCgktaQb+4ko2BppznafDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gU3yJHce; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51O1QVDf031671
	for <linux-usb@vger.kernel.org>; Mon, 24 Feb 2025 09:24:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zTJ+ykeoD96H1amAVzq1zgUfrUIbnuKbtIRzbBEWelM=; b=gU3yJHcewh2JcLGk
	ZJIykGqIqPcjkqw/ZYwwvm+4U9Hmdj3BQaBjIKoQHgELN4n/3RJkUfwlrmT5Sbd5
	yHtbMnISmlpJsXCgronhMINT/ksxTGDiK+jHyzvBLXMmYVWqELY264RXAgs3CkEV
	Sk2+xG94tBqBJcon9dTC3W2Bed88COI7dYj0xzVLJEskkv0JZtwlQOTCuAvGlrMc
	aem6gEZqFdHZ1qreQF67vYVN/v7fayW91jGo4Gim57oHsrnqNMhIRgV0bsUEDxxj
	shC4haw9n+NIKMxf1BqzaroliDVNKsNkHjYjCPwhMRpV3KzLbsNSwc7MlC2m20tc
	aSmvpg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44y7v9c8q6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 24 Feb 2025 09:24:05 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2f81a0d0a18so9053379a91.3
        for <linux-usb@vger.kernel.org>; Mon, 24 Feb 2025 01:24:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740389045; x=1740993845;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zTJ+ykeoD96H1amAVzq1zgUfrUIbnuKbtIRzbBEWelM=;
        b=MlcBXg8pgA3rKxMzqSYuobBtUK8gE9nrLUOr1hWouUI9xxL4zO8fs3RbkLXryFUnQn
         bz1wXag/14ZkhxVswnmYNhHGWagTpLIdLS2FdPJBacek79fkcK3oBEYscGIW/p5iOeOG
         jq6DWjJu22V/SgkChWGEyDmr1MqXZkFPw2xG7nyl9onRHNJ8/LTr251flnKP581ICNX2
         5rx3GbmrKY/CyEvziwgOJVukD5IvbRJ8F1mui61GVy2wiGSzkv0D3n0pFHZX8jwCsFKk
         uq9BHIAT+vcdzWpI4eunADuyQbKIYgzyJs3bpKCyULxIkSlyrFSZJaf5WoG5oJLLreZg
         C9Jw==
X-Forwarded-Encrypted: i=1; AJvYcCX43S8HHJc9kAN1qcpLa/T0uO+q0S9OdfpbBGZ8Vgh7pTs9tgFvuWSpvWRvnc9kpRkja7/+PPP6Vdg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyy/j0VbVWTC4kNjd7CtBDr4nvfAt7c7CtQmABxaWUsouCyvkLh
	/Idtu1qfm5HxivPfbE9/euETpGL3NuNF8/iyYDFc66Pfh7nOlxJ12OIC7ilFMQsfzPMOaKCmFms
	EAhIS7p7NEQgvpvz2JSTos7Pc/qsRAKoBxmbiVfaWehoT5F4jVBheON/cAZg=
X-Gm-Gg: ASbGncsxx36SD33H3gFh7pzESyR6ALOjUiGtAPLRco2fGq/8KCeEDdHZckXZGjJVfjJ
	Mx/Br64aJeKMeVRVc+CjThcx/9ChHik5mFFa1O/lRZjQLfczLj8GCchtLoJNg4l7KSOV33B2RsY
	Loy1RWvJKR4EtfRrcbwBKzSoahDDxBDU70fxY1TSYptHGiAQxpJsrsaIxkVIAZwzVbh5LOwe8Sy
	VQ5WmUV79oTDa6pU13vnEmn+Walh96hSrWq5fSIo/uwJy3CttFfBFluZcvufYttOnVrR/AiPKd6
	6mFbRTcoVbaJqWG02UK3E7GIhxtN4Ld3q067Hss1
X-Received: by 2002:a17:90a:d60b:b0:2fa:e9b:33b3 with SMTP id 98e67ed59e1d1-2fce77a646dmr19447344a91.6.1740389044731;
        Mon, 24 Feb 2025 01:24:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG2e5GGdLo1f1pbIplxThQTlv4yHbEvuPzulS99FVCfyGT3eVlAMJ+p3xGZzTRy53Ig0Lne1w==
X-Received: by 2002:a17:90a:d60b:b0:2fa:e9b:33b3 with SMTP id 98e67ed59e1d1-2fce77a646dmr19447311a91.6.1740389044183;
        Mon, 24 Feb 2025 01:24:04 -0800 (PST)
Received: from [10.218.35.239] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fceb02d837sm6800481a91.2.2025.02.24.01.24.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Feb 2025 01:24:03 -0800 (PST)
Message-ID: <63c3b650-c3cf-49bc-973a-c5fe025a22f6@oss.qualcomm.com>
Date: Mon, 24 Feb 2025 14:53:59 +0530
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: gadget: Check bmAttributes only if configuration is
 valid
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Kees Bakker <kees@ijzerbout.nl>,
        William McVicker <willmcvicker@google.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20250224085604.417327-1-prashanth.k@oss.qualcomm.com>
 <2025022434-unveiling-handbook-6fc3@gregkh>
Content-Language: en-US
From: Prashanth K <prashanth.k@oss.qualcomm.com>
In-Reply-To: <2025022434-unveiling-handbook-6fc3@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: cMOak9tiD9lABn8UjTMJuDTDZYhNoq2G
X-Proofpoint-ORIG-GUID: cMOak9tiD9lABn8UjTMJuDTDZYhNoq2G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-24_04,2025-02-24_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 impostorscore=0 bulkscore=0 malwarescore=0 phishscore=0
 spamscore=0 suspectscore=0 mlxscore=0 mlxlogscore=439 lowpriorityscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502240067



On 24-02-25 02:36 pm, Greg Kroah-Hartman wrote:
> On Mon, Feb 24, 2025 at 02:26:04PM +0530, Prashanth K wrote:
>> If the USB configuration is not valid, then avoid checking for
>> bmAttributes to prevent null pointer deference.
>>
>> Cc: stable@vger.kernel.org
>> Fixes: 40e89ff5750f ("usb: gadget: Set self-powered based on MaxPower and bmAttributes")
>> Signed-off-by: Prashanth K <prashanth.k@oss.qualcomm.com>
>> ---
>>  drivers/usb/gadget/composite.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/usb/gadget/composite.c b/drivers/usb/gadget/composite.c
>> index 4bcf73bae761..869ad99afb48 100644
>> --- a/drivers/usb/gadget/composite.c
>> +++ b/drivers/usb/gadget/composite.c
>> @@ -1051,7 +1051,7 @@ static int set_config(struct usb_composite_dev *cdev,
>>  		usb_gadget_set_remote_wakeup(gadget, 0);
>>  done:
>>  	if (power > USB_SELF_POWER_VBUS_MAX_DRAW ||
>> -	    !(c->bmAttributes & USB_CONFIG_ATT_SELFPOWER))
>> +	    (c && !(c->bmAttributes & USB_CONFIG_ATT_SELFPOWER)))
>>  		usb_gadget_clear_selfpowered(gadget);
>>  	else
>>  		usb_gadget_set_selfpowered(gadget);
>> -- 
>> 2.25.1
>>
>>
> 
> Have you checked linux-next yet for this fix that was posted last week?
> Does that not resolve the issue for you?
> 
> thanks,
> 
> greg k-h

I hope you are mentioning this one -
https://lore.kernel.org/all/20250220120314.3614330-1-m.szyprowski@samsung.com/

The above patch fixes null pointer in composite_suspend(), I'm trying to
address a similar bug which is present in set_config(), it gets exposed
if the requested configuration is not present in cdev->configs.

Regards,
Prashanth K

