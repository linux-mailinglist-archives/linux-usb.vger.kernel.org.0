Return-Path: <linux-usb+bounces-18938-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD7B79FF41B
	for <lists+linux-usb@lfdr.de>; Wed,  1 Jan 2025 14:11:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E4F2C3A2CBE
	for <lists+linux-usb@lfdr.de>; Wed,  1 Jan 2025 13:11:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6B761E1C34;
	Wed,  1 Jan 2025 13:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mTNLN2ge";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5uVrzIVc";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mTNLN2ge";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5uVrzIVc"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30FAB2119;
	Wed,  1 Jan 2025 13:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735737093; cv=none; b=X770sBV/0Pccyx2PHmkdE95vChpkbr1ntTiz6ewNV768OKneRS1Sgi3vwCyJO3F+GDdLEqWEZ0XF4vc+dGMjh/GC7RlsnEnOsjKDus4mehLQOGF17foPMtKL4M0nwd2nKON2LkiNiBzecrntSO0wrPS98EAtHrE0cv1/OZa/jxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735737093; c=relaxed/simple;
	bh=iXtipRhqX16SJITn6I4pfiwoOE5rSI6qeK7xUZzD6yE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=deXGoz4G7sZie9MfeqowEO95RqtlmJo+yjfQHwtfMWR7r/YJEBaGVAXUqNCuQ7o2Owg+V+FT85q7E5kFEfMC2VZozaRsoFITLFUBVFll0hdbt4qXKj70fPio4tnvzCXNQgQBVud+lwgPKmY6HRG+4e7wjZbVcRenwquChxbUt90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mTNLN2ge; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=5uVrzIVc; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mTNLN2ge; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=5uVrzIVc; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 3B26C1F37C;
	Wed,  1 Jan 2025 13:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1735737089; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=+tnd7gGjYuw0AJb4owT7E8VLfdvM4MteV/1kdXiZqKQ=;
	b=mTNLN2geWvckzkao5fXlEylXuxeyPctgGqlwU2ByOCptwIdE7X4iP2rjzYLhFjZYyeLdM3
	zcsVI41bjwJWeoZiUSF5UfUaVJhaVIFNhc12lc+UpBNwOe+1lefh04FLYlq0GwYON7l8KP
	7KiySyQOK36jmppLqAv/qzy5y+Zujjk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1735737089;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=+tnd7gGjYuw0AJb4owT7E8VLfdvM4MteV/1kdXiZqKQ=;
	b=5uVrzIVclfZnOJtw1EoL6cVRToV1K4jp4fQ9N971p0vz/zd8MskTqUvet2fBKbS3+lfScU
	fYxJbsIDeXZf6FBQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=mTNLN2ge;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=5uVrzIVc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1735737089; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=+tnd7gGjYuw0AJb4owT7E8VLfdvM4MteV/1kdXiZqKQ=;
	b=mTNLN2geWvckzkao5fXlEylXuxeyPctgGqlwU2ByOCptwIdE7X4iP2rjzYLhFjZYyeLdM3
	zcsVI41bjwJWeoZiUSF5UfUaVJhaVIFNhc12lc+UpBNwOe+1lefh04FLYlq0GwYON7l8KP
	7KiySyQOK36jmppLqAv/qzy5y+Zujjk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1735737089;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=+tnd7gGjYuw0AJb4owT7E8VLfdvM4MteV/1kdXiZqKQ=;
	b=5uVrzIVclfZnOJtw1EoL6cVRToV1K4jp4fQ9N971p0vz/zd8MskTqUvet2fBKbS3+lfScU
	fYxJbsIDeXZf6FBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EEF5813A30;
	Wed,  1 Jan 2025 13:11:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id iXWROAA/dWcdVAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 01 Jan 2025 13:11:28 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: gadget: midi2: Reverse-select at the right place
Date: Wed,  1 Jan 2025 14:11:19 +0100
Message-ID: <20250101131124.27599-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 3B26C1F37C
X-Spam-Score: -3.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

We should do reverse selection of other components from
CONFIG_USB_F_MIDI2 which is tristate, instead of
CONFIG_USB_CONFIGFS_F_MIDI2 which is bool, for satisfying subtle
module dependencies.

Fixes: 8b645922b223 ("usb: gadget: Add support for USB MIDI 2.0 function driver")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 drivers/usb/gadget/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/Kconfig b/drivers/usb/gadget/Kconfig
index 566ff0b1282a..76521555e3c1 100644
--- a/drivers/usb/gadget/Kconfig
+++ b/drivers/usb/gadget/Kconfig
@@ -211,6 +211,8 @@ config USB_F_MIDI
 
 config USB_F_MIDI2
 	tristate
+	select SND_UMP
+	select SND_UMP_LEGACY_RAWMIDI
 
 config USB_F_HID
 	tristate
@@ -445,8 +447,6 @@ config USB_CONFIGFS_F_MIDI2
 	depends on USB_CONFIGFS
 	depends on SND
 	select USB_LIBCOMPOSITE
-	select SND_UMP
-	select SND_UMP_LEGACY_RAWMIDI
 	select USB_F_MIDI2
 	help
 	  The MIDI 2.0 function driver provides the generic emulated
-- 
2.43.0


