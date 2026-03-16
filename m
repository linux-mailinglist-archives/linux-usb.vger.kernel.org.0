Return-Path: <linux-usb+bounces-34894-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kHcBKfpauGk7cgEAu9opvQ
	(envelope-from <linux-usb+bounces-34894-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2026 20:33:14 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 21B7129FD1E
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2026 20:33:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8C1AD3014853
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2026 19:33:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7F2E3E717E;
	Mon, 16 Mar 2026 19:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ANjIKhKz"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E593B46B5
	for <linux-usb@vger.kernel.org>; Mon, 16 Mar 2026 19:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773689589; cv=none; b=QWorPYEFVrwmZsD5jMfOZGZkR0SlbDZ6e4npHAUgqC1B51BRT7ryi2e5wxTMz3wmFQ+QJ8NAOHPvL/bpQPhQaxzZ66I6mV5GzY7hZEgPucfgxTVigO0JclfBQzb1ARsWrSQoqBJCjLeC7q3XXQxgc1G7XY17Uw5imkkaYmhggZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773689589; c=relaxed/simple;
	bh=DObkRWdw76SqrJhQ2IGf8gCbVf9aTlspjB3YTxYt2GU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=comYzKT4GHTT+Kndv4QWFaFAbJr24SjwVwwo2pHG8DSTQ3uXc7qNGHUo5NOqYNUbBLQEDwGJELB8jeZG03jG+Xj1+HYGoDS1fbikk6QI4lkcBCZrEEBebvqcHf74BMXlKsIp7ugQnQrJrHI8XcO2rSyUZWjNJoisxtua4sLRwRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ANjIKhKz; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4853c3c2fe7so29661405e9.0
        for <linux-usb@vger.kernel.org>; Mon, 16 Mar 2026 12:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773689586; x=1774294386; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LT8GQLaykBdYQQ8v3CGI7RDdV/Q91xmOWcKLvA5VpLQ=;
        b=ANjIKhKzA5KdlYWwxdgSfT7XWJGkdiHTQdjgF3rwSQmJeYw/AdDnons7rEhyAjAIxM
         Sp4/iLmx2qR/0eOzeVT2u5hI5oUxodPyEESLKoDAHhcgF1B4N2uur9avUReMt+8ueZsh
         MwkVBN9DpPS8GjknYLOANF624MF5YgRvxP+ZkGpZxp/Sk+5pQnacHvnvX03IEXeQwEri
         eU8fuclAskQxjusdiXwLXOxBZun4ShYQNNS8aix37pe+VhKZjYpLkaazO0h650xFZ0XV
         KeRPjGJ8B7sT5YgWx/1IoFPcRuTbXP3fyinezSMpLuAEEpYFlVrMuJsQiPq+iaMRYM0Z
         hikw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773689586; x=1774294386;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LT8GQLaykBdYQQ8v3CGI7RDdV/Q91xmOWcKLvA5VpLQ=;
        b=e4XUSsQ03zuCBgyGaw+v4dev2AElm8/HwzUPE6XWfYGYG/u6UnPcceFj2G0oIErXxu
         kJys20JwrSdtaD74wVHWvLSvMME8P0BCX1ppM8gDbixOJWhrvg/rOcPAHNCFZafXeSfq
         6Rg7pBgNYxf1WpmPWUOVhkK6lrh3+R4kiuqKGdYp72NwdaARNBoQmLT2UuH8rCvah6GA
         IRFGyW1DrDX+x0gRanGKtncEMOmaNwZn7kxhVZEaeIsG/tONce4N2FbVPKkFtui8Y6iD
         Ml2EBbnSkWFSBDu8nBEFVXdrdB01w9j7E9eFyyVW1DxsrElxVbD63sS5kgqRr/k4o4t0
         r3SQ==
X-Forwarded-Encrypted: i=1; AJvYcCVD3O9426qS6EpMcy9GGTPHNPhTYSBEHpZGGUEJQjpQfnEN5o2FJ8TBQhL/69+VEBByN5OoIETq0uY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyycVUKgipM/FQ9fGXfhZOcvxaXdhm6Xw8ctkjb/Gps3YBvBNre
	OkMVr6lQ3aZBdwPNvESoFvL4WVS5M5zxqAd67a1zSu79VbCFX/oKAuX0y7UBsY6+8b0=
X-Gm-Gg: ATEYQzzdRTQilCrKOdzJ7VKCZAfbHihnRRz2cF6rzkcJKSDRdBcti3jrc149fnLf1Zu
	mgyZKMJ0zQkSdT4weIjRBHAyGZ0+DeU/kOLoLgvRrRmDjiyfjG0usDHMSQ9JDbkwl0qkcjx5q7G
	BkzjKHSBtsoUbE72u6axvZuNelpAzpAaNR/j0KkTM78P6OHi7d4+49/7M6XVvPcxGb+Bcj03j5j
	nOZQZmi0qfMW/SQuBJb/cM+PFDXG7mfMApR/Nzxh0Wo8Ch/r08+OHvewqUzoxNyV6necrNdtArN
	LEgmLQsAxB8NokLrQkwD5KlDZNiT0VjNJdEvRg3ITZLmdpqAC0xm9jeZPRT9xk9mB7qwnwHprhv
	EFMKmO91E8G8Bhu3EcqOCNtQFCuNJ488XwoFrIYM/MYIwFFXqYnGwwEVMpuZxvNUbcEf1ECnbHG
	qAprfgIO1b+YrKfTHB3t/CN0wNhXWijbgnh+5inO6SRbSgF+TUbsKV4sV4zF6S/hNHoEAyA09if
	xb+yA==
X-Received: by 2002:a05:600c:a08:b0:485:2a85:e5ec with SMTP id 5b1f17b1804b1-485566ca978mr244210335e9.2.1773689586187;
        Mon, 16 Mar 2026 12:33:06 -0700 (PDT)
Received: from ?IPV6:2001:a61:13e0:df01:26dd:3109:a42a:ea05? ([2001:a61:13e0:df01:26dd:3109:a42a:ea05])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4856c2823afsm16734775e9.19.2026.03.16.12.33.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 12:33:05 -0700 (PDT)
Message-ID: <d1674f98-cbbf-4a16-8c76-996a0494d931@suse.com>
Date: Mon, 16 Mar 2026 20:32:59 +0100
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
References: <4f85311c-bdfe-46a4-a310-4a74a3c56b3e@rowland.harvard.edu>
 <64dc9c5d-d662-41e3-898f-71587b940a2c@suse.com>
 <20260313085354.71a6dbf1.michal.pecio@gmail.com>
 <12567c7d-0a17-46a0-8acf-3158c2d9011a@suse.com>
 <9da0ac4f-12bf-4270-af6f-e08b5a89611b@rowland.harvard.edu>
 <20260313224528.dp6utjqzbdguwlbf@synopsys.com>
 <a6934c14-aeb5-40d0-865c-14199943e2a2@rowland.harvard.edu>
 <3028610a-f05a-4bc8-9037-cca152e46c52@suse.com>
 <437037d6-3fe1-4f81-b74a-21bea00725e0@rowland.harvard.edu>
 <0b45d0e4-53f8-4960-b41c-63639b496dac@suse.com>
 <4f8b9942-307b-4c31-86f3-1b7b20b34a16@rowland.harvard.edu>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <4f8b9942-307b-4c31-86f3-1b7b20b34a16@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[synopsys.com,gmail.com,mork.no,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	TAGGED_FROM(0.00)[bounces-34894-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oneukum@suse.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 21B7129FD1E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 16.03.26 18:33, Alan Stern wrote:

> That's handled at the class level.  In the simplest approach there is no
> resync.  The host just keeps trying to send or receive isochronous
> packets at the previously scheduled intervals, and some data is lost.
> Consider an audio or video stream, for example.

Very well. We can set that aside for now,

> It's more complicated than just clearing halts.  What if the driver has
> queued a bunch of URBs?  They all have to be unlinked first.

As far as I can tell for some hardware those URBs may be already be in execution
when the error is returned. So that is a hard problem. Frankly I do not
see what we can do more than provide a suitable operation for anchors.
  
> Then after the halt has been cleared, the driver has to resubmit the URB
> where the error occurred (keeping in mind that some initial part of it
> may have been sent/received already).  Maybe also submit the other URBs
> that were in the unlinked queue.

Correct. Hence usbcore needs to notify the driver when a halt has been
cleared. I see two obvious options. Either we provide a callback with
the helper or we declare another full callback akin to pre/post_reset.

> There has to be a retry counter or timer because the driver should give
> up after some length of time.  When that happens, should we try to reset
> the device?

We need to notify the driver when a halt is cleared. How about we
provide the option based on the return value of the notification?

> It's a mess.  Implementing it in usbhid was justified because that's
> such an important driver in such widespread use.  I'm not at all sure
> how it can be generalized for all sorts of other drivers.

Don't you think that what usbhid does is a relatively useful model
for other drivers?

>> Actually you make me wonder whether the semantics for
>> usb_queue_reset_device() is good.
> 
> That's a separate matter.  However, a driver that is clever enough to
> call usb_queue_reset_device() should also be clever enough to call
> usb_reset_device() from within its probe routine, if needed.

Yes, one issue at a time.

	Regards
		Oliver


