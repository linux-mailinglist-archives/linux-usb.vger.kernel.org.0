Return-Path: <linux-usb+bounces-24954-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BEDDAE1DC5
	for <lists+linux-usb@lfdr.de>; Fri, 20 Jun 2025 16:47:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9CA884C0159
	for <lists+linux-usb@lfdr.de>; Fri, 20 Jun 2025 14:47:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42CAE29826C;
	Fri, 20 Jun 2025 14:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oss.cyber.gouv.fr header.i=@oss.cyber.gouv.fr header.b="Ueo9+v7g"
X-Original-To: linux-usb@vger.kernel.org
Received: from pf-012.whm.fr-par.scw.cloud (pf-012.whm.fr-par.scw.cloud [51.159.173.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D0AE2989B3;
	Fri, 20 Jun 2025 14:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.159.173.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750430797; cv=none; b=fkdbRqmSFSybbQFl6sTuzRZZwb3XHNajEdfGZCiwXGA9EDNaUr90fi/OXnoemN9+Yb3h5APzJ/13KX3Esh0LxsAwwmVJwtgXhQasSoqEZDTsU43XNA7QVSSZO0k9YpoHBtFet/gIxyupFwxmxs3Zk4csbsCIEGC9D2RGgBIcprM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750430797; c=relaxed/simple;
	bh=GRkb/qq4Wx8i38tcL0LlieTRN7w3kZ3wMHjvWqCaOU4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u4hMwVdFP1CxNd/WtKyYQgrjCidVb/r7jPG/4d/tTscUjRmTdqJeSPspae7pwvQcOQAmeYqIlk1l/J47Jc/BSOM6pAHDVdlWUcpCqAs+HbJ8F52FjTREC0wGNwMwsATVVdEf3eJyLVamrPXMKfZVOS0sg5NZBMI8hPKCQ4vDcPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.cyber.gouv.fr; spf=pass smtp.mailfrom=oss.cyber.gouv.fr; dkim=pass (2048-bit key) header.d=oss.cyber.gouv.fr header.i=@oss.cyber.gouv.fr header.b=Ueo9+v7g; arc=none smtp.client-ip=51.159.173.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.cyber.gouv.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.cyber.gouv.fr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=oss.cyber.gouv.fr; s=default; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Usx8V9NjoNpeamL3vdDd1X0UGwTUjb1xoGpBSE/UIcY=; b=Ueo9+v7g6rPPzUzSYF85wKRol8
	r9+mQ0C9PVcoC5V+26+PiXVcweDVF61IeVrUc2evC1Dq2yVTRMkngDFHlUGfHtHTJhzfVzWg0yS+i
	BdCetHT3eqJ8LT4A5WC0OglAgyFrO5r2zl2e5yM4zfkeH1CcEXZVPKzfFfWvGiIsAkHZutoWSCCsA
	M/wAP9zZvsQGSK4j5hTJywN0ZpMIPh7Pi7SirBAJAsZrIm3ArIynr93fc+w5pz1kKrKJJX/AJDGz9
	8KEMp4iL6rSFp2CKLDzWzH+kRS0HkIV7YEZwacCnsx6U3sa9g+Vwo02DW+8Z1bS1mm35NBWCNMQDa
	YLakarhw==;
Received: from laubervilliers-658-1-215-187.w90-63.abo.wanadoo.fr ([90.63.246.187]:43571 helo=[10.224.8.110])
	by pf-012.whm.fr-par.scw.cloud with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <nicolas.bouchinet@oss.cyber.gouv.fr>)
	id 1uSciZ-00000007rNQ-3MCS;
	Fri, 20 Jun 2025 16:27:45 +0200
From: nicolas.bouchinet@oss.cyber.gouv.fr
Date: Fri, 20 Jun 2025 16:27:16 +0200
Subject: [RFC PATCH 1/4] usb: core: Introduce netlink usb authentication
 policy engine
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250620-usb_authentication-v1-1-0d92261a5779@ssi.gouv.fr>
References: <20250620-usb_authentication-v1-0-0d92261a5779@ssi.gouv.fr>
In-Reply-To: <20250620-usb_authentication-v1-0-0d92261a5779@ssi.gouv.fr>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alan Stern <stern@rowland.harvard.edu>, 
 Kannappan R <r.kannappan@intel.com>, 
 Sabyrzhan Tasbolatov <snovitoll@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Stefan Eichenberger <stefan.eichenberger@toradex.com>, 
 Thomas Gleixner <tglx@linutronix.de>, Pawel Laszczak <pawell@cadence.com>, 
 Ma Ke <make_ruc2021@163.com>, Jeff Johnson <jeff.johnson@oss.qualcomm.com>, 
 Luc Bonnafoux <luc.bonnafoux@ssi.gouv.fr>, 
 Luc Bonnafoux <luc.bonnafoux@oss.cyber.gouv.fr>, 
 Nicolas Bouchinet <nicolas.bouchinet@ssi.gouv.fr>, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
X-Mailer: b4 0.14.2
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - pf-012.whm.fr-par.scw.cloud
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - oss.cyber.gouv.fr
X-Get-Message-Sender-Via: pf-012.whm.fr-par.scw.cloud: authenticated_id: nicolas.bouchinet@oss.cyber.gouv.fr
X-Authenticated-Sender: pf-012.whm.fr-par.scw.cloud: nicolas.bouchinet@oss.cyber.gouv.fr
X-Source: 
X-Source-Args: 
X-Source-Dir: 

From: Nicolas Bouchinet <nicolas.bouchinet@ssi.gouv.fr>

The usb authentication feature needs a policy engine in order to
authorize or deny usb devices based on a user defined policy.

In order to reduce the attack surface and in-kernel complexity, policy
management, crypto operations and complex parsing have been implemented
in userspace using the generic netlink API. The full authentication
protocol is kernel driven.

The following unicast netlink commands have been defined in order to
fulfill device authentication :

- USBAUTH_CMD_REGISTER

This is the beginning of any authentication. The kernel first wait for
the userspace service to connect to the socket using the
`USBAUTH_CMD_REGISTER` netlink command.
Upon connection, the kernel check that the userspace service has the
`CAP_SYS_ADMIN` capability beforing enrolling the service. Only one
userspace service can be registered.

- USBAUTH_CMD_CHECK_DIGEST

The kernel then sends a `USBAUTH_CMD_CHECK_DIGEST` netlink command to
the policy engine to be verified. The policy engine checks if the device
ceritificates has already been encountered.

- USBAUTH_CMD_RESP_DIGEST

After the policy engine has received an usb device certificate digest
list from kernel, it needs to reply if it knows one of them using the
`USBAUTH_CMD_RESP_DIGEST` netlink command.

- USBAUTH_CMD_CHECK_CERTIFICATE

The kernel then sends a `USBAUTH_CMD_CHECK_CERTIFICATE` netlink command
to the policy engine. Each command contains one certificate chain. The
policy engine verifies if the device certificate chain is trusted.

- USBAUTH_CMD_RESP_CERTIFICATE

After checking the certificate chain, the policy engine sends a
`USBAUTH_CMD_RESP_CERTIFICATE` response. It tells the kernel if the
device certificate chain is trusted and thus if the device
authentication should continue.

Once device has been validated either through the digest or certificate
chain validation, an authentication session is started and a device ID
is associated for this session. The ID will then be used in all the
following commands.

- USBAUTH_CMD_GEN_NONCE

Kernel then asks for a nonce generation in order to challenge the device
using the `USBAUTH_GEN_NONCE` netlink command.

- USBAUTH_CMD_RESP_GEN_NONCE

When the nonce has been generated by the policy engine it is sent back
to the kernel using the `USBAUTH_CMD_RESP_GEN_NONCE` netlink command.

- USBAUTH_CMD_CHECK_CHALL

Once the kernel has received a device challenge response, it forwards
the response to the policy engine for validation using the
`USBAUTH_CMD_CHECK_CHALL` netlink command.

- USBAUTH_CMD_RESP_CHECK_CHALL

The policy engine then verifies the challenge and replies its decision
to the kernel using the `USBAUTH_CMD_RESP_CHECK_CHALL` netlink command.

- USBAUTH_CMD_REMOVE_DEV
- USBAUTH_CMD_RESP_REMOVE_DEV

Those two commands have been provionned but have not been implemented yet.
If at any time, the policy engine wants to remove the trust in a device,
then the `USBAUTH_CMD_REMOVE_DEV` would to be sent, the kernel replies
with an error status through the `USBAUTH_CMD_RESP_REMOVE_DEV` command.

Co-developed-by: Luc Bonnafoux <luc.bonnafoux@ssi.gouv.fr>
Signed-off-by: Luc Bonnafoux <luc.bonnafoux@ssi.gouv.fr>
Signed-off-by: Nicolas Bouchinet <nicolas.bouchinet@ssi.gouv.fr>
---
 drivers/usb/core/authent_netlink.c        | 1080 +++++++++++++++++++++++++++++
 drivers/usb/core/authent_netlink.h        |  157 +++++
 include/uapi/linux/usb/usb_auth_netlink.h |   67 ++
 3 files changed, 1304 insertions(+)

diff --git a/drivers/usb/core/authent_netlink.c b/drivers/usb/core/authent_netlink.c
new file mode 100644
index 0000000000000000000000000000000000000000..d53a220c762ffc1bd9aeb95bf90dc0dd79c43f09
--- /dev/null
+++ b/drivers/usb/core/authent_netlink.c
@@ -0,0 +1,1080 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * SPDX-FileCopyrightText: (C) 2025 ANSSI
+ *
+ * USB Authentication netlink interface
+ *
+ * Author: Luc Bonnafoux <luc.bonnafoux@ssi.gouv.fr>
+ * Author: Nicolas Bouchinet <nicolas.bouchinet@ssi.gouv.fr>
+ *
+ */
+
+#include <linux/sched.h>
+#include <linux/time.h>
+#include <linux/delay.h>
+#include <linux/slab.h>
+#include <linux/mutex.h>
+#include <linux/err.h>
+#include <linux/capability.h>
+
+#include <net/genetlink.h>
+
+#include <uapi/linux/usb/usb_auth_netlink.h>
+
+#include "authent_netlink.h"
+
+#define WAIT_USERSPACE_TIMEOUT 30
+#define WAIT_RESPONSE_TIMEOUT 300
+#define USB_AUTH_MAX_RESP_SIZE 128
+
+/**
+ * Define an outstanding request between the kernel and userspace
+ */
+struct usb_auth_req {
+	uint8_t used; /**< 1 if the slot is currently used, access must be protected */
+	uint8_t done; /**< 1 if the response has been received, used as wait condition */
+	uint8_t error; /**< userspace response error code */
+	uint8_t resp[USB_AUTH_MAX_RESP_SIZE]; /**< arbitrary response buffer */
+};
+
+static struct genl_family usbauth_genl_fam;
+
+// TODO: add mutex for PID access
+static u32 pol_eng_pid;
+static struct net *pol_eng_net;
+
+static wait_queue_head_t usb_req_wq;
+
+#define USB_AUTH_MAX_OUTSTANDING_REQS 10
+// Mutex is used to protect access to the `used` field
+DEFINE_MUTEX(usb_auth_reqs_mutex);
+static struct usb_auth_req usb_auth_outstanding_reqs[USB_AUTH_MAX_OUTSTANDING_REQS];
+
+////////////////////////////////////////////////////////////////////////////////
+// USB request utilities
+////////////////////////////////////////////////////////////////////////////////
+
+/**
+ * @brief Find the first available slot in the outstanding requests array and
+ *  reserve it.
+ *
+ * CAUTION: this function will block on the request list mutex
+ *
+ * Possible error codes:
+ *  - EXFULL : too many outstanding requests already
+ *
+ * @param [out] index : reserved slot index, valid if return equals 0
+ *
+ * @return 0 on SUCCESS or error code
+ */
+static int usb_auth_get_reqs_slot(uint32_t *index)
+{
+	int ret = -EXFULL;
+	uint32_t i = 0;
+
+	mutex_lock(&usb_auth_reqs_mutex);
+
+	// Take the first available slot
+	for (i = 0; i < USB_AUTH_MAX_OUTSTANDING_REQS; i++) {
+		if (usb_auth_outstanding_reqs[i].used == 0) {
+			usb_auth_outstanding_reqs[i].used = 1;
+			usb_auth_outstanding_reqs[i].done = 0;
+			usb_auth_outstanding_reqs[i].error = USBAUTH_OK;
+			memset(usb_auth_outstanding_reqs[i].resp, 0,
+			       USB_AUTH_MAX_RESP_SIZE);
+			*index = i;
+			ret = 0;
+			break;
+		}
+	}
+
+	mutex_unlock(&usb_auth_reqs_mutex);
+
+	return ret;
+}
+
+/**
+ * @brief release a request slot
+ *
+ * CAUTION: this function will block on the request list mutex
+ *
+ * @param [in] index : slot index to be released
+ */
+static void usb_auth_release_reqs_slot(const uint32_t index)
+{
+	mutex_lock(&usb_auth_reqs_mutex);
+
+	usb_auth_outstanding_reqs[index].used = 0;
+
+	mutex_unlock(&usb_auth_reqs_mutex);
+}
+
+////////////////////////////////////////////////////////////////////////////////
+// Generic netlink socket utilities
+////////////////////////////////////////////////////////////////////////////////
+
+/**
+ * @brief Handle a registration request from userspace
+ *
+ * It will overwrite the current userspace registered PID with the one provided
+ *  in the request
+ */
+static int usb_auth_register_req_doit(struct sk_buff *skb, struct genl_info *info)
+{
+	int ret = 0;
+	void *hdr = NULL;
+	struct sk_buff *msg = NULL;
+
+	pr_info("message received\n");
+
+	if (!capable(CAP_SYS_ADMIN)) {
+		pr_err("invalid permissions\n");
+		return -EPERM;
+	}
+
+	// Register Policy engine PID, overwrite value if already set
+	pol_eng_pid = info->snd_portid;
+	pol_eng_net = genl_info_net(info);
+
+	wake_up_all(&usb_req_wq);
+
+	msg = nlmsg_new(NLMSG_DEFAULT_SIZE, GFP_KERNEL);
+	if (msg == NULL) {
+		pr_err("failed to allocate message buffer\n");
+		return -ENOMEM;
+	}
+
+	hdr = genlmsg_put(msg, info->snd_portid, info->snd_seq,
+			  &usbauth_genl_fam, 0, USBAUTH_CMD_REGISTER);
+	if (hdr == NULL) {
+		pr_err("failed to create genetlink header\n");
+		nlmsg_free(msg);
+		return -EMSGSIZE;
+	}
+
+	genlmsg_end(msg, hdr);
+
+	ret = genlmsg_reply(msg, info);
+
+	pr_info("reply sent\n");
+
+	return ret;
+}
+
+/**
+ * @brief Handle a CHECK_DIGEST response from userspace
+ *
+ * The response must contain:
+ *  - USBAUTH_A_REQ_ID
+ *  - USBAUTH_A_ERROR_CODE
+ *  - USBAUTH_A_DEV_ID
+ *  - USBAUTH_A_KNOWN
+ *  - USBAUTH_A_BLOCKED
+ *
+ */
+static int usb_auth_digest_resp_doit(struct sk_buff *skb, struct genl_info *info)
+{
+	uint32_t index = 0;
+
+	pr_info("message received\n");
+
+	if (!capable(CAP_SYS_ADMIN)) {
+		pr_err("invalid permissions\n");
+		return -EPERM;
+	}
+
+	if (!info->attrs[USBAUTH_A_REQ_ID]) {
+		pr_err("digest_resp_doit: invalid response: no req ID\n");
+		return -EINVAL;
+	}
+
+	index = nla_get_u32(info->attrs[USBAUTH_A_REQ_ID]);
+
+	// Test for error
+	if (!info->attrs[USBAUTH_A_ERROR_CODE]) {
+		pr_err("digest_resp_doit: invalid response: missing attributes\n");
+		usb_auth_outstanding_reqs[index].error = USBAUTH_INVRESP;
+		usb_auth_outstanding_reqs[index].done = 1;
+		return -EINVAL;
+	}
+
+	usb_auth_outstanding_reqs[index].error =
+		nla_get_u8(info->attrs[USBAUTH_A_ERROR_CODE]);
+
+	if (usb_auth_outstanding_reqs[index].error != USBAUTH_OK) {
+		pr_err("digest_resp_doit: response error\n");
+		usb_auth_outstanding_reqs[index].done = 1;
+		return -EINVAL;
+	}
+
+	if (!info->attrs[USBAUTH_A_DEV_ID] || !info->attrs[USBAUTH_A_KNOWN] ||
+	    !info->attrs[USBAUTH_A_BLOCKED]) {
+		pr_err("digest_resp_doit: invalid response: missing attributes\n");
+		usb_auth_outstanding_reqs[index].error = USBAUTH_INVRESP;
+		usb_auth_outstanding_reqs[index].done = 1;
+		return -EINVAL;
+	}
+
+	usb_auth_outstanding_reqs[index].resp[0] =
+		nla_get_u8(info->attrs[USBAUTH_A_KNOWN]);
+	usb_auth_outstanding_reqs[index].resp[1] =
+		nla_get_u8(info->attrs[USBAUTH_A_BLOCKED]);
+	((uint32_t *)usb_auth_outstanding_reqs[index].resp + 2)[0] =
+		nla_get_u32(info->attrs[USBAUTH_A_DEV_ID]);
+
+	usb_auth_outstanding_reqs[index].done = 1;
+
+	wake_up_all(&usb_req_wq);
+
+	return 0;
+}
+
+/**
+ * @brief Handle a CHECK_CERTIFICATE response from userspace
+ *
+ * The response must contain:
+ *  - USBAUTH_A_REQ_ID
+ *  - USBAUTH_A_ERROR_CODE
+ *  - USBAUTH_A_VALID
+ *  - USBAUTH_A_BLOCKED
+ *  - USBAUTH_A_DEV_ID
+ *
+ */
+static int usb_auth_cert_resp_doit(struct sk_buff *skb, struct genl_info *info)
+{
+	uint32_t index = 0;
+
+	pr_info("message received\n");
+
+	if (!capable(CAP_SYS_ADMIN)) {
+		pr_err("invalid permissions\n");
+		return -EPERM;
+	}
+
+	if (!info->attrs[USBAUTH_A_REQ_ID]) {
+		pr_err("invalid response: no req ID\n");
+		return -EINVAL;
+	}
+
+	index = nla_get_u32(info->attrs[USBAUTH_A_REQ_ID]);
+
+	// Test for error
+	if (!info->attrs[USBAUTH_A_ERROR_CODE]) {
+		pr_err("invalid response: missing attributes\n");
+		usb_auth_outstanding_reqs[index].error = USBAUTH_INVRESP;
+		usb_auth_outstanding_reqs[index].done = 1;
+		return -EINVAL;
+	}
+
+	usb_auth_outstanding_reqs[index].error =
+		nla_get_u8(info->attrs[USBAUTH_A_ERROR_CODE]);
+
+	if (usb_auth_outstanding_reqs[index].error != USBAUTH_OK) {
+		pr_err("response error\n");
+		usb_auth_outstanding_reqs[index].done = 1;
+		return -EINVAL;
+	}
+
+	if (!info->attrs[USBAUTH_A_DEV_ID] || !info->attrs[USBAUTH_A_VALID] ||
+	    !info->attrs[USBAUTH_A_BLOCKED]) {
+		pr_err("invalid response: missing attributes\n");
+		usb_auth_outstanding_reqs[index].done = 1;
+		usb_auth_outstanding_reqs[index].error = USBAUTH_INVRESP;
+		return -EINVAL;
+	}
+
+	usb_auth_outstanding_reqs[index].resp[0] =
+		nla_get_u8(info->attrs[USBAUTH_A_VALID]);
+	usb_auth_outstanding_reqs[index].resp[1] =
+		nla_get_u8(info->attrs[USBAUTH_A_BLOCKED]);
+	((uint32_t *)usb_auth_outstanding_reqs[index].resp + 2)[0] =
+		nla_get_u32(info->attrs[USBAUTH_A_DEV_ID]);
+
+	usb_auth_outstanding_reqs[index].done = 1;
+
+	wake_up_all(&usb_req_wq);
+
+	return 0;
+}
+
+/**
+ * @brief Handle a REMOVE_DEV response from userspace
+ *
+ * The response must contain:
+ *  - USBAUTH_A_REQ_ID
+ *  - USBAUTH_A_ERROR_CODE
+ *  - USBAUTH_A_VALID
+ *
+ */
+static int usb_auth_remove_dev_doit(struct sk_buff *skb, struct genl_info *info)
+{
+	uint32_t index = 0;
+
+	pr_info("message received\n");
+
+	if (!capable(CAP_SYS_ADMIN)) {
+		pr_err("invalid permissions\n");
+		return -EPERM;
+	}
+
+	if (!info->attrs[USBAUTH_A_REQ_ID]) {
+		pr_err("invalid response: no req ID\n");
+		return -EINVAL;
+	}
+
+	index = nla_get_u32(info->attrs[USBAUTH_A_REQ_ID]);
+
+	// Test for error
+	if (!info->attrs[USBAUTH_A_ERROR_CODE]) {
+		pr_err("invalid response: missing attributes\n");
+		usb_auth_outstanding_reqs[index].error = USBAUTH_INVRESP;
+		usb_auth_outstanding_reqs[index].done = 1;
+		return -EINVAL;
+	}
+
+	usb_auth_outstanding_reqs[index].error =
+		nla_get_u8(info->attrs[USBAUTH_A_ERROR_CODE]);
+
+	if (usb_auth_outstanding_reqs[index].error != USBAUTH_OK) {
+		pr_err("response error\n");
+		usb_auth_outstanding_reqs[index].done = 1;
+		return -EINVAL;
+	}
+
+	if (!info->attrs[USBAUTH_A_VALID]) {
+		pr_err("invalid response: missing attributes\n");
+		usb_auth_outstanding_reqs[index].error = USBAUTH_INVRESP;
+		usb_auth_outstanding_reqs[index].done = 1;
+		return -EINVAL;
+	}
+
+	usb_auth_outstanding_reqs[index].resp[0] =
+		nla_get_u8(info->attrs[USBAUTH_A_VALID]);
+
+	usb_auth_outstanding_reqs[index].done = 1;
+
+	wake_up_all(&usb_req_wq);
+
+	return 0;
+}
+
+/**
+ * @brief Handle a GEN_NONCE response from userspace
+ *
+ * The response must contain:
+ *  - USBAUTH_A_REQ_ID
+ *  - USBAUTH_A_ERROR_CODE
+ *  - USBAUTH_A_NONCE
+ *
+ */
+static int usb_auth_gen_nonce_doit(struct sk_buff *skb, struct genl_info *info)
+{
+	uint32_t index = 0;
+
+	pr_info("message received\n");
+
+	if (!capable(CAP_SYS_ADMIN)) {
+		pr_err("invalid permissions\n");
+		return -EPERM;
+	}
+
+	if (!info->attrs[USBAUTH_A_REQ_ID]) {
+		pr_err("invalid response: no req ID\n");
+		return -EINVAL;
+	}
+
+	index = nla_get_u32(info->attrs[USBAUTH_A_REQ_ID]);
+
+	// Test for error
+	if (!info->attrs[USBAUTH_A_ERROR_CODE]) {
+		pr_err("invalid response: missing attributes\n");
+		usb_auth_outstanding_reqs[index].error = USBAUTH_INVRESP;
+		usb_auth_outstanding_reqs[index].done = 1;
+		return -EINVAL;
+	}
+
+	usb_auth_outstanding_reqs[index].error =
+		nla_get_u8(info->attrs[USBAUTH_A_ERROR_CODE]);
+
+	if (usb_auth_outstanding_reqs[index].error != USBAUTH_OK) {
+		pr_err("response error\n");
+		usb_auth_outstanding_reqs[index].done = 1;
+		return -EINVAL;
+	}
+
+	if (!info->attrs[USBAUTH_A_NONCE]) {
+		pr_err("invalid response: missing attributes\n");
+		usb_auth_outstanding_reqs[index].error = USBAUTH_INVRESP;
+		usb_auth_outstanding_reqs[index].done = 1;
+		return -EINVAL;
+	}
+
+	nla_memcpy(usb_auth_outstanding_reqs[index].resp, info->attrs[USBAUTH_A_NONCE], 32);
+
+	usb_auth_outstanding_reqs[index].done = 1;
+
+	wake_up_all(&usb_req_wq);
+
+	return 0;
+}
+
+/**
+ * @brief Handle a CHECK_CHALL response from userspace
+ *
+ * The response must contain:
+ *  - USBAUTH_A_REQ_ID
+ *  - USBAUTH_A_ERROR_CODE
+ *  - USBAUTH_A_VALID
+ *
+ */
+static int usb_auth_check_chall_doit(struct sk_buff *skb, struct genl_info *info)
+{
+	uint32_t index = 0;
+
+	pr_info("message received\n");
+
+	if (!capable(CAP_SYS_ADMIN)) {
+		pr_err("invalid permissions\n");
+		return -EPERM;
+	}
+
+	if (!info->attrs[USBAUTH_A_REQ_ID]) {
+		pr_err("invalid response: no req ID\n");
+		return -EINVAL;
+	}
+
+	index = nla_get_u32(info->attrs[USBAUTH_A_REQ_ID]);
+
+	// Test for error
+	if (!info->attrs[USBAUTH_A_ERROR_CODE]) {
+		pr_err("invalid response: missing attributes\n");
+		usb_auth_outstanding_reqs[index].error = USBAUTH_INVRESP;
+		usb_auth_outstanding_reqs[index].done = 1;
+		return -EINVAL;
+	}
+
+	usb_auth_outstanding_reqs[index].error =
+		nla_get_u8(info->attrs[USBAUTH_A_ERROR_CODE]);
+
+	if (usb_auth_outstanding_reqs[index].error != USBAUTH_OK) {
+		pr_err("response error\n");
+		usb_auth_outstanding_reqs[index].done = 1;
+		return -EINVAL;
+	}
+
+	if (!info->attrs[USBAUTH_A_VALID]) {
+		pr_err("invalid response: missing attributes\n");
+		usb_auth_outstanding_reqs[index].error = USBAUTH_INVRESP;
+		usb_auth_outstanding_reqs[index].done = 1;
+		return -EINVAL;
+	}
+
+	usb_auth_outstanding_reqs[index].resp[0] =
+		nla_get_u8(info->attrs[USBAUTH_A_VALID]);
+
+	usb_auth_outstanding_reqs[index].done = 1;
+
+	wake_up_all(&usb_req_wq);
+
+	return 0;
+}
+
+/* Attribute validation policy */
+static struct nla_policy usbauth_attr_pol[USBAUTH_A_MAX + 1] = {
+	[USBAUTH_A_REQ_ID]  = {.type = NLA_U32,},
+	[USBAUTH_A_DEV_ID]  = {.type = NLA_U32,},
+	[USBAUTH_A_DIGEST] = {.type = NLA_UNSPEC, .len = 32,},
+	[USBAUTH_A_DIGESTS] = {.type = NLA_UNSPEC, .len = 256,},
+	[USBAUTH_A_SLOT_MASK]  = {.type = NLA_U8,},
+	[USBAUTH_A_KNOWN]  = {.type = NLA_U8,},
+	[USBAUTH_A_BLOCKED]  = {.type = NLA_U8,},
+	[USBAUTH_A_VALID]  = {.type = NLA_U8,},
+	[USBAUTH_A_CERTIFICATE] = {.type = NLA_UNSPEC, .max = 4096,},
+	[USBAUTH_A_CERT_LEN] = {.type = NLA_U32},
+	[USBAUTH_A_ROUTE] = {.type = NLA_U32},
+	[USBAUTH_A_NONCE] = {.type = NLA_BINARY, .len = 32,},
+	[USBAUTH_A_CHALL] = {.type = NLA_UNSPEC, .len = 204,},
+	[USBAUTH_A_DESCRIPTOR] = {.type = NLA_UNSPEC, .len = USBAUTH_MAX_DESC_SIZE},
+	[USBAUTH_A_BOS] = {.type = NLA_UNSPEC, .len = USBAUTH_MAX_BOS_SIZE},
+	[USBAUTH_A_ERROR_CODE] = {.type = NLA_U8},
+};
+
+/* Operations */
+static struct genl_ops usbauth_genl_ops[] = {
+	{
+		.cmd = USBAUTH_CMD_REGISTER,
+		.policy = usbauth_attr_pol,
+		.doit = usb_auth_register_req_doit,
+	},
+	{
+		.cmd = USBAUTH_CMD_RESP_DIGEST,
+		.policy = usbauth_attr_pol,
+		.doit = usb_auth_digest_resp_doit,
+	},
+	{
+		.cmd = USBAUTH_CMD_RESP_CERTIFICATE,
+		.policy = usbauth_attr_pol,
+		.doit = usb_auth_cert_resp_doit,
+	},
+	{
+		.cmd = USBAUTH_CMD_RESP_REMOVE_DEV,
+		.policy = usbauth_attr_pol,
+		.doit = usb_auth_remove_dev_doit,
+	},
+	{
+		.cmd = USBAUTH_CMD_RESP_GEN_NONCE,
+		.policy = usbauth_attr_pol,
+		.doit = usb_auth_gen_nonce_doit,
+	},
+	{
+		.cmd = USBAUTH_CMD_RESP_CHECK_CHALL,
+		.policy = usbauth_attr_pol,
+		.doit = usb_auth_check_chall_doit,
+	}
+};
+
+/* USB Authentication netlink family definition */
+static struct genl_family usbauth_genl_fam = {
+	.name = USBAUTH_GENL_NAME,
+	.version = USBAUTH_GENL_VERSION,
+	.maxattr = USBAUTH_A_MAX,
+	.ops = usbauth_genl_ops,
+	.n_ops = ARRAY_SIZE(usbauth_genl_ops),
+	.mcgrps = NULL,
+	.n_mcgrps = 0,
+};
+
+int usb_auth_init_netlink(void)
+{
+	int ret = 0;
+	uint8_t i = 0;
+
+	for (i = 0; i < USB_AUTH_MAX_OUTSTANDING_REQS; i++)
+		usb_auth_outstanding_reqs[i].used = 0;
+
+	init_waitqueue_head(&usb_req_wq);
+
+	ret = genl_register_family(&usbauth_genl_fam);
+	if (unlikely(ret)) {
+		pr_err("failed to init netlink: %d\n",
+		       ret);
+		return ret;
+	}
+
+	pr_info("initialized\n");
+
+	return ret;
+}
+
+////////////////////////////////////////////////////////////////////////////////
+// Policy engine API
+////////////////////////////////////////////////////////////////////////////////
+
+int usb_policy_engine_check_digest(const uint32_t route, const uint8_t *const digests,
+	const uint8_t mask, uint8_t *is_known, uint8_t *is_blocked, uint32_t *id)
+{
+	int ret = -1;
+	void *hdr = NULL;
+	struct sk_buff *skb = NULL;
+	uint32_t index = 0;
+
+	if (digests == NULL) {
+		pr_err("invalid inputs\n");
+		return -EINVAL;
+	}
+
+	// Arbitrary 30s wait before giving up
+	if (!wait_event_timeout(usb_req_wq, pol_eng_pid != 0, HZ * WAIT_USERSPACE_TIMEOUT)) {
+		pr_err("userspace not available\n");
+		return -ECOMM;
+	}
+
+	pr_info("got connection to userspace\n");
+
+	// Get a slot in the outstanding request list
+	if (usb_auth_get_reqs_slot(&index)) {
+		pr_err("failed to get request slot\n");
+		return -ECOMM;
+	}
+	pr_info("got request slot\n");
+
+	// Create digests check request
+	skb = genlmsg_new(NLMSG_DEFAULT_SIZE, GFP_KERNEL);
+	if (skb == NULL) {
+		pr_err("failed to allocated buffer\n");
+		return -ENOMEM;
+	}
+
+	hdr = genlmsg_put(skb, 0, 0, &usbauth_genl_fam, 0,
+			  USBAUTH_CMD_CHECK_DIGEST);
+	if (unlikely(hdr == NULL)) {
+		pr_err("failed to place header\n");
+		nlmsg_free(skb);
+		return -ENOMEM;
+	}
+
+	ret = nla_put_u32(skb, USBAUTH_A_REQ_ID, index);
+	if (ret) {
+		pr_err("failed to place req ID\n");
+		genlmsg_cancel(skb, hdr);
+		nlmsg_free(skb);
+		return ret;
+	}
+
+	ret = nla_put_u32(skb, USBAUTH_A_ROUTE, route);
+	if (ret) {
+		pr_err("failed to place route\n");
+		genlmsg_cancel(skb, hdr);
+		nlmsg_free(skb);
+		return ret;
+	}
+
+	ret = nla_put(skb, USBAUTH_A_DIGESTS, 260, digests);
+	if (ret) {
+		pr_err("failed to place digests\n");
+		genlmsg_cancel(skb, hdr);
+		nlmsg_free(skb);
+		return ret;
+	}
+
+	ret = nla_put_u8(skb, USBAUTH_A_SLOT_MASK, mask);
+	if (ret) {
+		pr_err("failed to place slot mask\n");
+		genlmsg_cancel(skb, hdr);
+		nlmsg_free(skb);
+		return ret;
+	}
+
+	genlmsg_end(skb, hdr);
+
+	// Send message to userspace
+	ret = genlmsg_unicast(pol_eng_net, skb, pol_eng_pid);
+	if (ret != 0) {
+		pr_err("failed to send message: %d\n",
+		       ret);
+		return -ECOMM;
+	}
+	pr_info("sent CHECK_DIGEST request\n");
+
+	// Wait for userspace response
+	// Arbitrary 5 min wait before giving up
+	if (!wait_event_timeout(usb_req_wq,
+				usb_auth_outstanding_reqs[index].done == 1,
+				HZ * WAIT_RESPONSE_TIMEOUT)) {
+		pr_err("userspace response not available\n");
+		usb_auth_release_reqs_slot(index);
+		return -ECOMM;
+	}
+
+	pr_info("received CHECK_DIGEST response\n");
+
+	// Get response
+	if (usb_auth_outstanding_reqs[index].error == USBAUTH_INVRESP) {
+		pr_err("userspace response error: %d\n",
+			usb_auth_outstanding_reqs[index].error);
+		usb_auth_release_reqs_slot(index);
+		return -ECOMM;
+	}
+
+	*is_known = usb_auth_outstanding_reqs[index].resp[0];
+	*is_blocked = usb_auth_outstanding_reqs[index].resp[1];
+	*id = ((uint32_t *)usb_auth_outstanding_reqs[index].resp + 2)[0];
+
+	// Release request slot
+	usb_auth_release_reqs_slot(index);
+
+	return 0;
+}
+
+int usb_policy_engine_check_cert_chain(const uint32_t route,
+	const uint8_t *const digest, const uint8_t *const chain,
+	const size_t chain_len, uint8_t *is_valid, uint8_t *is_blocked, uint32_t *id)
+{
+	int ret = -1;
+	void *hdr = NULL;
+	struct sk_buff *skb = NULL;
+	uint32_t index = 0;
+
+	if (chain == NULL || chain_len > 4096 || digest == NULL) {
+		pr_err("invalid inputs\n");
+		return -EINVAL;
+	}
+
+	// Arbitrary 30s wait before giving up
+	if (!wait_event_timeout(usb_req_wq, pol_eng_pid != 0, HZ * WAIT_USERSPACE_TIMEOUT)) {
+		pr_err("userspace not available\n");
+		return -ECOMM;
+	}
+
+	pr_info("got connection to userspace\n");
+
+	// Get a slot in the outstanding request list
+	if (usb_auth_get_reqs_slot(&index)) {
+		pr_err("failed to get request slot\n");
+		return -ECOMM;
+	}
+	pr_info("got request slot\n");
+
+	// Create digest check request
+	skb = genlmsg_new(NLMSG_DEFAULT_SIZE, GFP_KERNEL);
+	if (skb == NULL) {
+		pr_err("failed to allocated buffer\n");
+		return -ENOMEM;
+	}
+
+	hdr = genlmsg_put(skb, 0, 0, &usbauth_genl_fam, 0,
+		USBAUTH_CMD_CHECK_CERTIFICATE);
+	if (unlikely(hdr == NULL)) {
+		pr_err("failed to place header\n");
+		nlmsg_free(skb);
+		return -ENOMEM;
+	}
+
+	ret = nla_put_u32(skb, USBAUTH_A_REQ_ID, index);
+	if (ret) {
+		pr_err("failed to place req ID\n");
+		genlmsg_cancel(skb, hdr);
+		nlmsg_free(skb);
+		return ret;
+	}
+
+	ret = nla_put_u32(skb, USBAUTH_A_ROUTE, route);
+	if (ret) {
+		pr_err("failed to place route\n");
+		genlmsg_cancel(skb, hdr);
+		nlmsg_free(skb);
+		return ret;
+	}
+
+	ret = nla_put(skb, USBAUTH_A_DIGEST, 32, digest);
+	if (ret) {
+		pr_err("failed to place digest\n");
+		genlmsg_cancel(skb, hdr);
+		nlmsg_free(skb);
+		return ret;
+	}
+
+	ret = nla_put(skb, USBAUTH_A_CERTIFICATE, chain_len, chain);
+	if (ret) {
+		pr_err("failed to place certificate\n");
+		genlmsg_cancel(skb, hdr);
+		nlmsg_free(skb);
+		return ret;
+	}
+
+	ret = nla_put_u32(skb, USBAUTH_A_CERT_LEN, chain_len);
+	if (ret) {
+		pr_err("failed to place chain length\n");
+		genlmsg_cancel(skb, hdr);
+		nlmsg_free(skb);
+		return ret;
+	}
+
+	genlmsg_end(skb, hdr);
+
+	// Send message to userspace
+	ret = genlmsg_unicast(pol_eng_net, skb, pol_eng_pid);
+	if (ret != 0) {
+		pr_err("failed to send message: %d\n",
+		       ret);
+		return -ECOMM;
+	}
+	pr_info("sent CHECK_CERTIFICATE request\n");
+
+	// Wait for userspace response
+	// Arbitrary 5 min wait before giving up
+	if (!wait_event_timeout(usb_req_wq,
+				usb_auth_outstanding_reqs[index].done == 1,
+				HZ * WAIT_RESPONSE_TIMEOUT)) {
+		pr_err("userspace response not available\n");
+		usb_auth_release_reqs_slot(index);
+		return -ECOMM;
+	}
+
+	pr_info("received CHECK_CERTIFICATE response\n");
+
+	// Get response
+	*is_valid = usb_auth_outstanding_reqs[index].resp[0];
+	*is_blocked = usb_auth_outstanding_reqs[index].resp[1];
+	*id = ((uint32_t *)usb_auth_outstanding_reqs[index].resp + 2)[0];
+
+	// Release request slot
+	usb_auth_release_reqs_slot(index);
+
+	return 0;
+}
+
+int usb_policy_engine_remove_dev(const uint32_t id)
+{
+	int ret = -1;
+	void *hdr = NULL;
+	struct sk_buff *skb = NULL;
+	uint32_t index = 0;
+
+	// Arbitrary 30s wait before giving up
+	if (!wait_event_timeout(usb_req_wq, pol_eng_pid != 0, HZ * WAIT_USERSPACE_TIMEOUT)) {
+		pr_err("userspace not available\n");
+		return -ECOMM;
+	}
+
+	pr_info("got connection to userspace\n");
+
+	// Get a slot in the outstanding request list
+	if (usb_auth_get_reqs_slot(&index)) {
+		pr_err("failed to get request slot\n");
+		return -ECOMM;
+	}
+	pr_info("got request slot\n");
+
+	// Create digest check request
+	skb = genlmsg_new(NLMSG_DEFAULT_SIZE, GFP_KERNEL);
+	if (skb == NULL) {
+		pr_err("failed to allocated buffer\n");
+		return -ENOMEM;
+	}
+
+	hdr = genlmsg_put(skb, 0, 0, &usbauth_genl_fam, 0,
+		USBAUTH_CMD_REMOVE_DEV);
+	if (unlikely(hdr == NULL)) {
+		pr_err("failed to place header\n");
+		nlmsg_free(skb);
+		return -ENOMEM;
+	}
+
+	ret = nla_put_u32(skb, USBAUTH_A_REQ_ID, index);
+	if (ret) {
+		pr_err("failed to place req ID\n");
+		genlmsg_cancel(skb, hdr);
+		nlmsg_free(skb);
+		return ret;
+	}
+
+	ret = nla_put_u32(skb, USBAUTH_A_DEV_ID, id);
+	if (ret) {
+		pr_err("failed to place dev ID\n");
+		genlmsg_cancel(skb, hdr);
+		nlmsg_free(skb);
+		return ret;
+	}
+
+	genlmsg_end(skb, hdr);
+
+	// Send message to userspace
+	ret = genlmsg_unicast(pol_eng_net, skb, pol_eng_pid);
+	if (ret != 0) {
+		pr_err("failed to send message: %d\n",
+		       ret);
+		return -ECOMM;
+	}
+	pr_info("sent REMOVE_DEV request\n");
+
+	// Wait for userspace response
+	// Arbitrary 5 min wait before giving up
+	if (!wait_event_timeout(usb_req_wq,
+				usb_auth_outstanding_reqs[index].done == 1,
+				HZ * WAIT_RESPONSE_TIMEOUT)) {
+		pr_err("userspace response not available\n");
+		usb_auth_release_reqs_slot(index);
+		return -ECOMM;
+	}
+
+	pr_info("received REMOVE_DEV response\n");
+
+	// Release request slot
+	usb_auth_release_reqs_slot(index);
+
+	return 0;
+}
+
+int usb_policy_engine_generate_challenge(const uint32_t id, uint8_t *nonce)
+{
+	int ret = -1;
+	void *hdr = NULL;
+	struct sk_buff *skb = NULL;
+	uint32_t index = 0;
+
+	// Arbitrary 30s wait before giving up
+	if (!wait_event_timeout(usb_req_wq, pol_eng_pid != 0, HZ * WAIT_USERSPACE_TIMEOUT)) {
+		pr_err("userspace not available\n");
+		return -ECOMM;
+	}
+
+	pr_info("got connection to userspace\n");
+
+	// Get a slot in the outstanding request list
+	if (usb_auth_get_reqs_slot(&index)) {
+		pr_err("failed to get request slot\n");
+		return -ECOMM;
+	}
+	pr_info("got request slot\n");
+
+	// Create digest check request
+	skb = genlmsg_new(NLMSG_DEFAULT_SIZE, GFP_KERNEL);
+	if (skb == NULL) {
+		pr_err("failed to allocated buffer\n");
+		return -ENOMEM;
+	}
+
+	hdr = genlmsg_put(skb, 0, 0, &usbauth_genl_fam, 0,
+		USBAUTH_CMD_GEN_NONCE);
+	if (unlikely(hdr == NULL)) {
+		pr_err("failed to place header\n");
+		nlmsg_free(skb);
+		return -ENOMEM;
+	}
+
+	ret = nla_put_u32(skb, USBAUTH_A_REQ_ID, index);
+	if (ret) {
+		pr_err("failed to place req ID\n");
+		genlmsg_cancel(skb, hdr);
+		nlmsg_free(skb);
+		return ret;
+	}
+
+	ret = nla_put_u32(skb, USBAUTH_A_DEV_ID, id);
+	if (ret) {
+		pr_err("failed to place dev ID\n");
+		genlmsg_cancel(skb, hdr);
+		nlmsg_free(skb);
+		return ret;
+	}
+
+	genlmsg_end(skb, hdr);
+
+	// Send message to userspace
+	ret = genlmsg_unicast(pol_eng_net, skb, pol_eng_pid);
+	if (ret != 0) {
+		pr_err("failed to send message: %d\n", ret);
+		return -ECOMM;
+	}
+	pr_info("sent GEN_NONCE request\n");
+
+	// Wait for userspace response
+	// Arbitrary 5 min wait before giving up
+	if (!wait_event_timeout(usb_req_wq,
+				usb_auth_outstanding_reqs[index].done == 1,
+				HZ * WAIT_RESPONSE_TIMEOUT)) {
+		pr_err("userspace response not available\n");
+		usb_auth_release_reqs_slot(index);
+		return -ECOMM;
+	}
+
+	pr_info("received GEN_NONCE response\n");
+
+	// Get response
+	memcpy(nonce, usb_auth_outstanding_reqs[index].resp, 32);
+
+	// Release request slot
+	usb_auth_release_reqs_slot(index);
+
+	return 0;
+}
+
+int usb_policy_engine_check_challenge(const uint32_t id,
+	const uint8_t *const challenge, const uint8_t *const context,
+	const size_t context_size, uint8_t *is_valid)
+{
+	int ret = -1;
+	void *hdr = NULL;
+	struct sk_buff *skb = NULL;
+	uint32_t index = 0;
+
+	if (unlikely(challenge == NULL || context == NULL ||
+	      context_size > USBAUTH_MAX_BOS_SIZE)) {
+		pr_err("invalid inputs\n");
+		return -EINVAL;
+	}
+
+	// Arbitrary 30s wait before giving up
+	if (!wait_event_timeout(usb_req_wq, pol_eng_pid != 0, HZ * WAIT_USERSPACE_TIMEOUT)) {
+		pr_err("userspace not available\n");
+		return -ECOMM;
+	}
+
+	pr_info("got connection to userspace\n");
+
+	// Get a slot in the outstanding request list
+	if (usb_auth_get_reqs_slot(&index)) {
+		pr_err("failed to get request slot\n");
+		return -ECOMM;
+	}
+	pr_info("got request slot\n");
+
+	// Create digest check request
+	skb = genlmsg_new(NLMSG_DEFAULT_SIZE, GFP_KERNEL);
+	if (skb == NULL) {
+		pr_err("failed to allocated buffer\n");
+		return -ENOMEM;
+	}
+
+	hdr = genlmsg_put(skb, 0, 0, &usbauth_genl_fam, 0,
+		USBAUTH_CMD_CHECK_CHALL);
+	if (unlikely(hdr == NULL)) {
+		pr_err("failed to place header\n");
+		nlmsg_free(skb);
+		return -ENOMEM;
+	}
+
+	ret = nla_put_u32(skb, USBAUTH_A_REQ_ID, index);
+	if (ret) {
+		pr_err("failed to place req ID\n");
+		genlmsg_cancel(skb, hdr);
+		nlmsg_free(skb);
+		return ret;
+	}
+
+	ret = nla_put(skb, USBAUTH_A_CHALL, 204, challenge);
+	if (ret) {
+		pr_err("failed to place challenge\n");
+		genlmsg_cancel(skb, hdr);
+		nlmsg_free(skb);
+		return ret;
+	}
+
+	ret = nla_put(skb, USBAUTH_A_DESCRIPTOR, context_size, context);
+	if (ret) {
+		pr_err("failed to place descriptor\n");
+		genlmsg_cancel(skb, hdr);
+		nlmsg_free(skb);
+		return ret;
+	}
+
+	ret = nla_put_u32(skb, USBAUTH_A_DEV_ID, id);
+	if (ret) {
+		pr_err("failed to place dev ID\n");
+		genlmsg_cancel(skb, hdr);
+		nlmsg_free(skb);
+		return ret;
+	}
+
+	genlmsg_end(skb, hdr);
+
+	// Send message to userspace
+	ret = genlmsg_unicast(pol_eng_net, skb, pol_eng_pid);
+	if (ret != 0) {
+		pr_err("failed to send message: %d\n",
+		       ret);
+		return -ECOMM;
+	}
+	pr_info("sent CHECK_CHALL request\n");
+
+	// Wait for userspace response
+	// Arbitrary 5 min wait before giving up
+	if (!wait_event_timeout(usb_req_wq,
+				usb_auth_outstanding_reqs[index].done == 1,
+				HZ * WAIT_RESPONSE_TIMEOUT)) {
+		pr_err("userspace response not available\n");
+		usb_auth_release_reqs_slot(index);
+		return -ECOMM;
+	}
+
+	pr_info("received CHECK_CHALL response\n");
+
+	// Get response
+	*is_valid = usb_auth_outstanding_reqs[index].resp[0];
+
+	// Release request slot
+	usb_auth_release_reqs_slot(index);
+
+	return 0;
+}
diff --git a/drivers/usb/core/authent_netlink.h b/drivers/usb/core/authent_netlink.h
new file mode 100644
index 0000000000000000000000000000000000000000..504da32547b75b85b4328f3ea7df43b0a565dd18
--- /dev/null
+++ b/drivers/usb/core/authent_netlink.h
@@ -0,0 +1,157 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * SPDX-FileCopyrightText: (C) 2025 ANSSI
+ *
+ * USB Authentication netlink interface
+ *
+ * Author: Luc Bonnafoux <luc.bonnafoux@ssi.gouv.fr>
+ * Author: Nicolas Bouchinet <nicolas.bouchinet@ssi.gouv.fr>
+ *
+ */
+
+#ifndef __USB_CORE_AUTHENT_NETLINK_H_
+#define __USB_CORE_AUTHENT_NETLINK_H_
+
+int usb_auth_init_netlink(void);
+
+/**
+ * @brief Check if a digest match a device
+ *
+ * This function blocks until a response has been received from userspace or in
+ * case of timeout.
+ * The function blocks if no policy engine is registered with a timeout.
+ *
+ * Context: task context, might sleep.
+ *
+ * Possible errors:
+ *  - EINVAL   : if digest is NULL
+ *  - ECOMM    : if no userspace policy engine is available
+ *                  or already userspace is busy
+ *                  or message transmission failed
+ *  - ENOMEM   : if message creation failed
+ *  - EMSGSIZE : if message creation failed
+ *
+ * @param [in] digest      : USB Authentication digest, must be 256 B
+ * @param [in] mask        : USB Authentication slot mask
+ * @param [out] is_known   : 1 at each index with a known digest, 0 otherwise
+ * @param [out] is_blocked : 1 if the device is known and banned, 0 otherwise
+ * @param [out] id         : if is_known and !is_blocked then contains the device handle
+ *
+ * @return 0 on SUCCESS else error code
+ */
+int usb_policy_engine_check_digest(const uint32_t route,
+				   const uint8_t *const digests,
+				   const uint8_t mask, uint8_t *is_known,
+				   uint8_t *is_blocked, uint32_t *id);
+
+/**
+ * @brief Check if a certificate chain is valid and authorized
+ *
+ * A certificate chain is valid if it can be successfully verified with one of the
+ *  root CA in store.
+ * A certificate chain is blocked if one of the certificate of chain is blocked,
+ *  due to revocation, blacklist...
+ *
+ * Context: task context, might sleep.
+ *
+ * Possible errors:
+ *  - EINVAL   : if digest is NULL
+ *  - ECOMM    : if no userspace policy engine is available
+ *                  or already userspace is busy
+ *                  or message transmission failed
+ *  - ENOMEM   : if message creation failed
+ *  - EMSGSIZE : if message creation failed
+ *
+ * TODO: see if it is necessary to have a separate boolean for is_blocked
+ *
+ * @param [in] route        : Information on the device to construct the ID
+ * @param [in] digest       : Digest corresponding to the certificate chain
+ * @param [in] chain        : Certificate chain to check, at most 4096 bytes
+ * @param [in] chain_length : Certificate chain length
+ * @param [out] is_valid    : 1 if the certificate chain can be validated
+ * @param [out] is_blocked  : 1 if the chain is valid but one of the certificate is blocked
+ * @param [out] id          : if is_known and !is_blocked then contains the device handle
+ *
+ * @return 0 on SUCCESS else -1
+ */
+int usb_policy_engine_check_cert_chain(const uint32_t route,
+				       const uint8_t *const digest,
+				       const uint8_t *const chain,
+				       const size_t chain_len,
+				       uint8_t *is_valid, uint8_t *is_blocked,
+				       uint32_t *id);
+
+/**
+ * @brief Remove a device from the policy engine
+ *
+ * Context: task context, might sleep.
+ *
+ * Possible errors:
+ *  - EINVAL   : if digest is NULL
+ *  - ECOMM    : if no userspace policy engine is available
+ *                  or already userspace is busy
+ *                  or message transmission failed
+ *  - ENOMEM   : if message creation failed
+ *  - EMSGSIZE : if message creation failed
+ *
+ * @param [in] id : Device handle
+ *
+ * @return 0 on SUCCESS else -1
+ */
+int usb_policy_engine_remove_dev(const uint32_t id);
+
+/**
+ * @brief Generate a nonce for the authentication challenge
+ *
+ * Context: task context, might sleep.
+ *
+ * Possible errors:
+ *  - EINVAL   : if digest is NULL
+ *  - ECOMM    : if no userspace policy engine is available
+ *                  or already userspace is busy
+ *                  or message transmission failed
+ *  - ENOMEM   : if message creation failed
+ *  - EMSGSIZE : if message creation failed
+ *
+ * @param [in] id     : device ID
+ * @param [out] nonce : 32 bytes nonce buffer, caller allocated
+ *
+ * @return 0 on SUCCESS else -1
+ */
+int usb_policy_engine_generate_challenge(const uint32_t id, uint8_t *nonce);
+
+/**
+ * @brief Validate the authentication challenge
+ *
+ * Context: task context, might sleep.
+ *
+ * Possible errors:
+ *  - EINVAL   : if challenge, desc or bos is NULL or invalid parameter size
+ *  - ECOMM    : if no userspace policy engine is available
+ *                  or already userspace is busy
+ *                  or message transmission failed
+ *  - ENOMEM   : if message creation failed
+ *  - EMSGSIZE : if message creation failed
+ *
+ * Challenge is the concatenation of : message (140B) | signature (64B)
+ *
+ * Check that the response challenge contains the right nonce
+ * Check that the device signature is valid
+ *
+ * @param [in] id : device handle
+ * @param [in] challenge : challenge response, must be 204 bytes
+ * @param [in] desc      : device descriptor
+ * @param [in] desc_size : descriptor size in bytes
+ * @param [in] bos       : device BOS
+ * @param [in] bos_size  : BOS size in bytes
+ * @param [out] is_valid : 1 if the signature is valid, 0 otherwise
+ *
+ * @return 0 on SUCCESS else -1
+ */
+int usb_policy_engine_check_challenge(const uint32_t id,
+				      const uint8_t *const challenge,
+				      const uint8_t *const context,
+				      const size_t context_size,
+				      uint8_t *is_valid);
+
+#endif /* __USB_CORE_AUTHENT_NETLINK_H_ */
diff --git a/include/uapi/linux/usb/usb_auth_netlink.h b/include/uapi/linux/usb/usb_auth_netlink.h
new file mode 100644
index 0000000000000000000000000000000000000000..e5b1e0e130a1ffb320aac4805161d579923a5b29
--- /dev/null
+++ b/include/uapi/linux/usb/usb_auth_netlink.h
@@ -0,0 +1,67 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * SPDX-FileCopyrightText: (C) 2025 ANSSI
+ *
+ * USB Authentication netlink interface definitions shared with userspace
+ *
+ * Author: Luc Bonnafoux <luc.bonnafoux@ssi.gouv.fr>
+ * Author: Nicolas Bouchinet <nicolas.bouchinet@ssi.gouv.fr>
+ *
+ */
+
+#ifndef __USB_AUTHENT_NETLINK_H_
+#define __USB_AUTHENT_NETLINK_H_
+
+#define USBAUTH_GENL_NAME "usb_auth_genl"
+#define USBAUTH_GENL_VERSION 1
+
+/* Attributes */
+enum usbauth_genl_attrs {
+	USBAUTH_A_REQ_ID = 1,
+	USBAUTH_A_DEV_ID,
+	USBAUTH_A_DIGEST,
+	USBAUTH_A_DIGESTS,
+	USBAUTH_A_SLOT_MASK,
+	USBAUTH_A_KNOWN,
+	USBAUTH_A_BLOCKED,
+	USBAUTH_A_VALID,
+	USBAUTH_A_CERTIFICATE,
+	USBAUTH_A_CERT_LEN,
+	USBAUTH_A_ROUTE,
+	USBAUTH_A_NONCE,
+	USBAUTH_A_CHALL,
+	USBAUTH_A_DESCRIPTOR,
+	USBAUTH_A_BOS,
+	USBAUTH_A_ERROR_CODE,
+	__USBAUTH_A_MAX,
+};
+
+#define USBAUTH_MAX_DESC_SIZE 1024
+#define USBAUTH_MAX_BOS_SIZE  1024
+
+#define USBAUTH_A_MAX (__USBAUTH_A_MAX - 1)
+
+/* Commands */
+enum usbauth_genl_cmds {
+	USBAUTH_CMD_REGISTER,
+	USBAUTH_CMD_CHECK_DIGEST,
+	USBAUTH_CMD_CHECK_CERTIFICATE,
+	USBAUTH_CMD_REMOVE_DEV,
+	USBAUTH_CMD_GEN_NONCE,
+	USBAUTH_CMD_CHECK_CHALL,
+	USBAUTH_CMD_RESP_DIGEST,
+	USBAUTH_CMD_RESP_CERTIFICATE,
+	USBAUTH_CMD_RESP_CREATE_DEV,
+	USBAUTH_CMD_RESP_REMOVE_DEV,
+	USBAUTH_CMD_RESP_GEN_NONCE,
+	USBAUTH_CMD_RESP_CHECK_CHALL,
+	__USBAUTH_CMD_MAX,
+};
+
+#define USBAUTH_CMD_MAX (__USBAUTH_CMD_MAX - 1)
+
+/* Error codes */
+#define USBAUTH_OK 0
+#define USBAUTH_INVRESP 1
+
+#endif /* __USB_AUTHENT_NETLINK_H_ */

-- 
2.50.0


