Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 520F260E53
	for <lists+linux-usb@lfdr.de>; Sat,  6 Jul 2019 02:53:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725945AbfGFAxy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 5 Jul 2019 20:53:54 -0400
Received: from gate.crashing.org ([63.228.1.57]:42772 "EHLO gate.crashing.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725776AbfGFAxy (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 5 Jul 2019 20:53:54 -0400
Received: from ufdda393ec48b57.ant.amazon.com (localhost.localdomain [127.0.0.1])
        by gate.crashing.org (8.14.1/8.14.1) with ESMTP id x660rlMH017940;
        Fri, 5 Jul 2019 19:53:48 -0500
From:   Benjamin Herrenschmidt <benh@kernel.crashing.org>
To:     linux-usb@vger.kernel.org
Cc:     balbi@kernel.org, Joel Stanley <joel@jms.id.au>,
        Alan Stern <stern@rowland.harvard.edu>
Subject: [PATCH 00/10] usb: gadget: aspeed: Bug fixes
Date:   Sat,  6 Jul 2019 10:53:35 +1000
Message-Id: <20190706005345.18131-1-benh@kernel.crashing.org>
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


