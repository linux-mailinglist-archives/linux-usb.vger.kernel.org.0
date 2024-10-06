Return-Path: <linux-usb+bounces-15789-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F32991FE7
	for <lists+linux-usb@lfdr.de>; Sun,  6 Oct 2024 19:26:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 768CA1C20FC0
	for <lists+linux-usb@lfdr.de>; Sun,  6 Oct 2024 17:26:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E60B3189F25;
	Sun,  6 Oct 2024 17:26:05 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EE6028691
	for <linux-usb@vger.kernel.org>; Sun,  6 Oct 2024 17:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728235565; cv=none; b=cQdXS7ZZC3w4I+2a5Jno51Rd9GBXUrs9ya0eKCR6TOBIfZXkSXZXQRnFVEze+udCTVvX8ElTl4xbklMCO5g5qmQ4/xITpDp+OGrY9akhsVA5FGgfLwDbgrUXjH0A/Gb+fAthlbE71lrOxU2Yz0XQIQQ/Ft6OJFBQGmf9aTcgVnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728235565; c=relaxed/simple;
	bh=SSsfk3KhRZ4wR0/v6q9eKpiXGUKTImwsyf9gBgAGmCA=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=b+E9gDIC6iqeB5NRvIPR2TXwLCGNE4iibInYwPCKqi0aXmQ0PSW58n61aGYQjj/Kika0O3BGdrItwvEg6J4AxJgiBBmMTgKn/cUNXxfqOixoNjQWpUG+wqZk7IUTBTWxVK4c3O+PqDxGb7L4FqrG/5I5dsoMtl0ZyXfRIMwxA9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3a363981933so57451255ab.1
        for <linux-usb@vger.kernel.org>; Sun, 06 Oct 2024 10:26:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728235563; x=1728840363;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ay44yW1ZI97Hrhmn2FCLpUqokOS1oswD59si82KqLbU=;
        b=JxaGrZfIWdu5qsNFz21xy60zZCTCYfaaIwR58Kl/SbVZc+7SN2yIWdV0oakRa872ou
         OOIf6PiN7qxUBMRylwmxOdICA32LjuoTSM2kdkQ8tXCfuA5fzV8oEEwu+wjuX7bD79WB
         GoP6XlFDVKpSf8yU/nI2Jda1nPQO3bvCzLwfhomRtOaATyG92+xMfZAKm5nrGCWDraMZ
         z/7hs/aZWy6DyIzWnUxhOCS/ZPCEGlW493uyP8wn4Khzgo1jj+TjgT/4Sl9w69SOsMRI
         Pi7h+oZRVIAOM1u8uHPdo/PL6fm072ftmytVHzmpJk2rH/35F8+P6R3Me7kTNF04oJb0
         lS5w==
X-Forwarded-Encrypted: i=1; AJvYcCVtpcqLC9ZwLT3tdWgmAdz/x3d5Rucxu9Z2o02WdKdJpOFPf+TwuF0meCCI5BH0lmbgPB3MtBHDYXg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNZA4SSB3dL2dXuoP1ewromRZCOnUzL56CS3zaPKslF2dARDyI
	Zq6xX9ccoy4SuuYYVx/NPgX8/gRo/r79JxJ2KfMau/UhQys0XWg9O4qOav3X626acrqg42asMue
	20UWLP6KStsnYDCrsfCkK4KgH7mpBE9gYyjiAXBaNh/2UViLjTdFr7HM=
X-Google-Smtp-Source: AGHT+IGjcpEOA7E9HLup4ZcbDqU4uOkGT/4pexcaiSRPXAMYvJ0AtqO5qSltOZAG4fUbTDtVrxgM5kwcFZ8A2AF1Z7JgvHsBOeuU
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1846:b0:39d:2939:3076 with SMTP id
 e9e14a558f8ab-3a375bd2038mr82099585ab.25.1728235563401; Sun, 06 Oct 2024
 10:26:03 -0700 (PDT)
Date: Sun, 06 Oct 2024 10:26:03 -0700
In-Reply-To: <ZwLA_mQtFM-hTGxD@iZbp1asjb3cy8ks0srf007Z>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6702c82b.050a0220.49194.04da.GAE@google.com>
Subject: Re: [syzbot] [usb?] KMSAN: uninit-value in bcmp (3)
From: syzbot <syzbot+0399100e525dd9696764@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, qianqiang.liu@163.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+0399100e525dd9696764@syzkaller.appspotmail.com
Tested-by: syzbot+0399100e525dd9696764@syzkaller.appspotmail.com

Tested on:

commit:         8f602276 Merge tag 'bcachefs-2024-10-05' of git://evil..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=116cf307980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d302f14701986aa0
dashboard link: https://syzkaller.appspot.com/bug?extid=0399100e525dd9696764
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=122af380580000

Note: testing is done by a robot and is best-effort only.

