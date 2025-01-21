Return-Path: <linux-usb+bounces-19567-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C4CA18245
	for <lists+linux-usb@lfdr.de>; Tue, 21 Jan 2025 17:49:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 39686168131
	for <lists+linux-usb@lfdr.de>; Tue, 21 Jan 2025 16:49:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7DE81F4E40;
	Tue, 21 Jan 2025 16:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U9fSo8rQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F1911B87F0
	for <linux-usb@vger.kernel.org>; Tue, 21 Jan 2025 16:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737478159; cv=none; b=qLHT9lGZf3U5l3vGYCsYW59j0NBEZED7cmSK17imuVaRVqWjcs7IjG0ePgvvHhimzzR3dFsMTUWkeBmNLKAORbvtna5RsZY69sSO6aweNwMnEkoVP30XVRfMCAFVH8vITonAJP2VXY3plvWm/ofmxcH0/XEOTSlKw8Q7uNOTeNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737478159; c=relaxed/simple;
	bh=1By0wkw+dzUshvLJIh5rsJlTZ+ltYvC4hpRJFhieX18=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WeJHfojGe0zUio1ozUa9J/+hplzVtctUYaYD4qHPmIMsYJs2b2es9icIREbkDFlZiJYvROyuwQB3PMkBp4i7sIRdLWMzKYnTH2WM3h2+FkJ1r0ZzfNqmuBvQNPCEremUpjdgKtI4i9MqV594OzLh3d5XVSXVRPfwEz2LanzBGnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U9fSo8rQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50LFDXLB031984
	for <linux-usb@vger.kernel.org>; Tue, 21 Jan 2025 16:49:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X0Q/MFqhVulggWVInWU+fumi1mnX/CUvTS/GmzvH12Y=; b=U9fSo8rQHjNZ4hhh
	1cGpVM7AULuoI2nbNabOO+HBA5DcfikH80/Bx58l6wXEkeNBk/UVtNnl+rpuwy4E
	AKzWskCvMkli/RYedYBVkGynfUXF/2nBIR6xeXJYKb4xJ6BMG4gi1Y76na0D0ZHY
	qGYug/ogqwcJhJ7F2NC+DiCIwL7AklGUtq6PKdmj0fvTynMADrnpc//TtDS1QwS/
	znrcmlQObfygYPjWERt0nY6xV0G6rCnpq+20eRfBWHUZ2PzkizhD/6kKXlj7OGaj
	qOlGNB9GFdgf3a6kACHkOnxKT9jIkGVI9TLKyVXngPDii39p71DX8r6V+EW/uSG+
	ODvufw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44ae1p87j5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 21 Jan 2025 16:49:15 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2167141e00eso116743505ad.2
        for <linux-usb@vger.kernel.org>; Tue, 21 Jan 2025 08:49:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737478154; x=1738082954;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X0Q/MFqhVulggWVInWU+fumi1mnX/CUvTS/GmzvH12Y=;
        b=ZZKXxRVxLKZyDqlAwfbg1iq99AIfqoBBZ+E8URGTDRlSLJOrWeVVgy1h7Ju6291IQr
         hYU0QnxCHnDk71OFQg49Biwki/7A7XYKm+BSRWMvzmsQ1eUMXr0jENZUWu/aX5Jt1Wlf
         FFDLrG1s1zPMwmh5k+3Vza8+nf5llf3hPhSThUp+3EZf0YoGIwCaorPP4Y0tzG0HnqnO
         FufhkQ/qZaJn966iLV7D7zatj3fEFpBB9rP2zCzBIQqvgeCYTvuccSYncohqX+6MdJUX
         TVWmaC1YzPFldjwxOoY4IIsRfSycBE3a/2UOlNPbtZdIj+s6J/aIg/R7oHp5O7rpOasA
         737w==
X-Forwarded-Encrypted: i=1; AJvYcCWfrWW6EAF0UTJQOdynXCHsaelfXuuIaMcEe1Ox17VvgpJ0UzYZiQhoBo4HLHdbVFXRHmTJELB8Yzk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9M5GpcabJfRAUIQrnoiPt/9mpkYeimI/3M0yzJJGXxwYnPF/r
	lY65nddPqvQ96K9cjhveK53bBQ4ulVsABQ+juKAY7jm85Mo/bb+97+ndLNI2u3T0ZRQcotHW/i/
	YQE6FTN/oHyRuCCp0dvb+uwPT9gRDILJKmsYSPYybF7zmuXPnSVsJu5+hiNw=
X-Gm-Gg: ASbGncvPgaEG5miIkzLjxvxLiuBWOBOA3CH3tRoET/NpxZOCFouxpISl/Sgu00Dll0z
	BsQpf9tob2myCNCqdSJLRpIRz1uz0c/jenDkHpe7NiHxF84c4AfstB+tQV9InPWgesu5sMcV5wV
	vYy0cqTgopfU4L7fa8aM2dufkKDUNXS+LmaZUDfY/5FGXQFarj14w4O73bya+xVngkCZNOH59sW
	7FkXS2uGNUp/QQie5V2baIZfkFF0dFGWjEv2UYjIKnCeN80jhFy5Qalu/OfWG99yDHH1zJLgNBP
	EJ4ToKjhIbJ7024OijN7
X-Received: by 2002:a05:6a20:431c:b0:1e5:c43f:f36d with SMTP id adf61e73a8af0-1eb214983d0mr32096449637.18.1737478153701;
        Tue, 21 Jan 2025 08:49:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGK+10QZD8bhtsNoLF/s8bl0A0mZrtsRYjogaxzR5PSerPRw4ABtJcMzE+8Su4kjIZzNS0YtA==
X-Received: by 2002:a05:6a20:431c:b0:1e5:c43f:f36d with SMTP id adf61e73a8af0-1eb214983d0mr32096402637.18.1737478153251;
        Tue, 21 Jan 2025 08:49:13 -0800 (PST)
Received: from [192.168.29.15] ([49.37.131.186])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72dab7f2e73sm9314735b3a.32.2025.01.21.08.49.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jan 2025 08:49:12 -0800 (PST)
Message-ID: <d308300f-2559-4d13-8d15-5a2416ac00c9@oss.qualcomm.com>
Date: Tue, 21 Jan 2025 22:19:08 +0530
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
Content-Language: en-US
From: Prashanth K <prashanth.k@oss.qualcomm.com>
In-Reply-To: <e36303c0-9d1f-4c66-bc40-891958507275@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 0qsLX-Hoio1Gn_XvoCkhvqKsc9XdXSTz
X-Proofpoint-ORIG-GUID: 0qsLX-Hoio1Gn_XvoCkhvqKsc9XdXSTz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-21_07,2025-01-21_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=1 adultscore=0 suspectscore=0
 mlxscore=0 phishscore=0 mlxlogscore=544 bulkscore=1 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501210136



On 21-01-25 08:36 pm, Alan Stern wrote:
> On Tue, Jan 21, 2025 at 09:50:08AM +0530, Prashanth K wrote:
>>
>>
>> On 20-01-25 08:17 pm, Alan Stern wrote:
>>> On Mon, Jan 20, 2025 at 04:47:02PM +0530, Prashanth K wrote:
>>>> Currently CONFIG_USB_GADGET_VBUS_DRAW limits the maximum current
>>>> drawn from Vbus to be up to 500mA. However USB gadget operating
>>>> in SuperSpeed or higher can draw up to 900mA. Also, MaxPower in
>>>> ConfigFS takes its default value from this config. Hence increase
>>>> the allowed range of CONFIG_USB_GADGET_VBUS_DRAW to 900mA.
>>>
>>> Is this the sort of thing that really needs to be a Kconfig option?  Why 
>>> not make the decision at runtime, based on the needs of the gadget or 
>>> function drivers and the connection speed?
>>>
>>> Alan Stern
>>>
>>
>> Right, set_config() in composite.c does this in runtime based on the
>> values of MaxPower (from configFS), VBUS_DRAW defconfig and speed.
>> If we don't set MaxPower from configFS, this config helps to set it
>> during compile time. In fact MaxPower in configFS takes its default
>> value from CONFIG_USB_GADGET_VBUS_DRAW . Sent this patch because Kconfig
>> has this limitation where it's only allowing values upto 500mA.
> 
> Why does MaxPower need to be set at compile time?  Why not set it at 
> runtime instead?
> 
> If MaxPower gets set at runtime then it can take its default value to be 
> 500 mA or 900 mA depending on the connection speed.  There will be no 
> need for CONFIG_USB_GAGDGET_VBUS_DRAW.
> 

Yes, agreed. Can we mark CONFIG_USB_GAGDGET_VBUS_DRAW as legacy and
maybe also avoid configfs/composite from using it?

> You are trying to improve a compile-time limitation on a quantity which 
> isn't known until runtime.  The whole idea of doing it that way is 
> fundamentally wrong.  You shouldn't try to improve it a little, you 
> should fix the basic mistake by doing everything at runtime.
> 
> Alan Stern
> 
Regards,
Prashanth K


