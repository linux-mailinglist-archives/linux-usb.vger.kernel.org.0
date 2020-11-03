Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BAC532A466D
	for <lists+linux-usb@lfdr.de>; Tue,  3 Nov 2020 14:29:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729320AbgKCN3a (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 3 Nov 2020 08:29:30 -0500
Received: from z5.mailgun.us ([104.130.96.5]:62151 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729213AbgKCN30 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 3 Nov 2020 08:29:26 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1604410166; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=X2YErXafDdkcu6A7UUnXanHOuRGPvsDZ6TouPm+F+5Q=; b=gIZ8JM5Htb+pyUdz08FEG63WOMlPmQnyD/173/ybEh8hCrNr4UiQQ/qEsa2aq0k1otoUUmmn
 YW3RsVyKzwkGHpKpGvUyL09ceaoSeyTbBAEw907fHo0DJgriobo/B5IJgRUOIHpZ2lNYMrQd
 bLaCnJGw9T1lN4ZkK6fDhMSr38k=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyIxZTE2YSIsICJsaW51eC11c2JAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 5fa15af7d8a9d167f3dc4c08 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 03 Nov 2020 13:28:23
 GMT
Sender: jackp=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 1ECAEC384FB; Tue,  3 Nov 2020 08:55:10 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from jackp-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jackp)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D2F5DC384FB;
        Tue,  3 Nov 2020 08:55:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D2F5DC384FB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=jackp@codeaurora.org
From:   Jack Pham <jackp@codeaurora.org>
To:     Felipe Balbi <balbi@kernel.org>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org,
        Chandana Kishori Chiluveru <cchiluve@codeaurora.org>,
        Jack Pham <jackp@codeaurora.org>
Subject: [PATCH] usb: gadget: configfs: Preserve function ordering after bind failure
Date:   Tue,  3 Nov 2020 00:54:56 -0800
Message-Id: <20201103085456.15591-1-jackp@codeaurora.org>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Chandana Kishori Chiluveru <cchiluve@codeaurora.org>

When binding the ConfigFS gadget to a UDC, the functions in each
configuration are added in list order. However, if usb_add_function()
fails, the failed function is put back on its configuration's
func_list and purge_configs_funcs() is called to further clean up.

purge_configs_funcs() iterates over the configurations and functions
in forward order, calling unbind() on each of the previously added
functions. But after doing so, each function gets moved to the
tail of the configuration's func_list. This results in reshuffling
the original order of the functions within a configuration such
that the failed function now appears first even though it may have
originally appeared in the middle or even end of the list. At this
point if the ConfigFS gadget is attempted to re-bind to the UDC,
the functions will be added in a different order than intended,
with the only recourse being to remove and relink the functions all
over again.

An example of this as follows:

ln -s functions/mass_storage.0 configs/c.1
ln -s functions/ncm.0 configs/c.1
ln -s functions/ffs.adb configs/c.1	# oops, forgot to start adbd
echo "<udc device>" > UDC		# fails
start adbd
echo "<udc device>" > UDC		# now succeeds, but...
					# bind order is
					# "ADB", mass_storage, ncm

[30133.118289] configfs-gadget gadget: adding 'Mass Storage Function'/ffffff810af87200 to config 'c'/ffffff817d6a2520
[30133.119875] configfs-gadget gadget: adding 'cdc_network'/ffffff80f48d1a00 to config 'c'/ffffff817d6a2520
[30133.119974] using random self ethernet address
[30133.120002] using random host ethernet address
[30133.139604] usb0: HOST MAC 3e:27:46:ba:3e:26
[30133.140015] usb0: MAC 6e:28:7e:42:66:6a
[30133.140062] configfs-gadget gadget: adding 'Function FS Gadget'/ffffff80f3868438 to config 'c'/ffffff817d6a2520
[30133.140081] configfs-gadget gadget: adding 'Function FS Gadget'/ffffff80f3868438 --> -19
[30133.140098] configfs-gadget gadget: unbind function 'Mass Storage Function'/ffffff810af87200
[30133.140119] configfs-gadget gadget: unbind function 'cdc_network'/ffffff80f48d1a00
[30133.173201] configfs-gadget a600000.dwc3: failed to start g1: -19
[30136.661933] init: starting service 'adbd'...
[30136.700126] read descriptors
[30136.700413] read strings
[30138.574484] configfs-gadget gadget: adding 'Function FS Gadget'/ffffff80f3868438 to config 'c'/ffffff817d6a2520
[30138.575497] configfs-gadget gadget: adding 'Mass Storage Function'/ffffff810af87200 to config 'c'/ffffff817d6a2520
[30138.575554] configfs-gadget gadget: adding 'cdc_network'/ffffff80f48d1a00 to config 'c'/ffffff817d6a2520
[30138.575631] using random self ethernet address
[30138.575660] using random host ethernet address
[30138.595338] usb0: HOST MAC 2e:cf:43:cd:ca:c8
[30138.597160] usb0: MAC 6a:f0:9f:ee:82:a0
[30138.791490] configfs-gadget gadget: super-speed config #1: c

Fix this by reversing the iteration order of the functions in
purge_config_funcs() when unbinding them, and adding them back to
the config's func_list at the head instead of the tail. This
ensures that we unbind and unwind back to the original list order.

Fixes: 88af8bbe4ef7 ("usb: gadget: the start of the configfs interface")
Signed-off-by: Chandana Kishori Chiluveru <cchiluve@codeaurora.org>
Signed-off-by: Jack Pham <jackp@codeaurora.org>
---
 drivers/usb/gadget/configfs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/configfs.c b/drivers/usb/gadget/configfs.c
index 56051bb97349..3dda1d63f231 100644
--- a/drivers/usb/gadget/configfs.c
+++ b/drivers/usb/gadget/configfs.c
@@ -1248,9 +1248,9 @@ static void purge_configs_funcs(struct gadget_info *gi)
 
 		cfg = container_of(c, struct config_usb_cfg, c);
 
-		list_for_each_entry_safe(f, tmp, &c->functions, list) {
+		list_for_each_entry_safe_reverse(f, tmp, &c->functions, list) {
 
-			list_move_tail(&f->list, &cfg->func_list);
+			list_move(&f->list, &cfg->func_list);
 			if (f->unbind) {
 				dev_dbg(&gi->cdev.gadget->dev,
 					"unbind function '%s'/%p\n",
-- 
2.24.0

