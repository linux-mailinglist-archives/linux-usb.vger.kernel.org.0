Return-Path: <linux-usb+bounces-34825-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kJ7JEfjItmn6IgEAu9opvQ
	(envelope-from <linux-usb+bounces-34825-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 15 Mar 2026 15:58:00 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D27CC291171
	for <lists+linux-usb@lfdr.de>; Sun, 15 Mar 2026 15:57:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3C09E300B9ED
	for <lists+linux-usb@lfdr.de>; Sun, 15 Mar 2026 14:57:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBAA536D9E2;
	Sun, 15 Mar 2026 14:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IytYzQu+"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2899C36F40A
	for <linux-usb@vger.kernel.org>; Sun, 15 Mar 2026 14:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773586675; cv=none; b=ThMaLaFk/TLvcMkIbgkRIbCiW5U9jpjfX9eeSRGi6TaBj2nxTWqp1tmQo/4CflIEWM+rxMtZOlUldMRvWYeDNJvmIca99Y9JHQWoZt8orAY63EyOlBLt7aElmYyK58c73sTMJunGgU/1ot7FXGOvgPYxlQjGJ5wcapn8DPXy+/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773586675; c=relaxed/simple;
	bh=SiRwyVMaOt26CFo87S22fI41JHdBoXMTM4/ZskBurXE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=in7R5wi3ZtAlugo9mvYgmhnP33BGJofz/PP8NjTg45gdXefL0+aTZYLf5MwWX/bfr8wsAVnfEGb40mR4pzb2SCqjRkHoYI2MS40AxsLlCHZdU2Jn7fxTZs85GrO3HimADBvMV1WCeHWjwq4XbFsEudB0L0UDaRz9G+e3xRFOydM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IytYzQu+; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4852f8ac7e9so44497585e9.1
        for <linux-usb@vger.kernel.org>; Sun, 15 Mar 2026 07:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773586672; x=1774191472; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=M/2BRNq572F4jbHk/ajFuRXBu8mra5iBIAIM0r9vlKY=;
        b=IytYzQu+Q1YbhCNheRVSPndn4Ly78U978fiFF/kIQUo6Ikm2+lbxc5riJ9OlnQFSrK
         0X8UAJrhHzlRwlTUwWEMi4MC8AC8hI5xEBkuAvxalGmss7zMHGFbCHc0yQgKGulm7msW
         AuZmdF5wrrBcrAjff46INaGvg1pMY2XRcZQfoKQ89BwWzkRFWoqRoSUQzdNcJrB9wxtC
         eOkLhTkFMA5C216CCMIyU/LY1OsA5zuCIjL6sT6wxQC1UyjFo/lGo5wvzHqVw/mbns5b
         2iZMw2KSc+CD1f988DX1xF3EldJhx7AdPLaRvkDxdUKMRkXYpEyFF0S2efqFH2w9rLrc
         TpUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773586672; x=1774191472;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M/2BRNq572F4jbHk/ajFuRXBu8mra5iBIAIM0r9vlKY=;
        b=Xda7zMXWOqenJDi7nGp+GKWElHLLuc6Ir6xxry1cbZi3UrQMJgawcHD1J3J2PJROp+
         z0XyHevVf4PuGgRuFXqo1yEv+bghgETxiyEM2su0oIXHYNC77bztfq/R1zx651EB+5kL
         DNob+cd6S/iulDXa+6qs27IvSppRlqE8SpPyNibylw2fBULQMPHA+gjXsXuLME5sYCKT
         F+cbDMQnfSyyUZ89JuzpavTqKpF8yJ76PrWs0391bgH/MMZE2FsnahQl30ENDi6wTK5O
         yGOUW5dwqbAhgzIye+M8irDd2+z7K1Os6LH2tPASWFFe6frqaq7EhhWRKpdxEGivkVdr
         AnNA==
X-Gm-Message-State: AOJu0Yzby1hyYxp2VRoMQ3OMkDyreOOfkKVRKDiPVq0kiohtxoQxM62c
	yadDjFrm5GWh8cBmxY1PQC0PNtwyy1Pj7qPAzO6b8Tprq8crlZ2pCmTt
X-Gm-Gg: ATEYQzwProJ8ASAgSKEOtpme8F2YofO5yOOAKUt3jFDEqyXh8n7LPw4xcs4FAf1ERjj
	8Xm3nPWUyxjmAkQK2de+oH2LDDIPY7qE77MKFCWI0RQQhRcNMlXkpyTDJMp2bF8Mz25EFTXE+6X
	uRZYIandIcPGzblhkOl0YzmHFbXtp47A/bnKTwY6Xk4+NCB2JsFHN/Eq4ZKr0S5Ucm7YkMUEGAf
	8mNKPrhK4vb5SpFrZVFy+Bc8/LsXlDeHoQxS777QGsDZ1EzuaABt7xnG9Bsec2EyY78MGEFHVSJ
	3qE3aeDPYLZgTKYzkxWsdOs/b5zQUPOoWxcGyA91AEETSktIWo16pK9RRTL1GaC5OWu9asoMGuz
	3WN/NildqxkrkRztzhEWmhcJPZJPnKwb3qBpxMkfLLY+WeDA97mwSgcUmOu2uMslUdw/HkASQqw
	i3bD1jz7sYzrslXzNMP04Sm1rCf8UN7h1OApaZUnrUrRgOKA8EMcXpJOMRLU/6eZGoTRNRUlg0n
	CXyNZduNCDNQLWaq6C+z1hjkwcWng==
X-Received: by 2002:a05:600c:a46:b0:485:3b50:fe54 with SMTP id 5b1f17b1804b1-485566d6ff2mr172812215e9.11.1773586672426;
        Sun, 15 Mar 2026 07:57:52 -0700 (PDT)
Received: from DESKTOP-TILNSD1.localdomain ([139.47.104.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4855725572csm135599765e9.2.2026.03.15.07.57.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 07:57:52 -0700 (PDT)
From: Kit Dallege <xaum.io@gmail.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kit Dallege <xaum.io@gmail.com>
Subject: [PATCH 2/5] usb: typec: add kernel-doc for priority and mode_selection members
Date: Sun, 15 Mar 2026 15:57:41 +0100
Message-ID: <20260315145741.24128-1-xaum.io@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34825-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xaumio@gmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D27CC291171
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Document the priority and mode_selection members of struct
typec_altmode that were added without kernel-doc descriptions.

This fixes the following warnings when building with W=1:

  include/linux/usb/typec_altmode.h: struct member 'priority' not described in 'typec_altmode'
  include/linux/usb/typec_altmode.h: struct member 'mode_selection' not described in 'typec_altmode'

Signed-off-by: Kit Dallege <xaum.io@gmail.com>
Signed-off-by: kovan <xaum.io@gmail.com>
---
 include/linux/usb/typec_altmode.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/usb/typec_altmode.h b/include/linux/usb/typec_altmode.h
index 0513d333b797..c7cfc4629484 100644
--- a/include/linux/usb/typec_altmode.h
+++ b/include/linux/usb/typec_altmode.h
@@ -26,6 +26,8 @@ struct typec_altmode_ops;
  * @mode: Index of the Mode
  * @vdo: VDO returned by Discover Modes USB PD command
  * @active: Tells has the mode been entered or not
+ * @priority: Numeric priority for alternate mode selection ordering
+ * @mode_selection: Indicates support for the mode selection feature
  * @desc: Optional human readable description of the mode
  * @ops: Operations vector from the driver
  * @cable_ops: Cable operations vector from the driver.
-- 
2.53.0


