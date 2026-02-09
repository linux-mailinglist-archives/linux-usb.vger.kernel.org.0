Return-Path: <linux-usb+bounces-33207-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WEf8NkYBimluFQAAu9opvQ
	(envelope-from <linux-usb+bounces-33207-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 09 Feb 2026 16:46:14 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB3F112190
	for <lists+linux-usb@lfdr.de>; Mon, 09 Feb 2026 16:46:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C9E683005D3F
	for <lists+linux-usb@lfdr.de>; Mon,  9 Feb 2026 15:39:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C14437FF4E;
	Mon,  9 Feb 2026 15:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="gHFo0HOX"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78CC537E2F1
	for <linux-usb@vger.kernel.org>; Mon,  9 Feb 2026 15:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770651594; cv=none; b=gk2XJrhDLYucQMyWFZ9FSE4hWglOiAQ+28QnNP/AFUNHQiiA2keGK7K4pYS5WkoaLhrGtWZj66YSwB6ex9IC+mHW9lct5CkpeVjvZvrWTLSNgoeXnmzdMxx6/zt+xhlMMc5f1J6+4uu+9V1Q/6QjJe+6a3Z31fBeUzUmVInMnL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770651594; c=relaxed/simple;
	bh=FiV37+Kw40bHoTZptCnkpmdwTqus5K8NZd5PGoA972w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e03aNGck2sVIm4hpkgxE8COL+DPTTdxgJvalia61xpEZHtrK0RmcaTuKHfx9Skyi/TKst77y7zfX45MHfo3lOqcCqKex9OywOluhQSaAUbYbv8lvTfoZtcMDhzAmzQkPk3awoVTUxenZq4Zhmx450y0VDe0Vrw2eUzb7tkM83k8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=gHFo0HOX; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso14630885e9.1
        for <linux-usb@vger.kernel.org>; Mon, 09 Feb 2026 07:39:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770651593; x=1771256393; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NDNHTc6N1q9B0v0zzqjahf4VokpV49jkvlTcIbOS68I=;
        b=gHFo0HOX7J5vUYhZsAoB+QKXaS+1nq229/RZrznjgqe1BOhTJC/spn1sjyb+LE/1/2
         jz4ky27/ljeNQsweFYga/FwZWfldEvLndebbNbMuCJMYbU2NccAKFaOcbNqTpSkWUeYk
         239tYUoYWMDuUIsNTwSwMC09moQskzwfEaxwSUlXUJByAOM5Yl4QSgON4wnTtDF2STKD
         3eDaX35FdQr1GkU44yLe2uTBtlUHWH7lK6/fzQs1wHNMjRnZYNObmVH3tX04n4qZDa1E
         uWSwyq1pgRwHI876Zr8cfvMmM8mZfM6Fj4xevq1vrgRg0yugWy/iLGP+Kobm0F10L1o/
         mcJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770651593; x=1771256393;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NDNHTc6N1q9B0v0zzqjahf4VokpV49jkvlTcIbOS68I=;
        b=HydYkaK7E6Uvh7mnMy3M+Kqpy1K2FBzYR/ADZQ/w2uv0tFbmkg//Is/Q22ZGs6mlQH
         TV6pRsVXoql0GiObCZpdhH667PaoCLrPOPjqBWfgC5MXkow43Muxmyx8yjuaOTEBFI4o
         swpEmUGgQcc/AhVqIPcCXWF0dwwVEC6gDRd0es5BL5ulATp3onKIN4soiyf20N92GIfl
         1Sx60ePqvP4+W0L25LGICpPozpgP0J/xv0DtfFBRcNxipGwDHkgAYlQHVAve1ryWAmRr
         64wiuTc2sJHJp9GrydM+hZyKgNxbCZ6ItGknf4oxw5ZzfBl7WZoxUVdGFmwOELp5L5eO
         i33g==
X-Forwarded-Encrypted: i=1; AJvYcCV8mPMjkjI2kT/wg5AlesXR1B5h3lu25IiH/It64/NL27oL3LuNJ2hQqNkx/dC/ybSUWbSgkmBGIzk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTInCnOdkZs9TBbqAMDtOtwZ7kSgQtWT3I7rClTyAfNmUBWbwU
	SBNbhQTZizZJV99kNvY1Tr2tFq83/l0L3Rb5tfKP2QNKIpwX1FtA0akyjo5sTz7vsQtcnvWWXDK
	pFkzn
X-Gm-Gg: AZuq6aIGg386qY499FL5zKnN03fZEw+0VnaCBY0u73KLJ8AR82eDb8pqQrdqtI7lOsT
	tHsMjcSMNGjH2V2rdgmut3yTXxCI41YSWRXdpbwxro1Pa5n+KiH6KQmyz/9wFlsttj6nKVzEPy6
	U3qGBKxiX5uOuGob3zCLVjJaqe9M/7LvHuDIwjvuXVaMLoUJkf91OF9zGNiUTjVhv4ACvEBJL3J
	OORs3RsP5/PzF1goaCBC9dszRjkILp0wEExutSzEA/xgtF91fB+JcipAG+qJd5VWCQiOQ+ksYvY
	DELYE76/Rf1mj6auom5MzeefNrHlCjd4eb6UMDQO19DU3n09n0pBGvCcoYQdXJo0VZbZUjGj1vZ
	864agaNoBOfTUCovLJZy0C6nsChkOjj0Vegifm3oIK10CNilyjuclFX7CRkWhx1QZhjdUBMYaY7
	lOmTRIaaBSmkR4jt7Jw9VauSo0g5/nqybE0xYtVSVd3i/e5yQW0sQu5EqKjT7gB9lP
X-Received: by 2002:a05:600c:468b:b0:479:3a86:dc1c with SMTP id 5b1f17b1804b1-48320229cf1mr182540365e9.36.1770651592750;
        Mon, 09 Feb 2026 07:39:52 -0800 (PST)
Received: from ?IPV6:2001:a61:1376:df01:e943:d12:a8fb:e1d7? ([2001:a61:1376:df01:e943:d12:a8fb:e1d7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48320396ccbsm131799805e9.0.2026.02.09.07.39.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Feb 2026 07:39:52 -0800 (PST)
Message-ID: <2b00f3ac-321d-46f0-86f5-eb66b3cdb3f3@suse.com>
Date: Mon, 9 Feb 2026 16:39:46 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: RFC: Prevent long uninterruptible waits in usbcore
To: Alan Stern <stern@rowland.harvard.edu>,
 Greg KH <gregkh@linuxfoundation.org>
Cc: Oliver Neukum <oneukum@suse.com>,
 USB mailing list <linux-usb@vger.kernel.org>
References: <3acfe838-6334-4f6d-be7c-4bb01704b33d@rowland.harvard.edu>
 <2026020950-prodigy-steadier-f747@gregkh>
 <6456e3e3-b598-4d33-8fcd-c7f8399d8a6d@rowland.harvard.edu>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <6456e3e3-b598-4d33-8fcd-c7f8399d8a6d@rowland.harvard.edu>
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
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	TAGGED_FROM(0.00)[bounces-33207-lists,linux-usb=lfdr.de];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oneukum@suse.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,suse.com:mid,suse.com:dkim]
X-Rspamd-Queue-Id: 5BB3F112190
X-Rspamd-Action: no action

On 09.02.26 16:16, Alan Stern wrote:

> It would be great if there was a way to find other places in the kernel
> where a timeout value comes from the user or the device with no
> checking.  But I don't know of any way to do this.

Somebody will include it in code analysis tools. I wouldn't worry.

That said, SCSI worries me. Some operations will have quite some
timeout. I doubt you can assume that a tape will be rewound or
a disk formatted in 60 seconds. Currently this is safe because
usb-storage uses a kernel thread you cannot just send signals to.

> It won't hit _every_ user, only the ones that ask for timeouts longer
> than 60 seconds.  I don't know how common this _is_, but it _should_ be
> very uncommon since keeping tasks in uninterruptible wait states for
> prolonged periods of time is a bad idea.

Yes.

>> 2. wait_for_completion_interruptible_timeout() reacts to _any_ signal. Do you really want to abort for SIGIO or SIGWINCH right after urb submission?
> 
> No; this was merely a simplistic first stab at a solution.

Good.
  
>> 3. The error handling is broken. You cannot tell a true timeout and a
>> signal apart.
> 
> Correct.  But considering that the caller isn't expecting to be
> interrupted anyway, this doesn't matter.  A failure is a failure, no
> matter what the cause.

Well, no. If the failure is due to a harmless signal, you should retry.
If it was due to SIGHUP or SIGKILL, you should die.

> Would it be more acceptable simply to reject outright any calls with a
> timeout longer than 60 seconds?  Perhaps along with a new API as you
> suggest (although I'm not sure that it's really needed)?

That would be a clean solution. We cannot let user space force an
effectively unlimited uninterruptible sleep.

	Regards
		Oliver


