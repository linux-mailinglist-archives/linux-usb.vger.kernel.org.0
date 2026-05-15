Return-Path: <linux-usb+bounces-37517-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mM8rDV4sB2oLsgIAu9opvQ
	(envelope-from <linux-usb+bounces-37517-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 16:23:26 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CEED5514EE
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 16:23:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C7BC83021E42
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 14:19:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E8BD37A4B7;
	Fri, 15 May 2026 14:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f95WEVgL"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9863F36DA0F
	for <linux-usb@vger.kernel.org>; Fri, 15 May 2026 14:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778854789; cv=none; b=rLa25BWDL8jJvRWGfKH+fJY8qytA2F+RQvCIrGdy+mZUq49Avx9D29nY6lse54f91UxW9ZJBhYxHwsp4PWmYYIbWlADLXk3E5T+bSi5C1KZHmBeI6MHFXPFOVx7m7fSJB2drM8lsx6WTQpKyix75W1eaGatgABq7RuRvLvgJ9NY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778854789; c=relaxed/simple;
	bh=s3Bj0xMXnNVo2c7UBujGILX0S9OZWkYQOunRlkbzPfg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=a5BeMPQPL09GYR3OomWtI5qzzS+fDoZ/6tiWP+cYadFZC8cTwINpqA4uLpO3RMwfj1bGdNcTKY2EUKjsci+ZurHrnIQPh5AA3/bT0kNAVCGAz4VvMHq/5I+QQL0aK1++j/WCMxdMdc1PS1Wqh00h3HZK44O6+k/AIv21TzD7J34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f95WEVgL; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-50e63771d91so89474891cf.0
        for <linux-usb@vger.kernel.org>; Fri, 15 May 2026 07:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778854786; x=1779459586; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4ccRqlRaH5LQNbms+X6SseCmhiMXxNgGnhvBY6ow0no=;
        b=f95WEVgLTA4nwxcCTLTabyf5bjqtlZ8KxUVect/gWC6wHQAr6+AMNgYNYH67ysR13H
         f1NMhIiwlR/46KQ3HFdMJxBvp2ORXCJ6mjKrgfm5rJIRKBnNIPTH1xTiFHBwTz4F0Zxt
         zYjGxQcnw3rA/fl89J1ej6HrqLH5a1Zk4I4+6BWj12/OjXcCgc8pg0wpHmKNhnnMKCCy
         Xr1L+SFTHtdw2Q7ni20gAf9BOdNbgsayur5j4y24wLUIef4Jcr+vUXzudUjwCzQ/j1lB
         /nBp6/i0EVmezPBgoEkiy848hgNgenncrnfizIZ4hue+tT8wq81w9JRU7CqNjUmg6He2
         bj2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778854786; x=1779459586;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4ccRqlRaH5LQNbms+X6SseCmhiMXxNgGnhvBY6ow0no=;
        b=GwociaXEGwsdDtqtT/trhNywn/CzhXCMpVwtYjiXQoQwWcB9bB63DgcfQS8Ty+BPPJ
         IkYz1PJQ7UD8IPA7h3tWxQCu/m/v8kiQC6Yh05cwFyRWanffZyksNrvvApzei7EYHq66
         CRXowYgGFg9hPMN7TkTjhFKxUS96DWQugpmGUYWMX/BXrAJuKVkTXHe0er+SdBdakBy7
         4qb6Bt5QCBwsM5O2TNduS+QUCd3NL5YW28YlC+iWDHpBOFipUHGmN8jznzQmXZSjHJAe
         jprRkMeWlUR/q8Z9A2/G+aDX9YwnfPJJKdVNViDVXnHtZUP9hP+7AzIybsx0vOb9Zs+w
         m4EQ==
X-Gm-Message-State: AOJu0YxrvwbQql15NsQ/HGPSYF2DGrNRwAUjt/MAKq1Jxl00RfAZJozT
	9zu485C2dExJxuBg/dURkzFusOiRUXFCBTIEe3yMppYWnkPiBevFgQK0jlUV5/Kk
X-Gm-Gg: Acq92OGD77Kcg1Hm9vBALbiSBFVlAD/b50qOmHRYV15ZrVP4YDfnxHPTBkYztuhMR6S
	wZpdJN8gDwvdw+4A8daF+JjYegDE6/13lfHaQZsgDzv3Aj3g+853Ih8PeVtc9T6pGH3X+Sr+16G
	OhnQEsznns7fI7XRjTWfzWZO3Bk386i+BgjiqyI51YMcR0f7H31OVZszo7PmHHtjl0opRg1+oao
	OUcIeRLn5h3giAXj7HWSKKkquIb+a2Zmbwn5HR/jej1kVwQO02MpggPawFq7lsnbblbaZkpFCE5
	Ehfr9CByE9G9tgkcQOhdRRP05PprNphk91teaMFqXsRS+hgCJZLGpnpfqNJ3rNwJg6LPhrSxREf
	CgOLEHfYITWFzU+xJQGKRo/LEIxNP5vAly26ZZyNezgkMdJH8Tz2SkUYw5klH5kBokWrt01CeL0
	LlzOX5Eo6o82jpPSQu/v/dgMHbxnc32sfsUqpE9JY+DSVy9QPlU7AOx4tzPqcJSAqhrHKP+AqQy
	mbl9gc=
X-Received: by 2002:ac8:7dc6:0:b0:515:875a:ec22 with SMTP id d75a77b69052e-5165a0022cbmr60213821cf.10.1778854786202;
        Fri, 15 May 2026 07:19:46 -0700 (PDT)
Received: from fedora (pool-100-11-178-145.phlapa.fios.verizon.net. [100.11.178.145])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-516456888f6sm48295391cf.3.2026.05.15.07.19.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 07:19:45 -0700 (PDT)
From: Dave Carey <carvsdriver@gmail.com>
To: linux-usb@vger.kernel.org
Cc: Dave Carey <carvsdriver@gmail.com>,
	gregkh@linuxfoundation.org,
	oneukum@suse.com,
	guanwentao@uniontech.com
Subject: [PATCH] USB: cdc-acm: start bulk-IN polling when ALWAYS_POLL_CTRL is set
Date: Fri, 15 May 2026 10:19:40 -0400
Message-ID: <20260515141940.751397-1-carvsdriver@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 8CEED5514EE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[gmail.com,linuxfoundation.org,suse.com,uniontech.com];
	TAGGED_FROM(0.00)[bounces-37517-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[carvsdriver@gmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

The INGENIC 17EF:6161 touchscreen composite device has a ~55-second
watchdog that resets the USB device if the bulk-IN endpoint on the CDC
data interface goes unread.  The existing ALWAYS_POLL_CTRL quirk keeps
the notification endpoint (ctrlurb / EP 0x82) polling continuously, but
that alone is insufficient: the firmware monitors bulk-IN activity, not
just notification-endpoint activity.

Add acm_submit_read_urbs() calls to the two ALWAYS_POLL_CTRL paths that
already restart the ctrlurb:

  1. acm_probe(): start bulk reads at probe time alongside the ctrlurb,
     so the watchdog is satisfied from first bind without requiring a
     userspace process to open /dev/ttyACMn.

  2. acm_port_shutdown(): restart bulk reads after port close alongside
     the ctrlurb restart, so the watchdog keeps running when the last
     TTY user closes the port.

acm_read_bulk_callback() already resubmits each URB unconditionally on
normal completion, so once submitted the reads remain active until an
explicit kill (disconnect, suspend).  acm_submit_read_urb() is a no-op
for URBs that are already in flight (read_urbs_free bit clear), so the
existing acm_port_activate() call remains correct and races are avoided.

Tested on Lenovo Yoga Book 9 14IAH10 (83KJ): without this patch the
device resets every ~55 s when no TTY is open; with it the device
remains stable indefinitely.

Signed-off-by: Dave Carey <carvsdriver@gmail.com>
Tested-by: Dave Carey <carvsdriver@gmail.com>
---
This follows commit f58752ebcb35 ("USB: CDC-ACM: add INGENIC 17EF:6161
quirk for Yoga Book 9 14IAH10"), which added ALWAYS_POLL_CTRL to keep
the ctrlurb active.  That commit addressed the notification-endpoint
watchdog (~20 s).  This patch addresses a second watchdog that fires
when bulk-IN data goes unread for ~55 s.

This patch is based on top of Wentao Guan's pending fix
("USB: cdc-acm: fix misplaced quirk defines and BIT(9) collision") which
moves VENDOR_CLASS_DATA_IFACE and ALWAYS_POLL_CTRL from inside
acm_ctrl_msg() to cdc-acm.h and reassigns them to BIT(10)/BIT(11) to
avoid the NO_UNION_12 collision.  The bulk-IN additions here are
independent of that renumbering and apply cleanly to either base, but
the combined tree is the correct target once Wentao's fix merges.

 drivers/usb/class/cdc-acm.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/usb/class/cdc-acm.c b/drivers/usb/class/cdc-acm.c
index 54059e4..0c6cdf5 100644
--- a/drivers/usb/class/cdc-acm.c
+++ b/drivers/usb/class/cdc-acm.c
@@ -799,6 +799,9 @@ static void acm_port_shutdown(struct tty_port *port)
 				"ctrl polling restart failed after port close\n");
 		/* port_shutdown() cleared DTR/RTS; restore them */
 		acm_set_control(acm, USB_CDC_CTRL_DTR | USB_CDC_CTRL_RTS);
+		if (acm_submit_read_urbs(acm, GFP_KERNEL))
+			dev_dbg(&acm->control->dev,
+				"read urb restart failed after port close\n");
 	}
 }
 
@@ -1566,6 +1569,9 @@ skip_countries:
 		if (usb_submit_urb(acm->ctrlurb, GFP_KERNEL))
 			dev_warn(&intf->dev,
 				 "failed to start persistent ctrl polling\n");
+		if (acm_submit_read_urbs(acm, GFP_KERNEL))
+			dev_warn(&intf->dev,
+				 "failed to start persistent bulk read polling\n");
 	}
 
 	return 0;
-- 
2.54.0


