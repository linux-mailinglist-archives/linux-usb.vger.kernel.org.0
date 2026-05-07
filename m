Return-Path: <linux-usb+bounces-37077-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iKD9Bqhs/GmMPwAAu9opvQ
	(envelope-from <linux-usb+bounces-37077-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 07 May 2026 12:42:48 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8655C4E6F3E
	for <lists+linux-usb@lfdr.de>; Thu, 07 May 2026 12:42:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 65AB43063944
	for <lists+linux-usb@lfdr.de>; Thu,  7 May 2026 10:40:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E0123EB80D;
	Thu,  7 May 2026 10:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aeIiTD85";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MYXMc1DU"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF23D3E928C
	for <linux-usb@vger.kernel.org>; Thu,  7 May 2026 10:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778150449; cv=none; b=FtvQUNAYv1EeYaRdypW+plm5DHLXFRtA6j+oB7vS+wcfUOvCCYmaqKmQBuQ1K5OoEB53fkiK0YkVNTfOZC76pxjyidgEjH9lAGMdeA8j1cmMaytIK0D4tf4Vn8Bs8OYjAyAts12Iv7VAE3VDFULl7zGJIOTSgKUiJ/OKyhwa4X0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778150449; c=relaxed/simple;
	bh=3TLtPSGtHME2zaQgYjH2+H7h/lbZgh1MNcLB/MSHzog=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NLKJJKtFMqQgaZvhkVuah76Ls2Q50hikKh8EyXwd9BZ1Aq71QKwaKltW4BhHtbgjav14x7evTINLzXJdjgPqFaHJUAkkQQRdFEHndRz7Ec8viiDkXhrLaljB+elnwSQhIqYOm1EMqu9RKAyLdyw39nhqdq8i8nZcgoIHr+MBpAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aeIiTD85; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MYXMc1DU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6475CQqm3924321
	for <linux-usb@vger.kernel.org>; Thu, 7 May 2026 10:40:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PGTevllouHgU5n6pKJsSjzVnRCs5BCktvfEWEgejUNk=; b=aeIiTD85f5iJxByw
	+O2uXgOSnro7fWdCvtI/TALlGm9sMlZQgOSH1w0arpUJVXJbfVkGyeQQvcLVWLH1
	NhROP2TR9v8yhVrykYn+qmyZVGoO3Ba0gkn6WE1aId1ab45O4hw3M21+4mWyek9k
	m2R9oeNPGECqYSszZdm8OxBEKi+F+YerQfWB335phbY/BuESKhFaBLIq1cHvxz2v
	1kIFeVR4wpX+0CmSH3l9g516+07NHZ+YJmQuX9EVTiTIDYthfRQRJ3CsT4hV9Oud
	LlY+96mYcnt5c5w2dUJPGKkoGqsCtSz8katN9KNBiNabPzTgGRHl9RCM5ir5m/4F
	oSuymw==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0c88aq2r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 07 May 2026 10:40:46 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-575296be5b1so83606e0c.0
        for <linux-usb@vger.kernel.org>; Thu, 07 May 2026 03:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778150446; x=1778755246; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PGTevllouHgU5n6pKJsSjzVnRCs5BCktvfEWEgejUNk=;
        b=MYXMc1DUPTUhWqHNUTcbGji5epuKCF9NVn0lBX8dPnOp0O6TdYByrWC970PXEEyC4O
         ZbRO0aprFiDic4sKPuknLp9weLlJaIKJwSJfBFLqFBbNajHNc65PyuxvgX5bslPHp6aM
         CPqHKWQyGxxokZ9OGoNH7XFazvrMKc9qRLsTmpztHQMShHa8FLSwaC1jzypSSJ2/0eTV
         YKnHFuxbqAWaIHkbu+3fNNi2wUe40sWmRg9YKGQmSCCVyCVuHOLkl65L2e/012rkBE3q
         Q9B9/klgR5POOzgdPQI8B10K6FyYo3UMaRepAw4O3ZIqAwJj/1dH5GVyE4O9ZiHBEbIj
         uVQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778150446; x=1778755246;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PGTevllouHgU5n6pKJsSjzVnRCs5BCktvfEWEgejUNk=;
        b=HyGAyAUEdKwJ16AfGg22l5BA3+mjXCFUgktEGGMNYUuW45sWkdbsCLW8oRz8GdchiK
         ma/vQvrclOERrsGSI4/gxh+iTXYLRH7N4/e5v39w7l9pKhEZMCRRytHnpEAP6+etBEtS
         GXaZF65173spYyokkgaxmEhK4V/OSMciuVJFh9iYGSb5lmLv2OSlupma3ZcO/FIn8c5x
         TMT9J6AEqvbk1rgcA2GnnkmoOCGddzJb/1kYokC2u7QhYwKHuWn84P/k5SZvwO6MxGV/
         V+BLxYHtyto6PlTPCuux5JP5cUXsqyTnWzPYiKvgG16rKkNMFDF4E2FHM29W792Ub+FO
         lKdA==
X-Forwarded-Encrypted: i=1; AFNElJ8mzCvRmwmsruDGK/GO1IweuEoO4upjUQSnVY3wsdMgF+5ZT2Bxv03ox2Wl5cl3grw5KM+WBVpy2yA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4x6/HbWch9GFk1+/JZGpmIV6uIUaSxIEdE4bG2UWgEaz/oU3m
	/FKBorWfXFL4GtnS2WVY8Bm0gvevwVoo0BR8Schmkr0oWOAZET+5Wb0i9zWNmj8Nl6AEVrAyIa1
	/B0VV7gSDzDjFU+2GyHQ+KHyuFvjIikScYmnFVbGIMY8toOvLDM4Sk+ePKfC7Wgoh44yoSbA=
X-Gm-Gg: AeBDievOX4l+NPTaQQ7GbgYTF4MvXXS7SkDtxuRRRMuRdpjtOWtGKECxudihjhuyy5H
	ibVMle2Fb4Ps87ZMQyRekkzwvh0rtWENVNnzE5D2woNLexGwOtSBN7hPBxhpXm1KlYGiiJTidTB
	tA4EaxXJFSNW8Ii2ducfHAYogrSB2v1oUxQX/nZ2OFZ9KRAZ3sg/Gw8K6JP1qIArtYVv0rBCA0I
	k1iBQ4P3VHpikAF2W6Z2czmm17atX7zBcfgesvOcw9ALlZET9VMivdpRBiQgX7K37voUxB9FROt
	f219EI6Y7A00F7nGAOqs3vjxlj3xuPHaxVC7zwIM98hEPajl4zDc/ul54LXZe18B3fuU3AHkJGO
	9Fp0J6mBsgCSusihJyb1/lNu0t4n3yOCvaBHvgvg5skhmWcCPYRiKrdF5sswB6Q+fKhezSRRRRF
	3FXmxGPHsV8nCY1A==
X-Received: by 2002:a05:6122:6214:b0:56d:baee:40 with SMTP id 71dfb90a1353d-5755cc74085mr1250383e0c.1.1778150446037;
        Thu, 07 May 2026 03:40:46 -0700 (PDT)
X-Received: by 2002:a05:6122:6214:b0:56d:baee:40 with SMTP id 71dfb90a1353d-5755cc74085mr1250375e0c.1.1778150445607;
        Thu, 07 May 2026 03:40:45 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bc833742a54sm65220366b.32.2026.05.07.03.40.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 03:40:44 -0700 (PDT)
Message-ID: <02b4a4ca-c091-47b0-bae7-e38d9fa77850@oss.qualcomm.com>
Date: Thu, 7 May 2026 12:40:42 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] usb: host: xhci: Allow non-Intel usb_link_tunnel_mode
 reporting
To: Mika Westerberg <mika.westerberg@linux.intel.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, usb4-upstream@oss.qualcomm.com,
        Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>
References: <20260505-topic-dwc3_tunneling_state-v1-0-4aaa6c3c14cb@oss.qualcomm.com>
 <20260505-topic-dwc3_tunneling_state-v1-1-4aaa6c3c14cb@oss.qualcomm.com>
 <20260505121404.GG6785@black.igk.intel.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260505121404.GG6785@black.igk.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: DRcP3RfxlomCJML1r8Xd0cuIAO-gQmot
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDEwNiBTYWx0ZWRfXx7beb28gMcFr
 lRJDCRzyQKXt5uMRV79wB0vn+y5CnOjR1zEPTPq/umTRpp57drTVSNpN3pGrix605B1YJ9YRQs/
 G5OAKiAWPuchH0A/vDSihMR1TmbkU1k2uAm8knv1hJpAA99W1rs2oFgftDcSklZ6qXchWtPLN5h
 PMB8zTIwUrhPnva4rc9bUMA8MziudTX1WYJ1tR869mV6I/KH0QpOkTNa1I+9r9liY1vY+x/PVgj
 4SRNUE9O9vfhcjN/BCflOjKlysTJ/yArzaipHy4lDNYVe2Lo3oJHygA7Xwbm042zvW4NpKwTpQ8
 KT1VQtGHr9vaBHZnmNEzKXYSE+TfzNVBoODXVUhyddq24G4H5nkZ6NgOCQZnCDjzUwVvJDNQlpW
 P8XiS6H3TxVu2XQgI4oHJEnICr7dVmRI/FLiZH+yplHH8zSq7kxwbOk4iztckbsAeo7cXUIovoF
 R67kXW32dt3I2KtFYMQ==
X-Proofpoint-GUID: DRcP3RfxlomCJML1r8Xd0cuIAO-gQmot
X-Authority-Analysis: v=2.4 cv=X8Zi7mTe c=1 sm=1 tr=0 ts=69fc6c2e cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=FtxRuB4QD5ijYHSLzlgA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070106
X-Rspamd-Queue-Id: 8655C4E6F3E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37077-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/5/26 2:14 PM, Mika Westerberg wrote:
> Hi,
> 
> On Tue, May 05, 2026 at 10:55:04AM +0200, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> The Thunderbolt framework relies on the USB core to create device links
>> for tunneled ports, so that the USB3 controller is only kept
>> runtime-resumed for the duration of the tunneling.
>>
>> Currently, retrieving that information is only possibe on Intel XHCI
>> hosts, through a vendor-specific capability. Extend xhci-plat to allow
>> plumbing a custom one.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> ---
>>  drivers/usb/host/xhci-hub.c  | 4 ++--
>>  drivers/usb/host/xhci-plat.c | 2 ++
>>  drivers/usb/host/xhci-plat.h | 1 +
>>  drivers/usb/host/xhci.c      | 6 +++++-
>>  drivers/usb/host/xhci.h      | 5 ++++-
>>  5 files changed, 14 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
>> index bacd0ddd0d09..09e5da912066 100644
>> --- a/drivers/usb/host/xhci-hub.c
>> +++ b/drivers/usb/host/xhci-hub.c
>> @@ -750,7 +750,7 @@ static int xhci_exit_test_mode(struct xhci_hcd *xhci)
>>  }
>>  
>>  /**
>> - * xhci_port_is_tunneled() - Check if USB3 connection is tunneled over USB4
>> + * xhci_port_tunnel_mode() - Check if USB3 connection is tunneled over USB4
>>   * @xhci: xhci host controller
>>   * @port: USB3 port to be checked.
>>   *
>> @@ -764,7 +764,7 @@ static int xhci_exit_test_mode(struct xhci_hcd *xhci)
>>   * detecting USB3 over USB4 tunnels. USB_LINK_NATIVE or USB_LINK_TUNNELED
>>   * otherwise.
>>   */
>> -enum usb_link_tunnel_mode xhci_port_is_tunneled(struct xhci_hcd *xhci,
>> +enum usb_link_tunnel_mode xhci_port_tunnel_mode(struct xhci_hcd *xhci,
>>  						struct xhci_port *port)
> 
> I'm wondering if this could be:
> 
> bool xhci_port_is_tunneled()
> 
> becase if I understand correctly that's the only information we need e.g is
> it going over tunnel or not.

It was originally introduced as a tristate enum in:

f46a6e165197 ("usb: Add tunnel_mode parameter to usb device structure")

but the usefulness of USB_LINK_UNKNOWN is limited to a dev_dbg() print..
I don't really have strong opinions either way

Konrad

