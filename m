Return-Path: <linux-usb+bounces-33185-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ELrdIOaxiWndAgUAu9opvQ
	(envelope-from <linux-usb+bounces-33185-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 09 Feb 2026 11:07:34 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E2DEA10DFA7
	for <lists+linux-usb@lfdr.de>; Mon, 09 Feb 2026 11:07:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0E7613055D44
	for <lists+linux-usb@lfdr.de>; Mon,  9 Feb 2026 10:03:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDF06363C5F;
	Mon,  9 Feb 2026 10:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ZcwayMu/"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C2C32573A
	for <linux-usb@vger.kernel.org>; Mon,  9 Feb 2026 10:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770631399; cv=none; b=drbbkBmb5jYJSd056sNxQb4/lpewqc2xxZ1e/efTiMG+JXP6eJlCiMcoThmOpWuztQCO878afcKPJ9Z8RydrmdKgf1L+L7afs7MqC8Px2yntaQICGVwluax4lDcd6ahwRRuiOnBt7POJBH2u1I4wEXu4v0V8tr6gMv9yt+F8ybc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770631399; c=relaxed/simple;
	bh=Q9WUFQcCqwzWmLaPX4DE6lD0KZGNtPTl3VtCLnDvmxY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nRDOm6UABInB/YsTDPy7ugdbfYBQwjH+BpbbRa4fwOJTTFTSoa5OrTMNXHfrX1cUWw5LIIzomMnhK2QRw0dBYI1XNThZb99IDGEBoJsENMv9gSRCkqRFwPF/s5N2u3tuVaSyybscwWXIovqz88O2dZ43ULdwzh51jmfYtTJxPgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ZcwayMu/; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-436263e31abso2899006f8f.1
        for <linux-usb@vger.kernel.org>; Mon, 09 Feb 2026 02:03:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770631397; x=1771236197; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qGirY9JsRgksNd6Vvn5TSVXiE/5Iwn5SZrG4neo4i3g=;
        b=ZcwayMu/zi7SYVeO0cdSaoX6ok0zsVKdYK/JGJOGgLkOAtwlmbGmzpxAOKsxwwxHAt
         spwe918Dytk1DPBoOJgO/mmuZh0wHZ+Dgim+jCL8d55v94HOzNkeU119M9BTPxuXjBqk
         YjAmsx3bo2ayADfGr69VKhRX1bOsGY0vF+lYXupQCyBRwXfrbrmLvuUvii3NtUAXeoeB
         Dw7MFSXxG0KHjAlj2V4fiZO/Y8cT4k1vxn9lLgq0yIU/fJZacAJ8QBbMrZloxjVwgHKe
         g25rl5+swP5PYFXQ3mLzGMIyCX8tvYstq74TRN+Xb/bMVwcULDcQqIF6F7OHDcYKofzA
         Y9Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770631397; x=1771236197;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qGirY9JsRgksNd6Vvn5TSVXiE/5Iwn5SZrG4neo4i3g=;
        b=b9YEtXEo/EnaV2xgyyO0iRhMfV5drvhMkRuP/ia6ZUdGal4xMM4S/ZElvbi4F/6HfU
         oygry5s8gj4Y5370M/EkouLniZN2/IQEyU2HA60KuJ1u+TANcpnSiXEgeCQ2mri6SOen
         dr6jhy5O9kxid6mcoj8lQH28gDa+v9woEY10DWrwCzqI7Iit8b95lbbShxAtFZgKjsrA
         2UC84NnGKZMAaMSt2qcM90drOC7EpAWTlry+U9KEq+PmFeCV5j1SWeFzH4oT/KzeT66O
         tubJa8bjPtUeQjd1Nui/i5HN/801sHbo0f63jKVp45AIE4PSYNnUAdT4Ov8asXlJPbro
         AS5A==
X-Forwarded-Encrypted: i=1; AJvYcCXFfajjgqPhFh6pPvjE2EF1fkvKoSgsLZpxtgRHAu5xyDHbui49N3HiK74LBP1LEFHHIWdeVsjWP+0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYgMIo8okWvrsUR/T0B5c+lkQDURdKsdmLOIDgzeYhJgV9EnvW
	6nidt63oTJvQc7D8rsFc9fwWTw1U+aCJumOIFw1rCPUo9FK1qeUt7RZtK2kJTRTnNdI=
X-Gm-Gg: AZuq6aIc7OLxhDxVpC6EWpiEi4Yy6sbhtPD6d3rkhcWxahHVnrAeI28KGalxQTu/vow
	4lmUrHc9NtLZ6wgGPD0N9rkB1xejwtD9+m8+0qOsNWfQH1/KlTeTyYvuSYHJvZJY04/EVqbbVE7
	YmHQanXuiiwJrZ7dOFeMofo4g3VctonDPdD5rMiv7/G0gDX4Wa4kAKQtdnyKLHAToUStf+Ck4sE
	WH0Sz7ciT/oQrSRCBQaNsQcvpM9oY7/4xZ3RrlsZoTrzGUJaSAaogyNoBXVIeN0J4Sswpa0uGye
	caAhxjpGVaEvnVwE+OKdE96U6AsDWMx1OlTbugAeBM3N3WZ0SeIPa8OBR5DZX6xzhNscp/6JiEh
	/xQ0gJ0ZncC6z4C/uAQ5rx0m7g8jdM2Nya7wavFGJ6vrAFmtYWfNNdJu7RkBVtPr5pMKyPktPWd
	ZudSKiMnUx9rGZDERJZO1A9s/Vc0TXKI96uM3WLX6PlpusMyuFzs1y
X-Received: by 2002:a05:6000:178c:b0:436:37a1:db58 with SMTP id ffacd0b85a97d-43637a1ddd1mr8965966f8f.59.1770631397403;
        Mon, 09 Feb 2026 02:03:17 -0800 (PST)
Received: from ?IPV6:2001:a61:1376:df01:e943:d12:a8fb:e1d7? ([2001:a61:1376:df01:e943:d12:a8fb:e1d7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4376686130csm13427380f8f.1.2026.02.09.02.03.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Feb 2026 02:03:17 -0800 (PST)
Message-ID: <8e1c7ac5-e076-44b0-84b8-1b34b20f0ae1@suse.com>
Date: Mon, 9 Feb 2026 11:03:09 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [usb?] INFO: task hung in usb_bulk_msg (2)
To: Alan Stern <stern@rowland.harvard.edu>,
 syzbot <syzbot+25ba18e2c5040447585d@syzkaller.appspotmail.com>
Cc: greearb@candelatech.com, hdanton@sina.com, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, michal.pecio@gmail.com, oneukum@suse.com,
 syzkaller-bugs@googlegroups.com
References: <f0d78b66-4022-4b65-ad38-86daec39bc7e@rowland.harvard.edu>
 <698905be.050a0220.3b3015.0061.GAE@google.com>
 <0b508f72-7248-479c-ad26-b9385e52c094@rowland.harvard.edu>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <0b508f72-7248-479c-ad26-b9385e52c094@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[suse.com:+];
	FREEMAIL_CC(0.00)[candelatech.com,sina.com,vger.kernel.org,gmail.com,suse.com,googlegroups.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,suse.com:mid,suse.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33185-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oneukum@suse.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb,25ba18e2c5040447585d];
	RCPT_COUNT_SEVEN(0.00)[9];
	SUBJECT_HAS_QUESTION(0.00)[]
X-Rspamd-Queue-Id: E2DEA10DFA7
X-Rspamd-Action: no action

On 09.02.26 02:26, Alan Stern wrote:

> +	expire = (timeout > 0) ? msecs_to_jiffies(timeout) :
> +			MAX_SCHEDULE_TIMEOUT;
> +	if (expire <= msecs_to_jiffies(MAX_UNINTERRUPTIBLE_TIMEOUT_MS))
> +		rc = (wait_for_completion_timeout(&ctx.done, expire) > 0);
> +	else
> +		rc = (wait_for_completion_interruptible_timeout(
> +				&ctx.done, expire) > 0);
> +	if (!rc) {
>   		usb_kill_urb(urb);
>   		retval = (ctx.status == -ENOENT ? -ETIMEDOUT : ctx.status);

Hi,

is this a proof of concept or a test of the real fix?

I am afraid this is highly problematic.

1. You'll hit every user of the API. These are probably not ready to handle signals. This includes usb_bulk_message() and the interrupt version.
2. wait_for_completion_interruptible_timeout() reacts to _any_ signal. Do you really want to abort for SIGIO or SIGWINCH right after urb submission?
3. The error handling is broken. You cannot tell a true timeout and a signal apart.

It seems to me that really want a clean API introducing usb_X_message_killable()

	Regards
		Oliver

  


