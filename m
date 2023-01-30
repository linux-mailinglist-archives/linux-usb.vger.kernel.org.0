Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D728681323
	for <lists+linux-usb@lfdr.de>; Mon, 30 Jan 2023 15:28:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236658AbjA3O2i (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 30 Jan 2023 09:28:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236379AbjA3O2V (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 30 Jan 2023 09:28:21 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FACF43912
        for <linux-usb@vger.kernel.org>; Mon, 30 Jan 2023 06:26:56 -0800 (PST)
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6CDFE8B8;
        Mon, 30 Jan 2023 15:26:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1675088813;
        bh=bX5XpEx1smBlBqdcviV1kE8PG3WObestHTbrbllCSBg=;
        h=From:To:Cc:Subject:Date:From;
        b=UYw7XkdRyH0JjnLE/Gr1mKJZf+TbaZpxyufg5mC17wsMn5+SQ60Z0l7oxx6pxcM+v
         YkMtNsi0nT6msC3H99P9IHoKl9EdwqxpPORZuMoyf5jsf5xRrC0We7k8DVvsiPWr3c
         X6UVaqE3jcKg7LFkaP+L+dtW49P04CooyRcAtnco=
From:   Daniel Scally <dan.scally@ideasonboard.com>
To:     linux-usb@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, gregkh@linuxfoundation.org,
        w36195@motorola.com, m.grzeschik@pengutronix.de,
        kieran.bingham@ideasonboard.com, torleiv@huddly.com,
        Daniel Scally <dan.scally@ideasonboard.com>
Subject: [PATCH v3 0/7] UVC Gadget: Extend color matching support
Date:   Mon, 30 Jan 2023 14:26:32 +0000
Message-Id: <20230130142639.217885-1-dan.scally@ideasonboard.com>
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
 drivers/usb/gadget/function/uvc_configfs.c    | 282 ++++++++++++++++--
 drivers/usb/gadget/function/uvc_configfs.h    |  22 +-
 include/uapi/linux/usb/video.h                |  30 ++
 6 files changed, 315 insertions(+), 48 deletions(-)

-- 
2.34.1

