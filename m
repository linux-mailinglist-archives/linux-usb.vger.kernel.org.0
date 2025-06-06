Return-Path: <linux-usb+bounces-24537-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BC67DACFC26
	for <lists+linux-usb@lfdr.de>; Fri,  6 Jun 2025 07:16:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 489261897538
	for <lists+linux-usb@lfdr.de>; Fri,  6 Jun 2025 05:16:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 009131E5201;
	Fri,  6 Jun 2025 05:16:20 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42914323D
	for <linux-usb@vger.kernel.org>; Fri,  6 Jun 2025 05:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749186979; cv=none; b=OihnPRCXyZXX/lJnBgcxPf45bNvS+PTkOrInuoACq+VYu5IJnrvhQ/Zspo2a9PLkiDBxT+pIKaGGjEd8J3Vk0QTOPjBwBU6X611n0J1Rv5tyJKPcZKeSyaIt5CjY3PbymPDN1oKo6fH+QbteTzQKkv4Cd1T0xIqiRo2d0befrcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749186979; c=relaxed/simple;
	bh=IxwqCHrACqYgymgSUXeVUNou/uoy837foUaUXgA+0k8=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=V9CxZdUvZ19f16ziUdM8KunjwkTZT+DYAFyRfolwQk0MgtR7uvhsj+xN/faojlmGSAPwxjsHWvX8QbMkW7j5Zl4hQ1lznrU0jVjB8HIT8TZIrG/93G/NfqiUmFnQkFhmCWfZkPyvxlwcAkKbwNPQXEOzy3AhM0my1NKyb5ZHP1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3ddbfe1fc8fso35769865ab.2
        for <linux-usb@vger.kernel.org>; Thu, 05 Jun 2025 22:16:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749186977; x=1749791777;
        h=cc:to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cCYACXMzeBDcelPE4ghIGAS5eRuewYDXuoVSiKWHsIc=;
        b=faoBMfZ4BzsQKW0feUETltHiz17rchDbrBrEjzlA1ekVg06sOYU8ZRqRqOyEkIi7kw
         wQt6NIXLdoZTNQqmemMpHgFolvbougyaDHTLTdaOHSA5jdiok4cDoWKOluq9elBrjQUH
         bvKFfq4WOP+8n3JtCBaw8d+xPBisvsH7O7oQionglJbtrRh9GQWLBwKrzXvx5alO43db
         Hc+Hezuzjq7boRTdu/6zdC5a0GxFqSlFkD/1KJswxPrvp4djgkF2wi48phc3S+gbFHdP
         P3d4tIi5RFI2sAasHul5pIduqeAtdQXI+rY0wG3vM50rk5KPXbgkcP+Tep1ee87AMraH
         isrg==
X-Forwarded-Encrypted: i=1; AJvYcCUpPvymbWb4zdcUdfjAz464i5qESZl2MrkHqlkEcvCFI1g7MjdKGnYFnxiFA+wWAmoUAN+xyusrChY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2nbGia79bZoOIDCfojhr2wxTuRCNnW8EB9KlbpzG3bwUJg24i
	yzcZ5gpt8K/dKfaIh4TUF2901g/1CtocUMtK12AhBKTRTH6rMxJX85j/7tnpr3pKy6u56JQzEKB
	OmEwD/G+xd4ImqKjbwizNVzhI9hhAQ/5kmfbJB7EXBSEzC8O0QFRQvw54GPA=
X-Google-Smtp-Source: AGHT+IGhuvLpAqQS7I+2m7Z9XzaPSkpAbybNsBDhKs5bekdBoj/OxhLRNHPqegbI4xxKRxzGwDGBXZgJ2CNvGDnzLy8AZrhAqumS
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:74a:b0:3dd:cdff:2160 with SMTP id
 e9e14a558f8ab-3ddce505a66mr23928265ab.17.1749186977327; Thu, 05 Jun 2025
 22:16:17 -0700 (PDT)
Date: Thu, 05 Jun 2025 22:16:17 -0700
In-Reply-To: <4a7f4d21-8b1c-4616-82bb-210395215035@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <684279a1.050a0220.2461cf.0038.GAE@google.com>
Subject: Re: [syzbot] [usb?] KASAN: slab-use-after-free Read in raw_event_queue_add
From: syzbot <syzbot+1e3edf922962b5ea40a4@syzkaller.appspotmail.com>
To: ipravdin.official@gmail.com
Cc: ipravdin.official@gmail.com, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

> #syz test

This crash does not have a reproducer. I cannot test it.

>
> diff --git a/drivers/usb/gadget/legacy/raw_gadget.c b/drivers/usb/gadget/legacy/raw_gadget.c
> index 20165e1582d9..d7fca01afbf1 100644
> --- a/drivers/usb/gadget/legacy/raw_gadget.c
> +++ b/drivers/usb/gadget/legacy/raw_gadget.c
> @@ -120,9 +120,13 @@ static struct usb_raw_event *raw_event_queue_fetch(
>  static void raw_event_queue_destroy(struct raw_event_queue *queue)
>  {
>         int i;
> +       unsigned long flags;
>  
> +       spin_lock_irqsave(&queue->lock, flags);
>         for (i = 0; i < queue->size; i++)
>                 kfree(queue->events[i]);
> +       spin_unlock_irqrestore(&queue->lock, flags);
> +
>         queue->size = 0;
>  }
>
> Ivan Pravdin
>

