Return-Path: <linux-usb+bounces-23702-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB2BAA8F8E
	for <lists+linux-usb@lfdr.de>; Mon,  5 May 2025 11:28:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B944116FEB4
	for <lists+linux-usb@lfdr.de>; Mon,  5 May 2025 09:28:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38A701FA85A;
	Mon,  5 May 2025 09:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="UdnRWqr7"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4C0D1F91F6
	for <linux-usb@vger.kernel.org>; Mon,  5 May 2025 09:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746437267; cv=none; b=Doo7nyr/1VY+lc0k052wd+ug4Z3wKdsMPQLgvClAp2PMtT46cJEW+K+FADIjXbiLSpahnZd+wKy6K/82TwuxIpBMLzuQRbnyH4aBjmuHpFr2DTVumDYbu48wCoHUkbDHAVMAKWFVf2rWcSAed9SqVRQLsmvaOGT+NO7V315ziec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746437267; c=relaxed/simple;
	bh=3jX604FanuFDaqkGWbGqK0JZcZwbga8NVI9leIHnWPY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ESfs4B6llZLjMPYwRlfI0F1sN1NHkD9tLUKSUksO2MZ4SRrbYSfHduJ0cL48Jr/Jdei0GhFaqsxj/XvNCUdmd30Y7FRexNBM5DTu1c2zSoLwIj1LQ37vuKuCe6m1pF4iO6vsSGRMKDKcC9fySVYsRXuinkUNkPu4obLDxm9TXAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=UdnRWqr7; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3914aba1ce4so2716848f8f.2
        for <linux-usb@vger.kernel.org>; Mon, 05 May 2025 02:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1746437264; x=1747042064; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JYW03fTYuEq7AryjtxM0bsAJz2Mlvpu7PSc3uUmqKRs=;
        b=UdnRWqr7XHQ4EMQ5WLz5aHJ2wLXbX+HLjYi+aIxxHcpQdA1UNQMULMi/2VRc23xKNK
         QmDIM2OcUuHzMhMaTcZgJzf75jv1YePJtJ7XuhEAASd50zcB/kbL95LL8IPsvSMQg7h9
         y5CsJNPh8QsL8ATNICf2wPxO/UGfgpm/UDyhQJbo6EPnit/+4yLsItpM3p24IAvbECqa
         iZrLAXfJH4oIzNg05e9avrzfO3yjw6bN5+NepvmtkyGF3aIXb+VcHxe1IRU0y8j8+aym
         xyX3ce6OfYTzLN+iLI9avaMc8yMnec9zaGN1iAYMJJmPjJGOBqnyhQ9G2CICIvIUQ+IR
         u55A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746437264; x=1747042064;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JYW03fTYuEq7AryjtxM0bsAJz2Mlvpu7PSc3uUmqKRs=;
        b=Fot8FS0NcWlbyXhSSj9QbkITY1wKbDBzvGGawKY89pnlBp54FRky7spTUTv2LD5az8
         BbOAf833CeSVNY7IJPA/A9Qygzj3tZvq7yqtQfKSaYyj9gnQXJH8/1v0V1BbiEc+Tr94
         Zl8ZoO5DRmb1vCP48QU1LQay+qwvMZAUnhKVvmU6+ZicxiMt6cvFTDMbHTjRhmpGZpDs
         hiAadABcBc7fws2RcfjYS5R0RsXZ8IGjRv1B3+24Wu6BtgFTrlrk64mMxk/ujrHKrXbb
         +XipfLvnOnoDSp5IQFT9+Wz+CcY2+TVe5lCcBO/Z57He3RYxemCg4aWaC29lDa+Zk8gV
         y4kw==
X-Forwarded-Encrypted: i=1; AJvYcCVr5ZwBMljWuvFXfcTN3vaODRyk3XuD2r0kYGd+rDg23BA/jZ4lgSPXC9nj5KulDe2VGZuZWqva+yQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3WCDTzlYQvqEqdTIe9V2MuiBn5D++2Z4JZv67EUKTa/j+/kT6
	VR/qMSXiJ29zPt8Tz9Pj8oqGeCPrASBj16klS1uQLPzZDsDkx21Ikmb3soi7X90lpBsiYxq0L/J
	a
X-Gm-Gg: ASbGncsLltAJUWZqgCUSWGW1c7qDR6xaHIIBjPO0/fw6vgr/OTGJK307XREN4jBW090
	rR0w3euJXZ1bTsVx76xu1MF5GsGcI28GTLDLWPfwhblIQggaAAnro+fbDB/s4ZjnZV62k7/sRq2
	cUhWk6RkIeD8blI75f08eEsnR/rvMe18axWAK2S6PMSa50cO/s7XEj/r/BwfCkBml9dpa/RXlT+
	/xWfy7qKIt1BsXJtFakbAexCdM6Klw7QHzj8llq4NTKxFr6EpDcT+WwI8zJnxOJi0ktcloETJrl
	W3UkyVn1/yMaSLBtjy+uj/wlZpDp8xl+rRxk6AxDqvWD70xl9FDKsYYdjJ3l4Qk4sa+gnl+VE6X
	LIZEv75CZ++6SbvY=
X-Google-Smtp-Source: AGHT+IE4C+uFf8nwpieJ/ppRlVea/tuO6XKRqmX8vKpQJo8rsgX/COY68YdGIQeqwZusyTbAzwwwTQ==
X-Received: by 2002:adf:978b:0:b0:3a0:a1ac:ab61 with SMTP id ffacd0b85a97d-3a0a1acababmr3297211f8f.46.1746437263899;
        Mon, 05 May 2025 02:27:43 -0700 (PDT)
Received: from ?IPV6:2001:a61:13f1:d601:805:7ab9:b435:bb18? ([2001:a61:13f1:d601:805:7ab9:b435:bb18])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a09a002899sm9402437f8f.0.2025.05.05.02.27.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 02:27:43 -0700 (PDT)
Message-ID: <93a06992-a2b5-4bd1-9b47-34ac1c22563d@suse.com>
Date: Mon, 5 May 2025 11:27:42 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Bug 220052] The usb/cdc-acm driver uses memory after it is freed
To: bugzilla-daemon@kernel.org, linux-usb@vger.kernel.org
References: <bug-220052-208809@https.bugzilla.kernel.org/>
 <bug-220052-208809-jl7U1mNoGr@https.bugzilla.kernel.org/>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <bug-220052-208809-jl7U1mNoGr@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30.04.25 14:56, bugzilla-daemon@kernel.org wrote:
  
> Exchanging the 2 lines as indicated in the patch solves the problem completely
> and the kernel panic is not seen anymore. This is proved by 7000 'virtual'
> disconnects.
> 

Yes, it solves your particular problem.

Now, with your patch, you first call
acm_submit_read_urbs() -> acm_submit_read_urb():

res = usb_submit_urb(acm->read_urbs[index], mem_flags);

And then you do

+                       for (i = 0; i < acm->rx_buflimit; i++)
+                               usb_kill_urb(acm->read_urbs[i]);

In other words, you undo what you just did.

Your diagnosis of the issue may be good, but the fix is _not_.
The purpose of acm_softint() is to

1. kill outstanding IO
2. error handling with usb_clear_halt()
3. restart the outstanding IO

You cannot reverse steps 1 and 3 and expect that to work.
The issue must be one of refcounting.

	Sorry
		Oliver




