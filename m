Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 699F62AB68E
	for <lists+linux-usb@lfdr.de>; Mon,  9 Nov 2020 12:20:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727774AbgKILU4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 9 Nov 2020 06:20:56 -0500
Received: from mga06.intel.com ([134.134.136.31]:16796 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726410AbgKILU4 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 9 Nov 2020 06:20:56 -0500
IronPort-SDR: svZNzsH/xL3wDACZp7zWy4C25XyAIaVBqc2WO2DgXbfW0IaOBYNoeo2A3HwEgZ/Q9U2ZYGm8AR
 7Uyfi/MZIVbQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9799"; a="231417107"
X-IronPort-AV: E=Sophos;i="5.77,463,1596524400"; 
   d="scan'208";a="231417107"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2020 03:20:55 -0800
IronPort-SDR: rGO/UphoNn8PqZlVrgK+7gg/uKuVoC2/mjL/znG13wK1E6TgasaoLopcNDtPVI8r1+fdPrjY90
 AT9xO8IpRHGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,463,1596524400"; 
   d="scan'208";a="427958429"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 09 Nov 2020 03:20:52 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 09 Nov 2020 13:20:51 +0200
Date:   Mon, 9 Nov 2020 13:20:51 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Vladimir Yerilov <openmindead@gmail.com>
Cc:     linux-usb@vger.kernel.org, Greg KH <gregkh@linuxfoundation.org>,
        Benjamin Berg <bberg@redhat.com>
Subject: Re: Power supply detection issue caused by ucsi_psy?
Message-ID: <20201109112051.GL4062920@kuha.fi.intel.com>
References: <CAB31r6UbF_Q-APvfmxanvMZOYJZwr0eEPwMQ8EGWw3-VkJtHhQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAB31r6UbF_Q-APvfmxanvMZOYJZwr0eEPwMQ8EGWw3-VkJtHhQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Nov 09, 2020 at 08:48:06PM +1000, Vladimir Yerilov wrote:
> Good day everyone,
> 
> Since linux 5.8 I'm experiencing a problem related to power source
> detection on my laptop. My machine is equipped with 2 typec ports, one
> of them has power delivery and is used for charging, another one has
> only data transfer capability. The issue is, when I unplug the power
> cable, the OS is reporting something like "Battery at 100%, plugged in
> but still discharging" (KDE Plasma notification) - whether another
> port is used or not. I checked with upower, you can see the output for
> kernel 5.4 and 5.10 attached. In brief, on 5.8 onwards I have some
> "line_power_ucsi_source_psy_USBC000o001" device which is considered a
> power supply and that prevents OS to switch to "battery mode" when
> unplugging the cable, instead it thinks there's a power source but not
> powerful enough to charge the battery, upower says this: "on-battery:
>     no", but actually no ac power source is connected.
> I did some research with git bisect up to the merge commit
> `e611c0fe318c6d6827ee2bba660fbc23cf73f7dc` ("Merge tag 'usb-5.8-rc1'
> of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb"), and
> looked through its content. My wild guess based on upower output is
> that a new driver introduced there, /drivers/usb/typec/ucsi/psy.c, is
> responsible for this wrong behavior.
> 
> Could you please look into that based on info I'm providing?
> Thank you!

This sounds a bit like the issue that was reported and fixed here:
https://lore.kernel.org/lkml/20201009144047.505957-1-benjamin@sipsolutions.net/

Can you try the two patches from that series?

+Bejamin, who prepared those patches.

> Device: /org/freedesktop/UPower/devices/line_power_ADP0
>   native-path:          ADP0
>   power supply:         yes
>   updated:              Sun 08 Nov 2020 15:27:39 +10 (97 seconds ago)
>   has history:          no
>   has statistics:       no
>   line-power
>     warning-level:       none
>     online:              yes
>     icon-name:          'ac-adapter-symbolic'
> 
> Device: /org/freedesktop/UPower/devices/battery_BAT0
>   native-path:          BAT0
>   vendor:               SUNWODA
>   model:                R15B01W
>   serial:               ACFA
>   power supply:         yes
>   updated:              Sun 08 Nov 2020 15:27:39 +10 (97 seconds ago)
>   has history:          yes
>   has statistics:       yes
>   battery
>     present:             yes
>     rechargeable:        yes
>     state:               charging
>     warning-level:       none
>     energy:              46.198 Wh
>     energy-empty:        0 Wh
>     energy-full:         46.664 Wh
>     energy-full-design:  60.04 Wh
>     energy-rate:         2.059 W
>     voltage:             8.672 V
>     time to full:        13.6 minutes
>     percentage:          99%
>     capacity:            77.7215%
>     technology:          lithium-ion
>     icon-name:          'battery-full-charging-symbolic'
>   History (charge):
>     1604813259	0.000	unknown
>   History (rate):
>     1604813259	0.000	unknown
> 
> Device: /org/freedesktop/UPower/devices/line_power_ucsi_source_psy_USBC000o001
>   native-path:          ucsi-source-psy-USBC000:001
>   power supply:         yes
>   updated:              Sun 08 Nov 2020 15:27:39 +10 (97 seconds ago)
>   has history:          no
>   has statistics:       no
>   line-power
>     warning-level:       none
>     online:              yes
>     icon-name:          'ac-adapter-symbolic'
> 
> Device: /org/freedesktop/UPower/devices/DisplayDevice
>   power supply:         yes
>   updated:              Sun 08 Nov 2020 15:27:39 +10 (97 seconds ago)
>   has history:          no
>   has statistics:       no
>   battery
>     present:             yes
>     state:               charging
>     warning-level:       none
>     energy:              46.198 Wh
>     energy-full:         46.664 Wh
>     energy-rate:         2.059 W
>     time to full:        13.6 minutes
>     percentage:          99%
>     icon-name:          'battery-full-charging-symbolic'
> 
> Daemon:
>   daemon-version:  0.99.11
>   on-battery:      no
>   lid-is-closed:   no
>   lid-is-present:  yes
>   critical-action: HybridSleep

> Device: /org/freedesktop/UPower/devices/line_power_ADP0
>   native-path:          ADP0
>   power supply:         yes
>   updated:              Sun 08 Nov 2020 15:29:25 +10 (18 seconds ago)
>   has history:          no
>   has statistics:       no
>   line-power
>     warning-level:       none
>     online:              no
>     icon-name:          'ac-adapter-symbolic'
> 
> Device: /org/freedesktop/UPower/devices/battery_BAT0
>   native-path:          BAT0
>   vendor:               SUNWODA
>   model:                R15B01W
>   serial:               ACFA
>   power supply:         yes
>   updated:              Sun 08 Nov 2020 15:29:25 +10 (18 seconds ago)
>   has history:          yes
>   has statistics:       yes
>   battery
>     present:             yes
>     rechargeable:        yes
>     state:               discharging
>     warning-level:       none
>     energy:              46.198 Wh
>     energy-empty:        0 Wh
>     energy-full:         46.664 Wh
>     energy-full-design:  60.04 Wh
>     energy-rate:         1.998 W
>     voltage:             8.44 V
>     time to empty:       23.1 hours
>     percentage:          99%
>     capacity:            77.7215%
>     technology:          lithium-ion
>     icon-name:          'battery-full-symbolic'
>   History (charge):
>     1604813365	99.000	charging
>   History (rate):
>     1604813365	1.998	charging
> 
> Device: /org/freedesktop/UPower/devices/line_power_ucsi_source_psy_USBC000o001
>   native-path:          ucsi-source-psy-USBC000:001
>   power supply:         yes
>   updated:              Sun 08 Nov 2020 15:27:39 +10 (124 seconds ago)
>   has history:          no
>   has statistics:       no
>   line-power
>     warning-level:       none
>     online:              yes
>     icon-name:          'ac-adapter-symbolic'
> 
> Device: /org/freedesktop/UPower/devices/DisplayDevice
>   power supply:         yes
>   updated:              Sun 08 Nov 2020 15:29:25 +10 (18 seconds ago)
>   has history:          no
>   has statistics:       no
>   battery
>     present:             yes
>     state:               discharging
>     warning-level:       none
>     energy:              46.198 Wh
>     energy-full:         46.664 Wh
>     energy-rate:         1.998 W
>     time to empty:       23.1 hours
>     percentage:          99%
>     icon-name:          'battery-full-symbolic'
> 
> Daemon:
>   daemon-version:  0.99.11
>   on-battery:      no
>   lid-is-closed:   no
>   lid-is-present:  yes
>   critical-action: HybridSleep
> 

thanks,

-- 
heikki
