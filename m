Return-Path: <linux-usb+bounces-38268-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0BrzEo4ZHmokhQkAu9opvQ
	(envelope-from <linux-usb+bounces-38268-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 02 Jun 2026 01:45:18 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F4E6266AC
	for <lists+linux-usb@lfdr.de>; Tue, 02 Jun 2026 01:45:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 45EA43032826
	for <lists+linux-usb@lfdr.de>; Mon,  1 Jun 2026 23:44:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9592391841;
	Mon,  1 Jun 2026 23:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ByPfXpJ2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OWDBlkVD"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DBDB38C2D0
	for <linux-usb@vger.kernel.org>; Mon,  1 Jun 2026 23:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780357440; cv=none; b=uqclTG3+VeiUirTkXaWUaBG15k/ZMMVhay87HtBa8dd5egm8L3f4Ao8FlYGE//TcmCAvh6PYDjNLZMkPC12Q63aQ0ttBZIgIzP+x8lYI8FKyIE+Ehd4M0JgijlAuYZlFUGJOxjU4A8THJsParUD5BP8DbYnxGb+2cwdtez9T0SY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780357440; c=relaxed/simple;
	bh=bRMIe/SgZcXtejTqCmwYq4zJAtnC8yYbh841gtrQP8E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=td0Oc0BY4aHoPzPfF2EdHYQrvaWEeQK7e7Ls9cKkAfwaNYwPrKEXCwpbVaGpZtdiDEfaf/fNBigsZowPQiYptCRShFIeNeuiEvOCK1Vw0cjBrZZfAwY3rWCp4Fj8/oEF7buJYdDq9vh0qoA3L57MdOAVCwGavp5Gg+sZkbxY4ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ByPfXpJ2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OWDBlkVD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 651EoHVk2740402
	for <linux-usb@vger.kernel.org>; Mon, 1 Jun 2026 23:43:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LVWwkZdU+/i7RbvWnqhsoX5gtYbQkKJMH7YMGSl1o4g=; b=ByPfXpJ2uLyF5443
	mPQ07Yn0A9unlBgTmGU6fqGtoypofvPXpflMfxH/m2wffKDrTXh318IWB2hbrfTk
	Rm0TJvkT8tA3iL4Lzv8M653RS0Y8+V7W9wF/xaNzpdQk0GoUBUfKpmoZcs3SBQUn
	RzYPGOcPiUSUiT7l7Sc0uiWL5FN3l1hYvLwodbYBSGUBbGJGyphnjputMQfxH/tS
	CvWUmCPKcoidcazjP5ewbuMJI5TN5fjzDAT9VbaBUKxo2yxsL+Ojd4fx9Lqt3h1Y
	oxVh3zfS17TSJo1+qzD+k4UyU1RCtnJ7GJhRLG86b7nHaXmprxnzsDnLC6LrWeIu
	SHKFAQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh6sqkkn0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 01 Jun 2026 23:43:58 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-304ed777a96so2076675eec.1
        for <linux-usb@vger.kernel.org>; Mon, 01 Jun 2026 16:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780357438; x=1780962238; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LVWwkZdU+/i7RbvWnqhsoX5gtYbQkKJMH7YMGSl1o4g=;
        b=OWDBlkVDnKhCXRh1yv8mvsahj13c+38cJVJZ6O+uk+qER25Vtzj6RU7YsbHkDW//h1
         c63Dl06jF2zx9AABYafpn1tgEEE21Sd9B5updsozcBzGGll0AUQnpjfYKms/NLMt1PXy
         KmEoCYPGuKkrirBYWoOlNlxQwl1NOANllou+Y5i+8t/CulQAs/DytVTFD4iCkMwYx0+/
         RsDjas9luo8Ces3ujqFclRykf/eUksqTF9E6+sIAG13T7W+2Ujkb2g8rJKv0X/YQ9fnr
         AnQncMRMI1vicjaNG8AcO1gYBsLQrt1J2zuieGPxDHzXr/Wxy7cCUbEVZtvZTHHy/OFW
         9i6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780357438; x=1780962238;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LVWwkZdU+/i7RbvWnqhsoX5gtYbQkKJMH7YMGSl1o4g=;
        b=GElfZoVsc3ijJHx3U9NmyW5qaZOgPVqTFgL6WeoK/7xi6n+1Y1xv9Uin54QO71soH0
         k7zpLEV6keSYEV6absxXZfm3Ccin2/Hqr0cwkgTivicHHbPvrLmo2qCpmVJ7gtSoNRtK
         TCTDyfAWY7nbg8kxuYdGT9wqLLJo2Pf84bhYFTxNLSa6ggwz8s+QgD9C2dC/BKi4pNzP
         P+79FAeppfvzhrxWrZAfUKobz2KV0+EqSlFXNojGQl9Oj6fFwU/+zYWma50gt31B3rI5
         unPUfb7T/przTXjOolIAYpnCiwD+3BhydasM0dqcD7Oj+w5weW8sKLgZFIX9fZjS5DDT
         +JAw==
X-Forwarded-Encrypted: i=1; AFNElJ8gIr+dmBodj2y5r5cTdz4gB8oMbJnrpoHJDkcJlA0KZGxnwX/Y6BxTXJtBAWUADpvURs4ySffl7yk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVZrarhb1yTrHSAsW5xNlvhP0dn5AyVoeGfxvpsjOgyHr9ra89
	V5G8vVr0irKwh7U+Nn9EYEXKDU1bkxpobzvCtuchHaT1K0EheJuZBag74bD8eSxbOd8uEYefItV
	gNyrOTgwMkR9xaUpDX2oGkQWwbMIt+oefza7eH0lhE6RF61ym+RveoyXWEkrYGu1bF2Si7X0=
X-Gm-Gg: Acq92OHR8xye5ap+yrqwSsuGFCVQ2eK9fo+1h/o4M515EPLrKphayOdIL/H628W/8z+
	xc/BUSE0hTsUeC2vqoYRtnYNhGxcvU5nvh6UnpbDeMxbjGYQCVNXntDGpu7cq7fn6GC5NH2+/oN
	7uS5691XZO6dL5Cdfc8gThvw47egK+n9YX9Y4IP6Fm4zFOyXa3Y3WO1t3UfSIlj/GryV1sWjUfH
	y97IYGZut9DVyVbjAcUI7RmEsL5u4Zqe68nqreOpIB+fQhHDwZFtvJzxPxpd5GgpYgiAUxy7Y7C
	qLYpeMJobIBMXbRQj8YrX5yqBOWiR9qRipgaFW6B+86RkWk7GE4I0xQmveZ1zQ5ui8QXPd3AEfi
	3TvlnqsnhyiKfyNy6fsYzxe3Tj3ZEqfzFXQs6QV5oKAkBtmpMUbzBMYEaddnEDA==
X-Received: by 2002:a05:7300:5b9e:b0:304:ad0:e91 with SMTP id 5a478bee46e88-30734a41556mr828028eec.4.1780357437655;
        Mon, 01 Jun 2026 16:43:57 -0700 (PDT)
X-Received: by 2002:a05:7300:5b9e:b0:304:ad0:e91 with SMTP id 5a478bee46e88-30734a41556mr828012eec.4.1780357437059;
        Mon, 01 Jun 2026 16:43:57 -0700 (PDT)
Received: from [192.168.1.133] ([70.95.199.79])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304ed53d14fsm10174697eec.17.2026.06.01.16.43.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jun 2026 16:43:56 -0700 (PDT)
Message-ID: <7ab2b045-d93e-4a25-9ef2-ef34146fd53b@oss.qualcomm.com>
Date: Mon, 1 Jun 2026 16:43:55 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] usb: dwc3: avoid probe deferral when USB power supply
 is not available
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "jack.pham@oss.qualcomm.com" <jack.pham@oss.qualcomm.com>,
        "wesley.cheng@oss.qualcomm.com" <wesley.cheng@oss.qualcomm.com>
References: <20260526183016.3501307-1-elson.serrao@oss.qualcomm.com>
 <ahdzhu-wahIyD7eR@vbox>
Content-Language: en-US
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
In-Reply-To: <ahdzhu-wahIyD7eR@vbox>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: J1HO7ggY89B98z6Rwf7bcy06dCZw3Kb3
X-Proofpoint-GUID: J1HO7ggY89B98z6Rwf7bcy06dCZw3Kb3
X-Authority-Analysis: v=2.4 cv=eqnvCIpX c=1 sm=1 tr=0 ts=6a1e193e cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=uHxescsG3rBdxcXwcPaeSg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=nBKuNKWrVJy6xT-lvhQA:9 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDIzMiBTYWx0ZWRfX9tzU+UgewfWg
 wZAVHUH1glf4lFz4W4DTv8ZHzwsZjM2GT4R3Y9qwCGdTxq0YR1pkCyki7XrLGcwvJWsiFxiJi3T
 DGclk5GnbX0tAfuXNF3RJ+j3LOyaqn5ZAmxW/JsHbYyGHFvv4zpNOKcNQoAYUKYobxJI4N+MOHY
 0qzjujCyUlXUULX9JQb6Xf6kzvELXtpHXP9myweiv7U1+4wq+q+2wUe84W2SbpR/1obglltYPIf
 YEYXVqeTMW2h8hMNsONSdotQTo1fo+ZK1yUtoOwyZgJlgUtLXYmLyDrIXmcZlU6zgnJ/SnxLzYG
 41o+YrwhVTh6+/Oy7gnukHLmeSAMZ8AhsdTW1+HUPqewho/HxH1/WL76iXkIeZ1z6gCw1ZAl2ze
 zAxZ0fO+J93ZhCSLa83ZmwWL1ayq4eZLreCRK9yP3dCGSNWQQyfBmzosk59hfukXGfPd9sFQFHr
 C2G2ntAd1Ib21nFNhaQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_06,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010232
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38268-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elson.serrao@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 97F4E6266AC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/27/2026 4:23 PM, Thinh Nguyen wrote:
> On Tue, May 26, 2026, Elson Serrao wrote:
>> The dwc3 driver currently defers probe if the USB power supply is not yet
>> registered. On some platforms, even though charging and power supply
>> functionality is available during normal operation, there may exist
>> minimal booting modes (such as recovery or diagnostic environments) where
>> the relevant USB power supply device is not registered. In such cases,
>> probe deferral prevents USB gadget operation entirely.
>>

[...]


>> +	}
>> +
>> +	dwc->usb_psy = psy;
>> +	if (dwc->current_limit != UINT_MAX)
> 
> Create a macro for these kinds of checks for readability:
> 
> #define DWC3_CURRENT_UNSPECIFIED UINT_MAX
> 
Ack.

[...]

>> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
>> index 3d4ca68e584c..303598048e9a 100644
>> --- a/drivers/usb/dwc3/gadget.c
>> +++ b/drivers/usb/dwc3/gadget.c
>> @@ -3124,15 +3124,21 @@ static void dwc3_gadget_set_ssp_rate(struct usb_gadget *g,
>>  static int dwc3_gadget_vbus_draw(struct usb_gadget *g, unsigned int mA)
>>  {
>>  	struct dwc3		*dwc = gadget_to_dwc(g);
>> +	unsigned long		flags;
>>  
>>  	if (dwc->usb2_phy)
>>  		return usb_phy_set_power(dwc->usb2_phy, mA);
>>  
>> -	if (!dwc->usb_psy)
>> +	spin_lock_irqsave(&dwc->lock, flags);
>> +	dwc->current_limit = mA;
>> +	if (!dwc->usb_psy) {
>> +		spin_unlock_irqrestore(&dwc->lock, flags);
>> +		dev_dbg(dwc->dev, "Stored VBUS draw: %u mA (power supply not ready)\n", mA);
> 
> Can we use the check if dwc->psy_nb.notifier_block is set to determine
> if we expect to have a power_supply? Then we can print the message above
> when it's really not ready, and only return -EOPNOTSUPP if we really
> don't have a power_supply.
> 
Hi Thinh,

Just to clarify, in the case where dwc->psy_nb.notifier_call is set
(i.e., we expect the power_supply but it is not available yet), should we
return 0 and treat it as success since the current limit is cached and
will be applied later?

Or would you prefer returning an error (e.g., -ENODEV) to indicate to
composite/upper layers that the current limit was not applied immediately
(in case they need to observe this state)?

Currently, we update gadget->mA only if this gadget op returns success.
Returning 0 in this case would update gadget->mA even though the limit
has not yet been applied.

Thanks,
Elson
>>  		return -EOPNOTSUPP;
>> +	}
>>  
>> -	dwc->current_limit = mA;
>>  	schedule_work(&dwc->vbus_draw_work);
>> +	spin_unlock_irqrestore(&dwc->lock, flags);
>>  
>>  	return 0;
>>  }
>> -- 
>> 2.34.1
>>
> 
> The rest looks good to me.
> 
> Thanks,
> Thinh

