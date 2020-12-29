Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 452ED2E7506
	for <lists+linux-usb@lfdr.de>; Tue, 29 Dec 2020 23:46:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726203AbgL2Wqa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 29 Dec 2020 17:46:30 -0500
Received: from so254-31.mailgun.net ([198.61.254.31]:26917 "EHLO
        so254-31.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726156AbgL2Wq3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 29 Dec 2020 17:46:29 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1609281968; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=5IbfeHxPo2MNMbIyb5TeBPGRD/fLqm5VEUUhEIIRtKc=; b=rKKUa4iw6HLCYjTILaTv9Owqz6wVdgqLb5rxjMe15oDCR0k5An3PAvjl2xQPdJFglexM5e0Q
 /i2bDh0YKNO3I+/YvtO27+0pMZwUn6/lAEzIRftVUq3rpvpg9AIiwuDYMafZy3llJMXxbAlm
 SQ856acKWzmpYJ/o7LrNxqGtmYg=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyIxZTE2YSIsICJsaW51eC11c2JAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 5febb1971d5c1fa4277daa88 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 29 Dec 2020 22:45:43
 GMT
Sender: jackp=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id BFE20C433ED; Tue, 29 Dec 2020 22:45:42 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from jackp-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jackp)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6B2B6C433CA;
        Tue, 29 Dec 2020 22:45:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6B2B6C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=jackp@codeaurora.org
From:   Jack Pham <jackp@codeaurora.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>
Cc:     linux-usb@vger.kernel.org,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Chandana Kishori Chiluveru <cchiluve@codeaurora.org>,
        Jack Pham <jackp@codeaurora.org>
Subject: [PATCH v2] usb: gadget: configfs: Preserve function ordering after bind failure
Date:   Tue, 29 Dec 2020 14:44:43 -0800
Message-Id: <20201229224443.31623-1-jackp@codeaurora.org>
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
v2: rebase on gregkh's usb-testing

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

