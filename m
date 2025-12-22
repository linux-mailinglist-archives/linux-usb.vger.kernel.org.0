Return-Path: <linux-usb+bounces-31675-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC2CCD684F
	for <lists+linux-usb@lfdr.de>; Mon, 22 Dec 2025 16:27:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 004D530DDA38
	for <lists+linux-usb@lfdr.de>; Mon, 22 Dec 2025 15:22:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32B4F32B9BB;
	Mon, 22 Dec 2025 15:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NE+VDqrZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A633F2F5328;
	Mon, 22 Dec 2025 15:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766416957; cv=none; b=huwAAcOOUiL0IinIpkyNnt8i3+bn+rQn2IVR0E4YoHNJ3aGYGQx/TL5hGzcG0dGRTWuPIeRu9YJt9aGrZcd2ACC0Qu2mUNYWVIE8vuFTTY0j0iPd1p9Dc/TR0Yd9uEmkwtOCm72y2CEZkLk0auF9vgEEQo4D+BVLd0i7ds3Jw9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766416957; c=relaxed/simple;
	bh=p1IehbesLuEfw+2HZh3NB/Swcs3UNEs9pnu3GXPMhJI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JM79INHvxAfBSZ15ll5yFoADVwaBVGft4GEhc4YtBb5dGxrwnMkjKpGjJtypb5n+8k5cziMC9gJ+oWCIff5/BoE44/j6qmHqsBqPpAds3tZd6dkq8nAIfYCyaSLLAo+FLYSCWnv5a/tWR5psM3POwPCt8KynPpWQv3wgODpACEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NE+VDqrZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55BB4C116D0;
	Mon, 22 Dec 2025 15:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766416957;
	bh=p1IehbesLuEfw+2HZh3NB/Swcs3UNEs9pnu3GXPMhJI=;
	h=From:To:Cc:Subject:Date:From;
	b=NE+VDqrZYmb4u7ATN79oxNqMRsVR0YKbF+JpgzVk+S52j9VPEwsCbGI9DRRmrijV7
	 VFvFr/iqb3e73vfCft2FEUnRDl1jciRr/Dc9i35MyVV2WYLwcradBprZotYh/udy1h
	 Rpw4Mc4aUuIKDmmPwPYoetUiPos4sZji3WHxDKOl6+yA4pcM7kyT6STpfNHAUCxZ0K
	 4IpH8skJZ/McgBj0fSmqYPEyezQMeJVaa0QILTgtY+/f6YGIo5mBZZqT2+++yIIyTC
	 wztO3rvAGcxmrBsbC5acrf0OzIZ0fzcGt7C9hWTRbS69ve/G+2cBfw9Q9K8xV6afKo
	 sl67g5VEETyzQ==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vXhkA-000000000kc-1E93;
	Mon, 22 Dec 2025 16:22:43 +0100
From: Johan Hovold <johan@kernel.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Pooja Katiyar <pooja.katiyar@intel.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH 0/4] usb: typec: ucsi: revert broken buffer management
Date: Mon, 22 Dec 2025 16:22:00 +0100
Message-ID: <20251222152204.2846-1-johan@kernel.org>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The new buffer management code has not been tested or reviewed properly
and breaks boot of machines like the Lenovo ThinkPad X13s.

Fixing this will require designing a proper interface for managing these
transactions, something which most likely involves reverting most of the
offending commit anyway.
	    
Revert the broken code to fix the regression and let Intel come up with
a properly tested implementation for a later kernel.

Johan


Johan Hovold (4):
  Revert "usb: typec: ucsi: Add support for SET_PDOS command"
  Revert "usb: typec: ucsi: Enable debugfs for message_out data
    structure"
  Revert "usb: typec: ucsi: Add support for message out data structure"
  Revert "usb: typec: ucsi: Update UCSI structure to have message in and
    message out fields"

 drivers/usb/typec/ucsi/cros_ec_ucsi.c   |   5 +-
 drivers/usb/typec/ucsi/debugfs.c        |  36 +-------
 drivers/usb/typec/ucsi/displayport.c    |  11 +--
 drivers/usb/typec/ucsi/ucsi.c           | 118 ++++++++----------------
 drivers/usb/typec/ucsi/ucsi.h           |  22 ++---
 drivers/usb/typec/ucsi/ucsi_acpi.c      |  25 +----
 drivers/usb/typec/ucsi/ucsi_ccg.c       |  11 ++-
 drivers/usb/typec/ucsi/ucsi_yoga_c630.c |  15 +--
 8 files changed, 71 insertions(+), 172 deletions(-)

-- 
2.51.2


