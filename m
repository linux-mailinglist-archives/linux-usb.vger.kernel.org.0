Return-Path: <linux-usb+bounces-25427-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 32687AF6757
	for <lists+linux-usb@lfdr.de>; Thu,  3 Jul 2025 03:49:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 836317A4B86
	for <lists+linux-usb@lfdr.de>; Thu,  3 Jul 2025 01:48:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 296B8192B81;
	Thu,  3 Jul 2025 01:49:26 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23D0E18641
	for <linux-usb@vger.kernel.org>; Thu,  3 Jul 2025 01:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.181.97.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751507365; cv=none; b=CaoZQpQ9VqFTbOR82+ISJ33wI9BhsSgZqF7yee4hzlfEkXCPAqQ7B//ULSbd5kPvmYUsOHG4Z22aEkA7aIeEzXYTAqxtRZFR8yAxIJLJD2gBBPdCfs7XClVurTzwlHoVNIZw1KEKBEjn7FzCepmanMgXgBnbR33Mw29walJip7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751507365; c=relaxed/simple;
	bh=0d0Bcps9uZh98inKDi3ZM1bepI9UuqSIrMEv1zUubkI=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=rP9JHN5G9JTIDxXg2B+m/QhS84lrpjXJGl96M4GEIwBGo+DS7fdo+Ti6FpZtUgDaHE6Wl6WW7t6mF6rMuxgHTThm+8aXgCbSliEYHU1cDIMMxYI6yrjq4V3zhq16FxDuY170G/5RbYSLVZ7JpZggc6mijunfXbwwY1d78Q/AoXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=I-love.SAKURA.ne.jp; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp; arc=none smtp.client-ip=202.181.97.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=I-love.SAKURA.ne.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp
Received: from www262.sakura.ne.jp (localhost [127.0.0.1])
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 5631mtPQ031903;
	Thu, 3 Jul 2025 10:48:55 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from [192.168.1.6] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
	(authenticated bits=0)
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 5631mtgE031893
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 3 Jul 2025 10:48:55 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <de8af03b-4948-47c4-b9f8-68f7e4112264@I-love.SAKURA.ne.jp>
Date: Thu, 3 Jul 2025 10:48:56 +0900
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [usb?] INFO: task hung in hub_activate (3)
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
To: Hillf Danton <hdanton@sina.com>, Alan Stern <stern@rowland.harvard.edu>,
        Mark Brown <broonie@kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: syzbot <syzbot+d630bd89141124cc543e@syzkaller.appspotmail.com>,
        gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
        Boqun Feng <boqun.feng@gmail.com>, linux-usb@vger.kernel.org,
        syzkaller-bugs@googlegroups.com
References: <68648254.a70a0220.3b7e22.20c4.GAE@google.com>
 <20250702080515.2160-1-hdanton@sina.com>
 <20250703000946.2200-1-hdanton@sina.com>
 <d73e0c09-b71e-40c9-af60-86b0dd6258e8@I-love.SAKURA.ne.jp>
Content-Language: en-US
In-Reply-To: <d73e0c09-b71e-40c9-af60-86b0dd6258e8@I-love.SAKURA.ne.jp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Anti-Virus-Server: fsav401.rs.sakura.ne.jp
X-Virus-Status: clean

On 2025/07/03 10:20, Tetsuo Handa wrote:
> Caused by commit 9bd9c8026341 ("usb: hub: Fix flushing of delayed work
> used for post resume purposes") with cc: stable.
> Shouldn't we revert that commit and seek for a different approach
> than wait for a reproducer?
> 

Sorry, wrong commit.

The line was added by commit a49e1e2e785f ("usb: hub: Fix flushing and
scheduling of delayed work that tunes runtime pm") with cc: stable.


