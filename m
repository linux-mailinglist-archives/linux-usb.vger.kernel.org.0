Return-Path: <linux-usb+bounces-20054-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 28158A26821
	for <lists+linux-usb@lfdr.de>; Tue,  4 Feb 2025 01:01:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E28B8188625F
	for <lists+linux-usb@lfdr.de>; Tue,  4 Feb 2025 00:01:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BC7B17583;
	Tue,  4 Feb 2025 00:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nG0wC5pQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-vs1-f74.google.com (mail-vs1-f74.google.com [209.85.217.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64AED25A634
	for <linux-usb@vger.kernel.org>; Tue,  4 Feb 2025 00:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738627269; cv=none; b=cLKhNd8+4lVItvMOpXZvaGHESUvUpN70XNhdgw/mc4rHI/WqsS77MladBCFHOb+6kAeHPfUpsBjc1Xs/LxlQXqz2WsSjmM6S0JKbvonzvTA66StJgw/VZwFq135eM44/6IL4JZSTuVYV8/PhnNBumyAImjmicEvW3KY3ohzOPp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738627269; c=relaxed/simple;
	bh=ff8sQkJWTl2JSMgbPndRNr5+dCrOQHKJ4z/HtRI/rb8=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Content-Type; b=IQt4Za+jAWQEk50RUTfbaL499o68bxOLIss08wwTx+mGRqgCXtmDLoFKVUej57w77cM1n2cQi73Lj4ld6Mnpzros23TcGcShkKH6NWuvQrYJzUUoNK/3f7j8V+CgQsKeIuqjb90Ent4TBtYdu+Npc8h/udXtwB/HAF/rPy1lrYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--royluo.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nG0wC5pQ; arc=none smtp.client-ip=209.85.217.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--royluo.bounces.google.com
Received: by mail-vs1-f74.google.com with SMTP id ada2fe7eead31-4b68cedd094so540289137.1
        for <linux-usb@vger.kernel.org>; Mon, 03 Feb 2025 16:01:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738627266; x=1739232066; darn=vger.kernel.org;
        h=to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=em5AizfvgfoSk/7IpVvE0FGzS3dPFqDA9+Q7W+ZArzY=;
        b=nG0wC5pQQuDvk3SJdeeEg2XdqbqM8bigpFbsvDB+Nd83QfeiNjkhCnTuxYDjkGjtjs
         i2vW57UlcircRpadYK8sFPMGtw7G7iyIHCjF3rLJ4yGs4mJdarmv8W2zMELsSda0R5Jq
         QmXx7bL1Ggmfy9DjfU7u5ldn/98M1X0whjRnGm10vPf637K3O8ynwseKxIkGvr+WshUF
         uuh8bWnuwcrvSdzkqq0b53xvgtl05qqc6PZkpoacRbX86ouoloxmaBlYy1F4Qunh8JRl
         m/hjhMm1Vncocdb+7eegHzpyD9jAdqJkU9S5uqpqkEK2rUibyemwsqJVOxV99STe6nBN
         a8AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738627266; x=1739232066;
        h=to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=em5AizfvgfoSk/7IpVvE0FGzS3dPFqDA9+Q7W+ZArzY=;
        b=XGYWeLsATM9wVgwF44CutdeeLhUF5XKev9rvVCfmv8pb1ymwTzhw90UBreDwXQPLLL
         0yvkP9aZaymQ7YWBGa9Dafrd6GrxwSOeDd/vhK9Yv6hIZDZQCxsfRw8VXmxLLgwD46IQ
         QMGJLBGe4y2gce6V/TzKg2ay9poOs3Nv7iBWaYmG2diALKwGm1rAxH9BxdQmRiTAYwoV
         5idU2fbi+oAdXg7ihc+wqZhKlR2fw4CiT9dMB14Y+8CEwAKkYh/miLinZB9RcV1GAgcy
         L2mtH5zbm1bnyUUOG4jqIdRuIdLQ974yQCNcMZe8d8Q6u4PY8Zlu44kRcV93lQ+TfohI
         umFA==
X-Forwarded-Encrypted: i=1; AJvYcCXMcoqmdRdxyEsH3Wn2lWxU12Maw6oI7By+2Mq1DGbWKTNeuRZkYE3FRyNqdHPHoEYmT8ruHOraP+U=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUfE1SdjYWS6p1y3S6GGIuZLjiAhu8oVK8SXmpfgpOFu236mqe
	leLH8eYv0bs1xA3t2z+6r9gM8YdqShMVRQ/iWJDy0nA7EWalw89r5Ri7u7y66PwoPtp9hZ1SWjr
	EEA==
X-Google-Smtp-Source: AGHT+IHIOngP72sVGL2qIXaFFJGsq1inwYzgOoTmPQKWYL3v02tNlviZN6iQtCHrbLQVquoZ0I5+7WkKGUA=
X-Received: from uamz12.prod.google.com ([2002:ab0:22cc:0:b0:866:d46b:310d])
 (user=royluo job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6102:3596:b0:4b2:bceb:1ac6
 with SMTP id ada2fe7eead31-4b9a5231b4bmr18260823137.17.1738627266246; Mon, 03
 Feb 2025 16:01:06 -0800 (PST)
Date: Tue,  4 Feb 2025 00:01:02 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.48.1.362.g079036d154-goog
Message-ID: <20250204000102.3989779-1-royluo@google.com>
Subject: [PATCH v1] usb: gadget: core: flush gadget workqueue after device removal
From: Roy Luo <royluo@google.com>
To: royluo@google.com, Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	andre.draszik@linaro.org, elder@kernel.org, stern@rowland.harvard.edu, 
	crwulff@gmail.com, paul@crapouillou.net, jkeeping@inmusicbrands.com, 
	yuanlinyu@hihonor.com
Content-Type: text/plain; charset="UTF-8"

usb_del_gadget() can lead to new work being scheduled in gadget->work
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

Fixes: 1ff24d40b3c3 ("usb: dwc3: gadget: Fix incorrect UDC state after manual deconfiguration")
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


