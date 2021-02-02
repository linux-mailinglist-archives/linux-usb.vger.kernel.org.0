Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3DA030C57B
	for <lists+linux-usb@lfdr.de>; Tue,  2 Feb 2021 17:25:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236360AbhBBQYk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 2 Feb 2021 11:24:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236123AbhBBQWU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 2 Feb 2021 11:22:20 -0500
Received: from mail-qv1-xf49.google.com (mail-qv1-xf49.google.com [IPv6:2607:f8b0:4864:20::f49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F301CC061221
        for <linux-usb@vger.kernel.org>; Tue,  2 Feb 2021 08:18:08 -0800 (PST)
Received: by mail-qv1-xf49.google.com with SMTP id h13so15259908qvo.18
        for <linux-usb@vger.kernel.org>; Tue, 02 Feb 2021 08:18:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=tJ1RjowJP8uP6aGuamfXuNzicvFr4anl7UIOhyimvSM=;
        b=bZaqIqlPPqbLYC0Cr7r6Q2eRJOmpXZWUFpKvj0rZR486uxqjXbpMJxZHKo3rm6040d
         OEx1Heh+JWUXlIy2GaZkuiDz20uIbhQxArX8nktdQTWk1jli26ZkYAlaqTl39hex4nq1
         /ZC7lrjP6lh33XKn51dRCMqvxhSVu5yPhUdKl2EqBaamrx05QuT+1eOQvfZU/4nnY048
         k6XvMyZCPv7LMD4yistrtaftg5pZIuuFIsZ1Ymy5ble0KUjinVBWL9opXeU0hXEzD8rW
         ZR+GXZepH87T/w4zgkeCEu4AnMgIQA7IxL9ZG7C5XuqC4adc99l9D6eCP1jgduXnnnJf
         GE5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=tJ1RjowJP8uP6aGuamfXuNzicvFr4anl7UIOhyimvSM=;
        b=ZlTWof3WzuHMq5ckWGFhyxu6U04AC/tesQMF2S5/oFjJegLLmSfz2J27V9k4Q/AalV
         /r38ocwhMU9es/YcZEEsehyVW1y1nSqc3b7TOHQ/4qSyjo+Y1kpEZxSQw2jllApPYsKt
         vamqAVF810MmAKkiYX743mkJRWY1RpUt4tK8obryR4oB8HIJWy9DRafFW224+E2M3GqK
         Hv5Nrvwi38Z7sNqxPjBcauTUZvYWP9EvqCgSl+DkTexlr+ugFwyIY+NUyQqkcu7o+q55
         v8J0cY/cGYlLJ/Slj4lM+6iM2WFOthj+BDfith6oZN3OAGmnm3P+Yj6XzF3sbFPno/ze
         XWOg==
X-Gm-Message-State: AOAM530ezytNIyjXMN8owHcrEJUOAtasvWDiG7CFgeMlmX6RcoFVw9WY
        LtbZM+nmEYfNgg808XYF+r+anLUJz9EB
X-Google-Smtp-Source: ABdhPJzQeYu49Y8qZoV69wlqJLq6kDobFv8A0AP3hSzacRVoRcfuqx0oabaJQZYnsb//jx+QoiYUGmcosnxz
Sender: "kyletso via sendgmr" <kyletso@kyletso.ntc.corp.google.com>
X-Received: from kyletso.ntc.corp.google.com ([2401:fa00:fc:202:dd94:c753:a81d:c855])
 (user=kyletso job=sendgmr) by 2002:a05:6214:c27:: with SMTP id
 a7mr20744200qvd.54.1612282688190; Tue, 02 Feb 2021 08:18:08 -0800 (PST)
Date:   Wed,  3 Feb 2021 00:17:33 +0800
In-Reply-To: <20210202161733.932215-1-kyletso@google.com>
Message-Id: <20210202161733.932215-9-kyletso@google.com>
Mime-Version: 1.0
References: <20210202161733.932215-1-kyletso@google.com>
X-Mailer: git-send-email 2.30.0.365.g02bc693789-goog
Subject: [PATCH v5 8/8] usb: typec: tcpm: Get Sink VDO from fwnode
From:   Kyle Tso <kyletso@google.com>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, hdegoede@redhat.com, robh+dt@kernel.org
Cc:     badhri@google.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Kyle Tso <kyletso@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Commit a079973f462a ("usb: typec: tcpm: Remove tcpc_config
configuration mechanism") removed the tcpc_config which includes the
Sink VDO and it is not yet added back with fwnode. Add it now.

Signed-off-by: Kyle Tso <kyletso@google.com>
---
 drivers/usb/typec/tcpm/tcpm.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 979b7ee6473c..9b13e19118f0 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -5677,6 +5677,20 @@ static int tcpm_fw_get_caps(struct tcpm_port *port,
 			port->new_source_frs_current = frs_current;
 	}
 
+	/* sink-vdos is optional */
+	ret = fwnode_property_count_u32(fwnode, "sink-vdos");
+	if (ret < 0)
+		ret = 0;
+
+	port->nr_snk_vdo = min(ret, VDO_MAX_OBJECTS);
+	if (port->nr_snk_vdo) {
+		ret = fwnode_property_read_u32_array(fwnode, "sink-vdos",
+						     port->snk_vdo,
+						     port->nr_snk_vdo);
+		if (ret < 0)
+			return ret;
+	}
+
 	return 0;
 }
 
-- 
2.30.0.365.g02bc693789-goog

