Return-Path: <linux-usb+bounces-18856-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F6D89FDC43
	for <lists+linux-usb@lfdr.de>; Sat, 28 Dec 2024 21:58:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 79EFA7A1493
	for <lists+linux-usb@lfdr.de>; Sat, 28 Dec 2024 20:58:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FCD61991B4;
	Sat, 28 Dec 2024 20:57:55 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7732E198853
	for <linux-usb@vger.kernel.org>; Sat, 28 Dec 2024 20:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735419474; cv=none; b=UcrvK5RKib9Wq305Ee+XLdfqgf+nxf77rwUTz5RY6wxABqctaFoKTlvWzfm9A/a0iUto8ovFWo+RH/X+9ce98qpnwQ3k3PbzxwYzd9ABcRHT76tMcwCd+mF7NamAgayY9PEFGXKOe639feDEkvuAJ9lMyGk6kCjPH00IAenIkuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735419474; c=relaxed/simple;
	bh=zJdD/Hlgm0Mo0Jn/353hQ1sZGVhsqxgZKb0UmG/2gxM=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=QGIW0CqbTJi6LmhJBvXhaMM9lTNB5t79jl/Dc2NJBN96U0Cc8tOQnZexWeQm9EF0SIKUsaLfnU0zLGr1WTVj3+Do/qCtXEe7lnVOhD02v+atBSXqomDDGK9FFTfn53KZE/bZnAM/RTriZluLJv6w9tXuvu3kwMGs9pgdv9ml6Qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3cca581135dso5680415ab.3
        for <linux-usb@vger.kernel.org>; Sat, 28 Dec 2024 12:57:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735419472; x=1736024272;
        h=cc:to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m/dbaQWcTz64med4ZDxAOY2XdL0mP5cmgRkLcZzXkQA=;
        b=YecBB2AMXQ/afG+NUqeSR05NLBDuPd/S0FTaFEhieV45JaKx8Cew4ZqBNvDgtxe5nP
         zZyckwp52gUdfemXqZW/dln92/W+7tJBoNSsLlq36ElbYMSJ6EgC6Fwfv65ROuJ2FdBN
         Y4xiY/Y7jJJ2Z4r4ZCsEnQgyPOjN+LpreSHPTv9Dle638LedRDN8tfraC2q8eEXVKdzF
         M7Gn0a34iKjlqw/kla4OmlK0v43yoh7bhYGtxvn759S1d86TK8P4ZXGsefRw0aipzRlV
         1xt18+Tz6WjaElexIb0FDEA49IkB+LiSRK7+FKAQH4i7EGSqxl6owKiZTO8ookZIJZ3p
         YRqQ==
X-Forwarded-Encrypted: i=1; AJvYcCWl66bUuq5DMwNPbdcqmrVdoT+sX4pDHoj5ReeML9gyhOwdHV+kotZdwzqG3TP7khDOfKS2VbiGslA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyu/sCLhOk99Fr4Xfr+fTcydIsBne/2a6Beoaf3fexXCpjD3wOC
	yEwvhJ3AVPVyX0Ub9KDRIxQgtpSshbyWxnuq3Psa83Kh2iHkHcd7PHZSxYq3kgfjzkgIDglNHeC
	fsUxqv9BoO9kSB+ZFEh5uHbj82xF9AWFWktO2eN6W/hYmFR0eebF9Gs8=
X-Google-Smtp-Source: AGHT+IHEwI8M2TnSsOC7e/5GzWkjMmwdkSKcGRp2HVkzZfIo+Tp8Ma7zB7VA+O0YYEsyT/XZZ+IKwPfuU4sySCU4nJtqcPd7yL4q
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:20e9:b0:3a3:4175:79da with SMTP id
 e9e14a558f8ab-3c2d2d5164bmr257871345ab.13.1735419472675; Sat, 28 Dec 2024
 12:57:52 -0800 (PST)
Date: Sat, 28 Dec 2024 12:57:52 -0800
In-Reply-To: <0ffbbde1-b5d8-4a53-91e3-80e16da18e28@kernel.dk>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67706650.050a0220.226966.00b3.GAE@google.com>
Subject: Re: [syzbot] [io-uring?] [usb?] WARNING in io_get_cqe_overflow (2)
From: syzbot <syzbot+e333341d3d985e5173b2@syzkaller.appspotmail.com>
To: axboe@kernel.dk
Cc: asml.silence@gmail.com, axboe@kernel.dk, io-uring@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

> Should be fixed in upstream for quite a while:
>
> #syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master

This crash does not have a reproducer. I cannot test it.

>
> -- 
> Jens Axboe

