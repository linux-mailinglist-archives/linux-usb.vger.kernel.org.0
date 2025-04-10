Return-Path: <linux-usb+bounces-22873-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 658E2A8389F
	for <lists+linux-usb@lfdr.de>; Thu, 10 Apr 2025 07:48:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 425687A6A82
	for <lists+linux-usb@lfdr.de>; Thu, 10 Apr 2025 05:47:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED6FB201033;
	Thu, 10 Apr 2025 05:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HNiblCwb"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2E841E5B71
	for <linux-usb@vger.kernel.org>; Thu, 10 Apr 2025 05:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744264113; cv=none; b=IAxbfERCKKthOlujlqRjPkO/oEQADJcdxiKsGgibAbPXRAs8smfky03CHALx8bEfa2geDk9tulpT5ron+gd3eCkkKOOwIgd+6mJHiegKEfQe5KWb3M00ujpsMMtqRMLmbRw9pxqk6OOSfgkACsNHvVK2is1CtEr5qzO0ADUN++k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744264113; c=relaxed/simple;
	bh=7HPB4C6hG5RveqzVOYqClm26/z8XxekYphPB5BsB7jU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZGJb2/x0f8Dxmho6uXnucq+zh8+CXxdugkwBZilkO2e0EnIsyYqAbG5kBYVG6fkY4vfFqWaQT+pA3x0GO5KfSwyKV9O2NeuihQESPNKrI2LUEqUTABdk0W54IKwu3GveRKMt0zMC7ZV7bFoWuoH3RSogUXsoIgzfCGbw0JtnL4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HNiblCwb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53A5Uolu006630
	for <linux-usb@vger.kernel.org>; Thu, 10 Apr 2025 05:48:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fto71A2vBF+o06+1sO8jWrZT7txIGRj9I+GBH3AAlBs=; b=HNiblCwbf0OCvaHM
	ypBHpSJNmhsXdENuvPhVP5CSygM65j5oCJKHpUbAwd+gKnun8NKnxZGfUV39DCqT
	PysivpDHaZgevQB741wz9xkFLmJVC7GLMO7h4k8sj/BjIaC7UqEH283oKNb+Fh9b
	fb2d/4+rVfD7kUzfMlBct48/4SXsA7CzNrxrpBryAqI6AMsnze7y53JBgXRFIE8W
	yxd572cyu0S7wIm26vG6gzRFqAlyr7L1gfgiIobWegjaKOg/qMASzLs5aB+87zZZ
	EI30PJww934TnvPvqLFs2letkcqA5HY1fjiMrf6q0ZwhZodFP7vH6upwVdnUrVfe
	rGcliw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twtb5ujk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 10 Apr 2025 05:48:30 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-736b2a25d9fso358928b3a.0
        for <linux-usb@vger.kernel.org>; Wed, 09 Apr 2025 22:48:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744264109; x=1744868909;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fto71A2vBF+o06+1sO8jWrZT7txIGRj9I+GBH3AAlBs=;
        b=uSV8M3w5TMAOu9Qc0BL+Ps4MYAwkPQpsG8XgcDCbhwRCSPA80zMr5aBsXwOM3lJoG8
         yOTfJjkR9RGuIshhXK6Y04YeREv3SmUXVr6OkZgm5Ds9tTT8iEbuSC0/2l4n8veHx6E+
         FIXu0fF5VAg7/sNtCyeYrzTAnntidd/HOkV4++H92/l43Yo1ygbGPaDY0By6MbVX7kou
         Y9Mk69kJKcRlKkkJRb8nFW7cyJzRQ7sf2W78Jg/hte+FpqWF1TEgvm/kaJq/fXAnHhza
         nU4BVN0IHxIrU7RYxwMpZyJ+yWFZuynATzUNFVYZkow4V1Y/Y1r21UdJXLUG5GorDjqc
         XmZw==
X-Forwarded-Encrypted: i=1; AJvYcCWhLw1v0UpTh7IJ5+9aMrnbL8lH79y3b7jEM+1JcHXOJ2WyOpvnhDHKkI5QlQvQd2yvX4W67oYEMvM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxeKu1PzJhHUgDGaQ//z0DTWVA5UVr2QB3fiu59QREsvzs8VzDu
	OS0GPl3UcJUQp1l/wvjD2d1zaqTInGLS+0ZEN+7+MVxom3qZ2wbF06tuded76Ff1Ido5cgRcqW7
	VfLiWoGUkpWY+vGactgmgcqLUNT3KY/56YBdEqKDaz8JZt1bgLjNpOV2oKhbx7ANZo8k=
X-Gm-Gg: ASbGncsnCWp+E6RzIefwuywkEWIK45BPVtLsqHWdB7/fvcagGH5gO+S3zO4vfN8a8Lm
	S+BUtP/R57JADUDoMW/MR+Hps55zaYr3WdKZ4IyT/sH5rHblG1r9XLmj4RUjt4UZ1jSn8JIY7tu
	PkDROGa3ra0rOvlHOCwPBoJY4MRfp1iZqC5YCSoY9kpMb5Ee/d6JebOapEDw0TgeGpfamWg9mvj
	QVsJshlAB/r0l3tP4PzdZkRr5XiplRh1TGrwAeDSiD++SxvlsOcXoWOkLAPrAYwqm9IFM18HPVh
	x3oYfLto9MbUTmATczvHPOhEqvfeKpXBdJdO5w==
X-Received: by 2002:a05:6a00:2e16:b0:730:95a6:375f with SMTP id d2e1a72fcca58-73bc0a176b5mr1716193b3a.3.1744264109529;
        Wed, 09 Apr 2025 22:48:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEOndUpg1XsPJBAfCy6plpCiUpoFwdwwZ4YOy0Tb9egEkXZXfORzoMZQBdjurZZitPCQa9KdQ==
X-Received: by 2002:a05:6a00:2e16:b0:730:95a6:375f with SMTP id d2e1a72fcca58-73bc0a176b5mr1716175b3a.3.1744264109029;
        Wed, 09 Apr 2025 22:48:29 -0700 (PDT)
Received: from [192.168.29.15] ([49.37.108.152])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bb1d44c31sm2407196b3a.38.2025.04.09.22.48.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Apr 2025 22:48:28 -0700 (PDT)
Message-ID: <bbe1af12-3aaf-4382-b8c8-5d645ea9d906@oss.qualcomm.com>
Date: Thu, 10 Apr 2025 11:18:22 +0530
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] usb: dwc3: gadget: Make gadget_wakeup asynchronous
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kees Bakker <kees@ijzerbout.nl>,
        William McVicker <willmcvicker@google.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "stable@kernel.org" <stable@kernel.org>
References: <20250403110805.865311-1-prashanth.k@oss.qualcomm.com>
 <20250403110805.865311-4-prashanth.k@oss.qualcomm.com>
 <20250407233757.jmtohzgm4xebjndn@synopsys.com>
 <10bf04c1-f040-4646-9484-70827db36d27@oss.qualcomm.com>
 <20250409004330.iflfdxabodalsmox@synopsys.com>
 <468898dd-8b57-4fb5-bef1-d47ffbc38846@oss.qualcomm.com>
 <20250409215151.thkmgzyeohyxhslh@synopsys.com>
Content-Language: en-US
From: Prashanth K <prashanth.k@oss.qualcomm.com>
In-Reply-To: <20250409215151.thkmgzyeohyxhslh@synopsys.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: mPiFKr5ax6tG0XeV1pViHQkN8pUC6CjT
X-Authority-Analysis: v=2.4 cv=LLlmQIW9 c=1 sm=1 tr=0 ts=67f75baf cx=c_pps a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=pWYFwPD2pogPt9fXZc2mdA==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=BO5IBNuD8639gGEQwbYA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: mPiFKr5ax6tG0XeV1pViHQkN8pUC6CjT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_06,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 clxscore=1015 mlxlogscore=999 malwarescore=0 phishscore=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 spamscore=0 adultscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504100042



On 10-04-25 03:21 am, Thinh Nguyen wrote:
> On Wed, Apr 09, 2025, Prashanth K wrote:
>>
>>
>> On 09-04-25 06:13 am, Thinh Nguyen wrote:
>>> On Tue, Apr 08, 2025, Prashanth K wrote:
>>>>
>>>>
>>>> On 08-04-25 05:08 am, Thinh Nguyen wrote:
>>>>> On Thu, Apr 03, 2025, Prashanth K wrote:
>>>
>>>>>> @@ -4398,6 +4371,21 @@ static void dwc3_gadget_linksts_change_interrupt(struct dwc3 *dwc,
>>>>>>  	}
>>>>>>  
>>>>>>  	dwc->link_state = next;
>>>>>> +
>>>>>> +	/* Proceed with func wakeup if any interfaces that has requested */
>>>>>> +	while (dwc->func_wakeup_pending && (next == DWC3_LINK_STATE_U0)) {
>>>>>> +		if (dwc->func_wakeup_pending & BIT(0)) {
>>>>>> +			ret = dwc3_send_gadget_generic_command(dwc, DWC3_DGCMD_DEV_NOTIFICATION,
>>>>>> +							       DWC3_DGCMDPAR_DN_FUNC_WAKE |
>>>>>> +							       DWC3_DGCMDPAR_INTF_SEL(intf_id));
>>>>>> +			if (ret)
>>>>>> +				dev_err(dwc->dev, "function remote wakeup failed for %d, ret:%d\n",
>>>>>> +					intf_id, ret);
>>>>>> +		}
>>>>>> +		dwc->func_wakeup_pending >>= 1;
>>>>>
>>>>> This would break the bitmap of dwc->func_wakeup_pending. Perhaps we can
>>>>> use ffs(x) to properly find and clear the interface ID from the bitmap
>>>>> one at a time.
>>>>>
>>>> Yes, we can use ffs(x). But I didn't understand how this would break
>>>> bitmap of dwc->func_wakeup_pending.
>>>>
>>>
>>> Since you're sending device notification to all the wakeup armed
>>> interfaces and not reusing the func_wakeup_pending afterward, the result
>>> of what you're doing here will be the same.
>>>
>>> IMHO, for clarity, what I was suggesting is to revise the logic to
>>> preserve the dwc->func_wakeup_pending bitmap instead of shifting and
>>> overwriting it, causing the bitmap to no longer match the intf_id. We
>>> get the intf_id from the bitmap and clear the intf_id bit from the
>>> bitmap as we go.
>>>
>> The above logic works, but as you suggested I'll refactor it using
>> ffs(x) and clear the intf_id directly (instead of shifting).
>>
>> Does this look good?
> 
> It looks great!
> 
>>
>> /* Proceed with func wakeup if any interfaces that has requested */
>> while (dwc->func_wakeup_pending && (next == DWC3_LINK_STATE_U0)) {
>> 	intf_id = ffs(dwc->func_wakeup_pending);
>> 	if (intf_id)
>> 		ret = dwc3_send_gadget_generic_command(dwc, DWC3_DGCMD_DEV_NOTIFICATION,
>> 							   DWC3_DGCMDPAR_DN_FUNC_WAKE |
>> 							   DWC3_DGCMDPAR_INTF_SEL(intf_id - 1));
>> 		if (ret)
>> 			dev_err(dwc->dev, "function remote wakeup failed for %d, ret:%d\n",
>> 				intf_id, ret);
>> 	}
>> 	dwc->func_wakeup_pending &= ~(1 << (intf_id - 1));
> 
> 
> Some minor revision. How does this look? (not tested)
> 
> while (dwc->func_wakeup_pending && (next == DWC3_LINK_STATE_U0)) {
> 	intf_id = ffs(dwc->func_wakeup_pending) - 1;
> 	ret = dwc3_send_gadget_generic_command(dwc, DWC3_DGCMD_DEV_NOTIFICATION,
> 					       DWC3_DGCMDPAR_DN_FUNC_WAKE |
> 			                       DWC3_DGCMDPAR_INTF_SEL(intf_id));
> 	if (ret)
> 		dev_err(dwc->dev, "Failed to send DN wake for intf %d\n", intf_id);
> 
> 	dwc->func_wakeup_pending &= ~BIT(intf_id);
> }
> 
> Thanks,
> Thinh

Good suggestion, ideally it should work, I'll test and add it in v2.

Thanks,
Prashanth K

