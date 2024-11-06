Return-Path: <linux-usb+bounces-17173-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3679BE2CD
	for <lists+linux-usb@lfdr.de>; Wed,  6 Nov 2024 10:39:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 50AD5284241
	for <lists+linux-usb@lfdr.de>; Wed,  6 Nov 2024 09:39:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17C5C1DA618;
	Wed,  6 Nov 2024 09:39:05 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C5F1D90BD
	for <linux-usb@vger.kernel.org>; Wed,  6 Nov 2024 09:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730885944; cv=none; b=LKO5Xwy8anRRtLd91zNscTM788m4l7CEkNkTps2t4DZ0sSljXbITPfPRlT6remBHqj4A5Nn20j4LYLgCmohbVwBaycO0GTvZKiaMwrkFDPQO5SSrxBH9BlxxaiwBcER67ASpzuFBmYN/MPMWlgsIRqJmuaXTqlqCd1n7V27vtFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730885944; c=relaxed/simple;
	bh=jY1MyyQ6CBg/d7B1++LcX40duebZ3GfatJWLh6QK22Q=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=dgj+YRUJuZxwT2mdEGhRuFOf3j50ca9LCXhUeLQ52sVVhfbxw4D5MMmi4ncS0Ler8tIkv/AEbKvwFGZMqnv1t62ZMW3mdKRJDLHB5PjPHnwxy6/d7ri6qGBcO4KqQHiNJHnQtZ6QDhGFcbjfNg4xGFyj01T0oE951Kt5Cw0tJDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3a3c9886eccso67701375ab.2
        for <linux-usb@vger.kernel.org>; Wed, 06 Nov 2024 01:39:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730885942; x=1731490742;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ggduSk2H7lz1GLlAbI7VY3J3qCqRKz2N+b+WCUpGlws=;
        b=jgCWqd11V7eEEGNunN2iYcCZJYWpLVZ+xWOGYIDio78hrZPQZ/+ydM0SYOPvdTrmea
         LnqfZEt0WdCec7MkESZrCj6YJLPhXpPiPk94in9A7Uj080nmIEgUt1AZo8J7DKs9qzpt
         g3xTME6PlvuqOiAv0M+/SoG5MRVdDp+XHzkSdji65GZsXRLUhPNWT5mVahai/KyB0V3/
         0zWS2Cf+sPDd8gWk2h6u1ubEWHPu9W8JW/HtNLinjDmd1DpCrP/5mhlrDCZmDOrcUZzq
         s2Qrv+xlcAIRbulFmaBdtRbRW2TWexVMabiSoZ+rSMEMyrL0DF246sEPCFY7M+AXTqEX
         GRbw==
X-Forwarded-Encrypted: i=1; AJvYcCUbyMyFo/zYu+J/6OdEMo9cG8DplaulEyujvpBltorMTRzYtBUUIDUWUSIcvslUxPvoSf7ctgSLtrM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXD/RJVAzGOoRo/Wy/KkbaUTB6QISSivrg/ZhW/6DRqpzWLBYI
	rpCTQfytFHDQQzCxllneuL3A1so0uaTv0NbsMMYyiITVDqml/U0/wdxioxmfz4YzbU7DzKT05Vz
	P2FaiHvv5fnlXLCfKF3HYi+LCg52hkLSizNS8QgOwuDD+ZoMnV6x7TWI=
X-Google-Smtp-Source: AGHT+IFocSTtVZsydWbv/7AnXMugilw0SsT0pPAXS1AZGxg1inErNOhFtUhS3cdY2SKEJKWy7Araxix/wKCQ4XVHqNDAQn0KjzbN
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1645:b0:3a5:e250:bba1 with SMTP id
 e9e14a558f8ab-3a61752ae86mr225559535ab.18.1730885942507; Wed, 06 Nov 2024
 01:39:02 -0800 (PST)
Date: Wed, 06 Nov 2024 01:39:02 -0800
In-Reply-To: <CAFj5m9LSOvbaOdM8Gvgt8HVprB_DAxiFDOW3Qou8bfAtEz_e8g@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <672b3936.050a0220.2a847.1ba6.GAE@google.com>
Subject: Re: [syzbot] [usb?] [scsi?] WARNING: bad unlock balance in sd_revalidate_disk
From: syzbot <syzbot+331e232a5d7a69fa7c81@syzkaller.appspotmail.com>
To: james.bottomley@hansenpartnership.com, linux-kernel@vger.kernel.org, 
	linux-scsi@vger.kernel.org, linux-usb@vger.kernel.org, 
	martin.petersen@oracle.com, ming.lei@redhat.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+331e232a5d7a69fa7c81@syzkaller.appspotmail.com
Tested-by: syzbot+331e232a5d7a69fa7c81@syzkaller.appspotmail.com

Tested on:

commit:         72697401 block: don't verify IO lock for freeze/unfree..
git tree:       https://github.com/ming1/linux.git for-next
console output: https://syzkaller.appspot.com/x/log.txt?x=10a15d5f980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=dfea72efa3e2aef2
dashboard link: https://syzkaller.appspot.com/bug?extid=331e232a5d7a69fa7c81
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40

Note: no patches were applied.
Note: testing is done by a robot and is best-effort only.

