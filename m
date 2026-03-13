Return-Path: <linux-usb+bounces-34735-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6L2kHgXps2nZcwAAu9opvQ
	(envelope-from <linux-usb+bounces-34735-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 13 Mar 2026 11:37:57 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0280D2818FE
	for <lists+linux-usb@lfdr.de>; Fri, 13 Mar 2026 11:37:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F01E1308A245
	for <lists+linux-usb@lfdr.de>; Fri, 13 Mar 2026 10:33:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E2E736EAB6;
	Fri, 13 Mar 2026 10:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="A5NjAehA"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57DE8358386
	for <linux-usb@vger.kernel.org>; Fri, 13 Mar 2026 10:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773398035; cv=none; b=gv2clehfTP/Hzn/FBXezVDEd6jjevs/ym2e/GQtdSLQnLAzLhHKNcJY2M9txrnXSav5YIEPZc4FHv80tQQUK/FC84x4rAvp8uAejugRFCXe7dVKfeBVOgxwgzN+SLJv25lRRj2/Rh6j5nEsirdpN0cN/xdCCH5q213czb8TQpwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773398035; c=relaxed/simple;
	bh=kFCcnIuMWD/+5XLsWh50w7XD2sToGwa+iZpns2aGbFQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M95UxaPmXIivHHPOFt3+8IFy+bcyUVOaUshN+GRxZCGFyQ+Oc/6nMVd7OB4bNN27ujOTSmpudOIehgVZEPJCEef6N8WsRpX2d55aHVO+wy5ieGIVZmn5Srlr7AmtvDGTBQHdVr9GKlPvh3mbPgxmlAgXi5j0hw45AF4qbwDjLt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=A5NjAehA; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4852e09e23dso17395555e9.0
        for <linux-usb@vger.kernel.org>; Fri, 13 Mar 2026 03:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773398033; x=1774002833; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Fr6AAyzi/teFEbRN3jv2oVVxikbRugR+Fya8ttXkOnw=;
        b=A5NjAehAHO8CxhQP9gCZ/qr0ZsZBsql94VDIU4b+bsyLp+KQKmEOnbXKLt59GlOvJN
         H13CyuplUVmsokX0AoDPaL3sh3fdJVseKKvEhUBnp1uIIjuB7ox5/uMNckeJlSA7utxh
         Igvr06a4ATdVjEvYrhtro57JSlcVEEBiZqyoqEXKpTVSufHsapPh8O+fhYrjoBB+CAV8
         yNvtzrEBe8+1tSZ48Phg1UnAJ18zj/Cn+DHPjMyPfrnM3WKXWXI0CwViZ5K4xD8qKjff
         IpR0xOtKbsk3XkMh6VDgCUx1ToJjiGzzTrjFtpJMLqH4RC6zXEemBk20SDTQfk8luSaS
         vWHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773398033; x=1774002833;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fr6AAyzi/teFEbRN3jv2oVVxikbRugR+Fya8ttXkOnw=;
        b=LQjkKdt3sOOzoM4jGrKNrmpCbim9EYj8hJsvWuj3J5c2g7Jcssl2ItQm0Y4XapOg95
         qucoalHzVYq10X/oYr5lheLr2NFyfyQU+ykV0sa6x1K6wxOymMDVQGnipx85byLm4Yah
         g9WtCoqPbbhFR5D9eTQZpqy0GLVjNh/dsbZJQZQfCysXaBIcA+nsloM9Wcuucb7GX5Uo
         C2DPUML5nLK3zBLjH6vH2+0wutCO22OBXxmRTlonCA+QS6/dp7FgsNHFHTh+P/xleosq
         NmrD6ntjgJPGL7cram3SpdCJ+gWlKlWCgxdjowED9g0CFhVgRGxvdZKVMZ8Xpzp2Eq6y
         o1bQ==
X-Forwarded-Encrypted: i=1; AJvYcCWAAbUsEpjEWM07Yggut1Y49qvOtCy/95ROqpHZjUUHwZOinHKxPizFKd8afPZZKtg69JBEjzhjqLg=@vger.kernel.org
X-Gm-Message-State: AOJu0YymVsmIaarpRmFMg8JGD1r7elcDoRZgZaJdUtZkzNAggHsybvRe
	sEelrwo2NgY1T8YE8978fE6HThaHkSpHOhkaQXml+pXzhMlWwYmCnqgVwLpZyvApMjY=
X-Gm-Gg: ATEYQzxNZVs7Yr9b+ajPCunj7iHahwgV37D8SMs9Miq1a34SF95FShuXzcC/1RYFTo5
	UgwFc8CzViPy+W2pjIXms3cc+yEEmkTLruiqSs9VdhZT7gBGKCZ3Krg9Bn1pZkq6RnQD7rutxVS
	8WK78yGDhiWZiAANmA3qB+9+XDB6RAK0aXtT2+6k4N2m0R4+l11e43LAMHJ1TSmP0g6G1y8c1s9
	2PcQtoAoV3MVWg1RRLY0qCL5pOfiZYQluztd1cjWZ+pZrD4Zj/tPVDhFxW0zXDt0PbMHMHuM5//
	oSumOaLm/53VXCdnIov7lpezAjDs+MQROZFLazFB9D/0NRMW4CZZX/huD0Az1YA9MBp/RTTxYNE
	w98PRh2KJ0bhJOmTdOOIdEyjx8SxkL0OqAE9DPqkjgToszILiYXY/KFp9eD3Xb92MmftsPSp27F
	P78zlzBrdot95O+tIMQJjVXMDRhD4RjH9dHIv17vtsUtzouIuvSjAAXNNCoUDHE9Pudg==
X-Received: by 2002:a05:600c:4f54:b0:485:3b5b:eb8 with SMTP id 5b1f17b1804b1-485567052b8mr40725635e9.26.1773398032596;
        Fri, 13 Mar 2026 03:33:52 -0700 (PDT)
Received: from ?IPV6:2001:a61:13c0:b701:6257:30d7:3190:9d8d? ([2001:a61:13c0:b701:6257:30d7:3190:9d8d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541aa73dasm806993795e9.2.2026.03.13.03.33.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 03:33:52 -0700 (PDT)
Message-ID: <12567c7d-0a17-46a0-8acf-3158c2d9011a@suse.com>
Date: Fri, 13 Mar 2026 11:33:48 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: correctly handling EPROTO
To: Michal Pecio <michal.pecio@gmail.com>, Oliver Neukum <oneukum@suse.com>
Cc: Alan Stern <stern@rowland.harvard.edu>, =?UTF-8?Q?Bj=C3=B8rn_Mork?=
 <bjorn@mork.no>, USB list <linux-usb@vger.kernel.org>
References: <261996a8-7ad4-4df2-a469-f6602da71255@suse.com>
 <4f85311c-bdfe-46a4-a310-4a74a3c56b3e@rowland.harvard.edu>
 <64dc9c5d-d662-41e3-898f-71587b940a2c@suse.com>
 <20260313085354.71a6dbf1.michal.pecio@gmail.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20260313085354.71a6dbf1.michal.pecio@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-34735-lists,linux-usb=lfdr.de];
	TO_DN_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,suse.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oneukum@suse.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,suse.com:dkim,suse.com:mid]
X-Rspamd-Queue-Id: 0280D2818FE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 13.03.26 08:53, Michal Pecio wrote:
  
> The official USB philosophy appears to be:
> - remove any remaining URBs from the endpoint
> - clear halt (even if not halted)
> - use class control requests to bring the HW and SW to a valid state
> - submit new URBs

This looks a lot like saying that EPROTO is EPIPE by another
name in the eyes of a driver. Yes, it indicates that the issue comes
from the transport, not the device, but does that make a practical
difference?

> Some thoughts:
> 
> 1. Giving up on EPROTO may be overly pessimistic. Bit flips happen.
> 
>     But EPROTO may also mean disconnection. Parent hub should notice,
>     then disconnect() will be called at some point and usb_submit_urb()
>     will begin returning ENODEV.
> 
>     Some cable failures cause persistent EPROTO without disconnection
>     being detected, e.g. D+ or D- discontinuity at low or full speed.

There are also these pesky software systems where a perpetual immediate
retry causes a livelock.

We have to ask ourselves to which extent we want to deal with failing
hardware. I would prefer to deal with true hardware failure separately,
but if you think that we need to include the possibility on a driver level,
please say so.

> 
> 2. The idea that a driver can retry a transfer by resubmitting the
>     failed URB encounters certain problems.
> 

[snipped a fascinating but hideously complicated collection
of complexities]

I hope we agree that that is a level of complexity you cannot
expect any but the most complex drivers to even start thinking
about.

> 
> 3. EHCI/OHCI/UHCI can do proper retries, except case 2b, simply by
>     resubmitting while minding points 2a and 2c (so no clear halt).
> 
>     The same action on xHCI currently results in 50% chance of the next
>     packet being dropped by HW and the URB waiting for another packet.
> 
>     Tricking xHCI to behave like EHCI is uncharted territory. It seems
>     to stray away from offical USB recommendations.

This is a gigantic layering violation. The specifics of error handling
in different HCs does not belong into drivers.
[..]
  
> Summary:
> 
> Retrying may or may not be productive - see 1.

Does it hurt? Furthermore is it likelier to succeed if we clear
a halt before we do so?

> In certain cases retries are impossible anyway - see 2b and 4b.
> Extra work by class specific means is inevitable. See "USB philosophy".

We are handling errors. That is, conditions that should not happen
in the first place. Perfection will not serve us. Can we come to
something reasonable that will mostly work and not preclude going
to more drastic methods if it fails?

	Regards
		Oliver


