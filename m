Return-Path: <linux-usb+bounces-7256-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4928386B498
	for <lists+linux-usb@lfdr.de>; Wed, 28 Feb 2024 17:19:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 04B3F283587
	for <lists+linux-usb@lfdr.de>; Wed, 28 Feb 2024 16:19:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 549146EEF3;
	Wed, 28 Feb 2024 16:19:02 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F966EEE6
	for <linux-usb@vger.kernel.org>; Wed, 28 Feb 2024 16:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709137142; cv=none; b=axS/EgAATHZ2Qfkv3DDnyrnp/HP4MNmN0IFARgIfKgairJnUiE8u+oQ0UiskNqgx9OSNqdfhFrHWcUSrS9KpfDEDo01RSY7sBAMWVpXZHHpdmSR2Q0ZMJQIyZhNN6am6lGSoGzx2aUL8Flna2sVGukhbjw8QSYseCz602zjowac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709137142; c=relaxed/simple;
	bh=nm0QIhozGeokRZEeYOZ32vlq1g1dRDypTQbyfbboVlY=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=RFmEMtWSkNMPgGLpp0WMeuPrtPRcnk9tgeFlu+VU7t2lxAki8qrb+di82AH/a6ZNgn6b2l0QqeVVAD7AHpKVg17MF2SjZGD+iJmOmfk4TEtKxZlDp5Nr1BSrhOjPpfHUvXZYYTm3NOhkvl98vK6rq0JZD7sXsrS0DReEn48DxQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.222.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-787f6208f7eso64390885a.0
        for <linux-usb@vger.kernel.org>; Wed, 28 Feb 2024 08:19:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709137139; x=1709741939;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D2+BZjLMLPbTol5136AECdswnej6ENJrpqcO+Did4T8=;
        b=whXvAknw0r2DbIzF32HxjEb49pcfPdsqb1k1GZDbcuhuVP95/Zx1RdUe0BRYoOnYp5
         Lv1DHNwM9tznpffNUT1CFHtCe37DN0nkup+dv49A64PfzvFrCAMMpGm/gzMmrzxvXRZp
         zW5NDpmLI3fkKSkdLJpGeduLPSHwCnutcnqsVJsB3tMzhd+deW6QodrO0bbWSO40KlHD
         XUpXA6QWS/apdwFiAqe3mxcQ8OmFR4AtryYX5MWA01vRRruTUIYVPdh//BKP6hI0SaHa
         k62M+okWB5txIz2LbPOrm/J+pB4oEJYX8zUu/3BQQZMPwzadoklJ47UgkkKAkWbCznuR
         9c9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXySr26zeJawjH7IDfqWRBb6DWWYNpMjV5RQX9+GJADTd9fOhjYh3gPS86QoxjjZdVEcc1nQyGLGKxt1jPNgEJe2eSnqc3njWbl
X-Gm-Message-State: AOJu0YyeEXe8LOvsernQcgeBBHvNukLHaX6McIwcDqbO8UKq9Jf53p4D
	jpTcNP/MINxOuwz1oQ/9siIdMgvNPjRHNnhlQVZodsEljah1zAFGmgXfMIjuqrVx1ECJd4xG4lf
	ITqfm2KXkLPOrX8JNQOMF1JUmvrLouLU93dk/c7J22pJzuxM3HTvTlSc=
X-Google-Smtp-Source: AGHT+IGlkaQCxb15VvCvtUjD5hXCn8zkfnnfuqU3idRbfSsF7m5N12Lg7/fsFG9dW79vLkDmOEpPcnTFxjGJeXE5lxUifLJZwae7
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:9a:b0:365:616c:59dc with SMTP id
 bc26-20020a056e02009a00b00365616c59dcmr28337ilb.2.1709136784996; Wed, 28 Feb
 2024 08:13:04 -0800 (PST)
Date: Wed, 28 Feb 2024 08:13:04 -0800
In-Reply-To: <13add23d-af18-4f84-9f1a-043932a9712b@rowland.harvard.edu>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000f1426a0612736a90@google.com>
Subject: Re: [syzbot] [usb-storage?] divide error in isd200_ata_command
From: syzbot <syzbot+28748250ab47a8f04100@syzkaller.appspotmail.com>
To: bvanassche@acm.org, emilne@redhat.com, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	martin.petersen@oracle.com, stern@rowland.harvard.edu, 
	syzkaller-bugs@googlegroups.com, tasos@tasossah.com, 
	usb-storage@lists.one-eyed-alien.net
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

failed to checkout kernel repo https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/ on commit f2e367d6ad3b: failed to run ["git" "fetch" "--force" "--tags" "7b440d1b40dd93ea98b5af6bba55ffca63425216" "f2e367d6ad3b"]: exit status 128
fatal: couldn't find remote ref f2e367d6ad3b



Tested on:

commit:         [unknown 
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/ f2e367d6ad3b
kernel config:  https://syzkaller.appspot.com/x/.config?x=eff9f3183d0a20dd
dashboard link: https://syzkaller.appspot.com/bug?extid=28748250ab47a8f04100
compiler:       
patch:          https://syzkaller.appspot.com/x/patch.diff?x=164aa516180000


