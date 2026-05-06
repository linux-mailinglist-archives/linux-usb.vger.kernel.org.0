Return-Path: <linux-usb+bounces-37044-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2CafG8HH+2m6EgAAu9opvQ
	(envelope-from <linux-usb+bounces-37044-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 07 May 2026 00:59:13 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E521E4E16F3
	for <lists+linux-usb@lfdr.de>; Thu, 07 May 2026 00:59:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 91316301BA57
	for <lists+linux-usb@lfdr.de>; Wed,  6 May 2026 22:59:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E31003D300A;
	Wed,  6 May 2026 22:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SYUk2vVb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gA9oo+Jc"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0EC23D1718
	for <linux-usb@vger.kernel.org>; Wed,  6 May 2026 22:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778108347; cv=none; b=bKBdxuzmc+e9ZCW1RQ0eTsycGjJL4SXcvaHFGtunqRSJWwtr88p5/EK7o4VGSlJYNdco6b9sdtKaaHhp9y+oCxfl8Ve6b/X8/QOD2ukDMEenWkuUcRkLDYKByN+9kVvk7hW67OT3zAKApkS6MKcmJR507E79LPQQAqD8AS3ShRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778108347; c=relaxed/simple;
	bh=ypTp8pg+LVjHl96IYXPOFP0B6hONDCFcttqYkHC5Lig=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rawIlOzBF1LZY8ehlEotTqyBuzXHchd0qpmhJHMHMwoBU4xQfnxHNnHTpA/7a16q3Y6/icxM7QE4+GKJiM+Md64kuKHrCqYQ55gZ4BmQuVqV5fCMqFWfE/OjZHO+2LlICBKY9tEanq9ZO0Vkx3B0HNAtjlXOlbz5TH5NN4C09nE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SYUk2vVb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gA9oo+Jc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 646GuQuf1985530
	for <linux-usb@vger.kernel.org>; Wed, 6 May 2026 22:59:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tQpnVKby/gVhGjicXZ/JuZWGOqhW7iiDfi0Yv85VHJw=; b=SYUk2vVbA9dmdN0A
	b2L3O2r+itpCZb+26dQ1yYcF82bVPuRNMD318W0DJXTmVqraeCDeVFSoruNJqV/Q
	JiX3siLBAFi/qc/1QnsM0ACORQUlvtd3PoecGNzYvFnwUB3jfKjvITvJRpqUh5LA
	EkqSvYCJ1Bofmf8fUZX6PjcOGWJkw5tIgc/3w+SjDJ6WofOzAjXkKClVwAjgErfr
	WlQeEo7Mr710yxUm1J+0F71TEZkU76DKjqvgU09Qa6Xm7THxRGvSZqpxMx/BZmRx
	G/vIY/yiZNN7gxVYkPh+re4tmNVSEIzEpNWKGuKvQGjgqRPPH0CIvx7pBX3Gv79O
	z3lXDQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e03gp2t1x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 06 May 2026 22:59:04 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2f485961555so1268679eec.1
        for <linux-usb@vger.kernel.org>; Wed, 06 May 2026 15:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778108344; x=1778713144; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tQpnVKby/gVhGjicXZ/JuZWGOqhW7iiDfi0Yv85VHJw=;
        b=gA9oo+JcmVejKXVUJMRK2pLDmb4B9ak17FVbZmSFpJxKAaFLX+yFmJFdMKs7fJEkSG
         ghtXpbUjwB1GPUswz81heblFiP14vJVkKmsSoFmnyzmdlYgpLP1MWa5cjwMDAIYREQQj
         QISH7BQIGhC9Y7xWB9rWx/x0T0cA+rNwY2U2sccUSczcSS1GICbBlOHvsfZSSH+cE9OS
         11yT37anfWXQChpmK/2PEphwZnhPPWJEiWa1KeaHOYDkKz8JKxPLB1MSqRFtgPDZzytq
         BHs3VbCJ1eOKs9E89vsnjsdCHrRRAcrWVT3bEvMNADYtSHBE92zXwpBuj68UwTI02omL
         xPgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778108344; x=1778713144;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tQpnVKby/gVhGjicXZ/JuZWGOqhW7iiDfi0Yv85VHJw=;
        b=UaTOKKOnfYbtmu+HCQweL1UNWICR/noPh46UcCYRM7k9Ke/pm2xChCsjqo1NIl8AFt
         ddT+eA/7P7/MCEybfDt76VJqMZPoOZNkvu50tfElZv3ALMYW6B1nubbKMZ9KIs88kSWr
         Ub3ROHvDhpQVHeURe0jaSVVUFzYq0rSXCoQuDCq1SgCc9Vzud5cZZ+7CSE5K36S8agMv
         /kgSTtZ9MHi2bBuukNG1j79EcQ5HSKqjMOa16GvTRx4rAjOXlb9/jyL8yT+DPUxcLFew
         iZr6hLOLP+PtpndKRCh++nNMEYfSHvjd/NkLr4q5mw8PlbMmBbCzmOqB7yYA4nvImpC3
         h00Q==
X-Forwarded-Encrypted: i=1; AFNElJ9PkpCrAvYodIJBDy1dwz5lK6NTUWW6l/gKseU2xZNBLPPvekaOhMGxNc62MOpRvtaBw8dLxRXbaJU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxsFvjtzRW5EdMYmNSA4gUgOSrSi7J11snW/G4pZSX7VUFmS/Je
	QPunhgpELGKCvUctvJgWZoVeM9KPg6fFLKo13MPwZwd6mBMWPmWv1eZT4bwLvf/+jVHrNWzIOV2
	cc5OS/ySvmzjMJEwImvjtxJMOiVWX79s6/ijrW71L0PYqg0xT3qiDEJkNamhn95E=
X-Gm-Gg: AeBDietWmo5CImByCcP48jsgGfdzUdyT3uPbetNBmzVMUdXfa22XbiAz83tGMhTJe3Y
	W2jl2/Hyazs8JcLsxgnmiTDuOumcv+i02fa41I3GaEyu07xDDu9PRXtdLgmF+qhldAkPfZxhD43
	K0RgkM1fcH5jRJlHE+A673a8KuClBxump6lKTvuTuFpL4cipNCi71oXmPyJmytcKYgXJxiMAn++
	/SUmOS8dse0zvtlvwVxVpFAXK6YLNJmu0w6GMOdVrrGlbS5aR82U93rwZgJUR9kxPg9tZXFKxa8
	aAh1z94Yil42kJ+7j+FTcGN6GSKsuAhEBQxHQ9D9pSxbImCaj6b1U474iwVD46CrCaYkQkJ7JhC
	HYuuWPwTYnRru6iQcSPqQFVrRX6Ojy+dTNTaSV4u7BenqbAwjM7Iy+gaP3szPxrsE22MEWl0z+2
	M2bB3YBqrrTn593Q==
X-Received: by 2002:a05:7300:5796:b0:2dd:5641:ef2 with SMTP id 5a478bee46e88-2f54a38c2ecmr2622759eec.25.1778108343742;
        Wed, 06 May 2026 15:59:03 -0700 (PDT)
X-Received: by 2002:a05:7300:5796:b0:2dd:5641:ef2 with SMTP id 5a478bee46e88-2f54a38c2ecmr2622740eec.25.1778108343082;
        Wed, 06 May 2026 15:59:03 -0700 (PDT)
Received: from [10.71.182.226] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f56cec58efsm5585656eec.2.2026.05.06.15.59.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 15:59:02 -0700 (PDT)
Message-ID: <4db536fd-9b20-49ec-a5f3-1fa3f2876c1e@oss.qualcomm.com>
Date: Wed, 6 May 2026 15:59:00 -0700
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
Content-Language: en-US
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
In-Reply-To: <afVDFDK_cTO7rH2d@vbox>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDIyNCBTYWx0ZWRfXzyZ8CT1a1NFO
 TD7FxNMzyi5Hd9+9awH0DqZaqBUIlbeTB/+441bYuHdhs7BFYFC7Ub5mlz2L0PVpKrVri4553Qp
 GzQp5WqHNZgQ1JRFXRBaHdsli3XPfItD3/wEvNYKeC4/FaRQQLn1g3nX/e0r9rsOrfwCWMcVTXv
 4w5zWSPeEEVAbzmtxFc9fGqn2wMXOKuBhhRst0cPitF4OJKdtUt0KHz7Z4S5WYuPYU5ONpUm9LH
 dPysdjh4wpla+V544xW4ARkj3VVn6AJn0/wRKJaqmLZmseEK3kJRevKI/KSwXGOJdez6fCOGUk0
 vHYXaO93C+RNG8RHCjT9GPvpqFCa9vz927hQGC9UutoFVhKcBtFcEYzMfJqQZwIJiyiXW3L2jg2
 hGnqWgbaAcASOxUrfBPfV7phM0sFyfVIszwpsrOfvTjKQJYyK5kWw7/zEeDlvuCs9PDyX1KjkdI
 8FlCiYwNgncyKaWgXzA==
X-Proofpoint-ORIG-GUID: OqRdXvKanawXO9WHbke24AEtw9MOGeeW
X-Proofpoint-GUID: OqRdXvKanawXO9WHbke24AEtw9MOGeeW
X-Authority-Analysis: v=2.4 cv=W8wIkxWk c=1 sm=1 tr=0 ts=69fbc7b8 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=g0GlF-r2NOV7KOUd2_cA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605060224
X-Rspamd-Queue-Id: E521E4E16F3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37044-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elson.serrao@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action



On 5/1/2026 5:55 PM, Thinh Nguyen wrote:
> On Tue, Apr 07, 2026, Elson Serrao wrote:
>> The dwc3 driver currently defers probe if the USB power supply is not yet
>> registered. On some platforms, even though charging and power supply
>> functionality is available during normal operation, there may exist
>> minimal booting modes (such as recovery or diagnostic environments) where
>> the relevant USB power supply device is not registered. In such cases,
>> probe deferral prevents USB gadget operation entirely.
>>
>> USB data functionality for basic operation does not inherently depend on
>> the power supply framework, which is only required for enforcing VBUS
>> current control. The configured VBUS current limit is typically enforced
>> through the charger or PMIC power path. When charging functionality is
>> unavailable, applying a current limit has no practical effect, reducing
>> the benefit of strict probe-time enforcement in these environments.
>>
>> Instead of deferring probe, register a power supply notifier when the
>> USB power supply is not yet available. Cache the requested VBUS current
>> limit and apply it once the matching power supply becomes available, as
>> notified through the registered callback.
>>
> 
> This gets a bit cumbersome now that we need to consider some corner
> cases around the notifier callback.
> 
>> Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
>> ---
>>  drivers/usb/dwc3/core.c   | 82 ++++++++++++++++++++++++++++++++-------
>>  drivers/usb/dwc3/core.h   |  4 ++
>>  drivers/usb/dwc3/gadget.c | 10 ++++-
>>  3 files changed, 80 insertions(+), 16 deletions(-)
>>
>> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
>> index 161a4d58b2ce..20df0b287623 100644
>> --- a/drivers/usb/dwc3/core.c
>> +++ b/drivers/usb/dwc3/core.c
>> @@ -2167,24 +2167,72 @@ static void dwc3_vbus_draw_work(struct work_struct *work)
>>  	if (ret < 0)
>>  		dev_dbg(dwc->dev, "Error (%d) setting vbus draw (%d mA)\n",
>>  			ret, dwc->current_limit);
>> +
>> +	/* Unregister the psy notifier now that we have the power_supply reference */
>> +	if (dwc->psy_nb.notifier_call) {
> 
> Is it possible for dwc3_core_remove() to happen here? If so, should we
> do something about it?
> 

Hi Thinh

Thanks for the review.

Yes dwc3_core_remove() could race with this path.

To simplify things, I’m planning to unregister the notifier only
from dwc3_core_remove(), so we don’t need to handle this case here
and the notifier lifetime remains tied to the device lifecycle.

Let me know if you’d prefer a different approach.

>> +		power_supply_unreg_notifier(&dwc->psy_nb);
>> +		dwc->psy_nb.notifier_call = NULL;
>> +	}
>>  }
>>  
>> -static struct power_supply *dwc3_get_usb_power_supply(struct dwc3 *dwc)
>> +static int dwc3_psy_notifier(struct notifier_block *nb,
>> +			     unsigned long event, void *data)
>> +{
>> +	struct dwc3 *dwc = container_of(nb, struct dwc3, psy_nb);
>> +	struct power_supply *psy = data;
>> +	unsigned long flags;
>> +
>> +	if (strcmp(psy->desc->name, dwc->usb_psy_name) != 0)
>> +		return NOTIFY_DONE;
>> +
>> +	/* Explicitly get the reference for this psy */
>> +	psy = power_supply_get_by_name(dwc->usb_psy_name);
>> +	if (!psy)
>> +		return NOTIFY_DONE;
>> +
>> +	spin_lock_irqsave(&dwc->lock, flags);
>> +	/*
>> +	 * The USB power_supply may already be set. This can happen if notifier
>> +	 * callbacks for the USB power_supply race, or if a previous notifier
>> +	 * callback has already successfully fetched and associated the instance.
>> +	 * In such cases, release the newly acquired reference and ignore
>> +	 * subsequent notifications until the notifier is unregistered.
>> +	 */
>> +	if (dwc->usb_psy) {
>> +		spin_unlock_irqrestore(&dwc->lock, flags);
>> +		power_supply_put(psy);
>> +		return NOTIFY_DONE;
>> +	}
>> +
>> +	dwc->usb_psy = psy;
>> +	if (dwc->current_limit != UINT_MAX)
>> +		schedule_work(&dwc->vbus_draw_work);
>> +	spin_unlock_irqrestore(&dwc->lock, flags);
>> +
>> +	return NOTIFY_OK;
>> +}
>> +
>> +static void dwc3_get_usb_power_supply(struct dwc3 *dwc)
>>  {
>> -	struct power_supply *usb_psy;
>> -	const char *usb_psy_name;
>>  	int ret;
>>  
>> -	ret = device_property_read_string(dwc->dev, "usb-psy-name", &usb_psy_name);
>> +	ret = device_property_read_string(dwc->dev, "usb-psy-name", &dwc->usb_psy_name);
>>  	if (ret < 0)
>> -		return NULL;
>> -
>> -	usb_psy = power_supply_get_by_name(usb_psy_name);
>> -	if (!usb_psy)
>> -		return ERR_PTR(-EPROBE_DEFER);
>> +		return;
>>  
>>  	INIT_WORK(&dwc->vbus_draw_work, dwc3_vbus_draw_work);
>> -	return usb_psy;
>> +
>> +	dwc->usb_psy = power_supply_get_by_name(dwc->usb_psy_name);
>> +	if (!dwc->usb_psy) {
> 
> Is it possible for the power supply to register here?
> 

The power_supply framework introduces a ~10 ms delay [1]
before invoking notifiers after registration. So for the race described
above to occur, our probe would need to stall for more than that
duration between the initial power_supply_get_by_name() call
and notifier registration, which seems highly unlikely under normal
conditions.

That said, there is still a theoretical window where the power
supply could register in that gap. If you think it's worth being
defensive here, we could re-check power_supply_get_by_name() after
registering the notifier and handle the case accordingly.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/power/supply/power_supply_core.c?h=v7.1-rc2#n40

>> +		dwc->current_limit = UINT_MAX;
>> +		dwc->psy_nb.notifier_call = dwc3_psy_notifier;
>> +		ret = power_supply_reg_notifier(&dwc->psy_nb);
>> +		if (ret) {
>> +			dev_err(dwc->dev, "Failed to register power supply notifier: %d\n", ret);
>> +			dwc->psy_nb.notifier_call = NULL;
>> +			return;
>> +		}
>> +	}
>>  }
>>  
>>  int dwc3_core_probe(const struct dwc3_probe_data *data)
>> @@ -2232,9 +2280,9 @@ int dwc3_core_probe(const struct dwc3_probe_data *data)
>>  
>>  	dwc3_get_software_properties(dwc, &data->properties);
>>  
>> -	dwc->usb_psy = dwc3_get_usb_power_supply(dwc);
>> -	if (IS_ERR(dwc->usb_psy))
>> -		return dev_err_probe(dev, PTR_ERR(dwc->usb_psy), "couldn't get usb power supply\n");
>> +	spin_lock_init(&dwc->lock);
>> +
>> +	dwc3_get_usb_power_supply(dwc);
>>  
>>  	if (!data->ignore_clocks_and_resets) {
>>  		dwc->reset = devm_reset_control_array_get_optional_shared(dev);
>> @@ -2286,7 +2334,6 @@ int dwc3_core_probe(const struct dwc3_probe_data *data)
>>  		dwc->num_usb3_ports = 1;
>>  	}
>>  
>> -	spin_lock_init(&dwc->lock);
>>  	mutex_init(&dwc->mutex);
>>  
>>  	pm_runtime_get_noresume(dev);
>> @@ -2354,6 +2401,8 @@ int dwc3_core_probe(const struct dwc3_probe_data *data)
>>  err_assert_reset:
>>  	reset_control_assert(dwc->reset);
>>  err_put_psy:
>> +	if (dwc->psy_nb.notifier_call)
>> +		power_supply_unreg_notifier(&dwc->psy_nb);
>>  	if (dwc->usb_psy)
>>  		power_supply_put(dwc->usb_psy);
>>  
>> @@ -2410,6 +2459,11 @@ void dwc3_core_remove(struct dwc3 *dwc)
>>  
>>  	dwc3_free_event_buffers(dwc);
>>  
>> +	if (dwc->psy_nb.notifier_call) {
>> +		power_supply_unreg_notifier(&dwc->psy_nb);
>> +		dwc->psy_nb.notifier_call = NULL;
>> +	}
>> +
>>  	if (dwc->usb_psy) {
>>  		cancel_work_sync(&dwc->vbus_draw_work);
>>  		power_supply_put(dwc->usb_psy);
>> diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
>> index a35b3db1f9f3..68171629c7bf 100644
>> --- a/drivers/usb/dwc3/core.h
>> +++ b/drivers/usb/dwc3/core.h
>> @@ -1058,6 +1058,8 @@ struct dwc3_glue_ops {
>>   * @role_switch_default_mode: default operation mode of controller while
>>   *			usb role is USB_ROLE_NONE.
>>   * @usb_psy: pointer to power supply interface.
>> + * @usb_psy_name: name of the USB power supply
>> + * @psy_nb: power supply notifier block
>>   * @vbus_draw_work: Work to set the vbus drawing limit
>>   * @current_limit: How much current to draw from vbus, in milliAmperes.
>>   * @usb2_phy: pointer to USB2 PHY
>> @@ -1246,6 +1248,8 @@ struct dwc3 {
>>  	enum usb_dr_mode	role_switch_default_mode;
>>  
>>  	struct power_supply	*usb_psy;
>> +	const char		*usb_psy_name;
>> +	struct notifier_block	psy_nb;
>>  	struct work_struct	vbus_draw_work;
>>  	unsigned int		current_limit;
> 
> Would be nice to group these in a struct, but it's fine as is for now.
> 
>>  
>> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
>> index 0a688904ce8c..4717c251596d 100644
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
> So, now if vbus_draw() is called without power supply registered, the
> composite framework will just report 0mA because we don't have the power
> supply yet? 
> 

Yes, if vbus_draw() is called before the power supply is registered,
gadget->mA will not be updated since we return an error, so it may
appear as 0mA in traces (along with the error code) [1].

However, the composite framework has already determined the
appropriate current limit before calling vbus_draw(), and does not
rely on this gadget op for that decision. 

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/usb/gadget/udc/core.c?h=v7.1-rc2#n645

Thanks
Elson

