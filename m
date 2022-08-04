Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D8D88589F0B
	for <lists+linux-usb@lfdr.de>; Thu,  4 Aug 2022 18:03:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231665AbiHDQDN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 4 Aug 2022 12:03:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229988AbiHDQDM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 4 Aug 2022 12:03:12 -0400
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0D1A5A3E3
        for <linux-usb@vger.kernel.org>; Thu,  4 Aug 2022 09:03:10 -0700 (PDT)
Received: (Authenticated sender: hadess@hadess.net)
        by mail.gandi.net (Postfix) with ESMTPSA id 8F418200009;
        Thu,  4 Aug 2022 16:03:07 +0000 (UTC)
From:   Bastien Nocera <hadess@hadess.net>
To:     linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Peter Hutterer <peter.hutterer@who-t.net>,
        Bastien Nocera <hadess@hadess.net>
Subject: [RFC v2] USB: core: add a way to revoke access to open USB devices
Date:   Thu,  4 Aug 2022 18:03:04 +0200
Message-Id: <20220804160306.134014-1-hadess@hadess.net>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hey,

This is a follow-up to "[RFC v1] USB: core: add USBDEVFS_REVOKE ioctl" from April.

The end-goal is being able to cut-off access to USB devices for
applications/programs that open raw USB devices using, in most cases,
libusb.

I've implemented this using BPF, so we don't need to add new ioctls.
The presence or absence of that feature can be evaluated at runtime,
and can be used to implement revoke support on session switching,
in logind for example:
https://github.com/hadess/usb-revoke-userspace/

I have some notes and questions on the API as it is exposed.

- I didn't see a point in having multiple kernel functions as entry
  points as I was going to use a single BPF program as an entry point,
  which can check the arguments. Can I rely on the BPF program checking
  those arguments, or should I re-check them again in the kernel
  implementation?

- Are my UID checks correct if I expect revoking to be called outside
  namespaces, on the effective UID of the user. Is there a way to assert
  that?

- Is there a good "errno" error for ENOSUCHUSER for using in the
  usb_revoke() loop if we couldn't find any USB device matching the
  requested user?

Cheers

Bastien Nocera (2):
  USB: core: add a way to revoke access to open USB devices
  usb: Implement usb_revoke() BPF function

 drivers/usb/core/devio.c | 105 ++++++++++++++++++++++++++++++++++++---
 drivers/usb/core/usb.c   |  51 +++++++++++++++++++
 drivers/usb/core/usb.h   |   8 +++
 3 files changed, 158 insertions(+), 6 deletions(-)

-- 
2.36.1

