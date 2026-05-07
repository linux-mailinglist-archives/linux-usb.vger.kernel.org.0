Return-Path: <linux-usb+bounces-37076-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GPd9Ox5r/Gn0PgAAu9opvQ
	(envelope-from <linux-usb+bounces-37076-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 07 May 2026 12:36:14 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9814E6D9B
	for <lists+linux-usb@lfdr.de>; Thu, 07 May 2026 12:36:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8DB363034EE3
	for <lists+linux-usb@lfdr.de>; Thu,  7 May 2026 10:35:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5ADE63EAC7F;
	Thu,  7 May 2026 10:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RLuWkXdK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Sb2TLjRF"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE0D331AA8F
	for <linux-usb@vger.kernel.org>; Thu,  7 May 2026 10:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778150096; cv=none; b=NLlDEsL0PfAK694L3nrvj5GmCjkzPByjj37vU8sg4vPpSNq6szbqPHluy3vkbM8AtR919jO7MIcqpyVG2b6AJfY46lQRGOlNxWABoQCPGRkjOKEHOrMlC2CDFMLxibvwfQ4OxTX72niyLnBGW5v0PcS4YomBAuEngtr54biDGUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778150096; c=relaxed/simple;
	bh=QtvNvdUdRsC2T2BIdBT2V5oVTJ4VtzVSiI1W1AleHXI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Tj7OQM6ZRHIa6j7d75rXTxkXjpzWOe5mf+zSdK3g9CzruOk132KQsWn+XwCuwdszTFY753h8URI3gFoD+JRecIlxs3Nct0VcB42mQ7f/hUtlKS99Z3YkfTv7whifrmGMJTJNfj1WcB/T1cwIMaumDFDJKriXU1PgOnQnH6o0OwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RLuWkXdK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Sb2TLjRF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647AKWdf1669936
	for <linux-usb@vger.kernel.org>; Thu, 7 May 2026 10:34:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t1Bb9jCktZp2cHMEEGHME7PvneA+aQjkI5y1lLeU4qY=; b=RLuWkXdKsjjTegfb
	x0kqW5A4r/VeAqrgDdNIy0/47p3X4v6uF/5y2DGCNnG+IzOpptNCrMjInrI2/wIs
	96w6z0jGou0NysgkNdRhKkhNEyiXJ+txueXLcKfyzCOr94jSbbfNfU/eVPt/uf5a
	weg1Sm1Ijc8KIRYfWRhxvX+DcL0xKnHEIEnHGdEqgmbZalkrKdE1ja+uX1fgHHp2
	8YSIyfTAzod2ALz6RW0CUerPXW7FkFrTeROqhTAPOj3WT0xUITbK7imjJxJn1B3e
	mrxrqfOXEIq8IKMYYkCLC+vDdV7JM5yn3uZ5N8g0gqdOlsRaqU3M4tHrBwN9chgL
	CyQoCA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0k1p1f79-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 07 May 2026 10:34:55 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8d45ebdbc9fso17731585a.1
        for <linux-usb@vger.kernel.org>; Thu, 07 May 2026 03:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778150094; x=1778754894; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t1Bb9jCktZp2cHMEEGHME7PvneA+aQjkI5y1lLeU4qY=;
        b=Sb2TLjRFPqOvDLM3C1f0DzflL4WtnyDMS5YT8NlSSQA+O9XCNvCA6Vi8lASMljvxuq
         IYY9gk7sx6UNCM0vYjLs4zPOhH65fumt+cshwUHaNfdXCB6b9ogd0OvzeC8Vzgc4Fxt9
         ln6El2qQk0WLZqvVLr2N1Wtilv9O+NcazKVDnwp58i97HngSJdpj/bNlSP14tLYa2qxa
         ILaqt1wypSNvA5JXiuLSRdviQtSiOalSTekOPP/V3r08XWLuGICIJJuzssWwjHicIzIU
         H1a2CASPKwkWmEbztAiYrE5ODNIXV8U4ds5KJAH7JIc/nQOtDzJP+olJxKH/fG9C2ZQY
         vnNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778150094; x=1778754894;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t1Bb9jCktZp2cHMEEGHME7PvneA+aQjkI5y1lLeU4qY=;
        b=YDc4NcWz4jQZeES8GDkXtUjhteyFurWadZmuG5dFUuix9YpJIDewIdW50YMIxovW1I
         FGrwwlarVR5lp26I7YOLDpMiOASkpZi3mWGpHi8sVLpT/vW1jvM3lpwsgsCqLHz+Wipo
         /1P58unjcy2N7vRj5ikqsvk7MkYTZjQhWEUiG0TKATsCOZCG/vekszjMwGbqHAR59jDo
         BEk4m2KlQSguJDAfEqjWlZnmX1r8IzBBciIDN717BcvgNVwLlKU7v+3ptWvyEbzDXwM/
         bCUw4X5d6auvn33eMRpVLpncbC7mNXIDSalhVJ21FT35Sv1w5KCSLxL7LzXhlzLuD9yy
         /mGQ==
X-Forwarded-Encrypted: i=1; AFNElJ/qX3XHzQcCd1MjRxZkBTAN7kcwio+XxBN0S/7pti4fjW8apOx4Np2YjhxyjuXGJ6POF8tLr4zu0L8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0ktPLeir+Hda8XAwyZlRd/KHdCWHGAy5EG04l5+ODfMJtuAVS
	kX7sZT1fwi9Mkl4SMa9QSNeanRv/wPuSSBU23kJyw7ycn5OPgcBEG+lNyu0ZolZeWyEIAmxYAM7
	ZMzjhJ1p6N/eX0EGDU/D2qmLt7C+JHKC4kxnW8z38TwyU9REfltTnh7s2RUXmpilZ0dp87UU=
X-Gm-Gg: AeBDieshd1WaqfyYniftLms1AtXhUn/fRTRLpHlD4lIgNRkKK5tFUhhVEdIiWgngMc9
	39VzbSbRuxM9BvNRE+bCQ8lw5vjgo6oraPkeJ5DGV3ZMehDENrd+LFrJtNFl2tItv0XeFLpcDBf
	/ERJqKWOvwuOa//qmm594wN+tQ2ycw8y8m+lJHVnjAP+TjNk0zyN3cPoRqXU7GQQkDNizG8dqQf
	3kSd4QwOxLbnAL1aDeUTKGCMVasjOx2PV+Ful1eIO7uGGQPcoaqtm+uZaL0VQSIj+Ds9RmfQcb9
	Ysx15h2xRcCfynEJ7dCUogzuSzli6beZn9B6vfLQxJy3g9bD+F+56U4soWBKgPadGUhlYuz4DRo
	vsiXqqgJ70MDnWiWqUdI1dzbLH4ibZA/i66T/Rmb4GPXoEGoZ6x7jMmL+0u8sCygIuaqOTqsl8D
	4OGItCb2GzEvz9cA==
X-Received: by 2002:a05:620a:469e:b0:8f8:6b36:fad3 with SMTP id af79cd13be357-904d78a863cmr739414485a.8.1778150093974;
        Thu, 07 May 2026 03:34:53 -0700 (PDT)
X-Received: by 2002:a05:620a:469e:b0:8f8:6b36:fad3 with SMTP id af79cd13be357-904d78a863cmr739410185a.8.1778150093545;
        Thu, 07 May 2026 03:34:53 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67cd91a4708sm2004919a12.14.2026.05.07.03.34.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 03:34:52 -0700 (PDT)
Message-ID: <1163a026-03b2-4860-a422-eb276920b4aa@oss.qualcomm.com>
Date: Thu, 7 May 2026 12:34:50 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] usb: dwc3: Notify XHCI core of tunneled status
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "usb4-upstream@oss.qualcomm.com" <usb4-upstream@oss.qualcomm.com>,
        Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
References: <20260505-topic-dwc3_tunneling_state-v1-0-4aaa6c3c14cb@oss.qualcomm.com>
 <20260505-topic-dwc3_tunneling_state-v1-2-4aaa6c3c14cb@oss.qualcomm.com>
 <afpyvhadqZw0xfTB@vbox>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <afpyvhadqZw0xfTB@vbox>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDEwNCBTYWx0ZWRfX0RyjE/uvT4Qo
 dav/oXw8t/gZ1wzEg9IyKdpNRVQIoW74XFSxpERCHLMklVFK895VC4rCBCS12qGElSsgzzm82bV
 WHkDcr2AW3ooPWRyHb0WdgRxUcllqGplLo59FPoOmd77MuNaNlt1siYabc0Jsq6c8Ffz8dXMs72
 D12NrWEwrsMXPXEWNw+cq4fDBb0nWekXPngUjIoCYxatT0PH5oyIYtFiabZHc94138m+jz81FAj
 T9TMlRrUJHtxDqJKEi/dmKmmH+U7SornBl6dCo/qE3hPsURDxtUut3qw0gj1rze2i+hwvtBonHM
 B8rA2rdlsZkIFyDTR5mO1qE1FiIWnTe3sqYk0/yvgYWBpyVbL2dnkDU8jM4+majjewpU23G9hIm
 07rtXO3VD9qW1SVEJrXOSwtIh9NqnxAJ8ees9yvQqB9MHjL+DkkxkZy6JMmyz1BUCWzI9qJQtyk
 1a7lT5f5cmK81BZha9g==
X-Proofpoint-GUID: o9zZj5bPgc2eHE-Qz1LTN4zqnmaDQDLQ
X-Proofpoint-ORIG-GUID: o9zZj5bPgc2eHE-Qz1LTN4zqnmaDQDLQ
X-Authority-Analysis: v=2.4 cv=K4IS2SWI c=1 sm=1 tr=0 ts=69fc6acf cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=ORxTflC89JRLnpgA4MQA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 impostorscore=0 phishscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070104
X-Rspamd-Queue-Id: 6D9814E6D9B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-37076-lists,linux-usb=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/7/26 1:40 AM, Thinh Nguyen wrote:
> On Tue, May 05, 2026, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> The Thunderbolt framework relies on the USB core to create device links
>> for tunneled ports, so that the USB3 controller is only kept
>> runtime-resumed for the duration of the tunneling. This depends on
>> first knowing whether a connection is tunneled or native.
>>
>> Add the logic to handle that for DWC3 controllers.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> ---
>>  drivers/usb/dwc3/core.c | 12 ++++++++++++
>>  drivers/usb/dwc3/core.h | 18 ++++++++++++++++++
>>  drivers/usb/dwc3/host.c | 12 ++++++++++++
>>  3 files changed, 42 insertions(+)
>>
>> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
>> index 65213896de99..7cec4911e278 100644
>> --- a/drivers/usb/dwc3/core.c
>> +++ b/drivers/usb/dwc3/core.c
>> @@ -162,6 +162,18 @@ void dwc3_set_prtcap(struct dwc3 *dwc, u32 mode, bool ignore_susphy)
>>  }
>>  EXPORT_SYMBOL_GPL(dwc3_set_prtcap);
>>  
>> +enum usb_link_tunnel_mode dwc3_link_tunnel_mode(struct dwc3 *dwc, u8 port)
>> +{
>> +	/* Prior versions had no CIO support */
>> +	if (!DWC3_VER_IS_WITHIN(DWC31, 191A, ANY))
>> +		return USB_LINK_NATIVE;
>> +
>> +	if (dwc3_readl(dwc, DWC3_CIOCTRL(port)) & DWC3_CIOCTRL_CIO_EN)
> 
> The CIO register block only exists if DWC1_USB31_EN_CIO is set (and
> DWC_USB31_EN_USB2_ONLY is not set). In most cases, this register block
> will be reserved, register read of reserved block should be 0. But we
> can't guarantee that it will always be the case.

That's inconvenient because..

[...]

> We shouldn't need to be doing this. This should be checked from the
> xHCI driver. Check xHCI spec for PORTSC.TM and USB3 tunneling support
> capability (section 7.11).

..I'm seeing only caps 0/1/2 (and 10 on some but not all) advertised
(I ran a for-loop checking offsets 0..=255)

How should we proceed?

Konrad

