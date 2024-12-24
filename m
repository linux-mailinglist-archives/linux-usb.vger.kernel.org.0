Return-Path: <linux-usb+bounces-18764-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC8C9FB9CD
	for <lists+linux-usb@lfdr.de>; Tue, 24 Dec 2024 07:24:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 288E916471E
	for <lists+linux-usb@lfdr.de>; Tue, 24 Dec 2024 06:24:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B41A17BB16;
	Tue, 24 Dec 2024 06:24:05 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A5DE13774D
	for <linux-usb@vger.kernel.org>; Tue, 24 Dec 2024 06:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735021444; cv=none; b=hK8aXQHNluVn4MDb7sKXy5wMnLdw5Rb3h7D6uwFFZvDiTu7iEcL0Hp9LtH5Ke0ggBTiaPHc2ROhGu5TPZdcvNsrJ/g37aV+tgXKQ9TqxpgdBABOrslljpCxV5v7nXu5plIXtaZJ4CCLLRSlpOHQLih0KnvPcthfkud/RW5arduE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735021444; c=relaxed/simple;
	bh=MXzlKSwOGCI1XXQ61VjEYAgCn6j6p10k4UqY5qMglZw=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=PbXIHlQVaqc1HmbJ7gb3W4aHHs5V8TB2Psk2O1Rv50pEKGj3zQWdP4MkvTBXbfLtlciADmdyNR/JI7t372+xLwDzL8FOa563OrLG/Hcr4xWlHWlgRrtD+KTgVCVIAroPu1twPlTObNqmddz5zy0mtzDCDNP/5575xct3BhJHrCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3a7e0d5899bso107099965ab.0
        for <linux-usb@vger.kernel.org>; Mon, 23 Dec 2024 22:24:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735021442; x=1735626242;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SblzuJBesHFVjaNJKKW8WutChPVdT51mxhglVDJXNiE=;
        b=TiCmLRA8XM6XVMkQ3cJKAPLGltPLNLn7h5NFBs3XYg6xnyx7u/OBVjVyDTKLZuIL0i
         s4WT4LrNfTzL2gm3wzhO3hrlJiIc7e9pfe70fvpC5kGRGawme5z9C/rRtIwvXstOmlP4
         d4v4H9SoVMfUVYO/1lgR760DNn4fotVFc7FB0UK74TLyAsJzNIVBXfTDmaG5LWDPAVih
         NvIc2+B0yreT3KS8DeeCyp8ivjmNa8H4INEJg/d08d08uYw4SkmP/xwXRLhZG8XuOUiu
         2vqiBN32MIAArKHyuILX/5rK12a4RfTtNJ7mkJdFNqgCFH5aneT3EvaPr5utbn6KyxOJ
         B8CQ==
X-Forwarded-Encrypted: i=1; AJvYcCWjDO5tUWCtM7G3GZB5OtS1nfWmwW50vYmiQhBndNo5FDhWrJrfrZO2OVTi4fUP5FTohlAR4MEjo9Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSqi6yMn1S3RSDPAeo6983FaOZe3hNYD0dC2Hixmof0YT2rpkw
	h5BbQy9NRzfr9zRIyEklu4Y8RNT6MwEni54XVP5P4PtEVF3lcH8qtsBM7oFAsVCFaTVs+KYZ7oI
	eeq8tSbfnnPiffw5KZtU5YomdSodS2MGRWACXsBS/2D3vbBGIVGnWOVg=
X-Google-Smtp-Source: AGHT+IH5Hx62rRepnJelJtQJ8sdAWuFF5a3JpWmRIfv6/1eGAfZAGB/MKANmjkpA7PjVg1BABMu96SJYY0CPLJHJNwgC8idATgJ/
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:34a0:b0:3a7:21ad:72a9 with SMTP id
 e9e14a558f8ab-3c2d5152acfmr130327635ab.17.1735021442596; Mon, 23 Dec 2024
 22:24:02 -0800 (PST)
Date: Mon, 23 Dec 2024 22:24:02 -0800
In-Reply-To: <672ad9a8.050a0220.2a847.1aac.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <676a5382.050a0220.2f3838.015e.GAE@google.com>
Subject: Re: [syzbot] [scsi?] [usb?] WARNING: bad unlock balance in sd_revalidate_disk
From: syzbot <syzbot+331e232a5d7a69fa7c81@syzkaller.appspotmail.com>
To: James.Bottomley@HansenPartnership.com, axboe@kernel.dk, hch@lst.de, 
	james.bottomley@hansenpartnership.com, linux-block@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linux-usb@vger.kernel.org, martin.petersen@oracle.com, ming.lei@redhat.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has bisected this issue to:

commit f1be1788a32e8fa63416ad4518bbd1a85a825c9d
Author: Ming Lei <ming.lei@redhat.com>
Date:   Fri Oct 25 00:37:20 2024 +0000

    block: model freeze & enter queue as lock for supporting lockdep

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=117bbf30580000
start commit:   c88416ba074a Add linux-next specific files for 20241101
git tree:       linux-next
final oops:     https://syzkaller.appspot.com/x/report.txt?x=137bbf30580000
console output: https://syzkaller.appspot.com/x/log.txt?x=157bbf30580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=704b6be2ac2f205f
dashboard link: https://syzkaller.appspot.com/bug?extid=331e232a5d7a69fa7c81
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16952b40580000

Reported-by: syzbot+331e232a5d7a69fa7c81@syzkaller.appspotmail.com
Fixes: f1be1788a32e ("block: model freeze & enter queue as lock for supporting lockdep")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

