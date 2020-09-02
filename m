Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B7CF25A735
	for <lists+linux-usb@lfdr.de>; Wed,  2 Sep 2020 09:59:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726927AbgIBH6z (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 2 Sep 2020 03:58:55 -0400
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:51547 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726183AbgIBH6w (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 2 Sep 2020 03:58:52 -0400
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 0827m1Eg009073;
        Wed, 2 Sep 2020 09:57:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=8C43QyHOLftUsfDVTeWAc7KU52Huh5OjUoVIJgaRBEI=;
 b=AK7y+EDSAg72d9EN+IIcPCq552O3b4M4ElF+lWUZdteN3cwG6/HofskfE/vaSNgru0RO
 OIzC4b8seJcXVPmRWhaj1wD6L+JXcfa3nJPhEE7t/K5GLtlsezKTzqaCL5oD+YvMcXyj
 onbS71/Uj1u+9uW5doG1C3Iw0CcuzIBevw64DNGYkHmKQS8tqUVd2WF08EET8Z+pn2Kd
 upcxIvtwFBUpAiESgH9U0bAesTcRCIYn/FA1P5SdcFoSMNDTyIKowJaZjl8jvLzlvsQe
 ZdyRx5oP/pvEpuhqWPct3u1wnKM9gLlFqOVVVJ2yIR8AJW28iQAhpkJ6/uwCMTVYqGlP zw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 337cg1m6dy-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 02 Sep 2020 09:57:17 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8DF9F100038;
        Wed,  2 Sep 2020 09:57:17 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4DC7E212FB9;
        Wed,  2 Sep 2020 09:57:17 +0200 (CEST)
Received: from localhost (10.75.127.45) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 2 Sep 2020 09:57:16
 +0200
From:   Amelie Delaunay <amelie.delaunay@st.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Russell King <linux@armlinux.org.uk>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
CC:     <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-usb@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        Amelie Delaunay <amelie.delaunay@st.com>,
        Fabrice Gasnier <fabrice.gasnier@st.com>
Subject: [RESEND PATCH v2 2/6] usb: typec: add typec_find_pwr_opmode
Date:   Wed, 2 Sep 2020 09:57:03 +0200
Message-ID: <20200902075707.9052-3-amelie.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200902075707.9052-1-amelie.delaunay@st.com>
References: <20200902075707.9052-1-amelie.delaunay@st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG3NODE1.st.com (10.75.127.7) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-09-02_03:2020-09-02,2020-09-02 signatures=0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This patch adds a function that converts power operation mode string into
power operation mode value.

It is useful to configure power operation mode through device tree
property, as power capabilities may be linked to hardware design.

Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
---
No changes in v2.
---
 drivers/usb/typec/class.c | 15 +++++++++++++++
 include/linux/usb/typec.h |  1 +
 2 files changed, 16 insertions(+)

diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index 02655694f200..35eec707cb51 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -1448,6 +1448,21 @@ void typec_set_pwr_opmode(struct typec_port *port,
 }
 EXPORT_SYMBOL_GPL(typec_set_pwr_opmode);
 
+/**
+ * typec_find_pwr_opmode - Get the typec power operation mode capability
+ * @name: power operation mode string
+ *
+ * This routine is used to find the typec_pwr_opmode by its string @name.
+ *
+ * Returns typec_pwr_opmode if success, otherwise negative error code.
+ */
+int typec_find_pwr_opmode(const char *name)
+{
+	return match_string(typec_pwr_opmodes,
+			    ARRAY_SIZE(typec_pwr_opmodes), name);
+}
+EXPORT_SYMBOL_GPL(typec_find_pwr_opmode);
+
 /**
  * typec_find_orientation - Convert orientation string to enum typec_orientation
  * @name: Orientation string
diff --git a/include/linux/usb/typec.h b/include/linux/usb/typec.h
index 9cb1bec94b71..6be558045942 100644
--- a/include/linux/usb/typec.h
+++ b/include/linux/usb/typec.h
@@ -268,6 +268,7 @@ int typec_set_mode(struct typec_port *port, int mode);
 
 void *typec_get_drvdata(struct typec_port *port);
 
+int typec_find_pwr_opmode(const char *name);
 int typec_find_orientation(const char *name);
 int typec_find_port_power_role(const char *name);
 int typec_find_power_role(const char *name);
-- 
2.17.1

