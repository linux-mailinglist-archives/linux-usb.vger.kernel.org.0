Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C63193929C6
	for <lists+linux-usb@lfdr.de>; Thu, 27 May 2021 10:44:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235574AbhE0Iqa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 27 May 2021 04:46:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235576AbhE0Iq0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 27 May 2021 04:46:26 -0400
Received: from mail-qk1-x749.google.com (mail-qk1-x749.google.com [IPv6:2607:f8b0:4864:20::749])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CE36C06138B
        for <linux-usb@vger.kernel.org>; Thu, 27 May 2021 01:44:51 -0700 (PDT)
Received: by mail-qk1-x749.google.com with SMTP id b19-20020a05620a0893b02902e956b29f5dso2902057qka.16
        for <linux-usb@vger.kernel.org>; Thu, 27 May 2021 01:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=NBDr+PfWkI5thsojxPz9Zu9rvFYhCniTcdDmiakb3Dw=;
        b=ux0r69a6ttQbODXqEMUgeZ85sKH1ZMbFb/gSjFmkCETjERqvim+5xdHvC8KDl8bGg7
         6dmqmEkyTDBcYXsOsvPxZHGI2fSjqkBTZ4u5dl2aBvF/W8fIRty0vdOueSqxkJ/xakHq
         AnbJhUT0h0EJ45YvA6om3t+dSDJ6lFKQuNHFTGJR5X7yw13cQADzUqNAxduHsm6CXWuY
         a9eOSDyGWYCzVBN+/WcCMbRQSlRW5oZu1kBPQ6nWeMpm9kBrxzKxULdGx7QRv5EqgUQI
         txOTtwrEfMnfXFD+kNjO0LPakpfmBLFUbAEGldIzmvNisC3Ln7RBqTsmXNuP3rSbheO8
         FzDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=NBDr+PfWkI5thsojxPz9Zu9rvFYhCniTcdDmiakb3Dw=;
        b=WOw0L6ZoyOUZQXTIYJGmqzZBmkBto8rFg9rrbL8qXNQaPMrHOXzDNXLLadmenLl7sq
         hZvxgiCDC6epwPVnVprlznO2JIo3jbeZvrIHm/lsdbtZD5kTew1ffgrUXi7hKjASk38x
         vy6CsXj+SzeoXcZ1zf2ie3z7aLvj5yiYbO/4C/3Tm2vdGVAmE3tGNTs7HxhLbfIcGztA
         BmCy15m7y+GuKtfoLfGaXmO9kBLJJZQFWY9cm1AQmgqU2d9C64nFljMvAsNMJyUcN5oM
         vHEex8Y1BBgmjwvjwQbPjp2Z3ZKezgczed3HEl0qVRljfQWUZHZssUMk4kclB40v+oIp
         jdDA==
X-Gm-Message-State: AOAM533s68YWp6AJiBYYkQdCSSd3Q8XPPGbHhcUhIm3SZ8KBOjj9r6W0
        UdSAdzJYzJTebF2bSipcc4OGILUr14h2
X-Google-Smtp-Source: ABdhPJy6fnlPAVOcK75o5E5a/M2Mr+tkHtuP8kxViBO7TwlYcGtSRFK8RoyP5a3gCSyXFOAMTvdxfaGom61d
X-Received: from kyletso.ntc.corp.google.com ([2401:fa00:fc:202:c563:7257:f641:cbcd])
 (user=kyletso job=sendgmr) by 2002:ad4:478d:: with SMTP id
 z13mr2168630qvy.39.1622105090294; Thu, 27 May 2021 01:44:50 -0700 (PDT)
Date:   Thu, 27 May 2021 16:44:17 +0800
In-Reply-To: <20210527084419.4164369-1-kyletso@google.com>
Message-Id: <20210527084419.4164369-2-kyletso@google.com>
Mime-Version: 1.0
References: <20210527084419.4164369-1-kyletso@google.com>
X-Mailer: git-send-email 2.31.1.818.g46aad6cb9e-goog
Subject: [PATCH 1/3] usb: typec: tcpm: Correct the responses in SVDM Version
 2.0 DFP
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

In USB PD Spec Rev 3.1 Ver 1.0, section "6.12.5 Applicability of
Structured VDM Commands", DFP is allowed and recommended to respond to
Discovery Identity with ACK. And in section "6.4.4.2.5.1 Commands other
than Attention", NAK should be returned only when receiving Messages
with invalid fields, Messages in wrong situation, or unrecognize
Messages.

Still keep the original design for SVDM Version 1.0 for backward
compatibilities.

Fixes: 193a68011fdc ("staging: typec: tcpm: Respond to Discover Identity commands")
Signed-off-by: Kyle Tso <kyletso@google.com>
---
 drivers/usb/typec/tcpm/tcpm.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 9ce8c9af4da5..a1bf0dc5babf 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -1547,19 +1547,25 @@ static int tcpm_pd_svdm(struct tcpm_port *port, struct typec_altmode *adev,
 			if (PD_VDO_VID(p[0]) != USB_SID_PD)
 				break;
 
-			if (PD_VDO_SVDM_VER(p[0]) < svdm_version)
+			if (PD_VDO_SVDM_VER(p[0]) < svdm_version) {
 				typec_partner_set_svdm_version(port->partner,
 							       PD_VDO_SVDM_VER(p[0]));
+				svdm_version = PD_VDO_SVDM_VER(p[0]);
+			}
 
 			tcpm_ams_start(port, DISCOVER_IDENTITY);
-			/* 6.4.4.3.1: Only respond as UFP (device) */
-			if (port->data_role == TYPEC_DEVICE &&
+			/*
+			 * PD2.0 Spec 6.10.3: respond with NAK as DFP (data host)
+			 * PD3.1 Spec 6.4.4.2.5.1: respond with NAK if "invalid field" or
+			 * "wrong configuation" or "Unrecognized"
+			 */
+			if ((port->data_role == TYPEC_DEVICE || svdm_version >= SVDM_VER_2_0) &&
 			    port->nr_snk_vdo) {
 				/*
 				 * Product Type DFP and Connector Type are not defined in SVDM
 				 * version 1.0 and shall be set to zero.
 				 */
-				if (typec_get_negotiated_svdm_version(typec) < SVDM_VER_2_0)
+				if (svdm_version < SVDM_VER_2_0)
 					response[1] = port->snk_vdo[0] & ~IDH_DFP_MASK
 						      & ~IDH_CONN_MASK;
 				else
-- 
2.31.1.818.g46aad6cb9e-goog

