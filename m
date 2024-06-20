Return-Path: <linux-usb+bounces-11480-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BA7A910474
	for <lists+linux-usb@lfdr.de>; Thu, 20 Jun 2024 14:48:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 62BDE1C23092
	for <lists+linux-usb@lfdr.de>; Thu, 20 Jun 2024 12:48:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 308D51AC78E;
	Thu, 20 Jun 2024 12:48:17 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E8A1AC245
	for <linux-usb@vger.kernel.org>; Thu, 20 Jun 2024 12:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.181.97.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718887696; cv=none; b=VnY8Moe6pJohG+h5Hcr1x/tA0A4X1MsY0bJ3lHtvd8Cz29LHNEwkhDrMLw6hYyqPXa0zidVOfQUvHebs9GWddVdz93RNTAx4Du96WarEibUu4mgHfCeP7LaBDfFeFDK4EmmjPQAYK+MDnHKZpNl8MmmZEvG1WWKDXdthOx1rPBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718887696; c=relaxed/simple;
	bh=GFQaJw4XcEHyGOdoxaSG9hvPYQqEJENyK6i6ExXQOlY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LHqFRfBZNN4Pc6Lr5+sdnBH0AQatINpwbzE09585xfrVxIhnAgKXdbCwjQqgp4jZlcaiI53pMFZylyzzrFTRNNTvWq+4HK2r/IAbh2QKQ8KNTusLHRwBh4QBtYO/+yzt1PbGiGEU9XZf9Hv2NbPOxzkOKbyNPHw3I5ES95h/QJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=I-love.SAKURA.ne.jp; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp; arc=none smtp.client-ip=202.181.97.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=I-love.SAKURA.ne.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp
Received: from fsav412.sakura.ne.jp (fsav412.sakura.ne.jp [133.242.250.111])
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 45KClqVP043035;
	Thu, 20 Jun 2024 21:47:52 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav412.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav412.sakura.ne.jp);
 Thu, 20 Jun 2024 21:47:52 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav412.sakura.ne.jp)
Received: from [192.168.1.6] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
	(authenticated bits=0)
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 45KClpBm043032
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 20 Jun 2024 21:47:51 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <2e1e84bd-b2d0-45a6-a93b-c908dce7dd27@I-love.SAKURA.ne.jp>
Date: Thu, 20 Jun 2024 21:47:51 +0900
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [usb?] INFO: task hung in wdm_release
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Hillf Danton <hdanton@sina.com>,
        syzbot <syzbot+973d01eb49b060b12e63@syzkaller.appspotmail.com>,
        linux-kernel@vger.kernel.org, Boqun Feng <boqun.feng@gmail.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
References: <20240620103847.1724-1-hdanton@sina.com>
 <0044d7b1-ae7d-4d36-b730-38b06186c8bf@I-love.SAKURA.ne.jp>
 <2024062045-improve-tidbit-ed0d@gregkh>
Content-Language: en-US
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <2024062045-improve-tidbit-ed0d@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2024/06/20 21:31, Greg KH wrote:
> Please see:
> 	22f008128625 ("USB: class: cdc-wdm: Fix CPU lockup caused by excessive log messages")
> it should have fixed this already.

OK. Thank you.

#syz fix: USB: class: cdc-wdm: Fix CPU lockup caused by excessive log messages


