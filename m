Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 227916A765E
	for <lists+linux-usb@lfdr.de>; Wed,  1 Mar 2023 22:50:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229676AbjCAVuM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Mar 2023 16:50:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229624AbjCAVuK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 1 Mar 2023 16:50:10 -0500
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE13238014
        for <linux-usb@vger.kernel.org>; Wed,  1 Mar 2023 13:50:03 -0800 (PST)
Received: by mail-yb1-xb49.google.com with SMTP id w192-20020a25dfc9000000b009fe14931caaso1780524ybg.7
        for <linux-usb@vger.kernel.org>; Wed, 01 Mar 2023 13:50:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1677707403;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Lzd1Gwx96VUjXcS7KYwf3MWxr5hmHFJA81n84b7nbV0=;
        b=fC+1elqqEoVt0zxPvdBGjmtJXVH+4DPH170Jc2W7/L9XGci4IjNQG2TY+yEUHIx3AP
         GGpK6hXJwjsUWfv2oYNKD/GswLKAmG869Q5A6sKAmSVRTlUP8GVCc9709jcPZK2lkTUJ
         gtQbxQrsFnAms1c7PwafHvvxALWBuCvL7ZbCfbAx2dq0jWtcmRVp80JKhszxCiwgHUAy
         /rpVF22HWjBs2ZdEjmheoS3srZ7rlD8HrCgHUyIASZ748YXz7aX0i5l/YWScyHgTKbVO
         5FY5CR1LB+bwlRJ4XmjCGFBkWb7X8y+gxLvACdvpGugxK33VX9qTglPXxL+z2MaLIUpg
         PinQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677707403;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Lzd1Gwx96VUjXcS7KYwf3MWxr5hmHFJA81n84b7nbV0=;
        b=Sx8uf3l820tFYx5MCNFSoxtgXV6KQyct3Ur4sbR1YH2/zxTl8Iphz4aPq26Rtd8v8v
         z4Ot6eYlK5cp6N3iPPb0n5SErWk7U5gqbIc41Ds61qOh6f4MuG0mzWOfPa1XFdZN7eYq
         Ob65J4GXUM0Ho534U46Ajnw6J8ObQxG9n6rGN66BUluAdMa5gZHNNO4J1lGsRo2pvQKQ
         nweiTzHjl2wDkWeB88+ioLaC53tkYMRP4QXw3v4yMsEsWngUgabBfdBNM949eKgy3A/e
         D39Hh9XIbaKoFqhis3XJOf2iOmIqQuO3ffy3nY/vwNmJ0phnNd0ieHVJ/9fQNxOSYPsS
         BrhQ==
X-Gm-Message-State: AO0yUKXZ5NWKiJbP0pTHFFCBBCuyAK58XDuWi0zpMH417YTpqN3Kfykr
        Lkthi00Z/sFnVhKAk4034dNb6axqsxHsm+w=
X-Google-Smtp-Source: AK7set9NsJzKEjU1HYT7Nzg6ByPOFB0TqyhmDlmEGQSkAt2ogDssPNGIoPEWtkQYvzsOdZTdZOOr7UE+/OhEKkQ=
X-Received: from saravanak.san.corp.google.com ([2620:15c:2d:3:debf:1aed:5c45:c92])
 (user=saravanak job=sendgmr) by 2002:a81:b705:0:b0:533:9185:fc2c with SMTP id
 v5-20020a81b705000000b005339185fc2cmr4923042ywh.7.1677707403606; Wed, 01 Mar
 2023 13:50:03 -0800 (PST)
Date:   Wed,  1 Mar 2023 13:49:50 -0800
In-Reply-To: <20230301214952.2190757-1-saravanak@google.com>
Message-Id: <20230301214952.2190757-4-saravanak@google.com>
Mime-Version: 1.0
References: <20230301214952.2190757-1-saravanak@google.com>
X-Mailer: git-send-email 2.39.2.722.g9855ee24e9-goog
Subject: [PATCH v1 3/4] usb: typec: tcpm: Remove use of fw_devlink_purge_absent_suppliers()
From:   Saravana Kannan <saravanak@google.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Len Brown <lenb@kernel.org>
Cc:     Saravana Kannan <saravanak@google.com>,
        Yongqin Liu <yongqin.liu@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Martin Kepplinger <martin.kepplinger@puri.sm>,
        Amelie Delaunay <amelie.delaunay@foss.st.com>,
        kernel-team@android.com, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-acpi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

After recent changes to fw_devlink that ended with commit 4a032827daa8
("of: property: Simplify of_link_to_phandle()"), fw_devlink no longer
cares about the "compatible" property and figures out the correct struct
device at runtime. So, we no longer need to call
fw_devlink_purge_absent_suppliers().

Signed-off-by: Saravana Kannan <saravanak@google.com>
Cc: Yongqin Liu <yongqin.liu@linaro.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
---
 drivers/usb/typec/tcpm/tcpm.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index a0d943d78580..fd131f07020c 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -6112,15 +6112,6 @@ static int tcpm_fw_get_caps(struct tcpm_port *port,
 	if (!fwnode)
 		return -EINVAL;
 
-	/*
-	 * This fwnode has a "compatible" property, but is never populated as a
-	 * struct device. Instead we simply parse it to read the properties.
-	 * This it breaks fw_devlink=on. To maintain backward compatibility
-	 * with existing DT files, we work around this by deleting any
-	 * fwnode_links to/from this fwnode.
-	 */
-	fw_devlink_purge_absent_suppliers(fwnode);
-
 	ret = typec_get_fw_cap(&port->typec_caps, fwnode);
 	if (ret < 0)
 		return ret;
-- 
2.39.2.722.g9855ee24e9-goog

