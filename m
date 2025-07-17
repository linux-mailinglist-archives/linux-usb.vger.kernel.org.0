Return-Path: <linux-usb+bounces-25915-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F27B090E4
	for <lists+linux-usb@lfdr.de>; Thu, 17 Jul 2025 17:49:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 24CDF7BD6DB
	for <lists+linux-usb@lfdr.de>; Thu, 17 Jul 2025 15:47:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F22412F9493;
	Thu, 17 Jul 2025 15:49:05 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A0402F8C4B
	for <linux-usb@vger.kernel.org>; Thu, 17 Jul 2025 15:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752767345; cv=none; b=YOfK9vhE/V2oOozNxOkiFkKYfuX89QsDQaRRhdmAxLuXSBxWUTVDMk7mqnxXcB0rEZTgkZW9buEtEYlm4d9YcTsQ+xlWIHHQfp1OOs+W0rWqJNquOiPIuF5xKyjDsoVCr3GdHU/UmJ7EvcV0PYDOHjYAsMMLCLj0X9T5tQILWmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752767345; c=relaxed/simple;
	bh=uwUycdhfPj6CaQoQpADVkvyXsmH6Btz4yJ0id2qySG0=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=lSG6qIZpkKs1XWtCM8kf/J235YFd19I8as40qp9oSKmBKS7yd1u0Z//y8b9HJWlI2xMxF9HkBX6eMtM86zXUnx0HGXHCNanFHD8OW24J619XbyEty9sXeJfQil1b3E9CXh3ZK1hnxHTAkb2QGYACM5BNMShUIAHPs6ggEC9QIrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-86cf9bad8e9so114119939f.2
        for <linux-usb@vger.kernel.org>; Thu, 17 Jul 2025 08:49:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752767343; x=1753372143;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8DkcvYYZYbeS9YyBNkSiQOuihRa5i8q/41A08t0STM0=;
        b=makv4us/JkTJ44SOBWuffaTx6BFGuhghjlkKE9KU0SLGqcz0LVL4H2xSfK2XAcQSCi
         IDYCSVfzPegCADQ8N3lwqaDJICObDtlkXwMF+4vjIkt2LFK8AkDYswSIJ2XUTo5Bee1F
         A2sqPFQeWgCuYnr3tPLOfkDbENYAhJA4hm8iJCfdLASaajZ5762zFOuSRFum42CbFeie
         ka1GXetkkdqWMqiK2XrP2hKrm4oLVHBETD/fCS4n2aviWcsRitlDGwne73whMOzZF0Uc
         vasC5qicsJKMnGw2Lsvicgbdiljc9+QIDzgtRGuIKIEcU/LE0irUdEZR6rtQxHJxOpNm
         XQYA==
X-Forwarded-Encrypted: i=1; AJvYcCUPWRkVJ+/Jj59h/nVkb8f7G33ElmOxUXo+1zGPL1HNFnjfKF97ezZodwWozfIjIbHwH8wfulAztWo=@vger.kernel.org
X-Gm-Message-State: AOJu0YysuQ8KMwIYlaXDyMSmVMc7/bXiBY3kg5B2dBN6cNYQtaXVjOKh
	BoUIlt5xZ2csBqS9pQ2x9POvXBlkULE9uQ+J+vuVBfER3HSZXVG1uqu4P+8isv4d9a1wbb5jCey
	QBgqMk++oIzjsomj664lnVDBKSxt6iPqO9S1MK4wPkgUuwvHfH/+yUlEoRaY=
X-Google-Smtp-Source: AGHT+IEf4fyoxXity4Kr6+dzWapHEvcoVCaE3mpTKdMN7UYWTnoIPlTPex69DChCvZAIqhHVq3jwH0inF1qmM/cRIz94nhSUN0lN
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a5e:8801:0:b0:875:ba1e:4d7e with SMTP id
 ca18e2360f4ac-879c28a63bfmr745475839f.6.1752767343310; Thu, 17 Jul 2025
 08:49:03 -0700 (PDT)
Date: Thu, 17 Jul 2025 08:49:03 -0700
In-Reply-To: <15723551-960b-4257-bfbd-073e136deaa2@rowland.harvard.edu>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68791b6f.a70a0220.693ce.004b.GAE@google.com>
Subject: Re: [syzbot] [input?] [usb?] UBSAN: shift-out-of-bounds in s32ton (2)
From: syzbot <syzbot+b63d677d63bcac06cf90@syzkaller.appspotmail.com>
To: bentiss@kernel.org, jikos@kernel.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	stern@rowland.harvard.edu, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+b63d677d63bcac06cf90@syzkaller.appspotmail.com
Tested-by: syzbot+b63d677d63bcac06cf90@syzkaller.appspotmail.com

Tested on:

commit:         c2ca42f1 HID: core: do not bypass hid_hw_raw_request
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git
console output: https://syzkaller.appspot.com/x/log.txt?x=148b258c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=ec692dfd475747ff
dashboard link: https://syzkaller.appspot.com/bug?extid=b63d677d63bcac06cf90
compiler:       Debian clang version 20.1.7 (++20250616065708+6146a88f6049-1~exp1~20250616065826.132), Debian LLD 20.1.7
patch:          https://syzkaller.appspot.com/x/patch.diff?x=14dd1382580000

Note: testing is done by a robot and is best-effort only.

