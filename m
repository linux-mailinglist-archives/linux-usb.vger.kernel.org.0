Return-Path: <linux-usb+bounces-4398-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2FB7819958
	for <lists+linux-usb@lfdr.de>; Wed, 20 Dec 2023 08:22:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 017CE1C20CCE
	for <lists+linux-usb@lfdr.de>; Wed, 20 Dec 2023 07:22:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1F1714F98;
	Wed, 20 Dec 2023 07:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="x6secFJ1"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 429A81C29E
	for <linux-usb@vger.kernel.org>; Wed, 20 Dec 2023 07:22:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23233C433C8;
	Wed, 20 Dec 2023 07:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1703056938;
	bh=PZN3qe6XDuzp9ERYl9s5G7YUqUl6vXqjl4UiawBrdxY=;
	h=Subject:To:From:Date:From;
	b=x6secFJ1c+dxmf56xpIqH/5uCO9F7nugbpCf798rLQYWxMtvuQPLZK95/1N5DKDW5
	 xy+FktISiOrErKHbeKvtEIc9UrEMvjTztnSZBKJRy/peEEqEeVOm+vwhpL5axdopvz
	 VdjuiPd11gmsbvpYeroPe+fVkPbRFs0eKXTPn1vk=
Subject: patch "thunderbolt: make tb_bus_type const" added to usb-testing
To: gregkh@linuxfoundation.org,YehezkelShB@gmail.com,andreas.noever@gmail.com,linux-usb@vger.kernel.org,michael.jamet@intel.com,mika.westerberg@linux.intel.com
From: <gregkh@linuxfoundation.org>
Date: Wed, 20 Dec 2023 08:22:15 +0100
Message-ID: <2023122015-smugness-dropbox-d612@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit


This is a note to let you know that I've just added the patch titled

    thunderbolt: make tb_bus_type const

to my usb git tree which can be found at
    git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git
in the usb-testing branch.

The patch will show up in the next release of the linux-next tree
(usually sometime within the next 24 hours during the week.)

The patch will be merged to the usb-next branch sometime soon,
after it passes testing, and the merge window is open.

If you have any questions about this process, please let me know.


From 8be0c877fb3b671dac0cf56d1f1f9e65f9a9fb81 Mon Sep 17 00:00:00 2001
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Tue, 19 Dec 2023 16:43:05 +0100
Subject: thunderbolt: make tb_bus_type const

Now that the driver core can properly handle constant struct bus_type,
move the tb_bus_type variable to be a constant structure as well,
placing it into read-only memory which can not be modified at runtime.

Cc: Andreas Noever <andreas.noever@gmail.com>
Cc: Michael Jamet <michael.jamet@intel.com>
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>
Cc:  <linux-usb@vger.kernel.org>
Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Link: https://lore.kernel.org/r/2023121904-utopia-broadcast-06d1@gregkh
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/thunderbolt/domain.c | 2 +-
 include/linux/thunderbolt.h  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/thunderbolt/domain.c b/drivers/thunderbolt/domain.c
index ec7b5f65804e..9fb1a64f3300 100644
--- a/drivers/thunderbolt/domain.c
+++ b/drivers/thunderbolt/domain.c
@@ -307,7 +307,7 @@ static const struct attribute_group *domain_attr_groups[] = {
 	NULL,
 };
 
-struct bus_type tb_bus_type = {
+const struct bus_type tb_bus_type = {
 	.name = "thunderbolt",
 	.match = tb_service_match,
 	.probe = tb_service_probe,
diff --git a/include/linux/thunderbolt.h b/include/linux/thunderbolt.h
index 6151c210d987..2c835e5c41f6 100644
--- a/include/linux/thunderbolt.h
+++ b/include/linux/thunderbolt.h
@@ -86,7 +86,7 @@ struct tb {
 	unsigned long privdata[];
 };
 
-extern struct bus_type tb_bus_type;
+extern const struct bus_type tb_bus_type;
 extern struct device_type tb_service_type;
 extern struct device_type tb_xdomain_type;
 
-- 
2.43.0



