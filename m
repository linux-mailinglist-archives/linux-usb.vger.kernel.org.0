Return-Path: <linux-usb+bounces-9457-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A47C98A9E14
	for <lists+linux-usb@lfdr.de>; Thu, 18 Apr 2024 17:13:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5BD5A1F21900
	for <lists+linux-usb@lfdr.de>; Thu, 18 Apr 2024 15:13:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D14F16C69F;
	Thu, 18 Apr 2024 15:13:23 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by smtp.subspace.kernel.org (Postfix) with SMTP id B4C9C16C444
	for <linux-usb@vger.kernel.org>; Thu, 18 Apr 2024 15:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.131.102.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713453203; cv=none; b=FBVSkOBGgIg4Stu22l4PBolA6EsGGIlnfxQkBrhCM7w2hMkwx6aClE/5hvckohfm4+XGM5BzFJSLFofOPdlAzm2WUpGS1zao4S3oOKfPte/dvy95Yu+y4B/V1ow0IUsPzhbPkV+6MpKsykd0aSLsN9pgkhukeCmKpODRk1MDgn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713453203; c=relaxed/simple;
	bh=r6kqHgkmyW3NKurDe2u0ve6z/pT9x5lRwxVQkKAlOuY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eMoYl8MNmNuTZMXAGSRgth12JIx0hpgaxPp3eGCMSCamohHzU6V1T/7ujkHyzR5DjF2Ty2ayGy1d2E/StpL+kFZ/S/GZzaGy8juf3UUYdrJpi7+qn8vEszwRlj9Oqt36zk3LAMaqx9rcSBClpHDCtTawcPGN/nyvLiXIHtCF7Ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=netrider.rowland.org; arc=none smtp.client-ip=192.131.102.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netrider.rowland.org
Received: (qmail 242604 invoked by uid 1000); 18 Apr 2024 11:13:13 -0400
Date: Thu, 18 Apr 2024 11:13:13 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Yue Sun <samsun1006219@gmail.com>, xingwei lee <xrivendell7@gmail.com>,
  Michael Grzeschik <m.grzeschik@pengutronix.de>,
  syzkaller-bugs@googlegroups.com,
  USB mailing list <linux-usb@vger.kernel.org>
Subject: [PATCH] USB: core: Fix access violation during port device removal
Message-ID: <393aa580-15a5-44ca-ad3b-6462461cd313@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Testing with KASAN and syzkaller revealed a bug in port.c:disable_store():
usb_hub_to_struct_hub() can return NULL if the hub that the port belongs to
is concurrently removed, but the function does not check for this
possibility before dereferencing the returned value.

It turns out that the first dereference is unnecessary, since hub->intfdev
is the parent of the port device, so it can be changed easily.  Adding a 
check for hub == NULL prevents further problems.

The same bug exists in the disable_show() routine, and it can be fixed the
same way.

Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
Reported-and-tested-by: Yue Sun <samsun1006219@gmail.com>
Reported-by: xingwei lee <xrivendell7@gmail.com>
Link: https://lore.kernel.org/linux-usb/CAEkJfYON+ry7xPx=AiLR9jzUNT+i_Va68ACajOC3HoacOfL1ig@mail.gmail.com/
Fixes: f061f43d7418 ("usb: hub: port: add sysfs entry to switch port power")
CC: Michael Grzeschik <m.grzeschik@pengutronix.de>
CC: stable@vger.kernel.org

---

 drivers/usb/core/port.c |    8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

Index: usb-devel/drivers/usb/core/port.c
===================================================================
--- usb-devel.orig/drivers/usb/core/port.c
+++ usb-devel/drivers/usb/core/port.c
@@ -51,13 +51,15 @@ static ssize_t disable_show(struct devic
 	struct usb_port *port_dev = to_usb_port(dev);
 	struct usb_device *hdev = to_usb_device(dev->parent->parent);
 	struct usb_hub *hub = usb_hub_to_struct_hub(hdev);
-	struct usb_interface *intf = to_usb_interface(hub->intfdev);
+	struct usb_interface *intf = to_usb_interface(dev->parent);
 	int port1 = port_dev->portnum;
 	u16 portstatus, unused;
 	bool disabled;
 	int rc;
 	struct kernfs_node *kn;
 
+	if (!hub)
+		return -ENODEV;
 	hub_get(hub);
 	rc = usb_autopm_get_interface(intf);
 	if (rc < 0)
@@ -101,12 +103,14 @@ static ssize_t disable_store(struct devi
 	struct usb_port *port_dev = to_usb_port(dev);
 	struct usb_device *hdev = to_usb_device(dev->parent->parent);
 	struct usb_hub *hub = usb_hub_to_struct_hub(hdev);
-	struct usb_interface *intf = to_usb_interface(hub->intfdev);
+	struct usb_interface *intf = to_usb_interface(dev->parent);
 	int port1 = port_dev->portnum;
 	bool disabled;
 	int rc;
 	struct kernfs_node *kn;
 
+	if (!hub)
+		return -ENODEV;
 	rc = kstrtobool(buf, &disabled);
 	if (rc)
 		return rc;

