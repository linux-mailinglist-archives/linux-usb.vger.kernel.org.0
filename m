Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 407D475E14
	for <lists+linux-usb@lfdr.de>; Fri, 26 Jul 2019 07:05:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725899AbfGZFFw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 26 Jul 2019 01:05:52 -0400
Received: from gate.crashing.org ([63.228.1.57]:51636 "EHLO gate.crashing.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725836AbfGZFFw (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 26 Jul 2019 01:05:52 -0400
Received: from ufdda393ec48b57.ant.amazon.com (localhost.localdomain [127.0.0.1])
        by gate.crashing.org (8.14.1/8.14.1) with ESMTP id x6Q55j3O017580;
        Fri, 26 Jul 2019 00:05:45 -0500
From:   Benjamin Herrenschmidt <benh@kernel.crashing.org>
To:     Linux USB List <linux-usb@vger.kernel.org>
Cc:     Felipe Balbi <felipe.balbi@linux.intel.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Greg KH <gregkh@linuxfoundation.org>
Subject: [PATCH 00/10] usb: gadget: aspeed: Bug fixes
Date:   Fri, 26 Jul 2019 15:05:29 +1000
Message-Id: <20190726050539.7875-1-benh@kernel.crashing.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

So I finally got back an Aspeed eval board, and thus resumed maintaining
and handling bug reports for this driver.

This is a series that fixes a number of enumeration related issues with
a variety of hosts, OSes, and circumstances (ie, plugging/unplugging at
funny times, etc...).

I also added dummy support for the TT requests, it doesn't hurt as some
host seem to send them even when TT support isn't advertized.

Most of this is bug fixes and probably shouldn't wait for another
merge window, except possibly the last 3 patches.

v2: - Fix a space vs. tab issue in patch 2 reported by Sergei Shtylyov
    - Put the TT patches at the end of the list as they aren't
     as clear cut "bug fixes".

v3: - Fix extra {} reported by Sergei
    - Re-order patches to put non-strictly fixes at the end so you
      can easily drop them for 5.3 if you wish to do so and defer
      them to 5.4
    - Take out the non-aspeed fixes, I resent them separately


