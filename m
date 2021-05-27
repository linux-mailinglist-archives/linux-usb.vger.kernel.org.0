Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D95843929CB
	for <lists+linux-usb@lfdr.de>; Thu, 27 May 2021 10:45:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235605AbhE0Iqf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 27 May 2021 04:46:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235594AbhE0Iqc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 27 May 2021 04:46:32 -0400
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com [IPv6:2607:f8b0:4864:20::649])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80B77C061760
        for <linux-usb@vger.kernel.org>; Thu, 27 May 2021 01:44:58 -0700 (PDT)
Received: by mail-pl1-x649.google.com with SMTP id t2-20020a170902b202b02900ec9b8c34b6so1964574plr.15
        for <linux-usb@vger.kernel.org>; Thu, 27 May 2021 01:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=NqV+UHFoHvqcq/R8sYfWHsT1BHUr10auoTbMwxVa1MY=;
        b=bFU7d2YlIPh4DrUCoLhoyuXTbXmpERmsK2e9/0I3kHPO/okifmGXJZ6amu3Y2scpCY
         0dFja/iCvMzIFt7FG7fQyRqdwD44bBHYu3DYic/TOu4PE+NHoJmMt9kHHFSZ0fr5rgRd
         EXCr+xQ6cknD/Rzl9DDst6IXrG0Eg6PX+sVgg4ma2ygqvOIAlekI3kgFsLaNZhAhGd1D
         dEQO/vz1hiMmvRVPtIVrTg37qgHqckiwkH9CWD/iZwtkukyIEd7tTUwyWnIdMrevNYPO
         OgvrOKliaLjrwVTAz/khH/yjnaDxnSDcpdrE4Wwjf31Bc1XS1n/HgqljxStzmGMKvRr2
         /hFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=NqV+UHFoHvqcq/R8sYfWHsT1BHUr10auoTbMwxVa1MY=;
        b=kPpRdltTC1+gTzVFlIkYsgq9cSYJiqbEjY+fZHJ/Va4qEvZv+h5h/tY9HTXM0IHHRB
         9Ei3meU+pMT1E84e4SnaRHIeppLlwzmWLJ0wtJH/5lc0MFUg+pIZQ33wiF687Hh7v7M4
         gXQdiBYZWbIdjx0r5fwf3uktowbYZ1Pwn+RnqvfRP/0YOe9hZy4g1NKaqRerqaScuyRv
         +HdRKsSU9/7wkPYnbVPBprJI8EUoK5kolcyzeksyQpgyYf41+e5m9mmWNpO3j6oDZD4T
         ikI0YjmcnWHEfScaaUBT0aHIO1Boi16XDI2lzTQtITqYkOzC7q0Yy9rDEaMqBgbrxGbP
         1s9Q==
X-Gm-Message-State: AOAM530AsX6bRFEvGmeR0n6d2G0zN1C1fHSGWj7MSbCDYfGIgWTY0UE+
        EujIqqfapzGUtBnFw/ToTkFz/RmOZWyd
X-Google-Smtp-Source: ABdhPJwxZJ6gmdrZ26fdJ3KzSUJDVghx72sFTMFQY+TWdVvQW5dNHefeQdnQqkFqyXVZ7PhBsDpr/owQtgZ2
X-Received: from kyletso.ntc.corp.google.com ([2401:fa00:fc:202:c563:7257:f641:cbcd])
 (user=kyletso job=sendgmr) by 2002:a62:1d52:0:b029:2dd:ee:1439 with SMTP id
 d79-20020a621d520000b02902dd00ee1439mr2646720pfd.57.1622105097999; Thu, 27
 May 2021 01:44:57 -0700 (PDT)
Date:   Thu, 27 May 2021 16:44:19 +0800
In-Reply-To: <20210527084419.4164369-1-kyletso@google.com>
Message-Id: <20210527084419.4164369-4-kyletso@google.com>
Mime-Version: 1.0
References: <20210527084419.4164369-1-kyletso@google.com>
X-Mailer: git-send-email 2.31.1.818.g46aad6cb9e-goog
Subject: [PATCH 3/3] usb: typec: tcpm: Introduce snk_vdo_v1 for SVDM version 1.0
From:   Kyle Tso <kyletso@google.com>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, robh+dt@kernel.org
Cc:     badhri@google.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Kyle Tso <kyletso@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The ID Header VDO and Product VDOs defined in USB PD Spec rev 2.0 and
rev 3.1 are quite different. Add an additional array snk_vdo_v1 and
send it as the response to the port partner if it only supports SVDM
version 1.0.

Signed-off-by: Kyle Tso <kyletso@google.com>
---
 drivers/usb/typec/tcpm/tcpm.c | 40 +++++++++++++++++++++++++----------
 1 file changed, 29 insertions(+), 11 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index a1bf0dc5babf..07d2bed0a63b 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -401,6 +401,8 @@ struct tcpm_port {
 	unsigned int nr_src_pdo;
 	u32 snk_pdo[PDO_MAX_OBJECTS];
 	unsigned int nr_snk_pdo;
+	u32 snk_vdo_v1[VDO_MAX_OBJECTS];
+	unsigned int nr_snk_vdo_v1;
 	u32 snk_vdo[VDO_MAX_OBJECTS];
 	unsigned int nr_snk_vdo;
 
@@ -1561,18 +1563,18 @@ static int tcpm_pd_svdm(struct tcpm_port *port, struct typec_altmode *adev,
 			 */
 			if ((port->data_role == TYPEC_DEVICE || svdm_version >= SVDM_VER_2_0) &&
 			    port->nr_snk_vdo) {
-				/*
-				 * Product Type DFP and Connector Type are not defined in SVDM
-				 * version 1.0 and shall be set to zero.
-				 */
-				if (svdm_version < SVDM_VER_2_0)
-					response[1] = port->snk_vdo[0] & ~IDH_DFP_MASK
-						      & ~IDH_CONN_MASK;
-				else
+				if (svdm_version < SVDM_VER_2_0) {
+					response[1] = port->snk_vdo_v1[0];
+					for (i = 1; i < port->nr_snk_vdo_v1; i++)
+						response[i + 1] = port->snk_vdo_v1[i];
+					rlen = port->nr_snk_vdo_v1 + 1;
+
+				} else {
 					response[1] = port->snk_vdo[0];
-				for (i = 1; i <  port->nr_snk_vdo; i++)
-					response[i + 1] = port->snk_vdo[i];
-				rlen = port->nr_snk_vdo + 1;
+					for (i = 1; i < port->nr_snk_vdo; i++)
+						response[i + 1] = port->snk_vdo[i];
+					rlen = port->nr_snk_vdo + 1;
+				}
 			}
 			break;
 		case CMD_DISCOVER_SVID:
@@ -5953,6 +5955,22 @@ static int tcpm_fw_get_caps(struct tcpm_port *port,
 			return ret;
 	}
 
+	/* If sink-vdos is found, sink-vdos-v1 is expected for backward compatibility. */
+	if (port->nr_snk_vdo) {
+		ret = fwnode_property_count_u32(fwnode, "sink-vdos-v1");
+		if (ret < 0)
+			return ret;
+		else if (ret == 0)
+			return -ENODATA;
+
+		port->nr_snk_vdo_v1 = min(ret, VDO_MAX_OBJECTS);
+		ret = fwnode_property_read_u32_array(fwnode, "sink-vdos-v1",
+						     port->snk_vdo_v1,
+						     port->nr_snk_vdo_v1);
+		if (ret < 0)
+			return ret;
+	}
+
 	return 0;
 }
 
-- 
2.31.1.818.g46aad6cb9e-goog

