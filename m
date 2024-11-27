Return-Path: <linux-usb+bounces-17912-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 774EB9DAFDC
	for <lists+linux-usb@lfdr.de>; Thu, 28 Nov 2024 00:33:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 29AF81626AC
	for <lists+linux-usb@lfdr.de>; Wed, 27 Nov 2024 23:33:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18C0F197A82;
	Wed, 27 Nov 2024 23:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="MolQ24FG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="YomptmrK";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="MolQ24FG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="YomptmrK"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9296417E01B
	for <linux-usb@vger.kernel.org>; Wed, 27 Nov 2024 23:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732750381; cv=none; b=oZJ9OjXN6toCdu/kv0uAWoCAoZv0Qh7KystQGJUCd5sP6vsvfzxIlQLdzNxhzviieiFivREHfAP45RJBqD7M0R99Lj8waArAdiIkObTbgqSBVzdFBEKpwe/UlBiGOsV/EsOGY/KzWP2+5icNM5fg7HBpNvzhbY4QlyMCWd7cwgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732750381; c=relaxed/simple;
	bh=DTCi4wb+9H+DBj8G5RJXgWD1TzkPP4M/8GjbtmKvR+w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jDGTYgviuz5VEkpeFue6ob9OBXH5pVez0MlK2wtzL5vDCNJsvWNW/gSlNrD2+Y8oX7Jl9hV2ZBtin1wHMRiuUnl5X/4dJJuLF0U75/NPVu1beH67Q03vKiueVIXA5ulOJtzKz6dhxptmVGTkKHXlGxUGxU6sDqnMke7Lk1uOEVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=MolQ24FG; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=YomptmrK; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=MolQ24FG; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=YomptmrK; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 94F091F45A;
	Wed, 27 Nov 2024 23:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1732750377; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=HMwEF8rsEu5W4al3T02ghYPyteqvjm7g6ARgTfx7PME=;
	b=MolQ24FG3G6cQMgAAvSkccgV7+T5msfA9grV/x0/7kYwWqAVvJ+GMJfkNglRsfcfs/9vII
	SMYdfAR1iy1dpiFQ66U/CObznpoU/EssL77XqNpsBME/q8IulEpwwWsjTWL3mvDxY7qKuM
	PkHkLFoaJs6I/2zfXct2DZIq+gkBmdM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1732750377;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=HMwEF8rsEu5W4al3T02ghYPyteqvjm7g6ARgTfx7PME=;
	b=YomptmrKLlZeumNzcSCDeAuvTV8L8spUagD3LK9i6TjvMLYXX/P4kvIYPj6W3pNbwKYkr5
	bwT5/r5lsUN0QlCQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1732750377; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=HMwEF8rsEu5W4al3T02ghYPyteqvjm7g6ARgTfx7PME=;
	b=MolQ24FG3G6cQMgAAvSkccgV7+T5msfA9grV/x0/7kYwWqAVvJ+GMJfkNglRsfcfs/9vII
	SMYdfAR1iy1dpiFQ66U/CObznpoU/EssL77XqNpsBME/q8IulEpwwWsjTWL3mvDxY7qKuM
	PkHkLFoaJs6I/2zfXct2DZIq+gkBmdM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1732750377;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=HMwEF8rsEu5W4al3T02ghYPyteqvjm7g6ARgTfx7PME=;
	b=YomptmrKLlZeumNzcSCDeAuvTV8L8spUagD3LK9i6TjvMLYXX/P4kvIYPj6W3pNbwKYkr5
	bwT5/r5lsUN0QlCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 152CF139AA;
	Wed, 27 Nov 2024 23:32:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id g8AJLyesR2cGKgAAD6G6ig
	(envelope-from <ddiss@suse.de>); Wed, 27 Nov 2024 23:32:55 +0000
From: David Disseldorp <ddiss@suse.de>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: linux-usb@vger.kernel.org,
	David Disseldorp <ddiss@suse.de>
Subject: [PATCH v2] usb: collapse USB_STORAGE Kconfig comment
Date: Thu, 28 Nov 2024 10:28:31 +1100
Message-ID: <20241127232830.26923-2-ddiss@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -2.80
X-Spam-Flag: NO

The two Kconfig "comment" calls render in /proc/config.gz as split
sections:
 #
 # NOTE: USB_STORAGE depends on SCSI but BLK_DEV_SD may
 #

 #
 # also be needed; see USB_STORAGE Help for more info
 #

"make menuconfig" renders the comments as:
 *** NOTE: USB_STORAGE depends on SCSI but BLK_DEV_SD may ***
 *** also be needed; see USB_STORAGE Help for more info ***

Kconfig doesn't support splitting a comment cleanly over two lines, so
just collapse it into a single oversize comment.

Signed-off-by: David Disseldorp <ddiss@suse.de>
Acked-by: Alan Stern <stern@rowland.harvard.edu>
---
Changes since v1:
- slightly rework commit message

 drivers/usb/storage/Kconfig | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/usb/storage/Kconfig b/drivers/usb/storage/Kconfig
index d17b60a644efb..4be1d617d63db 100644
--- a/drivers/usb/storage/Kconfig
+++ b/drivers/usb/storage/Kconfig
@@ -3,8 +3,7 @@
 # USB Storage driver configuration
 #
 
-comment "NOTE: USB_STORAGE depends on SCSI but BLK_DEV_SD may"
-comment "also be needed; see USB_STORAGE Help for more info"
+comment "NOTE: USB_STORAGE depends on SCSI but BLK_DEV_SD may also be needed; see USB_STORAGE Help for more info"
 
 config USB_STORAGE
 	tristate "USB Mass Storage support"
-- 
2.43.0


