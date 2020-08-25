Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 812E8251084
	for <lists+linux-usb@lfdr.de>; Tue, 25 Aug 2020 06:23:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728603AbgHYEXr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 25 Aug 2020 00:23:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728498AbgHYEWl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 25 Aug 2020 00:22:41 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD17EC0613ED
        for <linux-usb@vger.kernel.org>; Mon, 24 Aug 2020 21:22:40 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id a5so13305939ybh.3
        for <linux-usb@vger.kernel.org>; Mon, 24 Aug 2020 21:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=0dZapQdAtC5VdVTKkYzxbs06O/e7miNf9pUPYlnZYxc=;
        b=SR8bV9aHZi3LpVJCd3ZaaayHE1IvEYoeHSSh+5U7zZema8WmAIRsED0y24i357zAh3
         x9UEJGz4n1Yl85yVLI/oPIO3LA2OhftrkwEpxD0blcFkHq/dCnxoCGWGoC0Cski5gPrM
         waJUe+sZQGL/9Azz8RVGiN0xhrrONi/jqrjlLdolRNlLm97fSkeEmyXU/7MvoQ1kjRon
         UPFjJ9068cz656Xzr92H71s/XfRmEE2rs2YpZNQv5xzVlPM9HzhmMe+1HnnpB21shOqQ
         vj4FQzKODvOCbt0UifK7Qmt1EN7PRVwkVVBh5DEuou/Dm6e6DZWKTWEtIKzeEwkWiI+r
         L01w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=0dZapQdAtC5VdVTKkYzxbs06O/e7miNf9pUPYlnZYxc=;
        b=ikpMlC76uu0Zl/Vt6lVbUwGBzt/ZKWBbAKC3hihOHn+Q3AJyBZF0LiQPyoDAGTe/LR
         AyjjKiME9gVBzex4XbKCCaB6Mc6ch3e+K5W4x3P4jQPTMnCyL/+T16HPyAVqiAkzJIKW
         cVTBXB+jJyxU9I5REiUjMvVrgLYl+fTHgI6majK5tjzYJs16XvSTZTkJD9DynT1UnyoQ
         /wkMsKkxd4vtkOZh/425BvNCb3XSlJQpP2DeI8AlB+r/jfyTJd42iKSRDR99FxSC4pRX
         uqJFCzysv1KNBUeukYioQg6AJ0JZHobviFIQZp9mjHBRB585E26xKyBZYeU2gi24hzur
         LKhA==
X-Gm-Message-State: AOAM533/2DPiYsa4z2uy66lGmgaJXNHj799HPAswTvykNi4W6e04kLS4
        i4TWKDfk2bJIHyYQ3SBAdbdayIBRwVE=
X-Google-Smtp-Source: ABdhPJxEJTTEQnr7/U15XqRjhIF5ahbOmYBlRNAKXqXmejuNOHs/wA6XsbCZhbPFLzBLltmwJQRygS4SHho=
X-Received: from badhri.mtv.corp.google.com ([2620:15c:211:1:f292:1cff:fee0:66cf])
 (user=badhri job=sendgmr) by 2002:a25:d8d4:: with SMTP id p203mr11208201ybg.289.1598329360044;
 Mon, 24 Aug 2020 21:22:40 -0700 (PDT)
Date:   Mon, 24 Aug 2020 21:22:01 -0700
In-Reply-To: <20200825042210.300632-1-badhri@google.com>
Message-Id: <20200825042210.300632-6-badhri@google.com>
Mime-Version: 1.0
References: <20200825042210.300632-1-badhri@google.com>
X-Mailer: git-send-email 2.28.0.297.g1956fa8f8d-goog
Subject: [PATCH 05/14 v5] usb: typec: tcpci: Add set_vbus tcpci callback
From:   Badhri Jagan Sridharan <badhri@google.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Badhri Jagan Sridharan <badhri@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

set_vbus callback allows TCPC which are TCPCI based, however,
does not support turning on sink and source mode through
Command.SinkVbus and Command.SourceVbusDefaultVoltage.

Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
---
 drivers/usb/typec/tcpm/tcpci.c | 7 +++++++
 drivers/usb/typec/tcpm/tcpci.h | 1 +
 2 files changed, 8 insertions(+)

diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
index 7b7991c8ac87..89d28e3fbee8 100644
--- a/drivers/usb/typec/tcpm/tcpci.c
+++ b/drivers/usb/typec/tcpm/tcpci.c
@@ -328,6 +328,13 @@ static int tcpci_set_vbus(struct tcpc_dev *tcpc, bool source, bool sink)
 	struct tcpci *tcpci = tcpc_to_tcpci(tcpc);
 	int ret;
 
+	if (tcpci->data->set_vbus) {
+		ret = tcpci->data->set_vbus(tcpci, tcpci->data, source, sink);
+		/* Bypass when ret > 0 */
+		if (ret != 0)
+			return ret < 0 ? ret : 0;
+	}
+
 	/* Disable both source and sink first before enabling anything */
 
 	if (!source) {
diff --git a/drivers/usb/typec/tcpm/tcpci.h b/drivers/usb/typec/tcpm/tcpci.h
index 04c49a0b0368..4d441bdf24d5 100644
--- a/drivers/usb/typec/tcpm/tcpci.h
+++ b/drivers/usb/typec/tcpm/tcpci.h
@@ -144,6 +144,7 @@ struct tcpci_data {
 			 bool enable);
 	int (*start_drp_toggling)(struct tcpci *tcpci, struct tcpci_data *data,
 				  enum typec_cc_status cc);
+	int (*set_vbus)(struct tcpci *tcpci, struct tcpci_data *data, bool source, bool sink);
 };
 
 struct tcpci *tcpci_register_port(struct device *dev, struct tcpci_data *data);
-- 
2.28.0.297.g1956fa8f8d-goog

