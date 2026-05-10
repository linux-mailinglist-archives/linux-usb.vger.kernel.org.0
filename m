Return-Path: <linux-usb+bounces-37214-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mJ+uNzISAWq4QQEAu9opvQ
	(envelope-from <linux-usb+bounces-37214-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2026 01:18:10 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 45120506C91
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2026 01:18:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3FD78302DB44
	for <lists+linux-usb@lfdr.de>; Sun, 10 May 2026 23:17:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6ED293AE199;
	Sun, 10 May 2026 23:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MpJmxHLT"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CBD83A5E67
	for <linux-usb@vger.kernel.org>; Sun, 10 May 2026 23:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778455041; cv=none; b=oteXWTNqxKq2VQcShQFhepTp+MRiN9HLwAFOlLeR9OFl9y2+YrMp2HgAe8Pn80F/+wjR7ABqExkmFFR/kMoTppd8ggNTzkYQMhbPfTPhl3tR1yZrbdFEcFz8V/3+wOgT+fFqvNv4vksNLyZ3etRXtF27+09RNcgQgycKZfK/DSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778455041; c=relaxed/simple;
	bh=dF5X1LUG4r0lQCtZsSoClebMfzIDwW0CmxgsuMikSXg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lJn7Q0PgiRwdzA4pH0GBQPiHJGbeg1hRSEh3ilz836xQPhfBTzgr9RlmhYCXO+gzkUIvj1iuTZloztJUcuI5d17NLJUAnUpAKGh8VT5RfQl8FbxHkEbplbjaZyRMypzTUXAMFAl+EzHQE7mt8M6KLkfyh5Hu92QScqpJmecaEXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MpJmxHLT; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-8b701756684so45577216d6.1
        for <linux-usb@vger.kernel.org>; Sun, 10 May 2026 16:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778455038; x=1779059838; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=494zAqIk8zsiLJlcWBVQHIjNxVWqGVKEvJi7UcMRGg8=;
        b=MpJmxHLT/RYdk48gXTuE2zW7wR2N4qIz+GMK+X5jFZ6b942obo319ubHmJDOl1tKOG
         Ms+ZYR09foP3qTzXn1IrTTqdtzY6m726rPLD1C/uNkTlm7QrLaLls61b23aUviRRFV3P
         HWIY+bjLiHwv1ASy6C1tVWHP18vHAlgDhZHyuLKiZht33vrQZl+i5jQG5skFGiQm0P9w
         kPxPINAXBHVtTOADgXgNbvrWSg4Fs1m6j7DPkvz0W5QLFpXshjBvMbixugbfPD8uimao
         nReRlHz1kjd5NWrmfxqhRTJ2qzK+/4RGJcndJi/WEHv6zfOcWQ2SfApvgXTUqPMIS25D
         MSPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778455038; x=1779059838;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=494zAqIk8zsiLJlcWBVQHIjNxVWqGVKEvJi7UcMRGg8=;
        b=aN8ZmSf8LLeQGcDRkq3/Ihvca4eT0g1rosoqR4ZkWrZg+mftZ69ZRqH5b0jNgx8nUl
         u1Twg6YjKMPNfAoOAGeXMcqE3E5GuOAVCbhwN0X4+kKq46akTVofBgzKLR1eLqb7ufsH
         pYW+nU5M6B2wjmBy5H8avN4/x9XkTOG3I3PTe3kn9KPIYGo6L9Rpf73xrXENbc4XMlel
         ih9ScwMDerQJdWlBMgkXbMod2/vC1nowvbSeC8n5Yrus3UgNNfdxK6O9vLgXF0+K8k/a
         9lmSC8VNSlbuKArdhP8+tdVT9rrLCWqCT/toPsflmf43cJs9aH/ph7QYKSOedziZMERx
         4Ezg==
X-Forwarded-Encrypted: i=1; AFNElJ8jWFVLBAalHheQW4N+w/5HaToSNOt0HFCsSeR8vWmZ3zW6ngahPmb0eqkf/zaFzok2ncIOa7f7Lng=@vger.kernel.org
X-Gm-Message-State: AOJu0YwcimopOqjJ00kWX/tYJvY84Ej5FRvgnIMrWxIYdJ/Z/W9zrZeX
	zxfD3Ylhbwt9/8AiVZdQ9AF2roBp4bRnzIm6RqW9Oy86M/x2UMksNuUh
X-Gm-Gg: Acq92OFZXrTdkZaGgyDLMViJoMuh8roWnsdJQ8xnDvT4CeRfL6VyMZx9HnsjKMsUVSO
	2j4HHnG2QXp3Idg8bScgp/A3QcB8V9CWwGBiX/9w3D2qxzmK3MbPcMVx5z7sKudgIZCyJub1YkR
	Rw0fLxIPRmG8ox9oKcjiTC2MOk03p9m+fpYCucHMc7SdCc5nnyJi8My/seqzpsVMirToG21S7CK
	DFjeZeAzS96JdLLVcbDTCe3B/SlqmQNA1fNtjxRUrPk3dwZ7lMXMIKM9tyzF6R80BOKm1ROzhCy
	L3gz56f/E/LI7Syq4LRCQ+n+RSyHEgr2hFTcr9EhPjlY4oTUhWYGVsTNO3Kxwr5nD/6T57LIRJu
	P1tx+JHxAUU+PYyrs/pdyCMpHz0tEniIr1W/2Xsn1eqFNmvC3TVSCX8AjJQcgVx6fb/t++c1iPT
	qwsZc3FueNECVX2rMHqahGtwRRvy99YemVcaKfkuxC1j0ZZ+9wmYXH+o+5e4/Bfpc+aq9Jc7b20
	UKUFmNa49uMPK73ZlXmA0Ohqbg83lwE3+/Ka82ts/ennWJ68kZjKA==
X-Received: by 2002:a05:622a:2b48:b0:510:4174:507d with SMTP id d75a77b69052e-51475c8cdd4mr207655871cf.29.1778455038269;
        Sun, 10 May 2026 16:17:18 -0700 (PDT)
Received: from server0.tail6e7dd.ts.net (c-68-48-65-54.hsd1.mi.comcast.net. [68.48.65.54])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5148e830ddfsm75015031cf.27.2026.05.10.16.17.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 16:17:17 -0700 (PDT)
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
Subject: [PATCH v4 2/4] thunderbolt: property: reject dir_len < 4 to prevent size_t underflow
Date: Sun, 10 May 2026 19:16:57 -0400
Message-ID: <20260510231715.2215605-2-michael.bommarito@gmail.com>
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
X-Rspamd-Queue-Id: 45120506C91
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-37214-lists,linux-usb=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On the non-root path, __tb_property_parse_dir() takes dir_len from
entry->length (u16 widened to size_t).  Two distinct OOB conditions
follow when entry->length < 4:

1. The non-root path begins with kmemdup(&block[dir_offset],
   sizeof(*dir->uuid), ...) which always reads 4 dwords from
   dir_offset.  tb_property_entry_valid() only enforces
   dir_offset + entry->length <= block_len, so a crafted entry
   with dir_offset close to the end of the property block and
   entry->length in 0..3 passes that gate but lets the UUID copy
   run off the block (e.g. dir_offset = 497, dir_len = 3 in a
   500-dword block reads block[497..501]).

2. After the kmemdup, content_len = dir_len - 4 underflows size_t
   to ~SIZE_MAX, nentries becomes SIZE_MAX / 4, and the entry
   walk runs OOB on each iteration until an entry fails
   validation or the kernel oopses on an unmapped page.

Reject dir_len < 4 on the non-root path *before* the UUID kmemdup,
which closes both holes.

Also move INIT_LIST_HEAD(&dir->properties) up to immediately after
the dir allocation so the new error-return path (and the existing
uuid-alloc failure path) calling tb_property_free_dir() sees a
walkable list rather than the zero-initialized NULL next/prev that
list_for_each_entry_safe() would oops on.

Fixes: cdae7c07e3e3 ("thunderbolt: Add support for XDomain properties")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-4-6
Assisted-by: Codex:gpt-5-4
Signed-off-by: Michael Bommarito <michael.bommarito@gmail.com>
---
 drivers/thunderbolt/property.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/thunderbolt/property.c b/drivers/thunderbolt/property.c
index 29cd60c11ac4..74c92f9801ff 100644
--- a/drivers/thunderbolt/property.c
+++ b/drivers/thunderbolt/property.c
@@ -174,10 +174,16 @@ static struct tb_property_dir *__tb_property_parse_dir(const u32 *block,
 	if (!dir)
 		return NULL;
 
+	INIT_LIST_HEAD(&dir->properties);
+
 	if (is_root) {
 		content_offset = dir_offset + 2;
 		content_len = dir_len;
 	} else {
+		if (dir_len < 4) {
+			tb_property_free_dir(dir);
+			return NULL;
+		}
 		dir->uuid = kmemdup(&block[dir_offset], sizeof(*dir->uuid),
 				    GFP_KERNEL);
 		if (!dir->uuid) {
@@ -191,8 +197,6 @@ static struct tb_property_dir *__tb_property_parse_dir(const u32 *block,
 	entries = (const struct tb_property_entry *)&block[content_offset];
 	nentries = content_len / (sizeof(*entries) / 4);
 
-	INIT_LIST_HEAD(&dir->properties);
-
 	for (i = 0; i < nentries; i++) {
 		struct tb_property *property;
 
-- 
2.53.0

