Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CF25303856
	for <lists+linux-usb@lfdr.de>; Tue, 26 Jan 2021 09:50:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390450AbhAZItQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 26 Jan 2021 03:49:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390551AbhAZIr3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 26 Jan 2021 03:47:29 -0500
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A567EC0617A7
        for <linux-usb@vger.kernel.org>; Tue, 26 Jan 2021 00:46:05 -0800 (PST)
Received: by mail-yb1-xb4a.google.com with SMTP id q67so17112670ybg.19
        for <linux-usb@vger.kernel.org>; Tue, 26 Jan 2021 00:46:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=rY9VRGFEnK07xJyRxhqYar0R4BXBdHwAeKiBVE3gLSc=;
        b=UnAA7x7sisgHljyIT3brf27r5NguPJN6tGOVTmiPo2N2K9j+Gu/JvzvKR+oBXsMm8v
         2IV3JGec/SjF2E1jp01MTDE6qwsitpCnUfMQDmwpwoxpxc5ozzMDQqPI7gxNUxF/ZK9E
         ex2NDQh/t613jm0YYS5r9kA7Ylj9HOF5ZXJAtJImG+OI3oMqQ0j45CKotJGFAH1E+wwv
         HGKvZ69ezcCeX+/DEoWEnHxnpl6eUgottFdSOcYNy9PTbQAOCj+4B43hYfYGLAsOEHQJ
         x+xbafEeLwoxmI/QC/iSIsV24te9zerIcaN4RlcboxBDlAGq30azKEPBCpucE8Q9kpc2
         HVUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=rY9VRGFEnK07xJyRxhqYar0R4BXBdHwAeKiBVE3gLSc=;
        b=bEJ3aJ2XI0D902hWG24xQZdwtBrjvoBzeCctfOb4CkvhAcKJl6HW/NihX4k2MRgfWW
         bLf0o4040IM90MEvQNn4HyNhvmp1rsJvppfLAbqN0TXm3plbgFhQ0CT6/SEg+ZMwNrp0
         T6pNLjYMoKPULk6Dh+hEKEvG1XzUsAL3KsCwyB2KyRW1HdMRXR29pd3JKbiW8bEfqqfk
         5dBO3FWx+2hxO3mQH1tpQjSyuXfCsQfsbotCEk1Xe/SJEU9sBMCgS48W/KoExkWMQbTz
         pqG1pdFPEiP6g0+BXa86WOQGjfpAX27xbqiQP8IUaf5owFVYGAyXX0ZenAVXxI9oK7jh
         kWQA==
X-Gm-Message-State: AOAM533QIPgcGQdlkyddD8LuRP0GNtcPjo9M8lbIi+/Vd22hBu3Cqk/G
        UFv2rEC/wdZnLydZfVuj359CAKKD0Oau
X-Google-Smtp-Source: ABdhPJx+fjPVUGXGXLaEb5V4RxpTQ3WPXK1uu3IzULxVwMe1ZP0gWXIf/o0pmkLFGK4n8elA+NfVJT/bgeaO
Sender: "kyletso via sendgmr" <kyletso@kyletso.ntc.corp.google.com>
X-Received: from kyletso.ntc.corp.google.com ([2401:fa00:fc:202:4430:c29c:1e76:3e65])
 (user=kyletso job=sendgmr) by 2002:a25:ac5d:: with SMTP id
 r29mr7223448ybd.446.1611650764837; Tue, 26 Jan 2021 00:46:04 -0800 (PST)
Date:   Tue, 26 Jan 2021 16:45:44 +0800
In-Reply-To: <20210126084544.682641-1-kyletso@google.com>
Message-Id: <20210126084544.682641-4-kyletso@google.com>
Mime-Version: 1.0
References: <20210126084544.682641-1-kyletso@google.com>
X-Mailer: git-send-email 2.30.0.280.ga3ce27912f-goog
Subject: [PATCH 3/3] usb: typec: tcpm: Get Sink VDO from fwnode
From:   Kyle Tso <kyletso@google.com>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, robh+dt@kernel.org,
        hdegoede@redhat.com, badhri@google.com
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Kyle Tso <kyletso@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Current design only allows TCPM to get the Sink VDO from TCPC configs.
Add an additional way from fwnode.

Signed-off-by: Kyle Tso <kyletso@google.com>
---
 drivers/usb/typec/tcpm/tcpm.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index c14cf7842520..7b797d14d9db 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -5673,6 +5673,18 @@ static int tcpm_fw_get_caps(struct tcpm_port *port,
 			port->new_source_frs_current = frs_current;
 	}
 
+	ret = fwnode_property_read_u32_array(fwnode, "sink-vdos", NULL, 0);
+	if (ret <= 0 && ret != -EINVAL) {
+		return -EINVAL;
+	} else if (ret > 0) {
+		port->nr_snk_vdo = min(ret, VDO_MAX_OBJECTS);
+		ret = fwnode_property_read_u32_array(fwnode, "sink-vdos",
+						     port->snk_vdo,
+						     port->nr_snk_vdo);
+		if (ret < 0)
+			return -EINVAL;
+	}
+
 	return 0;
 }
 
-- 
2.30.0.280.ga3ce27912f-goog

