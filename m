Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B7D9463CE0
	for <lists+linux-usb@lfdr.de>; Tue, 30 Nov 2021 18:33:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244032AbhK3RhR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 30 Nov 2021 12:37:17 -0500
Received: from mta-p5.oit.umn.edu ([134.84.196.205]:48378 "EHLO
        mta-p5.oit.umn.edu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238828AbhK3RhQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 30 Nov 2021 12:37:16 -0500
X-Greylist: delayed 410 seconds by postgrey-1.27 at vger.kernel.org; Tue, 30 Nov 2021 12:37:16 EST
Received: from localhost (unknown [127.0.0.1])
        by mta-p5.oit.umn.edu (Postfix) with ESMTP id 4J3Tfz04yDz9vHdR
        for <linux-usb@vger.kernel.org>; Tue, 30 Nov 2021 17:27:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p5.oit.umn.edu ([127.0.0.1])
        by localhost (mta-p5.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id v9IvwTGSA9PI for <linux-usb@vger.kernel.org>;
        Tue, 30 Nov 2021 11:27:06 -0600 (CST)
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mta-p5.oit.umn.edu (Postfix) with ESMTPS id 4J3Tfy57tPz9vHdW
        for <linux-usb@vger.kernel.org>; Tue, 30 Nov 2021 11:27:06 -0600 (CST)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p5.oit.umn.edu 4J3Tfy57tPz9vHdW
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p5.oit.umn.edu 4J3Tfy57tPz9vHdW
Received: by mail-pg1-f200.google.com with SMTP id t18-20020a632252000000b003252b088f26so7094797pgm.7
        for <linux-usb@vger.kernel.org>; Tue, 30 Nov 2021 09:27:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umn.edu; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hmZlWhdTEfRbo/HPHN3O3iU3WvUmoKteyvxhoVcMwhI=;
        b=l9Z8LrYCdLsNlvjwqYQjlKZcV0gZmE9nQLVdyEc+UXCW/rjT+bY3MPvFICqUWhKG2J
         HB/5akdFxkhRZT9n/4VtTlqnCtLJjLnMueSI7hOB6oBeBwl0mcgWn3Mhrn1eoPaIYKcz
         M3GCJqtdbV114w72gOkKzigv8jxd2Mb26oZfelTQPuJsSzsRXZ1GWT5IOuxpcHO6efsd
         10OAQvIWFQ5VqqocLRCs5W8y24hz7lAFZTRsUnooCSjxsoZXfpt80zOtk8m9Jc5MO7UC
         79Eoiar13GvB5Y3yGm0kQbBgUrdaWKdjHe0U2ThZKuEcDRkeSbEWQdRfTbojnWVbVKMa
         4GKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hmZlWhdTEfRbo/HPHN3O3iU3WvUmoKteyvxhoVcMwhI=;
        b=OyWLWK/gfWrak8+3/jIEKKyXZWqOo9V7rPUVl/v//rJzkKPHs2IIBg8nUF2rrxbFZj
         /+CQXHllR1SSJ5MMCIjqoBFeEkuZj4kcJJNSmfeNingf4dar3g1dSc4a+OO6YJ0i4DTC
         +P5kxxEgGcUhkKV4q5QjBeDC+vOJk5Bjmyz+8lRjqMq1k5wbfxKP75EAiQm5e148MmRG
         obQoyebIuw0XuUdtz2176h2yC8GduRQI2Fr2HmI/5TaONFPcVC3VUM5vyanmV3VskeCz
         HtdahrDrKGpYY/5Gxkt9yTDtL3Fe5Yx0ijNFBInIK+Ja8uSaUYXSlA7Id/QPAK3HYhV1
         noTA==
X-Gm-Message-State: AOAM532Y+PxPEMnqtT/gGP/I81+iKISNe27+1WnqlHdFjE6qBCl/fqnG
        hbS8UoZB78ohrdGhdKOzQROVqV/QijrykVzOHDns3W2u64q69X2e1L9zEZEPmEKBWP3gqgvb+/w
        QmqmU5P08xRmBgb4t3HsSsafH
X-Received: by 2002:a17:90b:3b8d:: with SMTP id pc13mr380238pjb.112.1638293225404;
        Tue, 30 Nov 2021 09:27:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxN5YvwpW8qsLRjcOOnCYPj8Fo14Exy/1RZATG5fGZitkEUgyvHUYOUOkScWBnIuvQRQzXsjQ==
X-Received: by 2002:a17:90b:3b8d:: with SMTP id pc13mr380210pjb.112.1638293225167;
        Tue, 30 Nov 2021 09:27:05 -0800 (PST)
Received: from zqy787-GE5S.lan ([36.7.42.137])
        by smtp.gmail.com with ESMTPSA id gv23sm3070555pjb.17.2021.11.30.09.27.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Nov 2021 09:27:04 -0800 (PST)
From:   Zhou Qingyang <zhou1615@umn.edu>
To:     zhou1615@umn.edu
Cc:     kjlu@umn.edu, Pawel Laszczak <pawell@cadence.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Peter Chen <peter.chen@nxp.com>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] usb: cdnsp: Fix a NULL pointer dereference in cdnsp_endpoint_init()
Date:   Wed,  1 Dec 2021 01:27:00 +0800
Message-Id: <20211130172700.206650-1-zhou1615@umn.edu>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

In cdnsp_endpoint_init(), cdnsp_ring_alloc() is assigned to pep->ring
and there is a dereference of it in cdnsp_endpoint_init(), which could
lead to a NULL pointer dereference on failure of cdnsp_ring_alloc().

Fix this bug by adding a check of pep->ring.

This bug was found by a static analyzer. The analysis employs
differential checking to identify inconsistent security operations
(e.g., checks or kfrees) between two code paths and confirms that the
inconsistent operations are not recovered in the current function or
the callers, so they constitute bugs.

Note that, as a bug found by static analysis, it can be a false
positive or hard to trigger. Multiple researchers have cross-reviewed
the bug.

Builds with CONFIG_USB_CDNSP_GADGET=y show no new warnings,
and our static analyzer no longer warns about this code.

Fixes: 3d82904559f4 ("usb: cdnsp: cdns3 Add main part of Cadence USBSSP DRD Driver")
Signed-off-by: Zhou Qingyang <zhou1615@umn.edu>
---
 drivers/usb/cdns3/cdnsp-mem.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/cdns3/cdnsp-mem.c b/drivers/usb/cdns3/cdnsp-mem.c
index ad9aee3f1e39..97866bfb2da9 100644
--- a/drivers/usb/cdns3/cdnsp-mem.c
+++ b/drivers/usb/cdns3/cdnsp-mem.c
@@ -987,6 +987,9 @@ int cdnsp_endpoint_init(struct cdnsp_device *pdev,
 
 	/* Set up the endpoint ring. */
 	pep->ring = cdnsp_ring_alloc(pdev, 2, ring_type, max_packet, mem_flags);
+	if (!pep->ring)
+		return -ENOMEM;
+
 	pep->skip = false;
 
 	/* Fill the endpoint context */
-- 
2.25.1

