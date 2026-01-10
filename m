Return-Path: <linux-usb+bounces-32135-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 406FED0DB50
	for <lists+linux-usb@lfdr.de>; Sat, 10 Jan 2026 20:22:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6E5C5303E676
	for <lists+linux-usb@lfdr.de>; Sat, 10 Jan 2026 19:22:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A072B28852E;
	Sat, 10 Jan 2026 19:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iDHreQ5Z"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8AA618DB37
	for <linux-usb@vger.kernel.org>; Sat, 10 Jan 2026 19:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768072965; cv=none; b=hN/1wiz04xx8tY0EMXrRfNTFgIFiXGHtbUM5aCt4SH7d/m9HIEePiee/uBR61BeSl3YTigwFAJLjx0N2l30Z2w/oCHSGxo6rCP4FQ1rM/EzrlWC6zPXNY9UJTbg04xbU0jPjyyyXUucAQxpkA1pb2BsgyDAXQpB4M4V0nl1gXmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768072965; c=relaxed/simple;
	bh=Yro/EFaDcrJHJUaHkqAFe4SvLolOsKDoHa8f6Ty2G5Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=l5fYNrTdqRuT/0daXSroPKx0txL//rAYS38aKwSFdumTBXqt3VqtIenNK5YqygnRaSLtjdCW0FMC7VyX1sGC68C9B0GZZ9hCfqSe+SXTJexk7pvjoX44kLoVWtf7rFC/y4ZRqyo+5B7nwsjPGFvL96IHkNcEurbn9Q7xEAbE/3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iDHreQ5Z; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4ed82ee9e57so67962471cf.0
        for <linux-usb@vger.kernel.org>; Sat, 10 Jan 2026 11:22:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768072963; x=1768677763; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=n2qOKSN2/LKplz5xDT7OJ6TqAkcGsvuYaO3IpAITyX8=;
        b=iDHreQ5Z92ecI5m6oELO7DpXU+SUwGmuPzPt+qJXE0hn1d/69YZ1k+uURhfFRdXnks
         Kt7/NV76UCc7fmQUx4XuNB/UH66Sn1QaLKvl/DUHisnsI5HYBSKnxA0wT7tvhv32FYZi
         Ze/eNG90bsXu7/cBcRFgpXVTaEzVJQKzaFvHZ42vtlpdh0Bg7O6ib4+A+2y526L7EB62
         su8Q8910rhyOFF2fnvCJfU6AcbL1H6xofXGiRhsMoPFcDQoJmcWX+eFleFJ6X5L17DJp
         Wbil135kkxJCatQbKOYzfbzUruiPnDOB2uTd0to9V2Gr45j/LLNSNoSjiJ/31Pwko/GE
         usiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768072963; x=1768677763;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n2qOKSN2/LKplz5xDT7OJ6TqAkcGsvuYaO3IpAITyX8=;
        b=lg+k80LTtue/NfQSouHjO+2mnvC7L9NtsmrUpaXTLaseQUjbWXEMEbwWpWHHa9WTIq
         XBUIee+IAc5mLBkM6pu9nafkPPDmRuwseqDYAlVfvz6YRbES2/Jup7lR/qHvQeKVx1V5
         qZt5nfqIizxH6LtZe+T34CdrqrOVghK5mNf9kJ4t5GDvVZT+EEEr6F/EoUXlf2xq2R2r
         Lxs9zawPO5Yu7eAYpfEOx6Pn54VV9jevttXL6CKrTuv9Uhm8qH6tUCtAHiVQyaofqid+
         2LfpyuCNJkwwkGjwjlGqS0I5TlNFI4IgSNRjwZiGIBMdwE2068v4bwrihnA5qO8GiUR0
         c27g==
X-Forwarded-Encrypted: i=1; AJvYcCXBXDTCqmYAAfm2f+viNxIAnIa3gcrtmjGNm4wsUvmnWz0DGWzOHc8LgumWh3Gq1qoMhqTxK0i6LC4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyL/DKWhnksK+MUz9wITYiQeouVBhtId4QQ122BZuUPE0A3JdM1
	aOdHJzer5K1OE2laaeGl5R5g1ceeguATuGYUBIc15kzB53jgUPAyHQFW
X-Gm-Gg: AY/fxX5PcGoU/Z/DSsP4wRot/hVnL/tANK5PKOA4XUNaK0rS0FIXsjyyBY6Q1/BW7Xd
	PLPByW+TreBCYN5NvzcsEJKtHJtEeWXZLdaRaYVaiCTAyQvrxPYweBVVxGrFh1doYe1Wp/9Q1yz
	LS5oV49taDhWtqJgXZ/Ftx5K+YNPx10yi7p6pydzVqDdl9Aqle+mV5A21XEx0ozte5Q5HdwUtD5
	GVLXyCm+7mMuuiQzXjhF7ip3ji8IIj3MRleckboKmPeXeQN8dAb18f0uwgpo2f48zOcUAkyPdH/
	j9evPREC/CDYCb38iwAmr/4lGQEYyqSWH1WznM2AjwjR0+lhUqwEc4d4hMHjn8sdDrrOr13LGn9
	Kv7uiRRPJLwSI4SXxFktxKMJIlDm9XBCK70UiY8Cqcjy6WU7/2DIxMzC+2jHQnsy4JmBe4kPn9v
	yfz1Rvtb61QxGJZr15t3cZEQS7MmlEkLIIAXzsxtSoWb7ppqQ58VYLe8Jue8g1DbUF6myBeebcj
	JNndyobHnWbHINwaOMXH+gIp4ijEE5L4Qamx1k9xaE=
X-Google-Smtp-Source: AGHT+IFtvlg+AGl8bD3EOoMS9DmbAkw1cVPMjy8S5I7lwgoYs9TBiwZ8k/bKK9L7O0+LPRsBvl6T2Q==
X-Received: by 2002:a05:622a:c7:b0:4e8:93a1:7464 with SMTP id d75a77b69052e-4ffb47f0f1cmr162748961cf.15.1768072962892;
        Sat, 10 Jan 2026 11:22:42 -0800 (PST)
Received: from seungjin-HP-ENVY-Desktop-TE02-0xxx.dartmouth.edu ([129.170.197.124])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ffa8e6257esm92419021cf.31.2026.01.10.11.22.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jan 2026 11:22:41 -0800 (PST)
From: pip-izony <eeodqql09@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ingo Molnar <mingo@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: Seungjin Bae <eeodqql09@gmail.com>,
	Kyungtae Kim <Kyungtae.Kim@dartmouth.edu>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: r8a66597-hcd: fix potential divide-by-zero in prepare_packet_read()
Date: Sat, 10 Jan 2026 14:22:33 -0500
Message-ID: <20260110192233.31955-1-eeodqql09@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Seungjin Bae <eeodqql09@gmail.com>

The `prepare_packet_read()` function calculates the number of packets
required for a transfer by dividing the transfer buffer length by the
maximum packet size (`td->maxpacket`). The `td->maxpacket` is
initialized in `r8a66597_make_td()` function based on the endpoint
descriptor. However, it does not validate whether `td->maxpacket` is
zero before using it in the `DIV_ROUND_UP` macro.

If a malicious USB device sends a descriptor with `wMaxPacketSize` set to
0, it triggers a divide-by-zero exception (kernel panic).

Fix this by ensuring `td->maxpacket` is greater than 0 before performing
the division.

Fixes: 5d3043586db4 ("USB: r8a66597-hcd: host controller driver for R8A66597")
Signed-off-by: Seungjin Bae <eeodqql09@gmail.com>
---
 drivers/usb/host/r8a66597-hcd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/r8a66597-hcd.c b/drivers/usb/host/r8a66597-hcd.c
index d21a03cf5c17..445551b4b05f 100644
--- a/drivers/usb/host/r8a66597-hcd.c
+++ b/drivers/usb/host/r8a66597-hcd.c
@@ -1097,7 +1097,7 @@ static void prepare_packet_read(struct r8a66597 *r8a66597,
 		pipe_start(r8a66597, td->pipe);
 		pipe_irq_enable(r8a66597, urb, td->pipenum);
 	} else {
-		if (urb->actual_length == 0) {
+		if (urb->actual_length == 0 && td->maxpacket > 0) {
 			pipe_irq_disable(r8a66597, td->pipenum);
 			pipe_setting(r8a66597, td);
 			pipe_stop(r8a66597, td->pipe);
-- 
2.43.0


