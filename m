Return-Path: <linux-usb+bounces-32888-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mFdKIAIoemlk3QEAu9opvQ
	(envelope-from <linux-usb+bounces-32888-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 28 Jan 2026 16:15:14 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B5FA39AA
	for <lists+linux-usb@lfdr.de>; Wed, 28 Jan 2026 16:15:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E9A3D3004C27
	for <lists+linux-usb@lfdr.de>; Wed, 28 Jan 2026 15:15:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 685D236A037;
	Wed, 28 Jan 2026 15:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ijKGy/r6"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA49036AB4F
	for <linux-usb@vger.kernel.org>; Wed, 28 Jan 2026 15:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769613309; cv=none; b=T8bkwnvEIYi2Q88B2acWQmfoKpnfT1FEH60qgiHlfPoC6pIs2vNBo98yxnFvKZVk0CbMWIw8Yt9Mj7p67W9ZPeqrtViSXcN6lFbDGGRxFhE88NnnarEX4ROYrY1ccQ/bJGAq/COW1rMPH97061SMyfAEeiZmFd+K7/sA1ULoWC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769613309; c=relaxed/simple;
	bh=k6r36afgChgB+L7XIO7dE2/0p+DmjSgpeNmgkvjDYf4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KRReZS9gxv0crFo0Q7zaqJZ4xflQK9C4Niw0b/ndCUyGtbel7cHbwPAf5eGjUY6nCAZJaeagEUUCHWV9VwajOQePe+j8heVQhXXMGIIThW5ZTFMh+6RlgSrZmu1niEjiVwX0UxUhh39EGKsbUna/sfr07R0agXFUfwwUdFiDA9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ijKGy/r6; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2a7d98c1879so40357675ad.3
        for <linux-usb@vger.kernel.org>; Wed, 28 Jan 2026 07:15:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769613306; x=1770218106; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k6r36afgChgB+L7XIO7dE2/0p+DmjSgpeNmgkvjDYf4=;
        b=ijKGy/r6u0iWnDScYBfLPwnE8sIkTEofYGe2COw3IEQzRPtbH7OiZMUh4er9vmrSMg
         2i+risRoQKjvnmoUPGqN7RE6IC2q3KLI5rrneEqWL6V4W1HKohHeRjO006cH+VbvA8M6
         DNGMU5G6jPd6GvPfBbJb73p9UAVFFOxhyqUP78Ceh3BzW6mL8GiieTvazJuy7IHsFP+U
         VtsuQQamVjHx7pBQRl6BQ1VHXWLF97XcRLqW1hnAMMK3djbKFcfAFx/i4POsuJ/NobHK
         Vhn9gPtZ4GpkI66LY8ZS9Qd0RvaVJzKOufzNyj2r0NKkDp0bkzcfcJwExCPzSakX9fqg
         eCPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769613306; x=1770218106;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=k6r36afgChgB+L7XIO7dE2/0p+DmjSgpeNmgkvjDYf4=;
        b=PPIQNlnwbySCQWD6eanf0skAwdSqWzCWuMp1HmWm68WrX0n+jgQROlPW+MaXUdlEmK
         W80hLKIuBG0lKontuZqDZ6wlWbKAJAe6IVjE/iGm63n0ZWOP36ntH8CYA0VAzgSvkDbM
         0gUC8SUYpxbYloNlLdbA80R7KxyOlJfJokMPLwocUxOkoKFHFcv1VhC9lLqHnVYzc4r/
         2XWOZTOH3NNOH5u1QhO2mwvGhVAtnbZ4kLru6ANa7d0P5wf7SHzCK0XzKsHavT7JpLhv
         KOHOn0uv3rgLWbSoz36zY8bWOQ8J7JQnsuRegBs4vZHz1DXoMzTlTtnsAap/ls2or2iP
         71uQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVxDCpG/isAnAG9PUlZZ8p7l7Of9GCmVocGn/xsec+CZywk137PHRlJH1svZBXyZau3Yom7Xj0x7Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzn3MKBm6hEmw8PFtoVVx2kNp8sMasyCirT4+EE95tFmvDOwVTv
	XkLIuZQt1wAJ242Ruw4BPm6xSx/QCcgALr5R0DLILLAz6OvB771eVemZ
X-Gm-Gg: AZuq6aKi1nACybhwfvXuo2twJczaqP3ZPTdt5eTeLXkF3mCXV5WMR22pUw66m8EjV1q
	NnTLdH4/MvNniRRNYsZBTkEIKE5DniQ8oOR1HDgZ2EO/ikqF3jKbvZquPoiVo7xHaQ5duhLe7b4
	wB3shNDoW7dwnTBD1eo74CnObSsA3udR04DYalbFtIRMcD84ZizSsp19NOuaX4ITDX0wIimyPts
	zrDqW29SjPWkfY6cll3gAshJm7c7+uWoobsctIj8QudAuhSpVa2yfaigVaD12NxjVMWd1cJjkM2
	FGoD+HjFGN6uTCr1pbPusrpIWcUFDucP9IQSq0PC74nOa+jBo2xEYkUa16m+0J2CsKjGqBEd1y4
	S95cCYIgJrSamPfguV5ffIOIT2Xhb68ULkURjd5/KtCUnUlNyLPm2skGF9Mk9i88VDpYc75lbi3
	QqicWCmTo8ylNB5ntN59cuYEKvhhLg5Yc/bhio9p1WMHE7L6bP
X-Received: by 2002:a17:90b:3e50:b0:340:2a16:94be with SMTP id 98e67ed59e1d1-353fecc68b5mr5101713a91.4.1769613305606;
        Wed, 28 Jan 2026 07:15:05 -0800 (PST)
Received: from name2965-Precision-7820-Tower.. ([121.185.186.233])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c642a336a1csm2753396a12.19.2026.01.28.07.15.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 07:15:05 -0800 (PST)
From: Jeongjun Park <aha310510@gmail.com>
To: syzbot+c63f59479d561970dc2b@syzkaller.appspotmail.com
Cc: gregkh@linuxfoundation.org,
	johan@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [usb?] general protection fault in qt2_read_bulk_callback (2)
Date: Thu, 29 Jan 2026 00:15:02 +0900
Message-Id: <20260128151502.51585-1-aha310510@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32888-lists,linux-usb=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-usb,c63f59479d561970dc2b];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	SUBJECT_HAS_QUESTION(0.00)[]
X-Rspamd-Queue-Id: F1B5FA39AA
X-Rspamd-Action: no action

#syz fix: Revert "tty: tty_port: add workqueue to flip TTY buffer"

