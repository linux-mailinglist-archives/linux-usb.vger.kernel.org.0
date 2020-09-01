Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 841FC2585F7
	for <lists+linux-usb@lfdr.de>; Tue,  1 Sep 2020 05:01:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728015AbgIADA7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 31 Aug 2020 23:00:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726771AbgIAC7g (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 31 Aug 2020 22:59:36 -0400
Received: from mail-qv1-xf49.google.com (mail-qv1-xf49.google.com [IPv6:2607:f8b0:4864:20::f49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2550BC061366
        for <linux-usb@vger.kernel.org>; Mon, 31 Aug 2020 19:59:36 -0700 (PDT)
Received: by mail-qv1-xf49.google.com with SMTP id y2so4184108qvs.14
        for <linux-usb@vger.kernel.org>; Mon, 31 Aug 2020 19:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=qMuz0tDiyM6xgc3F2ycLbUd+YSVfhp2If+qrKeRaQS0=;
        b=b+VstZsY60zzTJxDii/Ms+Dlf5sEAK5lchBEEqNdPfobP2ROiBQsdppnvVBMRrJbVJ
         7CHjktoiRw2rl+FM+rQiR8hhZ+5q2AMb8S9kX1E8P9ohiClY3cdaeIm6MkfgwTshGm48
         jnYx48Xg8KyR7Ze8pqhYWIDt4yPsSJeeiYrplXJZUO1XjT1L4qcX1wzMPGXH4BXcEkCn
         CmwVR0nKKw3xNFiw59YQ05NpQLnpoxWPLYEsflPFIVa6yKTFYauSDIcRJVTgkqF7+wgp
         EaaWAYkqHLFW1dRnBFgTcEhhSqZLL8W0UxDRG+cmuMegJOAoB8sH8BTcs2gbBxupMuox
         1u3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=qMuz0tDiyM6xgc3F2ycLbUd+YSVfhp2If+qrKeRaQS0=;
        b=myu6Xb3AOVHJzrtdAJbjiFBwDQrQycUd0zH3vQB7m1rHz3raXphQyvHe2DPhm1Qiw3
         uTaJPB1FuvRL72+Xi2tAgS4NOvnEa0/6Aixug8tIawAIz6HBlLmhnD1/4suYr5eUK9U+
         8ltsVxTfJRTQZhIk692Q6A4sLNEb8W1MXIneQoFnyTmRBPyndu5yUpggX3iEPo7REqll
         btg+jIXBkE/X363R3Qt2WRiUgToZbbbSKXuZTOXGq/ZtbHb/PWzTetABjIpHyk10+S7C
         66XKyKpBJF0xPAfrmdA2VGR8xTgKxQyyisHlY7m0F8aN0R/pvXWJwK/mIb8AAiyYJx8x
         Ho0w==
X-Gm-Message-State: AOAM530w6CQO7+uQQXKduE1uWwNLQOe9w5UvjZy8dMiN6uFtRddqcG3X
        /IQF7VWgRqaKj4vYY9mj9W8qWinXoYA=
X-Google-Smtp-Source: ABdhPJxfycQ6HHOfI1C4Ie03dA4++YjSUdkJ/5TuMsEs71huC4DhP424xgCPeUEKy1R4J3E8SKcYKx8Tric=
X-Received: from badhri.mtv.corp.google.com ([2620:15c:211:1:f292:1cff:fee0:66cf])
 (user=badhri job=sendgmr) by 2002:a0c:a789:: with SMTP id v9mr1397617qva.2.1598929174616;
 Mon, 31 Aug 2020 19:59:34 -0700 (PDT)
Date:   Mon, 31 Aug 2020 19:59:15 -0700
In-Reply-To: <20200901025927.3596190-1-badhri@google.com>
Message-Id: <20200901025927.3596190-3-badhri@google.com>
Mime-Version: 1.0
References: <20200901025927.3596190-1-badhri@google.com>
X-Mailer: git-send-email 2.28.0.402.g5ffc5be6b7-goog
Subject: [PATCH v6 02/14] usb: typec: tcpci: Add support when hidden tx
 registers are inaccessible
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

TCPCI spec forbids direct access of TX_BUF_BYTE_x register.
The existing version of tcpci driver assumes that those registers
are directly addressible. Add support for tcpci chips which do
not support direct access to TX_BUF_BYTE_x registers. TX_BUF_BYTE_x
can only be accessed by I2C_WRITE_BYTE_COUNT.

Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
---
Changes since v1:
 - Refactored the code to check for TX_BUF_BYTE_x_hidden as suggested by
   Heikki.
 - Not formatting the tcpci_pd_transmit to follow the 100 character/line
   limit as suggested by Heikki. (Should be a separate change).
 - Changing patch version to v6 to fix version number confusion.
---
 drivers/usb/typec/tcpm/tcpci.c | 46 ++++++++++++++++++++++++++--------
 drivers/usb/typec/tcpm/tcpci.h |  8 ++++++
 2 files changed, 43 insertions(+), 11 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
index bd80e03b2b6f..7d36d5e2d3f7 100644
--- a/drivers/usb/typec/tcpm/tcpci.c
+++ b/drivers/usb/typec/tcpm/tcpci.c
@@ -330,23 +330,47 @@ static int tcpci_pd_transmit(struct tcpc_dev *tcpc,
 	int ret;
 
 	cnt = msg ? pd_header_cnt(header) * 4 : 0;
-	ret = regmap_write(tcpci->regmap, TCPC_TX_BYTE_CNT, cnt + 2);
-	if (ret < 0)
-		return ret;
+	/**
+	 * TCPCI spec forbids direct access of TCPC_TX_DATA.
+	 * But, since some of the chipsets offer this capability,
+	 * it's fair to support both.
+	 */
+	if (tcpci->data->TX_BUF_BYTE_x_hidden) {
+		u8 buf[TCPC_TRANSMIT_BUFFER_MAX_LEN] = {0,};
+		u8 pos = 0;
 
-	ret = tcpci_write16(tcpci, TCPC_TX_HDR, header);
-	if (ret < 0)
-		return ret;
+		/* Payload + header + TCPC_TX_BYTE_CNT */
+		buf[pos++] = cnt + 2;
+
+		if (msg)
+			memcpy(&buf[pos], &msg->header, sizeof(msg->header));
+
+		pos += sizeof(header);
 
-	if (cnt > 0) {
-		ret = regmap_raw_write(tcpci->regmap, TCPC_TX_DATA,
-				       &msg->payload, cnt);
+		if (cnt > 0)
+			memcpy(&buf[pos], msg->payload, cnt);
+
+		pos += cnt;
+		ret = regmap_raw_write(tcpci->regmap, TCPC_TX_BYTE_CNT, buf, pos);
+		if (ret < 0)
+			return ret;
+	} else {
+		ret = regmap_write(tcpci->regmap, TCPC_TX_BYTE_CNT, cnt + 2);
 		if (ret < 0)
 			return ret;
+
+		ret = tcpci_write16(tcpci, TCPC_TX_HDR, header);
+		if (ret < 0)
+			return ret;
+
+		if (cnt > 0) {
+			ret = regmap_raw_write(tcpci->regmap, TCPC_TX_DATA, &msg->payload, cnt);
+			if (ret < 0)
+				return ret;
+		}
 	}
 
-	reg = (PD_RETRY_COUNT << TCPC_TRANSMIT_RETRY_SHIFT) |
-		(type << TCPC_TRANSMIT_TYPE_SHIFT);
+	reg = (PD_RETRY_COUNT << TCPC_TRANSMIT_RETRY_SHIFT) | (type << TCPC_TRANSMIT_TYPE_SHIFT);
 	ret = regmap_write(tcpci->regmap, TCPC_TRANSMIT, reg);
 	if (ret < 0)
 		return ret;
diff --git a/drivers/usb/typec/tcpm/tcpci.h b/drivers/usb/typec/tcpm/tcpci.h
index fd26ca35814c..cf9d8b63adcb 100644
--- a/drivers/usb/typec/tcpm/tcpci.h
+++ b/drivers/usb/typec/tcpm/tcpci.h
@@ -128,9 +128,17 @@
 #define TCPC_VBUS_VOLTAGE_ALARM_HI_CFG		0x76
 #define TCPC_VBUS_VOLTAGE_ALARM_LO_CFG		0x78
 
+/* I2C_WRITE_BYTE_COUNT + 1 when TX_BUF_BYTE_x is only accessible I2C_WRITE_BYTE_COUNT */
+#define TCPC_TRANSMIT_BUFFER_MAX_LEN		31
+
+/*
+ * @TX_BUF_BYTE_x_hidden
+ *		optional; Set when TX_BUF_BYTE_x can only be accessed through I2C_WRITE_BYTE_COUNT.
+ */
 struct tcpci;
 struct tcpci_data {
 	struct regmap *regmap;
+	unsigned char TX_BUF_BYTE_x_hidden:1;
 	int (*init)(struct tcpci *tcpci, struct tcpci_data *data);
 	int (*set_vconn)(struct tcpci *tcpci, struct tcpci_data *data,
 			 bool enable);
-- 
2.28.0.402.g5ffc5be6b7-goog

