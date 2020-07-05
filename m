Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32CA0215007
	for <lists+linux-usb@lfdr.de>; Mon,  6 Jul 2020 00:11:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728015AbgGEWLa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 5 Jul 2020 18:11:30 -0400
Received: from l2mail1.panix.com ([166.84.1.75]:62190 "EHLO l2mail1.panix.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727842AbgGEWLa (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 5 Jul 2020 18:11:30 -0400
X-Greylist: delayed 1162 seconds by postgrey-1.27 at vger.kernel.org; Sun, 05 Jul 2020 18:11:30 EDT
Received: from mailbackend.panix.com (mailbackend.panix.com [166.84.1.89])
        by l2mail1.panix.com (Postfix) with ESMTPS id 4B0MqX060rzDQ4
        for <linux-usb@vger.kernel.org>; Sun,  5 Jul 2020 17:52:07 -0400 (EDT)
Received: from xps-7390 (cpe-23-242-39-94.socal.res.rr.com [23.242.39.94])
        by mailbackend.panix.com (Postfix) with ESMTPSA id 4B0MqV4Bb6z1sFc;
        Sun,  5 Jul 2020 17:52:06 -0400 (EDT)
Date:   Sun, 5 Jul 2020 14:52:04 -0700 (PDT)
From:   "Kenneth R. Crudup" <kenny@panix.com>
Reply-To: "Kenneth R. Crudup" <kenny@panix.com>
To:     mika.westerberg@linux.intel.com
cc:     linux-usb@vger.kernel.org, "Kenneth R. Crudup" <kenny@panix.com>
Subject: I get a new Thunderbolt domain UUID on every boot
Message-ID: <alpine.DEB.2.23.453.2007051446170.4280@xps-7390>
User-Agent: Alpine 2.23 (DEB 453 2020-06-18)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


Does anyone know why my machine (Dell XPS 7390 2-in-1, i7-1065G7 CPU) gets a
new Thunderbolt domain UUID on every boot?

----
$ sudo boltctl domains | wc -l
3320
$ sudo boltctl domains | tail -20
 o domain 815fe31a-99fd-8680-ffff-ffffffffffff
   |- bootacl:  0/0
   `- security: unknown

 o domain 703bafdf-6a33-8680-ffff-ffffffffffff
   |- bootacl:  0/0
   `- security: unknown

 o domain 91c55303-9244-8680-ffff-ffffffffffff
   |- bootacl:  0/0
   `- security: unknown

 * domain0 800e6342-557e-8680-ffff-ffffffffffff
   |- bootacl:  0/0
   `- security: iommu

 * domain1 9128366f-c373-8680-ffff-ffffffffffff
   |- bootacl:  0/0
   `- security: iommu
$
----
$ egrep '(THUNDER|USB4)' .config
# CONFIG_MDIO_THUNDER is not set
CONFIG_USB4_NET=m
# CONFIG_USB_HSIC_USB4604 is not set
CONFIG_INTEL_WMI_THUNDERBOLT=y
CONFIG_USB4=y
$
----
I did see this, too:
$  dmesg | fgrep -i thunderbolt
[    1.114106] thunderbolt 0000:00:0d.2: 0: uid crc8 mismatch (expected: 0x8e, got: 0xe7)
[    1.657866] thunderbolt 0000:00:0d.3: 0: uid crc8 mismatch (expected: 0x8e, got: 0xe7)
----

Thanks,

	-Kenny

-- 
Kenneth R. Crudup  Sr. SW Engineer, Scott County Consulting, Orange County CA
