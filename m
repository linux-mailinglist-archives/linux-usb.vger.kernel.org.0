Return-Path: <linux-usb+bounces-37901-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6IoDGykyD2qSHgYAu9opvQ
	(envelope-from <linux-usb+bounces-37901-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 21 May 2026 18:26:17 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 569605A93E7
	for <lists+linux-usb@lfdr.de>; Thu, 21 May 2026 18:26:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4465E30C81FA
	for <lists+linux-usb@lfdr.de>; Thu, 21 May 2026 16:11:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4532837204E;
	Thu, 21 May 2026 16:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JacvwJVb"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com [209.85.210.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5714F30EF95
	for <linux-usb@vger.kernel.org>; Thu, 21 May 2026 16:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779379886; cv=none; b=GvY3Md8n39KW0eV0J5RORZOJ83WYVEBhjYnv/Q6uTocFF2Vo8+HHZQPMMcJ3umPmqODm5KikU/zWb2a0fBKGplk6QO9+cbsx4cyNOlwWukDOEavtYVyQhaQqNTPlfdjQVJYUM1mj0FjsCu7nm/R45A6tgBbi9MGYsHf4X09hMaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779379886; c=relaxed/simple;
	bh=CXPUkGuVUtzC13i75iQ+RyMF/0mJ7t8MpYUhlVe9yWE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=QtdNX3AJDlXonw6t9b5R+aGrYiUetia4nPTD7PKQBHD6CJYJR9/6M8VY7VQgHLZKTo4lUOc9ObmHJqvJBFunFfCK2PcDvktBwDL761rCIYaCbRUhHP+UnWQp1fXUnAYbeT7ZvLuoiDirO2mm7Ffw4V9NSbKf/SIZiborwevKCVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JacvwJVb; arc=none smtp.client-ip=209.85.210.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f193.google.com with SMTP id d2e1a72fcca58-83659d38e38so2543826b3a.1
        for <linux-usb@vger.kernel.org>; Thu, 21 May 2026 09:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779379885; x=1779984685; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9Ieus4eehn7/pRlIdrlgpShi0NYCCZx1LPn+1WPxVRc=;
        b=JacvwJVbCPvm8uRGJDYyTa9+rzEdzZhR3S9C01g58HGYAHnoHO8wvSBsXtI/23kw/m
         FfnB4NelKhHmAqoibJuOUBce2awBbl2hDqXrtN6rhsjPMtc5F63zJyqmWRAtmllrIP0e
         HnL5V2RtyK8MKJvaoXbU8igzrcTsA/HiZnhrAuSojYSGdc2CdbCxdLgP4cwzLu/yPBGm
         +Fo5TNnMLHJ4ozkReBDt7QDGUmDNUrap6ksuEkS7oLl6JlZdyk1SnDJ0gXwqa7UZfuYK
         9I1sesAqzDDnkPsrZOP4hFE2qA7RhJW9J3USe32nN9cKXeLPeShcQA91z8T7FSrEnSra
         6cow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779379885; x=1779984685;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Ieus4eehn7/pRlIdrlgpShi0NYCCZx1LPn+1WPxVRc=;
        b=E5ff5Dggf9RkHik4PTJ7hD1eLY41Rd2AMr9sW22oEeVjCXAADiSRU8I+HVhIwh8Qal
         LrUxdr2t5WuzVSCq83H3Bm2K9z2VYwi/TQTkVhePqo4vFMjAwahEVGTt+G/9WDxxZoXx
         troKexxQKoK63G61pj5qXvU5P4rgxvJlO9dVQ3C1vOtRI85mVDH7jw+yfkPB0R+ro/ug
         Cli8F4m79b+CH3XiUpOYiA3hZFHcyUSNRAwDuHpTvJuOtLVqJWg61f8GKPrTLKKyIW/8
         jRg1+IKngVci2qS/UJNZivhfDWZFuqxSI2WB/u4NqR/jhU02gJxe3Kh1fbXzSqIXD8IC
         FMHg==
X-Gm-Message-State: AOJu0YzLLXLNareBi0yvQh4CkdK9VhkJAm2awL1KFkFpwEpTPs2dn/Y9
	AibKH4fc7EAcCq08vj7yI1Vh8COJzM/cntyktHDDkpyDgkToyhscA6Aq
X-Gm-Gg: Acq92OE4Uwq21fIUzX73NKOjfbpki/WTjtviFIiZ8PgQlFlpAiNq9GkbnljVcAe4Zcd
	u59Sz4WFwg8zcCF1llXyqks8FrO+ER1/E77hUphXyMtzV17l0byTZCiHimbdp8wN5GA5o6c2B3D
	5rQum90FHgu/psLL5rMEyzYcYqBqsrBZ++PSc4lZ5CwIi7swIE3OYmHg6QO0tGmG2pXsGx19jv+
	FvBnaUa/rbZp73u/Ca51Dxpp20cZmlq3vfIpN1rPGDZUjvBX6Q5iY/l6umH8k1MfOVqq8Pep7eV
	y181hON+72LuuWh+TYFR0GlxZGx0Mwf264WMNBboijvVqK+8XNUrvmKAJ05b3fQdc+K24zSWxGV
	en5l4+QvP24AWEQG18THL7RjwyXuRATM+EI/mZAcXagw9HDwnw9+dDkvK7miz8rAeGKjmlCXHJM
	0HX8MGzle3yLJmR+qU7XTvg1J/Md1vajE=
X-Received: by 2002:a05:6a00:e0e:b0:82c:225e:63c5 with SMTP id d2e1a72fcca58-8414acda7d3mr3857016b3a.18.1779379884478;
        Thu, 21 May 2026 09:11:24 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84154dff811sm1953991b3a.38.2026.05.21.09.11.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 09:11:23 -0700 (PDT)
From: Zhang Cen <rollkingzzc@gmail.com>
To: Johan Hovold <johan@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zerocling0077@gmail.com,
	2045gemini@gmail.com,
	Zhang Cen <rollkingzzc@gmail.com>
Subject: [PATCH] USB: serial: cypress_m8: validate interrupt packet headers
Date: Fri, 22 May 2026 00:11:17 +0800
Message-Id: <20260521161117.3501317-1-rollkingzzc@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37901-lists,linux-usb=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rollkingzzc@gmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 569605A93E7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

cypress_read_int_callback() parses the interrupt-in buffer according to
the selected Cypress packet format. Format 1 has a two-byte status/count
header and format 2 has a one-byte combined status/count header. The
usb-serial core sizes the interrupt-in buffer from the endpoint
descriptor's wMaxPacketSize, and successful interrupt transfers can
complete short when URB_SHORT_NOT_OK is not set.

Check that both the allocated URB buffer and completed packet contain the
selected header before reading it. Malformed short reports are ignored and
the interrupt URB is resubmitted through the existing retry path,
preventing out-of-bounds and stale header-byte reads.

KASAN report as below:
KASAN slab-out-of-bounds in cypress_read_int_callback+0x240/0x7f0
RIP: 0010:kasan_check_range+0x67/0x1b0
Read of size 1
Call trace:
  dump_stack_lvl+0x66/0xa0 (?:?)
  print_report+0xce/0x630 (?:?)
  cypress_read_int_callback() (drivers/usb/serial/cypress_m8.c:1009)
  srso_alias_return_thunk+0x5/0xfbef5 (?:?)
  __virt_addr_valid+0x188/0x320 (?:?)
  kasan_report+0xe0/0x110 (?:?)
  __usb_hcd_giveback_urb+0x103/0x1d0 (?:?)
  __usb_hcd_giveback_urb+0xf3/0x1d0 (?:?)
  __usb_hcd_giveback_urb+0x112/0x1d0 (?:?)
  dummy_timer+0xaaa/0x19a0 (?:?)
  mark_held_locks+0x40/0x70 (?:?)
  _raw_spin_unlock_irqrestore+0x44/0x60 (?:?)
  lockdep_hardirqs_on_prepare+0xb7/0x1a0 (?:?)
  __hrtimer_run_queues+0x102/0x510 (?:?)
  hrtimer_run_softirq+0xd0/0x130 (?:?)
  handle_softirqs+0x155/0x650 (?:?)
  __irq_exit_rcu+0xc4/0x160 (?:?)
  irq_exit_rcu+0xe/0x20 (?:?)
  sysvec_apic_timer_interrupt+0x6c/0x80 (?:?)
  asm_sysvec_apic_timer_interrupt+0x1a/0x20 (?:?)

Fixes: 3416eaa1f8f8 ("USB: cypress_m8: Packet format is separate from characteristic size")
Assisted-by: Codex:gpt-5.5
Signed-off-by: Zhang Cen <rollkingzzc@gmail.com>
---
 drivers/usb/serial/cypress_m8.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/usb/serial/cypress_m8.c b/drivers/usb/serial/cypress_m8.c
index afff1a0f4298b..50c6abc69e756 100644
--- a/drivers/usb/serial/cypress_m8.c
+++ b/drivers/usb/serial/cypress_m8.c
@@ -1016,6 +1016,7 @@ static void cypress_read_int_callback(struct urb *urb)
 	unsigned long flags;
 	char tty_flag = TTY_NORMAL;
 	int bytes = 0;
+	int header_size = 0;
 	int result;
 	int i = 0;
 	int status = urb->status;
@@ -1060,18 +1061,32 @@ static void cypress_read_int_callback(struct urb *urb)
 	default:
 	case packet_format_1:
 		/* This is for the CY7C64013... */
+		header_size = 2;
+		if (result < header_size ||
+		    urb->transfer_buffer_length < header_size)
+			break;
 		priv->current_status = data[0] & 0xF8;
 		bytes = data[1] + 2;
 		i = 2;
 		break;
 	case packet_format_2:
 		/* This is for the CY7C63743... */
+		header_size = 1;
+		if (result < header_size ||
+		    urb->transfer_buffer_length < header_size)
+			break;
 		priv->current_status = data[0] & 0xF8;
 		bytes = (data[0] & 0x07) + 1;
 		i = 1;
 		break;
 	}
 	spin_unlock_irqrestore(&priv->lock, flags);
+	if (result < header_size || urb->transfer_buffer_length < header_size) {
+		dev_dbg(dev,
+			"%s - short packet header - received %d bytes but buffer has %d bytes\n",
+			__func__, result, urb->transfer_buffer_length);
+		goto continue_read;
+	}
 	if (result < bytes) {
 		dev_dbg(dev,
 			"%s - wrong packet size - received %d bytes but packet said %d bytes\n",
-- 
2.43.0


