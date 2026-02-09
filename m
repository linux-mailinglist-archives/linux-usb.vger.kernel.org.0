Return-Path: <linux-usb+bounces-33187-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4D1HE3yyiWndAgUAu9opvQ
	(envelope-from <linux-usb+bounces-33187-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 09 Feb 2026 11:10:04 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CBBF510E012
	for <lists+linux-usb@lfdr.de>; Mon, 09 Feb 2026 11:10:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6A3983033A97
	for <lists+linux-usb@lfdr.de>; Mon,  9 Feb 2026 10:06:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F973366056;
	Mon,  9 Feb 2026 10:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="IcuAGmbD"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80C0F3644AB
	for <linux-usb@vger.kernel.org>; Mon,  9 Feb 2026 10:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770631567; cv=none; b=ai44DvUsTG27Q5bGA9/BYR0SEx/Msb0yymryfHNSnggaebZpt0wDYAFHzThsK2+unQUPtawOvauuED0q6/M+VGu7cz92q75QGIO+wNE33FG1NdxQ1K6A4ds8E7WynbFBVNvvT+rUW2lBLtqkSo3mYZTz4QTBzLS0CPxAHOchudw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770631567; c=relaxed/simple;
	bh=ktBNYdWzXN/A1xozDS+kqmFY3+NPo2micQEXYdF9S7Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ERIiWAgESLtozp83nk4yeCGlvsh0Ogrznjz4LnP0yHx4IIr2o8AGlPIQf8A97NvnBY6fliwy25J+hXgVDC9ziF+OA/FGKHMqnDXtUmpawf0Okts/wT5OmOvqtHhpvtkx38lJ2i4t8d0Q8K3YfMUXwU1Zh7ZOKVfTXUdI+qA1K6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=IcuAGmbD; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4359249bbacso2911154f8f.0
        for <linux-usb@vger.kernel.org>; Mon, 09 Feb 2026 02:06:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770631565; x=1771236365; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B0dLY4trYV5gv/wnMZ8s2klnMyNr2VH+hAlexQTTgvs=;
        b=IcuAGmbDN/gBC52KKRldzTIESjgxjAP7na8w2ce9YVT84Ofj/GVC0y9z3BDD/RoMmA
         HypthDf0qmnlhSY9KeekcgSvjSwYxYGA/Z1qbCjfWtPw8vcrdsZy0v00et7VnjE7QkTC
         EbKz/S76n/j2QuvNKG/oIqt+iQb/9KaL0pHmpKTG5bG0ChMdN6Sn4Fq22YErCAA+iNh1
         Key9yhG/uWiVNIZvdQarggp7u+wTfK+Uc12jx93IzN+QUUom4UWGuTqRqVBZekpB4Oox
         mJoLsvhXq9ZNQLjYWSq0h8rTgulZxuH2GLgZGEKgpImlBpS0jMUdGp+feckZlI/279y8
         0SYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770631565; x=1771236365;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B0dLY4trYV5gv/wnMZ8s2klnMyNr2VH+hAlexQTTgvs=;
        b=W6uZ7VriDYdKq/jt2vKzsFR4NHlZSWV7Db2YGnUdTl0Z2PFvl+gkAKhRvmMH+KIGOn
         U+NcSj8ZEJwmW0Cq546lZzao437r1mG5WRqVtWedl6jQC92djHg7ZDSYvT6QfhWDUv+5
         /TMiVHwN3mC4vCx0VqVqmRCvt7z2/3GORszINQqmqLoxvILCUNmtC1W6+w+BC8+rF+NA
         1l3QBQk4kR+x/KPAA8rvhcd0e+vUWvu9VyEGNMAEpKBywjhDCIz3gsydBs3RFUdMrO6Y
         6hvV+HbFZQ79/UUOdYp5wS/AcS24n5D3ycSs3CJeBgZEV8lS8Sr3EIzzFRlFyrAe6qDc
         992g==
X-Forwarded-Encrypted: i=1; AJvYcCWukC5vwdeiP0ZzJHq6ogRrv+zPQaA0WS1Kze378o5pOSYcWjAqATIthG6BYWibSnE3N+ERFmr2aG8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6Gliej4aIuTJi65mtg4Iy0cP7dW8zlIpIfCdXYdVNGBzJaSmR
	ZxDdze5Q0xjnLUrcMhF5dCHz2wODjvlgWiYL0DDVD4azOCeSUTJdceZvz+KWg/ihMIM=
X-Gm-Gg: AZuq6aKiiUD2rH/nkFZdJVvPjBkcJLJNxAfnytqOgD46d0xpxPUPQmRXDlBObLJIXyF
	y7tCbQvMp7bRU6s9+qrNkJsqmhWM1B7zPNV+UL2BRSiq81GVQBELvtq1Pmv6XrTGQ9+7zkXYPv4
	RtnEBpZK2B9+q2iy/R+nGByJx4hu/XzO3E5glL5FYsoWsNxGttKQAPHyUx9S+MQKYRGo0PmU7TX
	RM1PYcTJuoneEb4FRAxPBD0IrnfdnaB19gR/3HvLfnA+6l1yxy+WKIqwV/F8ZRGQdz4puxzm8+A
	5lrHzyck1Og8psfiISJuu2Debb9BfiYv0Vw4TOP2cRfFpLTE+62KCEImnYX8KwgVcrhhL5J0nSL
	ZmKl95zV5uu2Hf+LTMhQFNsFRlAQ6xOev9+VYbpb+ksI0Ao+nzy+uVxZjMHpka6eXgRMvlGBv+7
	FxEFxEOawkHpjvvlSI6OOtzleD52maZA9BJytgPc7PSzkiPiM969Vw
X-Received: by 2002:a05:600c:5884:b0:47e:e97e:11aa with SMTP id 5b1f17b1804b1-483178e11bcmr154203285e9.4.1770631564829;
        Mon, 09 Feb 2026 02:06:04 -0800 (PST)
Received: from ?IPV6:2001:a61:1376:df01:e943:d12:a8fb:e1d7? ([2001:a61:1376:df01:e943:d12:a8fb:e1d7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4832096f127sm118531335e9.6.2026.02.09.02.06.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Feb 2026 02:06:04 -0800 (PST)
Message-ID: <a31763aa-77af-4e13-8708-b007ed53277c@suse.com>
Date: Mon, 9 Feb 2026 11:06:03 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usbhid: tolerate intermittent errors
To: Liam Mitchell <mitchell.liam@gmail.com>, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>
Cc: Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260208-usbhid-eproto-v1-1-5872c10d90bb@gmail.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20260208-usbhid-eproto-v1-1-5872c10d90bb@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[suse.com:+];
	TAGGED_FROM(0.00)[bounces-33187-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oneukum@suse.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,suse.com:mid,suse.com:dkim]
X-Rspamd-Queue-Id: CBBF510E012
X-Rspamd-Action: no action

On 08.02.26 18:10, Liam Mitchell wrote:
> Modifies the usbhid error handling logic to better handle intermittent
> errors like EPROTO, which should only need resubmission of URBs and not
> full device reset.
> 
> Reduces initial retry delay from 13ms to 1ms. The faster the URB is
> resubmitted, the lower the chance that user events will be missed.

Hi,

in this case I have to ask the obvious question: Why wait at all?
It would seem to me that if you have spurious or intermittent errors
the right time to retry is immediately.

	Regards
		Oliver


