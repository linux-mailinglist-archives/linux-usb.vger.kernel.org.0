Return-Path: <linux-usb+bounces-14589-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E33F796A45B
	for <lists+linux-usb@lfdr.de>; Tue,  3 Sep 2024 18:31:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9AF582876E6
	for <lists+linux-usb@lfdr.de>; Tue,  3 Sep 2024 16:31:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0511618BBB0;
	Tue,  3 Sep 2024 16:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="julXsxfP"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6618E18C330
	for <linux-usb@vger.kernel.org>; Tue,  3 Sep 2024 16:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725381049; cv=none; b=d2F5wLQP5pqjABhy7K7Xklxfpkl4e4RYzufEoH5oZUt1WsaPoDMxBHNTkd5EPK4OsVfhPw1pfAbZ4Q2HpXuuNRBPJjfK1TE/EYhP+4awD7jMI9+lKfs6b481XOEqUz6fRFnr1RrR8z6khvHxPM09VhYkNPZhC0J2Kh9VzEve8aE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725381049; c=relaxed/simple;
	bh=mCdGYWNHHO/tbQlNcFfhMCqSW2ANKpTEqGnHcisueOA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=i9/8JLCxRe0ythL1HkjCx0gtg1tSSJq2+zQtaUJ1ZXjHK8eDiPHXjT1bmPXwOnNa1nlQ3P2FOY1RNrknHIfe4Sn2jdDavyMZeDRXXg1iJNLu/mhc5aFUJZdccxLaEIs6C0H/hdkSvErN57dc25zFPH230OE0YrUkh3boug2JDsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=julXsxfP; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a7a843bef98so575341266b.2
        for <linux-usb@vger.kernel.org>; Tue, 03 Sep 2024 09:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1725381045; x=1725985845; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NxcV//IAhkQd7LQcdadk+UOgpPMTX9FwkzJ2LjdNqvI=;
        b=julXsxfPrRIw8ApPgejgcqTwKoCf4D0YLNFvNIc9j4eh2sb/SRavU4MpK2pP0aEB8u
         OZM0mulMQobFwCKMBG1v8t+s9/BfXdxZBD19ANLRdas2AfGhaZoOwmHycH76i+DbcV/r
         f386SJYrp6nqo0ItR3cCpZ3++6nfoJ1qt8Gac=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725381045; x=1725985845;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NxcV//IAhkQd7LQcdadk+UOgpPMTX9FwkzJ2LjdNqvI=;
        b=sLWmY1qMRNoOV8HiVDPoMSMVi2I1CxS4LZADeBcu3QhLJUxq539gP5X0/LoIgLj00+
         EcocJNGnYrbxo5m2hpcS1mhnMRpiE+AlA5PXW981PNtceDup9cT67U/6lk8k4k/I66ee
         c1EqKLHZZXMiA49belqFLzsY8napFqugpaVphYSlzVK9jowPolie5Vjns8xOlmmdzDWu
         nyGDfbTkpaFi6NvefGP48TaKgDyIP3EeNsD9ki56JZkR8B6ODbxs5Q+/CSI4GLEOE+60
         Il8b9eSA/Z03MCH1JkYDr2A8zYi/jdHsiSm9aOiI0UcJkcE7rb2GxmySpybKjDE4jhzN
         0lnA==
X-Forwarded-Encrypted: i=1; AJvYcCWblJw1JdwUl2DU6NaOEQCQ2eHX1AVWnklG0P1ZoQR0MAlZia5vdnuCDrstRr2gyV7FjfoxS5P7ao8=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywsg5wCnNSurxmoTVP5KY048oZOwmGmWUh1FQ0Okts0zyt8wiJi
	JrFvE+7rbWtnGoJ5bs9jcZF0u+rVwvM5nb4JuBgHvn58cBLBvuju2/B83J0x
X-Google-Smtp-Source: AGHT+IG2Tn7zjsx8akiIsUo61+AjmFBG9qt+248I2jRzUoxenig7hW6Nk5ig2ktr0aRuwtQ4MIykPg==
X-Received: by 2002:a17:907:d08:b0:a86:8f32:3a68 with SMTP id a640c23a62f3a-a89d879c0femr853999866b.37.1725381044254;
        Tue, 03 Sep 2024 09:30:44 -0700 (PDT)
Received: from ukaszb-ng.c.googlers.com.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8989196bc4sm700685866b.125.2024.09.03.09.30.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 09:30:42 -0700 (PDT)
From: =?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lee Jones <lee@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>
Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Pavan Holla <pholla@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Subject: [PATCH v5 6/8] usb: typec: cros_ec_ucsi: Add netlink
Date: Tue,  3 Sep 2024 16:30:31 +0000
Message-ID: <20240903163033.3170815-7-ukaszb@chromium.org>
X-Mailer: git-send-email 2.46.0.469.g59c65b2a67-goog
In-Reply-To: <20240903163033.3170815-1-ukaszb@chromium.org>
References: <20240903163033.3170815-1-ukaszb@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add netlink to ChromeOS UCSI driver to allow forwarding
of UCSI messages to userspace for debugging and testing
purposes.

Signed-off-by: Łukasz Bartosik <ukaszb@chromium.org>
---
 MAINTAINERS                                   |  4 +-
 drivers/usb/typec/ucsi/Makefile               |  4 +-
 .../{cros_ec_ucsi.c => cros_ec_ucsi_main.c}   | 66 +++++++++++++-
 drivers/usb/typec/ucsi/cros_ec_ucsi_nl.c      | 87 +++++++++++++++++++
 drivers/usb/typec/ucsi/cros_ec_ucsi_nl.h      | 52 +++++++++++
 5 files changed, 209 insertions(+), 4 deletions(-)
 rename drivers/usb/typec/ucsi/{cros_ec_ucsi.c => cros_ec_ucsi_main.c} (79%)
 create mode 100644 drivers/usb/typec/ucsi/cros_ec_ucsi_nl.c
 create mode 100644 drivers/usb/typec/ucsi/cros_ec_ucsi_nl.h

diff --git a/MAINTAINERS b/MAINTAINERS
index d084f32208f0..2afb406a24ce 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5305,7 +5305,9 @@ M:	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
 M:	Łukasz Bartosik <ukaszb@chromium.org>
 L:	chrome-platform@lists.linux.dev
 S:	Maintained
-F:	drivers/usb/typec/ucsi/cros_ec_ucsi.c
+F:	drivers/usb/typec/ucsi/cros_ec_ucsi_main.c
+F:	drivers/usb/typec/ucsi/cros_ec_ucsi_nl.c
+F:	drivers/usb/typec/ucsi/cros_ec_ucsi_nl.h
 F:	drivers/usb/typec/ucsi/cros_ec_ucsi_trace.h
 
 CHRONTEL CH7322 CEC DRIVER
diff --git a/drivers/usb/typec/ucsi/Makefile b/drivers/usb/typec/ucsi/Makefile
index be98a879104d..82d960394c39 100644
--- a/drivers/usb/typec/ucsi/Makefile
+++ b/drivers/usb/typec/ucsi/Makefile
@@ -21,5 +21,7 @@ obj-$(CONFIG_UCSI_ACPI)			+= ucsi_acpi.o
 obj-$(CONFIG_UCSI_CCG)			+= ucsi_ccg.o
 obj-$(CONFIG_UCSI_STM32G0)		+= ucsi_stm32g0.o
 obj-$(CONFIG_UCSI_PMIC_GLINK)		+= ucsi_glink.o
-obj-$(CONFIG_CROS_EC_UCSI)		+= cros_ec_ucsi.o
 obj-$(CONFIG_UCSI_LENOVO_YOGA_C630)	+= ucsi_yoga_c630.o
+
+obj-$(CONFIG_CROS_EC_UCSI)		+= cros_ec_ucsi.o
+cros_ec_ucsi-y				:= cros_ec_ucsi_main.o cros_ec_ucsi_nl.o
diff --git a/drivers/usb/typec/ucsi/cros_ec_ucsi.c b/drivers/usb/typec/ucsi/cros_ec_ucsi_main.c
similarity index 79%
rename from drivers/usb/typec/ucsi/cros_ec_ucsi.c
rename to drivers/usb/typec/ucsi/cros_ec_ucsi_main.c
index 6e020b7ed352..85edfa95782a 100644
--- a/drivers/usb/typec/ucsi/cros_ec_ucsi.c
+++ b/drivers/usb/typec/ucsi/cros_ec_ucsi_main.c
@@ -19,6 +19,7 @@
 #define CREATE_TRACE_POINTS
 #include "ucsi.h"
 #include "cros_ec_ucsi_trace.h"
+#include "cros_ec_ucsi_nl.h"
 
 /*
  * Maximum size in bytes of a UCSI message between AP and EC
@@ -43,6 +44,43 @@ struct cros_ucsi_data {
 	unsigned long flags;
 };
 
+/*
+ * When set to true the cros_ec_ucsi driver will forward all UCSI messages
+ * exchanged between OPM <-> PPM to userspace through netlink
+ */
+static bool is_ap_sniffer_en;
+
+static ssize_t enable_ap_sniffer_show(struct device *dev,
+				      struct device_attribute *attr,
+				      char *buf)
+{
+	return sprintf(buf, "%d\n", is_ap_sniffer_en);
+}
+
+static ssize_t enable_ap_sniffer_store(struct device *dev,
+				       struct device_attribute *attr,
+				       const char *buf, size_t count)
+{
+	u8 value;
+
+	if (kstrtou8(buf, 0, &value))
+		return -EINVAL;
+
+	is_ap_sniffer_en = value ? 1 : 0;
+	return count;
+}
+
+static DEVICE_ATTR_RW(enable_ap_sniffer);
+
+static struct attribute *cros_ec_ucsi_attrs[] = {
+	&dev_attr_enable_ap_sniffer.attr,
+	NULL
+};
+
+static const struct attribute_group cros_ec_ucsi_attrs_grp = {
+	.attrs = cros_ec_ucsi_attrs,
+};
+
 static int cros_ucsi_read(struct ucsi *ucsi, unsigned int offset, void *val,
 			  size_t val_len)
 {
@@ -65,6 +103,9 @@ static int cros_ucsi_read(struct ucsi *ucsi, unsigned int offset, void *val,
 		return ret;
 	}
 
+	if (is_ap_sniffer_en)
+		nl_cros_ec_bcast_msg(NL_CROS_EC_TO_PPM, NL_CROS_EC_RD, offset,
+				     val, val_len);
 	trace_cros_ec_opm_to_ppm_rd(offset, val, val_len);
 	return 0;
 }
@@ -106,6 +147,9 @@ static int cros_ucsi_async_control(struct ucsi *ucsi, u64 cmd)
 		return ret;
 	}
 
+	if (is_ap_sniffer_en)
+		nl_cros_ec_bcast_msg(NL_CROS_EC_TO_PPM, NL_CROS_EC_WR,
+				     req->offset, (u8 *) &cmd, sizeof(cmd));
 	trace_cros_ec_opm_to_ppm_wr(req->offset, &cmd, sizeof(cmd));
 	return 0;
 }
@@ -149,6 +193,8 @@ static void cros_ucsi_work(struct work_struct *work)
 	struct cros_ucsi_data *udata = container_of(work, struct cros_ucsi_data, work);
 	u32 cci;
 
+	if (is_ap_sniffer_en)
+		nl_cros_ec_bcast_msg(NL_CROS_EC_TO_OPM, 0, 0, NULL, 0);
 	trace_cros_ec_ppm_to_opm(0);
 
 	if (cros_ucsi_read(udata->ucsi, UCSI_CCI, &cci, sizeof(cci)))
@@ -234,13 +280,29 @@ static int cros_ucsi_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	ret = nl_cros_ec_register();
+	if (ret) {
+		dev_err(dev, "failed to register netlink: error=%d", ret);
+		cros_ucsi_destroy(udata);
+		return ret;
+	}
+
+	ret = sysfs_create_group(&dev->kobj, &cros_ec_ucsi_attrs_grp);
+	if (ret) {
+		dev_err(dev, "failed to register sysfs group: error=%d", ret);
+		cros_ucsi_destroy(udata);
+		return ret;
+	}
+
 	return 0;
 }
 
-static void cros_ucsi_remove(struct platform_device *dev)
+static void cros_ucsi_remove(struct platform_device *pdev)
 {
-	struct cros_ucsi_data *udata = platform_get_drvdata(dev);
+	struct cros_ucsi_data *udata = platform_get_drvdata(pdev);
 
+	sysfs_remove_group(&pdev->dev.kobj, &cros_ec_ucsi_attrs_grp);
+	nl_cros_ec_unregister();
 	ucsi_unregister(udata->ucsi);
 	cros_ucsi_destroy(udata);
 }
diff --git a/drivers/usb/typec/ucsi/cros_ec_ucsi_nl.c b/drivers/usb/typec/ucsi/cros_ec_ucsi_nl.c
new file mode 100644
index 000000000000..360568044891
--- /dev/null
+++ b/drivers/usb/typec/ucsi/cros_ec_ucsi_nl.c
@@ -0,0 +1,87 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <net/genetlink.h>
+#include "cros_ec_ucsi_nl.h"
+
+static const struct genl_multicast_group nl_mc_grps[] = {
+	{ .name = NL_CROS_EC_MC_GRP_NAME },
+};
+
+static struct genl_family genl_fam = {
+	.name	  = NL_CROS_EC_NAME,
+	.version  = NL_CROS_EC_VER,
+	.maxattr  = NL_CROS_EC_A_MAX,
+	.mcgrps	  = nl_mc_grps,
+	.n_mcgrps = ARRAY_SIZE(nl_mc_grps),
+};
+
+int nl_cros_ec_register(void)
+{
+	return genl_register_family(&genl_fam);
+}
+
+void nl_cros_ec_unregister(void)
+{
+	genl_unregister_family(&genl_fam);
+}
+
+int nl_cros_ec_bcast_msg(enum nl_cros_ec_msg_dir dir,
+			 enum nl_cros_ec_cmd_type cmd_type,
+			 u16 offset, const u8 *payload, size_t msg_size)
+{
+	struct timespec64 ts;
+	struct sk_buff *skb;
+	int ret = -ENOMEM;
+	void *hdr;
+
+	skb = genlmsg_new(NLMSG_DEFAULT_SIZE, GFP_KERNEL);
+	if (!skb)
+		return -ENOMEM;
+
+	hdr = genlmsg_put(skb, 0, 0, &genl_fam, 0, NL_CROS_EC_C_UCSI);
+	if (!hdr)
+		goto free_mem;
+
+	ret = nla_put_u8(skb, NL_CROS_EC_A_SRC, NL_CROS_EC_AP);
+	if (ret)
+		goto cancel;
+
+	ret = nla_put_u8(skb, NL_CROS_EC_A_DIR, dir);
+	if (ret)
+		goto cancel;
+
+	ret = nla_put_u16(skb, NL_CROS_EC_A_OFFSET, offset);
+	if (ret)
+		goto cancel;
+
+	ret = nla_put_u8(skb, NL_CROS_EC_A_CMD_TYPE, cmd_type);
+	if (ret)
+		goto cancel;
+
+	ktime_get_ts64(&ts);
+	ret = nla_put_u32(skb, NL_CROS_EC_A_TSTAMP_SEC, (u32)ts.tv_sec);
+	if (ret)
+		goto cancel;
+
+	ret = nla_put_u32(skb, NL_CROS_EC_A_TSTAMP_USEC,
+			  (u32)(ts.tv_nsec/1000));
+	if (ret)
+		goto cancel;
+
+	ret = nla_put(skb, NL_CROS_EC_A_PAYLOAD, msg_size, payload);
+	if (ret)
+		goto cancel;
+
+	genlmsg_end(skb, hdr);
+
+	ret = genlmsg_multicast(&genl_fam, skb, 0, 0, GFP_KERNEL);
+	if (ret && ret != -ESRCH)
+		goto free_mem;
+
+	return 0;
+cancel:
+	genlmsg_cancel(skb, hdr);
+free_mem:
+	nlmsg_free(skb);
+	return ret;
+}
diff --git a/drivers/usb/typec/ucsi/cros_ec_ucsi_nl.h b/drivers/usb/typec/ucsi/cros_ec_ucsi_nl.h
new file mode 100644
index 000000000000..c6192d8ace56
--- /dev/null
+++ b/drivers/usb/typec/ucsi/cros_ec_ucsi_nl.h
@@ -0,0 +1,52 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __DRIVER_USB_TYPEC_CROS_EC_UCSI_NL_H
+#define __DRIVER_USB_TYPEC_CROS_EC_UCSI_NL_H
+
+#define NL_CROS_EC_NAME "cros_ec_ucsi"
+#define NL_CROS_EC_VER 1
+#define NL_CROS_EC_MC_GRP_NAME "cros_ec_ucsi_mc"
+
+/* attributes */
+enum nl_cros_ec_attrs {
+	NL_CROS_EC_A_SRC,
+	NL_CROS_EC_A_DIR,
+	NL_CROS_EC_A_OFFSET,
+	NL_CROS_EC_A_CMD_TYPE,
+	NL_CROS_EC_A_TSTAMP_SEC,
+	NL_CROS_EC_A_TSTAMP_USEC,
+	NL_CROS_EC_A_PAYLOAD,
+	NL_CROS_EC_A_MAX
+};
+
+enum nl_cros_ec_cmds {
+	NL_CROS_EC_C_UCSI,
+	NL_CROS_EC_C_MAX
+};
+
+/* where message was captured - EC or AP */
+enum nl_cros_ec_src {
+	NL_CROS_EC_AP,
+	NL_CROS_EC_EC
+};
+
+/* message destination */
+enum nl_cros_ec_msg_dir {
+	NL_CROS_EC_TO_PPM,
+	NL_CROS_EC_TO_OPM,
+	NL_CROS_EC_TO_LPM
+};
+
+/* command type - read or write */
+enum nl_cros_ec_cmd_type {
+	NL_CROS_EC_RD,
+	NL_CROS_EC_WR
+};
+
+int nl_cros_ec_register(void);
+void nl_cros_ec_unregister(void);
+int nl_cros_ec_bcast_msg(enum nl_cros_ec_msg_dir dir,
+			 enum nl_cros_ec_cmd_type cmd_type,
+			 u16 offset, const u8 *payload, size_t msg_size);
+
+#endif /* __DRIVER_USB_TYPEC_CROS_EC_UCSI_NL_H */
-- 
2.46.0.469.g59c65b2a67-goog


