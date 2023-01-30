Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A3D2B680B4D
	for <lists+linux-usb@lfdr.de>; Mon, 30 Jan 2023 11:51:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235305AbjA3KvD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 30 Jan 2023 05:51:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229769AbjA3Ku6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 30 Jan 2023 05:50:58 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F16662B0B5
        for <linux-usb@vger.kernel.org>; Mon, 30 Jan 2023 02:50:56 -0800 (PST)
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 109678B8;
        Mon, 30 Jan 2023 11:50:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1675075854;
        bh=WTsAeFxQQ9MdgmIjl8zjNAulO7eKfqzSnpjcwRljN/c=;
        h=From:To:Cc:Subject:Date:From;
        b=mFBLpLN2xznkvKVhPufkty0hnfhEoWdrs3uX3HOzXmzRScNpjoi2Rqzqj5xj7CaFJ
         1xFkizBhWyl/0p0lBgq2OcNTg8NaqmS932A/ie+GIWFvx9MW1LosOBAXjI7h869Ez4
         dsDAupqIS4pbBxe4N+J0/Irx4zstC5lzS9zh5q3k=
From:   Daniel Scally <dan.scally@ideasonboard.com>
To:     linux-usb@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, gregkh@linuxfoundation.org,
        mgr@pengutronix.de, kieran.bingham@ideasonboard.com,
        torleiv@huddly.com, Daniel Scally <dan.scally@ideasonboard.com>
Subject: [PATCH v2 0/3] Add ability to disable UVC Gadget's interrupt endpoint
Date:   Mon, 30 Jan 2023 10:50:42 +0000
Message-Id: <20230130105045.120886-1-dan.scally@ideasonboard.com>
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

The UVC Gadget includes a hardcoded interrupt endpoint against the VideoControl
interface, though it is misnamed as a control endpoint (the default endpoint 0
is actually used for that role). The UVC specification says that this is an
optional feature of a UVC compliant camera provided certain scenarios don't hold
true, specifically...

1. The device supports hardware triggers for still image capture
2. The device implements any AutoUpdate controls
3. The device implements any Asynchronous controls

Those are all scenarios that will be determined by userspace, meaning that in some
implementations the interrupt endpoint is unnecessary. There is an additional
problem in that the current implementation of the uvc function driver contains
no mechanism through which data can be sent over this endpoint, making it unuseable
in any case. This series disables the endpoint by default but adds a configfs
attribute allowing users to re-enable it if desired.

Daniel Scally (3):
  usb: gadget: uvc: Rename uvc_control_ep
  usb: gadget: uvc: Add new enable_interrupt_ep attribute
  usb: gadget: uvc: Disable interrupt endpoint by default

 .../ABI/testing/configfs-usb-gadget-uvc       |  4 +-
 drivers/usb/gadget/function/f_uvc.c           | 76 +++++++++++--------
 drivers/usb/gadget/function/u_uvc.h           |  2 +
 drivers/usb/gadget/function/uvc.h             |  3 +-
 drivers/usb/gadget/function/uvc_configfs.c    | 53 +++++++++++++
 5 files changed, 104 insertions(+), 34 deletions(-)

-- 
2.34.1

