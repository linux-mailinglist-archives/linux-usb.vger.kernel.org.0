Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C0AE632DB6
	for <lists+linux-usb@lfdr.de>; Mon, 21 Nov 2022 21:14:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231880AbiKUUOA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 21 Nov 2022 15:14:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231858AbiKUUN7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 21 Nov 2022 15:13:59 -0500
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55FC151C1A
        for <linux-usb@vger.kernel.org>; Mon, 21 Nov 2022 12:13:57 -0800 (PST)
Received: by mail-pj1-x1030.google.com with SMTP id k2-20020a17090a4c8200b002187cce2f92so10063279pjh.2
        for <linux-usb@vger.kernel.org>; Mon, 21 Nov 2022 12:13:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Louc5ADJT348/nCzYaDBybvP94Rx6fwNzSnISAStWy0=;
        b=TGHF/B4CquhA/lZbHuol0RLDFg6PJB0gRf2Aun3KZ/xka1JqEdr0e61iQx2sOJ+ULu
         WJYlkRxiP50J7ZlY+iRtqu+ZjJ+FhQMnr4fq8/jeQ++Cwde9vs15gjihEdXE8D6wD9uD
         q9h7qRmg41GUQQ7THip2b3tHYH6V7rGLhgl+U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Louc5ADJT348/nCzYaDBybvP94Rx6fwNzSnISAStWy0=;
        b=uxQQAlYO+9CEEw96udJdNKYs8dZDSD/1TxyHNmTUx56+RHG5BrXOy5essxW4ZGmIUP
         m0YSlkeW1offHng6emGy54p1IR4JeA/iVfRRuLPig4a4X+rpBbogzP9AdaW96AvEBaxb
         LULalFwoaCKb5RrhF99dgZKhYb/k7vHkJP7I0FV7BiNXBf+7/oPaFij0GDuBuC6idBNp
         4g0a7T6qaqqYDTvNQXciqL9eJF1dz0GCfGtbHNc2dYi5RShb43eW+uxq+5ulKcjK5Hyy
         VE6kT/jQbPBGNJYk7vpvNxqTOcWrXebp+GsCuonMshirYFCaNrSm9g7iRAe0b0asRHbY
         f2VA==
X-Gm-Message-State: ANoB5pmfzDuStdyTXzGEoifROJTq+K5TZsFfuIaFD7NZNKHOnXX2RlEX
        o86S2/IAgHo8jmde6Y7hF4s7CQ==
X-Google-Smtp-Source: AA0mqf5BBgF1qALgJYt0DK5mjq1LPUTO6oL6myxfNUYDOB0e/UcQ/yi/iReVRzYVAr0RKrrr95gNAw==
X-Received: by 2002:a17:903:1311:b0:189:1e5:8422 with SMTP id iy17-20020a170903131100b0018901e58422mr461190plb.17.1669061636874;
        Mon, 21 Nov 2022 12:13:56 -0800 (PST)
Received: from pmalani.c.googlers.com.com (33.5.83.34.bc.googleusercontent.com. [34.83.5.33])
        by smtp.gmail.com with ESMTPSA id h8-20020a170902f70800b001822121c45asm10178507plo.28.2022.11.21.12.13.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Nov 2022 12:13:56 -0800 (PST)
From:   Prashant Malani <pmalani@chromium.org>
To:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        chrome-platform@lists.linux.dev
Cc:     Prashant Malani <pmalani@chromium.org>,
        Benson Leung <bleung@chromium.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <groeck@chromium.org>
Subject: [PATCH 1/2] usb: typec: Add helper to get partner device struct
Date:   Mon, 21 Nov 2022 20:13:35 +0000
Message-Id: <20221121201337.2772216-2-pmalani@chromium.org>
X-Mailer: git-send-email 2.38.1.584.g0f3c55d4c2-goog
In-Reply-To: <20221121201337.2772216-1-pmalani@chromium.org>
References: <20221121201337.2772216-1-pmalani@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Some port drivers may want to set a Type-C partner as a parent for a
USB Power Delivery object, but the Type-C partner struct isn't exposed
outside of the Type-C class driver. Add a helper which returns a pointer
to the Type-C partner's device struct, so that it can be supplied as the
parent to the PD object.

Cc: Benson Leung <bleung@chromium.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Prashant Malani <pmalani@chromium.org>
---
 drivers/usb/typec/class.c | 13 +++++++++++++
 include/linux/usb/typec.h |  2 ++
 2 files changed, 15 insertions(+)

diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index bd5e5dd70431..154c70630432 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -821,6 +821,19 @@ void typec_partner_set_svdm_version(struct typec_partner *partner,
 }
 EXPORT_SYMBOL_GPL(typec_partner_set_svdm_version);
 
+
+/**
+ * typec_partner_to_dev - Get the device struct of a USB Type-C partner.
+ * @partner: USB Type-C Partner
+ *
+ * Returns a pointer to the device struct or NULL.
+ */
+struct device *typec_partner_to_dev(struct typec_partner *partner)
+{
+	return partner ? &partner->dev : NULL;
+}
+EXPORT_SYMBOL_GPL(typec_partner_to_dev);
+
 /**
  * typec_register_partner - Register a USB Type-C Partner
  * @port: The USB Type-C Port the partner is connected to
diff --git a/include/linux/usb/typec.h b/include/linux/usb/typec.h
index 7751bedcae5d..085be3e94ff8 100644
--- a/include/linux/usb/typec.h
+++ b/include/linux/usb/typec.h
@@ -327,6 +327,8 @@ void typec_partner_set_svdm_version(struct typec_partner *partner,
 				    enum usb_pd_svdm_ver svdm_version);
 int typec_get_negotiated_svdm_version(struct typec_port *port);
 
+struct device *typec_partner_to_dev(struct typec_partner *partner);
+
 int typec_port_set_usb_power_delivery(struct typec_port *port, struct usb_power_delivery *pd);
 int typec_partner_set_usb_power_delivery(struct typec_partner *partner,
 					 struct usb_power_delivery *pd);
-- 
2.38.1.584.g0f3c55d4c2-goog

