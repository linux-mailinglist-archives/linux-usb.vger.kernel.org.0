Return-Path: <linux-usb+bounces-34601-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aNdxKxGasWnkDAAAu9opvQ
	(envelope-from <linux-usb+bounces-34601-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 17:36:33 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 13EE1267702
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 17:36:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6AA2830E28B0
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 16:33:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F4903E1CFD;
	Wed, 11 Mar 2026 16:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RNwSTCdy"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89CA236402A
	for <linux-usb@vger.kernel.org>; Wed, 11 Mar 2026 16:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773246805; cv=none; b=DiLWsl2KMb5o5cxI4xtdB8P+AvVLII9Wax4cVnYH5FfNF+lNfvipNSoPIcGZBzTVuWku946f6/x9JqdN8ABNLjX3z0Jqf1UXn4WcsXWCL7i4o+d1rlqtdol3jREpwYZlp07qyb+A1yiXzP9AGzIzMHZi52qLBQg/toDWwAYD1rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773246805; c=relaxed/simple;
	bh=vqXEHc0MX/ELy4nQN//vZz467e+MRBIE9/NcKUlUe/U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oImmtdf1MdApy7ghc1wcq3jLaa8ZKkYKN4jSsYzSOj59zL1XYgrX7MMqFN0yY5X5+0uS8yI/JxjnakKnWDgWKcUQ9/jL/D5Pyovb9EQYSsOYubkmS14CQHCO0Clj4vzekHxndzJhEy2QffGxoPLCIXWJle560M+uAjnrN2muiqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RNwSTCdy; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-439a89b6fd0so69218f8f.2
        for <linux-usb@vger.kernel.org>; Wed, 11 Mar 2026 09:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773246802; x=1773851602; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QZxQ/W7gUa+cqIc6WQ/7+HCXvezDqsbdntL4Eq/Kvzg=;
        b=RNwSTCdykJsjKDrFpLqqW7wH313XbNz/K127kdG+TgsEEKxF8MWgiRI2gKSwcGhpv0
         xoJKzoQg5TsQ0u+xQLu4R54a26Obfs4zW0/7CEKFTfOTxVHDL/zyel5Dx8wbpSDU4quD
         M8pwRN+1B8QcykIgmn+xNuF957YW7L7OX+PEhnuRLPw387hV3KvI5Wx7xqReoFQ/z7ep
         30pvg6lOjXJBaSJ/IaF3V1jgN7Ju646T3sMVDvrR6cA2hvpDhKR0Xe8JrwAQsL1/1eQw
         kyZmZzfqjI3C4ZT4TrTT+0HyEiiV2jlHgagSlLHClqFF1hRte9oLSio7NwRMdsEcxeH1
         OpGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773246802; x=1773851602;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QZxQ/W7gUa+cqIc6WQ/7+HCXvezDqsbdntL4Eq/Kvzg=;
        b=wS4ZHHCKRUDQwB7/lMF5NTffsS4BGS3SeijWllCUmfwffyI7Yn2FzEo8XsVwSLlsyv
         MNUZsg9GEvtq2iJrbpYEE70kbaw6uPrpdKE+YKJOQgntBtcYSYi+ANsNiHk2MwEW0mx9
         KjYJGk+ilIM6DGo0TglyTIUMhyo3I9oHnipEgRn+DdNyz/wauF+xwurWpyNW9XZ11y3t
         47KE8rcP5WZ7uSXwjM/oiwEqVyvgUeYP2yREWru6Zbtz81EFWP5MkHjslLJKSCqzpjvB
         aBD5Uzd4oXEIeU5LXuMu/Ei7jsaMj6YMe9noUMV31KtAMBkfWLESFmr9aPrOjRg5mQE+
         wR+Q==
X-Gm-Message-State: AOJu0YwaxVW7mYB0kuvekH5QE3qm9yuJfL9YNkc5w+qsAjAj2+sgJf+i
	wp7BdX2RSfDp0HPWd/D72r4lD6cdkoBKAFA316qrnYSdRo88sYAlErgw
X-Gm-Gg: ATEYQzxD19OB4z5EIKk4WZ5D+YlPtBSregGZFdbMhiUkxMWjfiprECSgKCCs+QuxEm4
	Vy1oCoRQb6J0NYgb97dvtMdK75nLXhyqsYCbP9VFDnLeQuh3D6PHrJ2D4mY3RWnFKA84I+EhwAn
	ffeI1mbraTW4lIZHNjeBD7mTz7lHBVa2lUaToLSHWP9Ef7hYxqnQlvvSr6rKjr7oXiLknn+HKT8
	Jo6Nlim6DdcVKSEiHVKwFxsjeAeM/RWLQlNZ0gVDkD1JuLQJHMOIyhL4YKDSvuiKAz9R4U8lyx0
	8cre8+2pEn2MB1D3zjL3r2xdsIkwT9QNWmlzxPXhueiQBL9g5uhA64Rhzh0PLvFnR5QNhrk2YTn
	YZP0i4lXFlDxJ3MOR13DLVFetjCS5eaexHkQcZ5ElkrE2N8NhtcGatV62uqLBVfnvTHtggrpvx9
	snIFbqrew5g7d8JpfKd/My5TjyYUvgJ0EgJZTybiYoFP4BPiSyayHg
X-Received: by 2002:a05:6000:2509:b0:439:b28c:d47c with SMTP id ffacd0b85a97d-439f821a08fmr6553725f8f.37.1773246801682;
        Wed, 11 Mar 2026 09:33:21 -0700 (PDT)
Received: from aldo-conte-t14.tailf68ad9.ts.net ([217.61.173.50])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe2186e3sm404936f8f.26.2026.03.11.09.33.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 09:33:21 -0700 (PDT)
From: Aldo Conte <aldocontelk@gmail.com>
To: heikki.krogerus@linux.intel.com,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: typec: Document priority and mode_selection fields in struct typec_altmode
Date: Wed, 11 Mar 2026 17:33:20 +0100
Message-ID: <20260311163320.61534-1-aldocontelk@gmail.com>
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
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34601-lists,linux-usb=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[aldocontelk@gmail.com,linux-usb@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TO_DN_NONE(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-usb];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 13EE1267702
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The fields 'priority' and 'mode_selection' in struct typec_altmode are
missing from the kernel-doc comment, which results in warnings when
building the documentation with 'make htmldocs'.

WARNING: ./include/linux/usb/typec_altmode.h:44 struct member 'priority' not described in 'typec_altmode'
WARNING: ./include/linux/usb/typec_altmode.h:44 struct member 'mode_selection' not described in 'typec_altmode'

Document both fields to keep the kernel-doc comment aligned with the
structure definition.

Signed-off-by: Aldo Conte <aldocontelk@gmail.com>
---
 include/linux/usb/typec_altmode.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/linux/usb/typec_altmode.h b/include/linux/usb/typec_altmode.h
index 0513d333b797..b90cc5cfff8d 100644
--- a/include/linux/usb/typec_altmode.h
+++ b/include/linux/usb/typec_altmode.h
@@ -26,6 +26,9 @@ struct typec_altmode_ops;
  * @mode: Index of the Mode
  * @vdo: VDO returned by Discover Modes USB PD command
  * @active: Tells has the mode been entered or not
+ * @priority: Priority used by the automatic alternate mode selection process
+ * @mode_selection: Whether entry to this alternate mode is managed by the
+ * automatic alternate mode selection process or by the specific driver
  * @desc: Optional human readable description of the mode
  * @ops: Operations vector from the driver
  * @cable_ops: Cable operations vector from the driver.
-- 
2.53.0


