Return-Path: <linux-usb+bounces-11474-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 16591910195
	for <lists+linux-usb@lfdr.de>; Thu, 20 Jun 2024 12:39:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BFACC1F22565
	for <lists+linux-usb@lfdr.de>; Thu, 20 Jun 2024 10:39:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B77C1AAE29;
	Thu, 20 Jun 2024 10:39:15 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp134-31.sina.com.cn (smtp134-31.sina.com.cn [180.149.134.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A726119EED5
	for <linux-usb@vger.kernel.org>; Thu, 20 Jun 2024 10:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=180.149.134.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718879955; cv=none; b=KoGZ4vfknkj2VGizDMDbw2Tpa+C1wk/fG2ZAtV1aMErYZAqBqnBZoXRQhq/tU3zdJznGj2/e5NZQV51USlYLZuN/DKFuqqSPNVAzlisIP2mM+zs0CMqmd25wA6SZPBQSMsB3lF5/+qwced4Omt+lk94Qgqr1xOQBsb1wMGd4GlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718879955; c=relaxed/simple;
	bh=cP1vXZPPRqr0Uz61ZzQZpG8sk0PrcO4TOyTTsBrcVtM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eEVVhUJRBiaCzOFKq9uu4Ag0I48CMHSuv1AAy03iXTnGQWQ/+sBdDehGZD7bCJpCANlFEztTjx+2X6CUMraOXcMBFhlGFFhCUiT8fvlMZgmkIKrPa/lMdat/fAUd43jRJk1g3jFwg9t5BqEJRm+8AXJdJ5j6Mjhi0RE6Sb4LMf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; arc=none smtp.client-ip=180.149.134.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([113.90.46.255])
	by sina.com (10.185.250.21) with ESMTP
	id 667406BE00007ABF; Thu, 20 Jun 2024 18:38:57 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 4741273408515
X-SMAIL-UIID: 77F886C4FC4640BF932F5FAFC4B80EF9-20240620-183857-1
From: Hillf Danton <hdanton@sina.com>
To: syzbot <syzbot+973d01eb49b060b12e63@syzkaller.appspotmail.com>
Cc: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
	Boqun Feng <boqun.feng@gmail.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linux-usb@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [usb?] INFO: task hung in wdm_release
Date: Thu, 20 Jun 2024 18:38:47 +0800
Message-Id: <20240620103847.1724-1-hdanton@sina.com>
In-Reply-To: <0000000000000ff9cb061b4ea872@google.com>
References: 
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 20 Jun 2024 02:08:21 -0700
> Showing all locks held in the system:
> 3 locks held by kworker/u8:0/11:
>  #0: ffff8880b953e7d8 (&rq->__lock){-.-.}-{2:2}, at: raw_spin_rq_lock_nested+0x2a/0x140 kernel/sched/core.c:559
>  #1: ffff8880b9528948 (&per_cpu_ptr(group->pcpu, cpu)->seq){-.-.}-{0:0}, at: psi_task_switch+0x441/0x770 kernel/sched/psi.c:988
>  #2: ffff8880754f0768 (&rdev->wiphy.mtx){+.+.}-{3:3}, at: wiphy_lock include/net/cfg80211.h:5966 [inline]
>  #2: ffff8880754f0768 (&rdev->wiphy.mtx){+.+.}-{3:3}, at: cfg80211_wiphy_work+0x35/0x260 net/wireless/core.c:424

The info looks bogus given acquiring mutex with runqueue lock held.

static inline void wiphy_lock(struct wiphy *wiphy)
	__acquires(&wiphy->mtx)
{
	mutex_lock(&wiphy->mtx);
	__acquire(&wiphy->mtx);
}

