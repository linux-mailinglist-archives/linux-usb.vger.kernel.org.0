Return-Path: <linux-usb+bounces-18857-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 58B7A9FDC47
	for <lists+linux-usb@lfdr.de>; Sat, 28 Dec 2024 21:58:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0FD8A161AC0
	for <lists+linux-usb@lfdr.de>; Sat, 28 Dec 2024 20:58:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABEBA1991A8;
	Sat, 28 Dec 2024 20:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="mjtZvtiv"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E73A1158A09
	for <linux-usb@vger.kernel.org>; Sat, 28 Dec 2024 20:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735419525; cv=none; b=Y2WW4Q0/K6/EadD11tMd8mquCJLthQnT2U9W55g+Igs612O3MbURyXoFGrluoZGy2HGP7JVvMS0IutQKbzUmebOdq9yUiQB0fMhprW570rMr3Prus2p9cD4JmzhX21vmkRPvZiGSN0dyyO5S0JGQqdhFS3NHu9dw8HltHUuAM9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735419525; c=relaxed/simple;
	bh=9J5hk8QZVDm8vbleoUZdhiWobb2Aa1ExtskLRc6AwBg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZsiTqQSTjh8oKGKicvJpeNdsorJIVFb7Ek2hXtKahxZU8ckjGWhynBsIqgS2k7nYpghKX0dvxyHkChilkSS+HLkWxnN89T8sRzDUZLduvZYKTL8Oa5kFMZLzRnjrIxbdMJN1b4kMH7abEPm4hnaY8KZhc250RjuZnopEBQA5IRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=mjtZvtiv; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2f43da61ba9so8601797a91.2
        for <linux-usb@vger.kernel.org>; Sat, 28 Dec 2024 12:58:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1735419522; x=1736024322; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tvWzgeNcIeTX9LH0dhtA7vdO40SCLRWP2dvCG3jJO54=;
        b=mjtZvtivauOtM6avoPdDUaKlhpmWNVBr7bNSDkAgjVQLnBkdoiukx7457DeoRd2hoa
         YUXuWdePZh48YsZEEHQF9ZNGopRoY1GRx6arCvmqaPem5oTIYUD8cLxtoklSHd4oxOpt
         pK5T4vvu1DbH66WLSFQE7fYpIIYBrW9y1XUULL40DWLoomThI9mnNaZceIsVC5N8F9u1
         d1BdflV9Hol12QaxyyMrGZAXO0q96Tu+qkSw2Ulpl0VojrU2JhiD38ViXBbAp4o3pr3c
         KPu+M8V/1wZs7wrd2ysp72UpU/1LHCSaFYtDwO4KyGzSmUBuG89kJhFfAhQ8jhAQYOcl
         j2lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735419522; x=1736024322;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tvWzgeNcIeTX9LH0dhtA7vdO40SCLRWP2dvCG3jJO54=;
        b=VdyAebufJehwA9a2naB8f0IY3OkIfnfAVjNSzU/H9lb1shO1Dk3FKbaqR+Db481B9P
         YzZWlJ8EI2PgsYF8Jtf84F4wi6Vec5n425B1TrQsQpGqUa3sXJ4zochulhhIZdmPCP8t
         zVlo9HYwXEeM2XKahRk1DNS1iEhU8ymbq0iZsvBuprvc3Y3FUTDdMgNKtyBIPtHVToyE
         mypktRFNxgtSGDPl997TbbG93V5bLBCan/qDevzuU+X9OFr2CiZx4cnda/syq0C2Nt70
         oZkCMWjs3wiZtVIXJqVJpGKEqFhEoAChGIDJvup4XuQas7EnVrlW0ogoWfYMQjL+FQet
         sF9w==
X-Forwarded-Encrypted: i=1; AJvYcCUoGMUcKYyyg0pvC3UZ3V8UY21tSWn+yBlek5NbEsz9zEWs/dzrwF16XwiNFvQeKSoDASSTtTnGHi4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7aH+yQkQiD5nyrMjDZO9wKqUHkMfItWZVblJaVs3WdnEJLDRy
	H22XlH4cz1c9KAiue+sMtfNh35HaADiPP6k17PBOk47vdkReO+GswZa5ayVmOeHogwMLkDmAZg9
	8
X-Gm-Gg: ASbGncsoIQ5v9MknaM6dH4NIDiBQW/CcDG+mDGzFUJlVPPosZ78/C/ny2WMp4kQ95oX
	FbnMZ+XSd8duV0NJLt4KrfQ2UgQptRy1z12qV51ybMvXq4qagcQINkyrOnkpVBvXU0hmQWyP9mm
	lIVkH8qLYnTOQ35GQg9GOFh4C2ixKI0/nHMFSj6fxWHeZjbFSqal6KO4FcO91RFlSHsaSBgEFo4
	DHFdOBjINeLdq+Yis80d7OJiXMLqJ+wFlJNCH/aImx5bTRcNsvROw==
X-Google-Smtp-Source: AGHT+IFWFMfKYzy7zXm24wQhFZ3sT7tgPFA92qXW2nHZ8UJHZc7AuYpQdciCaZ3KUUaG2SgKJWmoVQ==
X-Received: by 2002:a05:6a00:3286:b0:725:b201:2353 with SMTP id d2e1a72fcca58-72abdec8856mr47800140b3a.13.1735419522329;
        Sat, 28 Dec 2024 12:58:42 -0800 (PST)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8315adsm16517149b3a.51.2024.12.28.12.58.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Dec 2024 12:58:41 -0800 (PST)
Message-ID: <f7be2820-fa37-4276-b02d-3dd00eb464a0@kernel.dk>
Date: Sat, 28 Dec 2024 13:58:40 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [io-uring?] [usb?] WARNING in io_get_cqe_overflow (2)
To: syzbot <syzbot+e333341d3d985e5173b2@syzkaller.appspotmail.com>
Cc: asml.silence@gmail.com, io-uring@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 syzkaller-bugs@googlegroups.com
References: <67706650.050a0220.226966.00b3.GAE@google.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <67706650.050a0220.226966.00b3.GAE@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/28/24 1:57 PM, syzbot wrote:
>> Should be fixed in upstream for quite a while:
>>
>> #syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> 
> This crash does not have a reproducer. I cannot test it.

#syz invalid

-- 
Jens Axboe


