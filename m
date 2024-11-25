Return-Path: <linux-usb+bounces-17839-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 227979D89D7
	for <lists+linux-usb@lfdr.de>; Mon, 25 Nov 2024 17:00:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 57DAD16A554
	for <lists+linux-usb@lfdr.de>; Mon, 25 Nov 2024 16:00:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97A261B4152;
	Mon, 25 Nov 2024 16:00:07 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D257DEAF1
	for <linux-usb@vger.kernel.org>; Mon, 25 Nov 2024 16:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732550407; cv=none; b=lvO85P+hnkYBoldnaYIp01JNu8ovs/ppiVl5WpRaATnlb0A/nSKgcVVaDyMXWYFEHohG+qkDqiMiZDZ9x//rT8oGMvPvfRauGlUr0EkfGU6xZXT4ZhCaLQ/VnItrKsqFmeqZwUY5jMSUwDEvagCrA6wvNFfo15PMZ0MTlUHXOlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732550407; c=relaxed/simple;
	bh=rCA7tN77oSxn4nSUCyaEPhyJDQp/cbJyX3dpxCtfg0s=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=iUQ9h4f5ugss44D1EpprD2iGK8AePK7eBlb+2sG/tlzXeRcfdqBPL+034x/FwjERdTe/9x1KpFW+f6V4GgdeDmcvgbsyM8ipGF8O2Y1YxslEGZDWBd3MM3FZ8z+dWsVi44XcoPgP/+G0OcNv/6HcDoa9TDWjIK754bCTkgSMry8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3a743d76ed9so50018565ab.0
        for <linux-usb@vger.kernel.org>; Mon, 25 Nov 2024 08:00:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732550404; x=1733155204;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LQ5HUgOXbILcqXU+BL8itF7OQWQ7AptcHc14ASFyUaA=;
        b=Xwf8tZmFXp0jkbPf6wzaNghhDQn5zsIJ5CbBukDOckplkDwl0TSMcCr0XnsFdgDfUM
         yDLfWDlNNEnGV2+Chn2S/mQBal7Xzu0lTIBg2L7Teqx3a0G4AUEYPQnO4U+KXlfSUuZP
         pKwpgA1lqE2ucG4m3buzGLFYtKu0FtDM+60tFI5z98c1Hdlxdtaf0sjFxRumPzt1TAza
         xFhkXAX/S4dJcUOYIvw2mhyuO86hk8SO9w2a3XpWXmjVUDmpa+C51HxuU5xEpRu2I1Oi
         pbIqR9q143rpeC9huUUrpf6aAQyv1nG72pYHgiBIg73JmUV7kL7g+FRubME+tb33wF3P
         EKnQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtBqgwEwMiRf75NnVNU6LxG9+FdsHvdfs7+xbLqNHmNsektbzS8ntUogX9gAXHF+W97/QhkeVhqaQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzpvtMnh9E0OnfPwrYE6ivfyt+mJSBco0uIgZUtAACUKei+BHxs
	Br0zD/aSO6p5l4q11qaVbSsHr2OJ8kIdpyI7DZ2RNOybg4czN4bUzgva7nxHE7MzQpNt7Las9Aa
	Z/y2J2NQnlzmgsr8+fP4SSRkPkw14tZTEX3KiJEjiKvLgqBSfSbhD85Y=
X-Google-Smtp-Source: AGHT+IHIb7s4QFOpJPxES8aDXyROD7H+PYUYM8HigaeeIl4gnxog0frKtM68oofnuvMKeonDgmxZEazp5VfDO3rF+al4zfPEfHan
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1a8f:b0:3a7:a58b:557e with SMTP id
 e9e14a558f8ab-3a7a58b693bmr73872635ab.12.1732550404057; Mon, 25 Nov 2024
 08:00:04 -0800 (PST)
Date: Mon, 25 Nov 2024 08:00:04 -0800
In-Reply-To: <21c2fc3f-e55a-47bb-a51b-b53e5cab1e67@suse.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67449f04.050a0220.1286eb.0003.GAE@google.com>
Subject: Re: [syzbot] [media?] WARNING in iguanair_probe/usb_submit_urb (2)
From: syzbot <syzbot+ffba8e636870dac0e0c0@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-usb@vger.kernel.org, mchehab@kernel.org, oneukum@suse.com, 
	sean@mess.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+ffba8e636870dac0e0c0@syzkaller.appspotmail.com
Tested-by: syzbot+ffba8e636870dac0e0c0@syzkaller.appspotmail.com

Tested on:

commit:         43fb83c1 Merge tag 'soc-arm-6.13' of git://git.kernel...
git tree:       https://github.com/google/kasan.git
console output: https://syzkaller.appspot.com/x/log.txt?x=12b56530580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=58b000b917043826
dashboard link: https://syzkaller.appspot.com/bug?extid=ffba8e636870dac0e0c0
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=11d465c0580000

Note: testing is done by a robot and is best-effort only.

