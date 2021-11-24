Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A8C445CA2F
	for <lists+linux-usb@lfdr.de>; Wed, 24 Nov 2021 17:37:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349080AbhKXQkV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 24 Nov 2021 11:40:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232846AbhKXQkV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 24 Nov 2021 11:40:21 -0500
X-Greylist: delayed 163 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 24 Nov 2021 08:37:11 PST
Received: from osmtp.xiscosoft.net (osmtp.xiscosoft.net [IPv6:2001:41d0:8:c16c::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1055DC061574;
        Wed, 24 Nov 2021 08:37:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=klondike.es;
        s=xiscosoft_net; t=1637771827; x=1638981427;
        bh=N5twuKLqFVXVh7rfLMB4pb6X4neyvZEBmhsC0vA+0zE=;
        h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
         Content-Language:In-Reply-To:Content-Type:
         Content-Transfer-Encoding:From:Subject:To:Cc:Date:Reply-To:
         Content-Type:Sender:Message-ID:References:In-Reply-To:Content-Base:
         Content-Location:Content-features:Content-Disposition:
         Content-Alternative:Content-MD5:Content-Duration:
         Content-Transfer-Encoding:Content-Language:MIME-Version:Content-ID:
         Content-Description:Autocrypt:List-Id:List-Help:List-Unsubscribe:
         List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
         List-Archive:Original-Message-ID:Require-Recipient-Valid-Since:
         Solicitation:Organization:Jabber-ID:Auto-Submitted;
        b=JogUYb0lAg+22Z6CTo+Vmmx50CPcJ2JS+3cDn/hUTmunfVf32KQu60pQY4fVnCuZf
         Lb+6SALw6CHw25HYHLbgNjoByorAw+eXCTBiiI9GxOlp9zh6BggJQ5JoQiVaBrT90G
         FurVxLW2cqOS/OEnWXCDLWCJpjQ0Gibz7pJhY82mA3IT/zWE7xxHjF31WxMIg+eEin
         hBSq/Yq8+Tl/F9kCQHL7StTdiS/XfMkGyPymjAaD2V0oFEaipkW5w3N7S6r7MWSaGq
         qFKup424MGcqTLfE9BMRH1kCzVMv05kbPzVremR5fE8OLhrt020R16z9mQyYK6Vm5I
         6zDJnnu+CAjcg==
Message-ID: <07bd1d90-c95f-0685-e1a8-2211c9dac251@klondike.es>
Date:   Wed, 24 Nov 2021 17:37:05 +0100
MIME-Version: 1.0
From:   "Francisco Blas Izquierdo Riera (klondike)" <klondike@klondike.es>
Subject: [PATCH 1/2] thunderbolt: allow vendor ID override for NVM programming
To:     linux-usb@vger.kernel.org
Cc:     Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Kranthi Kuntala <kranthi.kuntala@intel.com>,
        Rajmohan Mani <rajmohan.mani@intel.com>,
        Mario.Limonciello@dell.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Lukas Wunner <lukas@wunner.de>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        "Francisco Blas Izquierdo Riera (klondike)" <klondike@klondike.es>
References: <8d29b41b-3590-c4b0-a2f8-fa34063bafb3@klondike.es>
Content-Language: en-US
In-Reply-To: <8d29b41b-3590-c4b0-a2f8-fa34063bafb3@klondike.es>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Currently, the vendor ID reported by the chipset is checked before to
avoid accidentally programming devices from unsupported vendors with
a different NVM structure.

Certain Thunderbolt devices store the vendor ID in the NVM, therefore
if the NVM has become corrrupted the device will report an invalid
vendor ID and reflashing will be impossible on GNU/Linux even if the
device can boot in safe mode.

This patch adds a new parameter ``switch_nvm_vendor_override`` which
can be used to override the vendor ID used for detecting the NVM
structure allowing to reflash (and authenticate) a new, valid
image on the device.

Signed-off-by: Francisco Blas Izquierdo Riera (klondike) <klondike@klondike.es>
---
drivers/thunderbolt/switch.c | 9 ++++++++-
1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index 3014146081..a7959c3f3f 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -13,6 +13,7 @@
#include <linux/sched/signal.h>
#include <linux/sizes.h>
#include <linux/slab.h>
+#include <linux/moduleparam.h>
#include "tb.h"
@@ -34,6 +35,10 @@ struct nvm_auth_status {
static LIST_HEAD(nvm_auth_status_cache);
static DEFINE_MUTEX(nvm_auth_status_lock);
+static short switch_nvm_vendor_override = -1;
+module_param(switch_nvm_vendor_override, short, 0440);
+MODULE_PARM_DESC(switch_nvm_vendor_override, "Override the switch vendor id on the nvm access routines");
+
static struct nvm_auth_status *__nvm_get_auth_status(const struct tb_switch *sw)
{
struct nvm_auth_status *st;
@@ -391,7 +396,9 @@ static int tb_switch_nvm_add(struct tb_switch *sw)
* relax this in the future when we learn other NVM formats.
*/
if (sw->config.vendor_id != PCI_VENDOR_ID_INTEL &&
- sw->config.vendor_id != 0x8087) {
+ sw->config.vendor_id != 0x8087 &&
+ switch_nvm_vendor_override != PCI_VENDOR_ID_INTEL &&
+ switch_nvm_vendor_override != 0x8087) {
dev_info(&sw->dev,
"NVM format of vendor %#x is not known, disabling NVM upgrade\n",
sw->config.vendor_id);
