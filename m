Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD51427409C
	for <lists+linux-usb@lfdr.de>; Tue, 22 Sep 2020 13:21:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726573AbgIVLVx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 22 Sep 2020 07:21:53 -0400
Received: from mx2.suse.de ([195.135.220.15]:37422 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726559AbgIVLVw (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 22 Sep 2020 07:21:52 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1600773711;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:in-reply-to:in-reply-to:references:references;
        bh=enkvzSACilXPdBEKnE+T7BwCxIvLK9Ib/5smmf0iTFA=;
        b=T9B+ooHdqOf/Dns7WNYf+Lzag2Vui9Gj26jUkYCZvUEjnt8/xrKcYqjGVPJ3bBTIby6qZc
        tip5xlJ4EGJhC/CnyTx/HRwEWD6KyHzf4q/iY9c1P5/1895GQEVga2REvRmq7GoHzIQDuz
        E1GkUNjSJxEq93ymNRyGFrInssfpE40=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id B228EAE35;
        Tue, 22 Sep 2020 11:22:27 +0000 (UTC)
From:   Oliver Neukum <oneukum@suse.com>
To:     penguin-kernel@i-love.sakura.ne.jp, bjorn@mork.no,
        linux-usb@vger.kernel.org
Cc:     Oliver Neukum <oneukum@suse.com>
Subject: [RFC 5/7] CDC-WDM: correct error reporting in write()
Date:   Tue, 22 Sep 2020 13:21:24 +0200
Message-Id: <20200922112126.16919-6-oneukum@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200922112126.16919-1-oneukum@suse.com>
References: <20200922112126.16919-1-oneukum@suse.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

In case our wait was interrupted by a disconnect, we should report
that.

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/usb/class/cdc-wdm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/class/cdc-wdm.c b/drivers/usb/class/cdc-wdm.c
index 5fb855404403..242f83118208 100644
--- a/drivers/usb/class/cdc-wdm.c
+++ b/drivers/usb/class/cdc-wdm.c
@@ -396,6 +396,9 @@ static ssize_t wdm_write
 	if (test_bit(WDM_RESETTING, &desc->flags))
 		r = -EIO;
 
+	if (test_bit(WDM_DISCONNECTING, &desc->flags))
+		r = -ENODEV;
+
 	if (r < 0) {
 		rv = r;
 		goto out_free_mem_pm;
-- 
2.16.4

