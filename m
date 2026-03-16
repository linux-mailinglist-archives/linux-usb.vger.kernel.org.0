Return-Path: <linux-usb+bounces-34865-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AFO3Nr3+t2nrXwEAu9opvQ
	(envelope-from <linux-usb+bounces-34865-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2026 13:59:41 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A19DB299C1B
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2026 13:59:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0E739301BDF7
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2026 12:59:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD6FE396D08;
	Mon, 16 Mar 2026 12:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="JOag7HoI"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E919F396D09
	for <linux-usb@vger.kernel.org>; Mon, 16 Mar 2026 12:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773665924; cv=none; b=ptwjaanqKE0a/IR3iXwVw3JymnHEcLZBm5FCVqWHl19TktVCcFfSuErrag5rVV/0wkKOEGFeL8kG8dYw8A+l5n5wrwwrC5r3iUdsnOfYRneojTPIYspZbwvz4GoTDB3dYAYXo7z48iCBLVM0r9rqBRFKd597HoP9vgpHD0+yvtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773665924; c=relaxed/simple;
	bh=f7PWyraqssU1tuUwrPf2OWpxO9ygGY4z3JlXHd7aaRA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nujmTp/yjfTTF2SEcQxS1Ew9TV6e850NB8Se9Wnb02QQFN0OVcPnT48Dz2g+RQaUTfnfSRb6GMpE3G3yQGIzalnZTgnwnpxYUSf5sjAS5COxxWM7vcJHn0mpd+w3BJah7PIooyy5VsFm58NCb9KPKAAoaY+uO8eLJGhW3qZroTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=JOag7HoI; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-439b9cf8cb5so5162061f8f.0
        for <linux-usb@vger.kernel.org>; Mon, 16 Mar 2026 05:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773665921; x=1774270721; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z5jo4XNP028DamwxNx0TX6Sr3e+NiWsyN6WEIbEqo9g=;
        b=JOag7HoIAGc6hWHO000HypSHDwmFJGuE8RPP8Z9hStxZt3AcjSUMlnXkanWf6Ty0Qg
         wY9UXlDTiougI9GyQSFapWTOeMjppRpRVG6zXx0QSyJMycLgmZonONw2RlFpava/FLzZ
         78IFHo/MkFcO3f1iqsppgl3MY7i+AQ4ncLClbdgfu3gJr9e/0QHnqnhCU9244St5F9RY
         SjZ0My0CxX+0S3YYF3spnpcPddftVuPWmT1EwQlZ4xueJvuOosXmWXGh1mMh04HC7ndC
         46vA2pVQYHKs0GWAfMaWKAQsnJdJttvTigmtDAO9goJclXf5OV/68OCg4Asf1t5FZy7P
         F3pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773665921; x=1774270721;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z5jo4XNP028DamwxNx0TX6Sr3e+NiWsyN6WEIbEqo9g=;
        b=A03mrJilyWYbgF+Gd1NfLEZh10oExgThXAMwfghZTFjT47hQPzFsRe5jBeChVHaPCw
         jf8WaimJJz+uXQIMh2x03j0QzwF1u4YvMEOiUL0AzZhOyw3OS2wEVqUotaZKPdzhD+hg
         SkFNt09f9Fq8HMRFfmwSvodTLA9I2NEwgUooekJMYXWxEZz8sQikxiOKVJdhmmfRwDDD
         +TZfSNXbohWHtoTeZp8xBygMyTvVLYqJIpb+GyUy7z6GApQ3eShnCWYPbjvkvt/nt2Qn
         OWFzKyIBaSg9xg8nkOATus0aO4n0gH6yb21ba1eYHLx8KU8krpX7CzEZBXPnbG5FZBf0
         66WA==
X-Forwarded-Encrypted: i=1; AJvYcCWNSnvmWUrFo5ib+oaRa5t2lqYPgOW4vFDG+SlBFimkpsiBYUUbwLTuRpwUQ+XBMKjTulcEpPxjeqo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZ7ZrH2kzGxNTLEkGe57a+jKC46vjNz6UBlmwfbeUn6/EiqEl5
	oOfRJ2RYdl4zETccxktOhBslKdCnixLMTz3ItslsyET7iTrZRgoz66rLBXsdZyhf6pE=
X-Gm-Gg: ATEYQzyXUnsg4vj7JLhneAly0zxVbb6Is4OEFNjgMq0Z1JE4PdYRIM2KITIwCiM6+3X
	gdImaNtaRz/KmxiAQztFg5yS8ZEO8wJJbi3k07g0GPe/5iI+6zkxbfcJlu79eCu2zDYjMeyI92u
	0LPLKEcilP5A5ZtnI42OBXQnXFK40QNsn9ff40AJr/XCVHWF+5aIlWeu5Z43MLAwwc6xAoNg3Hv
	e2WTVsgzP3Hr3KP2C22/enaz1bNBe1ft28oFEUKnRwRlBsVaJOD3cphahj3lxkwV8ud7XsYu7f+
	/SUKJUln6WRIMuJPTRiErZu8a+sYu/bMQ2CBu/sVNw1KTAOGzlDlW4Q9pBKuhYGeH4JwC6H0dKf
	TvqUGlkDag/NvliHUaO5sHqQQq1gmixmgbWJYVu8kZUYcVocpujRgYq70oDDQsLfiNOQq/tKash
	dwbnyJQSjYoBU1EOh/4wbbwutWhgrLEKwDW4KmbzzNwJAzDpsOq3SviPvIhT0Vv2r3WhY=
X-Received: by 2002:a05:6000:3101:b0:439:d7db:c526 with SMTP id ffacd0b85a97d-43a04db65a2mr24435506f8f.29.1773665921023;
        Mon, 16 Mar 2026 05:58:41 -0700 (PDT)
Received: from ?IPV6:2001:a61:13e0:df01:26dd:3109:a42a:ea05? ([2001:a61:13e0:df01:26dd:3109:a42a:ea05])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b46b41e93sm4298695f8f.2.2026.03.16.05.58.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 05:58:40 -0700 (PDT)
Message-ID: <3028610a-f05a-4bc8-9037-cca152e46c52@suse.com>
Date: Mon, 16 Mar 2026 13:58:34 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: correctly handling EPROTO
To: Alan Stern <stern@rowland.harvard.edu>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Michal Pecio <michal.pecio@gmail.com>, =?UTF-8?Q?Bj=C3=B8rn_Mork?=
 <bjorn@mork.no>, USB list <linux-usb@vger.kernel.org>
References: <261996a8-7ad4-4df2-a469-f6602da71255@suse.com>
 <4f85311c-bdfe-46a4-a310-4a74a3c56b3e@rowland.harvard.edu>
 <64dc9c5d-d662-41e3-898f-71587b940a2c@suse.com>
 <20260313085354.71a6dbf1.michal.pecio@gmail.com>
 <12567c7d-0a17-46a0-8acf-3158c2d9011a@suse.com>
 <9da0ac4f-12bf-4270-af6f-e08b5a89611b@rowland.harvard.edu>
 <20260313224528.dp6utjqzbdguwlbf@synopsys.com>
 <a6934c14-aeb5-40d0-865c-14199943e2a2@rowland.harvard.edu>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <a6934c14-aeb5-40d0-865c-14199943e2a2@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,mork.no,vger.kernel.org];
	TO_DN_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	TAGGED_FROM(0.00)[bounces-34865-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oneukum@suse.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Queue-Id: A19DB299C1B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 14.03.26 03:39, Alan Stern wrote:
> On Fri, Mar 13, 2026 at 10:45:32PM +0000, Thinh Nguyen wrote:
>> On Fri, Mar 13, 2026, Alan Stern wrote:

> Part of what we are discussing is how to carry out a retry.  It seems
> that the most general approach is to unlink all pending URBs for the
> endpoint, wait for them to complete, call usb_clear_halt(), and then
> resubmit everything.

Yes. That raises the question how much can be centralized.
  
> And of course, isochronous transfers are never retried, by definition.

Do we still need to clear a halt?

>>> I tend to group transaction-level errors like EPROTO into three
>>> categories:
>>>
>>> 	1. Device has been unplugged, hub will notify us soon;
>>>
>>> 	2. Unrecoverable device problem, needs reset or power cycle;
>>>
>>> 	3. Short term problem (cable issue, EMI, system load).
>>>
>>> Retrying makes sense for 3 but not for 1 or 2.  Unfortunately we can't
>>> tell which category a particular fault lies in.
>>
>> There's no need to distinquish them if we have a proper fallback
>> recovery (such as reset/power cycle) should retry failed as noted above.
> 
> Yes.  Still, that's a fair amount of logic to add into every device
> driver.  We should be able to centralize it somehow.

That would suggest implementing an equivalent of usb_queue_reset_device()
for clearing halts.

> Also, just to make things more difficult, these errors are reported in
> atomic context but the recovery procedure has to happen in process
> context.  Which means there has to be a way to cancel the recovery
> procedure if it's in progress when the driver is unbound.

Well, no. Not exactly. If it is necessary to clear a halt before
you can communicate with the device again, we cannot reprobe
the device before the error is handled. It wouldn't work.
We need to wait for error handling to complete if the driver
is unbound.

	Regards
		Oliver


