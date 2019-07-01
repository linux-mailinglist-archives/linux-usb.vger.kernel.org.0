Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 437FA19A2F
	for <lists+linux-usb@lfdr.de>; Fri, 10 May 2019 11:02:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727217AbfEJJC3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 10 May 2019 05:02:29 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:16138 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727176AbfEJJC0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 10 May 2019 05:02:26 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5cd53e290000>; Fri, 10 May 2019 02:02:33 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Fri, 10 May 2019 02:02:25 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Fri, 10 May 2019 02:02:25 -0700
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL108.nvidia.com
 (172.18.146.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 10 May
 2019 09:02:25 +0000
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 10 May
 2019 09:02:22 +0000
Received: from hqnvemgw02.nvidia.com (172.16.227.111) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Fri, 10 May 2019 09:02:22 +0000
Received: from jilin-desktop.nvidia.com (Not Verified[10.19.120.147]) by hqnvemgw02.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5cd53e1c0001>; Fri, 10 May 2019 02:02:21 -0700
From:   Jim Lin <jilin@nvidia.com>
To:     <gregkh@linuxfoundation.org>, <mathias.nyman@intel.com>,
        <stern@rowland.harvard.edu>, <kai.heng.feng@canonical.com>,
        <drinkcat@chromium.org>, <keescook@chromium.org>,
        <nsaenzjulienne@suse.de>, <jflat@chromium.org>, <malat@debian.org>
CC:     <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Jim Lin <jilin@nvidia.com>
Subject: [PATCH v8 0/2] usb: xhci: Add Clear_TT_Buffer
Date:   Fri, 10 May 2019 17:02:15 +0800
Message-ID: <1557478937-30486-1-git-send-email-jilin@nvidia.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1557478953; bh=HxriOMe6y8xvNiX0NWN/bUr/ReRy1w79NVMwymly0MA=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         MIME-Version:Content-Type;
        b=VCdDafDCkAE0TANIy9yVfoBY/mT9ofmg+pPwVNV4Ch2I8yyi9kALbSw45DZIajf5d
         1Q7zayocTCtNAb8+3AL3guA1ypZ1xahJ0YSjt2UOkRe21aKS/d5gTiXUVq51e3OvTr
         dO7Sd9FuK4mNKvoptoJntOJCOxGdn+EKPNR2ISzFiN/y1UPmhuG+UXaphTNiRd5sxr
         DP6DSNU98tmKh961E6u07jO0g7+2pIRo+YcC7FyKthL6kgaV2SM/Q0L3JR70o+tRQ3
         lTNQ6bfeTVdFa2YeSObyrTHRa91zwAvb5imLIfgpsCI7aJFYC0um9HA4nqeCesNLHp
         ztnEziGJFWWQw==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

USB 2.0 specification chapter 11.17.5 says "as part of endpoint halt
processing for full-/low-speed endpoints connected via a TT, the host
software must use the Clear_TT_Buffer request to the TT to ensure
that the buffer is not in the busy state".

In our case, a full-speed speaker (ConferenceCam) is behind a high-
speed hub (ConferenceCam Connect), sometimes once we get STALL on a
request we may continue to get STALL with the folllowing requests,
like Set_Interface.

Solution is to invoke usb_hub_clear_tt_buffer() to send
Clear_TT_Buffer request to the hub of the device for the following
Set_Interface requests to the device to get ACK successfully.

The Clear_TT_Buffer request sent to the hub includes the address of
the LS/FS child device in wValue field. usb_hub_clear_tt_buffer()
uses udev->devnum to set the address wValue. This won't work for
devices connected to xHC.

For other host controllers udev->devnum is the same as the address of
the usb device, chosen and set by usb core. With xHC the controller
hardware assigns the address, and won't be the same as devnum.

Here we have two patches.
One is to add devaddr in struct usb_device for
usb_hub_clear_tt_buffer() to use.
Another is to update devaddr in XHCI address_device callback
function and invoke usb_hub_clear_tt_buffer() for halt processing.
 
Signed-off-by: Jim Lin <jilin@nvidia.com>

Jim Lin (2):
  usb: hub : Add devaddr in struct usb_device
  usb: xhci: Add Clear_TT_Buffer support

 drivers/usb/core/hub.c       |  4 +++-
 drivers/usb/host/xhci-ring.c | 12 ++++++++++++
 drivers/usb/host/xhci.c      |  1 +
 include/linux/usb.h          |  2 ++
 4 files changed, 18 insertions(+), 1 deletion(-)

-- 
2.1.4

