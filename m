Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4248C49E916
	for <lists+linux-usb@lfdr.de>; Thu, 27 Jan 2022 18:33:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234351AbiA0Rd3 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Thu, 27 Jan 2022 12:33:29 -0500
Received: from usmailhost21.kioxia.com ([12.0.68.226]:16081 "EHLO
        SJSMAIL01.us.kioxia.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S231153AbiA0Rd3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 27 Jan 2022 12:33:29 -0500
Received: from SJSMAIL01.us.kioxia.com (10.90.133.90) by
 SJSMAIL01.us.kioxia.com (10.90.133.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Thu, 27 Jan 2022 09:33:28 -0800
Received: from SJSMAIL01.us.kioxia.com ([fe80::115a:2c13:209c:d3d8]) by
 SJSMAIL01.us.kioxia.com ([fe80::115a:2c13:209c:d3d8%3]) with mapi id
 15.01.2176.014; Thu, 27 Jan 2022 09:33:28 -0800
From:   Rory Bolt <Rory.Bolt@kioxia.com>
To:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: Possible big endian bug in latest stable kernel
Thread-Topic: Possible big endian bug in latest stable kernel
Thread-Index: AdgTo4ovjbMuQLYxS1u3SerkBQFvRA==
Date:   Thu, 27 Jan 2022 17:33:27 +0000
Message-ID: <7d0dcfb5dd844a3d8e4f2458e5a55887@kioxia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.93.77.127]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


Hello Greg,

I used bisect to find the offending commit:

To my surprise, it appears to be only peripherally related to USB; it is in fact the change to drivers/regulators/core.c

I cannot explain how this only affects big endian operation, not little endian. I can only theorize that since the u-boot firmware is in little endian mode, it has already set up the regulators... however when I transition to big endian mode, I essentially re-init everything.

aarch64_be-test /usr/src/linux-5.15.14/drivers/regulator # diff core.c.orig core.c
1531c1531,1532
<               if (rdev->supply_name && !rdev->supply)
---
>               if (rdev->supply_name && !rdev->supply &&
>                   !rdev->constraints->always_on)

I am uncertain if this patch is generally correct or not, hence my reluctance to post. It seems that rdev-supply is ALWAYS null and rdev->constraints->always_on is ALWAYS true for the RockPro64 board. My concern is that this may affect other platforms.

Should I post this to the general kernel mailing list? Is there another more appropriate list?

Your guidance would be appreciated,
-Rory


9b1111fa80df22c8cb6f9f8634693812cb958f4f is the first bad commit commit 9b1111fa80df22c8cb6f9f8634693812cb958f4f
Merge: dc2557308ed cb2381cbecb
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue Jun 8 09:41:16 2021 -0700

    Merge tag 'regulator-fix-v5.13-rc4' of git://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator

    Pull regulator fixes from Mark Brown:
     "A collection of fixes for the regulator API that have come up since
      the merge window, including a big batch of fixes from Axel Lin's usual
      careful and detailed review.

      The one stand out fix here is Dmitry Baryshkov's fix for an issue
      where we fail to power on the parents of always on regulators during
      system startup if they weren't already powered on"

    * tag 'regulator-fix-v5.13-rc4' of git://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator: (21 commits)
      regulator: rt4801: Fix NULL pointer dereference if priv->enable_gpios is NULL
      regulator: hi6421v600: Fix .vsel_mask setting
      regulator: bd718x7: Fix the BUCK7 voltage setting on BD71837
      regulator: atc260x: Fix n_voltages and min_sel for pickable linear ranges
      regulator: rtmv20: Fix to make regcache value first reading back from HW
      regulator: mt6315: Fix function prototype for mt6315_map_mode
      regulator: rtmv20: Add Richtek to Kconfig text
      regulator: rtmv20: Fix .set_current_limit/.get_current_limit callbacks
      regulator: hisilicon: use the correct HiSilicon copyright
      regulator: bd71828: Fix .n_voltages settings
      regulator: bd70528: Fix off-by-one for buck123 .n_voltages setting
      regulator: max77620: Silence deferred probe error
      regulator: max77620: Use device_set_of_node_from_dev()
      regulator: scmi: Fix off-by-one for linear regulators .n_voltages setting
      regulator: core: resolve supply for boot-on/always-on regulators
      regulator: fixed: Ensure enable_counter is correct if reg_domain_disable fails
      regulator: Check ramp_delay_table for regulator_set_ramp_delay_regmap
      regulator: fan53880: Fix missing n_voltages setting
      regulator: da9121: Return REGULATOR_MODE_INVALID for invalid mode
      regulator: fan53555: fix TCS4525 voltage calulation
      ...

 drivers/regulator/Kconfig                |  2 +-
 drivers/regulator/atc260x-regulator.c    | 19 +++++++-------
 drivers/regulator/bd718x7-regulator.c    |  2 +-
 drivers/regulator/core.c                 |  6 +++++
 drivers/regulator/cros-ec-regulator.c    |  3 ++-
 drivers/regulator/da9121-regulator.c     | 10 +++++---
 drivers/regulator/fan53555.c             |  3 +--
 drivers/regulator/fan53880.c             |  3 +++
 drivers/regulator/fixed.c                |  7 ++++-
 drivers/regulator/helpers.c              |  2 +-
 drivers/regulator/hi6421v600-regulator.c |  4 +--
 drivers/regulator/hi655x-regulator.c     |  2 +-
 drivers/regulator/max77620-regulator.c   | 17 +++++++-----
 drivers/regulator/mt6315-regulator.c     |  2 +-
 drivers/regulator/rt4801-regulator.c     |  4 +--
 drivers/regulator/rtmv20-regulator.c     | 44 ++++++++++++++++++++++++++++++--
 drivers/regulator/scmi-regulator.c       |  2 +-
 include/linux/mfd/rohm-bd70528.h         |  4 +--
 include/linux/mfd/rohm-bd71828.h         | 10 ++++----
 19 files changed, 104 insertions(+), 42 deletions(-)

-----Original Message-----
From: Greg KH <gregkh@linuxfoundation.org>
Sent: Friday, January 21, 2022 11:24 PM
To: Rory Bolt <Rory.Bolt@kioxia.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: Possible big endian bug in latest stable kernel

On Fri, Jan 21, 2022 at 07:13:59PM +0000, Rory Bolt wrote:
> Hello,
> 
> I am working on a big endian port to test endian cleanness on our NVMe device drivers and software. I originally performed this port on a RockPro64 with kernel 5.10.88 and the USB subsystem performed flawlessly in both big and little endian modes. Hurray!
> 
> When I upgraded to 5.15.11 (and subsequently 5.15.14 and 5.15.16) I ran into problems that appear to be endian. If I boot the exact same board/firmware/kernel in little endian mode, the USB system works correctly. If I switch to big endian, my USB attached disks are no longer usable (they are detected, read capacity commands work, but read operations time out). Interestingly, if I unplug and replug the USB attached disk, it will begin working correctly with the newer kernels in big endian mode. Looking at the output of lsusb -v, it appears there are two changes between the 5.10 and 5.15 USB stacks:
> 
> 1) Enumeration order is different. I do not believe this is a problem at all.
> 2) Link speed. The 5.10 kernels negotiate 5000M in both little and big endian configurations. The 5.15 kernels negotiate 5000M in little endian mode, but 480M in big endian mode if the device is plugged in at boot time. In big endian mode, if the device has incorrectly negotiated 480M at boot time, if I unplug and replug the drive it will negotiate 5000M and begin working.
> 
> This all leads me to suspect that during initialization, when the USB ports are being scanned, there is a big-endian error in the latest kernels. I will happily test any patches if the cause of this is obvious. I am not versed in USB or I would investigate further myself.
> 
> Below are three lsusb -v outputs:
> 
> 5.10.88 in big endian mode
> 5.15.11 in the big endian "bad state" where the device is connected at 
> 480M
> 5.15.11 in the big endian "good state" achieved by transitioning out of the "bad state" by unplugging and re-plugging the drive.
> 

Can you use 'git bisect' between the good and bad kernel versions to track down the offending commit here?  As you can easily reproduce this, that would be the simplest thing to do.

thanks,

greg k-h
