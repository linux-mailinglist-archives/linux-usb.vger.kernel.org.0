Return-Path: <linux-usb+bounces-36321-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wF8iHVtL5WmuggEAu9opvQ
	(envelope-from <linux-usb+bounces-36321-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 19 Apr 2026 23:38:35 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F50425935
	for <lists+linux-usb@lfdr.de>; Sun, 19 Apr 2026 23:38:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 04257300C260
	for <lists+linux-usb@lfdr.de>; Sun, 19 Apr 2026 21:38:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A817F30AD0A;
	Sun, 19 Apr 2026 21:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sr9d0yHt"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5808C30E834
	for <linux-usb@vger.kernel.org>; Sun, 19 Apr 2026 21:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776634710; cv=none; b=Z1QBwz2B2e1fW/sHKy/WOMbgqQifO3AEOx9BOFbzAs0tQsCfj6mre5olMHVq6P9wfAMQOf1kfMHeRQUSq8nWv3pvyQ6ghDqbdr3gKkBh7Caw5mTRp3LTLpCm6B+lzjAx00h0Elw6ANLkhu7pDh7nFiq52CTZ+HbepOVmMQlB1n8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776634710; c=relaxed/simple;
	bh=Dp+zjWZshY27XKp+WZd9CSMwok215bglF8detesHIp8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=koWY3fwACl6yuoVp1ao8sXBxuO9XL9NH5duLIJbbxv5VQZvGp5H31D8Siaqsqi7Wi/j8pI3x1HmKiTBTAQ4OYwAQ/z1OKWVNmiTF5wEULAEp3UCI8H2MKMQkw7JdIHN9J2q/xRFqye2FrVAU6/KLDJkQNPZ5e5wWGRfrgLVWZvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sr9d0yHt; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7dbcb467f2bso2501818a34.3
        for <linux-usb@vger.kernel.org>; Sun, 19 Apr 2026 14:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776634707; x=1777239507; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7uJDsIR1zT7rpi33UIMHIu8lqlBOeOhp5Xggc2/M6dM=;
        b=Sr9d0yHtpkaOZrnONCd16+p4pbaOT1GN2IAwz7Z+YxdrxsXmRYjZXfpCG7/0047ldm
         GsbSx82XWYwivN5MA6x22eNtJb3uJfEZKWqZmWItgH57YWE337Ddxpkisd4A6L9pprIU
         DtP11MRrcx6GNQZZPlYt5BdWoJBY1xmdnq9kjIxGHmXnrG/t1zNpsEnzdI8i8Tuw7NpA
         WTTHQZkO2C7leIZHK1xt199qxWyNvBnS9hmCs7bgVey6ut6OqTi+Ffnm4Wd555dOlwhp
         OKw0jpnWR3G8OEAhHBRiM3IP48FolAN6EBs0c/bCTctpj4vT6ysuWi+MQBahfpqIvL3U
         3ZSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776634707; x=1777239507;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7uJDsIR1zT7rpi33UIMHIu8lqlBOeOhp5Xggc2/M6dM=;
        b=ecDG/zUNp1AVo+ws9H4ieO0AjYvsDfAc6AJ4PtRkTFrfwaknOmil9mZ5WHkAEJKjV+
         1RsIwND7IbvwLUXzSwujmaBT/fQkpT5NGzsTZWqbr40pFs0ymrC6hIkox0ftJ3KsQ1m+
         KDJL9RVT5LgSftj+Yj7GUxb2ET9HDtBQ92mZcGFCxR7K9vZAZa/jWl4McMKfcQFFVFjh
         i0ga+Z2BheZzI+9fCDm7tCG0kxlN29s7ofqiW7oAtX72u2mMHZ19uAxsr3BkTBpeVBC9
         6i5FrMyVWPECfIe6FWnA5myF+pyEQwX2TecHC8+N27d4XNeo/aC60owEzXvjNFvLwkqC
         FVsA==
X-Gm-Message-State: AOJu0YwOXD9AF3Lducgf0BDZ8Oo3Y18+YSnxTS3qD567IUJtRe79W8Ug
	0eqOuttmoWppUZUBRjMkFSBOP+Xf3l/S7JvlzezE8qoAHGtK0dZvj2aTZuKflg==
X-Gm-Gg: AeBDieuZUdAojsug3sp0j2mjCamtOyhwM3YNDWNObVAd+4+/IySd47S3+TjMTqwFUu8
	qZ2gCggk70MuCRQvIGHlYCTObAbmvy3JXzjH0Pz2zecg4DPF1zP5n57IDd/2PP0tQvAAfCwe1Ix
	KkjklJO6m6xgWYqgCTgH0S6rdyWvHktraUlNFIEY9g/wQvLxoBxr8Qbo0Wti8LO62xIVWx9wWIx
	0f75Qk0bwSomhOvYsxKYnoLE9cD1oRJDsJrb2Rp7i1sfYXpIxZkn5p8lBL15VMpthNGZdRkq3zi
	pTr+6NoTYRDzp1R39wLE4kMPxr/oVuI8vdibOfpJeEvMAVtRm6K6lfmWyhhRJ4X/mvRiC2I3Oc+
	n06lTtilERHXwNbwYGNge1zvL2VNrP1PoPD1S3uK0/qjSy95+ApsBe4PQxkgqd4ismlKH+dENpf
	V9C8+ZPGj4BkSaW1L+PAOMIeXoIftvNBRNGrLk0vx35lYxWj7iN6IsAIeA7fxBSBd5sFWz
X-Received: by 2002:a05:6830:2107:b0:7d7:ea9f:c1b9 with SMTP id 46e09a7af769-7dc9518bedbmr7996274a34.15.1776634707033;
        Sun, 19 Apr 2026 14:38:27 -0700 (PDT)
Received: from linuxescape.lan (23-88-128-2.fttp.usinternet.com. [23.88.128.2])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7dc975033acsm6918457a34.1.2026.04.19.14.38.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 14:38:26 -0700 (PDT)
From: Maxwell Doose <m32285159@gmail.com>
To: badhri@google.com,
	heikki.krogerus@linux.intel.com,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: typec: tcpm: replace strcpy with strscpy
Date: Sun, 19 Apr 2026 16:36:38 -0500
Message-ID: <20260419213638.38291-2-m32285159@gmail.com>
X-Mailer: git-send-email 2.53.0
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
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36321-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FROM_NEQ_ENVFROM(0.00)[m32285159@gmail.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 22F50425935
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The function strcpy() is deprecated as it can be used in buffer overflow
attacks. This patch replaces strcpy() with strscpy() to improve
security and stability.

Signed-off-by: Maxwell Doose <m32285159@gmail.com>
---
 drivers/usb/typec/tcpm/tcpm.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 8e0e14a2704e..69574c5e79e1 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -725,7 +725,7 @@ static void _tcpm_log(struct tcpm_port *port, const char *fmt, va_list args)
 
 	if (tcpm_log_full(port)) {
 		port->logbuffer_head = max(port->logbuffer_head - 1, 0);
-		strcpy(tmpbuffer, "overflow");
+		strscpy(tmpbuffer, "overflow", sizeof(tmpbuffer))
 	}
 
 	if (port->logbuffer_head < 0 ||
@@ -841,10 +841,10 @@ static void tcpm_log_source_caps(struct tcpm_port *port)
 					  pdo_spr_avs_apdo_15v_to_20v_max_current_ma(pdo),
 					  pdo_spr_avs_apdo_src_peak_current(pdo));
 			else
-				strcpy(msg, "undefined APDO");
+				strscpy(msg, "undefined APDO", sizeof(msg));
 			break;
 		default:
-			strcpy(msg, "undefined");
+			strscpy(msg, "undefined", sizeof(msg));
 			break;
 		}
 		tcpm_log(port, " PDO %d: type %d, %s",
-- 
2.53.0


