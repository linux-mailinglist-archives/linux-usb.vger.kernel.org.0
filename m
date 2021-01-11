Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA4962F147E
	for <lists+linux-usb@lfdr.de>; Mon, 11 Jan 2021 14:25:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731146AbhAKNZ3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 11 Jan 2021 08:25:29 -0500
Received: from mail.kernel.org ([198.145.29.99]:35568 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732499AbhAKNRH (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 11 Jan 2021 08:17:07 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9C8D722B49;
        Mon, 11 Jan 2021 13:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1610370987;
        bh=/pd8RLnDeNu7p+BdZvik1txSdKxNe8f/cfwwP4ayZU8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=D4PPowDYvR3lEVFd2FCYoGIQre1dIZEx+cutlJL//zPRrUSo+NRsK7sSTWTz9J9X5
         b/ULHvOSPVqfdHQOQ7/+uB9OLydXQpbvQpLWHCPX3ZOgLdykcbG7y8v8hsRKR1k1qG
         JwIgKNgyjG9wm7JfDDOOj8HEwOudTu8zfPgl233E=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     linux-kernel@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        stable@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>,
        syzbot+297d20e437b79283bf6d@syzkaller.appspotmail.com,
        Yuyang Du <yuyang.du@intel.com>,
        Shuah Khan <shuahkh@osg.samsung.com>, linux-usb@vger.kernel.org
Subject: [PATCH 5.10 090/145] usb: usbip: vhci_hcd: protect shift size
Date:   Mon, 11 Jan 2021 14:01:54 +0100
Message-Id: <20210111130052.856084802@linuxfoundation.org>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210111130048.499958175@linuxfoundation.org>
References: <20210111130048.499958175@linuxfoundation.org>
User-Agent: quilt/0.66
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Randy Dunlap <rdunlap@infradead.org>

commit 718bf42b119de652ebcc93655a1f33a9c0d04b3c upstream.

Fix shift out-of-bounds in vhci_hcd.c:

  UBSAN: shift-out-of-bounds in ../drivers/usb/usbip/vhci_hcd.c:399:41
  shift exponent 768 is too large for 32-bit type 'int'

Fixes: 03cd00d538a6 ("usbip: vhci-hcd: Set the vhci structure up to work")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Reported-by: syzbot+297d20e437b79283bf6d@syzkaller.appspotmail.com
Cc: Yuyang Du <yuyang.du@intel.com>
Cc: Shuah Khan <shuahkh@osg.samsung.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Cc: stable <stable@vger.kernel.org>
Link: https://lore.kernel.org/r/20201229071309.18418-1-rdunlap@infradead.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

---
 drivers/usb/usbip/vhci_hcd.c |    2 ++
 1 file changed, 2 insertions(+)

--- a/drivers/usb/usbip/vhci_hcd.c
+++ b/drivers/usb/usbip/vhci_hcd.c
@@ -396,6 +396,8 @@ static int vhci_hub_control(struct usb_h
 		default:
 			usbip_dbg_vhci_rh(" ClearPortFeature: default %x\n",
 					  wValue);
+			if (wValue >= 32)
+				goto error;
 			vhci_hcd->port_status[rhport] &= ~(1 << wValue);
 			break;
 		}


