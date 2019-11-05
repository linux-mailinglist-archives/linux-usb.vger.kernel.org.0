Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C52B5EFB7E
	for <lists+linux-usb@lfdr.de>; Tue,  5 Nov 2019 11:37:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388474AbfKEKgq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 5 Nov 2019 05:36:46 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:36834 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388645AbfKEKgq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 5 Nov 2019 05:36:46 -0500
Received: by mail-lj1-f195.google.com with SMTP id k15so9089674lja.3
        for <linux-usb@vger.kernel.org>; Tue, 05 Nov 2019 02:36:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1L1tHO+MLRZRW1I3nxunkX+/fAuMjMC2y7WnHBBiiN0=;
        b=tzHdiypfpB+AT52fFUUs78FD2rxvccjuAXeiNHcTKMuZT1H6a8/PrWcshSUBBFUJ2p
         5l/mLJdKfJpXe2o+WETy3RD6vETFbIXSHz4Bs7PVLxOx4snPERHQMGDcVn0Nj7zSPpId
         UumfcZ9YEhmb5moNSu/fxKuxM7ql3wO4BC44IMZIL25i54ngmdmrIILDALPbzy0MB0j/
         hKeHTWL/DUZtbIPj/9YBbek9ig65GHTPuDpcS3zOhTyV7gf7MMJnYNGsCGWDr9T+2EWL
         n967dx/ES2LHZOVLfwbcgw83T2af2q9yJaGkDJOK72iSDwz7fLq8f3myvMEtd0Vlce+V
         YH+A==
X-Gm-Message-State: APjAAAUwU9vsUu4p2GiY+uu0X+XPKL9ncvtMNuSw2Gsu4r8bOZvlUZl0
        XAJyQJ4ONd7gu9Cclw1QsNs=
X-Google-Smtp-Source: APXvYqwCuNgtoAwjSfwZHefVtnRIdZWf2/P9COpAZISl1xnpaqJYyTXzBC+r508mo7lYnDIoId1o9g==
X-Received: by 2002:a2e:c42:: with SMTP id o2mr18728178ljd.166.1572950204916;
        Tue, 05 Nov 2019 02:36:44 -0800 (PST)
Received: from xi.terra (c-51f1e055.07-184-6d6c6d4.bbcust.telenor.se. [85.224.241.81])
        by smtp.gmail.com with ESMTPSA id q124sm9094329ljb.28.2019.11.05.02.36.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 02:36:43 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.92.3)
        (envelope-from <johan@xi.terra>)
        id 1iRwCZ-0001IP-6x; Tue, 05 Nov 2019 11:36:43 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, Johan Hovold <johan@kernel.org>
Subject: [PATCH 2/3] USB: idmouse: drop redundant open-count check from release
Date:   Tue,  5 Nov 2019 11:36:37 +0100
Message-Id: <20191105103638.4929-3-johan@kernel.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191105103638.4929-1-johan@kernel.org>
References: <20191105103638.4929-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The open count will always be exactly one when release is called, so
drop the redundant sanity check.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/misc/idmouse.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/usb/misc/idmouse.c b/drivers/usb/misc/idmouse.c
index 0386bac224c4..9b9d5df829d5 100644
--- a/drivers/usb/misc/idmouse.c
+++ b/drivers/usb/misc/idmouse.c
@@ -278,12 +278,6 @@ static int idmouse_release(struct inode *inode, struct file *file)
 	/* lock our device */
 	mutex_lock(&dev->lock);
 
-	/* are we really open? */
-	if (dev->open <= 0) {
-		mutex_unlock(&dev->lock);
-		return -ENODEV;
-	}
-
 	--dev->open;
 
 	if (!dev->present) {
-- 
2.23.0

