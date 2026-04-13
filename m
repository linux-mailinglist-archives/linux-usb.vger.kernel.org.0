Return-Path: <linux-usb+bounces-36210-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OMJ6Enz93Gk3YwkAu9opvQ
	(envelope-from <linux-usb+bounces-36210-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 13 Apr 2026 16:28:12 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B68123ED532
	for <lists+linux-usb@lfdr.de>; Mon, 13 Apr 2026 16:28:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9C0D8301ECE3
	for <lists+linux-usb@lfdr.de>; Mon, 13 Apr 2026 14:22:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CACE3A3E99;
	Mon, 13 Apr 2026 14:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y71jz3FF"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B96163DD504
	for <linux-usb@vger.kernel.org>; Mon, 13 Apr 2026 14:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776090101; cv=none; b=QWuoH59UdR5tRoY2AFdYSCtBMcF8OiOYnDKeGU2a/YSMTKAuCmW50JhQSPrhpNeuNymnw8MAmHs1etXdhXXlEDkvnLrk3XjImmznKffXZ0BfdIB0Elgx4C2eQgwc4I3n5VviaRP4t5fni/CxnE1vBL2oS5SEPk5jcDoNCW6xcOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776090101; c=relaxed/simple;
	bh=wUuiTpK15zyn5hV2DVktQywHOc6nIUCjJeLdNjsqI48=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HIlbQfq+b/HUzMGoLc9UNc0XrqVj9E8iNdSvre0tX/Na9B45PoGT8PGYb/ZnKjf4naitPoyzj8bgrz3BAzf8ucZ6Rlrc8haC2B3FhpClhM7FCQt71gl92Eox8zYlYqRPMxgwttGEFg6PaJ3LH6QmBwXEultt+CaSY/bCGbgnD1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y71jz3FF; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-35d94f4ee36so2570602a91.3
        for <linux-usb@vger.kernel.org>; Mon, 13 Apr 2026 07:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776090096; x=1776694896; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yBYOrlMuwKgniT2kucvgYI8tCUxUSyygqBtilwNBNy8=;
        b=Y71jz3FFdVZq84s9JwTwapFVF6LNurvblpDHLhssEaCAkN6waVLqSU1XpzaAvcl/AI
         dzYYosC/tpohTMPuPJC1jJ4rWlr6IZWfMCeNecVUqiMP9uJsA5fYh8y7p3B2MJKU9fQf
         vZ3L6sCxEDyt0wOk0RSnuJXOZAIkKI+WWx2+3EeJGpqO1AsBC9OjczMUnLOAV0lnsAaw
         hzM4Z+Kto0CTKaDviROutgi+bPSF78+rjR2r3VAucrN61gDhcoUGFUTT9x9YllTDzAjs
         qveynFkTPOBxPV/a/jvHviOoV18l+Q3yAGfwG3vv8MQwqMR68RV5QfepA+mg86Sw86kb
         zeDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776090096; x=1776694896;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yBYOrlMuwKgniT2kucvgYI8tCUxUSyygqBtilwNBNy8=;
        b=dQVknTJ42ciK47ktfIuUpWlwOBt4FbBIeA1/oOUA6d3RAIQ08vwwy4Z+lWb1A5fAJy
         r4exQn8CCehrrq3E3+HqbFin+h12QpMq9xykKa2wXWRLPZlQnlqhJ4btFis0dFjmElBI
         opX3M9VyUZG0wCeAQnytB8UiaZupkEOPItKALhXN/svBJ/EUnIKRGgU9xZFh/D6LhuDr
         et+PZfvl+vPKSr2ewDlbd9SVl/Qu8XcoJizb3FhbIyo6C4e9m25COMEBnw7jlYT7k6UR
         mZZxInbZkH94fUetkH9546amRfvztt8+aZodHSckUc6RjipesUz5eEDaa1+fekIl8tlT
         Hg/Q==
X-Forwarded-Encrypted: i=1; AFNElJ/qeCyfcsRRtofpgLFF2qjTKOgznhp9+JkjTD5gDkx00ZThsG5VoC8jMFjBf6h/5xmELwf1OULa6Og=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOXBhf4LzieFe3heJhBIb/Hf8s/aZO9WRw91BZWvVOLJ4F3bx+
	YzsRvTQ28gwvc6JOKMqpxnqfu71ibDjjzDZaHvY2IzjhMLP2lnmCf+bD
X-Gm-Gg: AeBDietSLOpsV9OfP5jdlPFeJl1MZwtF0k2gba3e6lVdXe453xXSvZvsZQfLIJD8UBC
	1eIVCXFNKRmJpy3YkQrUbzCFiOX+0inR+FlpeapRYHXphC/Q5kF/OggUJwgunCrJOYOKnfVp0ZV
	VoaB5tXYDe7vfS9aTqxcFQ6pHtcYfUrJeUuuXhJ7netbf2SnD56WUw2U36Xjs0IFCJitax4Al6U
	gAYFhLdYzXO06DH4HDv/fvoQlL+6jQ8hUFCBkDEI5NnwJyU5hfufkTw48R0Lg3gdxElC5MOqX7f
	YGKUiG7dN7P7EExQFeOR+SnSO8+QnXKW2PYxR1wfyT5DfElzj82vV2RWni0iL6Jdbleh1CAu4mT
	s7z5GLiwAS3YEJEf9yjtcPqC8xw2CYaadFmrR15HxAy/8n5b+PAXZUtHNB49UcIeA8ffGy+DlZi
	WZvWqybX7aBs45ya72M3+hpARVlZOIo6o=
X-Received: by 2002:a17:90b:3950:b0:35c:1695:24a3 with SMTP id 98e67ed59e1d1-35e4281374emr13692490a91.23.1776090096314;
        Mon, 13 Apr 2026 07:21:36 -0700 (PDT)
Received: from lgs.. ([2409:893d:1188:142d:6c67:74e8:5200:1f39])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35e41f17991sm4258473a91.3.2026.04.13.07.21.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 07:21:35 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ben Hoff <hoff.benjamin.k@gmail.com>,
	Michael Kelley <mhklinux@outlook.com>,
	Jiri Kosina <jikos@kernel.org>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	William Wu <william.wu@rock-chips.com>,
	Terry Junge <linuxhid@cosmicgizmosystems.com>,
	Yuhao Jiang <danisjiang@gmail.com>,
	Lee Jones <lee@kernel.org>,
	John Keeping <john@keeping.me.uk>,
	Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH v3] usb: gadget: f_hid: fix device reference leak in hidg_alloc()
Date: Mon, 13 Apr 2026 22:21:19 +0800
Message-ID: <20260413142119.2977716-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-36210-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_TO(0.00)[linuxfoundation.org,gmail.com,outlook.com,kernel.org,suse.com,rock-chips.com,cosmicgizmosystems.com,keeping.me.uk,collabora.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lgs201920130244@gmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-0.997];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B68123ED532
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

hidg_alloc() initializes hidg->dev with device_initialize() before
calling dev_set_name(). If dev_set_name() fails, the function currently
jumps to err_unlock and returns without calling put_device().

This leaves the device reference unbalanced and prevents hidg_release()
from being called. Calling put_device() here is also safe, since
hidg_release() only frees resources owned by hidg.

The issue was identified by a static analysis tool I developed and
confirmed by manual review.

Route the dev_set_name() failure path through err_put_device so the
device reference is dropped properly.

Fixes: 89ff3dfac604 ("usb: gadget: f_hid: fix f_hidg lifetime vs cdev")
Cc: stable@vger.kernel.org
Reviewed-by: Johan Hovold <johan@kernel.org>
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
v3:
  - note that the issue was identified by my static analysis tool
  - and confirmed by manual review

v2:
  - correct Fixes tag to 89ff3dfac604
  - add Reviewed-by from Johan Hovold

 drivers/usb/gadget/function/f_hid.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/function/f_hid.c b/drivers/usb/gadget/function/f_hid.c
index 3ddfd4f66f0b..2734ebd35bda 100644
--- a/drivers/usb/gadget/function/f_hid.c
+++ b/drivers/usb/gadget/function/f_hid.c
@@ -1610,7 +1610,7 @@ static struct usb_function *hidg_alloc(struct usb_function_instance *fi)
 	hidg->dev.devt = MKDEV(major, opts->minor);
 	ret = dev_set_name(&hidg->dev, "hidg%d", opts->minor);
 	if (ret)
-		goto err_unlock;
+		goto err_put_device;
 
 	hidg->bInterfaceSubClass = opts->subclass;
 	hidg->bInterfaceProtocol = opts->protocol;
@@ -1647,7 +1647,6 @@ static struct usb_function *hidg_alloc(struct usb_function_instance *fi)
 
 err_put_device:
 	put_device(&hidg->dev);
-err_unlock:
 	mutex_unlock(&opts->lock);
 	return ERR_PTR(ret);
 }
-- 
2.43.0


