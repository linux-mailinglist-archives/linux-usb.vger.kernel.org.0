Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 444AF357577
	for <lists+linux-usb@lfdr.de>; Wed,  7 Apr 2021 22:07:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355917AbhDGUHu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 7 Apr 2021 16:07:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355915AbhDGUHn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 7 Apr 2021 16:07:43 -0400
Received: from mail-qv1-xf49.google.com (mail-qv1-xf49.google.com [IPv6:2607:f8b0:4864:20::f49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E34E4C061760
        for <linux-usb@vger.kernel.org>; Wed,  7 Apr 2021 13:07:31 -0700 (PDT)
Received: by mail-qv1-xf49.google.com with SMTP id s13so1809920qvn.22
        for <linux-usb@vger.kernel.org>; Wed, 07 Apr 2021 13:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=ZHNgOhbcBGIxSCKPDQlgoIy0m+9VFY0wXe/8bm4YHTE=;
        b=CcxsuTq6nOfVVtaFysl/WbmIZWJ8Y7tCDtjLWq++bLaMadYBg0LoVCqEYtBiwN+m2Q
         ba7a/Mo9Aszkb2RRB/GqWUQkZRwqhLbW1W/NHYDnpP9npIYBEDMTHs1njBizSzCsiRY6
         lr0W5EioZZPbZH9M9Coizz2WeSdQnLh6jM/UWF52AeVjGHneKqTrrpJQaDmTNns6cz5D
         yAdLMS7uaTuPYsCMZG4qUg/BvrP8p1nswRYOOy0d31CXolBdmWYeuCnE+/ERVt+oMW35
         NhZTxTZZVakscfQseDwQk1e/804YAyNPK8cJYYQC8rvb/NICARUColyiHMY3qi5awBgB
         zrJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=ZHNgOhbcBGIxSCKPDQlgoIy0m+9VFY0wXe/8bm4YHTE=;
        b=bs3eAEkI6TVQurKiYaEFMa0A3iomtUCWB3zJsXgZop/MA3UM4KlQJbKq88kZSb/ade
         OTssJRxqDNxhgApEVKVVGsqKeVmQNVC9yT5hGUhEyAQFlXVArFsvEDZjx7wObdMk0yUz
         VzanaNdORhVI08HZ1Jzwz9NtT3cj7gE6ERcqg0C8Xs02VJPHZsXXn5GF4IL276gM1TdX
         yuS3uwb1tOfV3TxJCObYnenEUrsRD/3rS8heKwwrM65S41m6SJTv/YVA77mFW+XtjICl
         6b/VjO1TePxS4GuvggcBxctwK1FhjiQpnNvVLWRDPdYry3Mddmk859qVpRasgn1ohN+c
         4cBQ==
X-Gm-Message-State: AOAM530XuXCR5FCzZ+cLDo43YXG/1p2ik/GYcFKgmNOhOWc11n3CnVV/
        JTdOShJyTEQGwvBpdVV1i7xVCm3AQZs=
X-Google-Smtp-Source: ABdhPJyvzz9BZE9t+ER2QnbrEnqgaZrLMj5yua7F/zskwASinK5bE68tYBmirVkKr2rT0avnu466FoQvXG4=
X-Received: from badhri.mtv.corp.google.com ([2620:15c:211:201:991:6d08:9e6d:683d])
 (user=badhri job=sendgmr) by 2002:a05:6214:10ca:: with SMTP id
 r10mr5249610qvs.53.1617826051169; Wed, 07 Apr 2021 13:07:31 -0700 (PDT)
Date:   Wed,  7 Apr 2021 13:07:20 -0700
In-Reply-To: <20210407200723.1914388-1-badhri@google.com>
Message-Id: <20210407200723.1914388-3-badhri@google.com>
Mime-Version: 1.0
References: <20210407200723.1914388-1-badhri@google.com>
X-Mailer: git-send-email 2.31.1.295.g9ea45b61b8-goog
Subject: [PATCH v2 3/6] usb: typec: tcpm: update power supply once partner accepts
From:   Badhri Jagan Sridharan <badhri@google.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Kyle Tso <kyletso@google.com>,
        Badhri Jagan Sridharan <badhri@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

power_supply_changed needs to be called to notify clients
after the partner accepts the requested values for the pps
case.

Also, remove the redundant power_supply_changed at the end
of the tcpm_reset_port as power_supply_changed is already
called right after usb_type is changed.

Fixes: f2a8aa053c176 ("typec: tcpm: Represent source supply through power_supply")
Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
Reviewed-by: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
---
Changes since V1:
* Updated commit description to clarify Guenter Roeck's concern.
* Added Reviewed-by tags
---
 drivers/usb/typec/tcpm/tcpm.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index b4a40099d7e9..d1d03ee90d8f 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -2568,6 +2568,7 @@ static void tcpm_pd_ctrl_request(struct tcpm_port *port,
 			port->pps_data.max_curr = port->pps_data.req_max_curr;
 			port->req_supply_voltage = port->pps_data.req_out_volt;
 			port->req_current_limit = port->pps_data.req_op_curr;
+			power_supply_changed(port->psy);
 			tcpm_set_state(port, SNK_TRANSITION_SINK, 0);
 			break;
 		case SOFT_RESET_SEND:
@@ -3136,7 +3137,6 @@ static unsigned int tcpm_pd_select_pps_apdo(struct tcpm_port *port)
 						      port->pps_data.req_out_volt));
 		port->pps_data.req_op_curr = min(port->pps_data.max_curr,
 						 port->pps_data.req_op_curr);
-		power_supply_changed(port->psy);
 	}
 
 	return src_pdo;
@@ -3561,8 +3561,6 @@ static void tcpm_reset_port(struct tcpm_port *port)
 	port->sink_cap_done = false;
 	if (port->tcpc->enable_frs)
 		port->tcpc->enable_frs(port->tcpc, false);
-
-	power_supply_changed(port->psy);
 }
 
 static void tcpm_detach(struct tcpm_port *port)
-- 
2.31.1.295.g9ea45b61b8-goog

