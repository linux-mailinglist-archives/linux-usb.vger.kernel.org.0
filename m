Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5CBB22DB30
	for <lists+linux-usb@lfdr.de>; Sun, 26 Jul 2020 03:36:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727861AbgGZBgN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 25 Jul 2020 21:36:13 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:50676 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726870AbgGZBgN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 25 Jul 2020 21:36:13 -0400
Received: from mailhost.synopsys.com (sv2-mailhost1.synopsys.com [10.205.2.133])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 35DEF40141;
        Sun, 26 Jul 2020 01:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1595727373; bh=3fp/cDREhQGNDw/AkR1n4G4BuiVYAYEHskNxXjnXthk=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=KcSRA9kgH0n53DHGuYr8bk3jseHeXqmRpki4DajlBA6Tvnui4sOuwhwJx3w9r1dUI
         6x3uf/eLqohTbENOv0Nf8MJZyM2Ufi9aG11thfTjMD8lXT32ilMNR9o07SPHxJVter
         yly6XglpaNd3XcknW3cnGyEDSqA0/4AuZNNoLfoWcmlUBlYwxI1c19brwo6l7/UYwB
         PEIElma1zcvXNHvkyCh8fkkILEbCSwKY+BM4/K/PfLCtA5QsEWiObbuxKtYjVlgq/w
         7V6Gih2QTxrXa+9OsrcgFI6al0AW2bxMeCV50Xp4SJ+k3gfg/lHr6Wknzt/VZgfP0W
         fIuzba+t0Oiew==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 1D1D4A0096;
        Sun, 26 Jul 2020 01:36:12 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Sat, 25 Jul 2020 18:36:12 -0700
Date:   Sat, 25 Jul 2020 18:36:12 -0700
Message-Id: <eb42547e6b066f0b5f9eaa6d3ae48755414e4a43.1595727196.git.thinhn@synopsys.com>
In-Reply-To: <cover.1595727196.git.thinhn@synopsys.com>
References: <cover.1595727196.git.thinhn@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH v4 03/12] usb: gadget: Expose sublink speed attributes
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The USB 3.2 specification supports dual-lane and different transfer
rates for super-speed-plus. Devices operating in super-speed-plus can
be gen2x1, gen1x2, or gen2x2.

A gadget driver may need to know the gadget's sublink speeds to properly
setup its transfer requests and describe its capability in its
descriptors. To describe the transfer rate in super-speed-plus fully,
let's expose the lane count and sublink speed attributes when operating
in super-speed-plus.

Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
---
Changes in v4:
- Change unsigned fields to unsigned int
Changes in v3:
- None
Changes in v2:
- None

 include/linux/usb/gadget.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/include/linux/usb/gadget.h b/include/linux/usb/gadget.h
index 52ce1f6b8f83..d25aefaacba0 100644
--- a/include/linux/usb/gadget.h
+++ b/include/linux/usb/gadget.h
@@ -339,6 +339,15 @@ struct usb_gadget_ops {
  * @speed: Speed of current connection to USB host.
  * @max_speed: Maximal speed the UDC can handle.  UDC must support this
  *      and all slower speeds.
+ * @num_lanes: Number of lanes in use.
+ * @max_num_lanes: Maximum number of lanes the UDC supports.
+ * @ssac: Sublink speed attribute count. The number of sublink speed
+ *	attributes is ssac + 1.
+ * @sublink_speed: Array of sublink speed attributes the UDC supports. Sublink
+ *	speed attributes are paired, and an RX followed by a TX attribute.
+ * @speed_ssid: Current sublink speed attribute ID in use.
+ * @min_speed_ssid: Sublink speed attribute ID with the minimum speed.
+ * @max_speed_ssid: Sublink speed attribute ID with the maximum speed.
  * @state: the state we are now (attached, suspended, configured, etc)
  * @name: Identifies the controller hardware type.  Used in diagnostics
  *	and sometimes configuration.
@@ -406,6 +415,17 @@ struct usb_gadget {
 	struct list_head		ep_list;	/* of usb_ep */
 	enum usb_device_speed		speed;
 	enum usb_device_speed		max_speed;
+
+	/* SSP only */
+	unsigned int			num_lanes;
+	unsigned int			max_num_lanes;
+	unsigned int			ssac;
+#define USB_GADGET_MAX_SSAC 3
+	struct usb_sublink_speed	sublink_speed[USB_GADGET_MAX_SSAC + 1];
+	unsigned int			speed_ssid;
+	unsigned int			min_speed_ssid;
+	unsigned int			max_speed_ssid;
+
 	enum usb_device_state		state;
 	const char			*name;
 	struct device			dev;
-- 
2.11.0

