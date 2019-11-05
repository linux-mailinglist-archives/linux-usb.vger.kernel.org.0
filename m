Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CF1ABEF76E
	for <lists+linux-usb@lfdr.de>; Tue,  5 Nov 2019 09:42:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730589AbfKEImS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 5 Nov 2019 03:42:18 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:37595 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725806AbfKEImS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 5 Nov 2019 03:42:18 -0500
Received: by mail-lf1-f68.google.com with SMTP id b20so14447475lfp.4
        for <linux-usb@vger.kernel.org>; Tue, 05 Nov 2019 00:42:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tknfyCUeU7j5xp3rtcyYp9kRvyPf5+IPfN/u9AabkZo=;
        b=qqF374VCS4D1Y/31nnLk3BVYlcUkjs0fPh79hZo9e9myXtRO8O/CgmovNXW4oEoCNC
         0OFGLXd5F1XjRL/Mfq9IYZDGdGON/mCodIk4WRg4HfcA26naP1g1lnM+Llo90Fo5QBCK
         JCEC5IIRiRMCofNd78bXOAwboK7yoNApwkS5RpMNgJcy5DcVeywHg1Zr5RTxC8Lj5XNJ
         qCO2Xki2itkUrzOSxoZnqSbJ3ZHCqiVN2PP0OHafZ75BPILnB+T18SxjQedrDZQCLHtj
         ejmPwX2Gnarvzody0fZD5REK+DJzgAE0pDJwTyF+jGcGCfAuQK/Ito3Dzv6GblM6gQbG
         HKlA==
X-Gm-Message-State: APjAAAWYaJDGe/2oG2vo8E6RmpBMcm6SkFUIQO/8eYm1zMDDH7tz+JwY
        +qKOzZKp60mRcLL+qtVW/kE=
X-Google-Smtp-Source: APXvYqzDfuYpWclhM02n8v/BgK/e1l6Tdyl4yGmktuzWSbocDiI4S4imIU8MTWh1rtBz0K0u4tkDKw==
X-Received: by 2002:a19:8b54:: with SMTP id n81mr12710499lfd.114.1572943335639;
        Tue, 05 Nov 2019 00:42:15 -0800 (PST)
Received: from xi.terra (c-51f1e055.07-184-6d6c6d4.bbcust.telenor.se. [85.224.241.81])
        by smtp.gmail.com with ESMTPSA id r9sm797985ljm.7.2019.11.05.00.42.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 00:42:13 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.92.3)
        (envelope-from <johan@xi.terra>)
        id 1iRuPl-0004Ge-Cn; Tue, 05 Nov 2019 09:42:13 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Juergen Stuber <starblue@users.sourceforge.net>,
        legousb-devel@lists.sourceforge.net, linux-usb@vger.kernel.org,
        Johan Hovold <johan@kernel.org>
Subject: [PATCH 02/14] USB: legousbtower: drop redundant NULL check
Date:   Tue,  5 Nov 2019 09:41:40 +0100
Message-Id: <20191105084152.16322-3-johan@kernel.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191105084152.16322-1-johan@kernel.org>
References: <20191105084152.16322-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Drop redundant NULL check from tower_abort_transfers(), which is never
called with a NULL argument.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/misc/legousbtower.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/usb/misc/legousbtower.c b/drivers/usb/misc/legousbtower.c
index 1be84dc13067..a3ae843e0a3a 100644
--- a/drivers/usb/misc/legousbtower.c
+++ b/drivers/usb/misc/legousbtower.c
@@ -457,9 +457,6 @@ static int tower_release (struct inode *inode, struct file *file)
  */
 static void tower_abort_transfers (struct lego_usb_tower *dev)
 {
-	if (dev == NULL)
-		return;
-
 	/* shutdown transfer */
 	if (dev->interrupt_in_running) {
 		dev->interrupt_in_running = 0;
-- 
2.23.0

