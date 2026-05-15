Return-Path: <linux-usb+bounces-37453-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YJiJI7KTBmrskwIAu9opvQ
	(envelope-from <linux-usb+bounces-37453-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 05:32:02 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C5EB5548F99
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 05:32:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0E20D302BE24
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 03:31:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C3B53BFE59;
	Fri, 15 May 2026 03:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="o+iVK/ul"
X-Original-To: linux-usb@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 517081B4224;
	Fri, 15 May 2026 03:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778815909; cv=none; b=C2bX9bCRHz4OGivuolLCI6P97tMiFPhMeHljyudLIcg18UN577ot2MmehmVHtOQGLgcpR7HPB5Dw3YnNUvYfBrd6dxy0miEN4qN7hJ9LL3FY7cCevnIBvpZFQq1nitYBVCGe7lLlo+HsDC4KxA7LfRaiPCSjJDtcNVSyyEnflD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778815909; c=relaxed/simple;
	bh=nDj0I/RN9t7SQ+PuGb6Z+aOK0VCFRYsNy6SjqgrQYMg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ClUeg6DY1OPK0DjIyriHWR/OwgwQ0IIUvDKoz+o5LIdPoq80OU4RU0qZQ7M3zFwudS7s9o3NJFkXjNO3F43LDGa3LJqQIZtEU8uTsXh6x1VtyLiC4OETNmgyBEgnFvTI7sJZuP1ISnHzYVDgBx89c4H8xxRI2WfHMQn0Hy/Oag0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=o+iVK/ul; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=fu
	yh4wk07C39oAiFEcMfGx8ToxU6vyL/Co4mPqRdRgQ=; b=o+iVK/ulTp9Zug9Esr
	koHpaoq/wWdML6pdga/hrwszAWoXO35e2toDFTgqpkv2KdJAyjVHDBSbX/Pw5L+D
	0LhKYSoZDXrp6C0jzZdWg3bJ/PF/M/FKUJT7tu6GGyk0jaRznmkZWIWn0JGBUFWb
	CTADmZh0dOEE1qyPkhrzEBwJ8=
Received: from GHT-5854251031.localdomain (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wCX34OEkwZqGSvdBQ--.30743S2;
	Fri, 15 May 2026 11:31:20 +0800 (CST)
From: zwq2226404116@163.com
To: johan@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zwq2226404116@163.com,
	Wanquan Zhong <wanquan.zhong@fibocom.com>
Subject: [PATCH v4] USB: serial: option: Add missing RSVD(5) flag for Rolling RW135R-GL
Date: Fri, 15 May 2026 11:31:05 +0800
Message-ID: <20260515033105.7746-1-zwq2226404116@163.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wCX34OEkwZqGSvdBQ--.30743S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Cw43KrWxXFy8KrWfAF43ZFb_yoW8uF4fpF
	45GFyF9rZ8WFyfXF15Crs5uF95uayDKry3Cw18Gw4S9Fnak3W7K34xt3yftr1kZw45uw12
	vas8trWUG3W8G37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pR6wZnUUUUU=
X-CM-SenderInfo: h2ztjjaswuikqrrwqiywtou0bp/xtbC0QgjemoGk4jy+QAA38
X-Rspamd-Queue-Id: C5EB5548F99
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[163.com,none];
	R_DKIM_ALLOW(-0.20)[163.com:s=s110527];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37453-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[163.com];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[vger.kernel.org,163.com,fibocom.com];
	DKIM_TRACE(0.00)[163.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zwq2226404116@163.com,linux-usb@vger.kernel.org];
	RCPT_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,fibocom.com:email]
X-Rspamd-Action: no action

From: Wanquan Zhong <wanquan.zhong@fibocom.com>

The RW135R-GL MBIM interface entry was missing the .driver_info = RSVD(5) flag.

Without this flag, the option driver binds to the MBIM interface
and conflicts with the cdc_mbim driver, causing AT/MBIM communication
failures. This matches the handling of other Rolling Wireless MBIM devices.

This patch adds the missing RSVD(5) quirk for Rolling RW135R-GL (33f8:1003)
to prevent the option driver from probing the MBIM control interface,
which avoids conflicts with cdc_mbim and fixes communication failures.

This aligns with the configuration used by all other Rolling Wireless MBIM modems.

v4:
- Fixes tag corrected
- Device table entry formatting aligned with existing pattern

Tested successfully on multiple interface configurations:
- mbim + diag + AT + pipe
- mbim + diag + AT + ADB + pipe
- mbim + pipe

Fixes: 01e8d0f74222 ("usb: serial: add support for Rolling Wireless RW135R-GL (33f8:1003)")
Signed-off-by: Wanquan Zhong <wanquan.zhong@fibocom.com>
---
 drivers/usb/serial/option.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
index c71461893d20..dfec7467b36c 100644
--- a/drivers/usb/serial/option.c
+++ b/drivers/usb/serial/option.c
@@ -2466,7 +2466,8 @@ static const struct usb_device_id option_ids[] = {
 	{ USB_DEVICE_INTERFACE_CLASS(0x33f8, 0x0302, 0xff) },			/* Rolling RW101R-GL (laptop MBIM) */
 	{ USB_DEVICE_INTERFACE_CLASS(0x33f8, 0x0802, 0xff),			/* Rolling RW350-GL (laptop MBIM) */
 	  .driver_info = RSVD(5) },
-	{ USB_DEVICE_INTERFACE_CLASS(0x33f8, 0x1003, 0xff) },			/* Rolling RW135R-GL (laptop MBIM) */
+	{ USB_DEVICE_INTERFACE_CLASS(0x33f8, 0x1003, 0xff),			/* Rolling RW135R-GL (laptop MBIM) */
+	  .driver_info = RSVD(5) },
 	{ USB_DEVICE_AND_INTERFACE_INFO(0x3731, 0x0100, 0xff, 0xff, 0x30) },	/* NetPrisma LCUK54-WWD for Global */
 	{ USB_DEVICE_AND_INTERFACE_INFO(0x3731, 0x0100, 0xff, 0x00, 0x40) },
 	{ USB_DEVICE_AND_INTERFACE_INFO(0x3731, 0x0100, 0xff, 0xff, 0x40) },
-- 
2.43.0


