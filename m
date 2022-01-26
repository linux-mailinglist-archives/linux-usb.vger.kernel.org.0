Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 537F649C26D
	for <lists+linux-usb@lfdr.de>; Wed, 26 Jan 2022 05:05:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237451AbiAZEE5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 25 Jan 2022 23:04:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237444AbiAZEEz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 25 Jan 2022 23:04:55 -0500
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 330B2C06173B
        for <linux-usb@vger.kernel.org>; Tue, 25 Jan 2022 20:04:55 -0800 (PST)
Received: by mail-yb1-xb4a.google.com with SMTP id 127-20020a250f85000000b00611ab6484abso45753089ybp.23
        for <linux-usb@vger.kernel.org>; Tue, 25 Jan 2022 20:04:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=zGpZZqA59lqSjncOCUawbzrH4HoG3Or+e1TiGHQxkQc=;
        b=Iwo2PQAnRuvpnA8d+vAOQ+gIHT4EAKob+ueQr407aKW0mDbIbw2bVnb5cTAymh1/N8
         djckblVAT9v4WCSGgzGir7Q0xquNsn6gZaOXLLtn7bV2/jUjmPA8H9UPk9nsPa0Os+dn
         8BRhFpy25P6AHYJRLiEyIxiAD/cuaq6O9PqlJLAy0sDn8M726cwerB7TqTXA/50FHpa8
         UpMeCE6ZNTQGo0RUCyr3wa16OisDJ9jdSlrCw36nJzVOycbPq7KuPtVbDKBKTjWmIT13
         2Q1O2NN56Jzh6knC/YdAmYo7B/7S+ILZC9UaWNcQqOxvVM1B+zoaitS84vglwGepyWLe
         F76g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=zGpZZqA59lqSjncOCUawbzrH4HoG3Or+e1TiGHQxkQc=;
        b=kRXdgPRxpIMCocyMMFqfe9mpRFWcYo5QHB/QFfM3CeecqhPlHUmSh33lz6BwlBC6AC
         uPd8+ZwQ0Xr918lgy74gY2/4K5gCfANswUQ7674RSiwqd5eVJgjcoXN+5ej3/Rqd641i
         MxPCs/UPnodFEZuWAO+Q4K1X8wMj2idKx47D7ebyL+uMSBrZ6XHgtVEQuePzkYf7q+ZL
         R1aNF37g3yTeheSyJg3nZoo3RJDRmTCjSwXjWrfJHsusPLaJmJ7/Rzu5xBYPKejanKCj
         za+XxGvRRNgYxoDtQNfc+Exv75JKwtcNLh8zlaNLzt+oAV8YF5ID3i1TrYN6zCWY6a9z
         4kdQ==
X-Gm-Message-State: AOAM530cV0a+irUYwEPFsemqRAbnfdgpWjBy/4BLbkxbVNkWsKofE9ru
        uVit9uJvRpjGL/tAsr6okSOJZBb7d0s=
X-Google-Smtp-Source: ABdhPJz71lD3YVAeXHyQ9Wjx7IfVwseXh5k7ip5PRnaw73GHBvxrwC/ROS7a5J0XL3Z96bpibFXgvyN6y8U=
X-Received: from badhri.mtv.corp.google.com ([2620:15c:211:201:f4a7:8e16:f301:160])
 (user=badhri job=sendgmr) by 2002:a81:23ce:0:b0:2ca:287c:6c3d with SMTP id
 00721157ae682-2ca33e99465mr6881017b3.226.1643169893957; Tue, 25 Jan 2022
 20:04:53 -0800 (PST)
Date:   Tue, 25 Jan 2022 20:04:47 -0800
In-Reply-To: <20220126040447.3186233-1-badhri@google.com>
Message-Id: <20220126040447.3186233-2-badhri@google.com>
Mime-Version: 1.0
References: <20220126040447.3186233-1-badhri@google.com>
X-Mailer: git-send-email 2.35.0.rc0.227.g00780c9af4-goog
Subject: [PATCH v2 2/2] usb: typec: tcpm: Do not disconnect when receiving VSAFE0V
From:   Badhri Jagan Sridharan <badhri@google.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kyle Tso <kyletso@google.com>, stable@vger.kernel.org,
        Badhri Jagan Sridharan <badhri@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

With some chargers, vbus might momentarily raise above VSAFE5V and fall
back to 0V causing VSAFE0V to be triggered. This will report a VBUS off
event causing TCPM to transition to SNK_UNATTACHED state where it
should be waiting in either SNK_ATTACH_WAIT or SNK_DEBOUNCED state.
This patch makes TCPM avoid VSAFE0V events while in SNK_ATTACH_WAIT
or SNK_DEBOUNCED state.

Stub from the spec:
    "4.5.2.2.4.2 Exiting from AttachWait.SNK State
    A Sink shall transition to Unattached.SNK when the state of both
    the CC1 and CC2 pins is SNK.Open for at least tPDDebounce.
    A DRP shall transition to Unattached.SRC when the state of both
    the CC1 and CC2 pins is SNK.Open for at least tPDDebounce."

[23.194131] CC1: 0 -> 0, CC2: 0 -> 5 [state SNK_UNATTACHED, polarity 0, connected]
[23.201777] state change SNK_UNATTACHED -> SNK_ATTACH_WAIT [rev3 NONE_AMS]
[23.209949] pending state change SNK_ATTACH_WAIT -> SNK_DEBOUNCED @ 170 ms [rev3 NONE_AMS]
[23.300579] VBUS off
[23.300668] state change SNK_ATTACH_WAIT -> SNK_UNATTACHED [rev3 NONE_AMS]
[23.301014] VBUS VSAFE0V
[23.301111] Start toggling

Fixes: f0690a25a140b8 ("staging: typec: USB Type-C Port Manager (tcpm)")
Cc: stable@vger.kernel.org
Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
---
Changes since v1:
- Fix typos stated by Guenter Roeck.
---
 drivers/usb/typec/tcpm/tcpm.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 3bf79f52bd34..0e0985355a14 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -5264,6 +5264,10 @@ static void _tcpm_pd_vbus_vsafe0v(struct tcpm_port *port)
 	case PR_SWAP_SNK_SRC_SOURCE_ON:
 		/* Do nothing, vsafe0v is expected during transition */
 		break;
+	case SNK_ATTACH_WAIT:
+	case SNK_DEBOUNCED:
+		/* Do nothing, still waiting for VSAFE5V to connect */
+		break;
 	default:
 		if (port->pwr_role == TYPEC_SINK && port->auto_vbus_discharge_enabled)
 			tcpm_set_state(port, SNK_UNATTACHED, 0);
-- 
2.35.0.rc0.227.g00780c9af4-goog

