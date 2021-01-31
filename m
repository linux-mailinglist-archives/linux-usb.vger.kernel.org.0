Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5B61309D6C
	for <lists+linux-usb@lfdr.de>; Sun, 31 Jan 2021 16:24:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232530AbhAaPUv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 31 Jan 2021 10:20:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232748AbhAaPUg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 31 Jan 2021 10:20:36 -0500
Received: from mail-qt1-x849.google.com (mail-qt1-x849.google.com [IPv6:2607:f8b0:4864:20::849])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81637C061793
        for <linux-usb@vger.kernel.org>; Sun, 31 Jan 2021 07:19:07 -0800 (PST)
Received: by mail-qt1-x849.google.com with SMTP id v65so6582418qtd.0
        for <linux-usb@vger.kernel.org>; Sun, 31 Jan 2021 07:19:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=FRzaEhvDPo4h4QFnnXdsfoodxN30fydIjOqX0xUgHaA=;
        b=tUGY1emCCr3kTH3BPSrJyXjd0HfNm6m/oZWbXkNxMlSgLYhkmo5Gd0ss84pV2g0Cc+
         bO0sWEXymTVZZ0UC4AYb3BLvWUjpuxGFnuaqq0XpqpxSF1S40UMb+sB9RP9PcU8+G3hT
         BZ3bfhkqscQaHgvvs8h2eDB2jfLE6YgoDiHoPL/v+Sh0tWFMziINtCqUWUWzClGMs2w6
         +9IhcfmeLuKo1/L63JRv+rQHW6y+/fAPEUdl+N71Ehp4OiSR9hf5IhDtalwYnIK/GTiV
         OQa3diqA2Np8ZOp5zQGrGhzH5os9qdIGek9WglCiB2W8WQOh9GlzXTgH+olyDTFZ3PVI
         XgXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=FRzaEhvDPo4h4QFnnXdsfoodxN30fydIjOqX0xUgHaA=;
        b=Es5zsv0dbz5fNdiekn94K0Sn617L61q9XCWd8TLXieq7MQszSln/uAJRfhloolsxja
         VHjnBSUz1kIXHtLIXrElGotd9Ft/U47W6DTqB4qVnOV31j1MocWhY0tYVzzUSt8HP2Me
         vorv6oR4dKN/hJMXllklIjqj4l6t3s89QdbBckwwOaGhmmvyeeXBWxbN+BytgCHSWXKr
         mmEkIO7msvGOc035MB/vOrOEHhpTThY+fpJZDvAbgRWNUiZVYVHAORlpQBdmvgQY3JKg
         dTu27Qq0AWyJaioCmNoI+DmenhTzty+vzEblqijk245a0w8iXjouKo/6msomd14Qn5xh
         gBwA==
X-Gm-Message-State: AOAM532L/tsTyTcVuUF/S9g8ji5DNH2/82iLC9ozc29NeNURGxQpXXqT
        K3yHSoRorkJjhkhxLP43DrM7XI5yEYFf
X-Google-Smtp-Source: ABdhPJyB3wtOX9xa281yjX0idXO53Tyh6XK5JoI5qT6Zab+ZrxbjcpWzhxQjvGoXzDrg5s3l92IejlfUQFhd
Sender: "kyletso via sendgmr" <kyletso@kyletso.ntc.corp.google.com>
X-Received: from kyletso.ntc.corp.google.com ([2401:fa00:fc:202:5d70:9e45:7deb:72a7])
 (user=kyletso job=sendgmr) by 2002:a0c:eb4c:: with SMTP id
 c12mr11582424qvq.62.1612106346714; Sun, 31 Jan 2021 07:19:06 -0800 (PST)
Date:   Sun, 31 Jan 2021 23:18:32 +0800
In-Reply-To: <20210131151832.215931-1-kyletso@google.com>
Message-Id: <20210131151832.215931-4-kyletso@google.com>
Mime-Version: 1.0
References: <20210131151832.215931-1-kyletso@google.com>
X-Mailer: git-send-email 2.30.0.365.g02bc693789-goog
Subject: [PATCH v2 3/3] usb: typec: tcpm: Get Sink VDO from fwnode
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
Changes since v1:
- updated the commit message

 drivers/usb/typec/tcpm/tcpm.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 403a483645dd..84c8a52f8af1 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -5677,6 +5677,18 @@ static int tcpm_fw_get_caps(struct tcpm_port *port,
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
2.30.0.365.g02bc693789-goog

