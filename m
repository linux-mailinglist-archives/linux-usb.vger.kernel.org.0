Return-Path: <linux-usb+bounces-16099-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2958199A70E
	for <lists+linux-usb@lfdr.de>; Fri, 11 Oct 2024 17:00:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C55071F22AA6
	for <lists+linux-usb@lfdr.de>; Fri, 11 Oct 2024 15:00:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBE4A194124;
	Fri, 11 Oct 2024 15:00:07 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09BD318EFDE
	for <linux-usb@vger.kernel.org>; Fri, 11 Oct 2024 15:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728658807; cv=none; b=VOcx90UI8V/DCk90OS65VuBC+BEm/MgXaWKgeOmqDDfmE7HSVALahFvB2boEqcIwtm4qYWWSjMoZ3WqDlHChf2KGhlTiEzJQCXMMImjZ1Gzxy0x8WB15LC7pLZ5U4mbyGLto34JsOHtlDF42gfo8ICAtS1FUbAzedJLAChWEuDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728658807; c=relaxed/simple;
	bh=2Km6BL0FRqfzT5lZwFo14imXXYmVPoCW7wmjwz6b+WU=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=Jt27kiAIlCS++JcD8kabaQGSCXZ0JQpVuK33SCqlJ0GI+W3aOciG1ipyWcimagx3PNO4i4vHcqppDz0cJ3/eZruO3EQu48ZaYbN8r8ffY5o0W3Fgj7ugiJvb1goZA7us7XYqnnRGJxBZnLGQHMgO3xB7DaZwI5LOtsZeKPYxpF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3a3a6afd01eso17034785ab.3
        for <linux-usb@vger.kernel.org>; Fri, 11 Oct 2024 08:00:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728658805; x=1729263605;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F0ze3FDBtSlJGNVpIYg23jcNgdA3xWetND8s6HDKdd8=;
        b=bFNyaDDAVh3mI9fQx9JtIckTClexhk//OI3EdkadhTxc+xuX9qTTvwudufTIJJdlOu
         ki1p2b26zh81Q6+58rE5Ma8U8uHUU58T4UHlbFvryAcLUHqXRZq9WaS0mA+tvMUuyncX
         flT1DOfEF9UZ+TBx8rbRlTpYGaDwBpQwzvF6qmBedmgyuEskpvgtd9d7VFcliCiCO4/Z
         WtF9sCbru4lgpuAzmGi68Id11NFEkO9AK5TyM+blxuLz0r2ZP6X25X5vh7tryfEwq6po
         W1UDj7DPULjiReXZzTGFG5B2l0+DcbhJa4pDoU9sqxKbuBACPJOO8VUBQvDGgy27UtZa
         LbIw==
X-Forwarded-Encrypted: i=1; AJvYcCXFZZzNwwG+2SWxKD8/+vg3Jp2D8JF+GVy4fvh9M70zHMqygK+SEIsvZ+Qq8FQHMR4cAqtxbzHIWR4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8y7b0VfNiIdL26L5B+pAuS1nFCwCn2NxpXI/uPgB6EwK9zSr4
	WE/Wpnt+Fmn4R83fVHzOSMcGjKHmixnUf+eacB8kC5VvuqBmvtLHpEPpQGcXuE2NUYJFV4Nc7oP
	8HD37L3ADvbyXP3sNxeAoDdWC8RhXOYM3cuoo5Z4CtDdRg+FUKn1vVpw=
X-Google-Smtp-Source: AGHT+IEkxWbRSE+bJK3OWzUdHz4d+eWSymS8o0irv99aFLwC2JsKgBuMI6jVPSkv83p8SmbpjhpJMCobr0krqH9+JrIcnr7OfHRZ
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1d96:b0:3a3:b0d6:6b7a with SMTP id
 e9e14a558f8ab-3a3b5f9e4cdmr18900275ab.15.1728658805214; Fri, 11 Oct 2024
 08:00:05 -0700 (PDT)
Date: Fri, 11 Oct 2024 08:00:05 -0700
In-Reply-To: <9cc382bd-debc-42d6-977e-559d48b82f58@rowland.harvard.edu>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67093d75.050a0220.4cbc0.000a.GAE@google.com>
Subject: Re: [syzbot] [usb?] INFO: task hung in usb_port_suspend
From: syzbot <syzbot+f342ea16c9d06d80b585@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, stern@rowland.harvard.edu, sylv@sylv.io, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

failed to apply patch:
checking file drivers/usb/gadget/udc/dummy_hcd.c
Hunk #4 FAILED at 1301.
Hunk #5 FAILED at 1323.
Hunk #6 succeeded at 1778 (offset 1 line).
Hunk #7 succeeded at 1809 (offset 1 line).
Hunk #8 succeeded at 1818 (offset 1 line).
Hunk #9 FAILED at 1995.
Hunk #10 FAILED at 2389.
Hunk #11 FAILED at 2467.
Hunk #12 FAILED at 2497.
Hunk #13 succeeded at 2519 (offset 2 lines).
6 out of 13 hunks FAILED



Tested on:

commit:         4a9fe2a8 dt-bindings: usb: dwc3-imx8mp: add compatible..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
kernel config:  https://syzkaller.appspot.com/x/.config?x=4510af5d637450fb
dashboard link: https://syzkaller.appspot.com/bug?extid=f342ea16c9d06d80b585
compiler:       
patch:          https://syzkaller.appspot.com/x/patch.diff?x=12ae9fd0580000


