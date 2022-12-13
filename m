Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE34E64B142
	for <lists+linux-usb@lfdr.de>; Tue, 13 Dec 2022 09:37:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234616AbiLMIhw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 13 Dec 2022 03:37:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234592AbiLMIhu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 13 Dec 2022 03:37:50 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8E6E1835C
        for <linux-usb@vger.kernel.org>; Tue, 13 Dec 2022 00:37:48 -0800 (PST)
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A85364A7;
        Tue, 13 Dec 2022 09:37:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1670920666;
        bh=UMZV6Xe1xWiKCB3hlwFxNrBZSh8/KFtKMpzax9ic2Nw=;
        h=From:To:Cc:Subject:Date:From;
        b=czFrSlZtQaVSf+szlFgzPgBuyxANYitnrU5w8B0Og0Mw56AFJOYAdyyBaKKIUXRA9
         c9qYlLF6NMGNqwGwy4cvQVpKGrlVBJGqOyZCHtWMg6wB9sV4wymqaOshnBc181NjGr
         nZQ88LKAnHgoUUBxUgIWE/jx0anyNfeubn7B8HPY=
From:   Daniel Scally <dan.scally@ideasonboard.com>
To:     linux-usb@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, gregkh@linuxfoundation.org,
        w36195@motorola.com, m.grzeschik@pengutronix.de,
        kieran.bingham@ideasonboard.com, torleiv@huddly.com,
        Daniel Scally <dan.scally@ideasonboard.com>
Subject: [PATCH 0/6] UVC Gadget: Extend color matching support
Date:   Tue, 13 Dec 2022 08:37:30 +0000
Message-Id: <20221213083736.2284536-1-dan.scally@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The current UVC gadget implementation hardcodes a single color matching
descriptor and transmits it a single time following all the format and frame
descriptors. This is inflexible, and additionally applies only to the _last_
format in the array of descriptors.

This series extends the support such that the default descriptor can be amended
and is transmitted once-per-format instead of once-only, it then adds the ability
to create new color matching descriptors and associate them with particular formats.
The default color matching descriptor is retained and used where the user does not
link a new color matching descriptor to the format, so the default interaction
with userspace is unchanged from the current implementation.

Daniel Scally (6):
  usb: gadget: usb: Remove "default" from color matching attributes
  usb: gadget: uvc: Add struct for color matching in configs
  usb: gadget: uvc: Copy color matching descriptor for each frame
  usb: gadget: uvc: Remove the hardcoded default color matching
  usb: gadget: uvc: Make color matching attributes read/write
  usb: gadget: uvc: Allow creating new color matching descriptors

 .../ABI/testing/configfs-usb-gadget-uvc       |   6 +-
 drivers/usb/gadget/function/f_uvc.c           |   9 -
 drivers/usb/gadget/function/u_uvc.h           |   1 -
 drivers/usb/gadget/function/uvc_configfs.c    | 247 +++++++++++++++---
 drivers/usb/gadget/function/uvc_configfs.h    |   9 +
 5 files changed, 228 insertions(+), 44 deletions(-)

-- 
2.34.1

