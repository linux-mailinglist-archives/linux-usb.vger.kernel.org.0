Return-Path: <linux-usb+bounces-15813-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B214992EA3
	for <lists+linux-usb@lfdr.de>; Mon,  7 Oct 2024 16:16:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BC98028519D
	for <lists+linux-usb@lfdr.de>; Mon,  7 Oct 2024 14:16:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A9B11D5ABE;
	Mon,  7 Oct 2024 14:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="KNzQ4tcX"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD034433CA
	for <linux-usb@vger.kernel.org>; Mon,  7 Oct 2024 14:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728310594; cv=none; b=ZQUnsLIAWG1YIHkDBcjxEDm0ZbJQBk/GP4PCqJqQKnqbgSG8oRfqpbiiG5sFPhaUvqTu8Pgslxym933PVVZ7LDsV++vtvINLEa+NH2BIsrx2NTe0rlakDqpAiSwOrr8LiayGOgigBnj/8QpkDzpJMfRNLwh5oPJ4MAS/v5zYJfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728310594; c=relaxed/simple;
	bh=WHTwqV6tDRa6dj7SWK8VezUucQdP1t0l/GdZU3cB/1o=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=IH3DkocQQ2Ex7KjNBlOeGN9/snRukFIrwCVCsMpCxDGy95rzzGiG2I1KBF4U//lih4Hl16a8mvDNYhbWItGs0vAttDkZY0FBgw0eJd/wZnuwJ5/0dTtaNKstpTb/k5wb7BUR6garzAFavlMN255zwawqDfua58jhnOCXDXW6PXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=KNzQ4tcX; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2fabe5c8c26so40003881fa.2
        for <linux-usb@vger.kernel.org>; Mon, 07 Oct 2024 07:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1728310589; x=1728915389; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cxVbsU1/6PlRbliGY4tsEIOFuRRavVmNqKCjLC4eEs0=;
        b=KNzQ4tcXFZmaZpxfiPsDWrxsSTalmt68/KbvoabZjVw5DAiguniN2RutUecv+POEtq
         n2Nmn81Juiiw8WTl9b4B6OHO7pi5XWZR3Y+wLS1EXeB3H7/vCwKliMAmtsfBQ11zQGLi
         2/mIHKsXAT76IaOORhzDdnPlH44gHRSaaSUb0sCklCH2EssPmMSJPbXqhdsMaHGNjTaf
         rX7Uy1bV474mQxk/KZtJa5XUf87ajaQol3KP+8F0jOqyAHcQynRcUsT/POZ0ArZ3/61B
         m3ELmVVs4VeKDe4TQgfcG1zm5eD+SXTOPR3bpFN5S6RpUW6MtpudotWbhnATC1H39M9A
         g1JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728310589; x=1728915389;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cxVbsU1/6PlRbliGY4tsEIOFuRRavVmNqKCjLC4eEs0=;
        b=WcYQwt9w5AEjNNyYUEji2znQF7dfQ0DP5dDrUb5faHPnWdXs+LTuQCViBwt3xKTh3O
         agZVRYKVeDYrW4AMDN/CrZ2zkFaVpq4Ngc+Ed1RgvcXCzVj6DLCMDjPzq1VzCdy2Vn5R
         V3e+xA7F8YDAxH7qvZpWDkgy80fAsx02AwpYJN2cULp/6MvZ+YBsgvQLeZzTXzR36Udy
         qvR8xIuIeOe+ReGW93JlNMz4ytWsQk6Famca+nVHby9dTFAIBEbHL1elqaz+61xkDo4e
         AIQGYV9fyf3dM2YxNK7/G2zCzZf/Iv8GutXwn/6ir9ELtsWRKEUWwS1ppUzwPfjmSgzG
         vwow==
X-Forwarded-Encrypted: i=1; AJvYcCWyFcfrIrO936lToTvalkeK2iZTiI7zBYOiPO3Ed3msy772VOePR+xzCbjCxVYzuxexxYpjnzn0rtg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsahYO8l52NO3nD1XJAABoA3CD0lAfRNP2H7Hiw06UkRlVS06v
	i2UwQQJK+0FQoWvkpNS/ZKlxvDsVvuWG8wHAD/QEGB0GCR1S6hR73rNWfLezawGEMcAmhzVxCRq
	h
X-Google-Smtp-Source: AGHT+IEPRUuIot87bqEBFnZBoR54B02LoDCRIyfJ2/1E0D11LEH0v3cn2FItdSgJHKxr3q6YTB5cGA==
X-Received: by 2002:a2e:a99d:0:b0:2f7:58bc:f497 with SMTP id 38308e7fff4ca-2faf3d7380bmr55287811fa.28.1728310588723;
        Mon, 07 Oct 2024 07:16:28 -0700 (PDT)
Received: from ?IPV6:2001:a61:1370:2201:dbf:8c7d:e87d:3baf? ([2001:a61:1370:2201:dbf:8c7d:e87d:3baf])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c8e05eb357sm3204024a12.69.2024.10.07.07.16.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Oct 2024 07:16:28 -0700 (PDT)
Message-ID: <b60f922a-5c10-4983-9404-ad18bdd86c67@suse.com>
Date: Mon, 7 Oct 2024 16:16:27 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [usb?] INFO: task hung in usb_register_dev (2)
To: syzbot <syzbot+a194ded97ce38690073f@syzkaller.appspotmail.com>,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
References: <6703c076.050a0220.49194.0505.GAE@google.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <6703c076.050a0220.49194.0505.GAE@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 07.10.24 13:05, syzbot wrote:

> INFO: task kworker/1:0:25 blocked for more than 144 seconds.
>        Not tainted 6.12.0-rc1-next-20241003-syzkaller #0
> "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> task:kworker/1:0     state:D stack:20416 pid:25    tgid:25    ppid:2      flags:0x00004000
> Workqueue: pm pm_runtime_work
> Call Trace:
>   <TASK>
>   context_switch kernel/sched/core.c:5315 [inline]
>   __schedule+0x1895/0x4b30 kernel/sched/core.c:6675
>   __schedule_loop kernel/sched/core.c:6752 [inline]
>   schedule+0x14b/0x320 kernel/sched/core.c:6767
>   usb_poison_urb+0x1bc/0x2e0 drivers/usb/core/urb.c:763

This points to a bug in the HCD.
usb_poison_urb() is guaranteed to make progress.

>   poison_urbs drivers/usb/class/cdc-wdm.c:342 [inline]
>   wdm_suspend+0x174/0x380 drivers/usb/class/cdc-wdm.c:1271
>   usb_suspend_interface drivers/usb/core/driver.c:1328 [inline]
>   usb_suspend_both+0x2a5/0x1140 drivers/usb/core/driver.c:1433
>   usb_runtime_suspend+0x59/0x100 drivers/usb/core/driver.c:1968

What HC is used for these tests?

	Regards
		Oliver


