Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 949395FD0BD
	for <lists+linux-usb@lfdr.de>; Thu, 13 Oct 2022 02:30:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231215AbiJMA37 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 12 Oct 2022 20:29:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231680AbiJMA3C (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 12 Oct 2022 20:29:02 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 394FFA285C;
        Wed, 12 Oct 2022 17:25:49 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E6CB7616F5;
        Thu, 13 Oct 2022 00:25:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C55FC433D6;
        Thu, 13 Oct 2022 00:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1665620748;
        bh=HvREvjpTGd2nnADgQQw/gRZ+w1eD5zoouABPrVUj1hQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=qW8rVH5/bPJzaEZ/l//53EB3trD4eTOtmZrcIeDqrjDvMBnDFkdnqmZ0F4BlooTk0
         gd9D0eDyxwB83i2hIPf2O4Wxdg8InkoftbIFuRV2fT1bHm4C7s1ltCm1ARak35f4mn
         ZX32zddsTURH3ZPny7FWpcz3w+GxMpH34PWtnL/518BrTz4iQaiTgzvEifkaKwQqqR
         BBBN/OlqMZFDzJC9WhfPREXXf0ojqSkYcowCVPGco08B4livrAj6wsl71Pt/znvVYj
         ep+osO7j6O7qM+e1ztWVY3hVyxW8oAsCmUhCEgbMYGz0FuS7Xf6JjZt/KEFP656ozy
         //6yW0qs3DLWQ==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Robin Guo <guoweibin@inspur.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sasha Levin <sashal@kernel.org>, b-liu@ti.com,
        linux-usb@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 17/27] usb: musb: Fix musb_gadget.c rxstate overflow bug
Date:   Wed, 12 Oct 2022 20:24:49 -0400
Message-Id: <20221013002501.1895204-17-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221013002501.1895204-1-sashal@kernel.org>
References: <20221013002501.1895204-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Robin Guo <guoweibin@inspur.com>

[ Upstream commit eea4c860c3b366369eff0489d94ee4f0571d467d ]

The usb function device call musb_gadget_queue() adds the passed
request to musb_ep::req_list,If the (request->length > musb_ep->packet_sz)
and (is_buffer_mapped(req) return false),the rxstate() will copy all data
in fifo to request->buf which may cause request->buf out of bounds.

Fix it by add the length check :
fifocnt = min_t(unsigned, request->length - request->actual, fifocnt);

Signed-off-by: Robin Guo <guoweibin@inspur.com>
Link: https://lore.kernel.org/r/20220906102119.1b071d07a8391ff115e6d1ef@inspur.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/usb/musb/musb_gadget.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/musb/musb_gadget.c b/drivers/usb/musb/musb_gadget.c
index 4622400ba4dd..8e83995fc3bd 100644
--- a/drivers/usb/musb/musb_gadget.c
+++ b/drivers/usb/musb/musb_gadget.c
@@ -760,6 +760,9 @@ static void rxstate(struct musb *musb, struct musb_request *req)
 			musb_writew(epio, MUSB_RXCSR, csr);
 
 buffer_aint_mapped:
+			fifo_count = min_t(unsigned int,
+					request->length - request->actual,
+					(unsigned int)fifo_count);
 			musb_read_fifo(musb_ep->hw_ep, fifo_count, (u8 *)
 					(request->buf + request->actual));
 			request->actual += fifo_count;
-- 
2.35.1

