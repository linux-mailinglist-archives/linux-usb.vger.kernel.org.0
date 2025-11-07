Return-Path: <linux-usb+bounces-30177-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E43A6C3DF4A
	for <lists+linux-usb@lfdr.de>; Fri, 07 Nov 2025 01:13:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 287883A8F58
	for <lists+linux-usb@lfdr.de>; Fri,  7 Nov 2025 00:12:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 885A921A425;
	Fri,  7 Nov 2025 00:12:06 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0084B1EEA55
	for <linux-usb@vger.kernel.org>; Fri,  7 Nov 2025 00:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762474326; cv=none; b=SEmLYDwJagIsqWrzBXh0B/YPgcV0qV0Y9jlWSal3vW3ReHLQyZyX6e1XbFcn1bXDgxLaiiYtlUR4kdpcifPsru9SPL1Gyt/2vM51uPBwox8N2ENYxPcTyhUvSCESKwiriBmL2nTfvNXelnhBP4iezO4SCOoc6CvsDCMLpfv9a4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762474326; c=relaxed/simple;
	bh=aVdPYmzSKWOH/QKiXcBzKUG/kuPP4RUbIPFsSXqcIP8=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=WKVtHJN54WeRFVZiK/gdr7Mm2SVkiSiuBne/E9lVu9izKOV+K1FDP4pjl0qImfIHsyQ4wkayJzgcd94IX/ND36ykDxm3zXMyX21hoS7lJGWKE7vHJpeSVjQuIHkWObSY4+gFFCGJsT4VntTbVkn/4A0jVhiJ9TH92Fqw3iCmRwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-43329b607e0so4147555ab.2
        for <linux-usb@vger.kernel.org>; Thu, 06 Nov 2025 16:12:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762474323; x=1763079123;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/spXl3uuTsx8sDbawOIWZLwy7Gm9R+Wn63YjTrF8mdY=;
        b=abmnaml8eSqdtyoSR5xI1fy/vRrR9SSqdHi3V7yKbCbV5Oa3TUwaIjHIDWP30oHLmo
         gLFVXKS3Je3Rt+fR44BnMwHYPckJytMQyPCemwp/Z7TM744T/+62iAtrwg/NSos9/98f
         JpOHJof87Frh9W21HtBuiOXEhIm02E5WZlROkB0L/gVhMwr5A8bOg+ntzmk+oIm2hEAT
         70N6i+zVQuIG3NMpEcuxPht0AYWYmEL4XW52mIPbGAS+yiUiqL/LuHWY7bWHyTA2M78K
         D5aNKcHRPMsWdryoaKZIlc8DO6fFSljlI+5fIEgucygIv+27jUIxCZYKKh6Zc28kEsfx
         aiIg==
X-Forwarded-Encrypted: i=1; AJvYcCVPBwZ+glwb0AhtezyFSQy70uWB/P1fP39KN2PnlTwBJfY+TaxY6FN+P9PjARX8hB+l/fGnQODDvQU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPwct9UfSv2j6D206oBKeL5Zm2eNHXnrhc8cbFQrDLB8XUT0Hj
	1L9feqH3zYI4SpNByhmBC7E7Vg3rpUcF9IU2FQ39RsvMeqc/1TizOFK+5XqYx2sSPrZmJqLhQbc
	72O+evuTUMJxQoC7s6zMLetbzk2aObYCMk+xivMRdNDLSOiYVtT5Ww0bx8js=
X-Google-Smtp-Source: AGHT+IHpSZmQHjj2xw1LrKSeIaGiCVAzshnJrIOP1c7YWbQBC1A1pEDfCWPYVr4zh9uN5K/DzxzgdlImZ3ehmMsUuPeiL8wG0i9C
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:144d:b0:433:4f9c:96a7 with SMTP id
 e9e14a558f8ab-4335f3d09f6mr22415875ab.10.1762474323196; Thu, 06 Nov 2025
 16:12:03 -0800 (PST)
Date: Thu, 06 Nov 2025 16:12:03 -0800
In-Reply-To: <20251106235128.8908-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <690d3953.a70a0220.22f260.0011.GAE@google.com>
Subject: Re: [syzbot] [sound?] [usb?] KASAN: slab-out-of-bounds Write in copy_to_urb
From: syzbot <syzbot+bfd77469c8966de076f7@syzkaller.appspotmail.com>
To: hdanton@sina.com, linux-kernel@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-usb@vger.kernel.org, 
	lizhi.xu@windriver.com, perex@perex.cz, syzkaller-bugs@googlegroups.com, 
	tiwai@suse.com, tiwai@suse.de
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+bfd77469c8966de076f7@syzkaller.appspotmail.com
Tested-by: syzbot+bfd77469c8966de076f7@syzkaller.appspotmail.com

Tested on:

commit:         a1388fcb Merge tag 'libcrypto-for-linus' of git://git...
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1581d812580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=929790bc044e87d7
dashboard link: https://syzkaller.appspot.com/bug?extid=bfd77469c8966de076f7
compiler:       Debian clang version 20.1.8 (++20250708063551+0c9f909b7976-1~exp1~20250708183702.136), Debian LLD 20.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=10ae2a58580000

Note: testing is done by a robot and is best-effort only.

