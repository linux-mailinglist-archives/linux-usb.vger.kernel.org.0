Return-Path: <linux-usb+bounces-25743-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F64B03577
	for <lists+linux-usb@lfdr.de>; Mon, 14 Jul 2025 07:08:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5FD331702B9
	for <lists+linux-usb@lfdr.de>; Mon, 14 Jul 2025 05:08:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8ABC51FDA97;
	Mon, 14 Jul 2025 05:08:06 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D971F0994
	for <linux-usb@vger.kernel.org>; Mon, 14 Jul 2025 05:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752469686; cv=none; b=F9qwmxQUsNQkdh4qDFPnPrSCo0cnawt1x+s3WnklLcmKeXocBqvJs/Vw5X1Nrzga7ADtU7FrhIiWYEsgs3KxI8T0vNlcEJnVdXY6iBRPLx3D8EzPn/C0GH4xf4XXzU9T/hOHsciEyvaEAsJjDmFGfQMx/jzAB5y/6b4Tex3RIjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752469686; c=relaxed/simple;
	bh=WlPI/wFJPEXMGS0nmls4LXyAqoJRNQ80VI40A1RMeP8=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=oMxAJStwsuChZzUP0V3o/tNLMhtTCfoTJd6sbdMbVAHCYNYRH9RAHZ+Abhk9Gm0qMcIi28I2+yq6FMqn7JW21lbhl5lXbuAmCFvaGF+Dtu4J6xdS5gF1dcxaf+5oNlTZszeUC6AwpIeNtsbyzwoUYL3dTqHtdYZHKJf2fSi3Tfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-8730ca8143eso456544739f.0
        for <linux-usb@vger.kernel.org>; Sun, 13 Jul 2025 22:08:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752469683; x=1753074483;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gIsNucXB6Px03mWQ5TC1KHiSeVFF2WgYavWzXtnawWw=;
        b=l/6Wp8atiIhDBWviaxUi+eJ/IuneqUCPaSByy+20kvym+CcsKApFMpxokGHxI08zmj
         VVZd97BhLEJ7Gw6RvZUEJu98A7oDlQXO16/S+pkXPdO8DsjokBAGMM8dHld59HScbkrF
         i18rVjrrJAOYbTSfm/oRQLKAr1ZuzBmqPP/SfsS3H4NPmS/5n9T80ImaPZ3f0vBZFn6j
         W4ZOj5SB8uLgXmQN10ont4t9C6ZCBCwFhp99bUYjEQdcL3+GD522UDeeZXzkDxTQPPdy
         qdC5fS4m0LT0/ti6KI5SoElJx1hSp50g01i7KaSQtTwUKkuRviiur/KuK5lbR4bthZot
         d/9w==
X-Forwarded-Encrypted: i=1; AJvYcCV3XkHrmsaZweYLupS0tQ4CyY8icssWRe7+tunPYuBav7H2HqwdjiWTv75UblyW+uG2EbXDOxA/m4U=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIdadmyvs1nkJAxT9ab+0PdwCY33LyBqWz27j3MKxxXou9AJ1T
	9FWi2cHSuil33AJ+ANccvdJZcEi02A5PJ4FHvegv57owinVqbNIkKf/8F2EOrQpbDJkRX1ociYb
	cL1XDWrmXrVbT9Fj+KgwHndmSt5ZOEsxa+rlVba/sLNLa87VGuC/e1v6MlV8=
X-Google-Smtp-Source: AGHT+IEpB5Rn6xJgA/DDklQnbk0r4Z3QBxG23xYQiRZo41BEGItwFGYXO0J4JcTEAhZ+4QpfV6TqHI2SbFxXzzrd/5fDbrDmHwWh
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:6d8e:b0:876:e10b:9763 with SMTP id
 ca18e2360f4ac-87978296516mr1051400039f.5.1752469683020; Sun, 13 Jul 2025
 22:08:03 -0700 (PDT)
Date: Sun, 13 Jul 2025 22:08:03 -0700
In-Reply-To: <20250714024903.3965-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <687490b3.a70a0220.3b380f.0048.GAE@google.com>
Subject: Re: [syzbot] [usb?] KMSAN: kernel-usb-infoleak in usbhid_raw_request
From: syzbot <syzbot+fbe9fff1374eefadffb9@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, hdanton@sina.com, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, stern@rowland.harvard.edu, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+fbe9fff1374eefadffb9@syzkaller.appspotmail.com
Tested-by: syzbot+fbe9fff1374eefadffb9@syzkaller.appspotmail.com

Tested on:

commit:         c2ca42f1 HID: core: do not bypass hid_hw_raw_request
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git
console output: https://syzkaller.appspot.com/x/log.txt?x=138330f0580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=7367e34c3d60253b
dashboard link: https://syzkaller.appspot.com/bug?extid=fbe9fff1374eefadffb9
compiler:       Debian clang version 20.1.7 (++20250616065708+6146a88f6049-1~exp1~20250616065826.132), Debian LLD 20.1.7

Note: no patches were applied.
Note: testing is done by a robot and is best-effort only.

