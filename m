Return-Path: <linux-usb+bounces-4176-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1804F813E09
	for <lists+linux-usb@lfdr.de>; Fri, 15 Dec 2023 00:10:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C43E4282497
	for <lists+linux-usb@lfdr.de>; Thu, 14 Dec 2023 23:09:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95E966F638;
	Thu, 14 Dec 2023 23:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jEGT/yn1"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A2986E5BC
	for <linux-usb@vger.kernel.org>; Thu, 14 Dec 2023 23:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--rdbabiera.bounces.google.com
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-dbcca990ee9so77142276.0
        for <linux-usb@vger.kernel.org>; Thu, 14 Dec 2023 15:09:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1702595344; x=1703200144; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=vfkcsIGUZz4a/bF4oVMH6stRxCI85sZSJjZ8OU+jen4=;
        b=jEGT/yn1LXqMDmcXOdtUzX4jwWDpIhc+ftvds7+ZyYnitT64oC13GIA0TwYgPaC3TP
         OUnvhKzTENgALvHD78NQGZe0Aey7zOJxlqfVLZRyWuHt+m5bxjt6sMe2p09XXziyTF0/
         RJENZdEVrfwLn0wsaFT9yu/uwMkAzLMo8kYkriuO5zgqx3japAiL86gItnwDP4LNwpty
         bvs2z8L4QrEVSZEwMpaMdJPqKyxm6tJtW0kamWVdHWyEtY0AFSGOvxM4pZUsyzUAKNVx
         FoO6eVo7rc4j48J9ZCZXo7TmV9YLM8e7uiHTCxlowvTy4jEthBs/oWESquFGPIdwNKTl
         QIqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702595344; x=1703200144;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vfkcsIGUZz4a/bF4oVMH6stRxCI85sZSJjZ8OU+jen4=;
        b=lpS7JIfBh4ul6CDmHSR8GpPyPaNuHjAHk5M2K81G3n5pKGBBeMNf9BCUfoFI2hUNRs
         FMtfb9WC9lj+ODwKb066y4w/SU6V0Qy7DdCo4TuwFCy7zXmzylIi50/deH+X5+/ldH0c
         RVDRfEki9vW+nMVM0A3+HJfncJOkc8C40amPRkd2rNcTG3N4925qfVVZn4oktDuiyW+N
         /Lbw0AAwNf4Xpgbpgx7f3wg7zVyDfOf3L+B4Ms6heQQDcJAWkwdaEoTW/mgU+mv4yodS
         v+0GUbvFW2b545nb/3K9bDr0l3QSElU50k4g5QnyRlxys1MfpQUtZvRpGGlB8IT9iXw7
         5noQ==
X-Gm-Message-State: AOJu0YzREMeYfIPSGjP1PPDjjyJ36C6us0RIC6pZ7AF3KB2wAdMgh+gV
	/YBn+zq+ASUKjwvdrdD6ahTBBBoSgp8UPAk=
X-Google-Smtp-Source: AGHT+IHDk60QT82IiZxQds9z/0v5EZtS7YYuQdX3dztAbbnJCWi6KjG9YnsMVYc+hRFfUlOwNPrTJxWF7s6OlsA=
X-Received: from rdbabiera.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:18a8])
 (user=rdbabiera job=sendgmr) by 2002:a05:6902:52f:b0:db5:48c5:302e with SMTP
 id y15-20020a056902052f00b00db548c5302emr104615ybs.4.1702595344627; Thu, 14
 Dec 2023 15:09:04 -0800 (PST)
Date: Thu, 14 Dec 2023 23:08:47 +0000
In-Reply-To: <20231214230850.379863-14-rdbabiera@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20231214230850.379863-14-rdbabiera@google.com>
X-Developer-Key: i=rdbabiera@google.com; a=openpgp; fpr=639A331F1A21D691815CE090416E17CA2BBBD5C8
X-Developer-Signature: v=1; a=openpgp-sha256; l=4230; i=rdbabiera@google.com;
 h=from:subject; bh=0PjYQ1QVJhd/GxsHl3FYNUiOmNDgrgSNIbU0njX6Xao=;
 b=owGbwMvMwCFW0bfok0KS4TbG02pJDKnV3cz9Aaxyea+9D/CcLVo7Z3Fyx50bDJOPvvnlzW76V
 psvrm1yRykLgxgHg6yYIouuf57BjSupW+Zw1hjDzGFlAhnCwMUpABP5u5KR4cvjdgnG3dtObZzE
 z8A8ofrnbBVvltg/fnNZJ4bnVYroVzP8d7Ba0RP97ucD+4J/X4pNFLPjvGZy7I2Ui9k85ZAt03V nHgA=
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
Message-ID: <20231214230850.379863-17-rdbabiera@google.com>
Subject: [PATCH v2 03/12] usb: typec: tcpci: add cable_comm_capable attribute
From: RD Babiera <rdbabiera@google.com>
To: rdbabiera@google.com, heikki.krogerus@linux.intel.com, linux@roeck-us.net, 
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org
Cc: badhri@google.com, bryan.odonoghue@linaro.org, agross@kernel.org, 
	andersson@kernel.org, konrad.dybcio@linaro.org
Content-Type: text/plain; charset="UTF-8"

Add cable_comm_capable to tcpci_data for tcpci drivers to indicate that
the port tcpc is capable of communicating to cables over SOP. A
corresponding tcpci callback tcpci_cable_comm_capable returns this value.
The tcpm will primarily use this in later patches to determine if the port
can transmit and receive SOP' messages.

Maxim based tcpci drivers are capable of SOP' communication, so the
cable_comm_capable flag is set to true.

Signed-off-by: RD Babiera <rdbabiera@google.com>
---
Changes since v1:
* Moved tcpm_pd_receive changes to separate patch
---
 drivers/usb/typec/tcpm/tcpci.c            | 8 ++++++++
 drivers/usb/typec/tcpm/tcpci_maxim_core.c | 1 +
 include/linux/usb/tcpci.h                 | 3 +++
 include/linux/usb/tcpm.h                  | 4 ++++
 4 files changed, 16 insertions(+)

diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
index 0ee3e6e29bb1..1ededbcecc09 100644
--- a/drivers/usb/typec/tcpm/tcpci.c
+++ b/drivers/usb/typec/tcpm/tcpci.c
@@ -584,6 +584,13 @@ static int tcpci_pd_transmit(struct tcpc_dev *tcpc, enum tcpm_transmit_type type
 	return 0;
 }
 
+static bool tcpci_cable_comm_capable(struct tcpc_dev *tcpc)
+{
+	struct tcpci *tcpci = tcpc_to_tcpci(tcpc);
+
+	return tcpci->data->cable_comm_capable;
+}
+
 static int tcpci_init(struct tcpc_dev *tcpc)
 {
 	struct tcpci *tcpci = tcpc_to_tcpci(tcpc);
@@ -793,6 +800,7 @@ struct tcpci *tcpci_register_port(struct device *dev, struct tcpci_data *data)
 	tcpci->tcpc.enable_frs = tcpci_enable_frs;
 	tcpci->tcpc.frs_sourcing_vbus = tcpci_frs_sourcing_vbus;
 	tcpci->tcpc.set_partner_usb_comm_capable = tcpci_set_partner_usb_comm_capable;
+	tcpci->tcpc.cable_comm_capable = tcpci_cable_comm_capable;
 
 	if (tcpci->data->check_contaminant)
 		tcpci->tcpc.check_contaminant = tcpci_check_contaminant;
diff --git a/drivers/usb/typec/tcpm/tcpci_maxim_core.c b/drivers/usb/typec/tcpm/tcpci_maxim_core.c
index 7fb966fd639b..7b2d4e6e52a2 100644
--- a/drivers/usb/typec/tcpm/tcpci_maxim_core.c
+++ b/drivers/usb/typec/tcpm/tcpci_maxim_core.c
@@ -478,6 +478,7 @@ static int max_tcpci_probe(struct i2c_client *client)
 	chip->data.vbus_vsafe0v = true;
 	chip->data.set_partner_usb_comm_capable = max_tcpci_set_partner_usb_comm_capable;
 	chip->data.check_contaminant = max_tcpci_check_contaminant;
+	chip->data.cable_comm_capable = true;
 
 	max_tcpci_init_regs(chip);
 	chip->tcpci = tcpci_register_port(chip->dev, &chip->data);
diff --git a/include/linux/usb/tcpci.h b/include/linux/usb/tcpci.h
index 467e8045e9f8..1d0b849defd0 100644
--- a/include/linux/usb/tcpci.h
+++ b/include/linux/usb/tcpci.h
@@ -198,12 +198,15 @@ struct tcpci;
  *		Chip level drivers are expected to check for contaminant and call
  *		tcpm_clean_port when the port is clean to put the port back into
  *		toggling state.
+ * @cable_comm_capable
+ *		optional; Set when TCPC can communicate with cable plugs over SOP'
  */
 struct tcpci_data {
 	struct regmap *regmap;
 	unsigned char TX_BUF_BYTE_x_hidden:1;
 	unsigned char auto_discharge_disconnect:1;
 	unsigned char vbus_vsafe0v:1;
+	unsigned char cable_comm_capable:1;
 
 	int (*init)(struct tcpci *tcpci, struct tcpci_data *data);
 	int (*set_vconn)(struct tcpci *tcpci, struct tcpci_data *data,
diff --git a/include/linux/usb/tcpm.h b/include/linux/usb/tcpm.h
index 65fac5e1f317..430fa3ec69bb 100644
--- a/include/linux/usb/tcpm.h
+++ b/include/linux/usb/tcpm.h
@@ -119,6 +119,9 @@ enum tcpm_transmit_type {
  *		at the end of the deboumce period or when the port is still
  *		toggling. Chip level drivers are expected to check for contaminant
  *		and call tcpm_clean_port when the port is clean.
+ * @cable_comm_capable
+ *		Optional; Returns whether cable communication over SOP' is supported
+ *		by the tcpc
  */
 struct tcpc_dev {
 	struct fwnode_handle *fwnode;
@@ -154,6 +157,7 @@ struct tcpc_dev {
 	bool (*is_vbus_vsafe0v)(struct tcpc_dev *dev);
 	void (*set_partner_usb_comm_capable)(struct tcpc_dev *dev, bool enable);
 	void (*check_contaminant)(struct tcpc_dev *dev);
+	bool (*cable_comm_capable)(struct tcpc_dev *dev);
 };
 
 struct tcpm_port;
-- 
2.43.0.472.g3155946c3a-goog


