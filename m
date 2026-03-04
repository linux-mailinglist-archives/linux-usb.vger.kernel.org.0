Return-Path: <linux-usb+bounces-33994-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4M5mMLluqGkkugAAu9opvQ
	(envelope-from <linux-usb+bounces-33994-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 04 Mar 2026 18:41:13 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 35FF82054B5
	for <lists+linux-usb@lfdr.de>; Wed, 04 Mar 2026 18:41:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EC3E930A786E
	for <lists+linux-usb@lfdr.de>; Wed,  4 Mar 2026 17:35:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C86BB3C6A59;
	Wed,  4 Mar 2026 17:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bdK/V5fe"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F78A3C6A27
	for <linux-usb@vger.kernel.org>; Wed,  4 Mar 2026 17:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772645745; cv=none; b=cczAZpkan3OLpbH6MEOo9Y4o8M/40GPyJLWNIQTKJRgi6LytjbqAqiCFRKGg42N/3JD47hv5vr8z1msfLTriJVkLRqi2wacRjRCrtp8lw975J6iXjx7X0jpjpdTzXNOZGv1o+k49/Hg7qAWPmHtQwu1pKXEvZXDkZPWCpe8YF/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772645745; c=relaxed/simple;
	bh=VlEH3lAnxtUSxpMHwf0dxl3KstRwnQssP0ryb48SfxM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=puWE+pFzVolEhOTJ2s2jZwZDzLfP4bjOIYfuOvl1jufJn+5+SDkUBxoLMUEW0Ws7kraS1tz1fUfMlp8oodUgGyO79vI5MCj1smcKsNT5hU+w03cK+HgNwa4Rwf9MI8PLvIph6xwiTFDTz+eBMf4uENgaLHaZT3YjhnDzqp7CI3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bdK/V5fe; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-827546f228aso5059784b3a.0
        for <linux-usb@vger.kernel.org>; Wed, 04 Mar 2026 09:35:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772645744; x=1773250544; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=92zh51YpPKp93KuezxDm90TJZ2/tmL+TqtOQmshr6EU=;
        b=bdK/V5fe1529VnHbFxFywbfK/gC87aH3xuKD9Ibo/OEXooF7r0Dj8FwGYHBGBUkaaj
         cNj0KYGeM3OsHLSm9Ee2Xtle5AErD778BjI5mcX5TlWQMyE18yoRrLrIDvc8qc8eZ9kA
         IGKlCy4brZ3CvoyJnr8p+7nSJJad1+8wYoj+I9kCU2vG/Wpszy7x8sZT36VHB9n27s36
         l4fMasFUIjnhq65jPMYL4eXRFWc7MB5i6s8ZiNf3Mb4sCPJakbqllW1oDhSfCy7NsRUx
         ZODBPZAgDkbwiWoE9XTLGoFGjp7eFmd7e4bcAPjN1ua3/L/85RWC5eDcobrnCAuw2c2h
         k3lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772645744; x=1773250544;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=92zh51YpPKp93KuezxDm90TJZ2/tmL+TqtOQmshr6EU=;
        b=WtWnlxs960ctqIxn4LVMbnOGlfc6NdmWMIVntUFFbsCB2bo9yKQR6qOIrCRWQE/0II
         A81hSV6fpyYZg18FYehsMEiTRtxVSo0tjdPqf9HTsdDh/s18wMbhAZQ3vLOwMXerQx1k
         vJBS6tFNGoNEb9clj+fhvWysqr4gmaCRWjk2IDIIcAStPYnFWFTHH/yB8DiCHpZW6zF0
         AxwlddAFqv6D8TeXqIQX3KBCqLDwAipWTPGjXUPLpNj0sLsD9RkyR1E+khGLcB7566H4
         E8yUU9MxN8ALBR/JaBfxiwctotgz2a9Je16IBS3ODTyb+3jT9FUNcZrc0xjKhA9ZNRfs
         MzQw==
X-Gm-Message-State: AOJu0Yw6FLTZPwoB1H6mSVBRq/gdb5o/93/TVt0EKweDfqHdh+ctXeE5
	6t4MVXhZebiSZ4uF8/TIHArcvraJ7xf4bkWW8QBmGSJ3UrnlKl+jG0DWGM0CtA==
X-Gm-Gg: ATEYQzwksrLH48cOtCH7beObWi7/KnJSDIpXKYqHnNfvoWm/F2jJCly9pZad9x8Xghh
	Z0OW9uUvKUzMxpayHpiDJpHiNjtI1D6ciKa/H9T3/lGSNCv13f3Pb66uPLty+Ml/tg2nm9QkJvy
	sobYEqF0j6rpWTKnB95Ix22LyxfC+zykB/dYx2oorzf9xuF47v5VZZ8riS0wfBjqD3Hye9JHF2D
	wfdNq5PREQ9RoXIVwmurBRO2qE7ngeDhNLF6zOYEUeN/sk5bvdN5HmdBme1QUvo12N6mUdrWqQR
	Zedj/jJkCf8xWwdCMJJGbV5MmyeeMPS13PEJ05njwPZFMcKYMboT/BHXJJMKoaKA7pPIWAhlo3T
	d0u0tXs+aYDGZ8wptn3F5C0b//v7Myn0uY1V9Ng0ffSWZk6sa4WlPgziaXBDaSTJOEKgf8axTtt
	5LvWsyU9SaSMvLG7fS4TQq8z4mW2BXgpXe3sn16EYavLbxsBfnTNfq1LGXDSXZ5ptDniaBBsu8L
	Nd9sZIEGlWqeSJQsRiL1M6eLQ117g==
X-Received: by 2002:a05:6a20:4327:b0:394:8455:d1a8 with SMTP id adf61e73a8af0-3982ddb7520mr2712238637.13.1772645743652;
        Wed, 04 Mar 2026 09:35:43 -0800 (PST)
Received: from [192.168.1.109] (c-73-37-64-97.hsd1.or.comcast.net. [73.37.64.97])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c70fa8059bcsm17463809a12.18.2026.03.04.09.35.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2026 09:35:43 -0800 (PST)
Message-ID: <e8e05846-1af7-4cdf-8167-e566cf7db8c8@gmail.com>
Date: Wed, 4 Mar 2026 09:35:42 -0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] usb: core: remove unnecessary goto in
 usb_create_newid_files()
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260304155812.4559-1-marusik.adamenko@gmail.com>
 <2026030412-trace-sneer-60bf@gregkh>
Content-Language: en-US
From: Mark Adamenko <marusik.adamenko@gmail.com>
In-Reply-To: <2026030412-trace-sneer-60bf@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 35FF82054B5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-33994-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marusikadamenko@gmail.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

Thanks for responding,
I wasn't suggested by any tool. I was advised that if I want to become a 
contributor, I should start by finding something small, so I came across 
this file and found the goto. I understand it's not a big change, but 
the kernel style guide says:
"The goto statement comes in handy when a function exits from multiple 
locations and some common work such as cleanup has to be done. If there 
is no cleanup needed then just return directly."
The original function only exits at the exit case and at the end of the 
function, without extra cleanup.

On 3/4/26 08:11, Greg KH wrote:
> On Wed, Mar 04, 2026 at 07:58:12AM -0800, Mark Adamenko wrote:
>> The goto to 'exit' only returns the already initialized variable
>> 'error', which would be 0. At that point it could not yet be anything
>> else. Replacing with an early return 0 removes the
>> need for the label entirely.
> 
> Odd text wrapping :(
> 
>>
>> Signed-off-by: Mark Adamenko <marusik.adamenko@gmail.com>
>> ---
>> v3: fix missing return statement at end of function
>> ---
> 
> You forgot the other versions listed here :(
> 
>>   drivers/usb/core/driver.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> But first, why?  There's no real need for this change, why make it at
> all?  It follows the "standard" way of jumping to the end of the
> function to exit.  What tool asked you to make this change?
> 
> thanks,
> 
> greg k-h


