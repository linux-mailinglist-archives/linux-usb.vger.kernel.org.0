Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45E961BB17B
	for <lists+linux-usb@lfdr.de>; Tue, 28 Apr 2020 00:27:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726262AbgD0W1n (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 27 Apr 2020 18:27:43 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:45290 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726251AbgD0W1n (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 27 Apr 2020 18:27:43 -0400
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 04449C0542;
        Mon, 27 Apr 2020 22:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1588026463; bh=KVSJHZMGuyFfz1TIXa9EL7mbeAAGSpBsKoaKFUDDBRE=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=bEONmTNNXPet132CBVNvcwszzxjRor26uw1av4YNQZgMBSQXD1qCG3ekZ4LANX2co
         MIcoj2DVsW9TL9GaFO64jA5boZfzTAbTf2y4wHoTKHrEJKj7knuiLXG9hnnXkeEo3S
         pXg2H4humbJmmuggmb2hBsZjJMc/DSs0TGN7kL07RKbdFVcSXBhLfzf0wDkVbqx+mh
         Fw2W1fKYgomQbDvUtbwkotIwNLZKxCEBvumwr4WEcY3bsokQOyqPGJ/0xD5mfHS2hc
         RT8VO3WppZfExxWYTusueesPW1MvHNDG9l34IWnqn2ZmiHSfcItPC76rec0vPvpm9o
         guC+NM706lC1Q==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 81C59A007B;
        Mon, 27 Apr 2020 22:27:41 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Mon, 27 Apr 2020 15:27:41 -0700
Date:   Mon, 27 Apr 2020 15:27:41 -0700
Message-Id: <456f864b86a72ab9490ce095d5ba3f59b39d6a09.1588025916.git.thinhn@synopsys.com>
In-Reply-To: <cover.1588025916.git.thinhn@synopsys.com>
References: <cover.1588025916.git.thinhn@synopsys.com>
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH 1/5] usb: gadget: Introduce usb_request->is_last field
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

A transfer is composed of one or more usb_requests. Currently, only the
function driver knows this based on its implementation and its class
protocol. However, some usb controllers need to know this to update its
resources. For example, the DWC3 controller needs this info to update
its internal resources and initiate different streams.

Introduce a new field is_last to usb_request to inform the controller
driver whether the request is the last of its transfer.

Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
---
 include/linux/usb/gadget.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/usb/gadget.h b/include/linux/usb/gadget.h
index e959c09a97c9..742c52f7e470 100644
--- a/include/linux/usb/gadget.h
+++ b/include/linux/usb/gadget.h
@@ -50,6 +50,7 @@ struct usb_ep;
  * @short_not_ok: When reading data, makes short packets be
  *     treated as errors (queue stops advancing till cleanup).
  * @dma_mapped: Indicates if request has been mapped to DMA (internal)
+ * @is_last: Indicates if this request is the last of a transfer.
  * @complete: Function called when request completes, so this request and
  *	its buffer may be re-used.  The function will always be called with
  *	interrupts disabled, and it must not sleep.
@@ -108,6 +109,7 @@ struct usb_request {
 	unsigned		zero:1;
 	unsigned		short_not_ok:1;
 	unsigned		dma_mapped:1;
+	unsigned		is_last:1;
 
 	void			(*complete)(struct usb_ep *ep,
 					struct usb_request *req);
-- 
2.11.0

