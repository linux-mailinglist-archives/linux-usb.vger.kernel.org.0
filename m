Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E72CB215868
	for <lists+linux-usb@lfdr.de>; Mon,  6 Jul 2020 15:34:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729204AbgGFNeR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Jul 2020 09:34:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729354AbgGFNeQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Jul 2020 09:34:16 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BB7EC061794
        for <linux-usb@vger.kernel.org>; Mon,  6 Jul 2020 06:34:15 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id l2so40630820wmf.0
        for <linux-usb@vger.kernel.org>; Mon, 06 Jul 2020 06:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tuuvgBdpWU3P+bBrTu/2KsiGO4ss74gkTJhNI/l0mkY=;
        b=tDxm68x6EEuzSyF8zb1P7MNnLA1RLSLV7ALNXgP2jbhLbdEirodV/LE4bXzaJbsPRg
         SUs25JhonwmI4Zqrwaw4zG1N8CYo4lAXlnF26lpK/OFRkQCBCsW93WEi1lCMj5UWQUmj
         QMnuck2Ci0chN7EEaR5qWLPh9Nag2b7j1MCcb9/mrCXgV+WBZ7ijQZzXPdT8Hjg0PTNS
         goxdYPMOU0X2sc2aE1VXEpQk/0hLVxQjbMvmUCXhN28efa29/LuSc8kkdAhJT0CG2LUK
         rVz1fvRtUKDbzGwTdNfqJrgIE5j/IDqenQl2BErSZqG2pPSnQFEsUwi3TsrnXUWaGjxc
         gQXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tuuvgBdpWU3P+bBrTu/2KsiGO4ss74gkTJhNI/l0mkY=;
        b=jdRt0SXtbxxxi5a+nWNt5eKHNNlYBfsq0aGX4F9cnWZ60K1C4gBKnmLeU43tKVywaC
         EjZvUQ5XhSZNvUp8mfOKLEBNCMT1yctHhjpd2Vpd2gj6wQC7T5lPLwueK1xOUydPdHYT
         222B/MwAAqbcytllClnu8FYiJxtnt3SsTS1dBhkov6mQr5h/5UVFJIrdh81I/mMP4KZr
         nDW7nBNXlVajsDRAFOcTDkbc5/glnUIacJqlwkR3DkjYAuFE3OmVPgj0QO8f+TjdirRr
         /GRqN/UmSy+neEDnzQ7IBzR4Ii4ruAlOm9P5TI+9q1omPbqUQEdzbOBVvJgYJ4ys65WQ
         AD2A==
X-Gm-Message-State: AOAM530ebmRGEAJ4l4Siagl0DZ7OhTHJ5gADPxMyn0sWrCZtfAQKZsIW
        yJ8MZX0y04wTfNovnO7RX1UH0Q==
X-Google-Smtp-Source: ABdhPJzuzYNNW71b23BvSLPHgO5D0LojminjFAQt3G/egnKeifhMWhpTDqlAyYc41PSyJlYXg/HnVQ==
X-Received: by 2002:a1c:49d4:: with SMTP id w203mr50012638wma.13.1594042454380;
        Mon, 06 Jul 2020 06:34:14 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.206])
        by smtp.gmail.com with ESMTPSA id v18sm25416082wrv.49.2020.07.06.06.34.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2020 06:34:13 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
        Sumit Garg <sumit.garg@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Petr Mladek <pmladek@suse.com>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        Yinghai Lu <yhlu.kernel@gmail.com>,
        Jason Wessel <jason.wessel@windriver.com>
Subject: [PATCH 25/32] usb: early: ehci-dbgp: Remove set but never checked variable 'ret'
Date:   Mon,  6 Jul 2020 14:33:34 +0100
Message-Id: <20200706133341.476881-26-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200706133341.476881-1-lee.jones@linaro.org>
References: <20200706133341.476881-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

'ret' hasn't  been checked since the driver's inception in 2009.

Fixes the following W=1 kernel build warning(s):

 drivers/usb/early/ehci-dbgp.c: In function ‘early_dbgp_write’:
 drivers/usb/early/ehci-dbgp.c:915:13: warning: variable ‘ret’ set but not used [-Wunused-but-set-variable]
 915 | int chunk, ret;
 | ^~~

Cc: Sumit Garg <sumit.garg@linaro.org>
Cc: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Douglas Anderson <dianders@chromium.org>
Cc: Petr Mladek <pmladek@suse.com>
Cc: "Eric W. Biederman" <ebiederm@xmission.com>
Cc: Yinghai Lu <yhlu.kernel@gmail.com>
Cc: Jason Wessel <jason.wessel@windriver.com>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/usb/early/ehci-dbgp.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/early/ehci-dbgp.c b/drivers/usb/early/ehci-dbgp.c
index 775cf70cfb3ed..b075dbfad730f 100644
--- a/drivers/usb/early/ehci-dbgp.c
+++ b/drivers/usb/early/ehci-dbgp.c
@@ -912,7 +912,7 @@ int __init early_dbgp_init(char *s)
 
 static void early_dbgp_write(struct console *con, const char *str, u32 n)
 {
-	int chunk, ret;
+	int chunk;
 	char buf[DBGP_MAX_PACKET];
 	int use_cr = 0;
 	u32 cmd, ctrl;
@@ -951,8 +951,8 @@ static void early_dbgp_write(struct console *con, const char *str, u32 n)
 			buf[chunk] = *str;
 		}
 		if (chunk > 0) {
-			ret = dbgp_bulk_write(USB_DEBUG_DEVNUM,
-				      dbgp_endpoint_out, buf, chunk);
+			dbgp_bulk_write(USB_DEBUG_DEVNUM,
+					dbgp_endpoint_out, buf, chunk);
 		}
 	}
 	if (unlikely(reset_run)) {
-- 
2.25.1

