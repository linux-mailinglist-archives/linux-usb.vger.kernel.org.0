Return-Path: <linux-usb+bounces-18903-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B34519FEC29
	for <lists+linux-usb@lfdr.de>; Tue, 31 Dec 2024 02:37:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B2EEC1882AFA
	for <lists+linux-usb@lfdr.de>; Tue, 31 Dec 2024 01:37:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9777E381C4;
	Tue, 31 Dec 2024 01:37:01 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88AF4286A1;
	Tue, 31 Dec 2024 01:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735609021; cv=none; b=VnQIvKi0/SBiviMg0ClMoMjvavRqdmJHzINRdPJZHm2m0dKnM/l1HXo+pV1CWX++vezq101dkPq8mh2feFcO0IkeaNRDzMUSw/Yqyw4haYy7MDZ00ylB2M7MN1QWt65CmInPIJag0zmPjT0pQSSPOtpzpx2fc8Hj4sW8tB4llaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735609021; c=relaxed/simple;
	bh=Xzqbcc1s3aOVATyNmhK0TQsBsfoQBV9GYPkwKQ8Qkes=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cWU+3kteLejw5v/F1rhO7kyXGW8RTJEfV6qvJif1h55v3QiTYtLUKpU9krtQ8kofPjmt+xGyNRB9C9g2Ly9qmrCA0jWVX9/eafNrI087kVm1epOPk39uNbdeoqGxKUsrjiklKRu2FeH9maKUgq7ksgmL+oWxmuQ04q2eAHYqtiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-21631789fcdso95966785ad.1;
        Mon, 30 Dec 2024 17:36:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735609018; x=1736213818;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oTPwzQjkio3K8sn3MAmfdbUGqjfENbj2QxlyALzuC54=;
        b=jMkFXynd06ROzDevfBlRI8XIlT9cKzE5kiAIJcZMkkpvkmNimt2bXUCOI2mXVbhzCf
         BlJtYTMoV34dQaA//zg/MkCpaMKSHpNDmC9XR2cTP07Y4KAIIA4tPpyVXzou8x6i3Spc
         FF/0Iqupj0A7HQTyAIfv4JvdWjpJ/z6oK5OqzEogBgBMnoRWbXZQeAnZL8PWYKQJIGVP
         B8vRFpgMDi1Hk+zP9NpmYC3Ok4z/f+ptdjE0TU7+5Nq29YAbMskt/fmPTlEqUb+F5kco
         Z8m+ioQiHJZCa/wy9i23bnl1BXm5UxY88xKH9wlWvybFH6CbsFGOLjFBraA9iVNAp3Gy
         fc4Q==
X-Forwarded-Encrypted: i=1; AJvYcCV/D/F4kUS/m+mrfvoiBM8y/DLHGURzn1rRsgdP7g4eIyaQrNfLQYcTLz2UAVpai87H2fIy0Fl11yaAuB0=@vger.kernel.org, AJvYcCVvko6uBn0lMNWsP3gzLNZni5xP2Ixca00QM0JPazPyYRyiq2v7WuAMxBjI+T/17LbPmruTe87CtZPL@vger.kernel.org
X-Gm-Message-State: AOJu0YyEwowi7AakV4O367Ugy8mDARVy4xHjL0mZB3ErIqB5dfKEyz7R
	fsljeoKukw+Bhuf/yCQuSd4QYgSAYX9H5lgVitTvjq0bHL0297kB
X-Gm-Gg: ASbGncuwhjJG3ZhWsHPvx+6UiqM/UUgtDtAh26naHT9Z4G/IyMQgxRmQS0F5iFk8hc3
	4Ox0R0ueeG9pUp2uLi4xHFTDBmE/gd4rGZzvASAlBmbhfox+nKiRrw61k25txSpb6We1Fr/sfhB
	p3jbDOk7O68CI8CC6M3kT8b9ZPK1yVzubEfE5SkoPHJIFUIRcl/ExsZYSxWBEHCz7tZafv/kgqs
	PUHRJgOghiWBJoFLW4rilLZgVqaXy8e6u86osnurai+m3JzOrvpPK8JMaFvcfDDrwkmhomGqg==
X-Google-Smtp-Source: AGHT+IF1aydhk/tdMRSfGCu9t08z07nzYlKLu6pu/0HN60iMKK3pC8SD1qQAG4PctG6GWKSYjxUkMw==
X-Received: by 2002:a05:6a00:8009:b0:728:f266:cb09 with SMTP id d2e1a72fcca58-72aa9b03a0bmr66909978b3a.13.1735609017713;
        Mon, 30 Dec 2024 17:36:57 -0800 (PST)
Received: from localhost.localdomain ([116.128.244.169])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-842b31eeff3sm15260722a12.33.2024.12.30.17.36.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 17:36:57 -0800 (PST)
From: xiehongyu1@kylinos.cn
To: pawell@cadence.com
Cc: peter.chen@kernel.org,
	rogerq@kernel.org,
	frank.li@nxp.com,
	gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hongyu Xie <xiehongyu1@kylinos.cn>
Subject: [PATCH v3] usb: cdns3: remove redundant if branch
Date: Tue, 31 Dec 2024 09:36:41 +0800
Message-Id: <20241231013641.23908-1-xiehongyu1@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hongyu Xie <xiehongyu1@kylinos.cn>

cdns->role_sw->dev->driver_data gets set in routines showing below,
cdns_init
  sw_desc.driver_data = cdns;
  cdns->role_sw = usb_role_switch_register(dev, &sw_desc);
    dev_set_drvdata(&sw->dev, desc->driver_data);

In cdns_resume,
cdns->role = cdns_role_get(cdns->role_sw); //line redundant
  struct cdns *cdns = usb_role_switch_get_drvdata(sw);
    dev_get_drvdata(&sw->dev)
      return dev->driver_data
return cdns->role;

"line redundant" equals to,
	cdns->role = cdns->role;

So fix this if branch.

Fixes: 2cf2581cd229 ("usb: cdns3: add power lost support for system resume")
Signed-off-by: Hongyu Xie <xiehongyu1@kylinos.cn>
Acked-by: Peter Chen <peter.chen@kernel.org>
---
v2 to v3:
-add Acked-by

v1 to v2:
-replace bellow with below

 drivers/usb/cdns3/core.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/usb/cdns3/core.c b/drivers/usb/cdns3/core.c
index 465e9267b49c..98980a23e1c2 100644
--- a/drivers/usb/cdns3/core.c
+++ b/drivers/usb/cdns3/core.c
@@ -529,9 +529,7 @@ int cdns_resume(struct cdns *cdns)
 	int ret = 0;
 
 	if (cdns_power_is_lost(cdns)) {
-		if (cdns->role_sw) {
-			cdns->role = cdns_role_get(cdns->role_sw);
-		} else {
+		if (!cdns->role_sw) {
 			real_role = cdns_hw_role_state_machine(cdns);
 			if (real_role != cdns->role) {
 				ret = cdns_hw_role_switch(cdns);
-- 
2.25.1


