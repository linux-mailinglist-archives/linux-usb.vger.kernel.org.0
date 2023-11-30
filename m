Return-Path: <linux-usb+bounces-3489-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B4087FED5B
	for <lists+linux-usb@lfdr.de>; Thu, 30 Nov 2023 11:55:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C2CD5282568
	for <lists+linux-usb@lfdr.de>; Thu, 30 Nov 2023 10:55:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2346C3C06C;
	Thu, 30 Nov 2023 10:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EOBnh8dQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E26249EC
	for <linux-usb@vger.kernel.org>; Thu, 30 Nov 2023 10:55:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E26CFC433CA;
	Thu, 30 Nov 2023 10:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701341713;
	bh=5UqF6R+sWlvabSQcifcTgrUGPsaALtx849UaV5ZfAKQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EOBnh8dQw28r6W0KPBw5vHS0NSBkkMQADsIb+Ve3s5U/7V/iBgkdOyaSMTt6ijwzj
	 6Ov39DhGrVN/xtHRUygR0xpAkRjnXxyWBY4uBB/iS+11vAe2+40UEvgD8xqgcUzd+e
	 HM/otnXIKQTW5mBIvxY9MjH7704FN4JMwb67INriEKjmFuVF0dlyXiPKRxABvydoB4
	 b1H8w4EnGqE2tD/rrI2SfwQLzNCEORoKyOFeo+dTDhdcx0/aqwFc1tgMmqXbygHXo2
	 EVo7qW7D7BGO2ZoO34GganL2z0nMzryMQU+WdCfCGr9+UQcU4eZdUgJhCTkivgPOl/
	 h9e2lzRBWT6Gg==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org
Cc: linux-kernel@vger.kernel.org,
	Matthieu CASTET <castet.matthieu@free.fr>,
	Stanislaw Gruszka <stf_xl@wp.pl>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Damien Bergamini <damien.bergamini@free.fr>,
	linux-usb@vger.kernel.org
Subject: [PATCH 1/5] usb: atm: Remove snprintf() from sysfs call-backs and replace with sysfs_emit()
Date: Thu, 30 Nov 2023 10:54:35 +0000
Message-ID: <20231130105459.3208986-2-lee@kernel.org>
X-Mailer: git-send-email 2.43.0.rc1.413.gea7ed67945-goog
In-Reply-To: <20231130105459.3208986-1-lee@kernel.org>
References: <20231130105459.3208986-1-lee@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since snprintf() has the documented, but still rather strange trait of
returning the length of the data that *would have been* written to the
array if space were available, rather than the arguably more useful
length of data *actually* written, it is usually considered wise to use
something else instead in order to avoid confusion.

In the case of sysfs call-backs, new wrappers exist that do just that.

This patch replaces the 2 uses of snprintf() found in the sysfs .show()
call-backs with the new sysfs_emit() helpers.  Whist we're at it, let's
replace the sprintf()s as well.  For no other reason than consistency.

Link: https://lwn.net/Articles/69419/
Link: https://github.com/KSPP/linux/issues/105
Cc: Matthieu CASTET <castet.matthieu@free.fr>
Cc: Stanislaw Gruszka <stf_xl@wp.pl>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Damien Bergamini <damien.bergamini@free.fr>
Cc: linux-usb@vger.kernel.org
Signed-off-by: Lee Jones <lee@kernel.org>
---
 drivers/usb/atm/ueagle-atm.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/atm/ueagle-atm.c b/drivers/usb/atm/ueagle-atm.c
index 5812f7ea7f902..8d5580d8d20a8 100644
--- a/drivers/usb/atm/ueagle-atm.c
+++ b/drivers/usb/atm/ueagle-atm.c
@@ -2252,7 +2252,7 @@ static ssize_t stat_status_show(struct device *dev, struct device_attribute *att
 	sc = dev_to_uea(dev);
 	if (!sc)
 		goto out;
-	ret = snprintf(buf, 10, "%08x\n", sc->stats.phy.state);
+	ret = sysfs_emit(buf, "%08x\n", sc->stats.phy.state);
 out:
 	mutex_unlock(&uea_mutex);
 	return ret;
@@ -2318,19 +2318,19 @@ static ssize_t stat_human_status_show(struct device *dev,
 
 	switch (modem_state) {
 	case 0:
-		ret = sprintf(buf, "Modem is booting\n");
+		ret = sysfs_emit(buf, "Modem is booting\n");
 		break;
 	case 1:
-		ret = sprintf(buf, "Modem is initializing\n");
+		ret = sysfs_emit(buf, "Modem is initializing\n");
 		break;
 	case 2:
-		ret = sprintf(buf, "Modem is operational\n");
+		ret = sysfs_emit(buf, "Modem is operational\n");
 		break;
 	case 3:
-		ret = sprintf(buf, "Modem synchronization failed\n");
+		ret = sysfs_emit(buf, "Modem synchronization failed\n");
 		break;
 	default:
-		ret = sprintf(buf, "Modem state is unknown\n");
+		ret = sysfs_emit(buf, "Modem state is unknown\n");
 		break;
 	}
 out:
@@ -2364,7 +2364,7 @@ static ssize_t stat_delin_show(struct device *dev, struct device_attribute *attr
 			delin = "LOSS";
 	}
 
-	ret = sprintf(buf, "%s\n", delin);
+	ret = sysfs_emit(buf, "%s\n", delin);
 out:
 	mutex_unlock(&uea_mutex);
 	return ret;
@@ -2384,7 +2384,7 @@ static ssize_t stat_##name##_show(struct device *dev,		\
 	sc = dev_to_uea(dev);					\
 	if (!sc)						\
 		goto out;					\
-	ret = snprintf(buf, 10, "%08x\n", sc->stats.phy.name);	\
+	ret = sysfs_emit(buf, "%08x\n", sc->stats.phy.name);	\
 	if (reset)						\
 		sc->stats.phy.name = 0;				\
 out:								\
-- 
2.43.0.rc1.413.gea7ed67945-goog


