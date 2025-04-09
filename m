Return-Path: <linux-usb+bounces-22776-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 08CA2A81BD4
	for <lists+linux-usb@lfdr.de>; Wed,  9 Apr 2025 06:15:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A7FAC461953
	for <lists+linux-usb@lfdr.de>; Wed,  9 Apr 2025 04:15:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B02CE1D8E07;
	Wed,  9 Apr 2025 04:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G38rmBLb"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F6181D54C0
	for <linux-usb@vger.kernel.org>; Wed,  9 Apr 2025 04:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744172109; cv=none; b=ZR4Strl38f1rBWF75ouktoc86J147GWC75s6d9NrOiACpygViMVBd9Co1eSK09R5bpkWvesesHDtEYqRYM+n2/R4dSe3+nsSQ24EmGhqppiSJ67YFhDjCqKS6cxAfR9gTdD4VIm5IqPkwt/Yw3RIV34kSdGylyJkQDF5y+6lmcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744172109; c=relaxed/simple;
	bh=WvLqbpNEQec4JSdwumnfy2zaQBVdn3HjdG/oPncMCpU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sNLZe9iW2IiVfYq488LE9elWk41ARjjYbwJ6h1xIipcndFzQd0jHerN9PO5nFfUs46TEuI4l4QUTqFNY2gmrCq7SMaYGvygwiSDC3XIa8563+wicrSdAXdXYC3DOIkZahDFUurSw/yrV24hX8F9HE5pvyBsy2BlhC1EPOxsgg3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G38rmBLb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538JYv4Z022788
	for <linux-usb@vger.kernel.org>; Wed, 9 Apr 2025 04:15:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VxwVae129VMoPtWlkzv/NH7NvSheSXHcYVi2EmUqZno=; b=G38rmBLbOTtFlseA
	wJIz/vnLj8SV6r+RMYKT516S/MmowmI8g4B2hjl2rEBdgWcsH8HIy8L3G2dJEzRz
	/QpS/Ewz8PMlTfv8ehIG5CDs74w3rEF0/ZvYpYrdIxU0+2lTxPolMNpN02+R2PJf
	TcnwxdAAmbrSMYHWoQw+8FNaMKLSDEyltEEA5xh7Vnuzau2kjBSKKNWw6SKOyIHq
	Csw0weA2TDFdFqcuzIqzK0s0Hs8SpMhamWi1ts5K1E3cHAk1H6KMx8rM0VCWTRtH
	cg1zV7bF0/nVz2kcHd7jTGzG+vshSAxc08o6ZzpSWA6E42cJVYMdev0vMrqpMCNn
	MaEtyA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twd022gp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 09 Apr 2025 04:15:05 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-22651aca434so59555835ad.1
        for <linux-usb@vger.kernel.org>; Tue, 08 Apr 2025 21:15:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744172104; x=1744776904;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VxwVae129VMoPtWlkzv/NH7NvSheSXHcYVi2EmUqZno=;
        b=Nw1B9gLOzrtZHIpoTIpfCzQR8z8ybB4fqLgC4GmN/iChS4MSfkuERTd3hU1g6I9zLd
         Py+zqSQVwgtD807XjO/uLLeNb0eLmyCHc1Fv161oOzqlkzntK6JHdSGAOKnw3kpppG8N
         9OzKrf+pT7yd8UAi7qzm9xyWOnKoDaj4sfX7t7Sur9f9PIL22vV2UOGvB3M+cHVT4qKO
         NldAsotiL/eSseOge8eRZxnMPaZ1zru6oN6MS4Bd2hdVT1GVjySyaBb/zdD0ztjX/nKE
         x81+BbuRU7ZHJBsVL4mSFy/Ow6i61VSwGFFVPJW24VaY9LDQtaVlitIBYMM5pjghnMin
         htlw==
X-Forwarded-Encrypted: i=1; AJvYcCV0zlAsaUbBxTBXUYLVJFw9y/6iaC/5e4TTiQX5+KrsMX7jJy0FxlKTRDaQF+dKGAHN7Cz9ZJLmCA4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHV+D+CeOH3qMayoNYj7z7g8kHPo8wzqQ1W9/ExtZ/jXIoTOv0
	9tUmoTjlOIm0lU2AWMpvL1WUvcRFvLyRQ/zlt5JCcP43W2q3ftpDuepiLJu4luFhfh1s9LdaELM
	n2BNOj3tH6hGCGn2OihmIvVFONa9URD9rC79TgmDGZuc8dgZy2NDMfpnIECc=
X-Gm-Gg: ASbGnctnXtGkQwPOejXlPV0zdfVf8qEp1Pq99bm/k4YchwpIXa6Nu/uSuXV+YuomHUS
	EuQKn9eZsXbbJfVXCw+tyeQqdr3LDwS5gwlKHYn//9PCiDaoIN1YAIpsL6oqXTr/9aWtIFS08A0
	ElniVKcgNfvu/npTVhxyRPkVpPHmy+D2mR4C8VJw1wwAwTo/LktaArvmoolP/1N+FoAAjWnCnXa
	FpJFIoFjoKwMXNgmv+ZEthSmGy+F01SahhRX4FyT3Y5ww7MrfIbYAqNtoeKBEKslbIK7Qk8G+Jq
	cjqKZyNXD109gO/26LZOkn/USX486WEWY6cZyt3c
X-Received: by 2002:a17:902:cf07:b0:223:f9a4:3f99 with SMTP id d9443c01a7336-22ac29c19f4mr27369455ad.29.1744172104623;
        Tue, 08 Apr 2025 21:15:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEH1JyeruANuUf98MjiOWxD/KNh0K6c/DGsxhwBzjHX9KtKAj8DVmvmtKf9+8QAsEK3fhjnQw==
X-Received: by 2002:a17:902:cf07:b0:223:f9a4:3f99 with SMTP id d9443c01a7336-22ac29c19f4mr27369075ad.29.1744172104193;
        Tue, 08 Apr 2025 21:15:04 -0700 (PDT)
Received: from [10.218.35.239] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7c97228sm1641095ad.128.2025.04.08.21.15.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Apr 2025 21:15:03 -0700 (PDT)
Message-ID: <468898dd-8b57-4fb5-bef1-d47ffbc38846@oss.qualcomm.com>
Date: Wed, 9 Apr 2025 09:45:00 +0530
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
Content-Language: en-US
From: Prashanth K <prashanth.k@oss.qualcomm.com>
In-Reply-To: <20250409004330.iflfdxabodalsmox@synopsys.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: IpPH_nOjVSCXDYdXGHY7e9BjTFeO_L05
X-Authority-Analysis: v=2.4 cv=Q4vS452a c=1 sm=1 tr=0 ts=67f5f44a cx=c_pps a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=5SkJsQ-l3Z-u9Q_wZN8A:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: IpPH_nOjVSCXDYdXGHY7e9BjTFeO_L05
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_02,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 phishscore=0
 bulkscore=0 adultscore=0 malwarescore=0 mlxscore=0 suspectscore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504090017



On 09-04-25 06:13 am, Thinh Nguyen wrote:
> On Tue, Apr 08, 2025, Prashanth K wrote:
>>
>>
>> On 08-04-25 05:08 am, Thinh Nguyen wrote:
>>> On Thu, Apr 03, 2025, Prashanth K wrote:
> 
>>>> @@ -4398,6 +4371,21 @@ static void dwc3_gadget_linksts_change_interrupt(struct dwc3 *dwc,
>>>>  	}
>>>>  
>>>>  	dwc->link_state = next;
>>>> +
>>>> +	/* Proceed with func wakeup if any interfaces that has requested */
>>>> +	while (dwc->func_wakeup_pending && (next == DWC3_LINK_STATE_U0)) {
>>>> +		if (dwc->func_wakeup_pending & BIT(0)) {
>>>> +			ret = dwc3_send_gadget_generic_command(dwc, DWC3_DGCMD_DEV_NOTIFICATION,
>>>> +							       DWC3_DGCMDPAR_DN_FUNC_WAKE |
>>>> +							       DWC3_DGCMDPAR_INTF_SEL(intf_id));
>>>> +			if (ret)
>>>> +				dev_err(dwc->dev, "function remote wakeup failed for %d, ret:%d\n",
>>>> +					intf_id, ret);
>>>> +		}
>>>> +		dwc->func_wakeup_pending >>= 1;
>>>
>>> This would break the bitmap of dwc->func_wakeup_pending. Perhaps we can
>>> use ffs(x) to properly find and clear the interface ID from the bitmap
>>> one at a time.
>>>
>> Yes, we can use ffs(x). But I didn't understand how this would break
>> bitmap of dwc->func_wakeup_pending.
>>
> 
> Since you're sending device notification to all the wakeup armed
> interfaces and not reusing the func_wakeup_pending afterward, the result
> of what you're doing here will be the same.
> 
> IMHO, for clarity, what I was suggesting is to revise the logic to
> preserve the dwc->func_wakeup_pending bitmap instead of shifting and
> overwriting it, causing the bitmap to no longer match the intf_id. We
> get the intf_id from the bitmap and clear the intf_id bit from the
> bitmap as we go.
> 
The above logic works, but as you suggested I'll refactor it using
ffs(x) and clear the intf_id directly (instead of shifting).

Does this look good?

/* Proceed with func wakeup if any interfaces that has requested */
while (dwc->func_wakeup_pending && (next == DWC3_LINK_STATE_U0)) {
	intf_id = ffs(dwc->func_wakeup_pending);
	if (intf_id)
		ret = dwc3_send_gadget_generic_command(dwc, DWC3_DGCMD_DEV_NOTIFICATION,
							   DWC3_DGCMDPAR_DN_FUNC_WAKE |
							   DWC3_DGCMDPAR_INTF_SEL(intf_id - 1));
		if (ret)
			dev_err(dwc->dev, "function remote wakeup failed for %d, ret:%d\n",
				intf_id, ret);
	}
	dwc->func_wakeup_pending &= ~(1 << (intf_id - 1));
}

Regards,
Prashanth K


