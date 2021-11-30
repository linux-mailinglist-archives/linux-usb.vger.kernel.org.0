Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 701E6463CF8
	for <lists+linux-usb@lfdr.de>; Tue, 30 Nov 2021 18:38:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244922AbhK3RmC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 30 Nov 2021 12:42:02 -0500
Received: from mta-p7.oit.umn.edu ([134.84.196.207]:60416 "EHLO
        mta-p7.oit.umn.edu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244935AbhK3RmA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 30 Nov 2021 12:42:00 -0500
Received: from localhost (unknown [127.0.0.1])
        by mta-p7.oit.umn.edu (Postfix) with ESMTP id 4J3TkH0sxKz9vYdf
        for <linux-usb@vger.kernel.org>; Tue, 30 Nov 2021 17:29:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p7.oit.umn.edu ([127.0.0.1])
        by localhost (mta-p7.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 1mMwqwE_tU0r for <linux-usb@vger.kernel.org>;
        Tue, 30 Nov 2021 11:29:59 -0600 (CST)
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mta-p7.oit.umn.edu (Postfix) with ESMTPS id 4J3TkG5dy9z9vYdY
        for <linux-usb@vger.kernel.org>; Tue, 30 Nov 2021 11:29:58 -0600 (CST)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p7.oit.umn.edu 4J3TkG5dy9z9vYdY
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p7.oit.umn.edu 4J3TkG5dy9z9vYdY
Received: by mail-pg1-f199.google.com with SMTP id j3-20020a634a43000000b00325af3ab5f0so1022879pgl.11
        for <linux-usb@vger.kernel.org>; Tue, 30 Nov 2021 09:29:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umn.edu; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9pznBESKnWofLpakL5pmxJ7peOOaf1Zo5EKUeNDZGEM=;
        b=kzhzFTyE+GWmogVbkYEGEkbnwsaA7ObafZWTOIIl6lQKwkKhy5i9SRZF0d04IE+f4U
         qVYUKPGvMWLhppSw9Zl47sNmMEJM238Pcq980a+zBd/3vcDX1MG2gHb5+vsX71rK9pXA
         77ibpTsGvu9lJKbqTDKE3d5FnUvuximjXq2nlABC773N8GaVOto2yKbm9ukStLk3hb7w
         mBoJuFb/mTIb1cMx3YD2wq3CASBlaIWVIQ4kwkj1XTaL8O3NxKrs2a3+SOmsumyg2DUw
         plBZgJvrQ1lQWFUuT3g3TOjb1WaeWIJWH6ccS6FOo9le5WfLjXVriSwd24Uk2sCKi1yl
         y85g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9pznBESKnWofLpakL5pmxJ7peOOaf1Zo5EKUeNDZGEM=;
        b=flOPz4+eF4YWkJ3fX+5gYtjRapBy8hVlfUG6Y0AXU+94bJJNTsAQCpiVAvEptL/29R
         qrgLv/G1JvuI5mBOz9cUMesLMlipct5juYFe11GTSwFpaSfDcuUZ25eW+/TK6UOyGnFj
         4sjVEM7XO8WciXKTQgtERoMk8OIdJhxKp+q6yup0zcoBDGqTWUwWqp7GMTklOMVcmpGu
         H0v/sF7g9y15o0syq8t/ZfmkTpyLFeV+BhW+lEnmyq7YJR1QlXpd6nHBxba+1Y6BbIEF
         J9ppUdxnkOw1DESAFNPiZ4KM/ryNbWRlPKdtDYYtWP6GPsfQ0+m+LrZiqIppCSxzbHK7
         m98Q==
X-Gm-Message-State: AOAM533mb63J9Byal5h9JKnHvJum6Fpn9/CRNrFX5kDBwnft8uBiDgha
        Yawxk0BxXVHQRqv/Fjfy7C7VnZ6rhTO0G5Av3CZNt2HVhLruJHxnQOjY3w1ezVlaUacl2nnkl/p
        3hoWoxzoyzOYLDooMNAa5Edbb
X-Received: by 2002:a17:90a:ce02:: with SMTP id f2mr337860pju.77.1638293397909;
        Tue, 30 Nov 2021 09:29:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxf2pmqIXch/OBlEuEuZunx2vNxCa+wfgpKWnjANdlDUNXev1TH7xbVfl6DPtnhF5K7lGPDXQ==
X-Received: by 2002:a17:90a:ce02:: with SMTP id f2mr337840pju.77.1638293397688;
        Tue, 30 Nov 2021 09:29:57 -0800 (PST)
Received: from zqy787-GE5S.lan ([36.7.42.137])
        by smtp.gmail.com with ESMTPSA id e6sm15453845pgr.24.2021.11.30.09.29.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Nov 2021 09:29:57 -0800 (PST)
From:   Zhou Qingyang <zhou1615@umn.edu>
To:     zhou1615@umn.edu
Cc:     kjlu@umn.edu, Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Johan Hovold <johan@kernel.org>,
        Nadezda Lutovinova <lutovinova@ispras.ru>,
        Yu Xu <yuxu@marvell.com>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] usb: gadget: mv_u3d: Fix a NULL pointer dereference in mv_u3d_req_to_trb()
Date:   Wed,  1 Dec 2021 01:29:17 +0800
Message-Id: <20211130172919.207823-1-zhou1615@umn.edu>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

In mv_u3d_req_to_trb(), mv_u3d_build_trb_one() is assigned to trb and
there is a dereference of it in mv_u3d_req_to_trb(), which could lead
to a NULL pointer dereference on failure of mv_u3d_build_trb_one().

Fix this bug by adding a check of trb.

This bug was found by a static analyzer. The analysis employs
differential checking to identify inconsistent security operations
(e.g., checks or kfrees) between two code paths and confirms that the
inconsistent operations are not recovered in the current function or
the callers, so they constitute bugs.

Note that, as a bug found by static analysis, it can be a false
positive or hard to trigger. Multiple researchers have cross-reviewed
the bug.

Builds with CONFIG_USB_MV_U3D=m show no new warnings,
and our static analyzer no longer warns about this code.

Fixes: 3d4eb9dfa3e8 ("usb: gadget: mv: Add USB 3.0 device driver for Marvell PXA2128 chip.")
Signed-off-by: Zhou Qingyang <zhou1615@umn.edu>
---
 drivers/usb/gadget/udc/mv_u3d_core.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/usb/gadget/udc/mv_u3d_core.c b/drivers/usb/gadget/udc/mv_u3d_core.c
index a1057ddfbda3..e90ef4046a9d 100644
--- a/drivers/usb/gadget/udc/mv_u3d_core.c
+++ b/drivers/usb/gadget/udc/mv_u3d_core.c
@@ -417,6 +417,12 @@ static int mv_u3d_req_to_trb(struct mv_u3d_req *req)
 	 */
 	if (length <= (unsigned)MV_U3D_EP_MAX_LENGTH_TRANSFER) {
 		trb = mv_u3d_build_trb_one(req, &count, &dma);
+		if (!trb) {
+			dev_err(u3d->dev, "%s, mv_u3d_build_trb_one fail\n",
+				__func__);
+			return -ENOMEM;
+		}
+
 		list_add_tail(&trb->trb_list, &req->trb_list);
 		req->trb_head = trb;
 		req->trb_count = 1;
-- 
2.25.1

