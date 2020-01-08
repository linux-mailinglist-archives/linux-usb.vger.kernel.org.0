Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8554E133BAA
	for <lists+linux-usb@lfdr.de>; Wed,  8 Jan 2020 07:24:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725907AbgAHGYx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 8 Jan 2020 01:24:53 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:49802 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725773AbgAHGYx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 8 Jan 2020 01:24:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:Date:Message-ID:Subject:From:To:Sender:Reply-To:Cc:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=WT/rG7jijmtmrCTVpB+o87x6rPrZk8gutV/ruMgIFEw=; b=eZpdrQjSU+iBQzkbjozuyST/8
        orX71swmInBRpgVjVIDUx3Nj79D8dO89hxRuHBtUs4ru3mXLwYVqt4MSvOvLEP1AGJHHBV1+DqIwt
        sk8Kj5HmfZVEA6D7C4Q9lBGqZkvEl3cFVwYRnLho4PcyoJHdfE+jqN7x3rN8gDN//lvghyfsc25ZK
        cIa2dv1/jSiwbthFnp86YFjLzuNn+nutSfx1nqQIBrN3KPLFfDryBTliji28x7PqMy4HWVlZcYXm6
        LloG4QqHYzZUtWz/XxrDH+N8rAf1daYyY/DhmMTXvO1tDcJYkKRvXJQUWWWVHGAxQF2rPjKS0dPjD
        mfZiR7NZg==;
Received: from [2601:1c0:6280:3f0::ed68]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1ip4lv-0001kD-1H; Wed, 08 Jan 2020 06:24:51 +0000
To:     USB list <linux-usb@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] usb: typec: fix non-kernel-doc comments
Message-ID: <88821011-2128-a8dd-68b8-c5ae8f43271f@infradead.org>
Date:   Tue, 7 Jan 2020 22:24:50 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Randy Dunlap <rdunlap@infradead.org>

Use "/*" for non-kernel-doc comments instead of "/**", which is
intended to be used only for kernel-doc notation.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/usb/typec/bus.c |    2 +-
 drivers/usb/typec/mux.c |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

--- lnx-55-rc5.orig/drivers/usb/typec/bus.c
+++ lnx-55-rc5/drivers/usb/typec/bus.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
-/**
+/*
  * Bus for USB Type-C Alternate Modes
  *
  * Copyright (C) 2018 Intel Corporation
--- lnx-55-rc5.orig/drivers/usb/typec/mux.c
+++ lnx-55-rc5/drivers/usb/typec/mux.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
-/**
+/*
  * USB Type-C Multiplexer/DeMultiplexer Switch support
  *
  * Copyright (C) 2018 Intel Corporation

