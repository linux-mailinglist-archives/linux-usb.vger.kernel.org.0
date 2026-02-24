Return-Path: <linux-usb+bounces-33630-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gPh/OZxlnWlgPQQAu9opvQ
	(envelope-from <linux-usb+bounces-33630-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 24 Feb 2026 09:47:24 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 49267183F37
	for <lists+linux-usb@lfdr.de>; Tue, 24 Feb 2026 09:47:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A028D302F386
	for <lists+linux-usb@lfdr.de>; Tue, 24 Feb 2026 08:44:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A9E6366DDA;
	Tue, 24 Feb 2026 08:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="dOwxPi81"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FA5C366DB9
	for <linux-usb@vger.kernel.org>; Tue, 24 Feb 2026 08:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771922684; cv=none; b=VuvP44qSdVEHsc6C97rub+wvobjXu+N2MBl7dBoGnHFNn9poNDbmYnfwZnJ8cIavQBLCM9qXYr7srxg4txz1ArWgIYHY/G5JFw7DCL4pUV/nt2CARzuEg629wvCu1UOXC26lGIeExdfh1yvFgSVytYHvSS1iRBeCY3tY9fV4Ikk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771922684; c=relaxed/simple;
	bh=tu9YcmLNwTVKQT2eIfNsNIbLlYMOgnogJZJRJLzooj4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rGOmSeKavutKgobyVW139tFVChNfTBNNgfCEVuo/EL/Y+xbcbmuaDvz6u8Q14gUTyAln4/v23tw1RaofMvGWdKjkSMLtxTA0jzE4M4CZ8Tq8+DvvINILTdi8gb8Xiq7rmMF7CjcM/T4E9LP7a9G+Eyt7j0Q7uXBXdEP7dw2fNEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=dOwxPi81; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-436e8758b91so3556635f8f.0
        for <linux-usb@vger.kernel.org>; Tue, 24 Feb 2026 00:44:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771922681; x=1772527481; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kdp09Xi21ZbnHaRdytbzYfK6KNPn4FYpNqsTfgvDhSY=;
        b=dOwxPi818lcz9JNd3zOOXxDo++x41O2UitSO0Ipgzz5E6Hx5YuPbOeHskxVju9wS5U
         /p1MlMvSrBd58kFG9laCSuNYIn+x/0V/oIomkt7R+jvrHCOOz0hIR+myhPmXrW30zAgF
         xe/ThbcOVI9pJOK1gx9CfRaN2XZFfR0w3xsiwmMqbJ771jMglNShREqU/SzoTNtwUoDA
         qShuN81n+fyVz24v3OkkPjOdhbtR4fyDKaz+ohNnDFo+r5jAlhDCUHCEuYcST3m8PmBQ
         YpP9kdx7XQ+074ar/u+jaLRqlNVgoeOT8CaazmrtJ9KzFECH0YBYi3TN0/+Y5rrBPzca
         6F0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771922681; x=1772527481;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kdp09Xi21ZbnHaRdytbzYfK6KNPn4FYpNqsTfgvDhSY=;
        b=W6VWaxV0ZU4ENMfhJoOE76zDM0BhHoPKjogSRPNj4JQuk/sdzGCx0WqiZqvhIoJteL
         3YO/IbGx15/F/tcBCF3J+ihZrtTauQQe382lT73XX2HtUtlNLLPcZgFCuig3ujDn7Ttk
         YYWwQaQ9kKlUL+LRUHetrKG/o9EiGvofIXl+uI3By8by4K8Qt6aexFWhY4EGhIZ7hQCI
         tLmN/3PlXOcIpH8QZcTw/d9dEC3c6uFMluqmd4gTgK2bI9vXHplVcMsJrfXNXPMH45Vs
         HEMzVifWFNW91K4WRf/2nGU3UAA69WosjV91l5HhbA//rwsMhFyQvy25k0kezu3IuE0l
         9Olg==
X-Gm-Message-State: AOJu0YydeDYAbIrZ7tk/rvFcs93UMGIOIccqyIC6FmDTvpA3CeXtbRhJ
	aiMvEelnh440N2cWhgsOEiV4DhlbfvpczWaRd8dq6aPCGzzcE8UR5SzMlPcoxb9gta4=
X-Gm-Gg: ATEYQzzDONV9EAl5qs+0WnftbmjSCP7rHWVR/mCNa7BgnwXRIlNRTWUBDRyN903+aZJ
	Ooj8SkkXngkdAUJZXptoYJbB5aWvy4ueV9bG+SD27u1taIGmCuRxXfikKYrzSX4rh9q8u//Tc6W
	bx75j4vUgeu5gs4JcTbT+KlZ1AnVB/K7H+WnxXTdE36yP6yUzO/TYgAyesIt43gmuSObYNQXuWh
	3Eh1j2vuX/pV3egiTNqyOgeUoxCU2bV2v24GF94oVhzW0KvaU+B4T9ZjQOgoecPL8TY6T9oJ3L/
	Pa0rcuEb7f2dV6CR3VMypEY9Kwu7ECJ7ze3NHo+N86uBv84ZAHN+R837XGac7Q+q0GFuQs+h8oD
	2d1FyvbFvaLI5qGwv9Uiul6fulPP3LXqmTYBjq2eRmJctvwAiR8VZBKM2mXhF0AFDMU/O6cARh8
	YfF0UxA61uUh2BImuR4/dI1aXg3+fLXm3z7GqhS/OX62OwQMmrkXu1jNlRuy44qag0sxY=
X-Received: by 2002:a05:6000:2c0e:b0:437:6e55:a736 with SMTP id ffacd0b85a97d-4396f153a10mr20680786f8f.7.1771922681491;
        Tue, 24 Feb 2026 00:44:41 -0800 (PST)
Received: from ?IPV6:2001:a61:130a:c601:11aa:e71a:5113:31ca? ([2001:a61:130a:c601:11aa:e71a:5113:31ca])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d4c626sm27936578f8f.28.2026.02.24.00.44.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Feb 2026 00:44:41 -0800 (PST)
Message-ID: <a38ccefc-6233-4be4-bbae-0ae0d4f4499b@suse.com>
Date: Tue, 24 Feb 2026 09:44:35 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Stack buffer overflow (write) in kvaser_usb_leaf_wait_cmd via
 malicious USB
To: Greg KH <gregkh@linuxfoundation.org>, Nicholas Carlini <npc@anthropic.com>
Cc: linux-usb@vger.kernel.org
References: <CAOt5ifARcQqqGc65hHXR2JNTDg0hT0cF55Kb-6USEsqjEPM1nA@mail.gmail.com>
 <2026021847-acclaim-coil-fe7a@gregkh>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <2026021847-acclaim-coil-fe7a@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33630-lists,linux-usb=lfdr.de];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oneukum@suse.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 49267183F37
X-Rspamd-Action: no action



On 18.02.26 06:12, Greg KH wrote:

> And is this the only place in this driver where it treats data in an
> untrusted way?  As you know, once a driver is bound to a device, we
> trust the hardware to work properly, so this really is just a "let's be
> careful" type of fix, not any real bug to be handled as a real device
> will not trigger this.

Do we know this? I am afraid we need to make up our minds.
We are including patches that verify endpoints are present,
are of the correct type and so on.

What is the logic behind that? If we can trust that a device
is what it claims to be and operates like it is supposed to
be, why do we verify?

	Regards
		Oliver


