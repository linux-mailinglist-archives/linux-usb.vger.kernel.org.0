Return-Path: <linux-usb+bounces-25460-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D72AF83E6
	for <lists+linux-usb@lfdr.de>; Fri,  4 Jul 2025 00:49:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 890E67A763F
	for <lists+linux-usb@lfdr.de>; Thu,  3 Jul 2025 22:47:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31EAA2D3A68;
	Thu,  3 Jul 2025 22:49:05 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAB992D320D
	for <linux-usb@vger.kernel.org>; Thu,  3 Jul 2025 22:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.181.97.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751582944; cv=none; b=Odx0smSrUTtmp/eXSxcjsis9HN2lr0D2wo7N3fz1NRNff2aWK4t4BOLvaMYFWHmXj4T4ZADJuHeru2zwoZTGcG3Y72RwhmOwI8ctq3tSpPNVwzWSxjVmrTmFyjPZ8u0v1m6JygC/rYGAu4pcWXa+ydyuKTe1/4w2HSkbgEPMDPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751582944; c=relaxed/simple;
	bh=85p2LOyc4WCuKDxQym4Pij52oalpUT5w6kgjsTzNLaA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WzboKtJjjqSYTYtlbKnOEYfvK+G6gW1WR5FzlCHcbhSXnmKbOqr4L4y7L99706QpraSw5qiOlKN/62Jyjr5bUF5/oRAd2OJPDFXQSnI1dyRAx+eL53Bg3Zhr1uI4WUITWLMWeZnj1Xg6orlv1RGgd+I+ufdA2HYVHH9bktCDOu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=I-love.SAKURA.ne.jp; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp; arc=none smtp.client-ip=202.181.97.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=I-love.SAKURA.ne.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp
Received: from www262.sakura.ne.jp (localhost [127.0.0.1])
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 563MmUkB088454;
	Fri, 4 Jul 2025 07:48:30 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from [192.168.1.6] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
	(authenticated bits=0)
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 563MmUfU088450
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 4 Jul 2025 07:48:30 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <738a4a73-584c-4097-ab1b-156810f00c66@I-love.SAKURA.ne.jp>
Date: Fri, 4 Jul 2025 07:48:30 +0900
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [usb?] INFO: task hung in hub_activate (3)
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Hillf Danton <hdanton@sina.com>, Mark Brown <broonie@kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        syzbot <syzbot+d630bd89141124cc543e@syzkaller.appspotmail.com>,
        gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
        Boqun Feng <boqun.feng@gmail.com>, linux-usb@vger.kernel.org,
        syzkaller-bugs@googlegroups.com
References: <68648254.a70a0220.3b7e22.20c4.GAE@google.com>
 <20250702080515.2160-1-hdanton@sina.com>
 <20250703000946.2200-1-hdanton@sina.com>
 <d73e0c09-b71e-40c9-af60-86b0dd6258e8@I-love.SAKURA.ne.jp>
 <de8af03b-4948-47c4-b9f8-68f7e4112264@I-love.SAKURA.ne.jp>
 <b1657fab-b34f-4f52-94e7-333577cdb450@rowland.harvard.edu>
Content-Language: en-US
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <b1657fab-b34f-4f52-94e7-333577cdb450@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Anti-Virus-Server: fsav105.rs.sakura.ne.jp
X-Virus-Status: clean

On 2025/07/04 6:27, Alan Stern wrote:
> On Thu, Jul 03, 2025 at 10:48:56AM +0900, Tetsuo Handa wrote:
>> On 2025/07/03 10:20, Tetsuo Handa wrote:
>>> Caused by commit 9bd9c8026341 ("usb: hub: Fix flushing of delayed work
>>> used for post resume purposes") with cc: stable.
>>> Shouldn't we revert that commit and seek for a different approach
>>> than wait for a reproducer?
>>>
>>
>> Sorry, wrong commit.
>>
>> The line was added by commit a49e1e2e785f ("usb: hub: Fix flushing and
>> scheduling of delayed work that tunes runtime pm") with cc: stable.
> 
> Mathias has posted a fix for this problem:
> 
> https://lore.kernel.org/linux-usb/20250627164348.3982628-2-mathias.nyman@linux.intel.com/

OK. No longer reproducing for 18 hours; assume already fixed.

#syz fix: usb: hub: Fix flushing of delayed work used for post resume purposes

> 
> It hasn't gotten into Linus's tree yet.

Since the cause commit is only in linux-next.git , it is no problem that
the fix commit is not yet in linux.git .

> 
> Alan Stern


