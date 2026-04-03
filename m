Return-Path: <linux-usb+bounces-35954-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sHm0MJJA0Gk45QYAu9opvQ
	(envelope-from <linux-usb+bounces-35954-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 04 Apr 2026 00:34:58 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C42D398C66
	for <lists+linux-usb@lfdr.de>; Sat, 04 Apr 2026 00:34:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CCD76300908D
	for <lists+linux-usb@lfdr.de>; Fri,  3 Apr 2026 22:34:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD2B130E0E5;
	Fri,  3 Apr 2026 22:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EOcd+dKf"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-dl1-f73.google.com (mail-dl1-f73.google.com [74.125.82.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00A0A33D4E2
	for <linux-usb@vger.kernel.org>; Fri,  3 Apr 2026 22:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775255662; cv=none; b=MaIBsXObWsQJjo3Y94Dx0/fgVrZPhIZd++Ub3YR5hm54Lsjo+TwNzAjARamw+0LPNxZRKAXeAL178wGbRhsRjpqpnWa/IPF7cRbsxeVCPt2T3bdfbgjW2h72ANphQ1xQJTHseu/hHe3SBR1d61bDH9oQoRidIZCnKYrhOfS/whE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775255662; c=relaxed/simple;
	bh=dvntkxxmMie+ddQCkiP2EwdOS56VxGjSqZlx8z6hx5s=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=lWoGaxEsh/maPz8dD8IJM2bXkfaStHiK8PyUBZTBxy+qXbzXxI958x4h1rBrqssXhhikX6m+bYWOxD1r3F64JZLnOs5E4legGEHdE6B4AdHO4CJrJSthAhmaa0ke4N/CR0QLCWD7nTmBXxM5IKQnouDTZ8HFe2bJqERYL5zyGZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EOcd+dKf; arc=none smtp.client-ip=74.125.82.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com
Received: by mail-dl1-f73.google.com with SMTP id a92af1059eb24-12c01e42fe2so2099022c88.0
        for <linux-usb@vger.kernel.org>; Fri, 03 Apr 2026 15:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775255660; x=1775860460; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Qc81YdAjdlIvoqkBdkIORHlgXU4Am8QfAVGQhkBrGE0=;
        b=EOcd+dKfc/Ck/LCQs418kigcpsV9uc630r/XG0nnkMwQELlSJmb+nOczkjuA92VqCi
         zOUvgrO/tlLQlIGws0yMtxqqItfHWe6dZWh/jeXCNt/ppPBlHKfRmUBJDbANdgpxVNYk
         YsG3N5CZVrVV/hjBoNsPEoV6R21OenaeJq841OGcWz/cfr+xr0AnBI/RVzqblO1DATV+
         QecCxtlgX7W/a20qU2osIh8gRzwfXxQ7UjlalEZSVPVUBUQN7uO8b1V2R4sF3UFOpxv+
         AOx8HRxiLbLTBn2+F4JKF8THRbXMUUXKSOEPPketDfsIitKZgvqTsIV+MGEWC7PtoQX5
         kPbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775255660; x=1775860460;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qc81YdAjdlIvoqkBdkIORHlgXU4Am8QfAVGQhkBrGE0=;
        b=sMF8KwxjlJgelfF6n6FWET4xLUEXBmLPKDcLIY4PXk3RilUDnQVFw5r7oZLdQb5w+Q
         +ycYOs0jvTyl/p8ct7k43yblSGTjJBnOxsSZhCuStKpYNeyNaG2mztF77Tx4HrM9Uw+M
         SiAI6Ju2SaZ+8GXcKBMPxUzIOU1iHwfWCgkn0QVJOXVfvgMEngQU/TafuMNA4WRRU1Ps
         vafkEV1aTI6Df4+xCJnRe3aM3IpH4b1u2RlvHPsdc6eYlyvRdafhh3nw9kJPDHigPpm7
         4mFSow/wfpBNJlvWB2f4PbRIbigut/65VhmRYugHRIdUNDNdpFtG4+GGlzDI1ZvBQVgq
         0Zdw==
X-Forwarded-Encrypted: i=1; AJvYcCVvRP0qYw/y4wqJaT4wXCaHQ+I6iTrFVh6BSi0+F3QqDO/d7xSU0RA/w17qlwF9g5PWMMthyTdWhf4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXpuUj4xzxFVPn32sRIsAGxrTl8pruyRUTyjOVm/ED+BnGXxHC
	pwbZDEqZT/3aLPVg+pChEbGvAD9k9F9xaREZ2ObtBFbazfGFdffc28Y1E8n3OKZNyHOGqg9CUlL
	eguOg+g==
X-Received: from dycc2.prod.google.com ([2002:a05:693c:60c2:b0:2c4:d97b:c1a8])
 (user=jthies job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:90e:b0:123:34e8:aec2
 with SMTP id a92af1059eb24-12bfb6e8e9dmr2211753c88.1.1775255659929; Fri, 03
 Apr 2026 15:34:19 -0700 (PDT)
Date: Fri,  3 Apr 2026 22:33:27 +0000
In-Reply-To: <20260403223357.1896403-1-jthies@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260403223357.1896403-1-jthies@google.com>
X-Mailer: git-send-email 2.53.0.1213.gd9a14994de-goog
Message-ID: <20260403223357.1896403-3-jthies@google.com>
Subject: [PATCH v1 2/2] usb: typec: cros_ec_ucsi: Load driver from OF and ACPI definitions
From: Jameson Thies <jthies@google.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	abhishekpandit@chromium.org, bleung@chromium.org, 
	heikki.krogerus@linux.intel.com, akuchynski@chromium.org
Cc: gregkh@linuxfoundation.org, devicetree@vger.kernel.org, 
	chrome-platform@lists.linux.dev, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jameson Thies <jthies@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35954-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jthies@google.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6C42D398C66
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add support for cros_ec_ucsi to load based on "google,cros-ec-ucsi"
compatible devices and "GOOG0021" ACPI nodes.

Signed-off-by: Jameson Thies <jthies@google.com>
---
 drivers/usb/typec/ucsi/cros_ec_ucsi.c | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/ucsi/cros_ec_ucsi.c b/drivers/usb/typec/ucsi/cros_ec_ucsi.c
index 6bca2dce211c..251aa7251ce6 100644
--- a/drivers/usb/typec/ucsi/cros_ec_ucsi.c
+++ b/drivers/usb/typec/ucsi/cros_ec_ucsi.c
@@ -5,11 +5,13 @@
  * Copyright 2024 Google LLC.
  */
 
+#include <linux/acpi.h>
 #include <linux/container_of.h>
 #include <linux/dev_printk.h>
 #include <linux/jiffies.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/platform_data/cros_ec_commands.h>
 #include <linux/platform_data/cros_usbpd_notify.h>
 #include <linux/platform_data/cros_ec_proto.h>
@@ -257,7 +259,6 @@ static void cros_ucsi_destroy(struct cros_ucsi_data *udata)
 static int cros_ucsi_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct cros_ec_dev *ec_data = dev_get_drvdata(dev->parent);
 	struct cros_ucsi_data *udata;
 	int ret;
 
@@ -265,9 +266,16 @@ static int cros_ucsi_probe(struct platform_device *pdev)
 	if (!udata)
 		return -ENOMEM;
 
+	/* ACPI and OF FW nodes for cros_ec_ucsi are children of the ChromeOS EC. If the
+	 * cros_ec_ucsi device has an ACPI or OF FW node, its parent is the ChromeOS EC device.
+	 * Platforms without a FW node for cros_ec_ucsi may add it as a subdevice of cros_ec_dev.
+	 */
 	udata->dev = dev;
+	if (is_acpi_device_node(dev->fwnode) || is_of_node(dev->fwnode))
+		udata->ec = dev_get_drvdata(dev->parent);
+	else
+		udata->ec = ((struct cros_ec_dev *)dev_get_drvdata(dev->parent))->ec_dev;
 
-	udata->ec = ec_data->ec_dev;
 	if (!udata->ec)
 		return dev_err_probe(dev, -ENODEV, "couldn't find parent EC device\n");
 
@@ -348,10 +356,24 @@ static const struct platform_device_id cros_ucsi_id[] = {
 };
 MODULE_DEVICE_TABLE(platform, cros_ucsi_id);
 
+static const struct acpi_device_id cros_ec_ucsi_acpi_device_ids[] = {
+	{ "GOOG0021", 0 },
+	{ }
+};
+MODULE_DEVICE_TABLE(acpi, cros_ec_ucsi_acpi_device_ids);
+
+static const struct of_device_id cros_ucsi_of_match[] = {
+	{ .compatible = "google,cros-ec-ucsi", },
+	{}
+};
+MODULE_DEVICE_TABLE(of, cros_ucsi_of_match);
+
 static struct platform_driver cros_ucsi_driver = {
 	.driver = {
 		.name = KBUILD_MODNAME,
 		.pm = &cros_ucsi_pm_ops,
+		.acpi_match_table = cros_ec_ucsi_acpi_device_ids,
+		.of_match_table = cros_ucsi_of_match,
 	},
 	.id_table = cros_ucsi_id,
 	.probe = cros_ucsi_probe,
-- 
2.53.0.1213.gd9a14994de-goog


