Return-Path: <linux-usb+bounces-35414-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cKzvFlYDw2lKnwQAu9opvQ
	(envelope-from <linux-usb+bounces-35414-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 24 Mar 2026 22:34:14 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B4431CE2B
	for <lists+linux-usb@lfdr.de>; Tue, 24 Mar 2026 22:34:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2510D303B924
	for <lists+linux-usb@lfdr.de>; Tue, 24 Mar 2026 21:34:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE22A35F176;
	Tue, 24 Mar 2026 21:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="NkyS8+Km"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9BCC3090D5
	for <linux-usb@vger.kernel.org>; Tue, 24 Mar 2026 21:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774388048; cv=none; b=HIQMn9jjkNTmJlThrgZt5xFS8AcbsLi+rB1SJamuXcpc/nh5QPtFGOTIf2YE15iyRISwW9vc+soDGlNyWhm2KGryfeyVOYruSjX4djWQCENSYsWTbd87jCd++dm2Q5P7uTPPHask/OaOb7WSperjDsMxwGJJpRDX+luSQI5UxUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774388048; c=relaxed/simple;
	bh=MUgBHrSd5Eaisetn5rk18NYLq0bGtPJN237wYHa4aBQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PkOj+yMJZ6Ddoa8FRKretROet0tld+K5z+R+OoC2uM+Qk1tdrX8TMGOuDQ8kcthZdn6gGrCYdiSMCdPEjyC3f6BigHYHEQXi+3dVc28gvK0zWUyYUepbINXOWCUQsqB5/nt30RyUlvZmN+WknyQYaUI0kfAyWo1NhXt8QnQIa4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=NkyS8+Km; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-7d86eb7c854so1878301a34.3
        for <linux-usb@vger.kernel.org>; Tue, 24 Mar 2026 14:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1774388046; x=1774992846; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IuvaKH6SCR9+aNoGoEjXACsCakxFP7F2n123rgDmZ5g=;
        b=NkyS8+Km4Bp6ENH29lwm7JmioAIzHruF2duTKrGnJyRFZ97DFg6MRS2W31ms78FsON
         FcmUbWgmoC/huO4VPJ8lPZxpGZ8t4LuKI9mMElGWXxcxrFhqpah2nFCso1A4eGvjOi71
         9AUBPqvH9Lpo0mBXiiK0dryHMq9G5a6n3C4iY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774388046; x=1774992846;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IuvaKH6SCR9+aNoGoEjXACsCakxFP7F2n123rgDmZ5g=;
        b=FFkaecmawhhY5IEr0rnhua/mO+6VYPhFSGjzekcJ8PalFjJbr8YzGKUKxMxly9pPnb
         KiLC25usOY1US4vrs6di3/Aw91dMbYyoFln0g6R0dX+ywgvgByE0e2+DQPOJ6wvhL+pq
         s2706MoFrbNo0kh+7pSRAp6v/YTyEexKj/OujKWzHLxMrpA8CdFBdYH7UTuWy6KXcehy
         QdQA9SvE+gbyhIPk2ZM7+POhismKdC/fvoM6RzdtMOeRGl4ecQm779MHuNy5GTOScUQE
         8FbxDF5fofXTv+7R0bM6EA4HN8s3aIZ6fFrn0VhyTZt6hfP2g1eWfuMyZCl82pGz6FQo
         eTCg==
X-Forwarded-Encrypted: i=1; AJvYcCXUspZKXqFlIwuQEbenIS1jseNEXAUAX6eGQX/gJ0p4WuHWpqjRZq+WAOVwqcigUWsIsHZFsDK/uWA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5RTaQiIQkr/Mu475tzzv4O10iPG1w9WdT9cQUl4YARy3j3rFX
	0qcP3vUWb2YZZ5MT26aXp3U0JuFKmhG8WuNn0VfUhHCk4ZSjB5hdftOeFPhX9UWYXjs=
X-Gm-Gg: ATEYQzxMyNsUFTZSdWlKPs0iWw6gKR+zXa8ehLgEQrOMZ8wG4Vg7p/qoI/tELBR5v8d
	fxTwV0GqR+RLMmXn0TskHf0ShPAPcCQtGdtXEdJ2wS8e12uu9h0YSlONY5x5INpGhwjvSvonxV9
	07UXj5gK7HAltX8qGfSZjr+c0TG1AlqCiDfZC2BD5uAmlcUNGhaenNGzIdcR0qVHzJYMpd1W7JD
	9yiL63+eX1hVMZF5OEXGXsBr423VCN/BdqulsoiRdRodGbDNSQ11auT69bFTBP81bTACxcSYTlE
	awtmXa7zecV+LN304BTLfOugAWc37/t3PIrWSkLoljReTkXkiv8CABTFFXTolnnayNvCxwzgA9T
	+XsjRXwVQNHdDPyInKg0MRVLGJ5bvnsy9v5JrJGWVxi8Q+SxrnMlRuZ1Ee8IyREO8XUj5bqcMWS
	Arb/roC9z5YZmiK24KejujDJXZ5ATLIW/zlsI=
X-Received: by 2002:a05:6820:6ac7:b0:67b:ddec:e4c1 with SMTP id 006d021491bc7-67dff5c3e0emr696531eaf.69.1774388045950;
        Tue, 24 Mar 2026 14:34:05 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.187.108])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-67c252c892dsm9157301eaf.4.2026.03.24.14.34.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 14:34:05 -0700 (PDT)
Message-ID: <4328a59a-a02b-491f-92a5-4dbd10ee77c2@linuxfoundation.org>
Date: Tue, 24 Mar 2026 15:34:03 -0600
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] usbip: vhci_sysfs: Use safer strscpy() instead of
 strcpy()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Ai Chao <aichao@kylinos.cn>, gregkh@linuxfoundation.org, b-liu@ti.com,
 johan@kernel.org, badhri@google.com, heikki.krogerus@linux.intel.com,
 valentina.manea.m@gmail.com, shuah@kernel.org, i@zenithal.me, tiwai@suse.de,
 kees@kernel.org, christophe.jaillet@wanadoo.fr,
 prashanth.k@oss.qualcomm.com, khtsai@google.com, tglx@kernel.org,
 mingo@kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20260310094434.3639602-1-aichao@kylinos.cn>
 <20260310094434.3639602-7-aichao@kylinos.cn>
 <b49bc467-8c51-41fc-a7ee-5770a9720deb@linuxfoundation.org>
 <abEYSBb8LJo9iVPL@stanley.mountain>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <abEYSBb8LJo9iVPL@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kylinos.cn,linuxfoundation.org,ti.com,kernel.org,google.com,linux.intel.com,gmail.com,zenithal.me,suse.de,wanadoo.fr,oss.qualcomm.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-35414-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[skhan@linuxfoundation.org,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 04B4431CE2B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/11/26 01:22, Dan Carpenter wrote:
> On Tue, Mar 10, 2026 at 04:10:20PM -0600, Shuah Khan wrote:
>> On 3/10/26 03:44, Ai Chao wrote:
>>> Use a safer function strscpy() instead of strcpy() for copying to
>>> arrays.
>>>
>>> Only idiomatic code replacement, and no functional changes.
>>
>> It is a functional change since it calls a new routine. Get rid
>> of this line from change log.
>>
>> How did you test this patch? I am curious because of you are
>> describing the change as "idiomatic code replacement"
>>
> 
> I liked the commit message...  To me it says that patch affect
> runtime.  It doesn' fix any bugs or introduce any bugs.  Too often
> these changes are sold as a "potential" bugfix, which means people
> haven't bothered to check whether it fixes a bug or not.
> 
> It's the right thing to add a note under the --- cut off that the
> patch hasn't been tested.  Testing isn't required for this sort
> of patch but a note is good so reviewers will know to be careful.

I would like to see some sort of testing for patches like this one.
It isn't hard to test this change.

thanks,
-- Shuah

