Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A15416625DB
	for <lists+linux-usb@lfdr.de>; Mon,  9 Jan 2023 13:51:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234329AbjAIMva (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 9 Jan 2023 07:51:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233804AbjAIMum (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 9 Jan 2023 07:50:42 -0500
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5C33BDD
        for <linux-usb@vger.kernel.org>; Mon,  9 Jan 2023 04:50:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673268617; x=1704804617;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=WyfkvVc8vtWBAhLnYGyACRlYW+3FZK91L0y69LAg220=;
  b=PEK4thpzaqwENQvTK9G8jGHlFpYP88YYXbk4NM9rCvhM6XziZt8e5vO2
   s6rc/hBKSLppquDjMDDcagoN0NjK4cINq4PrXpOQDUiudMaOdni/bCf+7
   fF6OTCKPkcN9ataoyu8jOoosG4E8UYBCgdU6siFg0cBSH9ly9Mcq+2uHK
   MZcc00vux1Im9CrOvhbWBWU4lq9YEHAm2yvUn0csJXYTVgRzmnbrcS0tB
   zlrYB3O5iW6QY42fzbbeSgTg3xizk6IPwTZkWDvw/tHjDFjos2lBOrItw
   VERZajNlveZRVOR++FboyNzqgd6T5LIfykQEcKymn02kzM/Rzfcm7+0eN
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10584"; a="321566751"
X-IronPort-AV: E=Sophos;i="5.96,311,1665471600"; 
   d="scan'208";a="321566751"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2023 04:50:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10584"; a="780676246"
X-IronPort-AV: E=Sophos;i="5.96,311,1665471600"; 
   d="scan'208";a="780676246"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga004.jf.intel.com with ESMTP; 09 Jan 2023 04:50:05 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 4A477F4; Mon,  9 Jan 2023 14:50:38 +0200 (EET)
Date:   Mon, 9 Jan 2023 14:50:38 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Christian =?utf-8?Q?Schaubschl=C3=A4ger?= 
        <christian.schaubschlaeger@gmx.at>
Cc:     linux-usb@vger.kernel.org,
        "michael.simon@cpsd.at" <michael.simon@cpsd.at>
Subject: Re: Possible problem with thunderbolt 4
Message-ID: <Y7wNnrlEWMOV4Cj/@black.fi.intel.com>
References: <Y7K7zLoAQVyv0zD5@black.fi.intel.com>
 <011df027-5381-1e10-9c54-e0935ae549f9@gmx.at>
 <Y7ME7EwduIQE38+2@black.fi.intel.com>
 <a324ff2a-d014-83d2-4f30-b865db7c352b@gmx.at>
 <Y7QMlV82mtaApJwJ@black.fi.intel.com>
 <a8c1dd4b-7227-5ba2-97a4-a2dc3d561ea3@gmx.at>
 <Y7RSrLYfG1r8b+Zj@black.fi.intel.com>
 <86a6b7ca-4302-00fe-97f6-d48ebb5e6171@gmx.at>
 <Y7UzCY6ujQ2qtoq5@black.fi.intel.com>
 <057da4af-9507-fdc6-9588-160a88210674@gmx.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <057da4af-9507-fdc6-9588-160a88210674@gmx.at>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On Mon, Jan 09, 2023 at 01:17:30PM +0100, Christian Schaubschläger wrote:
> Hello again,
> 
> >> Earlier you said that with Windows 11 the behaviour might be the same
> >> as in Linux. I'll try that next week (out of office until then). If
> >> Win 11 indeed has the same problem, then I guess someone at HP or
> >> wherever will address this sooner or later. I mean, the requirement
> >> for a working network device/stack after a reboot from an OS is not
> >> that unusual I'd say...
> > I agree. If it turns out that Windows 11 works wrt. this (please check
> > that it is using Windows "inbox" driver for TBT) then we need to figure
> > out what it is doing differently.
> 
> So today I've installed Windows 11 22H2 on the EliteBook, and I can report this:
> 
> * The thunderbolt controller is run by a driver from Microsoft (in the Win 11 device manager it's no longer called "Thunderbolt Controller", but "USB4 Host Router".
> * I think there isn't even a thunderbolt driver from Intel for Windows 11 - at least on the HP support site for the EliteBook they don't have one (but they do have an Intel driver for Windows 10).

Yes, Windows 11 has "native" support so there is no need for a vendor
driver.

> * And regarding functionality: after rebooting Windows 11, the network device is visible in the firmware, and working fine...
> 
> Any more test I could make?

Okay it could be that Windows CM is doing something during the reboot,
like resetting the ports. Can you try the below hack patch and see if
that makes it work the same in Linux?

diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index 1711dc19b1e2..584d839c7943 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -1977,22 +1977,24 @@ static void tb_stop(struct tb *tb)
 {
 	struct tb_cm *tcm = tb_priv(tb);
 	struct tb_tunnel *tunnel;
+	struct tb_port *port;
 	struct tb_tunnel *n;
 
 	cancel_delayed_work(&tcm->remove_work);
 	/* tunnels are only present after everything has been initialized */
 	list_for_each_entry_safe(tunnel, n, &tcm->tunnel_list, list) {
-		/*
-		 * DMA tunnels require the driver to be functional so we
-		 * tear them down. Other protocol tunnels can be left
-		 * intact.
-		 */
-		if (tb_tunnel_is_dma(tunnel))
-			tb_tunnel_deactivate(tunnel);
+		tb_tunnel_deactivate(tunnel);
 		tb_tunnel_free(tunnel);
 	}
-	tb_switch_remove(tb->root_switch);
+
 	tcm->hotplug_active = false; /* signal tb_handle_hotplug to quit */
+
+	tb_switch_for_each_port(tb->root_switch, port) {
+		if (tb_port_is_null(port))
+			usb4_port_reset(port);
+	}
+
+	tb_switch_remove(tb->root_switch);
 }
 
 static int tb_scan_finalize_switch(struct device *dev, void *data)
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index 3095c206ea8a..c4cf8eee6771 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -1243,6 +1243,7 @@ void usb4_switch_remove_ports(struct tb_switch *sw);
 
 int usb4_port_unlock(struct tb_port *port);
 int usb4_port_hotplug_enable(struct tb_port *port);
+int usb4_port_reset(struct tb_port *port);
 int usb4_port_configure(struct tb_port *port);
 void usb4_port_unconfigure(struct tb_port *port);
 int usb4_port_configure_xdomain(struct tb_port *port, struct tb_xdomain *xd);
diff --git a/drivers/thunderbolt/tb_regs.h b/drivers/thunderbolt/tb_regs.h
index 4ecbe811ea43..8797a7c0316e 100644
--- a/drivers/thunderbolt/tb_regs.h
+++ b/drivers/thunderbolt/tb_regs.h
@@ -384,6 +384,7 @@ struct tb_regs_port_header {
 #define PORT_CS_18_WODS				BIT(17)
 #define PORT_CS_18_WOU4S			BIT(18)
 #define PORT_CS_19				0x13
+#define PORT_CS_19_DPR				BIT(0)
 #define PORT_CS_19_PC				BIT(3)
 #define PORT_CS_19_PID				BIT(4)
 #define PORT_CS_19_WOC				BIT(16)
diff --git a/drivers/thunderbolt/usb4.c b/drivers/thunderbolt/usb4.c
index b4fbc692ffc3..6a632ace4530 100644
--- a/drivers/thunderbolt/usb4.c
+++ b/drivers/thunderbolt/usb4.c
@@ -1111,6 +1111,39 @@ int usb4_port_hotplug_enable(struct tb_port *port)
 	return tb_port_write(port, &val, TB_CFG_PORT, ADP_CS_5, 1);
 }
 
+int usb4_port_reset(struct tb_port *port)
+{
+	int ret;
+	u32 val;
+
+	if (!port->cap_usb4)
+		return -EINVAL;
+
+	ret = tb_port_read(port, &val, TB_CFG_PORT,
+			   port->cap_usb4 + PORT_CS_19, 1);
+	if (ret)
+		return ret;
+
+	val |= PORT_CS_19_DPR;
+
+	ret = tb_port_write(port, &val, TB_CFG_PORT,
+			    port->cap_usb4 + PORT_CS_19, 1);
+	if (ret)
+		return ret;
+
+	msleep(10);
+
+	ret = tb_port_read(port, &val, TB_CFG_PORT,
+			   port->cap_usb4 + PORT_CS_19, 1);
+	if (ret)
+		return ret;
+
+	val &= ~PORT_CS_19_DPR;
+
+	return tb_port_write(port, &val, TB_CFG_PORT,
+			     port->cap_usb4 + PORT_CS_19, 1);
+}
+
 static int usb4_port_set_configured(struct tb_port *port, bool configured)
 {
 	int ret;
