Return-Path: <linux-usb+bounces-7234-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E4F886B0A4
	for <lists+linux-usb@lfdr.de>; Wed, 28 Feb 2024 14:43:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 40A7BB2872A
	for <lists+linux-usb@lfdr.de>; Wed, 28 Feb 2024 13:43:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3274C130AEF;
	Wed, 28 Feb 2024 13:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="IaBq7KRC"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05B4A73508
	for <linux-usb@vger.kernel.org>; Wed, 28 Feb 2024 13:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709127660; cv=none; b=B4mcpojakpX835XPgIas81eVFf3DXRLpp7v0RqPA8SCUJMMSgbd/mrBwJKZhxLRuZY5+Q1U8SgUqbbbgAWGmlITexD6PjP1iuJ4aF2HXVjJ78st1tkmw/Po17PyYERiK3ccTrU+Z+7bS+WaU1uDbEM9/p6hGYmeZAo51idZd87I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709127660; c=relaxed/simple;
	bh=HDznlg7Uq51EiiRJLoPfiIMLzBhjkHq0JDXL06XmxN0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=QZ3bs6N4UHejW/1Vib5vQ5Z49+P9nzAsf9PR0z7RQeOdmBnbULSpZ0LMxNt/C4ovlwqlCMS+flqdQC60CNEc+oBWfbPEteDYhnyGVNRxm/4WCHrrTrgOtN4gOFcdbfyuJvzwlSTwFtcgBQgBfZp2o/copg55f0bZ5XFXhynGH2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=IaBq7KRC; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-512f6f263a6so3555336e87.2
        for <linux-usb@vger.kernel.org>; Wed, 28 Feb 2024 05:40:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709127656; x=1709732456; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2T2k3a2RPzd6bdsjdnSaPnV4P3b/ZKDez9k8eI9odgY=;
        b=IaBq7KRCgv4KZThg2GD5woVKmkNGOhzS9tSBkPeEDuv6dgr2Dqjv8BjXHtDnU6wJq9
         OFNR1R91jHl1a6gxFU2tBQLtP+THSkswR5Ammor4RLlwT8gKQgPAOPExr12VqTsa3d8A
         JI0mU6cI57KGmV9P1jOY0R1J1S6u3FWqVdxRiIrfAJUH9T4/TNUazfaj7KNqVQGBfPTp
         /b3DhJ6BK/M3AUHbmsTw5sVXuvctpkE8BIvhQhnXS5vj72ZRmTwWbNAmfksMOxPehzda
         I7tXIlflaQTjwK0x9s+dAmeWuYJJNSv7fVpQ5kxutkgQoQBnRa6Z0lUDPM1cGLEClKf3
         i1BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709127656; x=1709732456;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2T2k3a2RPzd6bdsjdnSaPnV4P3b/ZKDez9k8eI9odgY=;
        b=RUpBHAI1SSK5j0QMopk3DtVTTgULTQ483JEcRKTdTA+d8LAKF5PFY0/WIgxga1kQG9
         lxUYMBwUKGrVl+YCB0jtCtBv6wknKbJ2R7YHZyaBj4Uf01uWXE3DVYUuCO/9GD3+wIaW
         EVyoty4e0d4IF4hK0KmqyGn49E0GKIS8NdmphCtUAZBI5M9rCBbewdVtXhbJL4i7zoDK
         QSkjq1jzth457CsUC6C55vfsFR+AgxC85w9KWSpej4KUfN87ZDFmJRt5UpJ8mzCgIOMk
         tuuNDn0Vz4ConB2BU+8WRLO08+xwV7OY0NCqWW+3KwMWSEl4Opfr9/hDzOk6udzyTQQk
         XfOA==
X-Forwarded-Encrypted: i=1; AJvYcCW01HD9hUJS+JG58wDkaI66xx0Lc8a67P454drCo4QaW5NLle10SomlCLizxkLbGAnnHfiopLLJKlvUAc5qKpwUWCzs4WnOoFBM
X-Gm-Message-State: AOJu0Yy/V+rQ5PLkcsjZft4RGZiJh5j4FH6sqTu3JpvdYEM3s1ioAqze
	zyGyP8CKJLcmoJw0idJLceqT6R4SF4yN2kh5OcHxG2LdJqKTfpfRmH1rvpmF7eaU/HsIk8+iJeC
	I
X-Google-Smtp-Source: AGHT+IEapmu02sGfnu62ynRSIQui118VIwieoTSaBwSBGnXoJpXBJXlN4PPsdDch6Zg1Iw3Xc0AlEQ==
X-Received: by 2002:a05:6512:3b07:b0:512:f6da:e52e with SMTP id f7-20020a0565123b0700b00512f6dae52emr7817888lfv.28.1709127656106;
        Wed, 28 Feb 2024 05:40:56 -0800 (PST)
Received: from ?IPV6:2001:a61:1366:6801:d8:8490:cf1a:3274? ([2001:a61:1366:6801:d8:8490:cf1a:3274])
        by smtp.gmail.com with ESMTPSA id bx10-20020a5d5b0a000000b0033b2799815csm14966081wrb.86.2024.02.28.05.40.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Feb 2024 05:40:55 -0800 (PST)
Message-ID: <18eee504-9c44-47c9-9da3-ce17bd71b2e1@suse.com>
Date: Wed, 28 Feb 2024 14:40:54 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: RIP on discard, JMicron USB adaptor
To: Harald Dunkel <harald.dunkel@aixigo.com>, linux-usb@vger.kernel.org
References: <70bc51d7-c8a2-4b06-ab7a-e321d20db49a@aixigo.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <70bc51d7-c8a2-4b06-ab7a-e321d20db49a@aixigo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 28.02.24 13:22, Harald Dunkel wrote:

> [1400821.811982]  blkdev_issue_discard+0x7e/0xe0
> [1400821.811990]  blkdev_common_ioctl+0x61f/0xa30
> [1400821.811999]  blkdev_ioctl+0x104/0x270
> [1400821.812006]  __x64_sys_ioctl+0x8d/0xd0
> [1400821.812013]  do_syscall_64+0x58/0xc0
> [1400821.812017]  ? do_user_addr_fault+0x1b0/0x580
> [1400821.812023]  ? exit_to_user_mode_prepare+0x40/0x1e0
> [1400821.812030]  entry_SYSCALL_64_after_hwframe+0x64/0xce
> [1400821.812038] RIP: 0033:0x7f2af0f95c5b
> [1400821.812042] Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10 00 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00 0f 05 <89> c2 3d 00 f0 ff ff 77 1c 48 8b 44 24 18 64 48 2b 04 25 28 00 00
> [1400821.812046] RSP: 002b:00007ffc65ecec40 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
> [1400821.812051] RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007f2af0f95c5b
> [1400821.812054] RDX: 00007ffc65eced00 RSI: 0000000000001277 RDI: 0000000000000003
> [1400821.812056] RBP: 0000000000000000 R08: 0000000000000007 R09: 0000563c2300a2f0
> [1400821.812058] R10: 00007ffc65eec170 R11: 0000000000000246 R12: 000000ee77900000
> [1400821.812061] R13: 0000000000000003 R14: 0000563c2300a2f0 R15: 0000000000000000
> [1400821.812065]  </TASK>
> [1400821.812067] ---[ end trace 0000000000000000 ]---
> 
> I tried a discard on a Samsung PM981 1TB SSD (m.2) using a JMicron USB adaptor.

Hi,

usb-storage or UAS? Could you please provide the output of "lsusb -v" and a full dmesg from the moment of plugging it on onwards?

	Regards
		Oliver


