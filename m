Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 219C8480163
	for <lists+linux-usb@lfdr.de>; Mon, 27 Dec 2021 17:06:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231194AbhL0QG5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 27 Dec 2021 11:06:57 -0500
Received: from mga06.intel.com ([134.134.136.31]:33601 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230506AbhL0QG5 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 27 Dec 2021 11:06:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640621217; x=1672157217;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eAZgRnuT9dKRF9dmMFjEETOT5MJMTrgCFOUoMNBOSvY=;
  b=Qb8Xy4WjQt+A/eUllgPmDruxg2D79AJfRg3kxrzEh8ir9QEQqWY6Nhev
   kqLBGA1dN+l9wUALAsRB4XW5OtlAYxcNJIk/bFN5JZqetjIoeQogdOIHf
   4WW1IwlHW/Fx1aE1lyCb4EhA7jIy6w/G6yr5LlRa61Xir1H3ZkYca2WC6
   +xHFHwk9rfQcI/j87pg8Kv1QsszpHt3XL89HTAti7/5N4AXvuHG3jQLVV
   nkZvWisZELZyjtUdjNfHmdfd/zINpxc8+cGaWL/SR2xub9VBBiB5rElg2
   umk8oVYpbWajl8cqmP+7ReMJyd0jNC1inhBT600qzy7HroGznNB5dVVe5
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10209"; a="301984371"
X-IronPort-AV: E=Sophos;i="5.88,239,1635231600"; 
   d="scan'208,223";a="301984371"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2021 08:06:56 -0800
X-IronPort-AV: E=Sophos;i="5.88,239,1635231600"; 
   d="scan'208,223";a="686321388"
Received: from ccdjpclinux26.jer.intel.com (HELO localhost) ([10.12.48.253])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2021 08:06:54 -0800
Date:   Mon, 27 Dec 2021 18:13:44 +0200
From:   Gil Fine <gil.fine@intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Gil Fine <gil.fine@intel.com>, andreas.noever@gmail.com,
        michael.jamet@intel.com, YehezkelShB@gmail.com,
        linux-usb@vger.kernel.org, lukas@wunner.de
Subject: Re: [PATCH v2 0/7] thunderbolt: CLx support for USB4 and Titan Ridge
Message-ID: <20211227161344.GJ24036@ccdjLinux26>
References: <20211217011644.21634-1-gil.fine@intel.com>
 <YcMzwjicgQlDYljP@lahna>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="vGgW1X5XWziG23Ko"
Content-Disposition: inline
In-Reply-To: <YcMzwjicgQlDYljP@lahna>
Organization: Intel Israel Jerusalem (IDPj /IDCj) Har Hotzvim, HaMarpe Street
 9, Zip code 9777409
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--vGgW1X5XWziG23Ko
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mika,
About latest patches series adding CL0s in thunderbolt/next.git
1.
Attached fix for CL0s enabled check - w/o it, the CL0s enabling fails

2.
Maybe it is better not to mention "Intel limitation..." about the first-hop
router since I am not sure this is correct. Attached patch w/ my proposal.

3.
Don't we prefer to stay with the name: "tb_switch_titan_ridge_pcie_l1_enable" ?
so that it is clear that the function is Titan Ridge specific?
If so, sending patch for this

Thanks,
Gil

On Wed, Dec 22, 2021 at 04:18:42PM +0200, Mika Westerberg wrote:
> Hi Gil,
> 
> On Fri, Dec 17, 2021 at 03:16:37AM +0200, Gil Fine wrote:
> > v1 can be found here:
> > 
> >   https://lore.kernel.org/linux-usb/20211125143821.16558-1-gil.fine@intel.com/
> > 
> > Changes from v1:
> > 
> > * Fixed comment from Yehezkel
> > * Fixed comments from Mika
> > * Fixed commit messages
> > * Fixed time-posting procedure to follow the USB4 Connection Manager Guide 1.0
> >   (this resolves the time posting issue after resume from suspend-to-disk)
> > * Fixed TMU config in bidirectional mode - disable unidirectional
> > * Fixed TMU config in bidirectional mode - set HiFi rate for downstream router
> > 
> > Gil Fine (7):
> >   thunderbolt: Add TMU unidirectional mode
> >   thunderbolt: Add CL0s support for USB4
> >   thunderbolt: Move usb4_switch_wait_for_bit() to switch.c
> >   thunderbolt: Enable TMU for Titan Ridge device
> >   thunderbolt: Rename Intel VSC capability
> >   thunderbolt: Enable CL0s for Titan Ridge device
> >   thunderbolt: Add kernel param for CLx disabling
> 
> I did some minor tweaks and applied to thunderbolt.git/next, thanks!
> Please check that it still works for you.

-- 
Thanks,
Gil
---------------------------------------------------------------------
Intel Israel (74) Limited

This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.

--vGgW1X5XWziG23Ko
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="0001-thunderbolt-Fix-CLx-support-check-function-tb_port_c.patch"

From 258e536a68845ebfff77c5bdef4a3174510cbaa6 Mon Sep 17 00:00:00 2001
From: Gil Fine <gil.fine@intel.com>
Date: Mon, 27 Dec 2021 17:09:42 +0200
Subject: [PATCH 1/3] thunderbolt: Fix CLx support check function
 tb_port_clx_supported()

Fix CLx support check function tb_port_clx_supported() to work both for
USB4 and for Titan Ridge.

Signed-off-by: Gil Fine <gil.fine@intel.com>
---
 drivers/thunderbolt/lc.c     | 3 ---
 drivers/thunderbolt/switch.c | 9 ++++++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/thunderbolt/lc.c b/drivers/thunderbolt/lc.c
index 817e2dd0dc80..53495a38b4eb 100644
--- a/drivers/thunderbolt/lc.c
+++ b/drivers/thunderbolt/lc.c
@@ -206,9 +206,6 @@ bool tb_lc_is_clx_supported(struct tb_port *port)
 	int cap, ret;
 	u32 val;
 
-	if (!tb_switch_is_titan_ridge(sw))
-		return false;
-
 	cap = find_port_lc_cap(port);
 	if (cap < 0)
 		return false;
diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index 718dd8dcf35b..d026e305fe5d 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -3325,6 +3325,7 @@ static int tb_switch_pm_secondary_resolve(struct tb_switch *sw)
 	return tb_port_pm_secondary_disable(down);
 }
 
+/* Called for USB4 or Titan Ridge routers only */
 static bool tb_port_clx_supported(struct tb_port *port, enum tb_clx clx)
 {
 	u32 mask, val;
@@ -3338,10 +3339,12 @@ static bool tb_port_clx_supported(struct tb_port *port, enum tb_clx clx)
 	if (port->xdomain)
 		return false;
 
-	if (tb_switch_is_usb4(port->sw) && !usb4_port_clx_supported(port))
-		return false;
-	else if (!tb_lc_is_clx_supported(port))
+	if (tb_switch_is_usb4(port->sw)) {
+		if (!usb4_port_clx_supported(port))
+			return false;
+	} else if (!tb_lc_is_clx_supported(port)) {
 		return false;
+	}
 
 	switch (clx) {
 	case TB_CL0S:
-- 
2.17.1


--vGgW1X5XWziG23Ko
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="0002-thunderbolt-Fix-function-tb_switch_pcie_l1_enable-de.patch"

From 19e02816fbbda932c66f5bba72bd45b389303102 Mon Sep 17 00:00:00 2001
From: Gil Fine <gil.fine@intel.com>
Date: Mon, 27 Dec 2021 17:28:25 +0200
Subject: [PATCH 2/3] thunderbolt: Fix function tb_switch_pcie_l1_enable()
 description

Fixed kernel-doc function description for tb_switch_pcie_l1_enable()

Signed-off-by: Gil Fine <gil.fine@intel.com>
---
 drivers/thunderbolt/switch.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index d026e305fe5d..31b4f3f11bfb 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -3663,8 +3663,8 @@ static int tb_switch_pcie_bridge_write(struct tb_switch *sw, unsigned int bridge
  *
  * For Titan Ridge switch to enter CLx state, its PCIe bridges shall enable
  * entry to PCIe L1 state. Shall be called after the upstream PCIe tunnel
- * was configured. Due to Intel platforms limitation, shall be called only
- * for first hop switch.
+ * was configured. Shall be called only for first hop switch as this is the
+ * most common use-case and the only that is supported on Intel platforms.
  */
 int tb_switch_pcie_l1_enable(struct tb_switch *sw)
 {
-- 
2.17.1


--vGgW1X5XWziG23Ko
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="0003-thunderbolt-Fix-name-of-tb_switch_pcie_l1_enable-fun.patch"

From f86523bd26ee76be45c59736f49259484ce75fee Mon Sep 17 00:00:00 2001
From: Gil Fine <gil.fine@intel.com>
Date: Mon, 27 Dec 2021 17:38:35 +0200
Subject: [PATCH 3/3] thunderbolt: Fix name of tb_switch_pcie_l1_enable()
 function

The function tb_switch_pcie_l1_enable() is used for Intel Titan Ridge router
only, therefore, fix the name accordingly.

Signed-off-by: Gil Fine <gil.fine@intel.com>
---
 drivers/thunderbolt/switch.c | 4 ++--
 drivers/thunderbolt/tb.c     | 2 +-
 drivers/thunderbolt/tb.h     | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index 31b4f3f11bfb..5de8cb0062b1 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -3658,7 +3658,7 @@ static int tb_switch_pcie_bridge_write(struct tb_switch *sw, unsigned int bridge
 }
 
 /**
- * tb_switch_pcie_l1_enable() - Enable PCIe link to enter L1 state
+ * tb_switch_titan_ridge_pcie_l1_enable() - Enable PCIe link to enter L1 state
  * @sw: Router to enable PCIe L1
  *
  * For Titan Ridge switch to enter CLx state, its PCIe bridges shall enable
@@ -3666,7 +3666,7 @@ static int tb_switch_pcie_bridge_write(struct tb_switch *sw, unsigned int bridge
  * was configured. Shall be called only for first hop switch as this is the
  * most common use-case and the only that is supported on Intel platforms.
  */
-int tb_switch_pcie_l1_enable(struct tb_switch *sw)
+int tb_switch_titan_ridge_pcie_l1_enable(struct tb_switch *sw)
 {
 	struct tb_switch *parent = tb_switch_parent(sw);
 	int ret;
diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index cbd0ad85ffb1..fc2e688d2250 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -1096,7 +1096,7 @@ static int tb_tunnel_pci(struct tb *tb, struct tb_switch *sw)
 	 * PCIe L1 is needed to enable CL0s for Titan Ridge so enable it
 	 * here.
 	 */
-	if (tb_switch_pcie_l1_enable(sw))
+	if (tb_switch_titan_ridge_pcie_l1_enable(sw))
 		tb_sw_warn(sw, "failed to enable PCIe L1 for Titan Ridge\n");
 
 	list_add_tail(&tunnel->list, &tcm->tunnel_list);
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index 74d3b14f004e..40551b040da0 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -985,7 +985,7 @@ static inline bool tb_switch_is_clx_supported(const struct tb_switch *sw)
 
 int tb_switch_mask_clx_objections(struct tb_switch *sw);
 
-int tb_switch_pcie_l1_enable(struct tb_switch *sw);
+int tb_switch_titan_ridge_pcie_l1_enable(struct tb_switch *sw);
 
 int tb_wait_for_port(struct tb_port *port, bool wait_if_unplugged);
 int tb_port_add_nfc_credits(struct tb_port *port, int credits);
-- 
2.17.1


--vGgW1X5XWziG23Ko--

