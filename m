Return-Path: <linux-usb+bounces-22730-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A5CA7F400
	for <lists+linux-usb@lfdr.de>; Tue,  8 Apr 2025 07:08:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6A3E0189817C
	for <lists+linux-usb@lfdr.de>; Tue,  8 Apr 2025 05:07:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BBBB226170;
	Tue,  8 Apr 2025 05:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QLza2bPa"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6FBA1EE7BE
	for <linux-usb@vger.kernel.org>; Tue,  8 Apr 2025 05:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744088826; cv=none; b=YIkoCA9bnaWqvKh8MgrfTqeyfuria+JGHj1R9j03+nTJjUwN1DsyPhqtPXbj7tYydV5ZkNLxP7O+oBEqnaPxGwMkJwfWGpd/NXOf7iuLptgvTbMk+nGbqzXzs6Z6JitVcxzRM8D/KFzsiGyEfQvjI1SIrd8mLeU0heVamrxmHak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744088826; c=relaxed/simple;
	bh=yhBwHLfqizqpyzfV7mejkBNdj+OfgWkT3OTFaUEypWs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tfAUmheBjrXRtQcc3fpj8kFIQhR8+wlonqvx9Xym1Rroa6aXrksBcgFi9cmXiSdqUWLzwX08VVZ6QRWLupxiiHZAMEnItTPb19qa0SVjoXkW0cY+iXi9EYAtcP73FJ+bD9madDyUP7lWMHFs0dQPkimo6GZPcmkx1+XnRRJoZPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QLza2bPa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5382GNOM020179
	for <linux-usb@vger.kernel.org>; Tue, 8 Apr 2025 05:07:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rzU7UwodG3qyyW6TQN+vCBbVngzgxvfapCtRJnPw7nk=; b=QLza2bPaj2nYauIK
	xv4qHMYfNockI3TQpGfo0gIadcFwzFHUeZpmvIfbPokJWTlCGKsCzG8+tQYHBVvk
	YRijof9ijgRc/H6i/zlmlRO2MDovRP3yb7vJLoB+RYlp4OG9+I+k8bwIOX2XYHBY
	NEtGc5QbAngV0CMx6N/l5QTCMc4+p9Jhl/X3W1I5c3Uq2ifEv5GHNysoLFU+hp/Y
	L0s1gRDgmampmwF3W2XjU8lLqiuLw6Lq8gE8rd1hVudCG//rCIcaV73HkAMcNVI/
	UiXRkOnwaaViE9yqukIXN3L9g8fK/PdDMXrnPNrTaN/zoFtoSsSgOS0yR1WllFXe
	rNk+Jw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twd2pj3v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 08 Apr 2025 05:07:03 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2255ae39f8fso64601595ad.0
        for <linux-usb@vger.kernel.org>; Mon, 07 Apr 2025 22:07:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744088822; x=1744693622;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rzU7UwodG3qyyW6TQN+vCBbVngzgxvfapCtRJnPw7nk=;
        b=jaauL5fSsY9yae6utRPrS6bY6xATFUrNwpFpehFvJqAe/5YVtzeOry/DnF5xVvum87
         6JBdn3aqZ0dlJugpXEw8v7g9B9hHZuk3XOuJJhop04nH0nyjpTzdJTDV2CChYPhSEKD4
         2LsO5IgXBfAlxSejzbW5bcwNgXPX4AUIly8M+JnSDjm+xdOuxEtO75ucf56xi9zghrrl
         gD5SLcLwo+Vp8o6sKxa28vQI1SokcLss+IxkvD5L/nyRKYc6b1+gRULYnKkbJ2x74q5x
         g7kToCfFWDmKo+6mss9zx10zSJ1kmofw9o3HBFA+PQRyq8z+5oKh4GaAD4ShA1xWVU7O
         O2TA==
X-Forwarded-Encrypted: i=1; AJvYcCXdDZrOB6WvrZPAw+/wBlTJ0ORMewGlK4OaF/Z3sqxhUlds0Z3bzQaqClAEhz/wP42bv6Yxv9CYk08=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWNGUFBLA7Ny9MS8CnZ//Lw5iky/BLi0R1mfnhkel1v0KmU0Ds
	WpAguXE3r5RVTtLyeP+3xdB7AteQwomXQs/X3ikZ/BZblsbA47CCHVNxsJgL8WPbjYk+6fqJz0x
	mpgjqQpJrnLmiRdqyl8miexKzWuqhs7Ec+AC33ocQGO913WDmJLfJ4RqG+UzLU81jgfU=
X-Gm-Gg: ASbGncto+7vUi3Cdku124LslbkeDxp6YZAZZPN3ujhs34tDZef79Zjn1mX2IyXInBWg
	EBx9gFH8Psce9jQTPUPqgCoka/KEPzwwijg5LdtHSnWgNMK/w9twOgrwKlDWds4c+B56ZgZdBGJ
	7VFnyDkKxRGssRYX6dWQtVBgupvTb//bKnVJZ8Tj4Wc4hqXtrcjEzecLsjfWiLCA31QWQ+JQoBi
	mHhM9+U+IYQGLN8daYpQ4GgEIfpZ/RotUf7JYFRpTzNlqjYY8wvWxRd9dYvSD89ehraegOGd9N/
	/MdhEUWWB6qu/mJG9H0xcPlzJgWHnEXmzmhpGxqV
X-Received: by 2002:a17:902:ebc1:b0:21f:2e:4e4e with SMTP id d9443c01a7336-22ab5dfefe3mr29164375ad.5.1744088822425;
        Mon, 07 Apr 2025 22:07:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEFOi+qFW074grRZM0tmColcpxEW6e8LT50yPGQePLPiAI5I4fAS+ASkr4Q4/ratkRlpN20mg==
X-Received: by 2002:a17:902:ebc1:b0:21f:2e:4e4e with SMTP id d9443c01a7336-22ab5dfefe3mr29164095ad.5.1744088822027;
        Mon, 07 Apr 2025 22:07:02 -0700 (PDT)
Received: from [10.218.35.239] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2297866cd1dsm90538615ad.159.2025.04.07.22.06.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Apr 2025 22:07:01 -0700 (PDT)
Message-ID: <4d68cb04-377f-4ebf-99c7-c63b68aebf60@oss.qualcomm.com>
Date: Tue, 8 Apr 2025 10:36:58 +0530
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] usb: gadget: Use get_status callback to set remote
 wakeup capability
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kees Bakker <kees@ijzerbout.nl>,
        William McVicker <willmcvicker@google.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "stable@kernel.org" <stable@kernel.org>
References: <20250403110805.865311-1-prashanth.k@oss.qualcomm.com>
 <20250403110805.865311-3-prashanth.k@oss.qualcomm.com>
 <20250408011758.qfdflgrrmahwmfqi@synopsys.com>
Content-Language: en-US
From: Prashanth K <prashanth.k@oss.qualcomm.com>
In-Reply-To: <20250408011758.qfdflgrrmahwmfqi@synopsys.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Kb3tyxqLl_EMNhSvT9869WIWUJtgcfIi
X-Proofpoint-GUID: Kb3tyxqLl_EMNhSvT9869WIWUJtgcfIi
X-Authority-Analysis: v=2.4 cv=NaLm13D4 c=1 sm=1 tr=0 ts=67f4aef7 cx=c_pps a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=HQgqQy662UQdokkEDRwA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_01,2025-04-07_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 clxscore=1015 phishscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080035



On 08-04-25 06:48 am, Thinh Nguyen wrote:
> On Thu, Apr 03, 2025, Prashanth K wrote:
>> Currently when the host sends GET_STATUS request for an interface,
>> we use get_status callbacks to set/clear remote wakeup capability
>> of that interface. And if get_status callback isn't present for
>> that interface, then we assume its remote wakeup capability based
>> on bmAttributes.
>>
>> Now consider a scenario, where we have a USB configuration with
>> multiple interfaces (say ECM + ADB), here ECM is remote wakeup
>> capable and as of now ADB isn't. And bmAttributes will indicate
>> the device as wakeup capable. With the current implementation,
>> when host sends GET_STATUS request for both interfaces, we will
>> set FUNC_RW_CAP for both. This results in USB3 CV Chapter 9.15
>> (Function Remote Wakeup Test) failures as host expects remote
>> wakeup from both interfaces.
>>
>> The above scenario is just an example, and the failure can be
>> observed if we use configuration with any interface except ECM.
>> Hence avoid configuring remote wakeup capability from composite
>> driver based on bmAttributes, instead use get_status callbacks
>> and let the function drivers decide this.
>>
>> Cc: stable@kernel.org
>> Fixes: 481c225c4802 ("usb: gadget: Handle function suspend feature selector")
>> Signed-off-by: Prashanth K <prashanth.k@oss.qualcomm.com>
>> ---
>>  drivers/usb/gadget/composite.c | 12 ++++--------
>>  1 file changed, 4 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/usb/gadget/composite.c b/drivers/usb/gadget/composite.c
>> index 869ad99afb48..5c6da360e95b 100644
>> --- a/drivers/usb/gadget/composite.c
>> +++ b/drivers/usb/gadget/composite.c
>> @@ -2010,16 +2010,12 @@ composite_setup(struct usb_gadget *gadget, const struct usb_ctrlrequest *ctrl)
>>  			break;
>>  
>>  		if (f->get_status) {
>> -			status = f->get_status(f);
>> +			/* if D5 is not set, then device is not wakeup capable */
>> +			if (f->config->bmAttributes & USB_CONFIG_ATT_WAKEUP)
> 
> We should allow function to execute get_status regardless of
> USB_CONFIG_ATT_WAKEUP. There are other status beside wakeup.
>
Agree with the first part, I also wanted to remove the explicit check
for USB_CONFIG_ATT_WAKEUP. But anyways kept it since only 2 bits (RW_CAP
and RW) are defined in the spec as the status of GetStatus for an Interface.

Lets do one thing, I'll rearrange it as follows

if (f->get_status) {
	status = f->get_status(f);
	
/* if D5 is not set, then device is not wakeup capable */
if (f->config->bmAttributes & USB_CONFIG_ATT_WAKEUP)
	status &= ~(USB_INTRF_STAT_FUNC_RW_CAP | USB_INTRF_STAT_FUNC_RW);

>> +				status = f->get_status(f);
>> +
>>  			if (status < 0)
>>  				break;
>> -		} else {
>> -			/* Set D0 and D1 bits based on func wakeup capability */
>> -			if (f->config->bmAttributes & USB_CONFIG_ATT_WAKEUP) {
>> -				status |= USB_INTRF_STAT_FUNC_RW_CAP;
> 
> 
> So right now we're not able to configure the function to enable RW
> capable? Perhaps we need to update the composite configfs for this?
> 

The removed code used to set USB_INTRF_STAT_FUNC_RW_CAP even for
interfaces which doesn't have RW capability. Its better to handle this
from function level than from composite.

Regards,
Prashanth K


