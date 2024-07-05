Return-Path: <linux-usb+bounces-12012-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 382C39284F5
	for <lists+linux-usb@lfdr.de>; Fri,  5 Jul 2024 11:19:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E6D32282FEC
	for <lists+linux-usb@lfdr.de>; Fri,  5 Jul 2024 09:19:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D137C14601C;
	Fri,  5 Jul 2024 09:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lkgKPWW0"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFEF23A8CB
	for <linux-usb@vger.kernel.org>; Fri,  5 Jul 2024 09:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720171152; cv=none; b=H7sYd69r8KwAVqPvXS48tMJNCKwQM/vUocjBwrFEB8Px7jA80dO3kRwfwCgJlwysjrUefIHcTBYKd7X6LivPElExDdnFDG5vuzdHV395yxgIZo+SjCu0bnxz2lF5MSa1qCWKF3tVPAAlM5QGeQa8bFrGoJeL56ygzdYpk8NI5oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720171152; c=relaxed/simple;
	bh=Oqk8V9K6PqOXK0GzY8MkpfUtRmEMGl3IHQNk8YchvrQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=JnOZ99qK762d4Ow4I6tQh+FatdxtduX4QhGa5d2lssI1ByaJfz/fDz6h75LoOi5oUoakv4YPDyJw1YO2EPhvIfK9RtOSRIZMehkD9oRK5QfV/ojQaN6SRtqoaHspbl6cq14ri81/qwfOSGMnL3XDCgFsR14WW7bvibHhCYzZZOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=lkgKPWW0; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-58bac81f3f9so1898774a12.2
        for <linux-usb@vger.kernel.org>; Fri, 05 Jul 2024 02:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1720171149; x=1720775949; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mvrzYVWaCV49RK2aNH0vmYg1ydT7xzKbRY6MIWC1fmk=;
        b=lkgKPWW0OVDcM0/UTma49rwGe5RkPZ/BNXmzwqNoTAquhncjgbLQz6JR948F7xTWBF
         w6wZdiIYCT3rwqhANORNvGdV2ZiGj+ElRn9NVMJOHX5rpclrvOPL+XKTzr5RnfbML6l5
         u5XFknAwO1Gd5nJDFzm25QLfOBDWsW+Rq8vHI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720171149; x=1720775949;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mvrzYVWaCV49RK2aNH0vmYg1ydT7xzKbRY6MIWC1fmk=;
        b=Q22F5BXhU/LeLotjaWWhZAT2GR9ttJsRjH+nTPyZDvKUJseNpIuKyNqUovVemwP1V/
         2ouYIp0C3+PmMDzd7jXMVz/aZXr0b05eCeciIutoag2J2WRqyFMKioGkyfiOXh4SvjfX
         Myv1T2iRo5LtkbMzO+jxvD+Pnc6zn+NcO5kxjmt0lg7QYKFXEzd7o7oGp1GeZN5eiGeL
         j61Yo1mOh1DonuqeH3zr54l8D5mcUz22UcjJUGIHDezBxHtrQKIZfXqSe8cyquweOaDU
         mxz12K8diFq22tJxDCnOjB42vbJWGjMX7rh37JGAA5qk1LggWWpg45iT8HgabRrkt2tG
         VIYw==
X-Gm-Message-State: AOJu0YzM3v5Jk3fyC/agjeM88Jv9nspf9wF3kx+CWvRXzKc73lWl7kfG
	Ng1tiT6o3UWQ28pku2eh4TryOI0vobu5Y1I0I07sfR6JWeq9tL4z1+CPCd88
X-Google-Smtp-Source: AGHT+IF24wz2N7yERLG2TwGRCzniWnc4OFT6s2Q+xPpsp1WURYwBDQ82I6DERRgHypsV3ss2Qzhpyw==
X-Received: by 2002:a17:907:77d6:b0:a77:c080:11fc with SMTP id a640c23a62f3a-a77c080128cmr200683866b.36.1720171148992;
        Fri, 05 Jul 2024 02:19:08 -0700 (PDT)
Received: from ukaszb-ng.c.googlers.com.com (61.134.90.34.bc.googleusercontent.com. [34.90.134.61])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a72ab08d0f8sm667456266b.178.2024.07.05.02.19.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 02:19:08 -0700 (PDT)
From: =?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>
To: Valentina Manea <valentina.manea.m@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	Hongren Zheng <i@zenithal.me>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [PATCH v1] usbip: Add USB_SPEED_SUPER_PLUS as valid arg
Date: Fri,  5 Jul 2024 09:19:02 +0000
Message-ID: <20240705091902.789643-1-ukaszb@chromium.org>
X-Mailer: git-send-email 2.45.2.803.g4e1b14247a-goog
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add USB_SPEED_SUPER_PLUS as valid argument to allow
to attach USB SuperSpeed+ devices.

Signed-off-by: Łukasz Bartosik <ukaszb@chromium.org>
---
 drivers/usb/usbip/vhci_sysfs.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/usbip/vhci_sysfs.c b/drivers/usb/usbip/vhci_sysfs.c
index e2847cd3e6e3..d5865460e82d 100644
--- a/drivers/usb/usbip/vhci_sysfs.c
+++ b/drivers/usb/usbip/vhci_sysfs.c
@@ -283,6 +283,7 @@ static int valid_args(__u32 *pdev_nr, __u32 *rhport,
 	case USB_SPEED_HIGH:
 	case USB_SPEED_WIRELESS:
 	case USB_SPEED_SUPER:
+	case USB_SPEED_SUPER_PLUS:
 		break;
 	default:
 		pr_err("Failed attach request for unsupported USB speed: %s\n",
@@ -349,7 +350,7 @@ static ssize_t attach_store(struct device *dev, struct device_attribute *attr,
 	vhci_hcd = hcd_to_vhci_hcd(hcd);
 	vhci = vhci_hcd->vhci;
 
-	if (speed == USB_SPEED_SUPER)
+	if (speed >= USB_SPEED_SUPER)
 		vdev = &vhci->vhci_hcd_ss->vdev[rhport];
 	else
 		vdev = &vhci->vhci_hcd_hs->vdev[rhport];
-- 
2.45.2.803.g4e1b14247a-goog


