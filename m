Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2CE225106B
	for <lists+linux-usb@lfdr.de>; Tue, 25 Aug 2020 06:22:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726471AbgHYEWb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 25 Aug 2020 00:22:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725265AbgHYEWa (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 25 Aug 2020 00:22:30 -0400
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com [IPv6:2607:f8b0:4864:20::104a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15383C061574
        for <linux-usb@vger.kernel.org>; Mon, 24 Aug 2020 21:22:30 -0700 (PDT)
Received: by mail-pj1-x104a.google.com with SMTP id lx6so889975pjb.9
        for <linux-usb@vger.kernel.org>; Mon, 24 Aug 2020 21:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=uNM7HP/LHsK3vi9PvtdHxJ86dOAfeYqmzrZ0qZRLxlA=;
        b=kLvgRy07hQY2lFzW8fHlfXXMd+Cdx+25eTP3d2GAQaRmvrpEvr0iAFVsIyM6tdQzUG
         fEUK0gzn46C7cz3lOCBOpJEG17FJ/QjLLf1910ETwwZs1q9K767pm1R1eH6rypa3PQEp
         a0r1Sys7b8s83UyKlk8Gq4MWl2gJQVX8QPRPxlghpMYrA6BiO8cB4uolJpWH4hx036mY
         +mKRGeRc8gRUBQhgtQP7i1Bp8UK+GWO0/69lxHNwRpsvcRrom/zeJLCKBTCnADIxDPF+
         rm/iLdkxbk2V2xnx5aaRVvF8mZ2p9pwsE+LP5fRI1EHlZYZqbL9MDeALfyugt3HmeRTa
         rKcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=uNM7HP/LHsK3vi9PvtdHxJ86dOAfeYqmzrZ0qZRLxlA=;
        b=UuoqX4en2i0i/NcQ7zdLGK5u2RbH1sERpvEvJowDgsfzMrQWOrC8BWurirQMwAMdzc
         Awmw7EcLk5PGxd1BHv61N/8RWaL4EiDgBE8IOMVGHVQXbQG6VjdvQbGDUeOSxguyo/u2
         mlb4L6tvMOHxIz6Q9FH8EbQH539FMex7C0/Vu8/C2Wc+xBf7JW5qKfeOIvcz5mFeGmPX
         8QxnsOd///PKVcSCCkQkv0boN0rZeepmQzgQ1ayQqfKtlTNixMBwrtqO7OUZotTtCE6M
         8UqySMIcR5OoysOPUXVa8ysyD00+VR8tOV5n325dE0ndbNFQtm+JkgCj27PXZXh5p7cO
         IWKw==
X-Gm-Message-State: AOAM531m90+tDabDbSS3h7N6QL0HGU+QqJ9fCCndntXDXVB83gmO3tXU
        WbRfPsEcnLSpZKmNekzOx3W43L6CYTI=
X-Google-Smtp-Source: ABdhPJwgrbZbyUxmLVv4z18yXQbs+H+ZgJyhIt2GSckwXachV3QFr36xqqieA4TJVkGjje0KVF56fSqFqOQ=
X-Received: from badhri.mtv.corp.google.com ([2620:15c:211:1:f292:1cff:fee0:66cf])
 (user=badhri job=sendgmr) by 2002:a63:cd54:: with SMTP id a20mr5362196pgj.228.1598329349509;
 Mon, 24 Aug 2020 21:22:29 -0700 (PDT)
Date:   Mon, 24 Aug 2020 21:21:58 -0700
In-Reply-To: <20200825042210.300632-1-badhri@google.com>
Message-Id: <20200825042210.300632-3-badhri@google.com>
Mime-Version: 1.0
References: <20200825042210.300632-1-badhri@google.com>
X-Mailer: git-send-email 2.28.0.297.g1956fa8f8d-goog
Subject: [PATCH 02/14 v2] usb: typec: tcpci: Add support when hidden tx
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
 drivers/usb/typec/tcpm/tcpci.c | 49 +++++++++++++++++++++++++---------
 drivers/usb/typec/tcpm/tcpci.h |  8 ++++++
 2 files changed, 44 insertions(+), 13 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
index f57d91fd0e09..90d348caa6a8 100644
--- a/drivers/usb/typec/tcpm/tcpci.c
+++ b/drivers/usb/typec/tcpm/tcpci.c
@@ -320,8 +320,7 @@ static int tcpci_set_vbus(struct tcpc_dev *tcpc, bool source, bool sink)
 	return 0;
 }
 
-static int tcpci_pd_transmit(struct tcpc_dev *tcpc,
-			     enum tcpm_transmit_type type,
+static int tcpci_pd_transmit(struct tcpc_dev *tcpc, enum tcpm_transmit_type type,
 			     const struct pd_message *msg)
 {
 	struct tcpci *tcpci = tcpc_to_tcpci(tcpc);
@@ -330,23 +329,47 @@ static int tcpci_pd_transmit(struct tcpc_dev *tcpc,
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
+	if (!tcpci->data->TX_BUF_BYTE_x_hidden) {
+		ret = regmap_write(tcpci->regmap, TCPC_TX_BYTE_CNT, cnt + 2);
+		if (ret < 0)
+			return ret;
 
-	ret = tcpci_write16(tcpci, TCPC_TX_HDR, header);
-	if (ret < 0)
-		return ret;
+		ret = tcpci_write16(tcpci, TCPC_TX_HDR, header);
+		if (ret < 0)
+			return ret;
+
+		if (cnt > 0) {
+			ret = regmap_raw_write(tcpci->regmap, TCPC_TX_DATA, &msg->payload, cnt);
+			if (ret < 0)
+				return ret;
+		}
+	} else {
+		u8 buf[TCPC_TRANSMIT_BUFFER_MAX_LEN] = {0,};
+		u8 pos = 0;
+
+		/* Payload + header + TCPC_TX_BYTE_CNT */
+		buf[pos++] = cnt + 2;
+
+		if (msg)
+			memcpy(&buf[pos], &msg->header, sizeof(msg->header));
+
+		pos += sizeof(header);
+
+		if (cnt > 0)
+			memcpy(&buf[pos], msg->payload, cnt);
 
-	if (cnt > 0) {
-		ret = regmap_raw_write(tcpci->regmap, TCPC_TX_DATA,
-				       &msg->payload, cnt);
+		pos += cnt;
+		ret = regmap_raw_write(tcpci->regmap, TCPC_TX_BYTE_CNT, buf, pos);
 		if (ret < 0)
 			return ret;
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
2.28.0.297.g1956fa8f8d-goog

