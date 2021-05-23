Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 326FD38D82B
	for <lists+linux-usb@lfdr.de>; Sun, 23 May 2021 03:59:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231557AbhEWCAt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 22 May 2021 22:00:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231535AbhEWCAs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 22 May 2021 22:00:48 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB643C061574
        for <linux-usb@vger.kernel.org>; Sat, 22 May 2021 18:59:21 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id d4-20020a25b5c40000b02904f8e3c8c6c9so32570444ybg.14
        for <linux-usb@vger.kernel.org>; Sat, 22 May 2021 18:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=gkWNx3S/znXnFPP4/eFUa9xGYND+Yzn0YLWMUN4rin4=;
        b=XmNR1oNwpLPgAHzOAAo02cz7u5cijaSx9dTvju3lXizzfMkm4CexfVNlv/aGe+fpuP
         phxKdbSpzBpJQkpMVopqlmoIAOAdVRDYXzy2tDha6uEXwRA2c8numOEGMc1fqY9j40Y+
         kihq4TdNoyKFdSFBCj13UWSs2Vdj5XvOU8I2PyyOvNT1Zl1ueeKJMhDhvNo2k+XwGuP3
         FzgEooWZ5ptq4yG8Kdr389P6UPmFusQKU2uStINb19uHgQRQ8X7mhmaRDO6vjRndwjOr
         qoFuN//U9N+NCbgrGUKLQmaoBoH2WjsB3W8OWHIodvHwnxcj8NaUejHzEUuoxRaWKNsG
         OvFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=gkWNx3S/znXnFPP4/eFUa9xGYND+Yzn0YLWMUN4rin4=;
        b=QgoCwcYNe23ISUXYf86FxuMLSpS2WS+eYf4dNk0OsyrsjmmybGBpO4mXKl2wEZKKEU
         HLH2LIGa3T0RfdBms7FxRM5KkJLL6Mb+z/iguHa3R+O4Tb1X/NE3nhHtawUBRhMw10YT
         InlhID5+OuQYnoT12PCAGkxnar3FyHloeoVjA+yILu2YpPT9QC+52hnYjewBy4f/DGfA
         tjhqfapU0H14Vdhj3Nen+URTyM+wqwMj6UEr3z/WjWH7E9PUPFRPcdlKJvIRrAH0HwDm
         eSI2nT+XX64wDgoGV/pJqZzTN+Soqg5XrzKkVhvPIci2MvdkJa5L+b4Z6S2qnLmQcaz9
         vfJA==
X-Gm-Message-State: AOAM533sSagojbPucxlic44IlfWZ8KDL39yVHefgyFkboRFNHUqmFNQj
        iICLV4YanI1pskIib6KlRN0z1/ipDBDK
X-Google-Smtp-Source: ABdhPJzR9vwJk2YI3Pa6qXychCllbgv5fNDt04WmzXsutUTwFdMEhv3NegqY5eP0JqA+mm+p4MN65jxnM/H1
X-Received: from kyletso.ntc.corp.google.com ([2401:fa00:fc:202:7015:3f20:3a0c:ecc2])
 (user=kyletso job=sendgmr) by 2002:a05:6902:728:: with SMTP id
 l8mr25617336ybt.326.1621735160992; Sat, 22 May 2021 18:59:20 -0700 (PDT)
Date:   Sun, 23 May 2021 09:58:55 +0800
In-Reply-To: <20210523015855.1785484-1-kyletso@google.com>
Message-Id: <20210523015855.1785484-3-kyletso@google.com>
Mime-Version: 1.0
References: <20210523015855.1785484-1-kyletso@google.com>
X-Mailer: git-send-email 2.31.1.818.g46aad6cb9e-goog
Subject: [PATCH v2 2/2] usb: typec: tcpm: Respond Not_Supported if no snk_vdo
From:   Kyle Tso <kyletso@google.com>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org
Cc:     badhri@google.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, lkp@intel.com,
        Kyle Tso <kyletso@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

If snk_vdo is not populated from fwnode, it implies the port does not
support responding to SVDM commands. Not_Supported Message shall be sent
if the contract is in PD3. And for PD2, the port shall ignore the
commands.

Fixes: 193a68011fdc ("staging: typec: tcpm: Respond to Discover Identity commands")
Signed-off-by: Kyle Tso <kyletso@google.com>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/usb/typec/tcpm/tcpm.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 7db6ae3e9c0b..a56bc71f4eb5 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -2458,7 +2458,10 @@ static void tcpm_pd_data_request(struct tcpm_port *port,
 					   NONE_AMS);
 		break;
 	case PD_DATA_VENDOR_DEF:
-		tcpm_handle_vdm_request(port, msg->payload, cnt);
+		if (tcpm_vdm_ams(port) || port->nr_snk_vdo)
+			tcpm_handle_vdm_request(port, msg->payload, cnt);
+		else if (port->negotiated_rev > PD_REV20)
+			tcpm_pd_handle_msg(port, PD_MSG_CTRL_NOT_SUPP, NONE_AMS);
 		break;
 	case PD_DATA_BIST:
 		port->bist_request = le32_to_cpu(msg->payload[0]);
-- 
2.31.1.818.g46aad6cb9e-goog

