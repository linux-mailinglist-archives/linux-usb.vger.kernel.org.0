Return-Path: <linux-usb+bounces-32467-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C720D39F28
	for <lists+linux-usb@lfdr.de>; Mon, 19 Jan 2026 07:59:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E5E82303C281
	for <lists+linux-usb@lfdr.de>; Mon, 19 Jan 2026 06:55:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D2AD28A72B;
	Mon, 19 Jan 2026 06:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U7QzmZGF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E9HiW3E/"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 288A428850C
	for <linux-usb@vger.kernel.org>; Mon, 19 Jan 2026 06:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768805753; cv=none; b=f3ldnBdKOmFdAIFFJ22DkihNz8FsB3wgwdLiYH8viyLWw/9j6TIgd2iCp1DOrEzBqmTXHQT9w6K+kSWVAg99Wrf5kLJQlC/jT7Ole68x09WWXCcXYAYn1Xkq3VoiUARlIixOUeW/NBQuusfZeJrRjS4+h5mgByolDYh//ODHXjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768805753; c=relaxed/simple;
	bh=oTvJzQzo9d6CzmWfDLo2qGJmON2aULDRqlUmMkM9LQ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S1ABSnZwF4o3dT+8S68QyCpznth3tF6PxmuGqVY37y5wS4/21moHKWpATu1ZAKR841EJETKacqYrGALwwvgptQCj2xKq/yrEj260WBPUY7X5LzTEhhjeCnFuv9Yua0I0PPyYfEJdlGP6MjCN25/yQCfoNvsahMpYil6tf/DNXpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U7QzmZGF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E9HiW3E/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60IM04kQ3529714
	for <linux-usb@vger.kernel.org>; Mon, 19 Jan 2026 06:55:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OvU8AC21XN0dD41lLJnIZY7raczKQSxJs95MwKmjxO4=; b=U7QzmZGFTePNf4NZ
	46JzPtTB7EOhfoMHv8MNsIxQRSAgdRWk1XDzGzCrIj5PYA3IX5URmkuKNFe83yJJ
	m2fNdxtqrC2QSK5AGRmOyzuja0Vkw35p5sczGBSKMSb0p/Vpilz0Vt6Bvmw4cZDZ
	8PipbOtc272RAbKqDLOuT5+6ve9vS1+1FwE5bxUpQTR3Yhrjgu2CGGjfzdT44jua
	aAt30Q72fCB3a6oPtzUvK93Wp87UT60wfCFEvUkEOmLnHgi4mxhumsjasDA5m2LY
	N8RbafgH9fIafZi3AjbMZX8FiuutJXFk5a0qn9QTkefBwz99q4EegqEOSWqu3+v8
	jTBXEA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4br2t73y5u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 19 Jan 2026 06:55:50 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c54e81eeab9so2511377a12.3
        for <linux-usb@vger.kernel.org>; Sun, 18 Jan 2026 22:55:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768805750; x=1769410550; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OvU8AC21XN0dD41lLJnIZY7raczKQSxJs95MwKmjxO4=;
        b=E9HiW3E/aN5x7TFjtk3KIFgbvfgvGOXqOLO//DH9xQHvXk/4TauMKotKGbcppkcDpe
         ZQWDDnawSNcWg6jgcZUeUA61eUjT7coEXfS7OuUDITUvh8p1DxLoPIYU+bM/MrNL4Ozj
         vEXEAsE5fxSfEyaNijAnlvnKVcaYXYb5/gDxEadCnSRHq54jowvsDCCFB5qOy4zpn8Ys
         lcJ3okH2QArF01uARa25fsOi47G+ybkgHfO8hLbBCRARCJf5fmhjRWZCCKsu3vnvyCak
         xenF+KZ08zbnES7JKiOWRhTQ0oY51HQjnecAJVaObwieP8aA4cb9HYBEsVwqs92l97lb
         xsmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768805750; x=1769410550;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OvU8AC21XN0dD41lLJnIZY7raczKQSxJs95MwKmjxO4=;
        b=gM/RblOiQJPPbIVpa/lZr1jjUjB1bHdXAO9BI9RB8QuMlkq5toElp0MdNXY3++LV+3
         wQWTBcZk+QQXJ38yjnCaS7iroypKiS3uaDKhUgi9xwp6Zrdb1RDDeAXMdOIS4lSHWV+c
         SPxlkD4rVjIco767N1GJGuiaS4YfjkESNIzV0oyvVkSOjGX5oY93JA+nsbn22VvW4HoU
         5T9E/xEl1LpHrWHb3WdHicXNrG7oyI2xO0h3lT8FBIqjwGAZtBPfnKuJOlpC8+hSESFp
         2oODxo+RobcMNus0b86Ujeo9vnBHIcN+pbWpaYBegEjnW6D0f9wiVK50eaG2JGvKZcE6
         67rw==
X-Forwarded-Encrypted: i=1; AJvYcCWnBnWDCKP8bjUN/RZGLXLnIVLcF1VCnuKmhd5Ca2NKZwbeW+nhAlzF8NX6fzLexu6tAfnTlxUc3EU=@vger.kernel.org
X-Gm-Message-State: AOJu0YycWkzB+BrktLP2OKf3rxtYQEiJk+G+LGtPwlfHZxBHwzndPEvE
	t89ummBRduRZUOPOgnngPmkL2eETUGgGHA1OVT/8+W2xHr2WYRBmGJBPPIhWVAmgonfOU/kyLYU
	VuonkXvOi0898E9hhAfmijyqaajmuJU6eSvURKULgQOLBM8CCpMw+gcvynDvoUSo=
X-Gm-Gg: AZuq6aI8/OPE8o3ctSNLt0TJO8HVr4OdZE9+W4NxEhl/4hHG2tp2IGFNYnB1Bitb2xE
	Sh2SqTFMiS7ltXVrxU26JwAPjw1+CFmLb1dcjzRr+rVvFf3M/TuNFAmu2P1j0eTHjHtwRDLY8rY
	1mhocGI3XdNHg1ZyeWPGhieWCQ5zw1rC9pnltNqUplMGav41lG7yCzvMm8XWJuYr/x0/m+mZq4b
	WEoLI9sQ84sh1XnMOkl+ESRbDQEGOOXK8shPdAl6ylvKnf+qmUvqzIlJ8uKiVh/XbjzsXp039lO
	xo35WagQpYCOkQjdBsmtVDC2S9cQ9RHQNCKeDe3/8Md8vuops0Ak44MOAa0vU06UwedFpQYe5SJ
	g7ZLAEnPu2DiCo+Cx3VuJWigq0FbJP6oRT2JU3A==
X-Received: by 2002:a17:903:124d:b0:29e:76b8:41e5 with SMTP id d9443c01a7336-2a7175be718mr107141795ad.30.1768805749693;
        Sun, 18 Jan 2026 22:55:49 -0800 (PST)
X-Received: by 2002:a17:903:124d:b0:29e:76b8:41e5 with SMTP id d9443c01a7336-2a7175be718mr107141605ad.30.1768805749135;
        Sun, 18 Jan 2026 22:55:49 -0800 (PST)
Received: from [10.218.10.142] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a71942248asm84786645ad.98.2026.01.18.22.55.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Jan 2026 22:55:48 -0800 (PST)
Message-ID: <f1375e71-923c-4f59-84f7-6cf11629a443@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 12:25:45 +0530
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] usb: dwc3: Log dwc3 address in traces
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20260114100748.2950103-1-prashanth.k@oss.qualcomm.com>
 <20260114100748.2950103-4-prashanth.k@oss.qualcomm.com>
 <2026011400-monthly-commend-f89b@gregkh>
 <20260114225441.rn3affmwuhfl2z7x@synopsys.com>
 <20260114235357.zueeylekf4lfdq4g@synopsys.com>
 <2026011500-safehouse-alphabet-3056@gregkh>
 <20260115162234.ehm7l22ahh52d4y3@synopsys.com>
 <26f7cb41-5fa0-4aca-a119-2a7510b027a0@oss.qualcomm.com>
 <20260116175133.m7jbgh2s3ofzj2jb@synopsys.com>
Content-Language: en-US
From: Prashanth K <prashanth.k@oss.qualcomm.com>
In-Reply-To: <20260116175133.m7jbgh2s3ofzj2jb@synopsys.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Fdc6BZ+6 c=1 sm=1 tr=0 ts=696dd576 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=3S5gDLOTvNsQPPPUPYkA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: LlAIMSEhimk-IVWHaJ2pEzLXCg7PdCUs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA1NiBTYWx0ZWRfX/1C2xkSOqlr+
 7qdkaaV8t8UfGzBgdy10i96BRscCkFK8bbRU0EUFpHVF+TK+e8upeVzOFosmPIlohgpxQrvdWMH
 ATw3/NlaMV0/Q60WUyU/BksKnaUsNHuhD0P1b2FiK0e9OzPG1vVBRe/lPy/oPynpax7XxWY460z
 oLl4TTzA49C4y9t9EhIORWVd34xSPFqQB5pu6Ly2x0IMzMhelmMDDUIhF7OhF4iradoIDXZyduW
 gK1de9L3RfBzzTDnRWZ0WloJ22bmhyN2SL6YgaffGDVAAOFJJJ2ehig0bPejTRsd6tjD3vWGc0Y
 FfaUiAarqY8a21cpfHMLcQUnFrjTuWmHVpTareQ77+YpXLCcX/JpA0RyvAvDOIMGvy9N86quT1A
 XFdZt1r7+EgfxMnijMpR8kd5HJEwd7WuAKWCgBKX20lAjOWAVXduKLRAFKiOgbMVUkWXHCSNBMo
 UiZKtf5XTxQMguT7WhQ==
X-Proofpoint-GUID: LlAIMSEhimk-IVWHaJ2pEzLXCg7PdCUs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_01,2026-01-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190056



On 1/16/2026 11:21 PM, Thinh Nguyen wrote:
> On Fri, Jan 16, 2026, Prashanth K wrote:
>>
>>
>> On 1/15/2026 9:52 PM, Thinh Nguyen wrote:
>>> On Thu, Jan 15, 2026, Greg Kroah-Hartman wrote:
>>>> On Wed, Jan 14, 2026 at 11:54:03PM +0000, Thinh Nguyen wrote:
>>>>> On Wed, Jan 14, 2026, Thinh Nguyen wrote:
>>>>>> On Wed, Jan 14, 2026, Greg Kroah-Hartman wrote:
>>>>>>> On Wed, Jan 14, 2026 at 03:37:48PM +0530, Prashanth K wrote:
>>>>>>>> + * @address: Cached lower 32-bit base address to be used for logging.
>>>>>>>
>>>>>>> Why are 32bits enough / ok?  Why not use the full 64 that you really
>>>>>>> have?  What happens if you have 2 devices with just the upper 32 bits
>>>>>>> different?
>>>>>>>
>>>>>>> This is a resource value, so why not use the proper type for it?
>>>>>>>
>>>>>>
>>>>>> This is only intented to be used for logging, so I suggested to use u32.
>>>>>> I want to avoid treating this struct member as a phys_addr_t where it
>>>>>> may be misused.
>>>>>>
>>>>>> As for the reason to capture only the lower 32-bit, it's just base on
>>>>>> what I've seen so far. That I have not seen designs where the 2 or more
>>>>>> instances are placed that far apart and share the same lower 32-bit.
>>>>>> It's a bit nicer to shorten the address print at the start of a
>>>>>> tracepoint. But if it's insufficient, there's no problem with using
>>>>>> 64-bit.
>>>>>>
>>>>>
>>>>> Or we can just remove this and print the address from
>>>>> dwc->xhci_resources[0].start.
>>>>
>>>> I thought I asked for that a few revisions ago :)
>>>
>>> Ah, I missed that.
>>>
>>>>
>>>> I'd prefer that, instead of saving off a value that you can look up if
>>>> you need it.
>>>>
>>>
>>> Yes, this is better.
>>>
>>> Hi Prashanth, can we just use dwc->xhci_resources[0].start instead?
>>>
>>
>> While its true that we can avoid adding new variable into dwc3 struct,
>> using 'xhci_resources[0].start' in DWC3 core traces can be confusing for
>> someones reading code, since all of the traces are related to dwc3 core
>> and gadget.
>>
> 
> We can name the fast assign field in tracing to base_address. For those
> who do not have access to the databook to know that that's where base
> address is, if needed, we can also add a comment there.
> 
> Would something like this work for you?
> 

Yea I'll make the change and send next version.

> diff --git a/drivers/usb/dwc3/trace.h b/drivers/usb/dwc3/trace.h
> index b6ba984bafcd..8e5d474fd54a 100644
> --- a/drivers/usb/dwc3/trace.h
> +++ b/drivers/usb/dwc3/trace.h
> @@ -37,19 +37,22 @@ DEFINE_EVENT(dwc3_log_set_prtcap, dwc3_set_prtcap,
>  );
>  
>  DECLARE_EVENT_CLASS(dwc3_log_io,
> -	TP_PROTO(void *base, u32 offset, u32 value),
> -	TP_ARGS(base, offset, value),
> +	TP_PROTO(struct dwc3 *dwc, void *base, u31 offset, u32 value),
> +	TP_ARGS(dwc, base, offset, value),
>  	TP_STRUCT__entry(
> +		__field(phy_addr_t, base_address)

Shouldn't we be using 'resource_size_t' instead ? Anyways its just
typedef of 'phys_addr_t'.

>  		__field(void *, base)
>  		__field(u32, offset)
>  		__field(u32, value)
>  	),
>  	TP_fast_assign(
> +		__entry->base_address = dwc->xhci_resources[0].start;
>  		__entry->base = base;
>  		__entry->offset = offset;
>  		__entry->value = value;
>  	),
> -	TP_printk("addr %p offset %04x value %08x",
> +	TP_printk("%pa: addr %p offset %04x value %08x",
> +		dwc->base_address,
>  		__entry->base + __entry->offset,
>  		__entry->offset,
>  		__entry->value)
> 
> Thanks,
> Thinh


