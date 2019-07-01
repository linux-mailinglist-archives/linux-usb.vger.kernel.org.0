Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A1BA64ADFC
	for <lists+linux-usb@lfdr.de>; Wed, 19 Jun 2019 00:47:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730428AbfFRWoh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Jun 2019 18:44:37 -0400
Received: from mail-qt1-f196.google.com ([209.85.160.196]:34713 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730176AbfFRWoh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 18 Jun 2019 18:44:37 -0400
Received: by mail-qt1-f196.google.com with SMTP id m29so17584742qtu.1;
        Tue, 18 Jun 2019 15:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0BVmvPW35Mw0cJWlTd6mw6l7DnZz2vUZHG/J0CRIjHQ=;
        b=cvIcsaeiKUzbcfaGva95KMAj7ZKwxcQGcK8yFd1IeSzx9zkPlvW2uIUNN49WPKSzW3
         c+lmR0ZZdzWkolrovxzxDqhqkcLj9vH6s2OGrFX23fTDu5qvy71vMLtx0KrjxC6LK6tK
         i0cD4jLakIQSZJyncfZ+6Bv4QdAeACcmWSG+43ppW6Ej81ECdAKlJAMoXDbPw9IF3wQl
         ML3vn7dFQtQ+KxdX87FPiLBTOMi9l/ZjRyTXARAhpoESUlkMxZi5ofB8fZKrGPTECrww
         aJTo9FVEOLwqd7q1x0QTmViz8FkBtTMz99vK3Z7AJoMETrApf7VrngXcZY7wMWqjVCTh
         8sTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0BVmvPW35Mw0cJWlTd6mw6l7DnZz2vUZHG/J0CRIjHQ=;
        b=JafvOkyg28KQP5iUXyU/SbqkR3n2zdtcWqbwb/tzn7lYQrmLnprtcpxDY2nOKNMNEd
         jshsdUuNE3pXtHmoOIOzkHVVjtBxgw9zZK27sILwhYTiMsWUgZc1pMjwgNmKPsxMbsdy
         1ss9ZdwzK+TkG4Pt2U4AnyEU6gSFSRWiKeg0qnCUnlvS5sAkmO/R9Ihg/VI/1JgIg+jc
         GGDHfVlrRxaH3efjzspHuOM/MuKhScKi2vFNpKf+XBVsQAg7BlZZqSKqTMmtJ95ZLdxp
         yCoC/FqdPbqih8wWZuTUwZzWyUAVXq+iuA2KahtR8cx/8Kzaarf7aJTT/W2gpjppuUey
         5Bbw==
X-Gm-Message-State: APjAAAVstsSVjSay5Shogl6HT/YMO/d56hHYQXBGNVVM84b3ida8qjkJ
        gpKP+AyzjMKi9JMuCVlueX89iMWk+Wo=
X-Google-Smtp-Source: APXvYqxu9Nw3DYYcNdnkoGLTHOX7MQiBbtah5NxLUciuz6IWhR9c1X2+yhnwN4osEngqhZmQl2hB7w==
X-Received: by 2002:a0c:81e7:: with SMTP id 36mr30015897qve.5.1560897875848;
        Tue, 18 Jun 2019 15:44:35 -0700 (PDT)
Received: from localhost.localdomain ([186.212.50.252])
        by smtp.gmail.com with ESMTPSA id n5sm10254879qta.29.2019.06.18.15.44.32
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 18 Jun 2019 15:44:34 -0700 (PDT)
From:   Marcos Paulo de Souza <marcos.souza.org@gmail.com>
To:     linux-kernel@vger.kernel.org
Cc:     Marcos Paulo de Souza <marcos.souza.org@gmail.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org (open list:USB MASS STORAGE DRIVER),
        usb-storage@lists.one-eyed-alien.net (open list:USB MASS STORAGE DRIVER)
Subject: [PATCH v2] usb: storage: scsiglue: Do not skip VPD if try_vpd_pages is set
Date:   Tue, 18 Jun 2019 19:44:54 -0300
Message-Id: <20190618224454.16595-1-marcos.souza.org@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

If BLIST_TRY_VPD_PAGES is set for a device, even for an USB, it should
be honored, so only set skip_vpd_pages is try_vpd_pages is not set.

Signed-off-by: Marcos Paulo de Souza <marcos.souza.org@gmail.com>
Acked-by: Alan Stern <stern@rowland.harvard.edu>
---

 Changes from v1:
 changed the check of try_vpd_pages from:
 	sdev->try_vpd_pages == 0;
 to:
 	!sdev->try_vpd_pages;
 (as suggested by Alan Stern)

 drivers/usb/storage/scsiglue.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/storage/scsiglue.c b/drivers/usb/storage/scsiglue.c
index 59190d88fa9f..30790240aec6 100644
--- a/drivers/usb/storage/scsiglue.c
+++ b/drivers/usb/storage/scsiglue.c
@@ -195,8 +195,11 @@ static int slave_configure(struct scsi_device *sdev)
 		 */
 		sdev->skip_ms_page_8 = 1;
 
-		/* Some devices don't handle VPD pages correctly */
-		sdev->skip_vpd_pages = 1;
+		/*
+		 * Some devices don't handle VPD pages correctly, so skip vpd
+		 * pages if not forced by SCSI layer.
+		 */
+		sdev->skip_vpd_pages = !sdev->try_vpd_pages;
 
 		/* Do not attempt to use REPORT SUPPORTED OPERATION CODES */
 		sdev->no_report_opcodes = 1;
-- 
2.21.0

