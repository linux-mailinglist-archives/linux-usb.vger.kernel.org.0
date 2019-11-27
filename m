Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1272310B2E3
	for <lists+linux-usb@lfdr.de>; Wed, 27 Nov 2019 17:04:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727072AbfK0QEA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 27 Nov 2019 11:04:00 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:40876 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726514AbfK0QEA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 27 Nov 2019 11:04:00 -0500
Received: by mail-wr1-f65.google.com with SMTP id c14so2701386wrn.7
        for <linux-usb@vger.kernel.org>; Wed, 27 Nov 2019 08:03:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=qcg+l0qb+n0KjRo7OtRJ8Nez5ASXvTg3Ut/aJb0OVcI=;
        b=I6QyhuKSSBSZiJR91cZp16yxwbou8s9o1cyrS7kaTz9YgAH7AOzs2VECvWgAVWmhuk
         N1Qe4EzcWxZYU6ZCqsHXt5I739KP3SUEuNcFvZ+lsS4lKrvTlJq2hFxRXvMGaYlqz6Q7
         MuQJRGCx6XOI1xHSa4SNl3va8qfiyvzDxJF05VpXq8IwiPhxms2+WAWtVL3Br+DeTEl9
         nrsBfLWBhktTHGPVn4OMHgwFwNurlDYBjxb8U11iwJKF5S1NC/xnw+9Mp7vIY15zrF6J
         Vl5A5tCnVA+fRP0Az3MxWKqq4Cit88jTV8fNWjHu1iQ6/fqIICCnUYp0bvRKSeMVMiyc
         xitg==
X-Gm-Message-State: APjAAAXSs8eHJ4VUtZP6U7J1pgPH/PknCEmQ+Fctsrgw4ulDpQbjZB7p
        H0cYT6XaFRxfsmz7iXUK+Ql2g8+8//M=
X-Google-Smtp-Source: APXvYqx1lzWewaGi/ReK1S7fGqlWnpx71d7ZqwpdItPlM/48caRVjgR3mp7P3XSCCTbnsXzGneOofg==
X-Received: by 2002:a5d:4044:: with SMTP id w4mr7345880wrp.322.1574870638232;
        Wed, 27 Nov 2019 08:03:58 -0800 (PST)
Received: from ingrassia.epigenesys.com (host194-85-static.3-79-b.business.telecomitalia.it. [79.3.85.194])
        by smtp.gmail.com with ESMTPSA id r2sm7587316wma.44.2019.11.27.08.03.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2019 08:03:57 -0800 (PST)
Date:   Wed, 27 Nov 2019 17:03:55 +0100
From:   Emiliano Ingrassia <ingrassia@epigenesys.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [PATCH] usb: core: urb: fix URB structure initialization function
Message-ID: <20191127160355.GA27196@ingrassia.epigenesys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Explicitly initialize URB structure urb_list field in usb_init_urb().
This field can be potentially accessed uninitialized and its
initialization is coherent with the usage of list_del_init() in
usb_hcd_unlink_urb_from_ep() and usb_giveback_urb_bh() and its
explicit initialization in usb_hcd_submit_urb() error path.

Signed-off-by: Emiliano Ingrassia <ingrassia@epigenesys.com>
---
 drivers/usb/core/urb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/core/urb.c b/drivers/usb/core/urb.c
index 0eab79f82ce4..da923ec17612 100644
--- a/drivers/usb/core/urb.c
+++ b/drivers/usb/core/urb.c
@@ -45,6 +45,7 @@ void usb_init_urb(struct urb *urb)
 	if (urb) {
 		memset(urb, 0, sizeof(*urb));
 		kref_init(&urb->kref);
+		INIT_LIST_HEAD(&urb->urb_list);
 		INIT_LIST_HEAD(&urb->anchor_list);
 	}
 }
--
2.24.0

