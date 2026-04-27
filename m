Return-Path: <linux-usb+bounces-36533-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6N0zKYE672mD+gAAu9opvQ
	(envelope-from <linux-usb+bounces-36533-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 12:29:21 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id CC202471071
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 12:29:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3157A3053C8D
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 10:15:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C6053033DF;
	Mon, 27 Apr 2026 10:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Xyatviqb"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB1B62D47E6
	for <linux-usb@vger.kernel.org>; Mon, 27 Apr 2026 10:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777284941; cv=none; b=gn0mmbzhGq7znLRPfoq+HbqryJbCAqLyndQbh7Q7tWJaeCFcMdeGEWcFPYrfqHBy3ntBXTir9ZC5Sn+IOl1Wp58m/Ng/lKTwvlmkOHTqCG9biMoW47WL9smz1wE8nbtDU0sMzJDKdpaJvRamrm0+OwSKlsxTDciolvG/h9ql8Qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777284941; c=relaxed/simple;
	bh=8jTu49iz6IBpTQItRsr11bVuU5O2FOpxpCI+5fKHEeE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=KRPMrQ4bDra+3jcklxTY8bV8ANHOwdlR+OK+ZoPyWiUwBYXv0U0LUDefo5i0jCe8OvWYsacuyzNHxWCPHL8iLFlRV5Hgowh81CAAztXVZ+69v//DRl/ruUbPdSjsrtnwDLgLI9g8PHoYkZiTwkUHaaF1lByne4PKSoIjPaqcf0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Xyatviqb; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-48a563e4ef7so67225595e9.0
        for <linux-usb@vger.kernel.org>; Mon, 27 Apr 2026 03:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1777284938; x=1777889738; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KcvR6qvlBsd3cpkATRH/21SyAEC3BG6xenzbBbgiUgQ=;
        b=Xyatviqb5Zhjwzvi9WJHbPgMjWsWH8AwFsbJKmljoQznlq81oIBR3Zw1G3t3c4uM1g
         VdL3VVubcbLV2pu1gPLdLNlU4rT/NJf4XCRlvP30mq67Y3Px9C7Rf3Pi468n2rfBJwQm
         7I84mSGTCYFuoalrbaA4lBkW40R29nMT8r1XAIGR11tRUJLevZyQe+3fsr+JoCwd/ceP
         ju23Krz1oLYyXkmst3yk0ENEJ7ayClDLgzulVaIeLc5Y0bg/MMfsP5ztj6LXlhw5xtBW
         J9J/iEMLFdHvEWXM30qhN1rtQgBXCw2Jnawq1AtAaUnivOT5wenvDr/oCZCcArVGowLZ
         PEeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777284938; x=1777889738;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KcvR6qvlBsd3cpkATRH/21SyAEC3BG6xenzbBbgiUgQ=;
        b=i4lTH8TegQr+vbHdk0s6Osh9KFgdOrZgKzQXkaa/IMZ6LcBrZWM35TfrdECdvxw96c
         0kfsED/Gnu9cZxuqySpvHXpK6fmF0mYXZfDjQFIGpXh9LfwHs9hf7ZfFMPjjfiwnUBww
         t0T4cZGF0JHQb5RCoQjM3lJAqwhkW+e3BHMYI7VcHgIYIaVP3fzPrw7ZFzk8C62xNAsa
         EvnYcTCg09XwjaIzBKiZl2kBNaSEfWVkK4b+BDpHXt6QX1d69lbuau/TY5DXpxcbr7OF
         hgPYYRIPSv2+6sG+hPE9pbbmN2C9sV4tWm2rIA3UGJx7nRUtOT0+PL41hxvDsBmtBOzt
         FHGQ==
X-Forwarded-Encrypted: i=1; AFNElJ+gMf/g436rMVdZL6QAcIxNe5tOSLcLUQFtAnNQpsNTO3/vRAVcXN5Qy5g2OT8mFLJUE0hlo5l17sU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYbMZROv9TZ5YwNf2U6nRC+imYgOyhqIyDbbE6U8Ym3C0WWPIs
	1i6yMldIJumR0jca3CsxQTAOyD+2IBX/aYWI7AQ/P0QdqIF+jKOuZ+OOCBfo61MLh5M=
X-Gm-Gg: AeBDieulQpl2VKowsOKvd2kxG0SJbYlHR7B5qRHif9GrjkPeMGfZUGPhIfxh5YynJj9
	bV1YQ/mnzz5SpNhg6r5CoL177/OPJWDecGLusSJmXlbvdF/mwRm5BePf4FUr0aiguofyegFP+SN
	ETxTrtu9uVf/omXV4pLPEB3OD5d62SUcoau92erWkAH3+UUlalfOu2EBGDSJqU5XXa6s8vCskv/
	CO36qrHMVzFDHitYP7gB2p8WCNkzLC4HsSRS0CKvU6AFTGqMsCqyzdKev9itByDwuFsr96IzDGl
	S/iZFjfAmOXfMGBRLUAhI/UsyZSs+1M6TlAkO+wHMO9+NJSqJ0Z6mvMtWgiZ8beQGbNV83PGrLx
	fK2j30bGiYeCfTi51zhoeJKesgyXnOIG/+y74IC+dj4twqMqSdaoJi4qmbt+R6VAGVKIMgYt+d3
	RzezWFQpcDycI0uT5ELIPb/O2hk0frFp7MuwntWwo2vG6YIenKXCRWlhq/9YI7R8Oh0xnu8z+zt
	xZKE6+jZeT4fyg=
X-Received: by 2002:a05:600d:8496:10b0:489:a4:e555 with SMTP id 5b1f17b1804b1-48900a4e79fmr345782565e9.21.1777284937834;
        Mon, 27 Apr 2026 03:15:37 -0700 (PDT)
Received: from ?IPV6:2001:a61:1391:ac01:103d:ec76:dff7:ee6c? ([2001:a61:1391:ac01:103d:ec76:dff7:ee6c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb735d3dsm558718455e9.2.2026.04.27.03.15.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 03:15:37 -0700 (PDT)
Message-ID: <0187af02-0a4e-4912-9c85-f572c7b35fe3@suse.com>
Date: Mon, 27 Apr 2026 12:15:34 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Bug 221340] uas driver hangs and causes usb reset
To: bugzilla-daemon@kernel.org, linux-usb@vger.kernel.org
References: <bug-221340-208809@https.bugzilla.kernel.org/>
 <bug-221340-208809-vduRPUcPTW@https.bugzilla.kernel.org/>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <bug-221340-208809-vduRPUcPTW@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: CC202471071
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36533-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oneukum@suse.com,linux-usb@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,proton.me:email]

On 26.04.26 04:54, bugzilla-daemon@kernel.org wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=221340
> 
> --- Comment #16 from DaisyTheFoxxo@proton.me ---
> Reaffirming that I would like to try out the patches mentioned
> 

Thank you. They are about to be written. A few days please.


