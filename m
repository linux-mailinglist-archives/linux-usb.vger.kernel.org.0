Return-Path: <linux-usb+bounces-25348-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8C60AEF49B
	for <lists+linux-usb@lfdr.de>; Tue,  1 Jul 2025 12:12:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 15FAA3A5E5F
	for <lists+linux-usb@lfdr.de>; Tue,  1 Jul 2025 10:11:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4865825CC4B;
	Tue,  1 Jul 2025 10:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mOP5mUpQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A8DA24168D
	for <linux-usb@vger.kernel.org>; Tue,  1 Jul 2025 10:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751364690; cv=none; b=qtQ6/JWN3UHR38jV0kDncBwV7BDKQ9pRVKCWsXFA+c7o6PNWZyGW0xk6mGhTzuWJlDwVl3DFd2mAE/6WmAxIX3/ywPvNsWK8vyLTRzZnLUqTmI6dAeEktcOQzyD88ZeYTpRGrR4R2jy6zimZuOhTK2nep8hqKQKDU51J0e686c8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751364690; c=relaxed/simple;
	bh=ge+GZUU/CI6knla0X986QodzqtPJytNNG0LNjZS6frE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qhYwiSJhkhAD+vwxbPHV7ASUFfF0EwtGm3W2bGkTjrvGLjr1Xqgoacft3/a3xUBuSE4XsTTCr75Fzcy9D01Gdc6EY3PqUPipM8D0ccQpedlR2VOLCWP3kyUddpfUI/9H4sMgOMXWHw7/8ZXPMIIH8lASj2quHteGc+Fwemhuhgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mOP5mUpQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 561A6Rj2029322
	for <linux-usb@vger.kernel.org>; Tue, 1 Jul 2025 10:11:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	noF4ePrw5++C2TSwg4Yv8311cvCJ5IQU/kCQZIyESOU=; b=mOP5mUpQ4QAfY7YA
	ve9jZUiB9Yqpv+MKXTkI/ZliJStDawmlDFl6kI1vRJMWY5uKSExTJWCxKsRqQS8G
	DW1FZzcM5L+EEdmsOjB24mLckS1lTEc1JcHcDwLuTQsxOjiDqQYINhsTbNG3HLnD
	5Oq1IQGD8yyHZii2lkunDKh1OlRst4c9N1cE/Pcb+7DNe3d4Ulkw9naSjHrmqjBa
	tZ5HT6S6koLrrHfqgUHDMCcH9ckfoiE/rlowuY1d4Cn4xgR5tVCnbC4KtKn6y7+l
	f1Mz/OqBL7rjDMLYxvRfj73Q5y3mawSvxEjjj+jbHVijIa+osnK8AXp1snobt1b+
	W0//Ag==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j95j06n7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 01 Jul 2025 10:11:28 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5cd0f8961so642049785a.1
        for <linux-usb@vger.kernel.org>; Tue, 01 Jul 2025 03:11:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751364687; x=1751969487;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=noF4ePrw5++C2TSwg4Yv8311cvCJ5IQU/kCQZIyESOU=;
        b=oG2AcUvd7LbK6hQP5t78NqJnSqJ50FoGUmem1jVS2FBAJYH6+kWxQ90rde3tX+E8Rc
         rrKUWJ+K6QgvJdUyAdqgDVLvo98ewex3VD0sIk9HlDYL6B6ndC1lV/eMFMIPWcuIpQMG
         1byxdfmcsV6UQWp8B0A0mzv9EES1vx2Zx9pOaET3i2kmUKpsfOAoWa6FbK8wE4QV7eqM
         go3/gRg15FYWnKCUX8n9G1S7DdOWAE+6qMxIJwWE3yGD43BadHxUcfcnVSnMV1QHYbbv
         mIr8U1YFSKNfD7qCVteByFHMN+vGH4naBqfearKXBM7qNBXLxtSaVY/1XU3rRJAX3Tnz
         X5gw==
X-Forwarded-Encrypted: i=1; AJvYcCUXEDK327/06uFG2M13xzY/9/B1SSjtwgEgY4q/0SFiZZbCt1/Hn0+j3XLSVcbOnEfPx+EMksoKzUs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwpxyBpMewOovhC4eOMD1V3gus3V82Nyz+d5TcnDrrKHv2irvmz
	pCmJSWKMH8UYSzgsT21wHFbvc3wublNQqhyv8CE5ZAoWhzQBGXWV6cF+2YUt7tG9SYPs5FjbCNc
	2mbzDZ4zqdqnrHyadNJNsm2TcvcESz0NjCcw0y76Taxy0FmxabGLUImtuKHR7sSY=
X-Gm-Gg: ASbGncsDMfcERdYnU7ZTcE7Th0x1225BZs4VMefrYnbzdKdzg3N1/Lrzrk/xyQF2Rbf
	0dWPgq6eVDsoOm9uw36037K2BQzaCmLKtSQeVX2yGNIuX1aIdKFHTYkauL1gYczYRkQ8QjJdij8
	VNTIBp5DTJnWN5jO2TMQYptSRDeF3Kdvj/fr1EuNtqYa0pXo0sjx+oMZk5YgX3lAL/l5yZcBgQ+
	2O69/wPA4/FNsi5s7oq+NCkZHndzaGENiUprX+UqBHYkEqdTNwZnxUZAZVGkwlrBEiDcth4XxNe
	ssMQsnJeFGF4itY/gZDAQ0XnBQgsoJ4k8eDcc2N8H/awOGw7Z/N5Whp2t24RGSm6eBi3Fjxhngl
	2eW3PpoOeNo5OwkGQyqMuHQxV5Q==
X-Received: by 2002:a05:620a:1a1b:b0:7d0:a096:cf80 with SMTP id af79cd13be357-7d44395460fmr2111033885a.31.1751364686627;
        Tue, 01 Jul 2025 03:11:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGoyrn3pEbeuJ1CnrE1PCn1ptY2CQxI87hb9xtcRulRDdib3U4BxVuiXCQhU6FtIQnjWQiBzA==
X-Received: by 2002:a05:620a:1a1b:b0:7d0:a096:cf80 with SMTP id af79cd13be357-7d44395460fmr2111028785a.31.1751364686023;
        Tue, 01 Jul 2025 03:11:26 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0c3:3a00::55f? (2001-14ba-a0c3-3a00--55f.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::55f])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2f2e22sm1746260e87.253.2025.07.01.03.11.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 03:11:24 -0700 (PDT)
Message-ID: <45d5003d-87e1-4e8c-9eda-b1f67c7e57f5@oss.qualcomm.com>
Date: Tue, 1 Jul 2025 13:11:24 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] usb: typec: ucsi: Add support for message out data
 structure
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Greg KH <gregkh@linuxfoundation.org>,
        Pooja Katiyar <pooja.katiyar@intel.com>, linux-usb@vger.kernel.org
References: <cover.1751042810.git.pooja.katiyar@intel.com>
 <cc0b7701c4ea3d1001fefeb3df65caeb3e624722.1751042810.git.pooja.katiyar@intel.com>
 <2025062813-untying-hesitancy-088a@gregkh>
 <aGOgeSIOK-nDRGHB@kuha.fi.intel.com>
 <de4c73cc-2aaf-4987-a49c-dff2f38ba0f6@oss.qualcomm.com>
 <aGOy0qEUXQ7Rl3Cw@kuha.fi.intel.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <aGOy0qEUXQ7Rl3Cw@kuha.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDA2MSBTYWx0ZWRfX0OixwSlcFp6y
 9ZVVyYJHfCr5a/WRVzFPbhWLM/YiGeadzQUDeVDhh14GvDqpLyXeEFeASQA4W7BRp5Ambgr2mPU
 6ldWGiZF1UATKr1vxDXYd322SN8YWqyvVasX2Vwwh/ao1K9cremehP9l869aTskIml0Z7ah/wD+
 oaM1gzFqTrG0Fo6NSXY8FO2xBeDvPGoEvKV1EO2ob7KxjpgULpcHOMT9ZAGWETY/IRSBA/Gmbww
 6ESDDXe5Lx1d3ZTsfhWZ7SN9b1qGjybtBmiKKo/n/Ccf+74FSw4ryL7E6njdyLwea5fGOU1D8Nz
 t4mZHxqKZ0CMoge4u2OJK/vCADCmHsVksPeeDbhGssVcG1S2TwJxDc2SOI6ZCoaiyzivUlC4kfE
 yTEATjH+vIAh/60BN92KRI7cX0UnHHEuUe4drJYg+ymTfEp3xbJF1moCndkC2GOwwZ7Zl3ln
X-Proofpoint-ORIG-GUID: O2twsPzFO_uXh2jlYyYphbSAgAfLjwy6
X-Authority-Analysis: v=2.4 cv=EuHSrTcA c=1 sm=1 tr=0 ts=6863b450 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=TBM0Gg9QePfM97DyvHoA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: O2twsPzFO_uXh2jlYyYphbSAgAfLjwy6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 malwarescore=0 mlxscore=0 phishscore=0
 spamscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507010061

On 01/07/2025 13:05, Heikki Krogerus wrote:
> On Tue, Jul 01, 2025 at 11:50:21AM +0300, Dmitry Baryshkov wrote:
>> On 01/07/2025 11:46, Heikki Krogerus wrote:
>>> Hi,
>>>
>>> On Sat, Jun 28, 2025 at 04:51:56PM +0200, Greg KH wrote:
>>>> On Fri, Jun 27, 2025 at 11:10:10AM -0700, Pooja Katiyar wrote:
>>>>> Add support for updating message out data structure for UCSI ACPI
>>>>> interface for UCSI 2.1 and UCSI 3.0 commands such as Set PDOs and
>>>>> LPM Firmware Update.
>>>>>
>>>>> Additionally, update ucsi_send_command to accept message_out data
>>>>> and .sync_control function to pass message_out data to
>>>>> write_message_out function if the command is UCSI_SET_PDOS.
>>>>
>>>> Normally when you say "additionally" that implies that the patch should
>>>> be split up into pieces.  Why not do that here?
>>>>
>>>> And do you _really_ need to add a new parameter to all of these
>>>> functions?  It's now getting even worse, look at this:
>>>>
>>>>>    		ret = ucsi_send_command(ucsi, val,
>>>>>    					&ucsi->debugfs->response,
>>>>> -					sizeof(ucsi->debugfs->response));
>>>>> +					sizeof(ucsi->debugfs->response), NULL);
>>>>
>>>> You can kind of guess what the parameters mean before the NULL change,
>>>> but now you have to go look up "what is the last pointer for"
>>>> everywhere.
>>>>
>>>> This feels very fragile and horrible to maintain over time, please
>>>> reconsider this type of api change.
>>>
>>> So I think what Pooja was proposing in the first version of this
>>> series, where you had a dedicated function for filling the
>>> message_out, was better after all.
>>>
>>> Pooja, I'm really sorry about this, but can you revert back to that,
>>> and send it as v3? Let's start over.
>>
>> But that breaks the sync_control logic - currently it is possible to handle
>> the command in .sync_control completely. If for any reason we need to
>> implement workarounds for commands using MESSAGE_OUT field, we'd have to
>> introduce additional logic (which we just got rid of).
> 
> Okay. So how about a data structure for the entire mailbox that we can
> pass to these functions?
> 
> struct ucsi_mailbox {
>          u32 cci;
>          u64 control;
>          void *message_in;
>          size_t message_in_size;
>          void *message_out;
>          size_t message_out_size;
> };

What about a slightly different proposal (following ucsi_ccg design):


struct ucsi {
    // .....
    u32 cci;
    u8 message_in[UCSI_MAX_MESSAGE_IN];
    u8 message_out[UCSI_MAX_MESSAGE_OUT];
};

The caller will fill ucsi->message_out, call sync_control with a proper 
length specified, then read UCSI_CCI_LENGTH(ucsi->cci) bytes from 
ucsi->message_in.

Note: I'm positive that we can handle message buffers in this way. I'm 
not so sure about the CCI, it might be too dynamic.

> 
> thanks,
> 


-- 
With best wishes
Dmitry

