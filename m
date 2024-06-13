Return-Path: <linux-usb+bounces-11300-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5825C907F5A
	for <lists+linux-usb@lfdr.de>; Fri, 14 Jun 2024 01:25:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EA72E1F23BA3
	for <lists+linux-usb@lfdr.de>; Thu, 13 Jun 2024 23:25:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F02314E2E7;
	Thu, 13 Jun 2024 23:25:05 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8582A131E33
	for <linux-usb@vger.kernel.org>; Thu, 13 Jun 2024 23:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718321105; cv=none; b=aYK7bOlurzs03N8oC59HNc6NCiA7olY4IWhdlyA/EC5t+o7cSXrisSre3EShx6qh8VzCjXEcxNT6+rlMPCWSYzKLvFyqwNsxadv//8Us+CSi4OYuzM9RGxTaNSSkCc4dikbIReXDsSXJQTy0N0pJx0qzGvDqAkYEyjOlAnbAZ4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718321105; c=relaxed/simple;
	bh=kRSIYh+IYVsXXlkBrcyb1CecN7b4j+1hi+u7PUdG9pU=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=tY8m2m4H0//Nn2DfiQ46p7Kp/H9I2EVmgkhXqNgGtl9X1EEeMHyc/5gA4LtAQTfMNBMjPcf2tuy68QMrEr/sUCkmczJ0q4Y7xDzjEY2CK6qgZOwIYHlSLf0y/6qgCe67foLSOF7EkUG70QxZX+d1KU9Dh6e2q9oYK6kB4YkWaE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-7e20341b122so141784339f.1
        for <linux-usb@vger.kernel.org>; Thu, 13 Jun 2024 16:25:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718321103; x=1718925903;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qG6e0f6B6AAWAv+NDZols4qYfUhB6B8cdTbTKaoc4lY=;
        b=VqB3o7qqCjKznIrLIJZ1w0caaKYmxdUJ5XB96KkMX/gw8f1tvyCupQAKCLWh9JR0FD
         5blZxUx7ykmVoDKcMrFER/PJtEDTXdWbUVVjcShOfTDNLCtB89YyGkSey+V1xpnwyMa0
         XnfEjX3xInUNAGDJv23ZVaqrhoel+I9a80kbYXgFjrAV0dTv5rDQc1EFW/LjntQY/28d
         YY+2biNpaPu84EEQqe/pPLwQBFscbpP3ggaiTQIExHFkSmjhcwF4Ym77EQI0OvQcgFPK
         s19waYx8zh4+1xy6gAiTsXdccKWCs5p/YWIaA3D+q7U1uF03jPl8e+z72Oc1HP0DH+si
         +yog==
X-Forwarded-Encrypted: i=1; AJvYcCWiOff8OUOgbXdca8TLWbALbsXPz5fLx7QBCSgOiq9ytpCye8md7/q9eEaN+66+4Zbrw4AlDcP7p4RYi7jFJO0iBSJ7ik1QeR03
X-Gm-Message-State: AOJu0Yz3nmRwrXNsOkrZFACW4Dm8Qz3Y6+IUKfLZ/2YR7kEXuC/U78FN
	uNc1IVW2X2CmEbOi1QOCfKgjAwjw6aYLqhIL0Lx3CZPD38trqPnq1pff8GygQ2/VfFcAk4+73WK
	4BbVeds6TDA4QjLxuPVInLT6JKJ7W4qHVlM3xuCQJM+yZU9puRG1MV2s=
X-Google-Smtp-Source: AGHT+IEhDJvAgrT7IU1f8Os5C1RPrBKRLzz2lQBbD8T5VpaHGB5z5lOjl4EfW2O2KasgHQP6Kj4s1zW3ckdJhh2SdkGJz5NJZnVa
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6638:14ca:b0:4b9:23bf:6fd5 with SMTP id
 8926c6da1cb9f-4b96420b2c4mr11353173.6.1718321102775; Thu, 13 Jun 2024
 16:25:02 -0700 (PDT)
Date: Thu, 13 Jun 2024 16:25:02 -0700
In-Reply-To: <4e155544-60df-42d2-89ea-924ebc9f7057@rowland.harvard.edu>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000f0fa5e061acdce6a@google.com>
Subject: Re: [syzbot] [bluetooth?] [usb?] BUG: soft lockup in hci_cmd_timeout
From: syzbot <syzbot+1b2abad17596ad03dcff@syzkaller.appspotmail.com>
To: johan.hedberg@gmail.com, linux-bluetooth@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, luiz.dentz@gmail.com, 
	marcel@holtmann.org, stern@rowland.harvard.edu, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-and-tested-by: syzbot+1b2abad17596ad03dcff@syzkaller.appspotmail.com

Tested on:

commit:         8867bbd4 mm: arm64: Fix the out-of-bounds issue in con..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=1258bf6a980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3b4350cf56c61c80
dashboard link: https://syzkaller.appspot.com/bug?extid=1b2abad17596ad03dcff
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
userspace arch: arm64
patch:          https://syzkaller.appspot.com/x/patch.diff?x=137d960e980000

Note: testing is done by a robot and is best-effort only.

