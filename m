Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0411C27222D
	for <lists+linux-usb@lfdr.de>; Mon, 21 Sep 2020 13:21:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726457AbgIULVU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 21 Sep 2020 07:21:20 -0400
Received: from mx2.suse.de ([195.135.220.15]:58136 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726424AbgIULVR (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 21 Sep 2020 07:21:17 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1600687276;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:in-reply-to:in-reply-to:references:references;
        bh=8d1aXqgHDJwOdjA+ia7wq/6Fdl+kzdMh7SX4pt8jxVs=;
        b=JWet3tZA9Ckzkgyvsq8d7Q4MB5Q4MrVc5HNPWv1pTb8xn8T5WKz3RBblBmDq7EtM45PdKB
        FWHAAyKAfLQd7ERsQPUTUiWup1OjLKrqsyvXDlE9f00S1qrABU9POT2/LylPGQW6hcXl/l
        ukB6Y/tazyKpqR8LmPekbmxZvg829ic=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id E8E1AB208;
        Mon, 21 Sep 2020 11:21:51 +0000 (UTC)
From:   Oliver Neukum <oneukum@suse.com>
To:     penguin-kernel@i-love.sakura.ne.jp, bjorn@mork.no,
        linux-usb@vger.kernel.org
Cc:     Oliver Neukum <oneukum@suse.com>
Subject: [RFC 6/8] CDC-WDM: correct error reporting in write()
Date:   Mon, 21 Sep 2020 13:20:50 +0200
Message-Id: <20200921112052.27943-7-oneukum@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200921112052.27943-1-oneukum@suse.com>
References: <20200921112052.27943-1-oneukum@suse.com>
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
index 89929f6438e3..f952eec87b0f 100644
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

