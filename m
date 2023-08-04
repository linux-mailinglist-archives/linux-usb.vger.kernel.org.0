Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C61CE7708A8
	for <lists+linux-usb@lfdr.de>; Fri,  4 Aug 2023 21:09:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229571AbjHDTJT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 4 Aug 2023 15:09:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229552AbjHDTJI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 4 Aug 2023 15:09:08 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id A1420E7
        for <linux-usb@vger.kernel.org>; Fri,  4 Aug 2023 12:09:05 -0700 (PDT)
Received: (qmail 43225 invoked by uid 1000); 4 Aug 2023 15:09:04 -0400
Date:   Fri, 4 Aug 2023 15:09:04 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Khazhy Kumykov <khazhy@google.com>,
        USB mailing list <linux-usb@vger.kernel.org>
Subject: [PATCH 0/3] USB: core: Don't overwrite device descriptor during
 reinitialization
Message-ID: <6eadec91-990a-4fbd-8883-8366c4a4d8e4@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

An outstanding syzbot bug report has been traced to a race between the
routine that reads in the device descriptor for a device being
reinitialized and the routine that writes the descriptors to a sysfs
attribute file.  The problem is that reinitializing a device, like
initializing it for the first time, stores the device descriptor
directly in the usb_device structure, where it may be accessed
concurrently as part of sending the descriptors to the sysfs reader.

This three-part series fixes the problem:

	The first patch unites the code paths responsible for first
	reading the device descriptor in hub.c's old scheme and new
	scheme, so that neither of them will call
	usb_get_device_descriptor().

	The second patch changes usb_get_device_descriptor(), making
	it return the descriptor in a dynamically allocated buffer
	rather than storing it directly in the device structure.

	The third patch changes hub_port_init(), adding a new argument
	that specifies a buffer in which to store the device
	descriptor for devices being reinitialized.

As a result of these changes, the copy of the device descriptor stored
in the usb_device structure will never be overwritten once it has been
initialized.  This eliminates the data race causing the bug identified
by syzbot.

It would be nice at some point to make a similar change to the code
that reads the device's BOS descriptor; reinitialization should not
overwrite its existing data either.  This series doesn't attempt to do
that, but it would be a good thing to do.

Alan Stern
