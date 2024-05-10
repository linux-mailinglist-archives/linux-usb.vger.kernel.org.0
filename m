Return-Path: <linux-usb+bounces-10190-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 406008C2003
	for <lists+linux-usb@lfdr.de>; Fri, 10 May 2024 10:47:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F1329282538
	for <lists+linux-usb@lfdr.de>; Fri, 10 May 2024 08:47:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC71C15FCF1;
	Fri, 10 May 2024 08:47:29 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52B7614BF8A
	for <linux-usb@vger.kernel.org>; Fri, 10 May 2024 08:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715330849; cv=none; b=RgrgdwjRkxf8kknC/fm7LcGmXmKyC5LIfxEZJp3VjJdKJ+AeMVZqcuIR7kfE5EYy350RKLu0f8REhkkxtVbcU5ZyfKaUutkLDl7zMiS0lHecAOk9XyL+0Y8RZFtDXfZqTPzeNimof0Kt+2XIGsO26OU5H1aIzHUjkvaqJcFMFHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715330849; c=relaxed/simple;
	bh=exOJw8EAR1YSuOnAFdCSIBAXxjg49TrN6aACOGqPHQk=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=Vi4aEl6CXBwicSS/fvJL2EBqd2PCL5ZI5f7JZ4VP8u4j0uSOpg1itbjNtRHr3zkyC0lFMnX7W1xY/IceFdiNTF2q4fhXok+r5FiyE0sZxkrHbniPH3R/MK2diJ+ErgmRhDR0RxzlRe8GEDckdD9Doxs7+4egL85NEq7mZoWnPRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-7e1af30a434so129779639f.0
        for <linux-usb@vger.kernel.org>; Fri, 10 May 2024 01:47:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715330847; x=1715935647;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XpD9qVq4Hpwd5UROK+voy9ilNo5bK/m4WK9c2Y2l9SM=;
        b=BjjusLbNIJok+t+G8GJCaZ9ZWZ+qhLSIXkqP0+nsTR2TcKxL5gbIoGTLJ3jM/otIPR
         VxNXDX/2pMKL5kj6ZpfL51V0WXv2VNulsHSkMElHY1ZAkugisnHlUnGIUDEevyudiCE/
         3rwGHSmmKBnXN2IDh50YTA2W2KvSr5iSevo6mT452QrOKTq/lvgmEaJFMxIkoycpYaJM
         VLOAxZ2G4bPuk7nFyEBM61+3FxnijBtlJ8TrtOabTJ8S5TBShKLOy7/qM+fj0e25QqIr
         1eVSnDwPB6FYVswrN7XQgSBMHoSpreIQDlp7b4wEN36+zkncNSpYJqllwRxO2kLHfeMv
         vApw==
X-Forwarded-Encrypted: i=1; AJvYcCX7kOZb3zOmb6VyJW6s/8njCLjuFVRkoEH5euguFsqWvnRTAQPC/gkWmfK4l2fv6wFRgTa0CENUriZMK/Pxs0QHe4gOcPXNZyEo
X-Gm-Message-State: AOJu0YwVT4mYjlH64uszVvzanSkEY268WST0gkJN+VTof29kzUYpXvYa
	WbhNN/wyLniiefdSWJoSLLONLK6yfipfayteyAOkyt+I+TE8phO7l6mfu2ECMPmIjaPFPDrz/Un
	dZ4ymaXWsJlfJ+l5t8puMKPzPPcHQVBEJABHlvtaTLePuIJYj57tDzoU=
X-Google-Smtp-Source: AGHT+IGxycv88vad4phESjnL4Kc3pCnpyejTbFRKAfqcwbLA2at4ZWScHJpWqE0DWpR8ymshVeU6XxVgAECa9w2L/tMibRf8Vri7
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6638:8305:b0:487:100b:9212 with SMTP id
 8926c6da1cb9f-48958af8591mr131917173.3.1715330847426; Fri, 10 May 2024
 01:47:27 -0700 (PDT)
Date: Fri, 10 May 2024 01:47:27 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000d556f50618159550@google.com>
Subject: [syzbot] Monthly usb report (May 2024)
From: syzbot <syzbot+list7b488901ebb9fc4e944d@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello usb maintainers/developers,

This is a 31-day syzbot report for the usb subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/usb

During the period, 5 new issues were detected and 0 were fixed.
In total, 74 issues are still open and 333 have been fixed so far.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  2933    Yes   KMSAN: uninit-value in dib3000mb_attach (2)
                   https://syzkaller.appspot.com/bug?extid=c88fc0ebe0d5935c70da
<2>  869     Yes   general protection fault in ir_raw_event_store_with_filter
                   https://syzkaller.appspot.com/bug?extid=34008406ee9a31b13c73
<3>  644     Yes   INFO: task hung in hub_port_init (3)
                   https://syzkaller.appspot.com/bug?extid=b6f11035e572f08bc20f
<4>  636     Yes   INFO: task hung in usbdev_open (2)
                   https://syzkaller.appspot.com/bug?extid=b73659f5bb96fac34820
<5>  405     Yes   INFO: task hung in r871xu_dev_remove
                   https://syzkaller.appspot.com/bug?extid=f39c1dad0b7db49ca4a8
<6>  353     Yes   INFO: rcu detected stall in hub_event
                   https://syzkaller.appspot.com/bug?extid=ec5f884c4a135aa0dbb9
<7>  304     Yes   KASAN: use-after-free Read in v4l2_fh_init
                   https://syzkaller.appspot.com/bug?extid=c025d34b8eaa54c571b8
<8>  275     No    INFO: task hung in hub_event (3)
                   https://syzkaller.appspot.com/bug?extid=a7edecbf389d11a369d4
<9>  261     Yes   INFO: task hung in get_bMaxPacketSize0
                   https://syzkaller.appspot.com/bug?extid=f7ac46d91cf13b4591a4
<10> 231     Yes   INFO: rcu detected stall in syscall_exit_to_user_mode (2)
                   https://syzkaller.appspot.com/bug?extid=a68ef3b1f46bc3aced5c

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.

