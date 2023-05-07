Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4817D6F95DB
	for <lists+linux-usb@lfdr.de>; Sun,  7 May 2023 02:38:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231472AbjEGAie (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 6 May 2023 20:38:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232248AbjEGAiM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 6 May 2023 20:38:12 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A998B30148;
        Sat,  6 May 2023 17:36:35 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1CA4861554;
        Sun,  7 May 2023 00:36:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7367C4339C;
        Sun,  7 May 2023 00:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1683419761;
        bh=tPTK8H6KULh7td848zI8KiUvWRrfkCyQuOLGGwh6RcM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Zv+3mw4OyoaogE28jSuoCwx9XF4dEYO0tF8A94C92Ter/y0fu9dqhKJw0iZI/DSzO
         iZreE2LNMQMgk1WXvsRgrK8OPLsS+KbWGe5wwCakQ0L/mRbsOGFRKAKHL89hEkesPM
         8dmNlDvwqNJieC8E7TS7tQLXu6irqluGOY8L6qD18RxTWNYPaiqaa5SvsYfuQXi3qK
         AruK6jLUP6AbmljWaYjJ1NGFZbVPMwFLQXh2s7zU5f7trHleEde13lumGIHgnYZakg
         npXPOMuyrcaUVP4C6TKKB9Em4MVrlRn1HCACdFp2J3/PaSUhuDdL5Z23RO1N2fhRo+
         p4z+UOucrHMNA==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Frank Wang <frank.wang@rock-chips.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sasha Levin <sashal@kernel.org>, linux@roeck-us.net,
        linux-usb@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 7/9] usb: typec: tcpm: fix multiple times discover svids error
Date:   Sat,  6 May 2023 20:35:43 -0400
Message-Id: <20230507003545.4078941-7-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230507003545.4078941-1-sashal@kernel.org>
References: <20230507003545.4078941-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Frank Wang <frank.wang@rock-chips.com>

[ Upstream commit dac3b192107b978198e89ec0f77375738352e0c8 ]

PD3.0 Spec 6.4.4.3.2 say that only Responder supports 12 or more SVIDs,
the Discover SVIDs Command Shall be executed multiple times until a
Discover SVIDs VDO is returned ending either with a SVID value of
0x0000 in the last part of the last VDO or with a VDO containing two
SVIDs with values of 0x0000.

In the current implementation, if the last VDO does not find that the
Discover SVIDs Command would be executed multiple times even if the
Responder SVIDs are less than 12, and we found some odd dockers just
meet this case. So fix it.

Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Frank Wang <frank.wang@rock-chips.com>
Link: https://lore.kernel.org/r/20230316081149.24519-1-frank.wang@rock-chips.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/usb/typec/tcpm/tcpm.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 8333c80b5f7c1..cf0e6a80815ae 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -1126,7 +1126,21 @@ static bool svdm_consume_svids(struct tcpm_port *port, const u32 *p, int cnt)
 		pmdata->svids[pmdata->nsvids++] = svid;
 		tcpm_log(port, "SVID %d: 0x%x", pmdata->nsvids, svid);
 	}
-	return true;
+
+	/*
+	 * PD3.0 Spec 6.4.4.3.2: The SVIDs are returned 2 per VDO (see Table
+	 * 6-43), and can be returned maximum 6 VDOs per response (see Figure
+	 * 6-19). If the Respondersupports 12 or more SVID then the Discover
+	 * SVIDs Command Shall be executed multiple times until a Discover
+	 * SVIDs VDO is returned ending either with a SVID value of 0x0000 in
+	 * the last part of the last VDO or with a VDO containing two SVIDs
+	 * with values of 0x0000.
+	 *
+	 * However, some odd dockers support SVIDs less than 12 but without
+	 * 0x0000 in the last VDO, so we need to break the Discover SVIDs
+	 * request and return false here.
+	 */
+	return cnt == 7;
 abort:
 	tcpm_log(port, "SVID_DISCOVERY_MAX(%d) too low!", SVID_DISCOVERY_MAX);
 	return false;
-- 
2.39.2

