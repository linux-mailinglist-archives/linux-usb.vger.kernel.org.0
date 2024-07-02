Return-Path: <linux-usb+bounces-11831-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C799242BB
	for <lists+linux-usb@lfdr.de>; Tue,  2 Jul 2024 17:45:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0CE4E289407
	for <lists+linux-usb@lfdr.de>; Tue,  2 Jul 2024 15:45:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7DC01BD029;
	Tue,  2 Jul 2024 15:45:21 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88D871BC09D;
	Tue,  2 Jul 2024 15:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719935121; cv=none; b=DmAxwYF3dAr4fOkZVxzqHHIixthIZpLr/lvamSXb1ltqMizJGjs0LSA3eitEpCLlQW2rGZOb1ua+hp/htIsJh1A2Ze7ZgWragVAxQ9c5zyInwu5imtmOd2HzMqzJLOaI/AhzuIIIIm1V8UqK7oD0jz+W+cb80Yn+0UzhCv2j8Ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719935121; c=relaxed/simple;
	bh=53x6wd9/axPR7qzEIOl3zaUmIi/DmvdNSJXwbnmOY0c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e/bojwPNzMfAPN/naLITF1GEKh9gdJCwVVb9FJVTwyRDdIXgUALT6fybtO+kah3dsauwqygIgPEQEO6z9svtKnut8IKdS+Ua8BvFXoW3N5IyuWWrtRnyJ4lT3lrWz10kGSgk+H01U33O+ts0GQvFee4wtqTlX2URYwY68WGtTpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; arc=none smtp.client-ip=54.204.34.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
X-QQ-mid: bizesmtp84t1719935050tdogj5kd
X-QQ-Originating-IP: NGe9nAZ0lDhi5NYOuKfSyIeI7Nf/ayaiffpMbMYb8TU=
Received: from localhost.localdomain ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 02 Jul 2024 23:44:08 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 17054690860164996744
From: WangYuli <wangyuli@uniontech.com>
To: gregkh@linuxfoundation.org,
	hgajjar@de.adit-jv.com,
	stern@rowland.harvard.edu,
	lb@semihalf.com,
	wangyuli@uniontech.com
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	guanwentao@uniontech.com
Subject: [PATCH] USB: Add USB_QUIRK_NO_SET_INTF quirk for START BP-850k
Date: Tue,  2 Jul 2024 23:44:08 +0800
Message-ID: <202E4B2BD0F0FEA4+20240702154408.631201-1-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.43.4
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1

START BP-850K is a dot matrix printer that crashes when
it receives a Set-Interface request and needs USB_QUIRK_NO_SET_INTF
to work properly.

Signed-off-by: jinxiaobo <jinxiaobo@uniontech.com>
Signed-off-by: WangYuli <wangyuli@uniontech.com>
---
 drivers/usb/core/quirks.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/core/quirks.c b/drivers/usb/core/quirks.c
index b4783574b8e6..13171454f959 100644
--- a/drivers/usb/core/quirks.c
+++ b/drivers/usb/core/quirks.c
@@ -506,6 +506,9 @@ static const struct usb_device_id usb_quirk_list[] = {
 	{ USB_DEVICE(0x1b1c, 0x1b38), .driver_info = USB_QUIRK_DELAY_INIT |
 	  USB_QUIRK_DELAY_CTRL_MSG },
 
+	/* START BP-850k Printer */
+	{ USB_DEVICE(0x1bc3, 0x0003), .driver_info = USB_QUIRK_NO_SET_INTF },
+
 	/* MIDI keyboard WORLDE MINI */
 	{ USB_DEVICE(0x1c75, 0x0204), .driver_info =
 			USB_QUIRK_CONFIG_INTF_STRINGS },
-- 
2.43.4


