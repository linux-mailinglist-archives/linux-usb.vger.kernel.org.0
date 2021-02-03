Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A85C830D8D0
	for <lists+linux-usb@lfdr.de>; Wed,  3 Feb 2021 12:37:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234351AbhBCLh2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 3 Feb 2021 06:37:28 -0500
Received: from mga11.intel.com ([192.55.52.93]:43914 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234349AbhBCLh1 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 3 Feb 2021 06:37:27 -0500
IronPort-SDR: 7WHALRX/Z170qP4xrOnsbsYJu8XyyuE3VbgcYyDHk3o9Z1rUpH6FqHTRzDV8GlpgKNe0CoTVwR
 uEkhcYrAj2Bg==
X-IronPort-AV: E=McAfee;i="6000,8403,9883"; a="177518912"
X-IronPort-AV: E=Sophos;i="5.79,398,1602572400"; 
   d="scan'208";a="177518912"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2021 03:35:41 -0800
IronPort-SDR: G4HY5HVbBrQjgKqBYtC4ZqYxZD970fNAl04crGYZOyojPUQgx1wdWuZrD0HDql1XLp+f6H+a/w
 2ywbiNjshKQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,398,1602572400"; 
   d="scan'208";a="575866568"
Received: from mattu-haswell.fi.intel.com ([10.237.72.170])
  by orsmga005.jf.intel.com with ESMTP; 03 Feb 2021 03:35:39 -0800
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 0/1] xhci fix for usb-linus 5.11-final
Date:   Wed,  3 Feb 2021 13:37:01 +0200
Message-Id: <20210203113702.436762-1-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg

One last xhci fix for 5.11-final if it still can make it.

Thanks
-Mathias

Mathias Nyman (1):
  xhci: fix bounce buffer usage for non-sg list case

 drivers/usb/host/xhci-ring.c | 31 ++++++++++++++++++++-----------
 1 file changed, 20 insertions(+), 11 deletions(-)

-- 
2.25.1

