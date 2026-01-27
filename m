Return-Path: <linux-usb+bounces-32795-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8IF/Ns2ZeGk9rQEAu9opvQ
	(envelope-from <linux-usb+bounces-32795-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jan 2026 11:56:13 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 14383933D1
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jan 2026 11:56:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8B307300443B
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jan 2026 10:56:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D3ED344D98;
	Tue, 27 Jan 2026 10:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="VUGzRSEE"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E70AE278E63
	for <linux-usb@vger.kernel.org>; Tue, 27 Jan 2026 10:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769511366; cv=none; b=CUc9A12XR3Hb4CEcLLtGme9u40xy9KZZDCaKR1EgvsV0Fw5OIF1Q8R9oMpa7RRAFfz9UiwfUvGPED6PBXCx949S5Z9OgJlcWYNLsMpuiLoqgGMTqKnRoXQx74CFf7HeLbkNLc8xzTeUFv0uiIFX1Cj5Q2LuY/taVPjuO3qM2s6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769511366; c=relaxed/simple;
	bh=2WTtsp6tRtLH8sv3ozSHBRHTD3nUy0RjoCrUDtlHFss=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cHRJQA4dFZGLVKYD1SFvEmz/pzHpVbhfqU0vrOUTdqCUWWtK0VDR8WhRGBm9DfBg8BKCyBSlN2hN7JhDV6zaCB4cd4zzp3PF87BOkIJCKSFqB6ZPRoDwUHOp9svW2JHsfISkAAHwiFv4BVFkwkZCAxIF6GCQKzTfamCSGfsn3jI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=VUGzRSEE; arc=none smtp.client-ip=54.254.200.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1769511330;
	bh=2WTtsp6tRtLH8sv3ozSHBRHTD3nUy0RjoCrUDtlHFss=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=VUGzRSEE4Ip0BdvmQWRZe3n9N33zfqjN9J5fwv7faUz5kOvcRM4IE/UHGSzN8HyPm
	 hRdlorMcCrfphAgGczPndCnI24zeWzOD6S2gG7eN4o2Dx9CE+spsRNGqsppJmYTmAS
	 BUhP6iolebXhE8a4dp0q0bwyfsqU6wbYn0W3V4Qw=
X-QQ-mid: zesmtpip3t1769511323t79a9b861
X-QQ-Originating-IP: guhlO2vJa0JqS6+d/3g0D9BYP/n4qFh7Ec8cDC3I70M=
Received: from uos-PC ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 27 Jan 2026 18:55:22 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 13224395584093145331
EX-QQ-RecipientCnt: 8
From: raoxu <raoxu@uniontech.com>
To: gregkh@linuxfoundation.org
Cc: kenny@panix.com,
	linux-usb@vger.kernel.org,
	mathias.nyman@linux.intel.com,
	michal.pecio@gmail.com,
	niklas.neronin@linux.intel.com,
	raoxu@uniontech.com,
	zhanjun@uniontech.com
Subject: Re: [PATCH v11 2/2] usb: xhci: enable secondary interrupters and route transfers per slot
Date: Tue, 27 Jan 2026 18:55:22 +0800
Message-ID: <B1C5B74BDE1826C9+20260127105522.3628982-1-raoxu@uniontech.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <2026012754-ferocity-operator-e3b2@gregkh>
References: <2026012754-ferocity-operator-e3b2@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: NwakYKAl7PbLJXUQXLNB76rVcM7sqcGRHL4qmPXXtN2uvoAwkII3tM1A
	DrPC3YyJjma+4UxnVcxadGS7u8XtPxHGbfA5Z2+rhNP5bccneXiMmG+uU5IowrrcX8LZZBy
	rnyXi/0c1vLO+cvQ2j2vMqPmjurkz2LTAcmgHxSw2VDWNYvKAemJmnKbL/2rRnbVzFuiPCW
	HzmFjSEaZr26HVdg2QMTg3tDGtxS+HAiTq/uNMcvIJcyiWvkEbgc2XRyk1QbfNpaxFYsGZl
	Jv6zSMyD5NsX1VqPLEdJaqoOHWagEnm1qa/piYuAbdvzK5Keuvn6nQoY+4e7VU2cd6hl0qC
	V8Vhy0BjjQN6XNpEEf90Ot7DgtNo3HgLNQLiND+XD2lpwVJVG/r1HHmTuBVuxjYqFpcHorH
	TC/GGPWkwe39LILWrtKg51mZo9Z2eLgp3s6X9/Y/wlze89ijLbvQ5SAs166+uGY4lwBFbeE
	PPymSgGyGUFDIm6oDam2ojzutvljRU4MTFMUhpopnR8bT1Nb6KE27GZKyn6kOM3juqgrhlx
	6QJvAqEzSwJq5DABcUEkAAJxkWH98+yEGenTt8CrbqKthZPw+8Skps8jCvywTNUU3uTv0eb
	mbN+5tJ5SnY+7zTNrDRqQVL3LFFmI5MuzQ62dxl8Ntru0PB2Z/bDmIhI4Ee5oB/oDAsGkVf
	7/x1o5xpK9G9w7FJVbgkdgDag89k2fxpeGdZkSxQuHyYi17hDXEUi+KoxaWIWZh4ttoK3b5
	7BN+rBpxaZBddyb+TMrp2VQnzwCtkWmBViPNUqkfsdYgtuLsJ3dNN0nRL2ZLZWRjSzLZjlD
	EY/GnGo3bF1ZoT0C7fTmCJ0tLKDC598VtmfGwZhAoHOzNFkO7xNRmfTTOafAg/xgQzAHUl8
	tor1BpWMOBoZZNrsF8upWqCs4SwnA5RVd4GbBUbnrUfPtCpYLbjIBb5kIep818FikOZctWl
	0X31II2KTSQO4xrXV9HmpTvv/Z4w07EHDj1mJclEYKNncAedd5IJCyNcCDlH1J8Zrd0u02J
	0z1i1WXbBKlBqbj2miiEO4fzwhu2sa8A/Ermo/Tfs2/kyJyBLCTBZkZyBzwYOjYpJWt7XPV
	J2F4zuXF3LK8sMXTIAFp2Ioob/6PG5LWE6xCctO38tx7TVPV2PG1CjgY6fgvF7uBw==
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[uniontech.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[uniontech.com:s=onoh2408];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32795-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[panix.com,vger.kernel.org,linux.intel.com,gmail.com,uniontech.com];
	DKIM_TRACE(0.00)[uniontech.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[raoxu@uniontech.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-0.990];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 14383933D1
X-Rspamd-Action: no action

Hi greg,

Thanks for the review. Below is why I believe enabling secondary
interrupters is justified.

Legitimacy
Most modern xHCI controllers report Max Interrupters > 1 and expose
multiple MSI/MSI-X vectors. Each interrupter has its own event ring,
ERST and IMAN/IMOD. This series only enables what HW advertises and what
PCI allocates, bounded by a small software cap, with a clean fallback to
vector 0.

Why it still matters
Even if USB link latency is high, the IRQ/event path is still a CPU-side
serialization point today: all completions funnel into one event ring and
one handler under the global xhci->lock. Under mixed workloads (e.g. isoc
video + periodic audio/bulk), unrelated devices can queue behind the same
lock/handler and increase jitter/tail latency.

Sideband reference
Upstream xhci-sideband work has already exercised and validated the
multi-interrupter/event-ring plumbing in the core driver. Using secondary
interrupters is therefore a proven in-tree mechanism, not an experimental
path unique to this series.

Why v11 may benchmark flat
v11 still takes the global xhci->lock in the IRQ/event path, so it does
not claim true parallel event processing yet. The goal is to make
multi-vector routing and lifecycle correctness solid (request/free/sync,
run/stop/resume, quiesce/teardown) and establish per-slot routing. This
is the required groundwork for a follow-up to reduce lock scope so
different devices' completions do not wait on the same lock.

thanks,

Xu Rao

