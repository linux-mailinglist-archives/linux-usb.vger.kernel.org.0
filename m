Return-Path: <linux-usb+bounces-31836-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C63CE9511
	for <lists+linux-usb@lfdr.de>; Tue, 30 Dec 2025 11:13:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 07CFC300386C
	for <lists+linux-usb@lfdr.de>; Tue, 30 Dec 2025 10:13:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E7C32C21EC;
	Tue, 30 Dec 2025 10:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NIuSXd9t"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B588258CE7
	for <linux-usb@vger.kernel.org>; Tue, 30 Dec 2025 10:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767089614; cv=none; b=BjjuWHFCGj+THFeicxFuup/itm8FmxiQG5kaGmu1ycF9PBOOd2tTV0YEaJmYNVyLSUTteBzotW+Qnw4WuEYSwx2YwbXDWg50X84/nD0i8OWAX6J/PpnPq5QNmWzS5w6+Vn4dQjXq/jUuZYJIbi2hx+99DUW7N/f8Y2uaR+1VwHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767089614; c=relaxed/simple;
	bh=GqjS8NhsN2P/EGV88kKMv9onh82daaNIe8QViAbDeFA=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=sMU4Z9fYQgb55y3cdtQj6vMKqEvXVAmRxqAWEEvewgeVXnObWQ7O5Amns7kqL8ZZnA7UzLACV0nm2RBHTWx6qjuVPOgUQGPV66FEZKGNaSUcFfYAYo/TcZlTxUge4u1+TJvZV6olzwXHG30BO80hbebFmjud9j9FNcoT1hRiqz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--khtsai.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NIuSXd9t; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--khtsai.bounces.google.com
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-7b9090d9f2eso18447994b3a.0
        for <linux-usb@vger.kernel.org>; Tue, 30 Dec 2025 02:13:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767089611; x=1767694411; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=urNf4tibA/ClGGMLFCybJdJKvxoBLt6em6cEb4hXuC0=;
        b=NIuSXd9tc+3zTHD2560j/qvv8P6tFIbZGLarC1LufUG0MJHepvtRBF8NJDVk+R4AR0
         oOb6ddUUy356fKR+g5L88Qu6vYtWRg9pe0+LmgVKBxeWDq3UNhYcYfB5uUfld28Lc+m3
         bPhgRywkfqzba+a5Ij3iAo639C4DoBpFaRIlYoHp2XmvJ9WELy9LgmpLizAqP+zpNbD7
         13OqT9faEdR1O+7zavgcOAgKd4NX7YpBcX/AVLzz+fRbhOY7/4nR6O+j8qqAj9ikubWb
         yhpfrVaO4q6MydEhu4H5ARAFAAjVkLeLg2C0YPsoQithQpF3dBHlnq/AAu/BSUPFKraO
         TLag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767089611; x=1767694411;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=urNf4tibA/ClGGMLFCybJdJKvxoBLt6em6cEb4hXuC0=;
        b=BKt/NZeomSfBleBhxzVedpTII+UBmgyamdw7T1FMuaFNnjsDpGGcKcwBZyQSx8/8Z7
         yTsbd3B1hVF5DpynA+cm9LYji04B0CgO0i6Ri6j1kmsSJvQm62/yCXXxHPiCxyITcwl6
         pw+SuCl6Armidwm9Df9Leo7zAhA4Hzb9R0mR2k6K2sc1kb0aPJhbxwNbxyOZZlixvXLu
         AHOrpv19JakxycVCIwKBSZKfloIe6F1p2VhWoRF716Dg4rDqFkxnV2cEbf6ipk/vOOFL
         VZUIc9jmM1JgI5a1va2T6O1KWzlQYY3Ia8JgqOD6yL/Eh86JHW87eNIwN4v1rTvC/52X
         Qs3g==
X-Gm-Message-State: AOJu0YyI3hwlFlr99Mc+geOKdEuPI3fxRRVUU0twU3C/0pQLUISBA/7D
	ICKbgUFM4EoPX2isjkhr8D64Rx5xt1FEb0Lm3vczy+TXtoYTGGTyN0kcC5XpvXScBLn+az0dskD
	xJly8TQ==
X-Google-Smtp-Source: AGHT+IFuEt4dfp5NeDiOEVezMAfxVhj7x2iY5wCwSqw2kjLdIRp4jrbxbujwgbHzxeCxyqprmF8jKrEyDHQ=
X-Received: from pfdr5.prod.google.com ([2002:aa7:8b85:0:b0:77e:32f7:68cd])
 (user=khtsai job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:4392:b0:7e8:4398:b351
 with SMTP id d2e1a72fcca58-7ff66079db6mr25933079b3a.36.1767089611501; Tue, 30
 Dec 2025 02:13:31 -0800 (PST)
Date: Tue, 30 Dec 2025 18:13:13 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIALmlU2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDI2MD3bzkXN2i1LTE5JL8Il1LC4s0y0SzFBNTS0MloJYCoExmBdi46Nj aWgDNx154XgAAAA==
X-Change-Id: 20251230-ncm-refactor-988f9a6d4591
X-Developer-Key: i=khtsai@google.com; a=ed25519; pk=abA4Pw6dY2ZufSbSXW9mtp7xiv1AVPtgRhCFWJSEqLE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767089609; l=2412;
 i=khtsai@google.com; s=20250916; h=from:subject:message-id;
 bh=GqjS8NhsN2P/EGV88kKMv9onh82daaNIe8QViAbDeFA=; b=AbW/6gIYS6dUtdNHdwNzGMmYpR74iMN1U1MWdqIoFUDMP2XXl613rVEf5hkhz63aTJlDWjq2g
 e2qMWFM8l1CDuoJPYJBmkFCo6AHWUybbL8cUoiRbdfXOVPwkCfzNDCO
X-Mailer: b4 0.14.2
Message-ID: <20251230-ncm-refactor-v1-0-793e347bc7a7@google.com>
Subject: [PATCH 0/3] usb: gadget: Refactor NCM net_device lifecycle
From: Kuen-Han Tsai <khtsai@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi <balbi@ti.com>, 
	Prashanth K <prashanth.k@oss.qualcomm.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	Andrzej Pietrasiewicz <andrzej.p@samsung.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Kuen-Han Tsai <khtsai@google.com>, stable@kernel.org
Content-Type: text/plain; charset="utf-8"

Refactor the network device lifecycle management within the USB gadget
NCM function and the underlying u_ether library.

The primary goal is to align the net_device lifetime with the USB
function's bind/unbind events rather than the function instance 
allocation/deallocation. This resolves issues with dangling sysfs 
symbolic links and potential use-after-free scenarios when the gadget is
disconnected, as the net_device could previously outlive its parent
gadget device.

Other gadget function drivers using u_ether (e.g., ECM, EEM, RNDIS) may
have similar net_device lifecycle mismatches. While not addressed in 
this series, they could potentially benefit from a similar refactoring
in the future.

The series is structured as follows:

1. u_ether: add gether_opts for config caching: Introduce a new struct
gether_opts to cache network settings (MAC addresses, ifname, etc.)
from configfs independently of the net_device. This allows deferring
net_device creation to the bind phase without losing pre-configuration
capabilities.

2. u_ether: Add auto-cleanup helper for freeing net_device: Introduce 
gether_unregister_free_netdev() and DEFINE_FREE to support auto-cleanup
for net_device within the bind path, preparing for net_device allocation
changes in f_ncm.

3. f_ncm: align net_device lifecycle with bind/unbind: The main patch
that moves net_device allocation/registration into ncm_bind() and
unregistration/freeing into ncm_unbind(). It utilizes the gether_opts
for applying cached settings and the new cleanup helper.

Signed-off-by: Kuen-Han Tsai <khtsai@google.com>
---
Kuen-Han Tsai (3):
      usb: gadget: u_ether: add gether_opts for config caching
      usb: gadget: u_ether: Add auto-cleanup helper for freeing net_device
      usb: gadget: f_ncm: align net_device lifecycle with bind/unbind

 drivers/usb/gadget/function/f_ncm.c            | 128 +++++++++---------
 drivers/usb/gadget/function/u_ether.c          |  45 +++++++
 drivers/usb/gadget/function/u_ether.h          |  30 +++++
 drivers/usb/gadget/function/u_ether_configfs.h | 176 +++++++++++++++++++++++++
 drivers/usb/gadget/function/u_ncm.h            |   4 +-
 5 files changed, 317 insertions(+), 66 deletions(-)
---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20251230-ncm-refactor-988f9a6d4591

Best regards,
-- 
Kuen-Han Tsai <khtsai@google.com>


