Return-Path: <linux-usb+bounces-26053-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 757C9B0C774
	for <lists+linux-usb@lfdr.de>; Mon, 21 Jul 2025 17:23:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C807B4E344B
	for <lists+linux-usb@lfdr.de>; Mon, 21 Jul 2025 15:22:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5320E2DECB2;
	Mon, 21 Jul 2025 15:23:05 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9758328C2D3
	for <linux-usb@vger.kernel.org>; Mon, 21 Jul 2025 15:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753111385; cv=none; b=Ui+EUYzZ2ebw3nw0fEij3MQleA1uuGv37C8LM4KP1CPbqrL0yESyknKPsRH1WMRgfSZfl+1IFdGAmQ1l02DfBI3OKPbELipzDaMzbX3/fj2kMJ5Sl1syOVxBZzq7nJ8sDBMHrh29LSkjMcbA265p+oqoYyh2ZnHbjmFdD6lCqAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753111385; c=relaxed/simple;
	bh=vgfQRhOfNJrtc92tlhGLleVrfKnZFO6SQWjGR5M+Lqs=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=HaiZZrwVBQQ4LwK2JHFCvEbaaqhMEgaal+2BhxhUr2AFW99X/J3jQGPsVulCAkqFuHKq+soBiScS1TPQPW/mZGLsyVQBM6wuC9U53UuQBPGDd2Zz83r8ZYhO61cr7ho2LdvM4iHSIqKjHDNr1JosnaZRpFBstO1YYdaJ0q4145M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-87c1d1356f3so211328539f.0
        for <linux-usb@vger.kernel.org>; Mon, 21 Jul 2025 08:23:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753111383; x=1753716183;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JnnNzxl9T4wc5fvQhb3X2ZvzvD3sDYfo1Lw48SOD28s=;
        b=hVM8e4a5IVwduWJek9iXyTgIf1WIRrh+sKPukY3mE4t2kRSZEGDRvsB2wH3rOQh++1
         4SaIOvF306d8h3zin33M+iIE4JcXEXa6QtgVbqZKmWbuz9G0Mno7fttoDy6idbhWmUe6
         CuP62Uf0iGeVpzxD4kcATFRodJeoZhvOXF/NblGmuEs9b8Ujd2PhUtAEyAGkAYyGNHVk
         qZwy/8dD25aUBKFpn1n3TjyNuD3xGGF8cUbrHJeZQK5GhsANYYRIVkNJ27ZaPuUfB0/y
         0OJDgFjVfq2dFeVC0OmYX2HPf4c/iferD9bzu2fWmr7REyguHEXwlY8uTtPBRRVlTaGi
         LJtw==
X-Forwarded-Encrypted: i=1; AJvYcCWi/MPT+NKmHFOGSgg1yLpMRmfsDyUs/HXgIcCr/BUv9N+75NamgvW1MLNjiOVs11MkrMry1hq/kK0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTNr5m80Q3vGxdmt6/2vmZ6jOXf5YWBWCLkv3cLZ4quZFuISZ4
	jTUs021YJa2CiXRRBSjN5V3Mnf5SBv7Kw51qSIqHzvzTSQSyzrXvT76S0EI4LCPSs/skq3EtzdM
	i7Z2GVUuDNbwGfmQRCFEL9GDErmXf5FEX/BpF2QBIKRZX2GClxz9Q26e5i5M=
X-Google-Smtp-Source: AGHT+IEXJhlHzdW25N89aTvgF9cgYyQhljvPvgMzdWEjwvMjmJsRZj/gTeEpluzGFnZtI6hYi+7Bqbib6cRYF2V5JqkqAMLadrRR
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:1490:b0:87c:1237:cef7 with SMTP id
 ca18e2360f4ac-87c1237d278mr1777230639f.13.1753111382796; Mon, 21 Jul 2025
 08:23:02 -0700 (PDT)
Date: Mon, 21 Jul 2025 08:23:02 -0700
In-Reply-To: <cd6d1bff-7912-4c55-b2fc-ea2032658ca9@rowland.harvard.edu>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <687e5b56.a70a0220.4e1c.002a.GAE@google.com>
Subject: Re: [syzbot] [input?] [usb?] UBSAN: shift-out-of-bounds in s32ton (2)
From: syzbot <syzbot+b63d677d63bcac06cf90@syzkaller.appspotmail.com>
To: bentiss@kernel.org, jikos@kernel.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	stern@rowland.harvard.edu, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+b63d677d63bcac06cf90@syzkaller.appspotmail.com
Tested-by: syzbot+b63d677d63bcac06cf90@syzkaller.appspotmail.com

Tested on:

commit:         c2ca42f1 HID: core: do not bypass hid_hw_raw_request
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git
console output: https://syzkaller.appspot.com/x/log.txt?x=16f4cf22580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=ec692dfd475747ff
dashboard link: https://syzkaller.appspot.com/bug?extid=b63d677d63bcac06cf90
compiler:       Debian clang version 20.1.7 (++20250616065708+6146a88f6049-1~exp1~20250616065826.132), Debian LLD 20.1.7
patch:          https://syzkaller.appspot.com/x/patch.diff?x=142bef22580000

Note: testing is done by a robot and is best-effort only.

