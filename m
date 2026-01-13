Return-Path: <linux-usb+bounces-32219-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B392DD16F89
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jan 2026 08:19:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7AA5F3047914
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jan 2026 07:18:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C31FC369997;
	Tue, 13 Jan 2026 07:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="jvNt3aKI"
X-Original-To: linux-usb@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 245B536921D;
	Tue, 13 Jan 2026 07:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768288717; cv=none; b=ShU38bIKBIXcJfqA6siTJKotlTNkPeW/yK31k4/LZCc+qewnrPXNYb63QJovw7ENICpDlqQ9o8FNlIrU1yDgltwi++8MkCismOUoXhMraZ6/huIN1o35LLUMSzR8H3xTrttBaUkuNNSexXjNqRknPIUaU7onVKJIYUxd7mCJA08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768288717; c=relaxed/simple;
	bh=sLieaHte/omw2+DC4xCadba9sUkWMLPipRMYXqLNZzU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=S7hZ6CC+dFUXT+xmLGeR2OkhLv9a8kueK3Q8PnaD0l202QD2RW1ZCW/EmbdAX+SxKDIN/gAQqd0EqJVT3cGNOT7uQtu/jpQrF34y8nPq5peQMwB74Bynx5Z9gy5DjP/ADzeetHK/cUU1hXjIcWpqVCD0wbQn/rgRNZ3rUGRh0Os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=jvNt3aKI; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=uP+Y74TalLXfEB9hiR3xxrSUKP2zJip+z+qoTZsDS6c=; b=jvNt3aKI+6fhpSXldpE64cLkVX
	Zq9GO717Bx1KImaOfe2wQLxv7WourPRhX93R38fRchrEU95mANzrB9LvDVGUlVfnfcPDxvsNcj3mx
	GXTsdQjKMADCEko95AeoyjL8Q/nKxNenkfcqXISLAsWPO5qxs5AAbZycF22vwo22UQeH1bFnwHXFo
	Z9gXcfI+kEisgUVQUrJr7O2zyF3AZkzn1g/DjIoU//ZtjKi5k5RmQ03KeQJFIHQJgkVZHNeWDpFkB
	H4Mo0k7gfsI8HvGq9tUb3iqTDKJLk4kQ2qbzoDvnxCdRDNwg1PebSBC9mPgDDuagCdzwX1k71ETUk
	lSM5V0gA==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfYfg-00000006dNJ-1teC;
	Tue, 13 Jan 2026 07:18:32 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Kuen-Han Tsai <khtsai@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org
Subject: [PATCH] usb: gadget: u_ether: use <linux/hex.h> header file
Date: Mon, 12 Jan 2026 23:18:31 -0800
Message-ID: <20260113071831.4158296-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since <linux/kernel.h> no longer includes <linux/hex.h>, any users
of the hex interfaces need to include <linux/hex.h> themselves, so
add the header file here as needed.

Suggested-by: Stephen Rothwell <sfr@canb.auug.org.au>
Fixes: e065c6a7e46c ("usb: gadget: u_ether: add gether_opts for config caching")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Closes: https://lore.kernel.org/linux-next/2768c835-7ac9-4540-a665-5dd516a80eee@infradead.org/T/#t
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Kuen-Han Tsai <khtsai@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org

 drivers/usb/gadget/function/u_ether_configfs.h |    1 +
 1 file changed, 1 insertion(+)

--- linux-next.orig/drivers/usb/gadget/function/u_ether_configfs.h
+++ linux-next/drivers/usb/gadget/function/u_ether_configfs.h
@@ -14,6 +14,7 @@
 #define __U_ETHER_CONFIGFS_H
 
 #include <linux/cleanup.h>
+#include <linux/hex.h>
 #include <linux/if_ether.h>
 #include <linux/mutex.h>
 #include <linux/netdevice.h>

