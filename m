Return-Path: <linux-usb+bounces-22476-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 145CEA78ED0
	for <lists+linux-usb@lfdr.de>; Wed,  2 Apr 2025 14:43:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B8C0B7A40C8
	for <lists+linux-usb@lfdr.de>; Wed,  2 Apr 2025 12:42:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 488FD237717;
	Wed,  2 Apr 2025 12:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ADL37tMO"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 175E020D4E4
	for <linux-usb@vger.kernel.org>; Wed,  2 Apr 2025 12:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743597826; cv=none; b=lgCmVJ2zl7EN1967mNb7XiMPfj4TrVlIWfLwOwl/CMB1AuaVnNT/NMYOKU8kBDqfo6mwWooekcKChA7WM5nzXrxOASM11l7YkVFlTH+Leei52LCVufTPlJEaO3udjIbvI3zemtwIgl5eqL/M1lGUvnzAdB7nh9xTaIQTMrShfe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743597826; c=relaxed/simple;
	bh=OyZmp9A9is+ap3Yg78Ukl6EmZ+O3Ym9V7nsVMl84cGE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GwTTixrA9V49digNcYK6f+vUjL9RuDbWXiALH7KxX/Ci0hbwg44tdgTlayRkoxUxyaVfNr8T6BiWk5IAeIz7P5c6+8lauuHZLzRwvFEWVcPKwgwSFA70ab5I4gMVVpnDsDOSIUv22TRqYU+iJTgL+KfZFm1yfxOeP898yv0mzLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=ADL37tMO; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-39c0e0bc733so3803556f8f.1
        for <linux-usb@vger.kernel.org>; Wed, 02 Apr 2025 05:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1743597821; x=1744202621; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NpMisOCTkgtDuhDjMXOkYiErwi46odov2Kvyglf2mJQ=;
        b=ADL37tMOwGj1rcQq0B5KVSGonxjRXRST2ozgoXvF4JwWbwWfO/Eklj9mxPuqxEsvCE
         SOYVwEu7LnUMnUbGnsd2t6UDMWttRLTVR2VoNkmLEsWA/CU7xfDe/DW/gzBUos+sukS9
         fNPkQaNiISZoABsS4RO0X8y0aTtUxEpD61TzArwY5HRUgVCKS/zMxPAsICpiRYVDHA7W
         W6rTDbfTLqQKR59/TcPVGjDZ85orn43O2smVqb5Uj0pFzLUjAXnMkeBXvaH+lthzwKF/
         c5sXzEJ5wZ35o4hPqeOYYV/66SLIfBwn/usd4h9ULtn1UR0aM6HovaPKCpPC2G9HzxSJ
         Qm/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743597821; x=1744202621;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NpMisOCTkgtDuhDjMXOkYiErwi46odov2Kvyglf2mJQ=;
        b=Wv3YInJaNwFsP0+r76IWZ4Qzgq5UUnpyEMg2LbmcchSHb0B6awN3zU+U9Vlne5GuwV
         iqorWeUHq0q8TK1OBsVeBcaMNvmFzvPP6pQCICIZD8zZy2zHUHH1KRVghVvhlRRcOYhB
         DPEgXg+auNYJmBiLknfu2en3OIaaM+ZO3KaJPPkQv2bVeRqUYLK+aWMsZa2otqOHmFNe
         yVR8BLe1FUzwGnkEF0lhTgcuxJc75m2HUF8QT3yrAKvBbj6WcqlYKIeL7vQ+Rd93Jwh7
         1/JCWMwL9tnEoWhMKRuDoNK0p75jN7Fmvxoeh9EQh6m12M6qDw4bChkUdrv/shwXDDmr
         +7HA==
X-Gm-Message-State: AOJu0YxQhsel2YjSKCCgBuNR2N8GB698LTaGUQy4I9IS06z0QmX7z497
	fRa++zUfX6tkW2JJyDrtReUpmymJAvPUrYbUdkCJSkWLXV0jlun/7ilJ6MC3tTY=
X-Gm-Gg: ASbGncvvEAJWLdmdbvv9912fCdxldvA1craTx58/33DT1eSse8IQi+0VBEdJnvpA5R3
	av5O7TZKjc/4UTANZbzFAkrhy8PC+SVKFt8WdtsfniL+ekmgAM4dLGRi7/gABxhY9yydONP1oep
	vZzZ4Wb+RZhZul8Qc9QnpTp3yB3lEuETWUM0nBJNV1CAX/LgTYvpzRYgetmNiLbox/IIRmwX7sD
	889radELB7PxBD9p0dBOk1cPuJNQmjqnen/YXqSMn+lp6R7OZd5vy66Q97NOxYeJTcuTEiv+OD6
	Qk+jGNwYk2PzKCXzNwl4QzQsVWEhHqi2mOoRyjXGnAcqV1TBDqPVieC+dXe6VgJL224LsWy/R46
	mICIdVzlcNyRSAjcLF/O7l7KtYUQ=
X-Google-Smtp-Source: AGHT+IHI+z/dMTyn6esrhOYOOmvRbEhGxG8rq92QJCh3C/nrnAw0BQI6FTuoIf5NS6Jd3dZ8clpoJg==
X-Received: by 2002:a05:6000:178b:b0:390:e1e0:1300 with SMTP id ffacd0b85a97d-39c120e3ee0mr13017241f8f.33.1743597821213;
        Wed, 02 Apr 2025 05:43:41 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:355:6b90:e24f:43ff:fee6:750f? ([2a01:e0a:355:6b90:e24f:43ff:fee6:750f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43eb5fd0d36sm19704765e9.10.2025.04.02.05.43.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Apr 2025 05:43:40 -0700 (PDT)
Message-ID: <26644fc1-98c1-4443-9809-b7e4d6cec2e3@baylibre.com>
Date: Wed, 2 Apr 2025 14:43:39 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: dwc3: ep0: prevent dwc3_request from being queued
 twice
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 Frode Isaksen <frode@meta.com>
References: <20250327141630.2085029-1-fisaksen@baylibre.com>
 <20250401234908.npkn5h3vdyefkvxr@synopsys.com>
Content-Language: en-US
From: Frode Isaksen <fisaksen@baylibre.com>
In-Reply-To: <20250401234908.npkn5h3vdyefkvxr@synopsys.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/2/25 1:49 AM, Thinh Nguyen wrote:
> On Thu, Mar 27, 2025, Frode Isaksen wrote:
>> From: Frode Isaksen <frode@meta.com>
>>
>> Prevent dwc3_request from being queued twice, by checking
>> req->status.
>> Similar to commit b2b6d601365a ("usb: dwc3: gadget: prevent
>> dwc3_request from being queued twice") for non-ep0 endpoints.
>> Crash log:
>> list_add double add: new=ffffff87ab2c7950, prev=ffffff87ab2c7950,
>>   next=ffffff87ab485b60.
>> kernel BUG at lib/list_debug.c:35!
>> Call trace:
>> __list_add_valid+0x70/0xc0
>> __dwc3_gadget_ep0_queue+0x70/0x224
>> dwc3_ep0_handle_status+0x118/0x200
>> dwc3_ep0_inspect_setup+0x144/0x32c
>> dwc3_ep0_interrupt+0xac/0x340
>> dwc3_process_event_entry+0x90/0x724
>> dwc3_process_event_buf+0x7c/0x33c
>> dwc3_thread_interrupt+0x58/0x8c
>>
>> Signed-off-by: Frode Isaksen <frode@meta.com>
>> ---
>> This bug was discovered, tested and fixed (no more crashes seen) on
>> Meta Quest 3 device. Also tested on T.I. AM62x board.
>>
>>   drivers/usb/dwc3/ep0.c    | 5 +++++
>>   drivers/usb/dwc3/gadget.c | 1 +
>>   2 files changed, 6 insertions(+)
>>
>> diff --git a/drivers/usb/dwc3/ep0.c b/drivers/usb/dwc3/ep0.c
>> index 666ac432f52d..e26c3a62d470 100644
>> --- a/drivers/usb/dwc3/ep0.c
>> +++ b/drivers/usb/dwc3/ep0.c
>> @@ -91,6 +91,11 @@ static int __dwc3_gadget_ep0_queue(struct dwc3_ep *dep,
>>   {
>>   	struct dwc3		*dwc = dep->dwc;
>>   
>> +	if (WARN(req->status < DWC3_REQUEST_STATUS_COMPLETED,
> Let's not use WARN. Perhaps dev_warn?
I copied the coding style from commit b2b6d601365a ("usb: dwc3: gadget: 
prevent

dwc3_request from being queued twice"), so maybe a follow-up patch to change from WARN to dev_warn for the two patches ?

>
>> +				"%s: request %pK already in flight\n",
>> +				dep->name, &req->request))
>> +		return -EINVAL;
>> +
>>   	req->request.actual	= 0;
>>   	req->request.status	= -EINPROGRESS;
>>   	req->epnum		= dep->number;
>> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
>> index 89a4dc8ebf94..c34446d8c54f 100644
>> --- a/drivers/usb/dwc3/gadget.c
>> +++ b/drivers/usb/dwc3/gadget.c
>> @@ -3002,6 +3002,7 @@ static int __dwc3_gadget_start(struct dwc3 *dwc)
>>   	dwc->ep0_bounced = false;
>>   	dwc->link_state = DWC3_LINK_STATE_SS_DIS;
>>   	dwc->delayed_status = false;
>> +	dwc->ep0_usb_req.status = DWC3_REQUEST_STATUS_UNKNOWN;
>>   	dwc3_ep0_out_start(dwc);
>>   
>>   	dwc3_gadget_enable_irq(dwc);
>> -- 
>> 2.48.1
>>
> I'm still not clear how this can happen. Are you testing this against
> mainline? Can you provide the dwc3 tracepoints?

I was not able to reproduce this locally. Was seen on 5.10, tested on 
6.1 and 6.6.

Thanks,

Frode

>
> Thanks,
> Thinh



