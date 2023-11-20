Return-Path: <linux-usb+bounces-3042-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA767F1C0A
	for <lists+linux-usb@lfdr.de>; Mon, 20 Nov 2023 19:10:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BD5811C21655
	for <lists+linux-usb@lfdr.de>; Mon, 20 Nov 2023 18:10:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD5DF3033E;
	Mon, 20 Nov 2023 18:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-usb@vger.kernel.org
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by lindbergh.monkeyblade.net (Postfix) with SMTP id 20C35C8
	for <linux-usb@vger.kernel.org>; Mon, 20 Nov 2023 10:10:29 -0800 (PST)
Received: (qmail 1457695 invoked by uid 1000); 20 Nov 2023 13:10:29 -0500
Date: Mon, 20 Nov 2023 13:10:29 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: Marcel Holtmann <marcel@holtmann.org>,
  Johan Hedberg <johan.hedberg@gmail.com>,
  Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
  linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
  linux-usb@vger.kernel.org, linux-pm@vger.kernel.org,
  Hans de Goede <hdegoede@redhat.com>, Mike Jones <mike@mjones.io>
Subject: Re: Qualcomm Atheros QCA61x4 keeps drawing 0.85 W despite Bluetooth
 being disable in GNOME
Message-ID: <41253614-764e-4e95-b052-a46bf5587c29@rowland.harvard.edu>
References: <d994bd71-8d8b-4b6a-855e-8ea5bfede3ca@molgen.mpg.de>
 <22494842-a785-4151-915d-6f3a677d96cb@molgen.mpg.de>
 <1f3cb0cc-4bb0-471f-a785-a5d237cd46a3@rowland.harvard.edu>
 <d63ebc5f-9b72-4457-949b-3e90883bd3c0@molgen.mpg.de>
 <d61ae9a8-2228-4af1-a5f0-912e7763fbd1@rowland.harvard.edu>
 <de236c7d-e265-452a-a60e-b10293a5b944@molgen.mpg.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <de236c7d-e265-452a-a60e-b10293a5b944@molgen.mpg.de>

On Mon, Nov 20, 2023 at 08:52:19AM +0100, Paul Menzel wrote:
> Dear Alan,
> 
> 
> Than you again for your quick reply.
> 
> Am 20.11.23 um 03:26 schrieb Alan Stern:
> > On Sun, Nov 19, 2023 at 11:09:32PM +0100, Paul Menzel wrote:
> > > $ sudo modprobe btusb
> > 
> > > $ grep . /sys/bus/usb/devices/1-3/power/*
> > > /sys/bus/usb/devices/1-3/power/active_duration:119053224
> > > /sys/bus/usb/devices/1-3/power/async:enabled
> > > /sys/bus/usb/devices/1-3/power/autosuspend:2
> > > /sys/bus/usb/devices/1-3/power/autosuspend_delay_ms:2000
> > > /sys/bus/usb/devices/1-3/power/connected_duration:148065372
> > > /sys/bus/usb/devices/1-3/power/control:auto
> > > /sys/bus/usb/devices/1-3/power/level:auto
> > > /sys/bus/usb/devices/1-3/power/persist:1
> > > /sys/bus/usb/devices/1-3/power/runtime_active_kids:0
> > > /sys/bus/usb/devices/1-3/power/runtime_active_time:119060567
> > > /sys/bus/usb/devices/1-3/power/runtime_enabled:enabled
> > > /sys/bus/usb/devices/1-3/power/runtime_status:active
> > > /sys/bus/usb/devices/1-3/power/runtime_suspended_time:28831453
> > > /sys/bus/usb/devices/1-3/power/runtime_usage:0
> > > /sys/bus/usb/devices/1-3/power/wakeup:disabled
> > > ```
> > 
> > Hmmm.  It's not immediately clear why the device isn't being suspended.
> > The btusb driver does support autosuspend.
> > 
> > Can you also post the output from
> > 
> > 	grep . /sys/bus/usb/devices/1-3:*/power/*
> > 
> > with the driver module loaded?  I should have asked for it before.
> 
> ```
> $ sudo modprobe btusb
> $ sudo dmesg | tail -9
> [319747.390712] r8152 4-1.2:1.0 enx18dbf22dccf3: carrier on
> [320256.946094] bluetooth hci0: firmware: direct-loading firmware
> qca/rampatch_usb_00000302.bin
> [320256.949333] Bluetooth: hci0: using rampatch file:
> qca/rampatch_usb_00000302.bin
> [320256.949349] Bluetooth: hci0: QCA: patch rome 0x302 build 0x3e8, firmware
> rome 0x302 build 0x111
> [320256.949643] usbcore: registered new interface driver btusb
> [320257.308935] bluetooth hci0: firmware: direct-loading firmware
> qca/nvm_usb_00000302.bin
> [320257.309043] Bluetooth: hci0: using NVM file: qca/nvm_usb_00000302.bin
> [320257.336220] Bluetooth: hci0: HCI Enhanced Setup Synchronous Connection
> command is advertised, but not supported.
> [320257.638188] Bluetooth: MGMT ver 1.22
> $ /sbin/rfkill
> ID TYPE      DEVICE    SOFT      HARD
>  1 wlan      phy0   blocked unblocked
> 28 bluetooth hci0   blocked unblocked
> $ grep . /sys/bus/usb/devices/1-3:*/power/*
> /sys/bus/usb/devices/1-3:1.0/power/async:enabled
> /sys/bus/usb/devices/1-3:1.0/power/runtime_active_kids:0
> /sys/bus/usb/devices/1-3:1.0/power/runtime_enabled:enabled
> /sys/bus/usb/devices/1-3:1.0/power/runtime_status:suspended
> /sys/bus/usb/devices/1-3:1.0/power/runtime_usage:0
> /sys/bus/usb/devices/1-3:1.1/power/async:enabled
> /sys/bus/usb/devices/1-3:1.1/power/runtime_active_kids:0
> /sys/bus/usb/devices/1-3:1.1/power/runtime_enabled:enabled
> /sys/bus/usb/devices/1-3:1.1/power/runtime_status:suspended
> /sys/bus/usb/devices/1-3:1.1/power/runtime_usage:0
> ```

Again, nothing out of the ordinary.  Maybe dynamic debugging will give 
us a clue.  Try doing this:

	Unload the btusb module.

	echo module usbcore +p >/sys/kernel/debug/dynamic_debug/control

	Load the btusb module

	Make sure that Bluetooth is turned off in Gnome

	Wait a few seconds

	echo module usbcore -p >/sys/kernel/debug/dynamic_debug/control

Then let's see what the dmesg log contains for that time period.

Also, please post the output from "lsusb -v" for the Bluetooth device.

Alan Stern

