Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 09342E394C
	for <lists+linux-usb@lfdr.de>; Thu, 24 Oct 2019 19:06:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2410064AbfJXRFI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 24 Oct 2019 13:05:08 -0400
Received: from dougal.metanate.com ([90.155.101.14]:4724 "EHLO metanate.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2405819AbfJXRFI (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 24 Oct 2019 13:05:08 -0400
X-Greylist: delayed 1158 seconds by postgrey-1.27 at vger.kernel.org; Thu, 24 Oct 2019 13:05:07 EDT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=simple/simple; d=metanate.com;
         s=stronger; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject
        :Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
        Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
        In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=VPmIoUH0glx+4sENj5EpAXnVlu8h+LV7UwdHblVC1Ng=; b=CrpDtFtRqbksIhycdO0lgzURu+
        8yjQ5E8VqRi22Exu5Z2OryrkD5BvTXOSvzoz5/VbTwGdOgtVFTe9EAO+XmJzVsJBtK+GCJXPeOU8q
        JyW0P1mrrB39R/NO9aMAtuo7mHixa6/7kK6fenK3uGHOmx2BVccR8YjDuMrJgR2gy3C4HdJBOJN7O
        bHQbvWOaAo3M47xf7okxFiQLebFekLLDQp4Aq+xpr+YCkOGmwaZqm06/gwsZUPcJBuE/tOGaSRg3v
        1ATaMjAG7/apiZ+TlttBvy7uurNgYfL/bvG96VNt99pYkDC0gQVuP9xYLl92jtbbWV9kBIzR2UUY+
        p6bp7lHg==;
Received: from 188-39-28-98.static.enta.net ([188.39.28.98] helo=donbot.corp.numark.com)
        by email.metanate.com with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
        (Exim 4.92.3)
        (envelope-from <john@metanate.com>)
        id 1iNgF9-0004oc-4a; Thu, 24 Oct 2019 17:45:47 +0100
From:   John Keeping <john@metanate.com>
To:     linux-usb@vger.kernel.org
Cc:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, John Keeping <john@metanate.com>
Subject: [PATCH 0/6] USB: gadget: f_hid: fix lifetime issues
Date:   Thu, 24 Oct 2019 17:45:32 +0100
Message-Id: <20191024164538.3161474-1-john@metanate.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated: YES
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

File descriptors referencing the /dev/hidgN device created by the HID
gadget can outlive the underlying gadget function, which creates easy to
trigger use-after-frees in the kernel.

A simple reproduction for this using the libusbgx example programs is:

	$ gadget-hid
	$ exec 3<> /dev/hidg0
	$ gadget-vid-pid-remove
	$ exec 3<&-

Closing the file descriptor on the last line triggers a use-after-free
which can be seen immediately with slub_debug=P.

This series fixes this by making the struct cdev associated with the
module rather than dynamically allocated for the gadget and changing
struct f_hidg to be refcounted instead of tied to the gadget lifetime.

John Keeping (6):
  USB: gadget: f_hid: move chardev setup to module init
  USB: gadget: f_hid: switch to IDR for tracking minors
  USB: gadget: f_hid: find f_hidg by IDR lookup on open
  USB: gadget: f_hid: decouple cdev from f_hidg lifetime
  USB: gadget: f_hid: refcount f_hidg structure
  USB: gadget: f_hid: return ENODEV from read/write after deletion

 drivers/usb/gadget/function/f_hid.c | 141 +++++++++++++++++++---------
 drivers/usb/gadget/function/u_hid.h |   3 -
 2 files changed, 95 insertions(+), 49 deletions(-)

-- 
2.23.0

