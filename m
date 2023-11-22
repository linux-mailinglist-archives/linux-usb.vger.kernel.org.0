Return-Path: <linux-usb+bounces-3207-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC6F7F4FBB
	for <lists+linux-usb@lfdr.de>; Wed, 22 Nov 2023 19:39:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3E6961C20B34
	for <lists+linux-usb@lfdr.de>; Wed, 22 Nov 2023 18:39:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 947575CD06;
	Wed, 22 Nov 2023 18:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bV6hj1in"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC24B10D3;
	Wed, 22 Nov 2023 10:38:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700678336; x=1732214336;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wIyOP0aG9TPi3lc0G7IvCLuDzn6Yv0SkV0fEgpSBYKo=;
  b=bV6hj1in5Zb0bFOANItNzeFrYzNN+GnRFFnPvw70icAxK93CKBMHoQJt
   rhA+vss888F8cU1eiFODPDCFsfvMiWDxJThO/syRt9VAEDnvpxWekRiQQ
   MWFVvB4wRFGxZ/fxJCcen0+oxfG8gBc8LX59MwgKbrwTKX4tLEpuxyNYT
   sfPc/QpSdvFFxc6TW/1U3IqC05LKWz5WvWPPv8F1mMIpCcqS3RzqOB1EQ
   2A+NuU0QbxekDopafFdXYzz2xu6kofJQWBla2jRjXmMmpd7UZDcLjw4Tf
   Qzr5cqdIjfJyYLRhV9pZwt+J6Ykhy+8MWOZ447bMyc66dgeJ4QkOiJ1+x
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="377150106"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; 
   d="scan'208";a="377150106"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP; 22 Nov 2023 10:38:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="801829392"
X-IronPort-AV: E=Sophos;i="6.04,218,1695711600"; 
   d="scan'208";a="801829392"
Received: from unknown (HELO kuha.fi.intel.com) ([10.237.72.185])
  by orsmga001.jf.intel.com with SMTP; 22 Nov 2023 00:59:47 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Wed, 22 Nov 2023 10:56:46 +0200
Date: Wed, 22 Nov 2023 10:56:46 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: linux-usb@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
	Hans de Goede <hdegoede@redhat.com>
Subject: Re: Unplugging USB-C charger cable causes `ucsi_acpi USBC000:00:
 ucsi_handle_connector_change: ACK failed (-110)`
Message-ID: <ZV3CTg03IPnZTVL0@kuha.fi.intel.com>
References: <b2466bc2-b62c-4328-94a4-b60af4135ba7@molgen.mpg.de>
 <ZVy5+AxnOZNmUZ15@kuha.fi.intel.com>
 <2bfe2311-27a6-46b5-8662-ba3cbb409f81@molgen.mpg.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2bfe2311-27a6-46b5-8662-ba3cbb409f81@molgen.mpg.de>

On Tue, Nov 21, 2023 at 03:25:59PM +0100, Paul Menzel wrote:
> Dear Heikki,
> 
> 
> Thank you for your prompt reply.
> 
> Am 21.11.23 um 15:08 schrieb Heikki Krogerus:
> > On Tue, Nov 21, 2023 at 12:50:43PM +0100, Paul Menzel wrote:
> 
> > > On the Dell XPS 13, BIOS 2.21.0 06/02/2022, with Debian sid/unstable and
> > > Linux 6.5.10, when unplugging the (Dell) USB Type-C charger cable, Linux
> > > logs the error below:
> > > 
> > >      ucsi_acpi USBC000:00: ucsi_handle_connector_change: ACK failed (-110)
> > > 
> > > As this is logged with level error, can this be somehow fixed?
> > > 
> > >      drivers/usb/typec/ucsi/ucsi.c: dev_err(ucsi->dev, "%s: ACK failed (%d)", __func__, ret);
> > > 
> > > Please find the output of `dmesg` attached.
> > 
> > Thanks. The firmware not reacting to the ACK command is weird, but I'm
> > not sure if it's critical. Does the interface continue working after
> > that? Do you see the partner devices appearing under /sys/class/typec/
> > when you plug them, and disappearing when you unplug them?
> 
> ```
> $ LANG= grep .
> /sys/class/typec/port0/device/power_supply/ucsi-source-psy-USBC000\:001/*
> /sys/class/typec/port0/device/power_supply/ucsi-source-psy-USBC000:001/current_max:0
> /sys/class/typec/port0/device/power_supply/ucsi-source-psy-USBC000:001/current_now:0
> grep: /sys/class/typec/port0/device/power_supply/ucsi-source-psy-USBC000:001/device:
> Is a directory
> grep: /sys/class/typec/port0/device/power_supply/ucsi-source-psy-USBC000:001/hwmon7:
> Is a directory
> /sys/class/typec/port0/device/power_supply/ucsi-source-psy-USBC000:001/online:0
> grep:
> /sys/class/typec/port0/device/power_supply/ucsi-source-psy-USBC000:001/power:
> Is a directory
> /sys/class/typec/port0/device/power_supply/ucsi-source-psy-USBC000:001/scope:System
> grep: /sys/class/typec/port0/device/power_supply/ucsi-source-psy-USBC000:001/subsystem:
> Is a directory
> /sys/class/typec/port0/device/power_supply/ucsi-source-psy-USBC000:001/type:USB
> /sys/class/typec/port0/device/power_supply/ucsi-source-psy-USBC000:001/uevent:POWER_SUPPLY_NAME=ucsi-source-psy-USBC000:001
> /sys/class/typec/port0/device/power_supply/ucsi-source-psy-USBC000:001/uevent:POWER_SUPPLY_TYPE=USB
> /sys/class/typec/port0/device/power_supply/ucsi-source-psy-USBC000:001/uevent:POWER_SUPPLY_USB_TYPE=[C]
> PD PD_PPS
> /sys/class/typec/port0/device/power_supply/ucsi-source-psy-USBC000:001/uevent:POWER_SUPPLY_ONLINE=0
> /sys/class/typec/port0/device/power_supply/ucsi-source-psy-USBC000:001/uevent:POWER_SUPPLY_VOLTAGE_MIN=5000000
> /sys/class/typec/port0/device/power_supply/ucsi-source-psy-USBC000:001/uevent:POWER_SUPPLY_VOLTAGE_MAX=5000000
> /sys/class/typec/port0/device/power_supply/ucsi-source-psy-USBC000:001/uevent:POWER_SUPPLY_VOLTAGE_NOW=5000000
> /sys/class/typec/port0/device/power_supply/ucsi-source-psy-USBC000:001/uevent:POWER_SUPPLY_CURRENT_MAX=0
> /sys/class/typec/port0/device/power_supply/ucsi-source-psy-USBC000:001/uevent:POWER_SUPPLY_CURRENT_NOW=0
> /sys/class/typec/port0/device/power_supply/ucsi-source-psy-USBC000:001/uevent:POWER_SUPPLY_SCOPE=System
> /sys/class/typec/port0/device/power_supply/ucsi-source-psy-USBC000:001/usb_type:[C]
> PD PD_PPS
> /sys/class/typec/port0/device/power_supply/ucsi-source-psy-USBC000:001/voltage_max:5000000
> /sys/class/typec/port0/device/power_supply/ucsi-source-psy-USBC000:001/voltage_min:5000000
> /sys/class/typec/port0/device/power_supply/ucsi-source-psy-USBC000:001/voltage_now:5000000
> grep: /sys/class/typec/port0/device/power_supply/ucsi-source-psy-USBC000:001/wakeup49:
> Is a directory
> ```
> 
> Now I unplugged the device, and the error is *not* logged. (I had a USB
> Type-C port replicator plugged in during the day before.)
> 
> The directory is still there:
> 
> ```
> $ LANG= grep .
> /sys/class/typec/port0/device/power_supply/ucsi-source-psy-USBC000\:001/*
> /sys/class/typec/port0/device/power_supply/ucsi-source-psy-USBC000:001/current_max:0
> /sys/class/typec/port0/device/power_supply/ucsi-source-psy-USBC000:001/current_now:0
> grep: /sys/class/typec/port0/device/power_supply/ucsi-source-psy-USBC000:001/device:
> Is a directory
> grep: /sys/class/typec/port0/device/power_supply/ucsi-source-psy-USBC000:001/hwmon7:
> Is a directory
> /sys/class/typec/port0/device/power_supply/ucsi-source-psy-USBC000:001/online:0
> grep:
> /sys/class/typec/port0/device/power_supply/ucsi-source-psy-USBC000:001/power:
> Is a directory
> /sys/class/typec/port0/device/power_supply/ucsi-source-psy-USBC000:001/scope:System
> grep: /sys/class/typec/port0/device/power_supply/ucsi-source-psy-USBC000:001/subsystem:
> Is a directory
> /sys/class/typec/port0/device/power_supply/ucsi-source-psy-USBC000:001/type:USB
> /sys/class/typec/port0/device/power_supply/ucsi-source-psy-USBC000:001/uevent:POWER_SUPPLY_NAME=ucsi-source-psy-USBC000:001
> /sys/class/typec/port0/device/power_supply/ucsi-source-psy-USBC000:001/uevent:POWER_SUPPLY_TYPE=USB
> /sys/class/typec/port0/device/power_supply/ucsi-source-psy-USBC000:001/uevent:POWER_SUPPLY_USB_TYPE=[C]
> PD PD_PPS
> /sys/class/typec/port0/device/power_supply/ucsi-source-psy-USBC000:001/uevent:POWER_SUPPLY_ONLINE=0
> /sys/class/typec/port0/device/power_supply/ucsi-source-psy-USBC000:001/uevent:POWER_SUPPLY_VOLTAGE_MIN=5000000
> /sys/class/typec/port0/device/power_supply/ucsi-source-psy-USBC000:001/uevent:POWER_SUPPLY_VOLTAGE_MAX=5000000
> /sys/class/typec/port0/device/power_supply/ucsi-source-psy-USBC000:001/uevent:POWER_SUPPLY_VOLTAGE_NOW=5000000
> /sys/class/typec/port0/device/power_supply/ucsi-source-psy-USBC000:001/uevent:POWER_SUPPLY_CURRENT_MAX=0
> /sys/class/typec/port0/device/power_supply/ucsi-source-psy-USBC000:001/uevent:POWER_SUPPLY_CURRENT_NOW=0
> /sys/class/typec/port0/device/power_supply/ucsi-source-psy-USBC000:001/uevent:POWER_SUPPLY_SCOPE=System
> /sys/class/typec/port0/device/power_supply/ucsi-source-psy-USBC000:001/usb_type:[C]
> PD PD_PPS
> /sys/class/typec/port0/device/power_supply/ucsi-source-psy-USBC000:001/voltage_max:5000000
> /sys/class/typec/port0/device/power_supply/ucsi-source-psy-USBC000:001/voltage_min:5000000
> /sys/class/typec/port0/device/power_supply/ucsi-source-psy-USBC000:001/voltage_now:5000000
> grep: /sys/class/typec/port0/device/power_supply/ucsi-source-psy-USBC000:001/wakeup49:
> Is a directory
> ```
> 
> I guess, that is the wrong directory I look at though?
> 
> (I am going to monitor the logs over the next days.)

Just list what you have in /sys/class/typec/ before and after plugging
a device to the port:

        ls /sys/class/typec/

thanks,

-- 
heikki

