Return-Path: <linux-usb+bounces-3103-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 544007F30B1
	for <lists+linux-usb@lfdr.de>; Tue, 21 Nov 2023 15:26:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8AA80B21BCD
	for <lists+linux-usb@lfdr.de>; Tue, 21 Nov 2023 14:26:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 516FD54FB3;
	Tue, 21 Nov 2023 14:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-usb@vger.kernel.org
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0662010D1;
	Tue, 21 Nov 2023 06:26:20 -0800 (PST)
Received: from [10.0.3.168] (unknown [93.240.169.83])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id A828561E5FE01;
	Tue, 21 Nov 2023 15:26:00 +0100 (CET)
Message-ID: <2bfe2311-27a6-46b5-8662-ba3cbb409f81@molgen.mpg.de>
Date: Tue, 21 Nov 2023 15:25:59 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Unplugging USB-C charger cable causes `ucsi_acpi USBC000:00:
 ucsi_handle_connector_change: ACK failed (-110)`
Content-Language: en-US
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-usb@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Hans de Goede <hdegoede@redhat.com>
References: <b2466bc2-b62c-4328-94a4-b60af4135ba7@molgen.mpg.de>
 <ZVy5+AxnOZNmUZ15@kuha.fi.intel.com>
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <ZVy5+AxnOZNmUZ15@kuha.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Dear Heikki,


Thank you for your prompt reply.

Am 21.11.23 um 15:08 schrieb Heikki Krogerus:
> On Tue, Nov 21, 2023 at 12:50:43PM +0100, Paul Menzel wrote:

>> On the Dell XPS 13, BIOS 2.21.0 06/02/2022, with Debian sid/unstable and
>> Linux 6.5.10, when unplugging the (Dell) USB Type-C charger cable, Linux
>> logs the error below:
>>
>>      ucsi_acpi USBC000:00: ucsi_handle_connector_change: ACK failed (-110)
>>
>> As this is logged with level error, can this be somehow fixed?
>>
>>      drivers/usb/typec/ucsi/ucsi.c: dev_err(ucsi->dev, "%s: ACK failed (%d)", __func__, ret);
>>
>> Please find the output of `dmesg` attached.
> 
> Thanks. The firmware not reacting to the ACK command is weird, but I'm
> not sure if it's critical. Does the interface continue working after
> that? Do you see the partner devices appearing under /sys/class/typec/
> when you plug them, and disappearing when you unplug them?

```
$ LANG= grep . 
/sys/class/typec/port0/device/power_supply/ucsi-source-psy-USBC000\:001/*
/sys/class/typec/port0/device/power_supply/ucsi-source-psy-USBC000:001/current_max:0
/sys/class/typec/port0/device/power_supply/ucsi-source-psy-USBC000:001/current_now:0
grep: 
/sys/class/typec/port0/device/power_supply/ucsi-source-psy-USBC000:001/device: 
Is a directory
grep: 
/sys/class/typec/port0/device/power_supply/ucsi-source-psy-USBC000:001/hwmon7: 
Is a directory
/sys/class/typec/port0/device/power_supply/ucsi-source-psy-USBC000:001/online:0
grep: 
/sys/class/typec/port0/device/power_supply/ucsi-source-psy-USBC000:001/power: 
Is a directory
/sys/class/typec/port0/device/power_supply/ucsi-source-psy-USBC000:001/scope:System
grep: 
/sys/class/typec/port0/device/power_supply/ucsi-source-psy-USBC000:001/subsystem: 
Is a directory
/sys/class/typec/port0/device/power_supply/ucsi-source-psy-USBC000:001/type:USB
/sys/class/typec/port0/device/power_supply/ucsi-source-psy-USBC000:001/uevent:POWER_SUPPLY_NAME=ucsi-source-psy-USBC000:001
/sys/class/typec/port0/device/power_supply/ucsi-source-psy-USBC000:001/uevent:POWER_SUPPLY_TYPE=USB
/sys/class/typec/port0/device/power_supply/ucsi-source-psy-USBC000:001/uevent:POWER_SUPPLY_USB_TYPE=[C] 
PD PD_PPS
/sys/class/typec/port0/device/power_supply/ucsi-source-psy-USBC000:001/uevent:POWER_SUPPLY_ONLINE=0
/sys/class/typec/port0/device/power_supply/ucsi-source-psy-USBC000:001/uevent:POWER_SUPPLY_VOLTAGE_MIN=5000000
/sys/class/typec/port0/device/power_supply/ucsi-source-psy-USBC000:001/uevent:POWER_SUPPLY_VOLTAGE_MAX=5000000
/sys/class/typec/port0/device/power_supply/ucsi-source-psy-USBC000:001/uevent:POWER_SUPPLY_VOLTAGE_NOW=5000000
/sys/class/typec/port0/device/power_supply/ucsi-source-psy-USBC000:001/uevent:POWER_SUPPLY_CURRENT_MAX=0
/sys/class/typec/port0/device/power_supply/ucsi-source-psy-USBC000:001/uevent:POWER_SUPPLY_CURRENT_NOW=0
/sys/class/typec/port0/device/power_supply/ucsi-source-psy-USBC000:001/uevent:POWER_SUPPLY_SCOPE=System
/sys/class/typec/port0/device/power_supply/ucsi-source-psy-USBC000:001/usb_type:[C] 
PD PD_PPS
/sys/class/typec/port0/device/power_supply/ucsi-source-psy-USBC000:001/voltage_max:5000000
/sys/class/typec/port0/device/power_supply/ucsi-source-psy-USBC000:001/voltage_min:5000000
/sys/class/typec/port0/device/power_supply/ucsi-source-psy-USBC000:001/voltage_now:5000000
grep: 
/sys/class/typec/port0/device/power_supply/ucsi-source-psy-USBC000:001/wakeup49: 
Is a directory
```

Now I unplugged the device, and the error is *not* logged. (I had a USB 
Type-C port replicator plugged in during the day before.)

The directory is still there:

```
$ LANG= grep . 
/sys/class/typec/port0/device/power_supply/ucsi-source-psy-USBC000\:001/*
/sys/class/typec/port0/device/power_supply/ucsi-source-psy-USBC000:001/current_max:0
/sys/class/typec/port0/device/power_supply/ucsi-source-psy-USBC000:001/current_now:0
grep: 
/sys/class/typec/port0/device/power_supply/ucsi-source-psy-USBC000:001/device: 
Is a directory
grep: 
/sys/class/typec/port0/device/power_supply/ucsi-source-psy-USBC000:001/hwmon7: 
Is a directory
/sys/class/typec/port0/device/power_supply/ucsi-source-psy-USBC000:001/online:0
grep: 
/sys/class/typec/port0/device/power_supply/ucsi-source-psy-USBC000:001/power: 
Is a directory
/sys/class/typec/port0/device/power_supply/ucsi-source-psy-USBC000:001/scope:System
grep: 
/sys/class/typec/port0/device/power_supply/ucsi-source-psy-USBC000:001/subsystem: 
Is a directory
/sys/class/typec/port0/device/power_supply/ucsi-source-psy-USBC000:001/type:USB
/sys/class/typec/port0/device/power_supply/ucsi-source-psy-USBC000:001/uevent:POWER_SUPPLY_NAME=ucsi-source-psy-USBC000:001
/sys/class/typec/port0/device/power_supply/ucsi-source-psy-USBC000:001/uevent:POWER_SUPPLY_TYPE=USB
/sys/class/typec/port0/device/power_supply/ucsi-source-psy-USBC000:001/uevent:POWER_SUPPLY_USB_TYPE=[C] 
PD PD_PPS
/sys/class/typec/port0/device/power_supply/ucsi-source-psy-USBC000:001/uevent:POWER_SUPPLY_ONLINE=0
/sys/class/typec/port0/device/power_supply/ucsi-source-psy-USBC000:001/uevent:POWER_SUPPLY_VOLTAGE_MIN=5000000
/sys/class/typec/port0/device/power_supply/ucsi-source-psy-USBC000:001/uevent:POWER_SUPPLY_VOLTAGE_MAX=5000000
/sys/class/typec/port0/device/power_supply/ucsi-source-psy-USBC000:001/uevent:POWER_SUPPLY_VOLTAGE_NOW=5000000
/sys/class/typec/port0/device/power_supply/ucsi-source-psy-USBC000:001/uevent:POWER_SUPPLY_CURRENT_MAX=0
/sys/class/typec/port0/device/power_supply/ucsi-source-psy-USBC000:001/uevent:POWER_SUPPLY_CURRENT_NOW=0
/sys/class/typec/port0/device/power_supply/ucsi-source-psy-USBC000:001/uevent:POWER_SUPPLY_SCOPE=System
/sys/class/typec/port0/device/power_supply/ucsi-source-psy-USBC000:001/usb_type:[C] 
PD PD_PPS
/sys/class/typec/port0/device/power_supply/ucsi-source-psy-USBC000:001/voltage_max:5000000
/sys/class/typec/port0/device/power_supply/ucsi-source-psy-USBC000:001/voltage_min:5000000
/sys/class/typec/port0/device/power_supply/ucsi-source-psy-USBC000:001/voltage_now:5000000
grep: 
/sys/class/typec/port0/device/power_supply/ucsi-source-psy-USBC000:001/wakeup49: 
Is a directory
```

I guess, that is the wrong directory I look at though?

(I am going to monitor the logs over the next days.)


Kind regards,

Paul
```

