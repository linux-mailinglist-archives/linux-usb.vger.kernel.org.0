Return-Path: <linux-usb+bounces-37985-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uqxDDAb4Emob5wYAu9opvQ
	(envelope-from <linux-usb+bounces-37985-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 24 May 2026 15:07:18 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D2A5C2746
	for <lists+linux-usb@lfdr.de>; Sun, 24 May 2026 15:07:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 427C33010B98
	for <lists+linux-usb@lfdr.de>; Sun, 24 May 2026 13:07:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 831EE397352;
	Sun, 24 May 2026 13:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="K61kkJIx"
X-Original-To: linux-usb@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 220D5312837;
	Sun, 24 May 2026 13:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779628014; cv=none; b=XuLNo+Zp443jcd4of2YnXKz1N5Ec8eQqwGgnZyrmy0sTLA6IkftmG9w9VVMZGxamV2qrD83QK+JXFbnxadH5psbyXYCeruvUBf4JdbcScdBsdP5WFUdYs3ZwYtlrWnTuwww5BU47H4W8jOYp5RpWWjVBvmQ4lB6pz0BBShmq6aQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779628014; c=relaxed/simple;
	bh=0aCQVAPiNGDDzV/DN+4BU73+Gn+hb5QfRdVndf5Z2e8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dHyZ7Vs80v20BUMW/T8XJ58OXBWBmMIOAFcHMnflfdRUUpmhmatFT3ikkLuWqdQ66umQZDEWfPw7EWaM3mNCsEoz5jDdyGuGT+n76w9upYViH5l1JlsrYTdau4nOisOjlHNI2gOiWdIPbDSlln4pwwTmVZ3pHCNffFqmceReli4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=K61kkJIx; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1779628008;
	bh=0aCQVAPiNGDDzV/DN+4BU73+Gn+hb5QfRdVndf5Z2e8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=K61kkJIxdgWZ80xMMiXBOWCmqIH/UTooMGopfjKYn2bUmpsLyCiYRc0ZIxoEVaqfO
	 Q1Fd4QRltkCCAdGveqdEaZIgSBbpR3tTiq/VZGKoiR4zbE5M8se3ZcqhZYkiB6VQnT
	 xZcFcQnTRCd/sr+FQwmpq1irJNGnB1PWqcFlLEGI=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sun, 24 May 2026 15:06:44 +0200
Subject: [PATCH 2/6] thunderbolt: property: Unify
 format_dwdata()/parse_dwdata()
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260524-thunderbolt-big-endian-v1-2-6044edca78e7@weissschuh.net>
References: <20260524-thunderbolt-big-endian-v1-0-6044edca78e7@weissschuh.net>
In-Reply-To: <20260524-thunderbolt-big-endian-v1-0-6044edca78e7@weissschuh.net>
To: Andreas Noever <andreas.noever@gmail.com>, 
 Mika Westerberg <westeri@kernel.org>, 
 Yehezkel Bernat <YehezkelShB@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Michael Jamet <michael.jamet@intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, 
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Yehezkel Bernat <yehezkel.bernat@intel.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779628007; l=822;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=0aCQVAPiNGDDzV/DN+4BU73+Gn+hb5QfRdVndf5Z2e8=;
 b=IU5JD2KXOXWKIwBScW0S/lulmQKlOMjdm4QzwgmXAHeVXNv9GUEN8TJVD8IGGaC29p+TsHyd5
 4ZvVPq6yHMgDFaXsYLFr144xdtbjHBLFm0zzc9qjtG9ZkCX9VbeC2KW
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[weissschuh.net,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[weissschuh.net:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37985-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,davemloft.net,linux.intel.com,intel.com];
	DKIM_TRACE(0.00)[weissschuh.net:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@weissschuh.net,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: C6D2A5C2746
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Both function do the same. They are about to change. To make that
easier, implement one in terms of the other.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/thunderbolt/property.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thunderbolt/property.c b/drivers/thunderbolt/property.c
index da2c59a17db5..fb96608ca471 100644
--- a/drivers/thunderbolt/property.c
+++ b/drivers/thunderbolt/property.c
@@ -48,7 +48,7 @@ static inline void parse_dwdata(void *dst, const void *src, size_t dwords)
 
 static inline void format_dwdata(void *dst, const void *src, size_t dwords)
 {
-	cpu_to_be32_array(dst, src, dwords);
+	return parse_dwdata(dst, src, dwords);
 }
 
 static bool tb_property_entry_valid(const struct tb_property_entry *entry,

-- 
2.54.0


