Return-Path: <linux-usb+bounces-31432-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE23CBBEDE
	for <lists+linux-usb@lfdr.de>; Sun, 14 Dec 2025 19:38:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D67AD3007C52
	for <lists+linux-usb@lfdr.de>; Sun, 14 Dec 2025 18:37:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB07F30C63D;
	Sun, 14 Dec 2025 18:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S9SYFWTo"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E520F513
	for <linux-usb@vger.kernel.org>; Sun, 14 Dec 2025 18:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765737476; cv=none; b=tiLGkXJtthkLaxnMqZn1lcQxPSEswgFnaU1ysOlOn5MvN2feWjcxxOhbHA6oa9nNu6JaUbatxSqKv9hAf8V7Dcd6fTTbHuhZZJV4JR+ef24UDBozy0+5ht3eyykgGECBKcQw5nU8UDix1MgkiAL7dnbaUiA0kgv4O1n/588IsGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765737476; c=relaxed/simple;
	bh=fnRBvnMiDNGGg/pXU74r/vKffuu0OcsAnSa85V/W5Q8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dOj7+VcOdGVTK6OrfUbK5kYKcwCDoKnoZpeuCqdCrlGveymym+mQaTd//AKOQ3W1MuTr1UQaELu+iLg6G6WyOtnD/UTb0sbBTlAL2VIk0S/aV2Bt+RiQxzqzPYKIJLqNRz+G7Y6WnCJc90TwcVHBlKcnE6cuQZfMEDTQl0Lg8Qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S9SYFWTo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38A41C4CEF1;
	Sun, 14 Dec 2025 18:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765737475;
	bh=fnRBvnMiDNGGg/pXU74r/vKffuu0OcsAnSa85V/W5Q8=;
	h=From:To:Cc:Subject:Date:From;
	b=S9SYFWTo4Uf9h//1NBc+EK/T7k8Nxm1CDrK5ZxheEDR0Mlvxwcz3lZUAUSadkqki5
	 L/XFl4apQtZpK2Vt5yKHQMc4WiQ6H3+1r33beFaf5h1qzYQddNgPPbspArNcQ25rYG
	 MUMEdqNNlBrxHikC/Qp7E8LR1wM9AU7tT1xIT7lg0iVzOLia0W/NSUWz6kNlI4U0Mb
	 sIs05Vd1TC6+/CD4EodI1Y5rkTZZKO5zWSoUrT8rkhS8/6ZAr7jKqddSBJJkNjfsCY
	 5QLbcNCBhhCgoPW3QVbQwik1YCsdZNykpQQgllod/sgvkKX2ZQwACwr3EHsiw5ltEd
	 twWhTRwyVQ1HQ==
From: "Mario Limonciello (AMD)" <superm1@kernel.org>
To: mario.limonciello@amd.com,
	heikki.krogerus@linux.intel.com,
	gregkh@linuxfoundation.org,
	lumag@kernel.org,
	ukaszb@chromium.org
Cc: "Mario Limonciello (AMD)" <superm1@kernel.org>,
	linux-usb@vger.kernel.org
Subject: [PATCH] usb: typec: ucsi: Fix null pointer dereference in ucsi_sync_control_common
Date: Sun, 14 Dec 2025 12:36:41 -0600
Message-ID: <20251214183729.150811-1-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing null check for cci parameter before dereferencing it in
ucsi_sync_control_common(). The function can be called with cci=NULL
from ucsi_acknowledge(), which leads to a null pointer dereference
when accessing *cci in the condition check.

The crash occurs because the code checks if cci is not null before
calling ucsi->ops->read_cci(ucsi, cci), but then immediately
dereferences cci without a null check in the following condition:
(*cci & UCSI_CCI_COMMAND_COMPLETE).

KASAN trace:
  KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]
  RIP: 0010:ucsi_sync_control_common+0x2ae/0x4e0 [typec_ucsi]

Fixes: 667ecac55861 ("usb: typec: ucsi: return CCI and message from sync_control callback")
Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>
---
 drivers/usb/typec/ucsi/ucsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 9b3df776137a1..7129973f19e7e 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -97,7 +97,7 @@ int ucsi_sync_control_common(struct ucsi *ucsi, u64 command, u32 *cci)
 	if (!ret && cci)
 		ret = ucsi->ops->read_cci(ucsi, cci);
 
-	if (!ret && ucsi->message_in_size > 0 &&
+	if (!ret && cci && ucsi->message_in_size > 0 &&
 	    (*cci & UCSI_CCI_COMMAND_COMPLETE))
 		ret = ucsi->ops->read_message_in(ucsi, ucsi->message_in,
 						 ucsi->message_in_size);
-- 
2.43.0


