Return-Path: <linux-usb+bounces-33558-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IFf6H2dOnGktDwQAu9opvQ
	(envelope-from <linux-usb+bounces-33558-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 23 Feb 2026 13:56:07 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F0DDE17679C
	for <lists+linux-usb@lfdr.de>; Mon, 23 Feb 2026 13:56:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BF25430347BC
	for <lists+linux-usb@lfdr.de>; Mon, 23 Feb 2026 12:56:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6C4E36656C;
	Mon, 23 Feb 2026 12:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="MPDy00UQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 234A9366050
	for <linux-usb@vger.kernel.org>; Mon, 23 Feb 2026 12:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771851364; cv=none; b=vDUGi9Bfh5UXMCB0IcmEc8cuCAS5hdxxFchFjzr+mH9I/XQ5M1RC+96zJ1soXhS3Z58tTxUqzY/QXz/yQHHDu194xEMNzPGlDcG5q65Q94P0fMIJZ5dTDLfHnGUFDC0agHuGz9lyjKJbHyJ5XaxjxCRjDDCD2FB3OYzU34DHAjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771851364; c=relaxed/simple;
	bh=Xl/HdZ0Xz7pnVC0/2kX9AhiqVRoMrSVXH9WW0P3Rnzg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FezUHQAE/vKevVnWKKbRmCbXunWT3c1157wasUlEoQXJ4xOzZ59ct/EdPaVIGkJleNXyHBbWtrfi3HAp4vBL8YvgqUeTQkxR1G9LfiWVTq9qa5AxJivhM9wg9nWBf4zmkqytNIk3cdODUTFihOQRCBwqMTY1CEnKfR6MDBu0G3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=MPDy00UQ; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4834826e5a0so53535705e9.2
        for <linux-usb@vger.kernel.org>; Mon, 23 Feb 2026 04:56:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771851361; x=1772456161; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9Akf89EDkdJqcKB70GP7i70JWOZbBgZZx2ziMdQHjMY=;
        b=MPDy00UQz951Con8mK7H+qJWCnThliNXoKVEKwVkD38HBKOkWI5oojR2byMdvRHdJn
         64Rw1Yzqxmw2n02+msNbWxC4vDdkFS64MpeMXidu+LLuATD38Y4ZwfIs+8F/BesOwlAI
         RDhFrHIZa5fj7ksPF8okrGrwsgYATNmmsZwcpIQ8tfV9IRN4zn5TQ8q3HIVdrXl5eSsj
         rrAmh68oG6M3m0o6FzZNHDPJ+5bKCcS6LkSvu5SluE1i6OZStWKolbd/BOmOsUkBTlAu
         Y4R51kgr9qeJAHgy/zAEBrV1T8Ra1qfZQCi0bhlaE1JLDQLnU6TIrtEXQ00KXfEsO9+/
         sSIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771851361; x=1772456161;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9Akf89EDkdJqcKB70GP7i70JWOZbBgZZx2ziMdQHjMY=;
        b=abkAHM1ON8cZT8u1jPUNdQc05cQrcwjzXIbwp+N40V3QaVUZE+yZ8hhOD+eFiad5cb
         VOBJIuD2Tsg4x1+J9KSZ4Y7lxgpHczE3vXNzqPFa7ihHclw/I0CJ8th3MIvjfsD9yjOZ
         bFxZNM4ADnxutKoew24e3l/HbgpHLu5n/5U5WoZ7D36/7ke0rH7rEqKzdmUEgn2JpgAj
         qYquk9g4UrkZxd/Iy1IlNJTZOOKBa+zn0igqkCG2ToKxSKwCsCgeiJcmfN8bHkKm2xV3
         H/UKGZabIdnHT4X7ZEr5+CKuU4ehBf+lUD/26hIcQ+uuGb9KfA7MMVZeFSEi3b1HMRWm
         Kqvw==
X-Gm-Message-State: AOJu0YywcEmFFWCiKKLszzbtniyyMVHQTht4Fwiurnlgn4udwO4zov35
	sP402sJH0LbZlx2WAKp5WKiZxB5pBHJ1wGHdB9Pb58bwjBDzul1WjFCdfAuZx0LTL5QCqmd1vIi
	Q153Z
X-Gm-Gg: AZuq6aKTrg4QByU73Zlpq/L43uVMCTH2bfdq3lVq4WfIpj6RMsoIOuGERFtBSz5aX9X
	XJc0qv8lvjIHyDHj79Ralwghoii4Bx/DTB2OukN4Ld2BfWQ7zeYkDutTevVoxvVMM9uVLTJE5O9
	aWLqoKsUxdW+GR+jqiypMgauLbg5C9giPbNOq7/mxoddwt5CSuEXXqTom6o2DtQuAZyodXmFbGL
	egHN5aGQy6l+ZQPApPFWgLOoF7YtdexCcb9LnDaeg6jTBlzBzzqdJlQRwCxZEz2s234YjP3mBeG
	ZVA18B5AeXMHPfTfEkGEOL8ulEgCUz9EFe/yLMIQKvj9iHwgXWibNMo5Ce6eexR8xBHG0X90oJ6
	sEeRrFOtEalhQ8Hs+dyR2syPim6sM4fHcZuVfBIdsU4Z11E14XQeqSbJVMG7ZDi92kX3gG8FAPg
	kI75Ap011oxGJsasyPYh5MDVi5s5hqChjDY80NVZHQfUA116K6FLleku/bWlXY7xK+fpz1uGq/f
	uaWpg==
X-Received: by 2002:a05:600c:3e8d:b0:46e:761b:e7ff with SMTP id 5b1f17b1804b1-483a95f5a48mr131674475e9.28.1771851361497;
        Mon, 23 Feb 2026 04:56:01 -0800 (PST)
Received: from ?IPV6:2001:a61:13fe:e401:a6d6:a7a0:a277:a99e? ([2001:a61:13fe:e401:a6d6:a7a0:a277:a99e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a31f0370sm461207825e9.11.2026.02.23.04.56.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Feb 2026 04:56:01 -0800 (PST)
Message-ID: <1ff10cd4-d3bb-4c9e-9164-056b04b55473@suse.com>
Date: Mon, 23 Feb 2026 13:55:55 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] usb: misc: uss720: properly clean up reference in
 uss720_probe()
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Oliver Neukum <oneukum@suse.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable <stable@kernel.org>
References: <2026022327-exhaust-constrain-e21d@gregkh>
 <04778e0c-e15c-4acd-ade2-5cb8dc4319b1@suse.com>
 <2026022316-strobe-zombie-335f@gregkh>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <2026022316-strobe-zombie-335f@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-33558-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oneukum@suse.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,suse.com:mid,suse.com:dkim]
X-Rspamd-Queue-Id: F0DDE17679C
X-Rspamd-Action: no action

On 23.02.26 13:14, Greg Kroah-Hartman wrote:
  
> It's tricky stuff like this which makes me can't wait for rust to be
> possible for USB drivers, someday...

Well, as you wish to touch upon that topic ...

I am afraid this is not a problem of language. Rust
solves the issue of object life time. Unfortunately
that is useless in this case. I know we all wish
to solve the issue, but let me explain.

Now, before you either start despairing or get angry, we
need to look at concepts. It seems to my you're looking at
the problem in terms of life time and basically
something that can be solved by reference counting
respectively life time rules.
That is unfortunately not true. Our problem with USB
drivers is a question of binding. probe() does not mean
that a device has been plugged in, nor does disconnect()
mean that a device has gone away. It means that the binding
between an interface and a driver is requested respectively
goes away. Hotplug is merely the most common cause of
these requests.

Nevertheless you have to cease using the interface as
disconnect() is called. References cannot change that.
There are two reasons for that

a) there is no object representing the binding. It is technically
a pointer not a data structure. There is nothing to refcount
and no object whose lifetime you can specify. There is a variable
that is changing
b) there is a state transition, not a life time question.
There is an event that changes the state of a binding if you
will.

Sorry you don't like this, but this is a design issue, not
a language issue.

	Regards
		Oliver


