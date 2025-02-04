Return-Path: <linux-usb+bounces-20139-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B3743A27FB4
	for <lists+linux-usb@lfdr.de>; Wed,  5 Feb 2025 00:37:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5259D1885822
	for <lists+linux-usb@lfdr.de>; Tue,  4 Feb 2025 23:37:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1509722068D;
	Tue,  4 Feb 2025 23:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3AixAuJx"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-vk1-f202.google.com (mail-vk1-f202.google.com [209.85.221.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 062F2215F6E
	for <linux-usb@vger.kernel.org>; Tue,  4 Feb 2025 23:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738712209; cv=none; b=KZnr4QCmT8JqO8NW000PBoX1M5oQ5FumF4JN8YXV8rPTTqPU2ckh+FZJk9Wu5KDu8LBb8gAr1AKvInBmaXFvKFI8VlaMD6Bk+6QryO2FIi1HsDIlrgMR/SFt0+6i+mTx7nyn1xBB1/u/E3heCSEzE+a/l3J5q+NU7tDmdzGrk84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738712209; c=relaxed/simple;
	bh=qpfQTDheYUA9fYCH8Nr2dmrMbuSUIH8GoGeahli4TyA=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=BelBTtHY1ku94N2QZ7DoODdmB1D3zbFhgwc+2z1r2DzegDo1pSM1kB4U0ZMgwI9HhWKuWzHzYdYg67MU9EOMPgJnA/VylJgwwok4UnsYsnJJdiMJ1GNKaN1b9uFldT0b1lcHpuGHcGIdePp/7jscGRq/3QnFO4oM4fFH201v70o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--royluo.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3AixAuJx; arc=none smtp.client-ip=209.85.221.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--royluo.bounces.google.com
Received: by mail-vk1-f202.google.com with SMTP id 71dfb90a1353d-5160b1705b8so1418419e0c.1
        for <linux-usb@vger.kernel.org>; Tue, 04 Feb 2025 15:36:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738712207; x=1739317007; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=EgtkKatdG0S9Pe613E3mNyAnYsjwJSKIyXvHCOEHLD8=;
        b=3AixAuJxD34h4yxa5q/NFruN2WwfMVfgXo+h5XYaTBhM1/yQpNTIx4IvdPedAJzgRA
         6A9To8r1a2kmKDBsk+xzE10/u+NmabNKM87MUNjBFEq7TzrP/B/avp5/P3plOa+yg2yU
         JTHeSr9dVJ1s1LyI5gx2XJ0VhLgqULEKbDTFaMGkiMnYUjMfmrem2cr/Tyr/8yTHAY9L
         h/2IIN4Mkd5s26PT7xBlagzKpQZht9+WzMMwQ2F4cabKIeYh7tf4bvmESV73yzR9kiUZ
         fomqJIEfortX0djyD8B7MI2UC/pbQZAxNHWVwQRgfgKM6Oq/I4MAT7QoqmuvOGvB8QTj
         74xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738712207; x=1739317007;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EgtkKatdG0S9Pe613E3mNyAnYsjwJSKIyXvHCOEHLD8=;
        b=xJCHBjLKgAJJKsn7B+N46y1oT0ZjAU403taH4Ny9SiUB/kcWSU1O/jShMOe54G12ZR
         kEj3UZEY+9V5upXkEtQ7Crff948hoDmoIYhG2EenJjfKTN37pzSsbSJGk/WSvs17RZij
         ouO1p/CD5+OfHPnEJem3tBEi/zb8YqAobMhURAru/4LCaCIyJj/0d1WJzlfD50VUmjgS
         Nbyg4wys3640UpQFgii5iGGnThAdf9UOERUIzDTl1dxIBXKsRkbz8VJWaW6yg+Ofn6P5
         ypfqA4b0v6UnlYdRsfKDD8ubnw+x8nD/dXdBiEvkQAtM5Z+sxb9wvMKQ/nXJry8Inxi7
         qNtw==
X-Forwarded-Encrypted: i=1; AJvYcCWe0pmXgzbhkRHAfX8KoWZMCwzx+JiiDu5CHx1lVLRLcDhSLmB8alrertLToYI9/B/2/MNt+o/xhag=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKdIKA4/4RX7BVpLIFfXnmNNUNw0z6+nety5VzGf3A4zXGakDP
	/VnuaGwsAjDNHO0k7BjxNvmnNFO79ONQhdBQbiBg6WChvLfbfYIUZ12+H1SUcEBvMeYiH0hKL3+
	1Zw==
X-Google-Smtp-Source: AGHT+IHLmJQMOHisVnRtKMgv2ybXEZeJENK07fK0AuOA8MPyXUxQYl+xPhHPKdpsSt0+Iplrr5S2y+x6ejs=
X-Received: from vsae9.prod.google.com ([2002:a05:6102:349:b0:4af:e39b:2b2])
 (user=royluo job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6102:2b8d:b0:4af:ed5a:b697
 with SMTP id ada2fe7eead31-4ba478e696cmr962885137.13.1738712206734; Tue, 04
 Feb 2025 15:36:46 -0800 (PST)
Date: Tue,  4 Feb 2025 23:36:42 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.48.1.362.g079036d154-goog
Message-ID: <20250204233642.666991-1-royluo@google.com>
Subject: [PATCH v2] usb: gadget: core: flush gadget workqueue after device removal
From: Roy Luo <royluo@google.com>
To: royluo@google.com, Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	andre.draszik@linaro.org, elder@kernel.org, stern@rowland.harvard.edu, 
	crwulff@gmail.com, paul@crapouillou.net, jkeeping@inmusicbrands.com, 
	yuanlinyu@hihonor.com, sumit.garg@linaro.org, balbi@ti.com
Cc: stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

device_del() can lead to new work being scheduled in gadget->work
workqueue. This is observed, for example, with the dwc3 driver with the
following call stack:
  device_del()
    gadget_unbind_driver()
      usb_gadget_disconnect_locked()
        dwc3_gadget_pullup()
	  dwc3_gadget_soft_disconnect()
	    usb_gadget_set_state()
	      schedule_work(&gadget->work)

Move flush_work() after device_del() to ensure the workqueue is cleaned
up.

Fixes: 5702f75375aa9 ("usb: gadget: udc-core: move sysfs_notify() to a workqueue")
Cc: <stable@vger.kernel.org>
Signed-off-by: Roy Luo <royluo@google.com>
---
 drivers/usb/gadget/udc/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/core.c b/drivers/usb/gadget/udc/core.c
index a6f46364be65..4b3d5075621a 100644
--- a/drivers/usb/gadget/udc/core.c
+++ b/drivers/usb/gadget/udc/core.c
@@ -1543,8 +1543,8 @@ void usb_del_gadget(struct usb_gadget *gadget)
 
 	kobject_uevent(&udc->dev.kobj, KOBJ_REMOVE);
 	sysfs_remove_link(&udc->dev.kobj, "gadget");
-	flush_work(&gadget->work);
 	device_del(&gadget->dev);
+	flush_work(&gadget->work);
 	ida_free(&gadget_id_numbers, gadget->id_number);
 	cancel_work_sync(&udc->vbus_work);
 	device_unregister(&udc->dev);

base-commit: f286757b644c226b6b31779da95a4fa7ab245ef5
-- 
2.48.1.362.g079036d154-goog


