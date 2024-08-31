Return-Path: <linux-usb+bounces-14419-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C81396721A
	for <lists+linux-usb@lfdr.de>; Sat, 31 Aug 2024 16:22:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 11A1D283832
	for <lists+linux-usb@lfdr.de>; Sat, 31 Aug 2024 14:22:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4183544C97;
	Sat, 31 Aug 2024 14:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LgolAHSL"
X-Original-To: linux-usb@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 616843A29A
	for <linux-usb@vger.kernel.org>; Sat, 31 Aug 2024 14:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725114075; cv=none; b=KT0ohN5LsWbzkdqwPARpFpRyRfCUzRionvqq6REdUIDc8CJXOtjYr89cwKg8IO9Z+/LfElrbgG0xOwoITFkwMCysPD4sM7NMXW7248iGVD2E/W04kXj4FpGYU7pTaKA+zd0TXbAkE6btGNtjEFNo0AbbVShjRCEbxBXzSNOnbjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725114075; c=relaxed/simple;
	bh=Q1ksihjpVfuP+VRWxZRsYugofz9jYU44EY/sBMoBMEs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DAGoUjV7SFYRRfdY9//TaRD0zpyTu0naoCFSuS/RN1L+WLRaRg+fv6FuwG5dIthp8pVb1NGgoHQUcHgE0HHFREy9N77WDzdCEwplPrjB5yQufWVMIlERdSp8VtHQ6F/q45pT5uYlmF+9ZRk7oLWtZbGWfAs1PQ+RvN8EDBSlxCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LgolAHSL; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725114073;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a+YaXcuOLFlVp84HCFFSCXL1mJivlfEZlF6lzWx9g7c=;
	b=LgolAHSLQGa2kaemCmO3TCbwU4ztLwjQ3dzfxlPdgtUWYEac545AMmtrKU7b+W1V8dU5k9
	bmbui8UWA2TFpY4tvXsmprvySpXepZOju99S8XQukIaqLObmDh0MvqgMkbuyR/Sn0mDP3f
	SByyLr9CBD9hQRxi519WyvaxhBxs6VQ=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-629-zT7G6qIhP6O32hWBOUjMtA-1; Sat,
 31 Aug 2024 10:21:07 -0400
X-MC-Unique: zT7G6qIhP6O32hWBOUjMtA-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 49E4A19560B7;
	Sat, 31 Aug 2024 14:21:05 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.42])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 323B13001FE8;
	Sat, 31 Aug 2024 14:21:00 +0000 (UTC)
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
Subject: [PATCH 3/6] power: supply: rt9467-charger: Remove "usb_type" property write support
Date: Sat, 31 Aug 2024 16:20:36 +0200
Message-ID: <20240831142039.28830-4-hdegoede@redhat.com>
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

The "usb_type" property must be read-only for charger power-supply devices,
see: Documentation/ABI/testing/sysfs-class-power.

But the rt9467 driver allows writing 0/1 to it to disable/enable charging.
Other charger drivers use the "status" property for this and the rt9467
code also allows writing 0/1 to its "status" property and this does
the exact same thing as writing 0/1 to its "usb_type" property.

Drop write support for the "usb_type" property making it readonly to match
the ABI documentation. If userspace wants to disable/enable charging it
can use the "status" property for this.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/power/supply/rt9467-charger.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/power/supply/rt9467-charger.c b/drivers/power/supply/rt9467-charger.c
index fdfdc83ab045..f935bd761ac1 100644
--- a/drivers/power/supply/rt9467-charger.c
+++ b/drivers/power/supply/rt9467-charger.c
@@ -745,8 +745,6 @@ static int rt9467_psy_set_property(struct power_supply *psy,
 						    RT9467_RANGE_IPREC, val->intval);
 	case POWER_SUPPLY_PROP_CHARGE_TERM_CURRENT:
 		return rt9467_psy_set_ieoc(data, val->intval);
-	case POWER_SUPPLY_PROP_USB_TYPE:
-		return regmap_field_write(data->rm_field[F_USBCHGEN], val->intval);
 	default:
 		return -EINVAL;
 	}
@@ -764,7 +762,6 @@ static int rt9467_chg_prop_is_writeable(struct power_supply *psy,
 	case POWER_SUPPLY_PROP_INPUT_VOLTAGE_LIMIT:
 	case POWER_SUPPLY_PROP_CHARGE_TERM_CURRENT:
 	case POWER_SUPPLY_PROP_PRECHARGE_CURRENT:
-	case POWER_SUPPLY_PROP_USB_TYPE:
 		return 1;
 	default:
 		return 0;
-- 
2.46.0


