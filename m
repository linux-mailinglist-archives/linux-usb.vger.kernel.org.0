Return-Path: <linux-usb+bounces-14417-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D57C4967214
	for <lists+linux-usb@lfdr.de>; Sat, 31 Aug 2024 16:21:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 32038B21A59
	for <lists+linux-usb@lfdr.de>; Sat, 31 Aug 2024 14:21:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7633B200AF;
	Sat, 31 Aug 2024 14:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ObrCbgnl"
X-Original-To: linux-usb@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A4D1DDF4
	for <linux-usb@vger.kernel.org>; Sat, 31 Aug 2024 14:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725114067; cv=none; b=jpNYPohb+jbgV7OozuG5cULOY2MOtG/7O05kGwR/huKR67XsUDtRbAkJLccXbhdIftD9kqTx1usGBEnwe4WU0rTcPULh9U4gUvgk0zrkjRL3QEM2HlQsNbssWag9E8gDGYJRjy2b9mng0sffK2Hgxndwvug8L+8neOvCEumUDIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725114067; c=relaxed/simple;
	bh=wxAqhT4ylvXwfHeaFXx2m6qv7+IPXABabJmxntIS9rA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k3DGdJGmJDjwMi5g1jbDFWmeQnhup9QmEGznBiXJkPzeTFDDcv2Jttn8K1SmpHjHCv5JNcS8C6GwqimTqdbX6l+ep5773riP883qIQ1JaBMog5q43qVxu9zsUce6jgMyH4/u4Fi3aUhJXPKbKLV+gq+9Ake4HCuUCuiC2SuBvEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ObrCbgnl; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725114064;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/lkCNG9OGHuMCZ2ifhRy12eWeNAdzUD42d8uAz9aRXo=;
	b=ObrCbgnlQKfORNxuqp1wf9uZESM6W4v0TmqzGbQnebFqZ7EguxSxragvr8PLrfPD4IKSOP
	SDj6aTrD9VBt61OFjBI+ZANwCJCYcFLZoREMK4jKIUP2J60xuT3OeNNSJyh4WTwaL0RIqn
	OWMdEdoDY/I5d4krH0wkBgsao9uZEEE=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-528-QNnOJ3KPMVKqjF4lldj5AA-1; Sat,
 31 Aug 2024 10:20:58 -0400
X-MC-Unique: QNnOJ3KPMVKqjF4lldj5AA-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 84F821955D47;
	Sat, 31 Aug 2024 14:20:55 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.42])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 9B9053001FE8;
	Sat, 31 Aug 2024 14:20:50 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sebastian Reichel <sre@kernel.org>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	MyungJoo Ham <myungjoo.ham@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Enric Balletbo Serra <enric.balletbo@collabora.com>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-phy@lists.infradead.org
Subject: [PATCH 1/6] power: supply: "usb_type" property may be written to
Date: Sat, 31 Aug 2024 16:20:34 +0200
Message-ID: <20240831142039.28830-2-hdegoede@redhat.com>
In-Reply-To: <20240831142039.28830-1-hdegoede@redhat.com>
References: <20240831142039.28830-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

According to Documentation/ABI/testing/sysfs-class-power the "usb_type"
property is Read-Only.

For power-supplies which consume USB power such as battery charger chips,
this is correct.

But the UCS1002 USB Port Power Controller driver which is a driver
for a chip which is a power-source for USB-A charging ports "usb_type"
is actually writable to configure the type of USB charger emulated
by the USB-A port.

Adjust the docs and the power_supply_sysfs.c code to adjust for this
new writeable use of "usb_type":

1. Update Documentation/ABI/testing/sysfs-class-power to document that
"usb_type" may be writable

2. Change the power_supply_attr type in power_supply_sysfs.c from
POWER_SUPPLY_ATTR() into POWER_SUPPLY_ENUM_ATTR() so that the various
usb_type string values from POWER_SUPPLY_TYPE_TEXT[] such as e.g.
"SDP" and "USB_PD" can be written to the "usb_type" attribute instead
of only accepting integer values.

Cc: Enric Balletbo Serra <enric.balletbo@collabora.com>
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 Documentation/ABI/testing/sysfs-class-power | 7 ++++++-
 drivers/power/supply/power_supply_sysfs.c   | 2 +-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-class-power b/Documentation/ABI/testing/sysfs-class-power
index 84973f66b42c..45180b62d426 100644
--- a/Documentation/ABI/testing/sysfs-class-power
+++ b/Documentation/ABI/testing/sysfs-class-power
@@ -608,7 +608,12 @@ Description:
 		the supply, for example it can show if USB-PD capable source
 		is attached.
 
-		Access: Read-Only
+		Access: For power-supplies which consume USB power such
+		as battery charger chips, this indicates the type of
+		the connected USB power source and is Read-Only.
+
+		For power-supplies which act as a USB power-source such as
+		e.g. the UCS1002 USB Port Power Controller this is writable.
 
 		Valid values:
 			      "Unknown", "SDP", "DCP", "CDP", "ACA", "C", "PD",
diff --git a/drivers/power/supply/power_supply_sysfs.c b/drivers/power/supply/power_supply_sysfs.c
index 3e63d165b2f7..ff7e423edd57 100644
--- a/drivers/power/supply/power_supply_sysfs.c
+++ b/drivers/power/supply/power_supply_sysfs.c
@@ -209,7 +209,7 @@ static struct power_supply_attr power_supply_attrs[] = {
 	POWER_SUPPLY_ATTR(TIME_TO_FULL_NOW),
 	POWER_SUPPLY_ATTR(TIME_TO_FULL_AVG),
 	POWER_SUPPLY_ENUM_ATTR(TYPE),
-	POWER_SUPPLY_ATTR(USB_TYPE),
+	POWER_SUPPLY_ENUM_ATTR(USB_TYPE),
 	POWER_SUPPLY_ENUM_ATTR(SCOPE),
 	POWER_SUPPLY_ATTR(PRECHARGE_CURRENT),
 	POWER_SUPPLY_ATTR(CHARGE_TERM_CURRENT),
-- 
2.46.0


