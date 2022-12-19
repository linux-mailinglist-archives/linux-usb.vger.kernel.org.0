Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 31840650DA3
	for <lists+linux-usb@lfdr.de>; Mon, 19 Dec 2022 15:43:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232335AbiLSOnt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 19 Dec 2022 09:43:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232386AbiLSOnh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 19 Dec 2022 09:43:37 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9C2F6359
        for <linux-usb@vger.kernel.org>; Mon, 19 Dec 2022 06:43:34 -0800 (PST)
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4ED80825;
        Mon, 19 Dec 2022 15:43:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1671461012;
        bh=koA4VvTMJysz699KbGIIUaz+HFy4kYE9ARGd1kYr5eo=;
        h=From:To:Cc:Subject:Date:From;
        b=n3psS6vCEAsE9sL/FFwpFinVUQ5ykGtYpKcViLRkfJwCbFHJcXgQXjxhaOdDvGTv3
         9M5UdaTp2WWB71rWrHeKRu4h5NIXCOnyHGpw928CnZ92dhhyMZs57EzxjDgUu9LNYX
         86kJ6cYwHea2rOmfyxkfkh3Dc59ZscFfqv7x8zB4=
From:   Daniel Scally <dan.scally@ideasonboard.com>
To:     linux-usb@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, gregkh@linuxfoundation.org,
        w36195@motorola.com, m.grzeschik@pengutronix.de,
        kieran.bingham@ideasonboard.com, torleiv@huddly.com,
        Daniel Scally <dan.scally@ideasonboard.com>
Subject: [PATCH v2 0/7] UVC Gadget: Extend color matching support
Date:   Mon, 19 Dec 2022 14:43:09 +0000
Message-Id: <20221219144316.757680-1-dan.scally@ideasonboard.com>
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
descriptor and includes it in the payload of USB descriptors a single time
following all the format and frame descriptors. This is inflexible, and
additionally applies only to the _last_ format in the array of descriptors.

This series extends the support such that the default descriptor can be amended
and is included once-per-format instead of once-only, it then adds the ability
to create new color matching descriptors and associate them with particular formats.
The default color matching descriptor is retained and used where the user does not
link a new color matching descriptor to the format, so the default interaction
with userspace is unchanged from the current implementation.

Daniel Scally (7):
  usb: gadget: usb: Remove "default" from color matching attributes
  usb: uvc: Enumerate valid values for color matching
  usb: gadget: uvc: Add struct for color matching in configs
  usb: gadget: uvc: Copy color matching descriptor for each frame
  usb: gadget: uvc: Remove the hardcoded default color matching
  usb: gadget: uvc: Make color matching attributes read/write
  usb: gadget: uvc: Allow creating new color matching descriptors

 .../ABI/testing/configfs-usb-gadget-uvc       |  19 +-
 drivers/usb/gadget/function/f_uvc.c           |   9 -
 drivers/usb/gadget/function/u_uvc.h           |   1 -
 drivers/usb/gadget/function/uvc_configfs.c    | 278 ++++++++++++++++--
 drivers/usb/gadget/function/uvc_configfs.h    |  22 +-
 include/uapi/linux/usb/video.h                |  30 ++
 6 files changed, 311 insertions(+), 48 deletions(-)

-- 
2.34.1

