Return-Path: <linux-usb+bounces-20911-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AC22CA3EC43
	for <lists+linux-usb@lfdr.de>; Fri, 21 Feb 2025 06:42:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E899719C52FD
	for <lists+linux-usb@lfdr.de>; Fri, 21 Feb 2025 05:42:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EF531FBEAC;
	Fri, 21 Feb 2025 05:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IS2SL16V"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 271671FBE9A
	for <linux-usb@vger.kernel.org>; Fri, 21 Feb 2025 05:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740116512; cv=none; b=cKOr7ARTfTQjKq5ySlms6vo4Nb5OFdoU0PVU2eWxnzN8PQVIBHFcMOHaYlV6SbDg6DTh/s+hFN4g3Ul0bNoCWXKZ/TwiWHyCJNfOHCjw6AickdYOXzB+3OPbxy3hQWwNizLVLBZVxVvHfpb+3Fonw4ksgarcGb+BChbwt5dA8q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740116512; c=relaxed/simple;
	bh=ilISTW/eath5opKTF7wIRlnjtIim9vl5TMNYB2xO0os=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cxMchGRG7y91Sr8ZFWCM/R7rOXssLPMaOL9cjfiYGZy/LOw7AqrxRg23Q50zdvg4178fGAJ4wAu4pLyGEBkuq/k+QVLKKRwLPgt2Sh5q+f+fQYIP+mKzCQOfgxva2Ft/NTxWSczOm9Q63g90Tm59FtPYne6rn8gD30RzRUtvlpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IS2SL16V; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CB33C4CEE2;
	Fri, 21 Feb 2025 05:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740116511;
	bh=ilISTW/eath5opKTF7wIRlnjtIim9vl5TMNYB2xO0os=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IS2SL16VhkU2dZLLoGNcT3vkXfJvH9vZl7DVX6ka4qKOP0Un+nI32H2PoaLxmu6oM
	 M1Be1UTxSYb700ehbJw1ERk1oQXHYfbLusl0aBooPMKB5P85uL34QdEQXH0dnQuHfm
	 SP7zSyeWUZX/J8D+ORzD3fzBU/n9AnynkWQBHDNP7xAyPJZ7BcboqdA4GlwWgTjCJW
	 i2ehrVKRhuLxlk6CLhp9bWR+ZYgR7WsJJhmeh7SPSJqEDPxLdZFkGbv1HiFnfcX9nq
	 SpWUxiH9x/6LFBCu09V5OBSNjifrOlUDkc/P9KwRtktpdrDc/jbBQEbLL+Qa7ATSiu
	 Z02piYJ41YNmg==
From: Mario Limonciello <superm1@kernel.org>
To: mario.limonciello@amd.com,
	heikki.krogerus@linux.intel.com,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org
Subject: [PATCH 2/2] ucsi_ccg: Don't show non-functional attributes
Date: Thu, 20 Feb 2025 23:40:04 -0600
Message-ID: <20250221054137.1631765-3-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250221054137.1631765-1-superm1@kernel.org>
References: <20250221054137.1631765-1-superm1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mario Limonciello <mario.limonciello@amd.com>

If no fw_build is recognized for the controller there is no point to
exposing the `do_flash` attribute.

Add an is_visible callback to the attribute group and check for that
fw_build member to hide when not applicable.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/usb/typec/ucsi/ucsi_ccg.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
index 663aca9421410..801a66efa9820 100644
--- a/drivers/usb/typec/ucsi/ucsi_ccg.c
+++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
@@ -1390,22 +1390,35 @@ static ssize_t do_flash_store(struct device *dev,
 	if (!flash)
 		return n;
 
-	if (uc->fw_build == 0x0) {
-		dev_err(dev, "fail to flash FW due to missing FW build info\n");
-		return -EINVAL;
-	}
-
 	schedule_work(&uc->work);
 	return n;
 }
 
+static umode_t ucsi_ccg_attrs_is_visible(struct kobject *kobj, struct attribute *attr, int idx)
+{
+	struct device *dev = kobj_to_dev(kobj);
+	struct ucsi_ccg *uc = i2c_get_clientdata(to_i2c_client(dev));
+
+	if (!uc->fw_build)
+		return 0;
+
+	return attr->mode;
+}
+
 static DEVICE_ATTR_WO(do_flash);
 
 static struct attribute *ucsi_ccg_attrs[] = {
 	&dev_attr_do_flash.attr,
 	NULL,
 };
-ATTRIBUTE_GROUPS(ucsi_ccg);
+static struct attribute_group ucsi_ccg_attr_group = {
+	.attrs = ucsi_ccg_attrs,
+	.is_visible = ucsi_ccg_attrs_is_visible,
+};
+static const struct attribute_group *ucsi_ccg_groups[] = {
+	&ucsi_ccg_attr_group,
+	NULL,
+};
 
 static int ucsi_ccg_probe(struct i2c_client *client)
 {
-- 
2.43.0


