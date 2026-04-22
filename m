Return-Path: <linux-usb+bounces-36414-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2AUpOnps6GkSKQIAu9opvQ
	(envelope-from <linux-usb+bounces-36414-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 22 Apr 2026 08:36:42 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CE40442788
	for <lists+linux-usb@lfdr.de>; Wed, 22 Apr 2026 08:36:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 30DC13027136
	for <lists+linux-usb@lfdr.de>; Wed, 22 Apr 2026 06:32:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64858314D18;
	Wed, 22 Apr 2026 06:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ssiSkdJW"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E3E12E2663
	for <linux-usb@vger.kernel.org>; Wed, 22 Apr 2026 06:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776839549; cv=none; b=R7FwF02fHfS3k3+G+0dwKSnrHo0HbK/cHfy76yt4V4WqcPFdTZUn3I2/PcToSpV6qg4OLmOJLJACgbz18z/WCu1v51WK4coC/9UlnoU99aJVV8FrlAfufLDyobANN28mLzn4ulIJ2B4yp0yJlqGiVYWjImJql0MtXeJp7RI3whY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776839549; c=relaxed/simple;
	bh=3iOyTR/MublZ4bNRrzWq8mXLj6V5hKH98v5xaj+esQU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=goxgJ0gbr9OO/hsen3L2VMuQ1vPjt4WhgDjdEpvgFyi5sj2ksn3mWpxq5xq7BHvfFqGrYu/Dc1HJB3EsgBBnNQoT+uk/Q/WDO/ss/ZpemxAJNVbnxGpyq25TkO2jjvqYd0TWzHQfiUkM+vfh7JHQHkcMKFH8jk+LunqpIb5USIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ssiSkdJW; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-38e91416cc0so55026331fa.1
        for <linux-usb@vger.kernel.org>; Tue, 21 Apr 2026 23:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776839546; x=1777444346; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TOqXVDelbvAoyd3d9KoHbGtT5EJ76+AAF0dA5yLn2vs=;
        b=ssiSkdJWd8FTpc1w8Ura0zfdrpqCNUWwcfXODSRoyUoJ4FUOjtTB8yEXQRyRgvv4KJ
         Ev00SGCTEb/ZfprnFZENhv+flGpPds049/SZlP8sEvQHejvAWyZutfnJ1NEkP09+Ope4
         /YDF9enkPywt4qD3dPYyEMh1c2MZgf06oMtGI3LDokXrI8FNRIDDwVnmXHRtholDBrkB
         /AfJ2XIyOc7eZ8Hy5F6826vqIh2lQcfYvawXCreuvY8aUNK5PaPZknJzkmsLNSyKNhc1
         T9l98iA6H1F7lFsT9wBjhAbJiBXa0rE1ezf2J6GApL/WcBmuYoTR8EmH8GoiM9Jt+4cq
         QKUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776839546; x=1777444346;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TOqXVDelbvAoyd3d9KoHbGtT5EJ76+AAF0dA5yLn2vs=;
        b=oxgxVh69UJ1O1vwgxYy2J1PPVCedYEoYCK2IZpXekCteIftrrhT1k9SA91pKtU0gjV
         WFPcIe6v/l7IZrJ6r45N3k7wvrDkBJ6LpnNyiQXVCuZUEW4bMm+b6CcWy8L1GIm/UDeF
         AAX9CQ6NR5nvzJgBCeFkR2ztxTt0jPl5iaRjUozEQA3QwWZuR51MHjHFWRhjGXKen393
         M03gUGSSYSX+zHxjVk5I2gg5zGE+04G29NSwvCWdLLz3GGK6A2fAfzBFH7jbfcajzyS+
         ZDHqUmrKIxpNLZjsul7nwn7Dz3IDuLZQorOXwE+TAfGSUukQl23m5/0MoezAITU4Kj4V
         +DUA==
X-Forwarded-Encrypted: i=1; AFNElJ9dUBEC1vxbFLAXwiPAeg4WOFeTVlgXS4DOoyTcFHAJh4DAOxTxxcOPPy6SaG06jtjJcnKdnLKyu4s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5N1f2oaTHWnDkiQ9FjqyOoIpu+b7+1pEubNCewDxKKIx62Gph
	R5m5IE2WWNjmiCP5H08SoVq05fso7YHc9PuqHVh5IECF9AxoPnbJD4Jv
X-Gm-Gg: AeBDietvGDjA78py6o5Bho0DOof8aTg4kQsVppmq4B163oGEx7K7ffs3W0fm6WADcbG
	sGcx6oUYE+mYWmWjvp9NHRcBzElgOXlAIVO8Vhgd5Ds8qjphFWipViznFhev4f1CzuQFHEtDYeq
	b6OzhlXNgjJp7MN7nQbCXERHgiAQdfn7IpfFxQnZ2/MkakzJi/8hcL4q3iAdpkK9JJ5Bnb/M46s
	dTNjmy3tAodcKVze/6jxO2gbA1VYBAIRnVirqF8TaXrEaiT3Ek6Sp9rGTq5jyYNnZdb35yCG5X6
	EIr2bKykYhkX1kEpihSw2UBLjBRnR5H+JRJQCM9ZalV+ZDe7UosphPzMjChTw59QX3NNJP6pmQD
	VMCyPX506dmY3prEsSONNtiWbYRN/EcQhDW92isrPJGIbkuYCZ7EgnBkX50VY7PGhcxph9sZNvD
	jmsaQheWrGlDTB2d1UmElAqzpV23lV3vyGMcbyCZso+pQ=
X-Received: by 2002:a2e:a494:0:b0:38c:c0de:d58f with SMTP id 38308e7fff4ca-38ec949347cmr49949991fa.14.1776839546202;
        Tue, 21 Apr 2026 23:32:26 -0700 (PDT)
Received: from foxbook (bfh75.neoplus.adsl.tpnet.pl. [83.28.45.75])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38ecb5f65absm33791991fa.11.2026.04.21.23.32.25
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 21 Apr 2026 23:32:25 -0700 (PDT)
Date: Wed, 22 Apr 2026 08:32:21 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: "Xuetao (kirin)" <xuetao09@huawei.com>
Cc: <gregkh@linuxfoundation.org>, <linux-usb@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <caiyadong@huawei.com>, <stable@kernel.org>
Subject: Re: [PATCH] usb: core: Fix bandwidth for devices with invalid
 wBytesPerInterval
Message-ID: <20260422083221.5b5e4a48.michal.pecio@gmail.com>
In-Reply-To: <20260403091621.5a685d6e.michal.pecio@gmail.com>
References: <20260402021400.28853-1-xuetao09@huawei.com>
	<20260402114421.738e375a.michal.pecio@gmail.com>
	<85ad518a-f87f-4ca6-a11c-1ccc37d60bd1@huawei.com>
	<20260403091621.5a685d6e.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-36414-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michalpecio@gmail.com,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4CE40442788
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, 3 Apr 2026 09:16:21 +0200, Michal Pecio wrote:
> On Thu, 2 Apr 2026 19:55:16 +0800, Xuetao (kirin) wrote:
> > > Any other examples besides AX88179?    
> > 
> > We tested 18 different USB 3.0 docks, but they only contained two 
> > different types of USB 3.0 Ethernet devices based on VID/PID.
> > The dwc3 controller works fine with all of the devices mentioned
> > above. The other USB host controller works fine with all 12 Realtek
> > devices, but fails with all 6 ASIX devices.

I think this issue hasn't been solved yet?

> > 1. Realtek USB 10/100/1000 LAN (12 devices)
> > All 12 devices share the same VID/PID and descriptor values.
> > 
> > VID = 0x0BDA, PID = 0x8153
> > wMaxPacketSize = 0x10
> > bMaxBurst = 0
> > wBytesPerInterval = 0x8  
> 
> My RTL8153 has this endpoint for its default proprietary configuration:
> 
>         bEndpointAddress     0x83  EP 3 IN
>         bmAttributes            3
>           Transfer Type            Interrupt
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x0002  1x 2 bytes
>         bInterval               8
>         bMaxBurst               0
>         wBytesPerInterval       2
> 
> which should be problem-free, and this for its CDC configuration:
> 
>         bEndpointAddress     0x83  EP 3 IN
>         bmAttributes            3
>           Transfer Type            Interrupt
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x0010  1x 16 bytes
>         bInterval               8
>         bMaxBurst               0
>         wBytesPerInterval       8
> 
> The CDC configuration needs to be enabled with a patch, I'm not sure
> if there is any other way. It will then use the r8153_ecm driver.

I have done some experimentation with RTL8153 CDC configuration and
found that it responds with 8 and 16 byte packets alternately:

# modprobe usbmon
# cat /sys/kernel/debug/usb/usbmon/0u
# ifconfig eth1 up
[...]
ffff88812bcc1600 364545038 S Ii:11:007:3 -115:128 16 <
ffff88812bcc1600 364577011 C Ii:11:007:3 0:128 8 = a1000000 01000000
ffff88812bcc1600 364577037 S Ii:11:007:3 -115:128 16 <
ffff88812bcc1600 364608979 C Ii:11:007:3 0:128 16 = a12a0000 01000800 00000000 00000000

I'm curious how your HC would treat this, because technically it should
interpret the first packet of wBytesPerInterval size as a partial
transfer and continue the same URB in the next interval, then complete
it with babble due to 16B packet exceeding both wBPI and URB capacity.

Other HCs work like that if I do the opposite and reduce wMaxPacketSize
to match wBytesPerInterval.

We would need to perform this alternative fixup for devices where
wBytesPerInterval is correct and 16B transfers are sent as two 8B
packets oven two intervals, while wMaxPacketSize is more than wBPI.
I hope no such insane devices exist. Currently, they wouldn't work
on the vast majority of HCs.

> > 2. ASIX AX88179 USB 3.0 to Gigabit Ethernet Adapter (6 devices)
> > All 6 devices share the same VID/PID.
> > 
> > VID = 0x0B95, PID = 0x1790
> > (a) 4 devices:
> > wMaxPacketSize = 0x10
> > bMaxBurst = 0
> > wBytesPerInterval = 0x0  
> 
> This looks like my AX88179 and it's obviously broken.
> 
> > (b) 2 devices:
> > wMaxPacketSize = 0x10
> > bMaxBurst = 0
> > wBytesPerInterval = 0x8  
> 
> But this is odd. When I use mine, I see that the driver submits 8 byte
> URBs and they complete successfully with 8 bytes received, no babble.

My driver submits 8B URBs because my AX88179 has wMaxPacketSize of 8.
On your device usbnet would submit 16B URBs. So I'm curious, how much
does your AX88179 send in response to those URBs?

Regards,
Michal

