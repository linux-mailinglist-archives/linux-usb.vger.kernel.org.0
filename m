Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC01FD86DA
	for <lists+linux-usb@lfdr.de>; Wed, 16 Oct 2019 05:43:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728295AbfJPDnW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 15 Oct 2019 23:43:22 -0400
Received: from mail-pg1-f202.google.com ([209.85.215.202]:34328 "EHLO
        mail-pg1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726491AbfJPDnV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 15 Oct 2019 23:43:21 -0400
Received: by mail-pg1-f202.google.com with SMTP id x35so15824196pgk.1
        for <linux-usb@vger.kernel.org>; Tue, 15 Oct 2019 20:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=3r2fWGxvgUo0Yo2JWFT9X062NRVoB/qS/ldqIiIuY8s=;
        b=KT9pcH/Y/FaK79bj33Qplyav4SbvcU1eXOx+WWEi8c9T7Gt8wzPnGCoIFGeytCNgeU
         It/vKDY57qKVstZ0RcnIdE9xUZ+p7B3NuT+v1wF6M7ogvTbTqg5Xu3+ZVBcS3aFfpt5F
         yqWgjKQvjeJIdB2NUGY1Id1Ernfk+37C5wqfoPpqM2s3dWKP4LCv6ucy/wr8lNzztO2Y
         oJQyTKA7R0zy60+QoMOMsWOz5QD7S53OXekL/0Xb3BlSlG72IueBnAOUlBN6J4njWg/i
         Yi8O7/0xoMl4noa2Kb94yamYqvf7e9QV13Kby15xQ7u9JQCa76gxrplIL9bNT0J6uHHY
         T0EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=3r2fWGxvgUo0Yo2JWFT9X062NRVoB/qS/ldqIiIuY8s=;
        b=jZ7XlB3d1D/CyL2kzpDHwsrNze/5jMeyWSHw/3X1LUudszpO0Z5WD3z8mOLIxI3LwS
         1ExkFfuksVA6D4HIaa569t0TTWPySF++9tOCfTSnJwRKygEN79YaRSmW7v7cBsGPFVY0
         pyvV3yHgLYa/S0AB3D4pu2GC8yv8YgD9pXTTmB2RHN15961MKMsNsRyxX5r9rYZsPIp2
         IffGF0UqvZbjADglJX1G6Ync70baTW0c7Ncp/5cF3dNAQ/Axbifsr3urnkDsRSBMmLwG
         PDmttcccyD+NqeZkKARIv7BPoTcXHbo8Fj8Hw8NXugPC5IxPFXdAB2wumxibzYOYK4y8
         ohOQ==
X-Gm-Message-State: APjAAAX6fHP9IbYgHlDccNaM5gXndc0UDAlUKgTKisnjC1VLpge9oqyY
        ZK47+Bk3t33TRcPdbZq6WXIeHO1NCVwR
X-Google-Smtp-Source: APXvYqyJAy3vPQrYVK62MzhPtX5xwdVYaUoQaNuPEgf8HBFGfgBsL6wMLw93KjNV7LBk5eI+MCW5197pm/KY
X-Received: by 2002:a63:d916:: with SMTP id r22mr42503950pgg.46.1571197400669;
 Tue, 15 Oct 2019 20:43:20 -0700 (PDT)
Date:   Wed, 16 Oct 2019 11:43:14 +0800
Message-Id: <20191016034314.231363-1-pumahsu@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.23.0.700.g56cf767bdb-goog
Subject: [PATCH] usb: typec: Add sysfs node to show cc orientation
From:   pumahsu <pumahsu@google.com>
To:     heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org
Cc:     badhri@google.com, kyletso@google.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, pumahsu <pumahsu@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Export the Type-C cc orientation so that user space can
get this information.

Signed-off-by: pumahsu <pumahsu@google.com>
---
 Documentation/ABI/testing/sysfs-class-typec |  7 +++++++
 drivers/usb/typec/class.c                   | 11 +++++++++++
 2 files changed, 18 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-class-typec b/Documentation/ABI/testing/sysfs-class-typec
index d7647b258c3c..419f952c991d 100644
--- a/Documentation/ABI/testing/sysfs-class-typec
+++ b/Documentation/ABI/testing/sysfs-class-typec
@@ -108,6 +108,13 @@ Contact:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
 Description:
 		Revision number of the supported USB Type-C specification.
 
+What:		/sys/class/typec/<port>/cc_orientation
+Date:		September 2019
+Contact:	Puma Hsu <pumahsu@google.com>
+Description:
+		Indicates which cc orientation is active now, or 0 when
+		nothing is connected.
+
 
 USB Type-C partner devices (eg. /sys/class/typec/port0-partner/)
 
diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index 7d8805d9bf37..00edae63da8e 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -1238,6 +1238,16 @@ static ssize_t usb_power_delivery_revision_show(struct device *dev,
 }
 static DEVICE_ATTR_RO(usb_power_delivery_revision);
 
+static ssize_t cc_orientation_show(struct device *dev,
+						struct device_attribute *attr,
+						char *buf)
+{
+	struct typec_port *p = to_typec_port(dev);
+
+	return sprintf(buf, "%d\n", typec_get_orientation(p));
+}
+static DEVICE_ATTR_RO(cc_orientation);
+
 static struct attribute *typec_attrs[] = {
 	&dev_attr_data_role.attr,
 	&dev_attr_power_operation_mode.attr,
@@ -1248,6 +1258,7 @@ static struct attribute *typec_attrs[] = {
 	&dev_attr_usb_typec_revision.attr,
 	&dev_attr_vconn_source.attr,
 	&dev_attr_port_type.attr,
+	&dev_attr_cc_orientation.attr,
 	NULL,
 };
 ATTRIBUTE_GROUPS(typec);
-- 
2.23.0.700.g56cf767bdb-goog

