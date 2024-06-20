Return-Path: <linux-usb+bounces-11477-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E6B910359
	for <lists+linux-usb@lfdr.de>; Thu, 20 Jun 2024 13:48:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4320F282BD0
	for <lists+linux-usb@lfdr.de>; Thu, 20 Jun 2024 11:48:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A2B21ACE73;
	Thu, 20 Jun 2024 11:47:30 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB8F81AC776
	for <linux-usb@vger.kernel.org>; Thu, 20 Jun 2024 11:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.181.97.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718884050; cv=none; b=inEENTjJ8UwKr3eshfvbtHaoo2SMRyZqE9RxUuIy5WCqaLDtH6C3S7At92GgagAmYumCJKnboPQMvBqGcEBrAxpmNb1K8BiHtRDBKdPizSmk4kuP8db8zKSOPU8UGANm4WtTBiZPQaepsSH+s2+7dYv8MnzmwsHoKz9p1lcwJjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718884050; c=relaxed/simple;
	bh=lQiYVUuow1QXXYSvDO84pEPsNvpohJgc5zjBiQHx9Gs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nHhgoYXPbBEhR1H13QqyYPcpc8bCJrN/HWFe0FD6OASJzje/lvot09ezqq5Plt//GJDlRM9A4sFqtPYYej0QmFe83zAwA5nYYC1zBMTjV+cHC9auIadyKiN27gKUdbR53l4HDM1O6m+83comQ7N2bR1sjE5qQMB/2FiuNTF6rcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=I-love.SAKURA.ne.jp; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp; arc=none smtp.client-ip=202.181.97.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=I-love.SAKURA.ne.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp
Received: from fsav311.sakura.ne.jp (fsav311.sakura.ne.jp [153.120.85.142])
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 45KBl35j031185;
	Thu, 20 Jun 2024 20:47:03 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav311.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav311.sakura.ne.jp);
 Thu, 20 Jun 2024 20:47:03 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav311.sakura.ne.jp)
Received: from [192.168.1.6] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
	(authenticated bits=0)
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 45KBl3GM031182
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 20 Jun 2024 20:47:03 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <0044d7b1-ae7d-4d36-b730-38b06186c8bf@I-love.SAKURA.ne.jp>
Date: Thu, 20 Jun 2024 20:47:03 +0900
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [usb?] INFO: task hung in wdm_release
To: Hillf Danton <hdanton@sina.com>,
        syzbot <syzbot+973d01eb49b060b12e63@syzkaller.appspotmail.com>
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
        Boqun Feng <boqun.feng@gmail.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
References: <20240620103847.1724-1-hdanton@sina.com>
Content-Language: en-US
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <20240620103847.1724-1-hdanton@sina.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2024/06/20 19:38, Hillf Danton wrote:
> On Thu, 20 Jun 2024 02:08:21 -0700
>> Showing all locks held in the system:
>> 3 locks held by kworker/u8:0/11:
>>  #0: ffff8880b953e7d8 (&rq->__lock){-.-.}-{2:2}, at: raw_spin_rq_lock_nested+0x2a/0x140 kernel/sched/core.c:559
>>  #1: ffff8880b9528948 (&per_cpu_ptr(group->pcpu, cpu)->seq){-.-.}-{0:0}, at: psi_task_switch+0x441/0x770 kernel/sched/psi.c:988
>>  #2: ffff8880754f0768 (&rdev->wiphy.mtx){+.+.}-{3:3}, at: wiphy_lock include/net/cfg80211.h:5966 [inline]
>>  #2: ffff8880754f0768 (&rdev->wiphy.mtx){+.+.}-{3:3}, at: cfg80211_wiphy_work+0x35/0x260 net/wireless/core.c:424
> 
> The info looks bogus given acquiring mutex with runqueue lock held.

Nothing wrong. Printing the backtrace and/or locks held is not atomic.
That is, locks held by a non current thread can change at any moment.

For example, the former block starting with
"INFO: task syz-executor320:7035 blocked for more than 142 seconds."
says that pid 7035 is blocked at "mutex_lock(&wdm_mutex)", but the latter
block starting with "Showing all locks held in the system:" says that
pid 7035 was holding (or trying to hold) no lock.

Threads were making progress slowly. Though, printk() flooding by

  cdc_wdm 5-1:1.0: nonzero urb status received: -71
  cdc_wdm 5-1:1.0: wdm_int_callback - 0 bytes

should be avoided. We need to persuade Greg to let these noisy messages reduced.


