Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 16BCF5CE72
	for <lists+linux-usb@lfdr.de>; Tue,  2 Jul 2019 13:33:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726686AbfGBLdQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 2 Jul 2019 07:33:16 -0400
Received: from gate.crashing.org ([63.228.1.57]:44463 "EHLO gate.crashing.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725835AbfGBLdQ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 2 Jul 2019 07:33:16 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
        by gate.crashing.org (8.14.1/8.14.1) with ESMTP id x62BXBH0009969;
        Tue, 2 Jul 2019 06:33:12 -0500
Message-ID: <44bb150fb8b283a3036a382fa7e821b045554c15.camel@kernel.crashing.org>
Subject: Aspeed vhub configuration
From:   Benjamin Herrenschmidt <benh@kernel.crashing.org>
To:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Cc:     "balbi@kernel.org" <balbi@kernel.org>
Date:   Tue, 02 Jul 2019 21:33:11 +1000
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi folks !

The Aspeed USB gadget "vhub" implements a hub emulation with a number
of UDCs representing the hub slots. It's working ok now and has been
upstream for a bit, however, one thing that's been annoying to some
users is that I've just hard coded the hub's device descriptor. IE, the
vendor/product ID, strings etc...

Various BMC SW stack vendors want to customize that, also possibly the
number of ports etc...

I originally thought about configfs but after more thoughts I don't
think it's really a good fit. The vhub is a fixed thing. When you have
the HW, you have that hub, it's not like you can create different
things, and populate differently.

That leaves me with two approaches, that aren't mutually exclusive, but
I'd like to run them past the folks here before I start coding:

 - The defaults, currently hard coded, could be replaced with Kconfig
options.

 - The device-tree node could contain optional override of those
defaults, allowing a vendor to customize the hub for a given board.
It's not per-se a HW description, but the device-tree is also fairly
commonly used for HW configuration, even if some people disagree with
me on that one (hint: they are wrong :-)

 - I could add sysfs properties underneath the vhub device instance to
customize it. This would also allow userspace to control whether the
hub is "connected" to the host or not, which could be useful, some
systems don't want it to always be there. Today there's no choice.

Any other option ? If somebody says netlink I will scream :)

Cheers,
Ben.


