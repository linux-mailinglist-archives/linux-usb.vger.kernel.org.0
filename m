Return-Path: <linux-usb+bounces-29327-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BA0A3BDE65E
	for <lists+linux-usb@lfdr.de>; Wed, 15 Oct 2025 14:08:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 28B9B19C28F7
	for <lists+linux-usb@lfdr.de>; Wed, 15 Oct 2025 12:08:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BAEB326D51;
	Wed, 15 Oct 2025 12:08:08 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD61324B30
	for <linux-usb@vger.kernel.org>; Wed, 15 Oct 2025 12:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760530088; cv=none; b=Ee1/m0fn+TY1F0gOdA0GcF/LNpzwn2Wt7tQDvzd//5my0yKmK7F8w74o3/wzjp7C81Vg9JwKiuNO0iuO9NZYlQ6XMac4U0HwemeRQHyNh46dbMnTyGRfPYFhd/8g8ddNTu8S3Uau486AbQIxHuxB7SPrIGto8XigQUfAGSTHeNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760530088; c=relaxed/simple;
	bh=ikafkcyEhGPo6V77pZ1XIeb6FhQLfB2Bg8wg2NG8Juk=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=izwKgnnGrCoMvJP89YzpNGQmsE4y3h7KXw5vnG7/I51KLl5qEslPgdSJag1poeyurm+hdf1PHu7N469XMG6GlRHkcaG/t8ZaK3q3TM06kRtr3cKAdEr30yerTxCX3S7H8Vl7DMr6+GmC6q/bIONjL95xRZyqUT2xGv8qKrRagsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-430afaea1beso3739715ab.0
        for <linux-usb@vger.kernel.org>; Wed, 15 Oct 2025 05:08:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760530084; x=1761134884;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FyldEtwp1gai23TscGVppyYlBhxGh7CjaGIutLSt2gM=;
        b=eEX+XxcICDmuckug889MZbBHTN69Qt+DQG1UO9wEaH+r/jVSc7+YYwlR14Xa8s5qwU
         8vHupxFEdzmjdC9wduA2cv1fk+tRVuc/VirUDHw181J74DSZPw2m2xkqkCcIj7QTiCzW
         rporn1178HCzLkoFa5n3Ec3gxfLYW3r/z2ZgrhbwMyZkDB2Jj+zTej1uTNIXkWe4842L
         FsY4EEs+Lr5j8Rf8uOzBSRIfRgHSaFxF2zznKrSGYvzJeWSGbWHumiY3ffxGmCkkS6z/
         L2HxYqb3qIiJH5mojJSC698nmGXKXvvP/dj91oDZWre7zpFu+ohQWdPo8e5twSMz19ga
         2ZZA==
X-Forwarded-Encrypted: i=1; AJvYcCX1STtuT9E63bySwfWzUYlQXXS2nwlBXtBsNv8Tbr5ee9Afl+/3aPL+pxaOseEj4IpIqLT3CBlaEXg=@vger.kernel.org
X-Gm-Message-State: AOJu0YweZA3H2dQAvKiBCEwRJy9+XmJCSUYiBdiIz2N+BCqrvcJBPzB+
	RMYx8Q6yrwGLRqJZlp/MwEgxadgXlZIOmjJlNb00ZipclsXJbJ/a7FlhUDzs+pPmmX8/rN7d1GU
	67nIbhPw2VSfOrE8wpaSRl1vVBBmtet5yp9DwGVi7sDeMlBXbidJcqi/VOiQ=
X-Google-Smtp-Source: AGHT+IFUs2xV61Zf0+jSBMVHmQegBSNxFJn0g3yx0KHfRADZU8QekyoZnHSs5fRMGIG0qh5JXRBnChYI8lOYY3pn9m6HByojSwZR
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:214e:b0:430:adcb:b38d with SMTP id
 e9e14a558f8ab-430adcbb787mr18702975ab.24.1760530084431; Wed, 15 Oct 2025
 05:08:04 -0700 (PDT)
Date: Wed, 15 Oct 2025 05:08:04 -0700
In-Reply-To: <f945f2a0-c694-4874-a7b2-59cee4cb76c3@suse.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68ef8ea4.050a0220.91a22.024b.GAE@google.com>
Subject: Re: [syzbot] [input?] [usb?] KASAN: slab-out-of-bounds Read in
 mcp2221_raw_event (2)
From: syzbot <syzbot+1018672fe70298606e5f@syzkaller.appspotmail.com>
To: bentiss@kernel.org, jikos@kernel.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, oneukum@suse.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

failed to checkout kernel repo git://repo/address.git on commit 3a8660878839: failed to run ["git" "fetch" "--force" "--tags" "b7cf8f2fbfc36c709a08e0b9c77990e491473738"]: exit status 128


Tested on:

commit:         [unknown 
git tree:       git://repo/address.git 3a8660878839
kernel config:  https://syzkaller.appspot.com/x/.config?x=f3e7b5a3627a90dd
dashboard link: https://syzkaller.appspot.com/bug?extid=1018672fe70298606e5f
compiler:       
patch:          https://syzkaller.appspot.com/x/patch.diff?x=13bed542580000


