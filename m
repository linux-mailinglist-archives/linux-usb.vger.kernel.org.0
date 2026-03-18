Return-Path: <linux-usb+bounces-35040-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2CYtLn53ummTWwIAu9opvQ
	(envelope-from <linux-usb+bounces-35040-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 10:59:26 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B3FA2B98FB
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 10:59:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 590963155B68
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 09:54:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FEFB3B8D70;
	Wed, 18 Mar 2026 09:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Ee9XOfTV"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67EC13BAD91
	for <linux-usb@vger.kernel.org>; Wed, 18 Mar 2026 09:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773827670; cv=none; b=JeBBmpQXHyZT5cg9+cmZLsZaWE7wedMX6QNlc8Set+h0ACGrcg0utgQSRWNtIl7LBDrLXL/kVgv2dfJsBNYCtulpbXeSi5m2rDdlbtEyLdqNML9qqdOyNyV8rFukXKkPE39sofbYTxDoBchVAFNDIWD3DSl1ELtdL2gPiPTmhSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773827670; c=relaxed/simple;
	bh=MGFZ9SwNBgeOveQE3q7py8tkWrsILvn63/RDA8Xi3zQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gJPvwOXkkAFYa0kT0Xvrv4Cmc1Fa9bWR1b2FFo4GUIUpmUeEct4kTLOUwveNPYRnfym1PQ5PLjASq0iJXcuIpewdo4+j+2XBWw++OnNRbbvk22wsIlB8BpInA6Gy8LnJYnn6RBuAO/XDCl4h3bBvASJzAAqiQa4X9fBsi8qswvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Ee9XOfTV; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48540355459so64713075e9.3
        for <linux-usb@vger.kernel.org>; Wed, 18 Mar 2026 02:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773827661; x=1774432461; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pkFnASwUW3a+PLGjailnDllJkLZgxWlustGr1LjMSqA=;
        b=Ee9XOfTV2Ot5V22CzsgQ7LgG0ptnnDlwXTnxoqYOfH9Xl3k67iDrA8Ihm7D+Go/rXb
         ghQsYihaaeyG8nqVMJqR8rXA7EpBxEWzbFinatXMbW3vja2uVrl1Um89QuUQ5VUX+Oxs
         pKFtqbREp8u0Rwbz+HBQOBXRCoJYZNIdVsQ7LmDLDFqRMKAOkKAjm9Lk1whH/pXWIMle
         gmYodUyFdYRiN1Pagw7dUZyHN2ddwW8RZlpodYpqeHkvjUGPiS7e8xCs2ha/BK2CHR01
         jFQoPs8VaHL9U9ywJiGncIYLJLonr5cGnsrJqr8QFQN0glPE1ukDgrR2LQ4d/JPby+Qe
         0PcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773827661; x=1774432461;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pkFnASwUW3a+PLGjailnDllJkLZgxWlustGr1LjMSqA=;
        b=HzDjSTjDD0WXdNBUDZUkugIzGH36uR9+uJClfXsWsxlc2QMs75CBb80JMxV7MleBGk
         9hZD9mk8HWiJThezzV1imAVDVofTvcfDk16jZqQyBkoHtDAJVjg//hXzmDksaBozM0Ze
         EJAV1B92BE0PWnXNc+bB6tsSiOcDhCmUKdEw3n5FWF1PxPI7dHMj2Ru345rujZla0fhT
         JAaQwx5envICWfKQ8kR1tZkjU4nWk2rSIYrdcNmOh05LP49LU3hRrPj3DJx7Vv13+9b7
         mGpD4fVGLPPXQhLo+rh2+XISWVnbe6E+1+ag8IV088wNI9YjmiTgE6DaGl2NZo/9udnR
         aQgw==
X-Forwarded-Encrypted: i=1; AJvYcCX3dJxnnjXl1dTkXx+3e8szYueVHteiV9Hd+1uHbBbtYMA0j6ObISQbZfsyTAW6gt22vDPNdlsqe+w=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFy0juKR39R+H4XECkIBbEZSim2fqNOJwrqFri6xAxnyCK6ZSR
	1m4jz3AlDI+HMkcLlB7t5OCWtCVMNm4FQcUzzf/Z3+9fEpW9i31HXdddbvbixvgsorBqiiPdaGZ
	1UMx0
X-Gm-Gg: ATEYQzywQLE0q09HWz0rT0t5o+Us+XHM8lBu3T218U5zSSMaIcK1+cdC4BR49DpkcP1
	YBrdFcuQqs5mKClNwY17wcy25Siki7/mirM93KM8nYjfimx65EW5iKSM19twyFo8OmoJGZowOeH
	iYn6IFHYeBon6OOHJ/xbpha42xLJUSWaaKQ/IsVn9cU3kaQfLS4PD4sLlHpwKMgA69JDWKcCJXj
	2RYlGnAskMc7jX7FJLXZ0seYGMPBlNIEJNCM2JwM5/MXKxyAf3Y7EmNrru4VkPS1mz/HHzQmrKJ
	a0hLZ0q5GiGYxnu/+cXDBCAGm1pyolR8WwucByColp+cM1U17wyxStD7110EE0IrNaauyVPCKaQ
	0O2u3Y58Gzy21PYv0e7a0qp9EREMymj4ZThatJmFwUI5/j8x7I7BQ1SJQeWB9bvRJWrruFehrox
	ijlKwOf6PRvLy2c5AyKgDXWcaUjRyAy9v7OPuwexNaPT5zBAwWQoslO4qE+bYcaS2NCGk=
X-Received: by 2002:a05:600c:1d0b:b0:485:30f7:6e88 with SMTP id 5b1f17b1804b1-486f4577061mr45518405e9.31.1773827661237;
        Wed, 18 Mar 2026 02:54:21 -0700 (PDT)
Received: from ?IPV6:2001:a61:13f6:3a01:d734:4c22:acd6:d29d? ([2001:a61:13f6:3a01:d734:4c22:acd6:d29d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f460ef0asm18079525e9.3.2026.03.18.02.54.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 02:54:20 -0700 (PDT)
Message-ID: <8a14fe29-0d92-4ce5-a7e2-2c084c710727@suse.com>
Date: Wed, 18 Mar 2026 10:54:20 +0100
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
References: <9da0ac4f-12bf-4270-af6f-e08b5a89611b@rowland.harvard.edu>
 <20260313224528.dp6utjqzbdguwlbf@synopsys.com>
 <a6934c14-aeb5-40d0-865c-14199943e2a2@rowland.harvard.edu>
 <3028610a-f05a-4bc8-9037-cca152e46c52@suse.com>
 <437037d6-3fe1-4f81-b74a-21bea00725e0@rowland.harvard.edu>
 <0b45d0e4-53f8-4960-b41c-63639b496dac@suse.com>
 <4f8b9942-307b-4c31-86f3-1b7b20b34a16@rowland.harvard.edu>
 <d1674f98-cbbf-4a16-8c76-996a0494d931@suse.com>
 <abcd2076-c2d4-403d-8ab8-af747b335075@rowland.harvard.edu>
 <87a692e2-559a-4765-8321-a422751d3589@suse.com>
 <4ada5d68-56f1-41b7-82d9-463901c927db@rowland.harvard.edu>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <4ada5d68-56f1-41b7-82d9-463901c927db@rowland.harvard.edu>
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
	TAGGED_FROM(0.00)[bounces-35040-lists,linux-usb=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,suse.com:dkim,suse.com:mid]
X-Rspamd-Queue-Id: 4B3FA2B98FB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 17.03.26 19:03, Alan Stern wrote:
> On Tue, Mar 17, 2026 at 05:20:37PM +0100, Oliver Neukum wrote:

> You know, with a USB-2 host controller, transaction errors don't make an
> endpoint unusable, and clear-halt isn't necessary.  I wonder if xhci-hcd
> couldn't be adjusted to behave the same way (issuing its own clear-halt
> internally, if that is needed).  That would make things simpler.

It could be. But do you want a HCD to generate requests to endpoint 0
on its own without coordination with usbcore or drivers bound to interfaces
of the device?

It would be an elegant solution, but I think it would bite us into our
posterior. E.g. what do we do if a reset is requested or somebody
wants to suspend the device or change the configuration or a setting?

> Another possibility is to change usbcore to automatically unlink all
> the endpoint's pending URBs as soon as a transaction error occurs.  Then
> drivers wouldn't have to worry about it.  But even then, drivers would
> need to know how to react when it happened.

Yes. That looks more plausible.

> Reset isn't always the next step.  In some cases the driver should just
> give up.  For instance, if the device has been unplugged.

Then we do not care. Signalling and detecting an unplug is not a driver's
task. A driver should leave enough time for that detection to happen, but
if usbcore does not eventually tell us that a device is gone, we need
to treat errors as genuine.

>> In principle we know how a reset is handled, don't we?
>> Again, we cannot know whether a driver is the first, let alone only, driver
>> to request error handling.
>> If we decide to reset there is no point in clearing a halt and resubmitting
>> URBs would be wrong.
> 
> In practice, does resetting ever help?  With usb-storage and uas, yes,
> occasionally.  But those are unusual drivers; what about all the other
> ones?

They don't even try. UAS, storage and usbhid are the only drivers with
a full error handling. usbnet has vestiges. That is about it. Others
may try to clear a spurious halt and that's it.

Generically speaking, short of giving up, what is the generic alternative?
As far as other examples are concerned, isn't this scheme quite close
to what SCSI does in terms of algorithm?

>> How else would you handle errors of this kind. It seems to me that we
>> need to make the delays and number of retries tunable, but other than that
>> what can you do generically?
> 
> You're right that those are the only things to be done.  The question is
> whether they can be done in a way that will be easy for all drivers to
> adopt.

Provide defaults, again best be copied from usbhid.

> Consider that while error recovery is in progress, the rest of the
> driver has to remain essentially dormant because the endpoint cannot be
> used.  I don't think many drivers are written to support such an
> operating mode.

Isn't that exactly what you have to do after pre_reset() and suspend()?
Nor do you have to use this facility, do you?

	Regards
		Oliver


