Return-Path: <linux-usb+bounces-3455-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C9F7FC94F
	for <lists+linux-usb@lfdr.de>; Tue, 28 Nov 2023 23:18:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6BE771C20E57
	for <lists+linux-usb@lfdr.de>; Tue, 28 Nov 2023 22:18:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 846F949F8B;
	Tue, 28 Nov 2023 22:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ULD2cjSQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B817D5B
	for <linux-usb@vger.kernel.org>; Tue, 28 Nov 2023 14:18:00 -0800 (PST)
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-da1aa98ec19so7876774276.2
        for <linux-usb@vger.kernel.org>; Tue, 28 Nov 2023 14:18:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701209879; x=1701814679; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gtOvYyh8TGYD6IrQq8VICCerYbS5GRseWpF/kithmZE=;
        b=ULD2cjSQkohEETdlH+cvO1fMkphoK7YHLoDcr+B6kHrGgMGh2NdpEFaK0MlL0rdH3S
         yY9/4+26aqjaQoRAwy2Cl4q0FbAfxQ6uDSntqoTvgRmeW4ajgTFLklmuZKWiqbzy8wk6
         F78SKWywxNy12tDfJVlhnFE2+vbAo2ysz6eiL8N5EaKrYdaWA/xoM2ZPA0pOc1MLKF3o
         LKEUfsZHO71RMG7RZn0O16Qw7B/knKsnDtEXSGDjs6zKXLauFRNg0CnAGO/m3hsxg2UT
         3HFdHMgXQ7mwqigkpsWAmoyOHGA7VpzSj9hgpSmxmAiO1VXoNuGpHJVZ+o0db4zeoiRJ
         viqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701209879; x=1701814679;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gtOvYyh8TGYD6IrQq8VICCerYbS5GRseWpF/kithmZE=;
        b=TGyGe1fQn+QNeiWbiEiHmzRO2vFJMVIE41AG9E2qFDre4YllYzb29dl2cAAHKJz//s
         FE1UFPoHxZsbuCkQf3MfQiJ9cJoiz28goKpTY9nsvdxENpwI+lt7kj+34jf7W8q4L0Al
         XmFd2aPbI6z8TDy4JAT1g9o4GwFukaVvBlK8IpOCRDNFORmjbuKtOh7ybi1jmgPS/ZtE
         BWVr91l0q6DloZyuddeP69maaja86EDfhyNpU51C1pIqnRSbAnyLuIm+fNuUgLDpeGyi
         mMctBi/3OBHuUV8VTWBiloh5AEw+nfkBYMXMa+R9f6x1qIvFsdAEtSfxHS9e62qxIsuB
         Ls0Q==
X-Gm-Message-State: AOJu0YxZdzeJFF/Gh1cDmaF5WpUvN/TG6wyXsteLiFrT0ib77n1k/E5H
	c1khsQvM6gvODmKdRCFtgi5s+8ar2fQ=
X-Google-Smtp-Source: AGHT+IGQUntYpd/ff69xHUeLkNoISStZOZyRssWrSNWB1MYAnQBnISSg8Bi84PrhRI3g/WQcGy4hwxgjaas=
X-Received: from royluo-cloudtop0.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:bb8])
 (user=royluo job=sendgmr) by 2002:a25:cf8e:0:b0:daf:d9a1:ef48 with SMTP id
 f136-20020a25cf8e000000b00dafd9a1ef48mr493929ybg.9.1701209879262; Tue, 28 Nov
 2023 14:17:59 -0800 (PST)
Date: Tue, 28 Nov 2023 22:17:56 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.43.0.rc1.413.gea7ed67945-goog
Message-ID: <20231128221756.2591158-1-royluo@google.com>
Subject: [PATCH v3] USB: gadget: core: adjust uevent timing on gadget unbind
From: Roy Luo <royluo@google.com>
To: royluo@google.com, gregkh@linuxfoundation.org, stern@rowland.harvard.edu, 
	badhri@google.com, quic_kriskura@quicinc.com, francesco.dolcini@toradex.com, 
	quic_eserrao@quicinc.com, ivan.orlov0322@gmail.com, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The KOBJ_CHANGE uevent is sent before gadget unbind is actually
executed, resulting in inaccurate uevent emitted at incorrect timing
(the uevent would have USB_UDC_DRIVER variable set while it would
soon be removed).
Move the KOBJ_CHANGE uevent to the end of the unbind function so that
uevent is sent only after the change has been made.

Fixes: 2ccea03a8f7e ("usb: gadget: introduce UDC Class")
Cc: stable@vger.kernel.org
Signed-off-by: Roy Luo <royluo@google.com>
---
Changes since v1: add Fixes tag
Changes since v2: add cc stable@vger.kernel.org
---
 drivers/usb/gadget/udc/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/udc/core.c b/drivers/usb/gadget/udc/core.c
index ded9531f141b..d59f94464b87 100644
--- a/drivers/usb/gadget/udc/core.c
+++ b/drivers/usb/gadget/udc/core.c
@@ -1646,8 +1646,6 @@ static void gadget_unbind_driver(struct device *dev)
 
 	dev_dbg(&udc->dev, "unbinding gadget driver [%s]\n", driver->function);
 
-	kobject_uevent(&udc->dev.kobj, KOBJ_CHANGE);
-
 	udc->allow_connect = false;
 	cancel_work_sync(&udc->vbus_work);
 	mutex_lock(&udc->connect_lock);
@@ -1667,6 +1665,8 @@ static void gadget_unbind_driver(struct device *dev)
 	driver->is_bound = false;
 	udc->driver = NULL;
 	mutex_unlock(&udc_lock);
+
+	kobject_uevent(&udc->dev.kobj, KOBJ_CHANGE);
 }
 
 /* ------------------------------------------------------------------------- */

base-commit: 9b6de136b5f0158c60844f85286a593cb70fb364
-- 
2.43.0.rc1.413.gea7ed67945-goog


