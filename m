Return-Path: <linux-usb+bounces-16101-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1669D99A825
	for <lists+linux-usb@lfdr.de>; Fri, 11 Oct 2024 17:45:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4AF41283D3A
	for <lists+linux-usb@lfdr.de>; Fri, 11 Oct 2024 15:45:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D42F9198830;
	Fri, 11 Oct 2024 15:45:05 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A02313CF82
	for <linux-usb@vger.kernel.org>; Fri, 11 Oct 2024 15:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728661505; cv=none; b=o00lo85WmVXysEFWO3RFbvsHS+xEidHBovoB0eYYRj6OGpOcN9GSdRgRsbjTC/X8GgEIetsZuD7eHLcWCZpUlmoCvZcTgvTq3RCFDLiVCJHvc4SyJ4aVuP9W95e6+VSj/kZuNDNIu2n1XMmIoIV1a2vhC755Rx4USuIa9FzFMFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728661505; c=relaxed/simple;
	bh=+uc0hhAqphTbjudPJIQn/tyiL8OZySdOBLM33j4fMFs=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=YPCrKhaXrKHCdmmQdUKnRV3upQDrBHASjLgKVzaEv/FBDBgqj7odWR10VUzgjyk20F8oI8DvQIPCWoL47s9SeJvKqBjJE7b8I7MQnINKf6jIaVDYTUg6XOgJ3uwpbtT0YeVK7Tkx3ZdIHTseOhac1Cey+KvTCDon77UPh8K8PQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3a3b457f6aeso10098705ab.0
        for <linux-usb@vger.kernel.org>; Fri, 11 Oct 2024 08:45:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728661503; x=1729266303;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+M7SUVnhOnFY/CM4aPao/KOYlDmXQ1r/N4YzLoeViPQ=;
        b=nzk/fwQuwCjOF/jaVbskQiIjUJchazbKqgSvnFPY95OljUfvzs1gCQYGl0349iuceR
         +gdf7iZa5K+/wmnOLRctJ3u2IrgjO0RwjXi3QDVfIZKVoywFTJIipo8gqTruZHxMl6Mr
         cCkNe3S9nFBNKfHilJLgYbXlXjs4upqGTmMQlpbM7yMrfcyfMijRK94ec6vU6rZbLUkj
         OcuAta0zESuIxICrViDKItmsMYOiG2gQy7PeE6nrsbv8BakutuU/b75MpjJSAT+bw6Jz
         OLJDXCkqA2HtxnJbqXimnYTbIiE5niNquWPm9miATaz5/JCXotp/uom3eTUC4fh0FIJS
         v0HQ==
X-Forwarded-Encrypted: i=1; AJvYcCXy/z+4lLYwIAxnkHCgRpWsnZ/E85OEruz/1kw2R31K7Ogl0ErdgH3zNYlbQeP6it0pwUV6y8sUAOE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwvLeONf1S4UMLlqARifICjBl7x16Tbne2Rp2Vdwf20/k2xctDz
	VQ8AsCF8VNBA98kEuaZlcoHyoyLjYyxaDBXtlSwwQgsvR3pZ91It69al/XeB5eWjSYObeuIAW6r
	sbj9vPEjPa30XMvkpdrseWXDtnLBDKTJceNLyvg9OOvRalXHa+nSS+sY=
X-Google-Smtp-Source: AGHT+IFnLIT4yn5vN+MCS2Bt0OuENQRZSOOvbTh8SHAQ3UiRVyple98Ekr6pH0usG/WrfU9qeWsmyLVrYkDwQr6qDegO6lym79Oj
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a92:ca4b:0:b0:395:e85e:f2fa with SMTP id
 e9e14a558f8ab-3a3b5844745mr24141105ab.1.1728661503096; Fri, 11 Oct 2024
 08:45:03 -0700 (PDT)
Date: Fri, 11 Oct 2024 08:45:03 -0700
In-Reply-To: <b9ce2eb7-1770-4198-97b2-f5d7aa57c3d1@rowland.harvard.edu>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <670947ff.050a0220.3e960.0014.GAE@google.com>
Subject: Re: [syzbot] [usb?] INFO: task hung in usb_port_suspend
From: syzbot <syzbot+f342ea16c9d06d80b585@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, stern@rowland.harvard.edu, sylv@sylv.io, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+f342ea16c9d06d80b585@syzkaller.appspotmail.com
Tested-by: syzbot+f342ea16c9d06d80b585@syzkaller.appspotmail.com

Tested on:

commit:         4a9fe2a8 dt-bindings: usb: dwc3-imx8mp: add compatible..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
console output: https://syzkaller.appspot.com/x/log.txt?x=15346f07980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=4510af5d637450fb
dashboard link: https://syzkaller.appspot.com/bug?extid=f342ea16c9d06d80b585
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1456db27980000

Note: testing is done by a robot and is best-effort only.

