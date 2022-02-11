Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C9034B2D45
	for <lists+linux-usb@lfdr.de>; Fri, 11 Feb 2022 20:05:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239867AbiBKTF2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 11 Feb 2022 14:05:28 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:36882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234187AbiBKTF1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 11 Feb 2022 14:05:27 -0500
Received: from mxout04.lancloud.ru (mxout04.lancloud.ru [45.84.86.114])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADA1ECE9
        for <linux-usb@vger.kernel.org>; Fri, 11 Feb 2022 11:05:23 -0800 (PST)
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout04.lancloud.ru 3D73D20A4D2A
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
Subject: [PATCH] usb: host: xhci-hub: drop redundant port register reads
To:     Mathias Nyman <mathias.nyman@intel.com>,
        <linux-usb@vger.kernel.org>,
        "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Organization: Open Mobile Platform
Message-ID: <5ea9b08b-38a5-498b-8312-c64ad782318a@omp.ru>
Date:   Fri, 11 Feb 2022 22:05:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT01.lancloud.ru (fd00:f066::141) To
 LFEX1907.lancloud.ru (fd00:f066::207)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

In xhci_hub_control(), there are many port register readbacks in several
branches of the *switch* statement which get duplicated right after that
*switch* by reading back the port register once more -- which is done to
flush the posted writes. Remove the redundant reads inside that *switch*.

Found by Linux Verification Center (linuxtesting.org) with the SVACE static
analysis tool.

Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>

---
This patch is against the 'usb-next' branch of Greg KH's 'usb.git' repo.

 drivers/usb/host/xhci-hub.c |    8 --------
 1 file changed, 8 deletions(-)

Index: usb/drivers/usb/host/xhci-hub.c
===================================================================
--- usb.orig/drivers/usb/host/xhci-hub.c
+++ usb/drivers/usb/host/xhci-hub.c
@@ -1323,7 +1323,6 @@ int xhci_hub_control(struct usb_hcd *hcd
 			msleep(10); /* wait device to enter */
 			spin_lock_irqsave(&xhci->lock, flags);
 
-			temp = readl(ports[wIndex]->addr);
 			bus_state->suspended_ports |= 1 << wIndex;
 			break;
 		case USB_PORT_FEAT_LINK_STATE:
@@ -1341,7 +1340,6 @@ int xhci_hub_control(struct usb_hcd *hcd
 					PORT_OCC | PORT_RC | PORT_PLC |
 					PORT_CEC;
 				writel(temp | PORT_PE, ports[wIndex]->addr);
-				temp = readl(ports[wIndex]->addr);
 				break;
 			}
 
@@ -1351,7 +1349,6 @@ int xhci_hub_control(struct usb_hcd *hcd
 					 hcd->self.busnum, wIndex + 1);
 				xhci_set_link_state(xhci, ports[wIndex],
 							link_state);
-				temp = readl(ports[wIndex]->addr);
 				break;
 			}
 
@@ -1384,8 +1381,6 @@ int xhci_hub_control(struct usb_hcd *hcd
 					 hcd->self.busnum, wIndex + 1);
 				xhci_set_link_state(xhci, ports[wIndex],
 						link_state);
-
-				temp = readl(ports[wIndex]->addr);
 				break;
 			}
 			/* Port must be enabled */
@@ -1435,7 +1430,6 @@ int xhci_hub_control(struct usb_hcd *hcd
 					xhci_dbg(xhci, "missing U0 port change event for port %d-%d\n",
 						 hcd->self.busnum, wIndex + 1);
 				spin_lock_irqsave(&xhci->lock, flags);
-				temp = readl(ports[wIndex]->addr);
 				break;
 			}
 
@@ -1460,7 +1454,6 @@ int xhci_hub_control(struct usb_hcd *hcd
 						break;
 				}
 				spin_lock_irqsave(&xhci->lock, flags);
-				temp = readl(ports[wIndex]->addr);
 				bus_state->suspended_ports |= 1 << wIndex;
 			}
 			break;
@@ -1491,7 +1484,6 @@ int xhci_hub_control(struct usb_hcd *hcd
 		case USB_PORT_FEAT_BH_PORT_RESET:
 			temp |= PORT_WR;
 			writel(temp, ports[wIndex]->addr);
-			temp = readl(ports[wIndex]->addr);
 			break;
 		case USB_PORT_FEAT_U1_TIMEOUT:
 			if (hcd->speed < HCD_USB3)
