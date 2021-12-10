Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B45747027E
	for <lists+linux-usb@lfdr.de>; Fri, 10 Dec 2021 15:16:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236457AbhLJOTy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 10 Dec 2021 09:19:54 -0500
Received: from mga12.intel.com ([192.55.52.136]:31713 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234477AbhLJOTy (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 10 Dec 2021 09:19:54 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10193"; a="218372221"
X-IronPort-AV: E=Sophos;i="5.88,195,1635231600"; 
   d="scan'208";a="218372221"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2021 06:16:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,195,1635231600"; 
   d="scan'208";a="463677532"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orsmga006.jf.intel.com with ESMTP; 10 Dec 2021 06:16:00 -0800
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 0/2] xhci fixes for usb-linus
Date:   Fri, 10 Dec 2021 16:17:33 +0200
Message-Id: <20211210141735.1384209-1-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg

A couple xhci patches for usb-linus that solves two suspend/resume related issues.

Thanks
-Mathias

Kai-Heng Feng (1):
  xhci: Remove CONFIG_USB_DEFAULT_PERSIST to prevent xHCI from runtime
    suspending

Mathias Nyman (1):
  xhci: avoid race between disable slot command and host runtime suspend

 drivers/usb/host/xhci-hub.c  |  1 +
 drivers/usb/host/xhci-ring.c |  1 -
 drivers/usb/host/xhci.c      | 26 +++++++++++++++-----------
 3 files changed, 16 insertions(+), 12 deletions(-)

-- 
2.25.1

