Return-Path: <linux-usb+bounces-19571-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 217A2A1862D
	for <lists+linux-usb@lfdr.de>; Tue, 21 Jan 2025 21:37:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DB835188B9D4
	for <lists+linux-usb@lfdr.de>; Tue, 21 Jan 2025 20:37:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE4761F76BE;
	Tue, 21 Jan 2025 20:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dKuELO0u"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 927101B808;
	Tue, 21 Jan 2025 20:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737491866; cv=none; b=rF99g3ms6SIxNR6G4qHEzepWq4/sTzDXk5SP1AioINyTO/16Y+iD+oORnt9VCK5lDsWez2SWjulUzhqAsjU9eYFn1/EJ8GgB9L2syv/pf9zTXpowUivwRn3e4kpBMnVj01218ljM4Wn1UU7CYoE3WASbHHWR/8vXIN3Ei4DrCrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737491866; c=relaxed/simple;
	bh=Kci+ZwSyEJwcQhwOyehiOWTnNjfk9CiAgjmwIsJF78c=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Q2ksIH1EcvGGUGnDWU2LHCJEo3Hyxj0r7eWiw928bLiPtn9zxVqEg6auY1On1trL5Y3m+ELO7FDUQDnxMLZaqwUom/z55aqNYlZ7kMZOhGd3Q+GoZ3ZCAaVwXke/IrJnL7so1WTW7vkAsozQWMGljEf/lm5G3bIaRmlj85e5Svw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dKuELO0u; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-436a39e4891so42319545e9.1;
        Tue, 21 Jan 2025 12:37:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737491862; x=1738096662; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JzvzUE09AXFwz+IHhINfnCfbgl4tJuW366iEPG5+KsU=;
        b=dKuELO0uoXUlzJEqMEbaQqxu2iSqaO+a6G7cCRsVEXl2X8RS748Lu+ZTdYDSg9sbem
         omu/mhrcuEwm2dqIt4LPa3Azbj2QVODSrDC8Z2PoMiUaZo0z1j1CIeiScdyAIiFRlO08
         Efcrik7uLAq9ykQ+ENq71nJnxPwjkNQ9BOpGSlNRLjIjmIAdVbHSXTqtvHtT+mkCBhJi
         5HQj+WRHtJzdy9mhB+wLxRia367hHXutxY+As9XwNFnjGaz2JzpYOEQ4TZV+sM5VW+el
         5eFgwN4TRzOVKQFDrDtyvGj+tt1VRVYpVUdm9vdQG6cHol/ENbLN0f/mili1iGPS/zsG
         HXhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737491862; x=1738096662;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JzvzUE09AXFwz+IHhINfnCfbgl4tJuW366iEPG5+KsU=;
        b=NGJcj3fJMEstoCy24AkysdP1upJ6cpzV20JbybRa0TA/JDN2luWp4V3l/ASp7VfMO1
         dbPrPKMjDtk3QnYHfFPQvBHcp/KingpFaKDlK79h+Ro5BX4+742XEPqZgAqAXHalR10D
         BG8BSq73YNptW4spBP+6Ci/A9CtFr934TeC+NK4iGGX0TbwdUK+frAmBYyMtDroLQ1dx
         J9zKuKpoH/27bDXS8foSAPm9byO4Z0ntUPWJTbEMakA03QG2APchAUnC59apsUcohiII
         18IBZv7okgD6smyNrIoXqpN2m/Lvgj53pAJVT659oyiVu+t3e2m3BoEevbiEgZ6j0FFn
         9XmA==
X-Forwarded-Encrypted: i=1; AJvYcCXT3eu5JURPe+IQ0tB1BJ2XGGMbcmDxV4ea0fVPBmXQSI8SgDdyesbFaUBxS8Do7iygDsdpcpm1gmHe74c=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEGjbPONeftPmzCA3PcHeBzb44NRNUo+U1dR6HkzOo3w9gu1UU
	hxEgehHXHY/TPa74iQBItCugg13CupZeLhZLO60hdoUacLREV5Dy
X-Gm-Gg: ASbGncuum64dRWgliiWrwMGYFaWE3EuGskdK9B7Ye6nyc34QNAkeaDHREanbCaebEba
	klkPxCSmJfNy6B/Ys6aNKLsYFSaTZDsFGsJjgJtOa5saE93EByZyYo3WXihIuCCh7xPdKaIHP50
	F8nBnSP/6VRuNXVse9l6JORSzvwAnUDA93nk8B9Ee5R5UtergX+LDTrLCns/RoCPiKpCa774kih
	reXVLdIZJ8HEJUhCp0Ra29A0f26Txs87auX18DkzciyUu8HBEmLmYsHsJHWkj7UY3xtww==
X-Google-Smtp-Source: AGHT+IFd77dmMb8gdrmkycK4EYNB5nQQ5SgMO6czKOez9oPHcCwt+y4jSDUssh8UyBI2fgLNIJljvQ==
X-Received: by 2002:a05:600c:5101:b0:434:f925:f5c9 with SMTP id 5b1f17b1804b1-438913c85e0mr171315475e9.6.1737491861530;
        Tue, 21 Jan 2025 12:37:41 -0800 (PST)
Received: from qasdev.Home ([2a02:c7c:6696:8300:754:6af2:3b7a:7407])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438a1f07e1bsm145866655e9.7.2025.01.21.12.37.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 12:37:41 -0800 (PST)
From: Qasim Ijaz <qasdev00@gmail.com>
To: valentina.manea.m@gmail.com,
	shuah@kernel.org,
	i@zenithal.me,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot <syzbot+83976e47ec1ef91e66f1@syzkaller.appspotmail.com>
Subject: [PATCH] USB: usbip: fix null-ptr-deref in status_show_vhci()
Date: Tue, 21 Jan 2025 20:36:48 +0000
Message-Id: <20250121203648.23775-1-qasdev00@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If usb_add_hcd() fails in vhci_hcd_probe() (i.e., a probe failure),
the error path calls usb_remove_hcd() and also sets 
pdev->dev.driver_data to NULL.

Consequently, any subsequent call to platform_get_drvdata(pdev) 
(which returns pdev->dev.driver_data) may yield NULL, causing a 
crash if that pointer is dereferenced.

Fix this by adding a sanity check to ensure "hcd" is non-NULL
before proceeding with further operations.

Reported-by: syzbot <syzbot+83976e47ec1ef91e66f1@syzkaller.appspotmail.com>
Closes: https://syzkaller.appspot.com/bug?extid=83976e47ec1ef91e66f1
Tested-by: syzbot <syzbot+83976e47ec1ef91e66f1@syzkaller.appspotmail.com>
Fixes: 03cd00d538a6 ("usbip: vhci-hcd: Set the vhci structure up to work")
Signed-off-by: Qasim Ijaz <qasdev00@gmail.com>
---
 drivers/usb/usbip/vhci_sysfs.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/usbip/vhci_sysfs.c b/drivers/usb/usbip/vhci_sysfs.c
index d5865460e82d..a5e6c3c4af06 100644
--- a/drivers/usb/usbip/vhci_sysfs.c
+++ b/drivers/usb/usbip/vhci_sysfs.c
@@ -76,6 +76,10 @@ static ssize_t status_show_vhci(int pdev_nr, char *out)
 	}
 
 	hcd = platform_get_drvdata(pdev);
+
+	if (!hcd)
+		return 0;
+
 	vhci_hcd = hcd_to_vhci_hcd(hcd);
 	vhci = vhci_hcd->vhci;
 
-- 
2.39.5


