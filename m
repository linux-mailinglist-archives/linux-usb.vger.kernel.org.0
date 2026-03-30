Return-Path: <linux-usb+bounces-35655-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2ED1BShMymmb7QUAu9opvQ
	(envelope-from <linux-usb+bounces-35655-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2026 12:10:48 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 82EA5358ED7
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2026 12:10:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2C5C13051481
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2026 10:04:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A669C3AE6E1;
	Mon, 30 Mar 2026 10:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ftpi9k6W"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0BAA387589
	for <linux-usb@vger.kernel.org>; Mon, 30 Mar 2026 10:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774865057; cv=none; b=ttVBDkAoe2IJJJDkU4PDoAte69Dfb9uyHyrMjZa7sid3/sza6zieqBARPcw1ax/Xf8hM62AhJxthuaup1OpMVUC9mEsRZ+J43p9FZ1LoICNn2DdpBZzpfqS7IOEezPs3bhZlOLB4okCUxrKkLd8EqM5ZQ7qzVC5p85S0jGphwIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774865057; c=relaxed/simple;
	bh=uH/NmviRSRuCjebF29zZBAhv/ro5BMPV7zHX1Uxvtxk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Bt4zpVr1QSX174l6y4H0YB31tYYXDz2GHZp75OCDzv2JA0tSUZE2ka0BXaYh1c8J07ONe/AaSPwHO+tKz86oGqZ61EI1sGZUaaqzLUUmcQQG6LYesJ+die1Hg0kybaeVcb1BaJ0Gfd4uhuu2PNTxDe3pw/bHcGXY1zgLFqwyCms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ftpi9k6W; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-486fe36cfabso26075975e9.1
        for <linux-usb@vger.kernel.org>; Mon, 30 Mar 2026 03:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1774865054; x=1775469854; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GQLBjc1WbXzhax8cFQxYR+uL+sR+hm70zQTjsd/nOVU=;
        b=ftpi9k6WQfpIjlxMdEotAkk503NZAxCBGrVJ2wcU73hgzEHNcMvXPkCyQBd0Hwa4/i
         3rI5Sx17dUrN80cmu98IPNb0gYJnLQTSIqHjt7g8M44SjPVJLe6kZ+bO/N+DEVfH5UTA
         drJG8WzVMM5Eg+UrdushJmAxqyy8P0Z6+j8/Mbia8QCZtJK1h7RVmt3CDKKpZz968CYq
         1aEGl4fQSUEGvt79AWUn6GHERR9+sazGYA6gi2GSe820eMkBLVuIuiv7oNl629+hO2ML
         6ohzo2pVMDtMYgabOozmIgntXq1hufKDdxqEsN19L/+ZwPFKhazfKPKbGeIqMHetRI0c
         ZQJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774865054; x=1775469854;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GQLBjc1WbXzhax8cFQxYR+uL+sR+hm70zQTjsd/nOVU=;
        b=b2GsNu+LCvyJM1FxVTvKBbJsZ1tyRGzfNrRSfk/buxRbkSlxnAOcvBDKs8lbc3q3Cd
         Z7nyhGknSo0+osmsHFdn8OqnbmNC6xgad3FR3ktQ9yUG1DlU7+lG+RkIKFZoa8xs1Dko
         p7F9UdTq6/65Kp4mepvKbjmIyAgUn7ws15dtksTBDlPT1WEuinXuC8zkJfxx9XnRL3Hc
         CvpbWFZzXo/Zoe/94ecUbVxBWzpjjq5g5PYsRjmo8uAqRZyTgmpl3z/+wySGUe+E0NVx
         YAfTdT39boxHvhkMdQveaaZJiDPNMyfdL6HYn4E4eZTE/6/T6IahK3jtbXSIYI61zy19
         2+tA==
X-Forwarded-Encrypted: i=1; AJvYcCXu4ekyJM4GHG+enfr9nD1WsNma7YfEOyO1xM/zc2aBQvvb+eLnhqr6HMlbbcYGIVTOnQFHGG611OE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyR9DXiGQh5Nj3vBl5Rw07LP+Zg0YJu+767fXUYo2fZuv3EgFCD
	OJ3gvETPEdvWjddL4FADUNT4RIYDyyESE9p6OUTMsfbiTCUD2bN/wXzbKG209B7GZ+I=
X-Gm-Gg: ATEYQzx6VXrYRKU/Y/g7SZmPN3LX5TKtAmuodGgv6tS5rX27y9f7FCjHhrahbH2+IqW
	gi/ro0rSI5Vs+UURTjghAcSnICMORauByZSZKUc2x6KcWVC6c1qFfmqyDavLZIxaBEwpe/nWCjk
	XugwrvNfEpTxhfuSNj0GZ146xATDtx8wuVVzrQrzlKJR23uRDKer30/TdDy/of4rRks8yu69elA
	wtUsOdksN56osh+sNT3ygZS22zucBnPHuIO71dXqHL9Now0v3dLOlACSAx7qkDFYj8wEwcbp1kS
	RfPyiUydNPKofKAK+IWupn2gmNrvuVErdJAy2+bs1PGuJt2ocTqmM6rb2Fd5Zj0qolghl5MjvoB
	kVWHiUR5kBzZ2ifhU/my+RSkQskXfjqw3+HRfvdqVhZQzgZxsjaAO/9NuvEStBVSNRhpGrruBUQ
	1vYa4we7IJNSMLbZBEfHcKsppYM081p82Zo7zAhAfBc6q7YQZDABHcExvZBG6NOb4+AQ==
X-Received: by 2002:a05:600c:8707:b0:485:3c2e:60d5 with SMTP id 5b1f17b1804b1-487290a9c71mr165850895e9.2.1774865054049;
        Mon, 30 Mar 2026 03:04:14 -0700 (PDT)
Received: from ?IPV6:2001:a61:1373:4b01:cc61:7bc9:bea5:a415? ([2001:a61:1373:4b01:cc61:7bc9:bea5:a415])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722c6b4d0sm263867785e9.3.2026.03.30.03.04.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 03:04:13 -0700 (PDT)
Message-ID: <7ae48e14-0228-4bd9-91df-306dcd12896c@suse.com>
Date: Mon, 30 Mar 2026 12:04:04 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] USB: cdc-acm: Add support for second ACM channel on more
 Nokia phones
To: =?UTF-8?B?0KDRi9C20L7QsiDQpNGR0LTQvtGA?= <symansel@outlook.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
References: <a8008c91-52c1-4a5c-ac96-dd45f109c68c@outlook.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <a8008c91-52c1-4a5c-ac96-dd45f109c68c@outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35655-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[outlook.com,vger.kernel.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oneukum@suse.com,linux-usb@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,suse.com:dkim,suse.com:mid]
X-Rspamd-Queue-Id: 82EA5358ED7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Fyodor,

On 26.03.26 15:37, Рыжов Фёдор wrote:

> This patch extends the whitelist with all S60v3.x and S60v5.x phones,
> supported by official "Nokia PC Suite" driver for Windows. Device IDs
> are taken from its installation configuration file. Older S60v2.x and
> S60v1.x devices were not added because I have no hardware to test.

Thank you for doing this and testing the patch. One nit.
This has two IDs for the same model. This looks like a typo, even
if it is real. Could you add a comment to such entries?

	Regards
		Oliver


