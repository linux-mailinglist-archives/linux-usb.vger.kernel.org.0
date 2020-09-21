Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EBE92730FB
	for <lists+linux-usb@lfdr.de>; Mon, 21 Sep 2020 19:44:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727943AbgIURm3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 21 Sep 2020 13:42:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727248AbgIURm3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 21 Sep 2020 13:42:29 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71B28C061755
        for <linux-usb@vger.kernel.org>; Mon, 21 Sep 2020 10:42:29 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id d9so9919586pfd.3
        for <linux-usb@vger.kernel.org>; Mon, 21 Sep 2020 10:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=fxSkf5p9rEGxSN/uuJXsXnsmr077/quHi61NTRD3blA=;
        b=pJ8N2gncMxg3kBH2QrFtZeoUDkK/vI5tq+lrT4QxTFnTO6AucyS9lH/r6znqJN2VE7
         B0D8pWFRLGZ04YfSs6sZR2SUJF187Vy6CW2x2ItmpLOLP8eJ8EbG3oVNq7XUyN3dottz
         sDzdED8mGF+RrtaSYdWQR4JO7XRdhTxeBx4vZUeE8cGiMhabxP5anXEI1RX7Os+d+Wu8
         YB05zZaUH1fGPvzDo6wJAEvSWSDEFnZvvurDgWSRUPd1+kPsEX1uxOv09O/voeNBhPVM
         DRWAOsuJxSscKLJNHYXqoc5uzOh0xBWhx43cC913Iej7ZG51eiln6TtsC/qK5fS/Tvoj
         3l8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=fxSkf5p9rEGxSN/uuJXsXnsmr077/quHi61NTRD3blA=;
        b=cf3Sf9vfk2AXs8WMxZb0N7YPVnnS4W07Xk1YrKqvmnMflyTxC6HgUuprGrExur2c3O
         8aSNTScaB02PzsgVQ6A3s8hwEk2Rn8+fOEpIsLePtkD6CR7BH84oK3HZNk9+enGPk7FL
         F5trpSvDGtE2k70UW77AuT9ZWsnbpJoKaSfjcPZIHosU8XX0cWaLLVdiwvypT4nuFV54
         ugD7Jqvb+GGEQtGheJmdg0Q62mrFSIMnpJK46ZNdwdgUXPMBG0hhPdrA2pfNPQ4B2Z+l
         5b7FzO8uSqjgmJn85D3WPyi1cEuweGy8d5KuHkeaaNdkuqIS/NZs6YeewwYd6/W622KL
         8V3w==
X-Gm-Message-State: AOAM533mUq73k3b5lyhRaiMk3667foSsd33eZDYiB5VTDeS2/A6FEaWD
        7AENodXiwq114nQStWXS3wU=
X-Google-Smtp-Source: ABdhPJz1gqgq0XT5yRYSlqttdq+tT7buZzY3Kfpjv/3RCKbQg3d0BYcBQ+EmxjRxGqAl1OLofYkDjA==
X-Received: by 2002:a63:5a5d:: with SMTP id k29mr569368pgm.51.1600710149033;
        Mon, 21 Sep 2020 10:42:29 -0700 (PDT)
Received: from ajayg.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
        by smtp.gmail.com with ESMTPSA id r3sm12420459pfh.88.2020.09.21.10.42.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 10:42:28 -0700 (PDT)
From:   Ajay Gupta <ajaykuee@gmail.com>
X-Google-Original-From: Ajay Gupta <ajayg@nvidia.com>
To:     heikki.krogerus@linux.intel.com
Cc:     linux-usb@vger.kernel.org, Ajay Gupta <ajayg@nvidia.com>
Subject: [PATCH] usb: typec: ucsi_ccg: use dev_info for timeout error
Date:   Mon, 21 Sep 2020 10:42:16 -0700
Message-Id: <20200921174216.2862-1-ajayg@nvidia.com>
X-Mailer: git-send-email 2.17.1
X-NVConfidentiality: public
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Ajay Gupta <ajayg@nvidia.com>

Timeout error may be seen due to missing USB Type-C UCSI controller
on some NVIDIA GPU card. Currently we don't have a correct way to
identify these cards.

Tools like Plymouth (splashscreen) doesn't like dev_err so
changing timeout status log to dev_info.

Bug information:
https://bugzilla.kernel.org/show_bug.cgi?id=206653

Signed-off-by: Ajay Gupta <ajayg@nvidia.com>
---
 drivers/usb/typec/ucsi/ucsi_ccg.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
index bff96d64dddf..d69432df866e 100644
--- a/drivers/usb/typec/ucsi/ucsi_ccg.c
+++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
@@ -252,7 +252,7 @@ static int ccg_read(struct ucsi_ccg *uc, u16 rab, u8 *data, u32 len)
 		put_unaligned_le16(rab, buf);
 		status = i2c_transfer(client->adapter, msgs, ARRAY_SIZE(msgs));
 		if (status < 0) {
-			dev_err(uc->dev, "i2c_transfer failed %d\n", status);
+			dev_info(uc->dev, "i2c_transfer failed %d\n", status);
 			pm_runtime_put_sync(uc->dev);
 			return status;
 		}
@@ -289,7 +289,7 @@ static int ccg_write(struct ucsi_ccg *uc, u16 rab, const u8 *data, u32 len)
 	pm_runtime_get_sync(uc->dev);
 	status = i2c_transfer(client->adapter, msgs, ARRAY_SIZE(msgs));
 	if (status < 0) {
-		dev_err(uc->dev, "i2c_transfer failed %d\n", status);
+		dev_info(uc->dev, "i2c_transfer failed %d\n", status);
 		pm_runtime_put_sync(uc->dev);
 		kfree(buf);
 		return status;
@@ -1345,7 +1345,7 @@ static int ucsi_ccg_probe(struct i2c_client *client,
 	/* reset ccg device and initialize ucsi */
 	status = ucsi_ccg_init(uc);
 	if (status < 0) {
-		dev_err(uc->dev, "ucsi_ccg_init failed - %d\n", status);
+		dev_info(uc->dev, "ucsi_ccg_init failed - %d\n", status);
 		return status;
 	}
 
-- 
2.17.1

