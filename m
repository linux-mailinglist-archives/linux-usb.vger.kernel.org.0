Return-Path: <linux-usb+bounces-37973-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CPQwMtWqEWryogYAu9opvQ
	(envelope-from <linux-usb+bounces-37973-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 23 May 2026 15:25:41 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 246A35BF07D
	for <lists+linux-usb@lfdr.de>; Sat, 23 May 2026 15:25:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3BC8F3016EEF
	for <lists+linux-usb@lfdr.de>; Sat, 23 May 2026 13:25:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3F42396D14;
	Sat, 23 May 2026 13:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="xnydJeMP";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="dq+P+aj2"
X-Original-To: linux-usb@vger.kernel.org
Received: from mout-y-111.mailbox.org (mout-y-111.mailbox.org [91.198.250.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 269C719004A;
	Sat, 23 May 2026 13:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.198.250.236
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779542734; cv=none; b=Ajhi4kYxVcn5130zdlu1MtryYeAVJOx4X+B4DrKc8ZUtumPK/Z6PJhacNhZ+jNVTzUrDDKcHk46snROtNijYKMHW+BddxAK/e9FjK65Sp5jdYrhrD4ksHLxXi7kaCl2GIqZ/IL4a+hQN6YeaDhmF1/mLpO5FP+BobDTrxSHufF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779542734; c=relaxed/simple;
	bh=NLQOYHcbX92Dt/Dad0zUJKi99mTFQaq6qBCN2CEOvt0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YaGOJ2NQ2FXz0j1fNJ1wKOSj/4BUJ8iLi80U5DNSR9oWkGfmC6E3S4SdCC7WaonEFamm/nXyLg+oWlxILmDTfmkR4Z+FFP85J6NinnrttNnikfrYO/DauEHBWezvPF+rWX1Fe/HIMBVvJ/7MCJx7AQIuL21BxF5wOj8rI5l9Y6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=xnydJeMP; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=dq+P+aj2; arc=none smtp.client-ip=91.198.250.236
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-y-111.mailbox.org (Postfix) with ESMTPS id 4gN2vY6PQnz9ygy;
	Sat, 23 May 2026 15:25:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1779542729;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=tzVCnK4h+wlvOzvoQtfIVTCV8MGHm5StGNsgjrmtRbk=;
	b=xnydJeMPTb76I9SESgJvRguAjSnaJnsOrJlKxP8cQ4r1VzieucL6/HQvzY3Iu8stTga5//
	SCUtIMZieWKXN9csJw/3YZERCco1M8HuIycvv9u0SZFamQVWuc7pQs0wCugKCXYLvc+b+1
	OQz2tInuiWUhE+ns5h2vAfTm81dQUIFEwnA9qrUeHKA8jlBRajHenCjRvhkNAejOUHj0k3
	LGA5LML/am6XLCpO+fR6mA2ZO5BMYMWqDg1P6XeRf6HbEaMbPHNInhm8S5IqxbfZ1RLQo5
	Gp0EabxDbpqsxhWGEaiYzdHsscYka8ksPrd4LbRip6qKrVDvaxbqyaAL/sDlww==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=dq+P+aj2;
	spf=pass (outgoing_mbo_mout: domain of a0yami@mailbox.org designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=a0yami@mailbox.org
From: Qing Ming <a0yami@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1779542728;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=tzVCnK4h+wlvOzvoQtfIVTCV8MGHm5StGNsgjrmtRbk=;
	b=dq+P+aj2E0RdVpYWi79sc7SpNR/Uz7m/o4Cfddzthw1ZwDPRTDFGDBmx3L6en3PaFTXnQT
	U5l3CydzGCSilRmYKLYOJyDvpNSyjQ21HezP4UHdgFsd4Krh9rgfEBDxMvMCpZvc0KeLWA
	xAP63xz46kxkLW7bkQ4y6MjO1JbuILBneYECHfDuujoUvaCHkv9ticx35TUXPwBlxIHyMa
	tGEoNVq/F73FBYUafIfGbOFJhzH4lrItyc59d6KUwY5Un1gjHEnqkpBLK55cgTmlFN6RF4
	qpTq1/b7NqYrlYW7kbI/gomKPmx6bLFBiEFcYCfSTcfFiXTM1OsqgS/S4abKhA==
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Sumanth Gavini <sumanth.gavini@yahoo.com>,
	Kees Cook <kees@kernel.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Qing Ming <a0yami@mailbox.org>
Subject: [PATCH] usb: gadget: uac: validate rate list length before storing
Date: Tue, 19 May 2026 22:33:19 +0800
Message-ID: <20260519143319.147494-1-a0yami@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 71a918f51bf2c74dc4c
X-MBO-RS-META: 85jdtzpdk3diaqma6xk1961cbbjnofu6
X-Spamd-Result: default: False [0.34 / 15.00];
	DATE_IN_PAST(1.00)[94];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[wanadoo.fr,yahoo.com,kernel.org,vger.kernel.org,mailbox.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37973-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[a0yami@mailbox.org,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[mailbox.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mailbox.org:email,mailbox.org:mid,mailbox.org:dkim]
X-Rspamd-Queue-Id: 246A35BF07D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

UAC1 and UAC2 configfs rate-list attributes parse a comma-separated
list of sampling rates and store each parsed value in fixed-size arrays.
The arrays have UAC_MAX_RATES entries, but the store paths do not check
that the input contains at most that many tokens before writing through
opts->name##s[i++].

Writing more than ten rates therefore writes past the end of the
p_srates[] or c_srates[] array in struct f_uac1_opts or struct
f_uac2_opts.

With CONFIG_UBSAN_BOUNDS enabled, writing an 11-entry rate list to the
UAC1 p_srate attribute reports:

  UBSAN: array-index-out-of-bounds
  drivers/usb/gadget/function/f_uac1.c:1669:1
  index 10 is out of range for type 'int [10]'
  __ubsan_handle_out_of_bounds.cold
  f_uac1_opts_p_srate_store
  configfs_write_iter
  vfs_write
  ksys_write
  do_syscall_64

The same reproducer against the UAC2 p_srate attribute reports:

  UBSAN: array-index-out-of-bounds
  drivers/usb/gadget/function/f_uac2.c:2087:1
  index 10 is out of range for type 'int [10]'
  __ubsan_handle_out_of_bounds.cold
  f_uac2_opts_p_srate_store
  configfs_write_iter
  vfs_write
  ksys_write
  do_syscall_64

Reject additional tokens once UAC_MAX_RATES entries have been parsed.
Also keep the original kstrdup() pointer for kfree(), because strsep()
advances the parsing cursor. Freeing the advanced cursor leaks the
original buffer on successful parses and can free an interior pointer on
some error paths.

Fixes: 695d39ffc2b5 ("usb: gadget: f_uac1: Support multiple sampling rates")
Fixes: a7339e4f5788 ("usb: gadget: f_uac2: Support multiple sampling rates")
Signed-off-by: Qing Ming <a0yami@mailbox.org>
---
 drivers/usb/gadget/function/f_uac1.c | 13 +++++++++----
 drivers/usb/gadget/function/f_uac2.c | 13 +++++++++----
 2 files changed, 18 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/gadget/function/f_uac1.c b/drivers/usb/gadget/function/f_uac1.c
index 85c502e98f57..7a81cd176abd 100644
--- a/drivers/usb/gadget/function/f_uac1.c
+++ b/drivers/usb/gadget/function/f_uac1.c
@@ -1594,7 +1594,8 @@ static ssize_t f_uac1_opts_##name##_store(struct config_item *item,	\
 					  const char *page, size_t len)	\
 {									\
 	struct f_uac1_opts *opts = to_f_uac1_opts(item);		\
-	char *split_page = NULL;					\
+	char *buf = NULL;						\
+	char *split_page;						\
 	int ret = -EINVAL;						\
 	char *token;							\
 	u32 num;							\
@@ -1608,18 +1609,22 @@ static ssize_t f_uac1_opts_##name##_store(struct config_item *item,	\
 									\
 	i = 0;								\
 	memset(opts->name##s, 0x00, sizeof(opts->name##s));		\
-	split_page = kstrdup(page, GFP_KERNEL);				\
+	buf = kstrdup(page, GFP_KERNEL);				\
+	split_page = buf;						\
 	while ((token = strsep(&split_page, ",")) != NULL) {		\
 		ret = kstrtou32(token, 0, &num);			\
 		if (ret)						\
 			goto end;					\
-									\
+		if (i >= UAC_MAX_RATES) {				\
+			ret = -EINVAL;					\
+			goto end;					\
+		}							\
 		opts->name##s[i++] = num;				\
 		ret = len;						\
 	};								\
 									\
 end:									\
-	kfree(split_page);						\
+	kfree(buf);							\
 	mutex_unlock(&opts->lock);					\
 	return ret;							\
 }									\
diff --git a/drivers/usb/gadget/function/f_uac2.c b/drivers/usb/gadget/function/f_uac2.c
index 897787d0803c..d8cf710085a0 100644
--- a/drivers/usb/gadget/function/f_uac2.c
+++ b/drivers/usb/gadget/function/f_uac2.c
@@ -2012,7 +2012,8 @@ static ssize_t f_uac2_opts_##name##_store(struct config_item *item,	\
 					  const char *page, size_t len)	\
 {									\
 	struct f_uac2_opts *opts = to_f_uac2_opts(item);		\
-	char *split_page = NULL;					\
+	char *buf = NULL;						\
+	char *split_page;						\
 	int ret = -EINVAL;						\
 	char *token;							\
 	u32 num;							\
@@ -2026,18 +2027,22 @@ static ssize_t f_uac2_opts_##name##_store(struct config_item *item,	\
 									\
 	i = 0;								\
 	memset(opts->name##s, 0x00, sizeof(opts->name##s));		\
-	split_page = kstrdup(page, GFP_KERNEL);				\
+	buf = kstrdup(page, GFP_KERNEL);				\
+	split_page = buf;						\
 	while ((token = strsep(&split_page, ",")) != NULL) {		\
 		ret = kstrtou32(token, 0, &num);			\
 		if (ret)						\
 			goto end;					\
-									\
+		if (i >= UAC_MAX_RATES) {				\
+			ret = -EINVAL;					\
+			goto end;					\
+		}							\
 		opts->name##s[i++] = num;				\
 		ret = len;						\
 	};								\
 									\
 end:									\
-	kfree(split_page);						\
+	kfree(buf);							\
 	mutex_unlock(&opts->lock);					\
 	return ret;							\
 }									\
-- 
2.53.0


