Return-Path: <linux-usb+bounces-24184-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E339ABF667
	for <lists+linux-usb@lfdr.de>; Wed, 21 May 2025 15:42:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2F10C3AF669
	for <lists+linux-usb@lfdr.de>; Wed, 21 May 2025 13:41:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B15E277811;
	Wed, 21 May 2025 13:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="gu8h8SnX"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6E18264A88
	for <linux-usb@vger.kernel.org>; Wed, 21 May 2025 13:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747834909; cv=none; b=tfLsAtJU5zm0y6f7wBhNdm2Wii9pjoaH1vBs5k3qf2eJ4C0r3XFRGwKtsDibeILGrfiZ8SG9fRPwwjLeX55NePZ78glDqSvfOJoKTsoyyfk3+W1K8vwNy+AbwvdwzjDSGsxw+VhToSLdOSfc8mKiiKSCtAfYDcAWpT+7pBw0sAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747834909; c=relaxed/simple;
	bh=obs3y1eB17W5bbFDHyeKmkoafoZ8MV/vovRhiWFdlRc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UVVY3ucslgJDRSyKLYsZbjU96dzlibac8aqZozO/eY3b8Yh7q8QG613zEEwXSWSdgNstagXJRE9q++NwUDENXRU00Jnp6jDTZxWZVOuF8V2zoyzi22OaMRvCDrPKUYgyzAtUk70/QEBuJlKUlUvhhfmx0+zyXaoVGw0i18Gbq2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=gu8h8SnX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B21BEC4CEE4;
	Wed, 21 May 2025 13:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1747834909;
	bh=obs3y1eB17W5bbFDHyeKmkoafoZ8MV/vovRhiWFdlRc=;
	h=From:To:Cc:Subject:Date:From;
	b=gu8h8SnXBHNwqigDJKUmBOjJNsCPIfnxaSvt4zoWiTCpL1JvopsL+G+15wii9f+ic
	 KA9oUQQVdZu89Ct6+V1rp+APe/h3a2bYtdfo5IrBbCbURDoUcueGLw9ynTRvuRuc7B
	 hzM0+UA01nyAiPUY/9SwDXrNYbIb72G1MKMQ9a64=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-usb@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH] USB: gadget: fix up const issue with struct usb_function_instance
Date: Wed, 21 May 2025 15:41:46 +0200
Message-ID: <2025052145-undress-puma-f7cf@gregkh>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Lines: 40
X-Developer-Signature: v=1; a=openpgp-sha256; l=1495; i=gregkh@linuxfoundation.org; h=from:subject:message-id; bh=obs3y1eB17W5bbFDHyeKmkoafoZ8MV/vovRhiWFdlRc=; b=owGbwMvMwCRo6H6F97bub03G02pJDBm6NyRf3JnxU3dHrdZPeY8z1lH+/garZ76vy2Wbe+BTw YuXl1PzOmJZGASZGGTFFFm+bOM5ur/ikKKXoe1pmDmsTCBDGLg4BWAiztoMc3gKrkzr38xhY5f9 N2K/mlfC772eXxjme8lsuHT/lm6DdeSiHzl+u9WY9ByPAwA=
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit

In struct usb_function, the struct usb_function_instance pointer
variable "fi" is listed as const, but it is written to in numerous
places, making the const marking of it a total lie.  Fix this up by just
removing the const pointer attribute as this is modified in numerous
places.

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/usb/gadget/function/f_mass_storage.h | 2 +-
 include/linux/usb/composite.h                | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/function/f_mass_storage.h b/drivers/usb/gadget/function/f_mass_storage.h
index 3b8c4ce2a40a..82ecd3fedb3a 100644
--- a/drivers/usb/gadget/function/f_mass_storage.h
+++ b/drivers/usb/gadget/function/f_mass_storage.h
@@ -110,7 +110,7 @@ struct fsg_config {
 };
 
 static inline struct fsg_opts *
-fsg_opts_from_func_inst(const struct usb_function_instance *fi)
+fsg_opts_from_func_inst(struct usb_function_instance *fi)
 {
 	return container_of(fi, struct fsg_opts, func_inst);
 }
diff --git a/include/linux/usb/composite.h b/include/linux/usb/composite.h
index 6e38fb9d2117..d8c4e9f73839 100644
--- a/include/linux/usb/composite.h
+++ b/include/linux/usb/composite.h
@@ -237,7 +237,7 @@ struct usb_function {
 	/* internals */
 	struct list_head		list;
 	DECLARE_BITMAP(endpoints, 32);
-	const struct usb_function_instance *fi;
+	struct usb_function_instance *fi;
 
 	unsigned int		bind_deactivated:1;
 };
-- 
2.49.0


