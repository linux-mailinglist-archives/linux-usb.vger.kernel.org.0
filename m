Return-Path: <linux-usb+bounces-37213-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6KFgOAYSAWq4QQEAu9opvQ
	(envelope-from <linux-usb+bounces-37213-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2026 01:17:26 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A71A2506C6B
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2026 01:17:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3B84F3009982
	for <lists+linux-usb@lfdr.de>; Sun, 10 May 2026 23:17:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08E412D6E44;
	Sun, 10 May 2026 23:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HubDfnyx"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A7930E847
	for <linux-usb@vger.kernel.org>; Sun, 10 May 2026 23:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778455039; cv=none; b=hli5cj/is/vUhfhR4yxEdZBxywdpX3s9v5zAcnucADd/y2pFSNhguvIDvVuNcuzEaLjr+ZAjrGeCfhQVj0O+cgjtTgMe6+WUI0jNDn1c1qa5J9BzYFcpH1IOnQfhpnKLrdzeHGRK17EE80tsNSLwGoCeDoeRJG57vJNFKWbmoR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778455039; c=relaxed/simple;
	bh=r8DfgjwteyhNATjsAQWVfs8YuAP56djRXgiQDaVaWdQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ldga/ucyRDvbU1WoMYtus79/48hKn9UdZ/8BvdHPYdI5SIAa1tAeyerlUVLj2K8/1ySzq4+GodOtgcy5YnCyquEoTHGqneVwXUAuki41mF8sox0E+35VJXeTbUumdMJeE4YPY5J1P5VYXISE5SfiiPBWbOqwv7pbuZuKtgwrYNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HubDfnyx; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-8ed4dd182efso240303985a.3
        for <linux-usb@vger.kernel.org>; Sun, 10 May 2026 16:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778455037; x=1779059837; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D+Pq1q7AVM368YnM6hKBCnVHKHtkRiZ76Gi1xm2eLZc=;
        b=HubDfnyxcrGf94B9pj7++gT/c4Y30F/ov46ZOxWQ+bbLtflN1UsP5eyV91u7/FvRKT
         VhH0plh7jIyK/bvm6rTE6OdfWwC4FU/O4ytTMOoFHWD/4Q4/UfT3+4OWt/nQZBrjpzgW
         Ep26G0Jp/OhNVzCD2XGx7UbpuPs38hdjbsRDXCcJRYMpKGZ+98KcCQGP6Kcgqq0TzT/Z
         R93+EsatCHzZ57ZS10/6aHtssJkxUm0qRUIsfsVCkcSCngYgrQK5trASGGLhv/1APzDx
         USu/ziycidlNYZ+gjPgn6iSLhWs71I0h7nhTOEgGgrCZm+5hSnHs5kkBSWQCWd3NeRpD
         YyNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778455037; x=1779059837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=D+Pq1q7AVM368YnM6hKBCnVHKHtkRiZ76Gi1xm2eLZc=;
        b=S6ps51lMZZa0xmWFNy2w1BYK9kZnc1ehF9sYUfPOGrmoaFZGawHYWXvs6tTKj0Nc4A
         PWco9sCpvsD3BNInyCHB0wIpOS7xceZeq4A5aKTkqhnOZhIdX15q7FTWKCWk1iM8l40Z
         dU4ntASK2RQH1R3N7GKZ5I2y59sEwJ/UJJFzyotR6+MkjZh79zfZeUs2S8dswpKzDWEc
         jXMklQk25GwdxBDYpBxKtNeer94HwwcIWOX7NkwlPIUyCeQO+xotkyUFjWx5d6jbPAWN
         +CgxobWaMvl2iZWTKkSyhiGG28zOYHkR83lJP4FpbPThrQgteO6xmVD5JTWl4ho+MKOw
         Q7oQ==
X-Forwarded-Encrypted: i=1; AFNElJ/6MOYVeNqLD2cr6Rb/2xx+89Y0QPeb13DC1KDeHpgqz9PgxZ0yYcz0aI4UWLJqS9pUfHy9GZJWh/o=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwF/aFXb/gqiNIo4ET2eIQIAQLXtyf5mYG+eOWitqRE5Kjbmy5
	ZhrIf10QFksHybQzWK47UgSer6ya5JEQZ/D48UjTSkeJv1zTLduKXPHJ
X-Gm-Gg: Acq92OHRE6BButlLmcuEpYqvwhHOT53DDjvs08g2TWqs3kJRpVf/RQULI8fzUWC0zGa
	RNNKx8IKz+Z82mCvvbNIFAm8QT5+FY1I/9C0YMuV5ygSF8vjndWilzb/G+loXT0VnYzgaOzRY2P
	Ts6DnLhIZkyrxl65QrCX2NngCYbo1Pk3iO5TISAaRvvhML8UtjRGkeeg5p2L9C7aUUUA3vamvJ5
	9gybP+K9jW5qbFeNfiXQFYgbKnfmhBfcRQc/Xt16kxY8iXGSK61h19fcM+lvqAtM2plPXln6CTU
	CF2dB0yvHhwRmLYuJF+xZR4gLtQ+gMfPrylH6GfJNjNngkCXEjbiTre3rTNujiQ+p5jAs5v1bMt
	KItdPMPPKrOtssO28dYUCtHdd+Yox8faQ32BvgqUFwwp9TDRe+VcUPV5siKsfseh/PHX0aFaHDb
	2+CyDWM/5pnLqwLBxmdBdT1cWC2fVQHEFzfGZ52AUU5UY7u2lzOKmo/Y4NpZ+vTQb3sM90wVuLd
	Vxlf4a4dTMBdk/piDTQXWPvv1dOAHKfqfTKk5limwU=
X-Received: by 2002:a05:622a:352:b0:50d:8db0:7abb with SMTP id d75a77b69052e-51461fc4f53mr300106661cf.42.1778455037011;
        Sun, 10 May 2026 16:17:17 -0700 (PDT)
Received: from server0.tail6e7dd.ts.net (c-68-48-65-54.hsd1.mi.comcast.net. [68.48.65.54])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5148e830ddfsm75015031cf.27.2026.05.10.16.17.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 16:17:16 -0700 (PDT)
From: Michael Bommarito <michael.bommarito@gmail.com>
To: Mika Westerberg <westeri@kernel.org>,
	linux-usb@vger.kernel.org
Cc: Andreas Noever <andreas.noever@gmail.com>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v4 1/4] thunderbolt: property: reject u32 wrap in tb_property_entry_valid()
Date: Sun, 10 May 2026 19:16:56 -0400
Message-ID: <20260510231715.2215605-1-michael.bommarito@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.v4.git.michael.bommarito@gmail.com>
References: <20260415123221.225149-1-michael.bommarito@gmail.com> <cover.1777817011.git.michael.bommarito@gmail.com> <cover.v4.git.michael.bommarito@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: A71A2506C6B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-37213-lists,linux-usb=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,linux.intel.com,intel.com,linuxfoundation.org,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michaelbommarito@gmail.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-usb];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

entry->value is u32 and entry->length is u16; the sum is performed in
u32 and wraps.  A malicious XDomain peer can pick
value = 0xffffff00, length = 0x100 so the sum 0x100000000 wraps to 0
and passes the > block_len check.  tb_property_parse() then passes
entry->value to parse_dwdata() as a dword offset into the property
block, reading attacker-directed memory far past the allocation.

For TEXT-typed entries with the "deviceid" or "vendorid" keys this
lands in xd->device_name / xd->vendor_name and is readable back via
the per-XDomain device_name / vendor_name sysfs attributes; the leak
is NUL-bounded (kstrdup() stops at the first zero byte) and
untargeted (the attacker picks a delta, not an absolute address).
DATA-typed entries are parsed into property->value.data but not
generically surfaced to userspace.

Use check_add_overflow() so a wrapped sum is rejected.

Fixes: cdae7c07e3e3 ("thunderbolt: Add support for XDomain properties")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-4-6
Assisted-by: Codex:gpt-5-4
Signed-off-by: Michael Bommarito <michael.bommarito@gmail.com>
---
 drivers/thunderbolt/property.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/thunderbolt/property.c b/drivers/thunderbolt/property.c
index 50cbfc92fe65..29cd60c11ac4 100644
--- a/drivers/thunderbolt/property.c
+++ b/drivers/thunderbolt/property.c
@@ -8,6 +8,7 @@
  */
 
 #include <linux/err.h>
+#include <linux/overflow.h>
 #include <linux/slab.h>
 #include <linux/string.h>
 #include <linux/uuid.h>
@@ -52,13 +53,16 @@ static inline void format_dwdata(void *dst, const void *src, size_t dwords)
 static bool tb_property_entry_valid(const struct tb_property_entry *entry,
 				  size_t block_len)
 {
+	u32 end;
+
 	switch (entry->type) {
 	case TB_PROPERTY_TYPE_DIRECTORY:
 	case TB_PROPERTY_TYPE_DATA:
 	case TB_PROPERTY_TYPE_TEXT:
 		if (entry->length > block_len)
 			return false;
-		if (entry->value + entry->length > block_len)
+		if (check_add_overflow(entry->value, entry->length, &end) ||
+		    end > block_len)
 			return false;
 		break;
 
-- 
2.53.0

