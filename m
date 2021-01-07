Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 379DC2EC932
	for <lists+linux-usb@lfdr.de>; Thu,  7 Jan 2021 04:52:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726792AbhAGDt7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 6 Jan 2021 22:49:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726369AbhAGDt6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 6 Jan 2021 22:49:58 -0500
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2FCAC0612F1
        for <linux-usb@vger.kernel.org>; Wed,  6 Jan 2021 19:49:18 -0800 (PST)
Received: by mail-pj1-x1030.google.com with SMTP id p12so720245pju.5
        for <linux-usb@vger.kernel.org>; Wed, 06 Jan 2021 19:49:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gjtH8pU4Hx6dz6qEQmSdV5j/sdC7SSl2exUNcWS/DG0=;
        b=QT4iduAeuFqO3mb473LmsR6DHh3k38o/0rWCaXAss6rID1hmtq9lMxIJI+Ie/n/CSn
         Or8MVvzqb95M4h000FL1KHO2PQVsWtmYqAENXOfwaNE9Ask9m/2bU9wikCQUPYUH2IiU
         iTBOvNAKpe6ZOR9dFU0f6aC4C8LoAHoHVvKxM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gjtH8pU4Hx6dz6qEQmSdV5j/sdC7SSl2exUNcWS/DG0=;
        b=r3UsuHb4XMtCnRQtGN9USRsfZESFMaCLKZsPWpfdyc1UQyodDYzj+eU7REyqLYC+fe
         8SG4vQmocSTvCJqJT3371DeDqMbxoA+hvlBGdXo5KJXowQuPNkTeO+2uQNIttQ07dU3S
         b6ksL5GX+RO9rbI2azqO3t09BikLao8dX3O8vw7ZjNg0p6cSnER4WNK7mj3BnLgfH3Rv
         6xxMPt5QB6HMJ/p3i4MGume9+zwXRWz0jh8yBcQM+FjSmtesiTg1tgnDuNaJ8zyJ1Jxm
         QnptK8V8V+gkGnVovWa1UOa5us83MoFteFFlqj3va3D1APf5umTVOeNOxzCGTfZ/qEGB
         TfGA==
X-Gm-Message-State: AOAM533eUbVzdKZ8ZwgsgbK0zkr7JaGiANO5VdEJxJ57eWzqMqVraG8D
        V0GI41tQesZ53T2/qP0lov4OrwCBLmErLg==
X-Google-Smtp-Source: ABdhPJzGmKEOHm7WF98PNNC/ePfdcYANX9K68lzKbG7MVhZxYuMLC48JfSiBx7X7N1J1VWkMpjSEYA==
X-Received: by 2002:a17:90b:4785:: with SMTP id hz5mr7541287pjb.157.1609991358066;
        Wed, 06 Jan 2021 19:49:18 -0800 (PST)
Received: from pmalani2.mtv.corp.google.com ([2620:15c:202:201:a28c:fdff:fef0:49dd])
        by smtp.gmail.com with ESMTPSA id f9sm3940944pfa.41.2021.01.06.19.49.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jan 2021 19:49:17 -0800 (PST)
From:   Prashant Malani <pmalani@chromium.org>
To:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org
Cc:     Prashant Malani <pmalani@chromium.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Benson Leung <bleung@chromium.org>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] usb: typec: Send uevent for num_altmodes update
Date:   Wed,  6 Jan 2021 19:49:04 -0800
Message-Id: <20210107034904.4112029-1-pmalani@chromium.org>
X-Mailer: git-send-email 2.29.2.729.g45daf8777d-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Generate a change uevent when the "number_of_alternate_modes" sysfs file
for partners and plugs is updated by a port driver.

Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Benson Leung <bleung@chromium.org>
Signed-off-by: Prashant Malani <pmalani@chromium.org>
---
 drivers/usb/typec/class.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index ebfd3113a9a8..8f77669f9cf4 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -766,6 +766,7 @@ int typec_partner_set_num_altmodes(struct typec_partner *partner, int num_altmod
 		return ret;
 
 	sysfs_notify(&partner->dev.kobj, NULL, "number_of_alternate_modes");
+	kobject_uevent(&partner->dev.kobj, KOBJ_CHANGE);
 
 	return 0;
 }
@@ -923,6 +924,7 @@ int typec_plug_set_num_altmodes(struct typec_plug *plug, int num_altmodes)
 		return ret;
 
 	sysfs_notify(&plug->dev.kobj, NULL, "number_of_alternate_modes");
+	kobject_uevent(&plug->dev.kobj, KOBJ_CHANGE);
 
 	return 0;
 }
-- 
2.29.2.729.g45daf8777d-goog

