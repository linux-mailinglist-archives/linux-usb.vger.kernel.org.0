Return-Path: <linux-usb+bounces-30470-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 5982BC552C8
	for <lists+linux-usb@lfdr.de>; Thu, 13 Nov 2025 02:03:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 09B9D4EA0F9
	for <lists+linux-usb@lfdr.de>; Thu, 13 Nov 2025 00:58:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D350921ABC9;
	Thu, 13 Nov 2025 00:45:05 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C34F21DE2D7
	for <linux-usb@vger.kernel.org>; Thu, 13 Nov 2025 00:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762994705; cv=none; b=eDg65Wn/V+l1j1GBx/Vh5zr950LSHS2gK2Vy+Po6KQq5EZkP/Xg0xvuBW9WKrKpuRPH0QUHeW01dBDZRQmqh6C/M6SauR2aU1Xjf6yR20raNpaJqM9pNPy3rPiyY2EbChItWBVtICsHFszuvUsFReHGcC72cW/W5DklCk2wHHNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762994705; c=relaxed/simple;
	bh=akpD68FRXSgJ3UWTHxS/xTnoHxMdY2EKCElVcN8Lbrg=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=azvxUpzRxa5npGpEcJTMY7b76CwhcbBoopvCx5vzwxsPNF1OAuXVQfoypKU4+Xz83K7MX0ED9O5XNmBP8xWSIKLVEdohzRcRqZ8VM1mNSEzx+INdfIA74jI5ULvg6pEwcznPAB+vynmFp5HINUm/SVglXN7Z84VX7mg6rFhnD2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-9489bcc5a2dso39424739f.3
        for <linux-usb@vger.kernel.org>; Wed, 12 Nov 2025 16:45:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762994703; x=1763599503;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ItT12y+7wRZewvqvz8JD8QRcThWHmeWOgUeD7MW9ZBE=;
        b=FjNbahkNT0ngP1NCZYLQ/gTM+DVoEca/o0NbE9rD9P81N140EiXEi1ELk5qLZH8Jpn
         PR+Rq0dQfOLOV9MuYEsIQi48MXUh78BtmJj4ms6JHIz6sLxfP9ltZXMA9yiAs9eNLlux
         K3DWG/LAHazlP2UWfdxZjnrDvBF6jZq4xDxsMj8F7QGULFzmfMrK0oTyfvUQEoO7Yl5H
         2DajBuzb2yeJeE+Yg9s2ltedkRhPHsaW9IKIO0ggFaNe/V+OMy59vfyN1Aqr+gGH8BD+
         2Io8MxaM/VV2A63z1qIm+9tJhzi9Ld5HBUCbgtJEdYitM2O4U1/KZmmNItTmNRZ1NVOW
         01Hw==
X-Forwarded-Encrypted: i=1; AJvYcCXSKZgWJK5Nr4bpHLp0v0GxDi1f6kGotZRH94NlNe4qgmKnLFeYxA4En7d/78l0gNCsMsHHcuqnu+E=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRPs06mgMYkntK4QaWIfjygUar6Dug/T+S9IiaB0mujawhjGNR
	GXdujXlfpKJrUgfWLzk9zjaLCatcc+NTW1rSLcKnxZXk6d7eaXrPtUNu5WTi8ZSJVJpn8aEjHdT
	M8zsBV/tCY25tiHBCr63aP8bw1MnqJ4odu36/nr06dvsvzn9rgqg7ePSJj4E=
X-Google-Smtp-Source: AGHT+IGN8F2oZ/myun0ZFiJtclNF/dwsR+aCXcHsOpDqPUh5c+bO9sOqP7+avnEYzEIhUZd1GBkc7xXp0tpc8n7mkAJgoufSiItk
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2148:b0:433:7abd:96d0 with SMTP id
 e9e14a558f8ab-43473cff5fbmr71591685ab.3.1762994703007; Wed, 12 Nov 2025
 16:45:03 -0800 (PST)
Date: Wed, 12 Nov 2025 16:45:02 -0800
In-Reply-To: <67da6f4b.050a0220.3657bb.013b.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <69152a0e.a70a0220.3124cb.000f.GAE@google.com>
Subject: Re: [syzbot] [usb?] [media?] WARNING in media_create_pad_link (2)
From: syzbot <syzbot+701fc9cc0cb44e2b0fe9@syzkaller.appspotmail.com>
To: cascardo@igalia.com, gshahrouzi@gmail.com, hansg@kernel.org, 
	hdegoede@redhat.com, hverkuil+cisco@kernel.org, 
	kernelmentees@lists.linuxfoundation.org, laurent.pinchart@ideasonboard.com, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-usb@vger.kernel.org, mchehab@kernel.org, ribalda@chromium.org, 
	sakari.ailus@linux.intel.com, skhan@linuxfoundation.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit 0e2ee70291e64a30fe36960c85294726d34a103e
Author: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
Date:   Wed Aug 20 16:08:16 2025 +0000

    media: uvcvideo: Mark invalid entities with id UVC_INVALID_ENTITY_ID

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=13f0f0b4580000
start commit:   07e27ad16399 Linux 6.17-rc7
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=4d8792ecb6308d0f
dashboard link: https://syzkaller.appspot.com/bug?extid=701fc9cc0cb44e2b0fe9
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12e38142580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=12da427c580000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: media: uvcvideo: Mark invalid entities with id UVC_INVALID_ENTITY_ID

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

