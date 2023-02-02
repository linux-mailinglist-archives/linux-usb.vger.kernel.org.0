Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A4A4687C76
	for <lists+linux-usb@lfdr.de>; Thu,  2 Feb 2023 12:42:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231932AbjBBLmF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Feb 2023 06:42:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232125AbjBBLmD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Feb 2023 06:42:03 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7E438C1E3
        for <linux-usb@vger.kernel.org>; Thu,  2 Feb 2023 03:42:01 -0800 (PST)
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8131B505;
        Thu,  2 Feb 2023 12:41:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1675338119;
        bh=InuBIk8SoNN6vrUEjhsdJ1I1fHCG+gHXUeeqL1r47zM=;
        h=From:To:Cc:Subject:Date:From;
        b=cImi2pD+EJAsxWY/AybfTFOpfP7bbi5uWwdoAfDq7dbKVashZ8UEdITH/sI4Mnx3b
         1Sf5BECCeuzTqKie6IDdLyImAhcNAS8iJeY2d8oziu9NXig1cHqDyyVbGTOSGzOhDN
         Nml5S9r4Oak6Lz060o5iwKcqFkWckQfjxi8IfR08=
From:   Daniel Scally <dan.scally@ideasonboard.com>
To:     linux-usb@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, gregkh@linuxfoundation.org,
        w36195@motorola.com, m.grzeschik@pengutronix.de,
        kieran.bingham@ideasonboard.com, torleiv@huddly.com,
        Daniel Scally <dan.scally@ideasonboard.com>
Subject: [RESEND v3 0/6] UVC Gadget: Extend color matching support
Date:   Thu,  2 Feb 2023 11:41:36 +0000
Message-Id: <20230202114142.300858-1-dan.scally@ideasonboard.com>
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

The series is now rebased onto usb-testing rather than usb-linus

Daniel Scally (6):
  usb: uvc: Enumerate valid values for color matching
  usb: gadget: uvc: Add struct for color matching in configs
  usb: gadget: uvc: Copy color matching descriptor for each frame
  usb: gadget: uvc: Remove the hardcoded default color matching
  usb: gadget: uvc: Make color matching attributes read/write
  usb: gadget: uvc: Allow creating new color matching descriptors

 .../ABI/testing/configfs-usb-gadget-uvc       |  19 +-
 drivers/usb/gadget/function/f_uvc.c           |   9 -
 drivers/usb/gadget/function/u_uvc.h           |   1 -
 drivers/usb/gadget/function/uvc_configfs.c    | 261 ++++++++++++++++--
 drivers/usb/gadget/function/uvc_configfs.h    |  22 +-
 include/uapi/linux/usb/video.h                |  30 ++
 6 files changed, 305 insertions(+), 37 deletions(-)

-- 
2.34.1

