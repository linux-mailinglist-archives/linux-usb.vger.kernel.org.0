Return-Path: <linux-usb+bounces-19786-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A79F5A1DA07
	for <lists+linux-usb@lfdr.de>; Mon, 27 Jan 2025 16:59:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F00703A4ABF
	for <lists+linux-usb@lfdr.de>; Mon, 27 Jan 2025 15:59:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 260F71547F2;
	Mon, 27 Jan 2025 15:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="lyjvegeF"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1173C14D6ED
	for <linux-usb@vger.kernel.org>; Mon, 27 Jan 2025 15:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737993559; cv=none; b=JrwcJIRU/m/P8SHbndAjbnoS4fNJ0o03gCLuXDUhhioxEHPaTBpIZHpF+mYBz+h3yEudsCH5oDrv/sXdTOr8DY3KDWld1A5Vzw4aiHfOWMVTiuZbwrwH1+p6AbtY2y4bqUl6j424hdoXZElO0he74BijRu0d8H1PNeggLbtblZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737993559; c=relaxed/simple;
	bh=KiZpbSe+YKq2dVtM9Hv+gkb12+2RcrmxiwO1F8vXcS4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EJrfDCKvAxUXRyD6SPfctJNixax2bzHqYCcLUysouVtN6KSMQV9YFL8pd3FxgjHmqcFyflO9Lc5ITcIiv761Ughkl4ECcHcxjVmJGfhfFt421snfEv3XT82ST237SZ49yp2UaUL8tSjU+IYXByNK1zEw7QxFcmEvstxg9R56PHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=lyjvegeF; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6d89a727a19so58488046d6.0
        for <linux-usb@vger.kernel.org>; Mon, 27 Jan 2025 07:59:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1737993556; x=1738598356; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AEc9c8A+QfAwPXoTPFk0q427bu8TxsL6y6XWG2ckD+4=;
        b=lyjvegeF/pM/Nhf5RDjqmyb4fAchyna87PXwKVGJm3lrNhP9KMSaWr4AecDEpyjf+K
         yyDAx3/VxUw04STWXTPtnwwJ/PyqCWx296AtqE8Wi2a7ovjWJJ8ggH+w3+R9xM3Am3hx
         vqI66lgAbZyi9cuX5YCbMusAT0mx3aUBA0FFf8iw4hLVoZ2h0G71lPwCikZRJv3aMved
         EjmEJtyORoqjv7L6NP1LS3vYA2kOzcQTrxcdAI3ahqG+8B+RgYwLirePmufk4BEn1JYr
         wcnbwA8JkNFZzEw17zH5/kRoWzQPNnF9r2+abKgN1QZarF/064BS36vkYTs3ApzTiE7g
         OSXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737993556; x=1738598356;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AEc9c8A+QfAwPXoTPFk0q427bu8TxsL6y6XWG2ckD+4=;
        b=aJEfckOR9Y5Tcp5he4OkVFCTr+Llq4uZQRpYwYb8F3EDI4pcMot93qI8MfDNf4Mj+7
         j4vt5U5Y2I6DF+Ieqs19PFqCDyW5gA8mfJfNFYmcpiEitXEXk8b40xyHO8pr9WmeS/qS
         DISzCQBMyn7Wi/Xi0n7jf8cYbx8TiGmlLW+syoBSik5GKd3eeq60V+I7BFZMGPlPnyeq
         f3S5n24lLMnY54DU5ggWm0nhou8npXGkyrv3556Wf+JYo5lBQG0n+fqB4yjs4aPm3EKS
         qE2KYh88pkNgwuPoyhCzmJXQmkAvGwcb2t9P733sYqTEW1Vtn1dLAs3sxn6+QQ1CC52+
         HiBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDsG1aE/aUIvgb65+K1gRg8BPT1UQ/QTIy/wmOPL89re5NSVoNuWZFlzMoPvjJX5o6+TclSmBcssQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCAYi2I57P/zigDkSVI11SZKowf7uh4K6oiE59qU4Jc3eLt5TH
	gQnLq9wm3f22Ed7SRNvSzOs/jC/hWeC5G0bK3vjc50D5C0bOscmFgc9p2jrRrw==
X-Gm-Gg: ASbGncu3ZRpRMRZV9pccpdLGjFdxXum1yif3XajL32jM/iB3D6rpCFVa5yO6nQhvzUi
	nkyQagrW68z8UNJbvc5Oh5J3ymjnToEwhr13jdWXd6zE5T5I8iU/NcgA0Dmj7otK8an+1vRaukO
	p/Vec3zgR7sWkPIZWIomIk6olIKONLpvZ8HspiUNOGlbEz4z17iix/AeOY4APm5H/PRqutQZLXj
	62IiQU5uM+MoFW5a01cNZP7B31FEQnDZIUt3pF1M+hVUU3a/MD+XniAyksfEmxCcvWQwqEHtjyY
	W0KHbZMc6n/M+NU/tIcdY9s=
X-Google-Smtp-Source: AGHT+IHfNmKPV5UeHojXIwHd4RsLYy0KAUidQvsHi84UnE3xrAaBh3HiFV5nZx+d7JLw1W8STgZ/DA==
X-Received: by 2002:a05:6214:29c2:b0:6d4:1613:be3e with SMTP id 6a1803df08f44-6e20627c995mr231273476d6.22.1737993555613;
        Mon, 27 Jan 2025 07:59:15 -0800 (PST)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e2051362b1sm35720756d6.19.2025.01.27.07.59.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 07:59:15 -0800 (PST)
Date: Mon, 27 Jan 2025 10:59:12 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: syzbot <syzbot+9c9179ac46169c56c1ad@syzkaller.appspotmail.com>,
	Karol Przybylski <karprzy7@gmail.com>,
	Jiri Kosina <jikos@kernel.org>
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com,
	linux-input@vger.kernel.org
Subject: Re: [syzbot] [usb?] KASAN: stack-out-of-bounds Read in
 usb_check_int_endpoints
Message-ID: <bc2fb22a-f759-4664-b06c-4c30a535419a@rowland.harvard.edu>
References: <6797072e.050a0220.2eae65.003f.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6797072e.050a0220.2eae65.003f.GAE@google.com>

On Sun, Jan 26, 2025 at 08:10:22PM -0800, syzbot wrote:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    21266b8df522 Merge tag 'AT_EXECVE_CHECK-v6.14-rc1' of git:..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=14bd9c24580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=f9e008bfc27b14db
> dashboard link: https://syzkaller.appspot.com/bug?extid=9c9179ac46169c56c1ad
> compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
> 
> Unfortunately, I don't have any reproducer for this issue yet.
> 
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/5249b29d55f2/disk-21266b8d.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/8413507597a1/vmlinux-21266b8d.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/9c84998b8cfb/bzImage-21266b8d.xz
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+9c9179ac46169c56c1ad@syzkaller.appspotmail.com
> 
> hid-thrustmaster 0003:044F:B65D.0004: hidraw0: USB HID v0.00 Device [HID 044f:b65d] on usb-dummy_hcd.2-1/input0
> ==================================================================
> BUG: KASAN: stack-out-of-bounds in usb_check_int_endpoints+0x1fe/0x280 drivers/usb/core/usb.c:277
> Read of size 1 at addr ffffc9000213e831 by task kworker/1:1/80
> 
> CPU: 1 UID: 0 PID: 80 Comm: kworker/1:1 Not tainted 6.13.0-syzkaller-04858-g21266b8df522 #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 12/27/2024
> Workqueue: usb_hub_wq hub_event
> Call Trace:
>  <TASK>
>  __dump_stack lib/dump_stack.c:94 [inline]
>  dump_stack_lvl+0x241/0x360 lib/dump_stack.c:120
>  print_address_description mm/kasan/report.c:378 [inline]
>  print_report+0x169/0x550 mm/kasan/report.c:489
>  kasan_report+0x143/0x180 mm/kasan/report.c:602
>  usb_check_int_endpoints+0x1fe/0x280 drivers/usb/core/usb.c:277
>  thrustmaster_interrupts drivers/hid/hid-thrustmaster.c:176 [inline]
>  thrustmaster_probe+0x47d/0xcb0 drivers/hid/hid-thrustmaster.c:347

Karol:

Your commit 50420d7c79c3 ("HID: hid-thrustmaster: Fix warning in 
thrustmaster_probe by adding endpoint check") does this:

+	/* Are the expected endpoints present? */
+	u8 ep_addr[1] = {b_ep};
+
+	if (!usb_check_int_endpoints(usbif, ep_addr)) {
+		hid_err(hdev, "Unexpected non-int endpoint\n");
+		return;
+	}

usb_check_int_endpoints() expects its second argument to be a 
0-terminated byte array (see the kerneldoc).  Lack of the terminating 0 
is what caused the syzbot error reported above.

Also, usb_check_int_endpoints() is meant to be used by drivers in which 
the endpoint number is a compile-time constant.  It's not appropriate 
here.  You should have written the test as:

	if (!usb_endpoint_is_int_out(&ep->desc)) {

Alternatively, you could have called usb_find_common_endpoints().

Would you like to submit a patch to fix this error?

Alan Stern

