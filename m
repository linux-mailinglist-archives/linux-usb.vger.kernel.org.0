Return-Path: <linux-usb+bounces-7075-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0280186726A
	for <lists+linux-usb@lfdr.de>; Mon, 26 Feb 2024 12:00:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ACC1A289160
	for <lists+linux-usb@lfdr.de>; Mon, 26 Feb 2024 11:00:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2EBF1CF83;
	Mon, 26 Feb 2024 10:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="aSSpRDgM"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA2861CAA7
	for <linux-usb@vger.kernel.org>; Mon, 26 Feb 2024 10:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708945153; cv=none; b=EOYiC6Khp9yhvtLYKj5qjMLuB6CNwQpgNSYS9Fcz2jMrPAegVzc742i5LqQc+AMZwAA0DnkM9kAdNQiN2phZ6VntCDyyoxFvVw8XKdhbfk2CuuYTXwqqX2fTnEGXbO16d3yzfNrlQZth1C0JJPo8Xf1/Ja7l96Y+yVqcivvrWVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708945153; c=relaxed/simple;
	bh=BXcYHfVzTPws/Xz1eVKZjkKb3L4dkosZD8GZ96eOQ+Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=KtPq9LjuaeOwheVQwNBnTX2NPbUyJvV2p4Nivs6SeHh3H1K87I4TyhUIqqk5BdgciAOxbOTJiGiYnQsR1w6JScbmdk5m78sNAaPoLg8oyHYZ5jolKIlI1pyapX6NeRpTzWcCAQZ42hWZSHRomCrAkjW4Jp0TRsImNMMz7DM2EOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=aSSpRDgM; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a3e7ce7dac9so316735066b.1
        for <linux-usb@vger.kernel.org>; Mon, 26 Feb 2024 02:59:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1708945148; x=1709549948; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RLz2UG7iYBlQjZWsuoaSDjycNBdnd5B3AGu3clJ03m8=;
        b=aSSpRDgMNMNC+n4lM4X7+LXbQBJVXazsg39aNL+wXeHKAkSQk6U3HOjaGlCgC8Sdo7
         8E+bq+LKnRj6c3OVma8zRun44wDjnCg0b7CgQysxzM/D3CawhgYjfcRaCojGaXWx2HU3
         hcEniOcULXQIyPEuytVAHlkYTSTng/uKh12Zy5yRRaKbM4npNyEeE0JWBna2rL1CCvdJ
         HQ/UIrjLiVQQOSfTuVlSDAxtrcKl5YyV+gZBdRxJjCCeo9jBaOv8jnUN8RHU2xamuJ0e
         x6MQtKiENSpdSdou1Yawz3NQmZM6+saLmaJQYy9em0rf+WLgbscOn6J7fIcSfm9X1cCH
         me/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708945148; x=1709549948;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RLz2UG7iYBlQjZWsuoaSDjycNBdnd5B3AGu3clJ03m8=;
        b=ElAxrwOTuHkXPITrdNz8yD4JxUqacJ4wqTg9/DRRUhbDaDkQQMBp2GsNI1pNYrNv/U
         4MeNxFYNyQqvXn2CG9xzfT88IW6ScOWiMoxqH0LoW7lqVnt5cvc27guc2ZqqyI7CSHzd
         A130DG2z2TdMctVNX1ggR3mpJdMKroFpevzF/gMorielaPdn+gud72oVkKyP/BNtJC0L
         dwb/aM9PS8gmM6A0gai2gGk38xMwXewrHgQu4YoLQJ15k3VntMbl3d5K0Y86gYc+C7MR
         b8LgWyLzsupaaUqQKnxMeTdiBTDTi7q5Dzz+WQ8pjl/kB6w3WYir4SQHdHAZS1tV5UWh
         g90g==
X-Forwarded-Encrypted: i=1; AJvYcCU0V1bsPEbQdW/P9c8RFpNLFU4unfBpHdyHVm6TRPahHSksSQuqe4SPavLJW8IZgjQoAEKZbtwMtGanGpQc5iMznynxyHYtpwLJ
X-Gm-Message-State: AOJu0YyXxMGUxSnQRkWfERE8HaCzQJu008jVqVdoqeXqzdWIq1tlGk8j
	Wvd0GTXc4BF78SPZsGNAxFnM+ck6WzdP/TFBYhyPPiKF74VxWitiHeWsKcunIbM=
X-Google-Smtp-Source: AGHT+IF6uROkTpq2xYNeB24qIs65rL7KrNZuV3oYdgDF7LxXyHDZxyyt+d9Z4xgzeKdf13uH8tY0aw==
X-Received: by 2002:a17:906:3590:b0:a43:393c:176d with SMTP id o16-20020a170906359000b00a43393c176dmr2035525ejb.20.1708945148074;
        Mon, 26 Feb 2024 02:59:08 -0800 (PST)
Received: from ?IPV6:2001:a61:1366:6801:d8:8490:cf1a:3274? ([2001:a61:1366:6801:d8:8490:cf1a:3274])
        by smtp.gmail.com with ESMTPSA id tj7-20020a170907c24700b00a434dec771esm852555ejc.217.2024.02.26.02.59.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Feb 2024 02:59:07 -0800 (PST)
Message-ID: <99b0fb1b-37b3-4da4-8129-e502ed8e479a@suse.com>
Date: Mon, 26 Feb 2024 11:59:06 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [usb-storage?] divide error in isd200_ata_command
Content-Language: en-US
To: syzbot <syzbot+28748250ab47a8f04100@syzkaller.appspotmail.com>,
 bvanassche@acm.org, emilne@redhat.com, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 martin.petersen@oracle.com, stern@rowland.harvard.edu,
 syzkaller-bugs@googlegroups.com, tasos@tasossah.com,
 usb-storage@lists.one-eyed-alien.net
References: <0000000000003eb868061245ba7f@google.com>
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <0000000000003eb868061245ba7f@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 26.02.24 10:42, syzbot wrote:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    f2e367d6ad3b Merge tag 'for-6.8/dm-fix-3' of git://git.ker..
> git tree:       upstream
> console+strace: https://syzkaller.appspot.com/x/log.txt?x=114e10e4180000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=eff9f3183d0a20dd
> dashboard link: https://syzkaller.appspot.com/bug?extid=28748250ab47a8f04100
> compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1064b372180000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=10aca6ac180000
> 
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/c55ca1fdc5ad/disk-f2e367d6.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/4556a82fb4ed/vmlinux-f2e367d6.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/95338ed9dad1/bzImage-f2e367d6.xz
> 
> The issue was bisected to:
> 
> commit 321da3dc1f3c92a12e3c5da934090d2992a8814c
> Author: Martin K. Petersen <martin.petersen@oracle.com>
> Date:   Tue Feb 13 14:33:06 2024 +0000
> 
>      scsi: sd: usb_storage: uas: Access media prior to querying device properties

preliminary analysis:

It oopses here:

		} else {
			if (!id[ATA_ID_SECTORS] || !id[ATA_ID_HEADS])
				goto too_early;
			sectnum = (u8)((lba % id[ATA_ID_SECTORS]) + 1);
			cylinder = (u16)(lba / (id[ATA_ID_SECTORS] *
					id[ATA_ID_HEADS]));

in isd200_scsi_to_ata() because it must not be called before isd200_get_inquiry_data()
has completed.

That raises two questions.

1) should we limit the read_before_ms flag to the cases transparent SCSI is used?
2) does isd200_get_inquiry_data() need to validate what it reads?

	Regards
		Oliver

