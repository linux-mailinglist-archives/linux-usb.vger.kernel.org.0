Return-Path: <linux-usb+bounces-32886-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +PihF3IcemlS2QEAu9opvQ
	(envelope-from <linux-usb+bounces-32886-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 28 Jan 2026 15:25:54 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F3931A2BC8
	for <lists+linux-usb@lfdr.de>; Wed, 28 Jan 2026 15:25:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 982EA30AE463
	for <lists+linux-usb@lfdr.de>; Wed, 28 Jan 2026 14:19:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2051A2FB977;
	Wed, 28 Jan 2026 14:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KH17X98d"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C764270EDF
	for <linux-usb@vger.kernel.org>; Wed, 28 Jan 2026 14:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769609929; cv=none; b=SRsGJXIeaCDo9GxKV89qIqzzua10DCUJpwKAVOlA8S5xP+bai+o1r/wbk14sDOzF2aynIaYcyFhXWj6o0I73siXJcwcTqhsn/kEG/CnifliU+6ScGLPP47q8UBR6WEAImVA3dax2ouaRwl46F4MXNuh6mmJAysieb149Kl+I13M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769609929; c=relaxed/simple;
	bh=zcLdBNJPU30hI8np4zBZEgvT73lBUyKoZki1nX24I48=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=udGMjvNAB4COTI5O0x2QzQ1MU0GRAudRqkhWM4l0Dri+TwkE6orY9/vFSOTxtqxhUZt8M8x3uSRSybwTgvS92W/8OQAyh3aXLhUdUGQ7q4/jR7NyMqcp2n5+yIyQEWwNxZhP4cu+DAbvTYCAusi/RNFA4lZFbIY22PCknyX+g14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KH17X98d; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-82311f4070cso587280b3a.0
        for <linux-usb@vger.kernel.org>; Wed, 28 Jan 2026 06:18:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769609926; x=1770214726; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zcLdBNJPU30hI8np4zBZEgvT73lBUyKoZki1nX24I48=;
        b=KH17X98dTAMwcNxYcvd3itByeYWUwVOXNu05hi+eE8Vw9sWBIXfAt3wXVbotaOYvlj
         x7WPdRngmXOFjInUicDd9vgAls3FKwb43ZG4RcEOzktDkkqJNryyRFZFKd7/OOwHwz9X
         wEqAfZb19YSE0m4YZJCmxW9NtgBa1/6arsW7CSWz9FZONV5CdNMatotEIncN6qQjvhBP
         Tzl5flI72HLCk11fCHv2r5Qsq1S4FRUcRMWg5iKlIsQtJ6ZHtA/Eme6xsKMJR4iglOdY
         9TV2D+K7ZKja59+1jEvyWjONpzCF4ZqR/nX33Yfk6+yxdXV3ibTvFf6x7DnEWS3CVo4c
         v8BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769609926; x=1770214726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zcLdBNJPU30hI8np4zBZEgvT73lBUyKoZki1nX24I48=;
        b=r9Gjwd6fLdKsati0v+FNdOkjM/raBoVMKh9Z1U+8OBVXZ2shcdHPERtzc7/H2AUDVT
         rFPnkYqVKzB9PAru1ZhHQzsr5xDJGZFkNT/SUv820zkwjaDgqnjMuDdQ8lvWj8dB86yK
         bhYVAoVWbUJ2V36ANLCWcAqmsM/G6VPYOruA4Il9vA7mThNS6vWV6NisfYj8DUj3+WCA
         fY+4f43/dpK1F2JeOLgxja62ov/I8+ECmmX8FqO/bSz8zAQGrFH5jetSY7/uANBrsHn1
         Zsil9dyZSl4VOCljlC1DguDNS2uMRzT//gjq/QvP7TZPcL079yvG/tQLwi+WTCS0KKrE
         xDBA==
X-Forwarded-Encrypted: i=1; AJvYcCVZht3h6CEKnAxAGuDs0p9aDpkJlNCLdwYNUA7sts6A0z0RGekNf8/cR3xNIa6RlM2oGqH4WUObqqc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWGIy2W6PztCBqa8f1Wu2Cx6NwmMp0TXpc4msDirwSmkKpC+V8
	AqMsL+80jrhzmLaUEUyTpgqnIjSSN7x2Dd6MSbja4kKDZ9Si5qeKCFWD
X-Gm-Gg: AZuq6aJ0dvyu+RS1PA3BXGOq6hPlTzWEaOomXlRBVsJLFkOUk9j2CQbHziBvfgUXT35
	Q2RyjNXxwXbITrZ8pBmDi9xdg9JEYbKT3xuQ9160RdA5UuyAEPBuB9n1Vv44JBz1N7dEUnwJr+Q
	lDKPr2GhReA+sA2YyUhRcMCOOjHrB7x5HghV7LWq9MRd1z6HqTexAQZCewgjO1fsVYONB82lbYL
	ypzChGzHpTV70b6d7cs2dSPiH4R7Zz8uqNwmFhbk5mShiDJYiqe3rSbk6AoNzEk9q98YCuN5adC
	1TvtwqY9fXV5b8okimm9JV12GjbxAzqfv+6Hoabr38aHGCifNBFkPuF06aqyO+L9oPW49frvhFJ
	evlu+6/FlrFDMJoLE8gdL+C3Xjhoytoo6FLOJH/457r2+OhK7c0FeULkxYzOYj2mEpT7nohNKGp
	KQnnlf3NtMe+pR8cQbwQQCjd6ifnPnnI1tft5pRQ==
X-Received: by 2002:a05:6a00:3a1d:b0:81f:ac1c:709e with SMTP id d2e1a72fcca58-8236a43992fmr5020759b3a.31.1769609926222;
        Wed, 28 Jan 2026 06:18:46 -0800 (PST)
Received: from name2965-Precision-7820-Tower.. ([121.185.186.233])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82379bfd7a2sm2793084b3a.39.2026.01.28.06.18.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 06:18:45 -0800 (PST)
From: Jeongjun Park <aha310510@gmail.com>
To: syzbot+c63f59479d561970dc2b@syzkaller.appspotmail.com
Cc: gregkh@linuxfoundation.org,
	johan@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [usb?] general protection fault in qt2_read_bulk_callback (2)
Date: Wed, 28 Jan 2026 23:18:41 +0900
Message-Id: <20260128141841.50281-1-aha310510@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <69795995.050a0220.c9109.0028.GAE@google.com>
References: <69795995.050a0220.c9109.0028.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32886-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[aha310510@gmail.com,linux-usb@vger.kernel.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-usb,c63f59479d561970dc2b];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	SUBJECT_HAS_QUESTION(0.00)[]
X-Rspamd-Queue-Id: F3931A2BC8
X-Rspamd-Action: no action

#syz test git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-next


