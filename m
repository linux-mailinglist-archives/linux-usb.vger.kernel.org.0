Return-Path: <linux-usb+bounces-25789-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8D0B04787
	for <lists+linux-usb@lfdr.de>; Mon, 14 Jul 2025 20:50:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1074D3A8A28
	for <lists+linux-usb@lfdr.de>; Mon, 14 Jul 2025 18:50:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7F6E27781E;
	Mon, 14 Jul 2025 18:50:05 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 430562264D5
	for <linux-usb@vger.kernel.org>; Mon, 14 Jul 2025 18:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752519005; cv=none; b=p56405ZuLnM3Spt5zdz105Y+4KFH0owD4gp1kyj7we0inpwMCc7Cw2t2ok0SjXhr8TzhHG6IiBVLVetz//OL5GBnFtliUTZyQCO8s45yE4zMPqDOAwKZUh+mNeI7NjRwCfbspIyEMm3liRLBG1V5RvKE0Ukgnt8CWMTSjzOwPUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752519005; c=relaxed/simple;
	bh=sL3Ty6zb90cdZAu3orpLPgO6y1Pv97CVNHZeDEtIJI0=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=Q1KbXjO1Rk48UXh/YRFVn07p1aP6k0CzmYFTD5UUHkQcdFEThau94kpEdgDHJmVX3D+nkMP+AtEmYRAHsfNAGVTK10Bs+ZLtLZxoyBmVRNuqj9pnEL5eZ65ANKGsmbRsDgxRKGtB2FD9wKfTf9pidxQL1+sQhm8l5cd4/NXGY/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-86cfff5669bso458434439f.0
        for <linux-usb@vger.kernel.org>; Mon, 14 Jul 2025 11:50:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752519002; x=1753123802;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aD+SVBl8w3djGHImI0ouoaCds+D4brGq+H/e+A2QQA8=;
        b=UE80l/G2Zltu1RLUk/KW+Fo7pzoAltcWtkweAvkf8oY37R6/6tLC3sRmSgCYHpa5r6
         XIWUzzdeU38BmjKPf8BTK7u4TpNf/HiZo72pCeb00+RFnA8VYe768kpWBcI8k8pG1oRA
         yXducsgqdQ660b4F0Wt2F9FAmY+j7e3YQAmPqnKRqDY32cxy3mBYtHo2dQo5/t0cxszG
         rBuwoZBhEljPXHn6lYtyHIkHNTwpWvCRD0JWvOQKubx7zQluNCNRliJZK3pzIHsxw3N+
         kmqEL2DvkO3kZR3raVpzOUWaBoN65cMDZoCUJfCbd8t4QcjABtfhjaX/VWarasVB+8lR
         7QHw==
X-Forwarded-Encrypted: i=1; AJvYcCX+VcoyM/WJhWHcIyJPeZ7Yj5wIj9a17YewladTDOrnY0FGUF5aJdOyZ8CAoWggy86C/i8NizKQZrc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxN9GJ68M4WnVOnEhic/RL++WMHJA+AW8zBdLNvdtn26vcESMii
	gwYa/t1VMFDGOhC6vAYS9mrWBRLOnolIt5GJfLTHHW8fTol5DM0S9RrZdFHnxfLM15b2D3PozwK
	l8KzwCdoZ7jGtS0ueXW3UUBhNXlDxcd92ynPekqpPML3NLq6y5vlZovLRRzs=
X-Google-Smtp-Source: AGHT+IFzNT+ecM3Iao421peKAwInDKwETKEbMkk8Yte5dfJG8bGYr6cgBOlEREmDlx69Fk8YtdQEjKR2+ZeBTJgp7PRDfp+n2UjI
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:2bf0:b0:876:737:85da with SMTP id
 ca18e2360f4ac-879aec80118mr86370039f.0.1752519002324; Mon, 14 Jul 2025
 11:50:02 -0700 (PDT)
Date: Mon, 14 Jul 2025 11:50:02 -0700
In-Reply-To: <f6e67c38-8d63-4536-827c-09757a8d5609@rowland.harvard.edu>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6875515a.a70a0220.18f9d4.0006.GAE@google.com>
Subject: Re: [syzbot] [input?] [usb?] UBSAN: shift-out-of-bounds in s32ton (2)
From: syzbot <syzbot+b63d677d63bcac06cf90@syzkaller.appspotmail.com>
To: bentiss@kernel.org, jikos@kernel.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	stern@rowland.harvard.edu, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

failed to checkout kernel repo https://git.kernel.org/pub/scm/linux/kernel/git/hid.git on commit c2ca42f190b6: failed to run ["git" "fetch" "--force" "--tags" "0d6f9bdf969aa7d8637c9aa20dfc4a9cfc8f96cd"]: exit status 128
fatal: repository 'https://git.kernel.org/pub/scm/linux/kernel/git/hid.git/' not found



Tested on:

commit:         [unknown 
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/hid.git c2ca42f190b6
kernel config:  https://syzkaller.appspot.com/x/.config?x=28729dff5d03ad1
dashboard link: https://syzkaller.appspot.com/bug?extid=b63d677d63bcac06cf90
compiler:       

Note: no patches were applied.

