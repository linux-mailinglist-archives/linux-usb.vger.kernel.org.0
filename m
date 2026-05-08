Return-Path: <linux-usb+bounces-37113-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uCxuDIku/WlIYgAAu9opvQ
	(envelope-from <linux-usb+bounces-37113-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 08 May 2026 02:30:01 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7244F07A2
	for <lists+linux-usb@lfdr.de>; Fri, 08 May 2026 02:30:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 21DD1303AB64
	for <lists+linux-usb@lfdr.de>; Fri,  8 May 2026 00:29:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC1EB1F63D9;
	Fri,  8 May 2026 00:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="icQn8/85";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DvNtdI3H"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 950191DF736
	for <linux-usb@vger.kernel.org>; Fri,  8 May 2026 00:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778200140; cv=none; b=N7XPRqREStj5UpT/iVs4S+62HLDlFoq7jdGhMit92St01H5Q908u2lp/jXc1kFRI1a8TeVLThd4DcA8PHIg320P/yNv1FT42TalmSLGqkRRCgJu/7NUvFqJOtB/vPYQlmmHQUHnXSSkB8409+1sDvGrPPeGY7YkbyvitPz+q9TI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778200140; c=relaxed/simple;
	bh=hiKCvmGqb1uuPjJp0D/nD0i9zzKH3FlhdURMk/RAc6E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lmp4OVuXwamOcJmXIC9KMkbQuO95kmLpaBH6iotQJVKPTAE+bnQnuPrAKuJWoaDxOZ0GHEgPXoVMhhi2dQcgUdn9aH+2L1JNM0NwmyuPoYE1RRHdj9GGrg4lO30abziIpZxATtaSpmg89Q2hNPqoZjZR/rxu2KsIv9n4AT3dEUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=icQn8/85; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DvNtdI3H; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647IBfPC2771025
	for <linux-usb@vger.kernel.org>; Fri, 8 May 2026 00:28:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f+n+hrmRjgNwY691mbAUgor0uxE2JHAX2hCfAk8KTi8=; b=icQn8/85KHbZHbe/
	rXtGshr/drVMDgWTXWTjna6dUR2ppXZ8ZoqeIbtErv5dhvZW8gCOkd/U9e9065Yk
	tbWk0RNm7SJaC7N9bJvKiEkNFdgCFAZCVjMRZlTwquGUBLp17rWvCb3bObLNHf20
	ZcaiuH75kUOB03jZ5U1yhFhrmBR4zjSvqgp5hMBdQHPhUxXx0RkQcsyojAXn12JN
	OAvKGkYvBcysaGa8/ugrg/xLbdquo7jgE7kLJeyI0Q4BGVvLcT5HvZhUfJwlakOf
	gATIIuWmY209KROEiECGjtEFmMg+JGg4OwQPo/vMhbOjjh3OrPxxxDwoQ/P9X3k/
	nwzCxw==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0yt5h49k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 08 May 2026 00:28:57 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-12dfb99429bso9366366c88.1
        for <linux-usb@vger.kernel.org>; Thu, 07 May 2026 17:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778200136; x=1778804936; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f+n+hrmRjgNwY691mbAUgor0uxE2JHAX2hCfAk8KTi8=;
        b=DvNtdI3HaKv7L12ql/5F0Q5j6RDfbKpf5x4u44GZsIpsrPi6bo0WA43YShqdqtLlRL
         DfDfC3+5wMxL/7Tt6Pu066NPwO60cX7yhKmtInfjGAFhPB12FnHYZAUvC6VFORPTQa/c
         xkP7T0IG3zO6apPdmBeGLRnXgai70JRa6+DEx339Yw+1GA7eyOTIQwF3Gx4fckir1CAR
         1oLc6j7CmAXEEXEBPFXJUMFjGeaKueGmR3E6IPOIOGDNOltIPnqpeZ62DO4iZ8rd3ox4
         kS9WfIbGxkEEeGykzdtoo/A4/0RvAnUG6Xdq8QTWMmSVyTb3PZy1H4kSlFW26mW/xX4X
         OrNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778200136; x=1778804936;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f+n+hrmRjgNwY691mbAUgor0uxE2JHAX2hCfAk8KTi8=;
        b=oPHCQMDPFgoIPNmFkWEYYlD/W1HfuRaPg6Cdu0xwfk/0EiHRyM+xuvotVOweQs2BBd
         o8EKn3nSL0PoZ57SE0zyVXhnSouWf1f1vUY7JQG5tcn8ZQMobFnoFY3qYUn1jZ+pbdMb
         7n9MUWeW5GGpBzjxlLcK1AmXPFf10CeRkLERZ0DHmKh/eIOJoQlEfIDVeJcdPRnYpLUD
         x5McKO304mt68uwQg+D/Bf6mwN/Wxf7a8HSorjwkOHEHvjUcAcxJ0LhijtGxn7W6IK92
         bhvbBqJ1AIpEkwZdkATxZZK1o72za4euQO2LJbqXHs19gMqZnd1V1s4eVf3jxzNmjtGR
         /cEQ==
X-Forwarded-Encrypted: i=1; AFNElJ/QyPhAKNSEY08fQdhFSGjH7EV6f9ggWhTjcWb1yCUgupQJCWO+ApNlEMmYQC2e8U7UT5GNtaa9Bo8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAlvUqDnsJCpe9LgNE6ggEc4ldQekNATkqdMTRDhiRv9xtY1xV
	P7dxHm6i/JRMkzyQ2ZwY9BdEZb1eFU5IiQf3/liK2Nklfrdz8SFteDHSFY9CI9CjRVDGmoag3u2
	3c4fhfpFMMz1e3tBZFZKZOZdbBxyS8/Frv4/vja1CUG8cc0lhZYbEJcn3I3emfQA=
X-Gm-Gg: AeBDietdm8p0z7VZJyGgttr2FsfPyzSDUAGQv/IoARDwMcCeNN4RCVGKa3MwB0eDe1Y
	Eyd6Gn6kLjLkGqk6fV5vJ8Hn4B53Ll3hjxn6w2IwUrzUMl637+O/4CM6qwlXc/61IrVPNKoAMND
	/ywpAkLQ9H6GvOoi5mLNjU56Kdnbz1o4F2+fUa8kXC9b4Igw+IhnRmeW0zLPmyww+3YQPDVkv6B
	JxzJLeVLW3rudjK/CZVTwkz2O7pQR9ZP8/v4+sKR3fZmXY0n4Addl15IpmxDoucU1bGHtPrF4rI
	+QQdV4yaEjPaJ3Mi4zM8bAqXwjwXO9c2FbULUN9/kFnx8PW6BBD5BkDrQZqcK5zxsOd2NytuNxB
	EJaSYsmNOMWah3YWk+y41Jh8UTCSZwus2KVXf+V1RH40b03v5gwjK/0zZcFXBdnIDO0jL4HuArj
	geaaY=
X-Received: by 2002:a05:7022:3d05:b0:12a:94ab:e20 with SMTP id a92af1059eb24-1318e917636mr5571112c88.20.1778200135791;
        Thu, 07 May 2026 17:28:55 -0700 (PDT)
X-Received: by 2002:a05:7022:3d05:b0:12a:94ab:e20 with SMTP id a92af1059eb24-1318e917636mr5571097c88.20.1778200135037;
        Thu, 07 May 2026 17:28:55 -0700 (PDT)
Received: from [10.71.182.226] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13278210d40sm154352c88.4.2026.05.07.17.28.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 17:28:54 -0700 (PDT)
Message-ID: <e8363dc3-0339-48c6-a7b5-833b2b3ec4f7@oss.qualcomm.com>
Date: Thu, 7 May 2026 17:28:53 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: dwc3: avoid probe deferral when USB power supply is
 not available
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "jack.pham@oss.qualcomm.com" <jack.pham@oss.qualcomm.com>,
        "wesley.cheng@oss.qualcomm.com" <wesley.cheng@oss.qualcomm.com>
References: <20260407232410.4101455-1-elson.serrao@oss.qualcomm.com>
 <afVDFDK_cTO7rH2d@vbox>
 <4db536fd-9b20-49ec-a5f3-1fa3f2876c1e@oss.qualcomm.com>
 <af0WXtFvDwbI9-9-@vbox>
Content-Language: en-US
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
In-Reply-To: <af0WXtFvDwbI9-9-@vbox>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Dc0nbPtW c=1 sm=1 tr=0 ts=69fd2e49 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=QjaDh_2JvBKc0s5STn8A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-GUID: 2l1zYwLuNwNMuIcgYw-YFvhIXM6tq-eJ
X-Proofpoint-ORIG-GUID: 2l1zYwLuNwNMuIcgYw-YFvhIXM6tq-eJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDAwMiBTYWx0ZWRfX1CJ5DkQMFij8
 z+in0YM6Lk/j/ZW5B0e7zDK+U4tzAqobqe5+8goStMoQtgCGfDLkexWBnMFxZ3NVi2GBRA/emeW
 /ENnDkev9tP2mc7XWSjN3FthZ6bGtFw2p+a/zq+Mc8O5tOKR0U/AJCVtv8o6SxcK1gKlzbH4Tbf
 s+O9oIUucs7wGwSV4DKhfy1fPH/TaEzaquNcLAs89ZoD805sn44KF8LJ44to9SOPy737xBM9vbG
 WltQkzuhiiiBY6OUODEBYoJ6JvuUVeL1P4XJm2/1MSdjb+57yEYw5jSPMMWtVqrhKh1EP27Sk5W
 fCNX0MF9RYGgy3t91BFT0D+pPhwZ3fC9VD4QmfIvvuSLJ15kylDU8HT3NuEyKMnylzAelk9jfST
 S8VcLlqtvlgAvw5HZYRoitOwUztEwpW8gz1cmxpG3ahfOkSjpCPPx6/hdvGv0UHpuX0tns61epK
 Hvg1PgtnMUkC6/ejrFw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080002
X-Rspamd-Queue-Id: 8A7244F07A2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37113-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[urldefense.com:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elson.serrao@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	REDIRECTOR_URL(0.00)[urldefense.com];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action



On 5/7/2026 4:02 PM, Thinh Nguyen wrote:
> On Wed, May 06, 2026, Elson Serrao wrote:
>>
>>
>> On 5/1/2026 5:55 PM, Thinh Nguyen wrote:
>>> On Tue, Apr 07, 2026, Elson Serrao wrote:
>>>> The dwc3 driver currently defers probe if the USB power supply is not yet
>>>> registered. On some platforms, even though charging and power supply
>>>> functionality is available during normal operation, there may exist
>>>> minimal booting modes (such as recovery or diagnostic environments) where
>>>> the relevant USB power supply device is not registered. In such cases,
>>>> probe deferral prevents USB gadget operation entirely.
>>>>
>>>> USB data functionality for basic operation does not inherently depend on
>>>> the power supply framework, which is only required for enforcing VBUS
>>>> current control. The configured VBUS current limit is typically enforced
>>>> through the charger or PMIC power path. When charging functionality is
>>>> unavailable, applying a current limit has no practical effect, reducing
>>>> the benefit of strict probe-time enforcement in these environments.
>>>>
>>>> Instead of deferring probe, register a power supply notifier when the
>>>> USB power supply is not yet available. Cache the requested VBUS current
>>>> limit and apply it once the matching power supply becomes available, as
>>>> notified through the registered callback.
>>>>
>>>
>>> This gets a bit cumbersome now that we need to consider some corner
>>> cases around the notifier callback.
>>>
>>>> Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
>>>> ---
>>>>  drivers/usb/dwc3/core.c   | 82 ++++++++++++++++++++++++++++++++-------
>>>>  drivers/usb/dwc3/core.h   |  4 ++
>>>>  drivers/usb/dwc3/gadget.c | 10 ++++-
>>>>  3 files changed, 80 insertions(+), 16 deletions(-)
>>>>
>>>> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
>>>> index 161a4d58b2ce..20df0b287623 100644
>>>> --- a/drivers/usb/dwc3/core.c
>>>> +++ b/drivers/usb/dwc3/core.c
>>>> @@ -2167,24 +2167,72 @@ static void dwc3_vbus_draw_work(struct work_struct *work)
>>>>  	if (ret < 0)
>>>>  		dev_dbg(dwc->dev, "Error (%d) setting vbus draw (%d mA)\n",
>>>>  			ret, dwc->current_limit);
>>>> +
>>>> +	/* Unregister the psy notifier now that we have the power_supply reference */
>>>> +	if (dwc->psy_nb.notifier_call) {
>>>
>>> Is it possible for dwc3_core_remove() to happen here? If so, should we
>>> do something about it?
>>>
>>
>> Hi Thinh
>>
>> Thanks for the review.
>>
>> Yes dwc3_core_remove() could race with this path.
>>
>> To simplify things, I’m planning to unregister the notifier only
>> from dwc3_core_remove(), so we don’t need to handle this case here
>> and the notifier lifetime remains tied to the device lifecycle.
>>
>> Let me know if you’d prefer a different approach.
>>
> 
> That's fine to me. Just make sure to return early if the power supply is
> registered.
> 

Ack. I will fix this in v2

> <snip>
> 
>>>> +
>>>> +	dwc->usb_psy = power_supply_get_by_name(dwc->usb_psy_name);
>>>> +	if (!dwc->usb_psy) {
>>>
>>> Is it possible for the power supply to register here?
>>>
>>
>> The power_supply framework introduces a ~10 ms delay [1]
>> before invoking notifiers after registration. So for the race described
>> above to occur, our probe would need to stall for more than that
>> duration between the initial power_supply_get_by_name() call
>> and notifier registration, which seems highly unlikely under normal
>> conditions.
>>
>> That said, there is still a theoretical window where the power
>> supply could register in that gap. If you think it's worth being
>> defensive here, we could re-check power_supply_get_by_name() after
>> registering the notifier and handle the case accordingly.
>>
>> [1] https://urldefense.com/v3/__https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/power/supply/power_supply_core.c?h=v7.1-rc2*n40__;Iw!!A4F2R9G_pg!dUiPW6mibrvsk4uGO4MnGVg3R1zR3EmxxIROrw4N-ytHZq7N9q-V6irNAWrBrolUR2HABsAGSQoMPzGnEGQsvWdhzWzcVHOU$ 
>>
> 
> For my own sanity, can we have that extra check? Otherwise, every time I
> scan through this I would need to recall why it wasn't needed.
> 

Ack. I will fix this in v2

Thanks
Elson

