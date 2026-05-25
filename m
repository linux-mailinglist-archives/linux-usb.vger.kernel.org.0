Return-Path: <linux-usb+bounces-38041-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GAMXN/yvFGrRPQcAu9opvQ
	(envelope-from <linux-usb+bounces-38041-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 25 May 2026 22:24:28 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C177F5CE508
	for <lists+linux-usb@lfdr.de>; Mon, 25 May 2026 22:24:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2CB5330087EE
	for <lists+linux-usb@lfdr.de>; Mon, 25 May 2026 20:24:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CB8129D29F;
	Mon, 25 May 2026 20:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q8h1ruv2"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A6843793C3
	for <linux-usb@vger.kernel.org>; Mon, 25 May 2026 20:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779740664; cv=none; b=Y8Ld7RlNtUsgl0VRL+rj7aF2zI+qU6UIyxrot7lKGa+4N32Jz1T8AcL6nvZibCVLDPaxp/OXjiafq+orj0R6jitWfzrH1WG9NuZpshFibBuunQ0jdK0zNg51kxMGJUciwpaf5v32oz6sABC6lx59Vm5k1GVDRZZ7KNNfDV+1udI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779740664; c=relaxed/simple;
	bh=0fGTtdOlj0OaFFj/juQWY2eIIWPMURqhon21vBu56EU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kbosgh9Kso4wT0mRH9WPJpFJSHiJve2LlTEBt9RM0UNIWzmKBMFQNQrNtD4YNFbFAciciOsO1nL7RgAHqCxHd8GVGQx1p2ZtOgSxnnPhAPFpChxZUFmQe21ifDJy+rTU5thUUsoGjRROxUr32Cx8vCfl3RndgYFXt9K1AAzJliw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q8h1ruv2; arc=none smtp.client-ip=209.85.167.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-4856128f670so2182263b6e.0
        for <linux-usb@vger.kernel.org>; Mon, 25 May 2026 13:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779740661; x=1780345461; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rH2bOPxUTZ7jcp1ZJ8Ke8Qi27deWhvd2Eb9MPg+cVXs=;
        b=q8h1ruv2kCZ+F72CzBFlom71z6M0RFl0p3YWKBF1DVOTkROSe2luFX1s8NCuq8HUTy
         33KA6AXLk2dijHS4MefVPz4VkwmhIlgL/nh4ZpKrS+zVDpmfWlLHb3cfB0xGtH7EEu6L
         nNzNivkxKipQ6ERuq+aKm86DbkI+qOci9LIWxoYXIlNOz4q1DspL1BkAMNGep4/54rat
         X6yzNmE1yLeZ6YVcaRibilNSPOkGM6Yhy7kMBj0v0ig8XLRqSHEk+ryRe/lZMypVzVvX
         px2VBWrUGd1VoGi/chUtQAgJVZae5I8V2p3D/D+GW9K2f9UYryRoOZTfzSqhGkq7GSuc
         2vpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779740661; x=1780345461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rH2bOPxUTZ7jcp1ZJ8Ke8Qi27deWhvd2Eb9MPg+cVXs=;
        b=HfLBhpFBKiffPBoYAeLBriaFZNaFe4XanTeLjJRnNcW/LaVu4W1fl+EhgwIyUwlJYG
         lTPNreS+wJA5asg0XWxN0bykwb20S0R/O2AgaDJWQGSPRk9zYLOexiJdIhxt8s+lj1G/
         VfmXojsvrgxuRAHZS+mYiOe0UaKUoONl/vkpE3P3fppjE66CpZ4aTX8Xm2CmgSZsd6E+
         5lGpDnpG7bsRw80KLBZH2hHvqq9K9TPez33pAi5RmFiCCB6qENg7m5Hg6b7ijRm+p+2I
         RbznONMtZFseCJ7Y7xKSk5omC7dZkZhs4Rm8BwNQFuTqoOyt17rYV41btPiywX0oLxKg
         wjvQ==
X-Gm-Message-State: AOJu0YztbJ3TnaHb7/g1A1FfbfdHPM8zw1ZGNL/7/WMiqMftQ0rlQlNv
	Ad0eNprzKGQKq1PPDFIahp0+sI+lcGvH+w3Zzgn4BLVlP4h5/54O2Hm3smgyYju2/qE=
X-Gm-Gg: Acq92OGu+8/ziFGj4W/jvFiEYU1b3TN+4oTCcNWA7acLAt4fJT6ZCdpYvF9W1zm4/6T
	KkyHyQeEBuGmyyvBYfS0yIWe29oHEJPq0dPHrKd9/9LyEbb08Vmr7+DWZ7IgEvdH9+T0Xn0dX+6
	+Gdmr3aUZz8stBq24oK4i64I/qzhMPMivLz1/QNUK9XC/75DM1CJ+eyofx+v+mUv96wctyHA+Ku
	U+/2k3UwzYgovPNOgyxF7qTPdx2QYkoOwwz/MI+2/MaZmokVOjvfOtL97+XxJWi4fQqfINnoEgb
	G6ZGDrIh1A8ovd2QJQN0gwzzITv8bJS42G7P2HvoqegcxLkwcT1xCVl+ne9jcaK37T9z+n/KLAp
	YSaqnKsDcx595iWasgENn+xvkLH3HQ1zEHlfEOGGVlX7XDce92ywI3j9I33i+yAoGvcMhtxyGcp
	zBPpPyDekTCt8YRuFEEhxKtdqeHSw6GP/RvHFYuDSeCqFzZOKWvgdXY9M7plzbQMH0icWWSq7su
	wGKsYmq4qtSELhMnMP+lLaSFFms0Glnxs7jdTcSyoYmFS8=
X-Received: by 2002:a05:6808:23c4:b0:479:eb19:6e6b with SMTP id 5614622812f47-48549ead75cmr11293528b6e.15.1779740661270;
        Mon, 25 May 2026 13:24:21 -0700 (PDT)
Received: from DESKTOP-J47FREO.mynetworksettings.com (171.sub-75-196-24.myvzw.com. [75.196.24.171])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-48554757d5dsm5204305b6e.15.2026.05.25.13.24.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 13:24:21 -0700 (PDT)
From: Adrian Korwel <adriank20047@gmail.com>
To: linux-usb@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	stable@vger.kernel.org,
	heikki.krogerus@linux.intel.com,
	Adrian Korwel <adriank20047@gmail.com>
Subject: [PATCH 3/4] usb: gadget: f_uac1_legacy: fix use-after-free caused by bound guard
Date: Mon, 25 May 2026 15:24:12 -0500
Message-ID: <20260525202414.602-6-adriank20047@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260525202414.602-1-adriank20047@gmail.com>
References: <2026052517-undergrad-reformat-44bc@gregkh>
 <20260525202414.602-1-adriank20047@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[linuxfoundation.org,vger.kernel.org,linux.intel.com,gmail.com];
	TAGGED_FROM(0.00)[bounces-38041-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[adriank20047@gmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: C177F5CE508
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

f_audio_bind() guards gaudio_setup() with an 'audio_opts->bound' flag
to prevent re-initialization on repeated bind attempts. However the
fail: error path unconditionally calls gaudio_cleanup(). On repeated
bind attempts after failure, this closes file handles that were opened
in a previous bind invocation and already freed by RCU, causing a
use-after-free detected by KASAN:

  BUG: KASAN: slab-use-after-free in filp_flush+0x23/0x1b0
  Read of size 8 at addr ffff88810d5523a8 by task bash/306
  ...
  gaudio_cleanup+0x59/0x100
  f_audio_bind+0x4b0/0x590

Fix by removing the bound guard and calling gaudio_setup()
unconditionally in f_audio_bind(), making setup and cleanup a matched
pair within each bind invocation. Remove the now-unused 'bound' field
from struct f_uac1_legacy_opts.

Fixes: d355339eecd9 ("usb: gadget: function: make current f_uac1 implementation legacy")
Cc: stable@vger.kernel.org
Signed-off-by: Adrian Korwel <adriank20047@gmail.com>
---
 drivers/usb/gadget/function/f_uac1_legacy.c | 11 ++++-------
 drivers/usb/gadget/function/u_uac1_legacy.h |  1 -
 2 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/gadget/function/f_uac1_legacy.c b/drivers/usb/gadget/function/f_uac1_legacy.c
index 5d201a2e30e7..6ad4b16769b7 100644
--- a/drivers/usb/gadget/function/f_uac1_legacy.c
+++ b/drivers/usb/gadget/function/f_uac1_legacy.c
@@ -735,13 +735,10 @@ f_audio_bind(struct usb_configuration *c, struct usb_function *f)
 
 	audio_opts = container_of(f->fi, struct f_uac1_legacy_opts, func_inst);
 	audio->card.gadget = c->cdev->gadget;
-	/* set up ASLA audio devices */
-	if (!audio_opts->bound) {
-		status = gaudio_setup(&audio->card);
-		if (status < 0)
-			return status;
-		audio_opts->bound = true;
-	}
+	/* set up ALSA audio devices */
+	status = gaudio_setup(&audio->card);
+	if (status < 0)
+		return status;
 	us = usb_gstrings_attach(cdev, uac1_strings, ARRAY_SIZE(strings_uac1));
 	if (IS_ERR(us))
 		return PTR_ERR(us);
diff --git a/drivers/usb/gadget/function/u_uac1_legacy.h b/drivers/usb/gadget/function/u_uac1_legacy.h
index b5df9bcbbeba..fd22fd37fe53 100644
--- a/drivers/usb/gadget/function/u_uac1_legacy.h
+++ b/drivers/usb/gadget/function/u_uac1_legacy.h
@@ -61,7 +61,6 @@ struct f_uac1_legacy_opts {
 	char				*fn_play;
 	char				*fn_cap;
 	char				*fn_cntl;
-	unsigned			bound:1;
 	unsigned			fn_play_alloc:1;
 	unsigned			fn_cap_alloc:1;
 	unsigned			fn_cntl_alloc:1;
-- 
2.43.0


