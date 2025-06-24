Return-Path: <linux-usb+bounces-25063-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A0EAE65F2
	for <lists+linux-usb@lfdr.de>; Tue, 24 Jun 2025 15:15:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4DE5516AF56
	for <lists+linux-usb@lfdr.de>; Tue, 24 Jun 2025 13:08:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E248D290D85;
	Tue, 24 Jun 2025 13:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QbZx1uyl"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0992291C28
	for <linux-usb@vger.kernel.org>; Tue, 24 Jun 2025 13:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750770510; cv=none; b=u1zFCRx9AMEqvkioymrV2xpIrgoW0O2C46w+zxf1oXV3wXLPMmbYCELRZ9B5c5z4fk0d0JdnrNTywM6QxVEZ3pBRfoiQtAWv3mRbBE22hUbICxcxvGAsfWpadXp/u1uwHhoTwX1T65s/MowQVr93oalTh1Vm1w5G9rploJS6DTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750770510; c=relaxed/simple;
	bh=OWhxjim2hzRwp44IATiri7aWjY41RYVfuAGrMg9lkKY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hlBKrTZOS7IyEOOkz234dq2x05ELpCZ3ISDeDXD6uV3VqNHf+6z4asajd0k+BGW7J9DxGKcqAtNaoSvW7HAXh/xd39m1FewsYY4o50VfMntXkOu8cFXxal+sLQrNVd2+0bvNtsOZoyNAo7+fGuij9pirOcpAKIHcLNbl6BYEQBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QbZx1uyl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55OBwHEL026045
	for <linux-usb@vger.kernel.org>; Tue, 24 Jun 2025 13:08:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GXCLZ7wAY3gbFYvClwpaaAkNVDWwCvFGSPtbvkJl6S4=; b=QbZx1uylK1oDoaHE
	AxheQ3bLH0vLEbfkRRSrZr/l2/yYim17/kmALfwpQKFR+X7ovIUY+p+RU1+vC2X5
	16iDRtyt4ZtNqI5TQ3L9yhwhFrAByVNva9qHM7gfny2S9up19BvOq6IeuWY8wYBR
	LVNGeTg/p3/rL63xnhH4ICX3TOjSiWEiI6v1bOtNBAZQRzGeA9Drh6rO2C3uoPMG
	UX4/IRvcJTzQHoHMWehZfO/2pQ/FhCv0SvK2L5cRcsJWUK5mNfn4ovwOQr+AkjIn
	3nObZbjWy0cXguNZsKogCNwLcEPrDKXEvNE/gosHHSTce7idiG0uCHwontU8EFH2
	c3cdoA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f8ymu7eh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 24 Jun 2025 13:08:28 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b1ffc678adfso311468a12.0
        for <linux-usb@vger.kernel.org>; Tue, 24 Jun 2025 06:08:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750770507; x=1751375307;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GXCLZ7wAY3gbFYvClwpaaAkNVDWwCvFGSPtbvkJl6S4=;
        b=pi6/wwulRzMN+19Ijb1fGeHMo1MH+8Ayu5AmzvivnNsuMkj09Ba/F+4rTNEV88JQkL
         MXW7q/EbWKv7GKmdJ7lGQh8IuJWgxOo1/OttZScw5EH3O+PHKzxbxjwYFodZr5GuTjip
         /1e9tEBun5CTwFFUXb7Pb+0BbefHUMTzKykY1QUY+67EulOudSBdnbgyDT2GFafuUw0b
         MkvewYfW3sgqg9THwgAZy1g9/v1OiXk2YMNahk/rw4HCQ3WgtiFvz9Sk0U/x6P1liOiu
         h2D0vEP9KZIsqfBNJpm/Q/XuXAMZ5FK8Ybmqb6BTle1kLtHq+fwho8ziaiV60JLsKDi7
         VNVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVdwA8XQXq1ijuIY3mr9UvLYz590hbP0zEcVKRPajyToCcK9DjLiBY+KnNWR2+V6D7SCxt8bAapTOc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWvhR/mYuGqAZgXI7Sfc6ebo1Y1cJgRj+g3M2MPItP2CQw51aA
	CkjIz9+XJjdth1Sysk0/PJc+hYQdlzH3Sbl3d6IomB+xMr6whKPyAYW2RVhHB8RTwH339ZInuQ3
	QjuKylWg+iTwcUmqmW/2cauWbm+XA09XLplsKUCGJFcW0WphLdn17gRsIsWpbg+Q=
X-Gm-Gg: ASbGncugi+trP7n+gC7LQN+zHfn09WjCA7qsnrQhUddD4nAwlmqjgdQ2aL1GWn7rvW9
	CMS1SEcHSwqE7kZ5UTWVfqIg1OYd9OBnH6izE0s5ig/Xcytl0Q7asmRydLmB2LStGGs04Kg/xqy
	pGd7EYVKLH2FUGhLfHxpHTy3P5MKB7FvZooC+8OS3giaGLI5mbdHq/KHWIlY4E6t+gu7U39NKZq
	FmlVluvAIB1N4oJIfzdFblXvPNIdJImYGI0UntlBMGbQbYp08EWWZ0JKh/mWcoBDIrAVjMuYsIJ
	STyJwg4SdRqH5hsNs7pY/HseaucsR25ypTxIX1I/MUQ3d8/GqgulcAOvbXuevelOubgwqjrT7A=
	=
X-Received: by 2002:a05:6a00:9a0:b0:749:93d:b098 with SMTP id d2e1a72fcca58-7490db4278fmr17729268b3a.22.1750770507030;
        Tue, 24 Jun 2025 06:08:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFaLKteWP9POVkOhi2cCkGrtK+lX6AAeVvFFXqxc3EwlHw8pY4QVWlpLKOHl1nNiBko7q5DOw==
X-Received: by 2002:a05:6a00:9a0:b0:749:93d:b098 with SMTP id d2e1a72fcca58-7490db4278fmr17729252b3a.22.1750770506624;
        Tue, 24 Jun 2025 06:08:26 -0700 (PDT)
Received: from [192.168.0.126] ([2401:fb00:ffff:fffc:0:1:ac11:493f])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-749c88721b9sm1836215b3a.150.2025.06.24.06.08.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 06:08:26 -0700 (PDT)
Message-ID: <72f9de63-dc19-4467-b883-8637f95a8e82@oss.qualcomm.com>
Date: Tue, 24 Jun 2025 18:38:22 +0530
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] usb: dwc3: qcom: Facilitate autosuspend during
 host mode
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20250610091357.2983085-1-krishna.kurapati@oss.qualcomm.com>
 <20250610091357.2983085-4-krishna.kurapati@oss.qualcomm.com>
 <20250623235856.b2jwgf5j6yup2sww@synopsys.com>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <20250623235856.b2jwgf5j6yup2sww@synopsys.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDExMCBTYWx0ZWRfX0C7vfrKleqIA
 4tnFPsX8zyyJXoVcQu1bvc0ADYCQug2NfEh1ziixoxdyQ9kfAX520X6o5ef+SkjlZdbMUgN5lIH
 ed+3IJ9VGElcYGup00wq4NbDVdKtAbJDmQbe4SkVwP/vJGwirWImkykTUww1wcRU/qVViwcqpdi
 DLks+zZy1sMWVBleeg7NijCNvw/tNkm3lm+yZWtOP50iE13G308ZyXltWhZ0MFbdY0ozanZpJ0m
 zJAG4gcL065jNBc0SHY5ca4Qd3m3eRnyuG+lv06Tk452zXGBeiIxVIn0lZbjF9hbSqd5Ifo4mfu
 8EL9OxYtMm5X4wk/n/zHbfVdJCWFRogMwjYdgCLlbGvWM6MHn+iJL9Bi6T+ZCDYx4ulnNpngqO8
 CDtQuuCgLCaHloDnkANSFf9/w9gDsm0Bdjb43PwTIM2cxe1CmkOlWPrmFCVXP7M+rmc2Bnbw
X-Proofpoint-ORIG-GUID: o8WcntGZPOca3nQ0V4otC4G_FerZpQv4
X-Proofpoint-GUID: o8WcntGZPOca3nQ0V4otC4G_FerZpQv4
X-Authority-Analysis: v=2.4 cv=GLYIEvNK c=1 sm=1 tr=0 ts=685aa34c cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=biFwQZO8mOkSj3tXal0A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_05,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 mlxscore=0 mlxlogscore=999 phishscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506240110



On 6/24/2025 5:29 AM, Thinh Nguyen wrote:
> On Tue, Jun 10, 2025, Krishna Kurapati wrote:
>> When in host mode, it is intended that the controller goes to suspend
>> state to save power and wait for interrupts from connected peripheral
>> to wake it up. This is particularly used in cases where a HID or Audio
>> device is connected. In such scenarios, the usb controller can enter
>> auto suspend and resume action after getting interrupts from the
>> connected device.
>>
>> Allow autosuspend for and xhci device and allow userspace to decide
>> whether to enable this functionality.
>>
>> a) Register to usb-core notifications in set_role vendor callback to
>> identify when root hubs are being created. Configure them to
>> use_autosuspend.
>>
>> b) Identify usb core notifications where the HCD is being added and
>> enable autosuspend for that particular xhci device.
>>
>> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>


[...]

>> +static int dwc3_xhci_event_notifier(struct notifier_block *nb,
>> +				    unsigned long event, void *ptr)
>> +{
>> +	struct dwc3_qcom  *qcom	= container_of(nb, struct dwc3_qcom, xhci_nb);
>> +	struct dwc3	  *dwc	= &qcom->dwc;
>> +	struct usb_bus	  *ubus	= ptr;
>> +	struct usb_hcd	  *hcd;
>> +
>> +	if (!dwc->xhci)
>> +		goto done;
>> +
>> +	hcd = platform_get_drvdata(dwc->xhci);
>> +	if (!hcd)
>> +		goto done;
>> +
>> +	if (event != USB_BUS_ADD)
>> +		goto done;
>> +
>> +	if (strcmp(dev_name(ubus->sysdev), dev_name(dwc->sysdev)) != 0)
> 
> Can this be false? If possible, I'd like to avoid these pointers and
> strcmp here.
> 

Needed this to identify if the dwc3 pointer corresponds to this glue or 
not. This can be false.

BTW, Dmitry suggested to just do "runtime_use_autosuspend" inside probe 
of xhci-plat.c and remove this logic. Hope that would be fine ?

>> +		goto done;
>> +
>> +	if (event == USB_BUS_ADD) {
> 
> This condition is redundant when you have the check a few lines above.
> 

ACK.

>> +		/*
>> +		 * Identify instant of creation of primary hcd and
>> +		 * mark xhci as autosuspend capable at this point.
>> +		 */
>> +		pm_runtime_use_autosuspend(&dwc->xhci->dev);
>> +	}
>> +
>> +done:
>> +	return NOTIFY_DONE;
>> +}
>> +
>>   static void dwc3_qcom_set_role_notifier(struct dwc3 *dwc, enum usb_role next_role)
>>   {
>>   	struct dwc3_qcom *qcom = to_dwc3_qcom(dwc);
>> @@ -659,12 +694,22 @@ static void dwc3_qcom_set_role_notifier(struct dwc3 *dwc, enum usb_role next_rol
>>   		return;
>>   	}
>>   
>> -	if (qcom->current_role == USB_ROLE_DEVICE &&
>> -	    next_role != USB_ROLE_DEVICE)
>> +	if (qcom->current_role == USB_ROLE_NONE) {
>> +		if (next_role == USB_ROLE_DEVICE) {
>> +			dwc3_qcom_vbus_override_enable(qcom, true);
>> +		} else if (next_role == USB_ROLE_HOST) {
>> +			qcom->xhci_nb.notifier_call = dwc3_xhci_event_notifier;
>> +			usb_register_notify(&qcom->xhci_nb);
>> +		}
>> +	} else if (qcom->current_role == USB_ROLE_DEVICE &&
>> +		   next_role != USB_ROLE_DEVICE) {
>>   		dwc3_qcom_vbus_override_enable(qcom, false);
>> -	else if ((qcom->current_role != USB_ROLE_DEVICE) &&
>> -		 (next_role == USB_ROLE_DEVICE))
>> -		dwc3_qcom_vbus_override_enable(qcom, true);
>> +	} else if (qcom->current_role == USB_ROLE_HOST) {
>> +		if (next_role == USB_ROLE_NONE)
>> +			usb_unregister_notify(&qcom->xhci_nb);
>> +		else if (next_role == USB_ROLE_DEVICE)
>> +			dwc3_qcom_vbus_override_enable(qcom, true);
> 
> We don't unregister the notifier when switching from host to device?
> 

ACK. My bad, missed it.

Thanks for the review.

Regards,
Krishna,

