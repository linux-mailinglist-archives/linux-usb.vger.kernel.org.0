Return-Path: <linux-usb+bounces-37649-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iGH3KNebC2oXKAUAu9opvQ
	(envelope-from <linux-usb+bounces-37649-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 01:08:07 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 203B5574E3D
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 01:08:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1D170302261F
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 23:07:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1EE7319847;
	Mon, 18 May 2026 23:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DzhwPjMl"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E11103090E2
	for <linux-usb@vger.kernel.org>; Mon, 18 May 2026 23:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779145672; cv=none; b=G+DVs6BXgsqvV87QgX6KCr3Hj2Dx0zyQ7i5R6RVJOpi9jbXJ9JuoY9Z5LAug/Hf1IiskAfSjGVv7bCHbYcK0Msh4yMCPUOJ2YN9yWSu1H5CMzuFsVtTNzNvBrBjjw4nciwrEtXRwm5VI5aTJA30vSvHmMbTNwE3lxN4U9c7FyBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779145672; c=relaxed/simple;
	bh=IQSkyfVnVv6hMYJ0XzeA/W2XMI6fDtbK2L0AxxeJkSc=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=r3z+XKXI4/izZHxWg4CnjbjkWh23i9wAe4sR8NlDUSOChFSn2uhuPjGe0yyvZbOnRak2lMoxqFlgg3Fk7QHhZSJowrxZbJJKmsV46z4h0av1t8g3JT4k3K5opmMldwqSoAmFOvHH9f2p3EOqeuwPeDFJnD6DOzGuwf0vHF076pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DzhwPjMl; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2bd2c147abaso16921755ad.3
        for <linux-usb@vger.kernel.org>; Mon, 18 May 2026 16:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779145670; x=1779750470; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IQSkyfVnVv6hMYJ0XzeA/W2XMI6fDtbK2L0AxxeJkSc=;
        b=DzhwPjMlWqz5efX1sMgxb2Vls98hT8VhyyClZRBRC3M4GT5mFpkf/w2LTj2j6/MAWD
         pmSLpJ33QG2EhmIgJa3fryQYzxq5ibxUVGjsaVVtIcyghjY1aojLp1duJynZFN8U/8CZ
         Fu68HuJ8BJ1NF7RJmXynB7c78S1gvClezbHO05wrBtmmdToLYbpZuTgNA7sSQuDKs89L
         30HFk0ZN0qyNJdbWTkbWmUEPxcJjo5vE0GNulDFSVKOsvcmcte6fYTR/9U+PKyjPjSNP
         CN1VvZkHYgB5fiyQwvSzQXCwVpH5nez3FB3sEXqPZ876Gxm/PXfbqj7jSlFXrDAa5jSb
         14UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779145670; x=1779750470;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IQSkyfVnVv6hMYJ0XzeA/W2XMI6fDtbK2L0AxxeJkSc=;
        b=M97+DjYIZY45SaIlPEv42ngaquC33pq3ZSf5nefq+eGta+wo3ZpAdgm26AE34udOF+
         FPy8N5yg9BOIoamJUV3lYACpPcoJ/eQXEAhCkT4imUSUxHtLT+oKbti0Zz3VGEKqunGi
         WchMvDhqyTZo8QGukisY5chSr5k8ICDA8nWVY1bGuFl2IvG6sdTuaqDIFVBgvWAJ0v7w
         YLKSjzOc8hSwskc6ijrV57VFLxvX1MMmqzO4JANaFTkQlHxCUbJuHRtgxF9MLW5ZJbaJ
         RSVu5hIwCUIoII30MywOJNwycarsuCJnDlNaMq65On98A3Lo9hVC+DrnGaAY3r+36GVb
         Mjmg==
X-Forwarded-Encrypted: i=1; AFNElJ8e4zpdpKjuKWmYlbFtqVtsQ4wCfTo+6aORxEZBT+RsrTwV6K3yw1yWo+y9WqmvVXLj9tDoJ5GTod8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwsSgaXy3huwE9FhpXamfws6xSeVPB2cDQWpDletj0d9DmvCQEz
	xZSvhVI3OCfdyff1oklPboB1mJjSgnaEyrMlGKpc/+MpXdZdr+mbdN1I
X-Gm-Gg: Acq92OHa3wuMTGJ/pD7y+4fP0ETbjPgZBekc/019el8mn0aEaRVfZe60xISV5+2J4NE
	wAO8XvHqt/VviueF0fo0ii5WgJrvcg5R7Rwc/gE5FKHJ9GtAKRZRR9pan2Z0kYNgQ4h0PTfO2AF
	e+8CDWj302EWPixWSLpHW/YrEt3bGGftgghfjHeQe8kl1u1DiGEfXXcQFBBWhfrivOfPjDkKSgu
	7xrjDpptGpiNG2Mf99COVT3zC4DLoHO7ZXK0cMxk6fiOc6bSzzw+JE3/lMQigLqMJHz/MzFPYdQ
	FCvnTMBcCCvwj3wHXBdAoRS11FAJannQ07GdDTewrwUk5H+gabkgxdU0SbZzYdOfjQ3c97HEXF8
	gq2Vxkuv2IFiQ9hDSHiw894X7zAOmjbziJiB45FtFu6MCUkOeYti3LgFzTYwAGLHsm5kPdJ5uY4
	jMaMxlCd6Ce1dTbGi9PW/icC4kK1PED5nHum/lIemaCLR/hSzu8X+4
X-Received: by 2002:a17:902:ef11:b0:2be:1eb1:eaf7 with SMTP id d9443c01a7336-2be1eb1ec68mr30387365ad.24.1779145670352;
        Mon, 18 May 2026 16:07:50 -0700 (PDT)
Received: from [192.168.89.2] ([119.214.48.64])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5d0fcb10sm161499835ad.60.2026.05.18.16.07.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 16:07:49 -0700 (PDT)
Message-ID: <79ee1d2d-1c8b-4d0e-896e-e9c09374053d@gmail.com>
Date: Tue, 19 May 2026 08:07:46 +0900
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/2] usb: xhci-pci: add AMD Promontory 21 PCI glue
From: Jihong Min <hurryman2212@gmail.com>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mathias Nyman <mathias.nyman@intel.com>, Guenter Roeck <linux@roeck-us.net>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>, linux-usb@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 "Mario Limonciello (AMD)" <superm1@kernel.org>,
 Yaroslav Isakov <yaroslav.isakov@gmail.com>
References: <20260517130407.795157-1-hurryman2212@gmail.com>
 <20260517130407.795157-2-hurryman2212@gmail.com>
 <20260517232147.34931718.michal.pecio@gmail.com>
 <144ec61c-4cc1-4986-a16c-7c1b99f3a72e@gmail.com>
Content-Language: en-US
In-Reply-To: <144ec61c-4cc1-4986-a16c-7c1b99f3a72e@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37649-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[linuxfoundation.org,intel.com,roeck-us.net,lwn.net,amd.com,vger.kernel.org,kernel.org,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hurryman2212@gmail.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 203B5574E3D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/19/26 05:30, Jihong Min wrote:
> It seems that these three functions above are everything that you truly
> want to add; the rest is boilerplate required by this two-module scheme
> to work, plus ID tables which must be duplicated and kept in sync.
>
> I wonder if a separate module is really justified, as opposed to simply
> linking this file into xhci_pci.ko when directed by Kconfig.
>
> The downside would be slightly higher memory usage on systems where the
> hwmon driver is enabled but not needed. OTOH, same systems would likely
> see reduced disk waste.

One clarification about this part:

In my previous reply I said that I could rework this either way depending on
the USB maintainer preference. After thinking about it again, I think the
current direction is the better one.

Mathias's earlier review pushed this series away from adding PROM21-specific
hwmon support directly into the common xhci-pci path. I agree with that
direction. The common xhci-pci driver should not grow PROM21-specific sensor
logic.

The current split keeps the PROM21-specific auxiliary-device lifetime
handling
in xhci-pci-prom21.c, keeps the hwmon implementation in drivers/hwmon, and
leaves xhci-pci.c with only the PCI ID handoff. That is also the closest
match
to the existing Renesas handoff approach.

So, while I previously phrased this as something I would leave entirely
to the
USB maintainers, my current preference is to keep the separate PROM21
PCI glue
driver unless Mathias or another USB maintainer specifically asks for a
different structure.


Sincerely,
Jihong Min

