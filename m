Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D370A45EDD2
	for <lists+linux-usb@lfdr.de>; Fri, 26 Nov 2021 13:25:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232042AbhKZM2n (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 26 Nov 2021 07:28:43 -0500
Received: from mga04.intel.com ([192.55.52.120]:43700 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233247AbhKZM0n (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 26 Nov 2021 07:26:43 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10179"; a="234388664"
X-IronPort-AV: E=Sophos;i="5.87,265,1631602800"; 
   d="scan'208";a="234388664"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2021 04:22:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,265,1631602800"; 
   d="scan'208";a="510623404"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orsmga008.jf.intel.com with ESMTP; 26 Nov 2021 04:22:16 -0800
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 0/1] xhci fix or usb-linus
Date:   Fri, 26 Nov 2021 14:23:39 +0200
Message-Id: <20211126122340.1193239-1-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg

One small fix for usb-linus that has been pending for a while.
Makes sure the 64 bit xhci command ring dequeue pointer stays valid

-Mathias

Mathias Nyman (1):
  xhci: Fix commad ring abort, write all 64 bits to CRCR register.

 drivers/usb/host/xhci-ring.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

-- 
2.25.1

