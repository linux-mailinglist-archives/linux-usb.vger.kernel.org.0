Return-Path: <linux-usb+bounces-22876-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7334BA838EB
	for <lists+linux-usb@lfdr.de>; Thu, 10 Apr 2025 08:08:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AC3E28C0B68
	for <lists+linux-usb@lfdr.de>; Thu, 10 Apr 2025 06:08:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01F7C202989;
	Thu, 10 Apr 2025 06:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L0b60taz"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D9541FDE31
	for <linux-usb@vger.kernel.org>; Thu, 10 Apr 2025 06:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744265293; cv=none; b=S9bvOEDZIzlgZWO18ywBZcnLuXbUf6y8DQgI6iOv3d5+GcldDrukzA+nRCAYKYROOdsjjoKqpkgu69RgGshrYvSnf5a8xJnovr3dT13tiqYFEdNngscX36UkH4R37lUm3CuQaw0rCUl7PBYQGAL0LmzKsNB7YybKrh9U0WjdZio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744265293; c=relaxed/simple;
	bh=rcFPXd+PyG2j8YKXDK5TE8WokieFvBLw4xHGkuYL270=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LlQJxvC2+jnYda5WzrRvE8vY+IgEVwkQe/x1bPOtndW1DlhczS7hU2eAzUfaLDbsypv+o9y20/LR15G4RB9cVWo7YnHT06o+hl5GpNynjE9ywlt7ZhfqFVgfzLlO1B3IgH9LmepHACJzH/LqzcH+pvpwAk7z8uyIVfJCHs1p5R8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L0b60taz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53A5UGip010876
	for <linux-usb@vger.kernel.org>; Thu, 10 Apr 2025 06:08:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c65/dq03YDlqT69lZS9YUG+UsJpEZoVLdFL5ZINuezA=; b=L0b60tazFeD6iY8e
	4HvYZ3rPKlDtfZ1vhQ3PjYoqb5QdO5pZl/rVYtVwLra416K1qW8T6jZErjQZ52SG
	HxjyDXf4vQnAaIab9A2ErIOtRn7AZQziogDFh4PEQypEY9YQQcey38UJyYb7gp/+
	kqRK68Ky2Z+DooRtH5dB4j1oujH8ukqQ/MviepQK4QVojRGCHYtfkpmnPzLTL+KX
	ebPtBzchQtKIUkiBIuY2PCt9iIXbSTQYSWN2wGFuu57abxSt6lujV757rK4ZnZQ9
	S8ArPYoNd9YjYA2oTaI5UwH7qZgNuEW6ua91jOedfl9fjjU6jSV6AD24uLNMvWi+
	Dj2AwQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twftnms7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 10 Apr 2025 06:08:11 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-af51d92201fso625958a12.0
        for <linux-usb@vger.kernel.org>; Wed, 09 Apr 2025 23:08:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744265290; x=1744870090;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c65/dq03YDlqT69lZS9YUG+UsJpEZoVLdFL5ZINuezA=;
        b=lX2d5TwuaOlnBFzsedTy0CLP1dLJzt+P014lSIyC/wDpoyA6e6lYRNGQlaJEidyp66
         0s1OfnCtaLpxILrSoo1XS3kVx+AYeVyWrD1vjqxI8Y5XX4BgoF2QsrANXkTnPDs7vvsA
         +GvZmDnFUffix4dee0kWfzbl++PXYQ86XPXeRaqW3jmz2NW62AaShlWpMVXqBsp8XQZr
         Ul2h2LY9H6FIHmzuukSf1rfbws3cAqBxCdo6UUaUHyFFi0kQAIPHs/QiV8apglyjUvrD
         F52XK7FWTf6blpQvVwvng7Gx6VdHuzZj9+im96X7SxKR5jVhBmcmkMA3AUYyRAeRGTz+
         X9CA==
X-Forwarded-Encrypted: i=1; AJvYcCXep05VxyxHdAHfiEHIGMnScyfCpUc85pxxSRJbKQsnf6YOHGRcYE/fnoEo1/7Zxww519s3Tq37gXo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwErziV+lCzwDGQ4lWtXRqPkFHtdTFy44Vj6sNcofHs68+QcoT+
	BmlCFuO5cTZBTEDS6tKHdu9KUHfFlYJCa1xxu8sXceB2qg48tnmcfIIW7hLl6TY7XFhuUflpIqc
	q1VKcqP4HpmRAlVnasM/Y8AIl0pS3KR5bcX6euir/S6DotLcXQA7X+3TpWzo=
X-Gm-Gg: ASbGncvUDwJkW/wYZPQbKPVOH/Q7U51YraI/zqNr5bomRUKEarivFoJw+CTzMH14MNW
	5vHaILOlFIa9tMk0/5nk1gx2UKGaU/IsjITwdIOGMC4V4CyqK2/be7358QD2WtOmSPFTLaPWRvt
	+Fpr0KN8p1mv/t/ec0SJG+X+8Vhrq/lI4nk27UWcpNesRNvOIuKjnS4ImQE58mNbdXeCV0nc17m
	8t6/2Qmxg4Y9TKtqcxWldjk7zexGOMjd2+cS4jNXwtAgTlauQYqSpO4Y7LmtrPbC87oncMWy9b/
	XZ2hdEEcJPwrLwXVzucazq+/y85koM8tZ3Z0
X-Received: by 2002:a05:6a20:6f06:b0:1f5:8b9b:ab54 with SMTP id adf61e73a8af0-201694cb037mr2907505637.23.1744265290194;
        Wed, 09 Apr 2025 23:08:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH8MricBGPJy7z5KTQxmuVxXADC6pI74ej+8CixhRowybv6WzBxlmKULawmIeaSnOpfeJ/ubQ==
X-Received: by 2002:a05:6a20:6f06:b0:1f5:8b9b:ab54 with SMTP id adf61e73a8af0-201694cb037mr2907470637.23.1744265289757;
        Wed, 09 Apr 2025 23:08:09 -0700 (PDT)
Received: from [192.168.29.15] ([49.37.108.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bb1e6972fsm2488523b3a.171.2025.04.09.23.08.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Apr 2025 23:08:09 -0700 (PDT)
Message-ID: <2cc61d5d-656b-49d6-9d09-98c4368b1fc8@oss.qualcomm.com>
Date: Thu, 10 Apr 2025 11:38:03 +0530
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
 <4d68cb04-377f-4ebf-99c7-c63b68aebf60@oss.qualcomm.com>
 <20250409005524.fbehw2gonv3p7j2v@synopsys.com>
 <a4cc6d1b-4925-4b57-ae23-fc1e23c5efde@oss.qualcomm.com>
 <20250409220510.eynefm7fesydagpz@synopsys.com>
 <20250409221158.n5duanv2gmctrr64@synopsys.com>
Content-Language: en-US
From: Prashanth K <prashanth.k@oss.qualcomm.com>
In-Reply-To: <20250409221158.n5duanv2gmctrr64@synopsys.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=B5+50PtM c=1 sm=1 tr=0 ts=67f7604b cx=c_pps a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=cNzNqdwVgqoaoh8yHwe9gA==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=JHkCR1Z1QDo9LWSbiEIA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: NXsHWHslI2Ibo82F3dfY8CMvYPGfNOfF
X-Proofpoint-ORIG-GUID: NXsHWHslI2Ibo82F3dfY8CMvYPGfNOfF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_06,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=819
 suspectscore=0 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 lowpriorityscore=0
 mlxscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504100044



On 10-04-25 03:42 am, Thinh Nguyen wrote:
> On Wed, Apr 09, 2025, Thinh Nguyen wrote:
>> On Wed, Apr 09, 2025, Prashanth K wrote:
>>>
>>>
>>> On 09-04-25 06:25 am, Thinh Nguyen wrote:
>>>>
>>>> Not at the gadget level, I mean to create a configfs attribute common
>>>> across different functions to allow the user to enable/disable the
>>>> function wakeup capability via the configfs when you setup the function.
>>>>
>>>> What do you think?
>>>>
>>>> Thanks,
>>>> Thinh
>>>
>>> Thats a good idea, in fact I had the same thought. But thought of doing
>>> it later since its beyond the scope of this patch/series.
>>
>> The way you have it done now forces a usb3x function driver to implement
>> f->get_status to be able to respond with function wakeup capable.
>> Previously, we automatically enable function wakeup capability for all
>> functions if the USB_CONFIG_ATT_WAKEUP is set.

Currently function wakeup is implemented only on f_ecm and others don't
have the capability, so the expectation is functions should add add the
get_status callbacks while implementing remote/func wakeup and mark
itself and RW/FW capable. And if get_status callback is not there, then
func is not FW capable.

Current implementation sets RW/FW capability to all interfaces if
USB_CONFIG_ATT_WAKEUP is set (which is not right). I have provided an
example in the commit text where we incorrectly set FW capability.
>>
>> Arguably, this can cause a regression for remote capable devices to
>> operate in usb3 speeds.
> 
> Sorry typos: I mean arguably, this can cause a regression for remote
> wake capable devices to perform remote wakeup in usb3 speed.
> 
> BR,
> Thinh
> 
>>
>>>
>>> We can add a configfs attribute to enable/disable FUNC_RW_CAP, and
>>> functions can return get_status() based on the attribute.
>>>
>>
>> That would be great! This would fit this series perfectly. Let me know
>> if there's an issue.
>>
I seriously think we can take it out of this series and do that
separately. The intention of this series was to fix the wakeup
operations. And enable/disable func_wakeup from function driver would be
a new implementation. Ill take it up after this.

Regards,
Prashanth K


