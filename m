Return-Path: <linux-usb+bounces-7207-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 562CC86A7EB
	for <lists+linux-usb@lfdr.de>; Wed, 28 Feb 2024 06:20:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E93E71F22AE4
	for <lists+linux-usb@lfdr.de>; Wed, 28 Feb 2024 05:20:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D33DD20DE9;
	Wed, 28 Feb 2024 05:20:05 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39492210E6
	for <linux-usb@vger.kernel.org>; Wed, 28 Feb 2024 05:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709097605; cv=none; b=soVSmEGKKYga84PE53ZgSLCe3VPtBjcc/aNO7UW7+TizdJP/lyzN8ttuYdyQrYQEl4FNYlUsLqqg/oWdJC3QR1+I3KcD3nA1b3cRRNzD66lSIGdTnX2XRYQFPx+DC2b2HsXd3yLqZgJ32yVwOvcYEH2VOSJZBOOI+Og3i9e9rAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709097605; c=relaxed/simple;
	bh=WxQrT4gLYNDVl0XjNABL7fIkgq44GNeMlzUDCjsm7Zc=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=aXP4dR4YcayrgkNUKeeXBToOn1JGueJxulN2rkycCd+UDl+78MGnlYLy8O+MLaTPfsWBcYdemHi/8ViB+cAk+/bqqT4JBrasGCrWlRyVwqJuDvUZ+p6MKFQhCz+Z9O7djV8bHIWNujSKQy/v2rkZK7eddO8AgirDMLpDMrFijiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-7c7e91ddc42so26174639f.1
        for <linux-usb@vger.kernel.org>; Tue, 27 Feb 2024 21:20:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709097603; x=1709702403;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dv6V2O6lQg2n9LZQBOk1bc2tXIQJwFPskMBoRcLDz5g=;
        b=QId1VUNU6rLcpLisYy3KjbBxmdHGFMdVHtTL0LWqzUkRpSR7WNoQEofkhSrOK8UtWe
         hOcnPlkm/mvpuRXZ3UQwWGkqjo7lreRYW/Lop5kcK46JUHaI+SQQ7TswLmtK/1nGTCIO
         G1YeRTJ+8FKh4E6DS3Arzfu41H71zNcehwJ+woj+izQQwAINBhJ9x4v/zMGba8M5VeLH
         CE5ddr5s1URnPyAVbS63wPgRKzSrhUbiFelRIrNCASfpSnvDQQmL7OHbb/N+z2JwBoq6
         030HbdCni3SauiPa8r5Z+f2y+DwBFi0Voiq2isEAGs9YgZ0nQtCPzfuJ4QUpK4YJXg/j
         zizw==
X-Forwarded-Encrypted: i=1; AJvYcCXMBQDAB1iScYMJ3qOR0zbp+h4JFbVZzvYPjDSTBV3n9YeC/NUZHse7vCMumNtj8yJxnANt8zkKe5nkQiBsvHi2be7OHVUCavcQ
X-Gm-Message-State: AOJu0YxndB+0tO+HrdENiczlitPeawV3ODVCM0tleT+SrEUXyKV8IQqQ
	E8WRdrqa9/wpC/vYORSf+Zp/CbwsxEXtvEgEBj4MtgivxrCVBI+Z8IPRXQYNv0ihU2u1ykAkv25
	lj55vBZ9c0z2htgQlfaHBkdyxAOyYrygdp5D0xSThBXhD7TrwsE3F2vo=
X-Google-Smtp-Source: AGHT+IHFpws7RuH68mE1HYjJIQQuWSpRs++cRXaZ6NLbzVNFAb1c3ZPabIvF/DPFC/xfmllw8CS5ebbDD8XmByptSQpnDWItU8Ij
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a5e:de02:0:b0:7c7:96ac:9408 with SMTP id
 e2-20020a5ede02000000b007c796ac9408mr18782iok.0.1709097603496; Tue, 27 Feb
 2024 21:20:03 -0800 (PST)
Date: Tue, 27 Feb 2024 21:20:03 -0800
In-Reply-To: <8fe3f46c-4ee5-4597-bf2d-12a5d634a264@rowland.harvard.edu>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000008b026406126a4bbe@google.com>
Subject: Re: [syzbot] [usb-storage?] divide error in isd200_ata_command
From: syzbot <syzbot+28748250ab47a8f04100@syzkaller.appspotmail.com>
To: bvanassche@acm.org, emilne@redhat.com, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	martin.petersen@oracle.com, stern@rowland.harvard.edu, 
	syzkaller-bugs@googlegroups.com, tasos@tasossah.com, 
	usb-storage@lists.one-eyed-alien.net
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

failed to checkout kernel repo https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/ on commit f2e367d6ad3b: failed to run ["git" "fetch" "--force" "--tags" "7b440d1b40dd93ea98b5af6bba55ffca63425216" "f2e367d6ad3b"]: exit status 128
fatal: couldn't find remote ref f2e367d6ad3b



Tested on:

commit:         [unknown 
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/ f2e367d6ad3b
kernel config:  https://syzkaller.appspot.com/x/.config?x=eff9f3183d0a20dd
dashboard link: https://syzkaller.appspot.com/bug?extid=28748250ab47a8f04100
compiler:       
patch:          https://syzkaller.appspot.com/x/patch.diff?x=14296a74180000


