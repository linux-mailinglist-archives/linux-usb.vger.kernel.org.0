Return-Path: <linux-usb+bounces-34880-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KDO6JtUZuGn/YwEAu9opvQ
	(envelope-from <linux-usb+bounces-34880-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2026 15:55:17 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0217B29BCEB
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2026 15:55:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4308D31D32D8
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2026 14:48:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C101D2F2619;
	Mon, 16 Mar 2026 14:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="AdTbBm03"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1871A2F39CE
	for <linux-usb@vger.kernel.org>; Mon, 16 Mar 2026 14:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773672486; cv=none; b=SRpFhKAHs7lZ9xg3AeOppmq6cRISu9prdtmKsEYRdlyH66PWOoKxMsvFLte/QKF3G3G1GqnMhfv5UUtfro2tWYxRLv7w2H9jlCLb78yNW4rD1nha/+bgR7k+hUxABOZ+4Nxvl8Qa7cY4ZNxrU0cG2Mfh1q5zXAAi8hUlzx28qAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773672486; c=relaxed/simple;
	bh=OcFT3/xzORIHr5TEQ9b5cDh1yVeYG9HqI5MFGOobihI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NuViOWFiqzk6UVTNKE6Erf89POYmaSuePaT6OR2EfZd9rsfqg3aZFHJ1NtrOzHEm4VrrA1d1pxy3d9BPCUs3XVskrEL8h90bcxE2a8y9PZrUnwZ4Q7akthKJ4UPEvhgFzNSA3fBv3g7n6iXXd7nbR+vypIiV8SlNulvDawYcXEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=AdTbBm03; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4852ff06541so52639335e9.2
        for <linux-usb@vger.kernel.org>; Mon, 16 Mar 2026 07:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773672481; x=1774277281; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/bNmIsvyHlm1yp1szBbeLPaTVJl1bPY1004NKAtQJzk=;
        b=AdTbBm03HGetvFLqrqemHWxISMAGDZ8HtOGuGb8p+PPs31ZUoO2PmvmRqvCmBCSax7
         AsvIc94cfUfPGqzoRH/ZytfLz0T2tgHq7QNR57b8REpS1kh4ZBA6NoglFFU8B0luMv4x
         w1HfF3gY7FbueNVO36PlZ7roa87mB//Tj5dxNVRYCEsRhCbq24/JjO9BjUHwd2HOTh0r
         8XcPm5pqLZiufCWRLuYX20dbU/CSSWBEesG/jUJqOIOnzaCRjhQKtVYGgyVEXw7JHUdG
         PUl6mNLQViq123QXQkWbFpKWg+/EKmN5i6P+IjbrWkPOJ6++TMEESp4zxwTXdMgLDeHH
         vVvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773672481; x=1774277281;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/bNmIsvyHlm1yp1szBbeLPaTVJl1bPY1004NKAtQJzk=;
        b=CD6+Cyx3eGh5o/FVFER+qUEiM9JXJVuRVDkQ3IVm5XEoOY6bfsi+eyoWSOVkY3v081
         L1+JBJuvkWI+48RhcLQdJ2vV1XUGCm1nwkqoOAOD6RXh6DhBy8nZm+5W/TAXXvkyV6vg
         yzV/ZQpBcCyw55SQ7S8mmJLqPQ6Ia7Jfjo3xh2xKWs7BfKkKJM04MqoSozXIb9tBrbBq
         NwflE3TlUN5uH6uYkDYeZ08ZSkUJGKAzKploOj6dF1GnUdsziFVElaZGR72W95pOAJU0
         GEjS/fPeJH1ere0NJkxgeGsumyMVVg9pkRuDtNEa32m3qfg+y61N1+JgBL+Ill1JYIPm
         XaHQ==
X-Forwarded-Encrypted: i=1; AJvYcCXOD5dlIxGwtvlTuQG5KCox7oZJHnHvUG9dSbPTGMz+1cjmVgMPk5CbDoAO+pLMAZbkLqn9kJO9oX0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHbO8iwWlUIlpU52ynGsjSsA8ImfojKn8SKFze8vVKPzgW0Ro7
	RSHwZBUVigdGRx1wfRjWKw+9lPRpillExz0RriZvnaOx/MNrsx7OuJHx6LCqb9b9agQ=
X-Gm-Gg: ATEYQzx9+17ZFsHDdqLEuSSI3EpgD7iSCB4pujgMQjvB03pkKiyy79E7j91RhkNHM0C
	A8s+n0Q1EWqFV6kmlNrflztg28+avS9JlmKhP8e8PCaH5WFFlMpw2mwLCCL0I7k/rlKy6+QQjQa
	Jj3fy73PTLvckSRHHTnyP1haOBP56mWux7wtc+SSALT/a/qPLdckRguFIWLqRq3jVRUKIERKQZ5
	/5Qi5sVZj9qV0rMldvIFI4THAGi2Ed1AQDADS87m8u3n5xIi5Q1UO3EmDy5VpN0AM+7o9NSdFQf
	qUkcxROKpWbaETglBqg2cPm0MM8EOkbxoO3cim3f8qFxeFDK/4JphnLctW4Ith2khJItMkJg/Sn
	oGjlt778Vd0go4Bf415IthAlnSIQr9RcCVF6v3Si10tsOjEFmg5NEUyjgzoX+6yghL/q7qsVedL
	lbtOoq14abFGRKRpZrSrNbcqMLC8bhISHylBKH5VWvuwmRgrdkurFqj3vqN+WZ5w2O9POs7xNzv
	8rVOg==
X-Received: by 2002:a05:600c:34c4:b0:485:3b9e:caa7 with SMTP id 5b1f17b1804b1-4855670e6d0mr194265105e9.23.1773672481023;
        Mon, 16 Mar 2026 07:48:01 -0700 (PDT)
Received: from ?IPV6:2001:a61:13e0:df01:26dd:3109:a42a:ea05? ([2001:a61:13e0:df01:26dd:3109:a42a:ea05])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b66dedfsm440101205e9.12.2026.03.16.07.48.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 07:48:00 -0700 (PDT)
Message-ID: <0b45d0e4-53f8-4960-b41c-63639b496dac@suse.com>
Date: Mon, 16 Mar 2026 15:47:49 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: correctly handling EPROTO
To: Alan Stern <stern@rowland.harvard.edu>, Oliver Neukum <oneukum@suse.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Michal Pecio <michal.pecio@gmail.com>, =?UTF-8?Q?Bj=C3=B8rn_Mork?=
 <bjorn@mork.no>, USB list <linux-usb@vger.kernel.org>
References: <261996a8-7ad4-4df2-a469-f6602da71255@suse.com>
 <4f85311c-bdfe-46a4-a310-4a74a3c56b3e@rowland.harvard.edu>
 <64dc9c5d-d662-41e3-898f-71587b940a2c@suse.com>
 <20260313085354.71a6dbf1.michal.pecio@gmail.com>
 <12567c7d-0a17-46a0-8acf-3158c2d9011a@suse.com>
 <9da0ac4f-12bf-4270-af6f-e08b5a89611b@rowland.harvard.edu>
 <20260313224528.dp6utjqzbdguwlbf@synopsys.com>
 <a6934c14-aeb5-40d0-865c-14199943e2a2@rowland.harvard.edu>
 <3028610a-f05a-4bc8-9037-cca152e46c52@suse.com>
 <437037d6-3fe1-4f81-b74a-21bea00725e0@rowland.harvard.edu>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <437037d6-3fe1-4f81-b74a-21bea00725e0@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[synopsys.com,gmail.com,mork.no,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	TAGGED_FROM(0.00)[bounces-34880-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oneukum@suse.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0217B29BCEB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 16.03.26 15:02, Alan Stern wrote:
> On Mon, Mar 16, 2026 at 01:58:34PM +0100, Oliver Neukum wrote:
>> On 14.03.26 03:39, Alan Stern wrote:

>> Yes. That raises the question how much can be centralized.
>>> And of course, isochronous transfers are never retried, by definition.
>>
>> Do we still need to clear a halt?
> 
> Isochronous endpoints do not halt, and isochronous transfers are never
> retried.  And although the spec doesn't seem to say this explicitly, I
> believe isochronous endpoints do not pay any attention to the HALT
> feature setting (which can be changed by a Set-Feature or Clear-Feature
> request).

That then raises the question how we resync.
  
>> That would suggest implementing an equivalent of usb_queue_reset_device()
>> for clearing halts.
> 
> My thought exactly.

Good. It would need to take a callback as an argument and in principle
you could have this for multiple endpoints. Any ideas for the API?
  
>>> Also, just to make things more difficult, these errors are reported in
>>> atomic context but the recovery procedure has to happen in process
>>> context.  Which means there has to be a way to cancel the recovery
>>> procedure if it's in progress when the driver is unbound.
>>
>> Well, no. Not exactly. If it is necessary to clear a halt before
>> you can communicate with the device again, we cannot reprobe
>> the device before the error is handled. It wouldn't work.
>> We need to wait for error handling to complete if the driver
>> is unbound.
> 
> Good point.  So not quite the same behavior as usb_queue_reset_device().

Actually you make me wonder whether the semantics for
usb_queue_reset_device() is good.

	Regards
		Oliver


