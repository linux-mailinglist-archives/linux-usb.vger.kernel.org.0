Return-Path: <linux-usb+bounces-11155-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E12904317
	for <lists+linux-usb@lfdr.de>; Tue, 11 Jun 2024 20:04:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DB4591F230D9
	for <lists+linux-usb@lfdr.de>; Tue, 11 Jun 2024 18:04:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2CDD6F2EB;
	Tue, 11 Jun 2024 18:03:05 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 014E06E2BE
	for <linux-usb@vger.kernel.org>; Tue, 11 Jun 2024 18:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718128985; cv=none; b=o3W+UrejiwZRYXmqHjjN/iekHfb7/KPFwqOwGcvBUgU03AmYF+NcpQUZJxtl6H7i9NUKwAjIgYaa7g6N9LX+hBLmsdXlcD2RUk52ffRcKSkVunRAPhJZUy9HxW2Jr7rS3GFxOLdEvqVdpncPY6TJX6yFuu8MZksULUH1TMQxZ/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718128985; c=relaxed/simple;
	bh=dNdmIkkI9RJSzq+/E1Y2oapLGA6weBkGCeORZhJsUZM=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=uyQSxCTHEJazO9L2+3IhRxHx5iBOcCf+QlRJh7dWZhdg2hycaZ7bJ4bEc6Si4kqxwUf+558dJxChgnRDgZ1McmewsWsh0CwHdoHJkEv16Q7TvPD+Q5JY/owzwqwwDLn0fCDcC55ccdQnzLBwmQUVoFKJA52jETVpTs7UJIdJD+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-7ea27057813so670422539f.2
        for <linux-usb@vger.kernel.org>; Tue, 11 Jun 2024 11:03:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718128983; x=1718733783;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zX155y/HdqtyC4tuFKhQWdjrJtIDKJg0z4WGiTQWmV4=;
        b=J/UKqgYTKIiavjIEwa1UHbgcz4nBnynq05T06QbVptaQPRonq49Kg2IpdJBxk+Xy+G
         4uqAeOMvPh1b8w2M7lvPV8IBYljQMRDjDvJWilboYAUNSV6w33NeN+/DeYv3MiEvUfyL
         vr9gmBta323iQwdz5ZM579kr6xGsIOr4mZZleW+vW4UxiTAlmNlDxh1PKdb5yMe5Nox1
         Z97g2W7ie3tN39g2+MhMW2+MQmMvE4MtBU0YYVPRHOc2HQ9d7kQl1Tvn6hdl1arozr+g
         0e99pku0qu14rAXMPSPWBbSGA3gjOu85VF74fdi+YfyqxioB62Yndh1wDShQjnFQxnqV
         GNGQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6MP8jk0DPf/ZwZguAiUBQfPr9RYagOjRBe152RyWxkUeTMuPGBRPd9et8gyd/B59N8mbbZO9mqCdkx2jJS/XZ8rUu271AhPUZ
X-Gm-Message-State: AOJu0YyWxDuuDfwFKY3oZ0LrJrZ+fXZc2PiIy6rHcn7JcS9BHvOmGWHD
	mp38ziiuku7xmI0OI9RNFTi78nlY8xW4iV2joz2luhd4EeTIVo5qvcCYjL9HbbCrwWL0RXtM2Q+
	0dFzPt5wX4fPVcn6/l4CANE6IHosbaLc9OowNZec1GVaSmShNO7ahUNo=
X-Google-Smtp-Source: AGHT+IH/74GbLRAS4ZvUsmf9E4CH9xx/k7+z+jcYz5BlbUMG3ENMrNkJ/qk9BBW6QUURr33sMxX+v9GbSqovKcbe9nz8vGLeIrkN
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1ca5:b0:374:5d81:9135 with SMTP id
 e9e14a558f8ab-375802382b2mr9602735ab.0.1718128983320; Tue, 11 Jun 2024
 11:03:03 -0700 (PDT)
Date: Tue, 11 Jun 2024 11:03:03 -0700
In-Reply-To: <684687e4-8be4-42ee-a125-8ef9acc3fec9@rowland.harvard.edu>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000babbf8061aa113df@google.com>
Subject: Re: [syzbot] [usb?] INFO: rcu detected stall in raw_ioctl
From: syzbot <syzbot+5f996b83575ef4058638@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, stern@rowland.harvard.edu, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-and-tested-by: syzbot+5f996b83575ef4058638@syzkaller.appspotmail.com

Tested on:

commit:         8867bbd4 mm: arm64: Fix the out-of-bounds issue in con..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=14e092de980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3b4350cf56c61c80
dashboard link: https://syzkaller.appspot.com/bug?extid=5f996b83575ef4058638
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
userspace arch: arm64
patch:          https://syzkaller.appspot.com/x/patch.diff?x=137c697e980000

Note: testing is done by a robot and is best-effort only.

