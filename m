Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 943144C088D
	for <lists+linux-usb@lfdr.de>; Wed, 23 Feb 2022 03:37:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236962AbiBWCdb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 22 Feb 2022 21:33:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237186AbiBWCcl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 22 Feb 2022 21:32:41 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0F575A0BD;
        Tue, 22 Feb 2022 18:30:35 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 016D2B81E26;
        Wed, 23 Feb 2022 02:30:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA185C340F9;
        Wed, 23 Feb 2022 02:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1645583432;
        bh=zu9GGypCn49npQPsC4pSb6zw7vWim0NA15BG2j6ZpXw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=DHLHvbOu9PJ30vc+Tb2fESjJGqt2vydNZffocN2lYsqNb0ej50agL/PWsLcXUxAT7
         t2iyLZmJsRAKYL6M+SiweFSZOenio+VPk8KFwvM5hNj0b3Fy2sRR0FhYEV2mZN7PDd
         bBx8OVuX20CLajWBeE3/kV39f1jJviuCcNs9ghntZdjU8/wyQBAaCuwj/hSofHxGWE
         6+qKp1+CvGjTCPRNIi3jPMuZ3i4j8fqR7syDwMvV6ZkM7jsYLecsmQcNMKk9sghAFs
         QZDy0otXv6jN3FGsNLx0KDvi2Cqh4w6Wv8Do7Sax8SoAPwXmME9T+97VnabOda9KWe
         yoEgI+9harlxg==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Daniele Palmas <dnlplm@gmail.com>,
        "David S . Miller" <davem@davemloft.net>,
        Sasha Levin <sashal@kernel.org>, oliver@neukum.org,
        kuba@kernel.org, linux-usb@vger.kernel.org, netdev@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 27/28] net: usb: cdc_mbim: avoid altsetting toggling for Telit FN990
Date:   Tue, 22 Feb 2022 21:29:28 -0500
Message-Id: <20220223022929.241127-27-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220223022929.241127-1-sashal@kernel.org>
References: <20220223022929.241127-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Daniele Palmas <dnlplm@gmail.com>

[ Upstream commit 21e8a96377e6b6debae42164605bf9dcbe5720c5 ]

Add quirk CDC_MBIM_FLAG_AVOID_ALTSETTING_TOGGLE for Telit FN990
0x1071 composition in order to avoid bind error.

Signed-off-by: Daniele Palmas <dnlplm@gmail.com>
Signed-off-by: David S. Miller <davem@davemloft.net>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/usb/cdc_mbim.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/usb/cdc_mbim.c b/drivers/net/usb/cdc_mbim.c
index 82bb5ed94c485..c0b8b4aa78f37 100644
--- a/drivers/net/usb/cdc_mbim.c
+++ b/drivers/net/usb/cdc_mbim.c
@@ -659,6 +659,11 @@ static const struct usb_device_id mbim_devs[] = {
 	  .driver_info = (unsigned long)&cdc_mbim_info_avoid_altsetting_toggle,
 	},
 
+	/* Telit FN990 */
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x1bc7, 0x1071, USB_CLASS_COMM, USB_CDC_SUBCLASS_MBIM, USB_CDC_PROTO_NONE),
+	  .driver_info = (unsigned long)&cdc_mbim_info_avoid_altsetting_toggle,
+	},
+
 	/* default entry */
 	{ USB_INTERFACE_INFO(USB_CLASS_COMM, USB_CDC_SUBCLASS_MBIM, USB_CDC_PROTO_NONE),
 	  .driver_info = (unsigned long)&cdc_mbim_info_zlp,
-- 
2.34.1

