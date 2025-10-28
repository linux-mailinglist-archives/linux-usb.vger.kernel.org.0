Return-Path: <linux-usb+bounces-29803-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FC40C15FE7
	for <lists+linux-usb@lfdr.de>; Tue, 28 Oct 2025 17:57:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id B55C83560D1
	for <lists+linux-usb@lfdr.de>; Tue, 28 Oct 2025 16:57:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 773CD346E64;
	Tue, 28 Oct 2025 16:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kxtoXs2t"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AA09334379
	for <linux-usb@vger.kernel.org>; Tue, 28 Oct 2025 16:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761670632; cv=none; b=l9EXx5RUFSAQwlSC6mI6k+4RltTWk5lcoNhunt0WnoqdyuWtjbklfDNEYCGX42n9GvV0XD+KBj0ZjmVEkzWQkNAhE8qSPS9NoIHLipgTtfB0xQoRrhtg4Subt1/bms2bS61cLJepLVq+LM89T7ORjjpcvOnYD9jCqTDZfArEniU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761670632; c=relaxed/simple;
	bh=VWbzR5JJcNh9vxeY+++ECnRky78xd0PGd5/1QQmh4bE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VOIsb/8oygvrH++2oegX2QWEHcxV3MAhrVe94SpNx2rp0zHFtSp0oIPEzohJKCOOFZeH0g4juUON7xnarF0lBFQtm4tXfJIgERS+RC24Y2e/JWCxUIk2/C6SeIiKsfbLYCakSXnkISQnqe6jOJHIASbEjlSQm0emaRM/tKBKc7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kxtoXs2t; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7833765433cso7843289b3a.0
        for <linux-usb@vger.kernel.org>; Tue, 28 Oct 2025 09:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761670630; x=1762275430; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FZSNxR68yHjL7zAo+Mv3sJfsksYIyvHAgD0mbxvBcYw=;
        b=kxtoXs2tyYUa/OnUAm9YuC+KkVYe+0j6de840pULz+2oZhsfrvYD8yiM79I0JDuy/c
         8SgBz4l9M8qRgo4zykYrvK/GqiYdgeGkG5uzx1RoT2fyd5RTgyqnb2oBXpSAlQqEQcc0
         2xPaFreEStUSZ7ErmrHNFaDrsG4iSNKnkva6FZjCxzqFeMqGc874KUoqTyIPy0cmyMzV
         oKvou+7Ha5Irg2H/6Dy68piW6Db0r7OzcIPu1+jo6ktS3sJlCTtFT30wLuRROpqHFY2L
         H4Zl2Lr7mbsTm5d5xENsjsKyJ1q++5akki3pESzFpx7LQjkAT36kz4J4NcIyeVDWxKjq
         nJ2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761670630; x=1762275430;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FZSNxR68yHjL7zAo+Mv3sJfsksYIyvHAgD0mbxvBcYw=;
        b=QzCW28b0hexPoG38hCOiAiAxalmhVh7LCrZy3X47p3zpQR4D9b3T9N+vI5QQFayiLs
         Ss6s7sGeL9ICLMIHO4c/F43QSYfr589K53FF0PatA8JQIb0PuyYB9oKnKKuCwPxYuFTo
         FRgN2cDyxD95yeABW3X1zjAVFOr7UdgzMc5QZwIPC/KRXOgGjlo00csjhDYcvUi6Ai/y
         nUOVghsKpzVfBpC3W9Q41+vkKgeeBG3Omsx8VLq5qypSy5FJRDmVO+RjCSy2cZN+YolP
         m7nCN4APwxb+l+DMGK5kQAnG05wH2F84rfBzgK47PuTafZw2DKHmx8eTDHvuuhtr+Jx+
         u7Jw==
X-Forwarded-Encrypted: i=1; AJvYcCV49tLPa06MZmoawiFkcdCta2X7v6wOJKZ7BTqhWbrjliFrL9MQacYqrpkk2umdthJf5KUzSsh4PAw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDCMJ4GH2qKzVblMYKReutXed6qYd1YcXaDiRUMobQAmL13MKQ
	FxQHqCJWMFuHt0DEj6ooVL1ygUJd8oGnew2x6Yzhh8GFWb/BbyHcCD1o
X-Gm-Gg: ASbGnctC5OXg2DFan758aisSeaSy5ncQJ/n8MXRx6J5LhbkLw/muGIrX/nnHJTcg8Ih
	lHClDpUvK0GNmsHQri/6r5ed0s5T3AmqaZAks3UYZwVFeripnYY9SZbeqzAYaZaccLppbYDGxE5
	hMvmHDG1UxoDuy/EegyEvwmVccBwIu027bUV4DbMhK3Ss6cEWgX0pjYqdEkv6RzpHcVNJAlsHCg
	xFM6ljJmq297CLuoXWkhMw0jAp8pKRbCoDjy6qNt5ECiraK2OiKAzVHXcAFyU6GkC71ymHVZAE1
	2zpVW5fcilQMow/T2xAYfdmbm/cYnzSYGUmCDJCzS+cLbZASQv80nh1OFNShAKxKZa+OMiMRONo
	kzf1DeAqKBifLsIUWGnwiZ1s3rxW5zd2uEx1bZa4ZqTmeqPn7bj1HgFO81RhUpXyOqZg1Gf/Zj2
	BXuwZ0NXpDVuUvXWbFPbs=
X-Google-Smtp-Source: AGHT+IHYzX3zBX9m/HOdpIkdCjhBMv9C2sbByBuod4kCB2jxgbvqLV3QWhnzZ0epjRo8NPkrViDs8g==
X-Received: by 2002:a05:6a00:3d4f:b0:780:7eaa:938 with SMTP id d2e1a72fcca58-7a441bde268mr6351210b3a.12.1761670629662;
        Tue, 28 Oct 2025 09:57:09 -0700 (PDT)
Received: from kforge.gk.pfsense.com ([103.70.166.143])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a4140699basm12133857b3a.50.2025.10.28.09.57.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 09:57:09 -0700 (PDT)
From: Gopi Krishna Menon <krishnagopi487@gmail.com>
To: andreyknvl@gmail.com,
	gregkh@linuxfoundation.org
Cc: Gopi Krishna Menon <krishnagopi487@gmail.com>,
	snovitoll@gmail.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	khalid@kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	syzbot+d8fd35fa6177afa8c92b@syzkaller.appspotmail.com
Subject: [PATCH] usb: raw-gadget: cap raw_io transfer length to KMALLOC_MAX_SIZE
Date: Tue, 28 Oct 2025 22:26:57 +0530
Message-ID: <20251028165659.50962-1-krishnagopi487@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The previous commit removed the PAGE_SIZE limit on transfer length of
raw_io buffer in order to avoid any problems with emulating USB devices
whose full configuration descriptor exceeds PAGE_SIZE in length. However
this also removes the upperbound on user supplied length, allowing very
large values to be passed to the allocator.

syzbot on fuzzing the transfer length with very large value (1.81GB)
results in kmalloc() to fall back to the page allocator, which triggers
a kernel warning as the page allocator cannot handle allocations more
than MAX_PAGE_ORDER/KMALLOC_MAX_SIZE.

Since there is no limit imposed on the size of buffer for both control
and non control transfers, cap the raw_io transfer length to
KMALLOC_MAX_SIZE and return -EINVAL for larger transfer length to
prevent any warnings from the page allocator.

Fixes: 37b9dd0d114a ("usb: raw-gadget: do not limit transfer length")
Tested-by: syzbot+d8fd35fa6177afa8c92b@syzkaller.appspotmail.com
Reported-by: syzbot+d8fd35fa6177afa8c92b@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/all/68fc07a0.a70a0220.3bf6c6.01ab.GAE@google.com/
Signed-off-by: Gopi Krishna Menon <krishnagopi487@gmail.com>
---
 drivers/usb/gadget/legacy/raw_gadget.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/gadget/legacy/raw_gadget.c b/drivers/usb/gadget/legacy/raw_gadget.c
index b71680c58de6..46f343ba48b3 100644
--- a/drivers/usb/gadget/legacy/raw_gadget.c
+++ b/drivers/usb/gadget/legacy/raw_gadget.c
@@ -40,6 +40,7 @@ MODULE_LICENSE("GPL");
 
 static DEFINE_IDA(driver_id_numbers);
 #define DRIVER_DRIVER_NAME_LENGTH_MAX	32
+#define USB_RAW_IO_LENGTH_MAX KMALLOC_MAX_SIZE
 
 #define RAW_EVENT_QUEUE_SIZE	16
 
@@ -667,6 +668,8 @@ static void *raw_alloc_io_data(struct usb_raw_ep_io *io, void __user *ptr,
 		return ERR_PTR(-EINVAL);
 	if (!usb_raw_io_flags_valid(io->flags))
 		return ERR_PTR(-EINVAL);
+	if (io->length > USB_RAW_IO_LENGTH_MAX)
+		return ERR_PTR(-EINVAL);
 	if (get_from_user)
 		data = memdup_user(ptr + sizeof(*io), io->length);
 	else {
-- 
2.43.0


