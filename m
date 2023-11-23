Return-Path: <linux-usb+bounces-3250-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 414907F5EF6
	for <lists+linux-usb@lfdr.de>; Thu, 23 Nov 2023 13:22:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 728BE1C20F2B
	for <lists+linux-usb@lfdr.de>; Thu, 23 Nov 2023 12:22:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EE6824A0E;
	Thu, 23 Nov 2023 12:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-usb@vger.kernel.org
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16B051BE;
	Thu, 23 Nov 2023 04:22:39 -0800 (PST)
Received: from [10.0.3.168] (unknown [93.240.169.83])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id B520561E5FE04;
	Thu, 23 Nov 2023 13:22:16 +0100 (CET)
Message-ID: <6288389c-59cb-4eb4-bbe6-163413db7b7e@molgen.mpg.de>
Date: Thu, 23 Nov 2023 13:22:14 +0100
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
 <2bfe2311-27a6-46b5-8662-ba3cbb409f81@molgen.mpg.de>
 <ZV3CTg03IPnZTVL0@kuha.fi.intel.com>
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <ZV3CTg03IPnZTVL0@kuha.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dear Heikki,


Am 22.11.23 um 09:56 schrieb Heikki Krogerus:
> On Tue, Nov 21, 2023 at 03:25:59PM +0100, Paul Menzel wrote:

>> Am 21.11.23 um 15:08 schrieb Heikki Krogerus:
>>> On Tue, Nov 21, 2023 at 12:50:43PM +0100, Paul Menzel wrote:
>>
>>>> On the Dell XPS 13, BIOS 2.21.0 06/02/2022, with Debian sid/unstable and
>>>> Linux 6.5.10, when unplugging the (Dell) USB Type-C charger cable, Linux
>>>> logs the error below:
>>>>
>>>>       ucsi_acpi USBC000:00: ucsi_handle_connector_change: ACK failed (-110)
>>>>
>>>> As this is logged with level error, can this be somehow fixed?
>>>>
>>>>       drivers/usb/typec/ucsi/ucsi.c: dev_err(ucsi->dev, "%s: ACK failed (%d)", __func__, ret);
>>>>
>>>> Please find the output of `dmesg` attached.
>>>
>>> Thanks. The firmware not reacting to the ACK command is weird, but I'm
>>> not sure if it's critical. Does the interface continue working after
>>> that? Do you see the partner devices appearing under /sys/class/typec/
>>> when you plug them, and disappearing when you unplug them?
>>
>> ```
>> $ LANG= grep . /sys/class/typec/port0/device/power_supply/ucsi-source-psy-USBC000\:001/*
>> /sys/class/typec/port0/device/power_supply/ucsi-source-psy-USBC000:001/current_max:0
>> /sys/class/typec/port0/device/power_supply/ucsi-source-psy-USBC000:001/current_now:0

[…]

>> ```
>>
>> Now I unplugged the device, and the error is *not* logged. (I had a USB
>> Type-C port replicator plugged in during the day before.)
>>
>> The directory is still there:
>>
>> ```
>> $ LANG= grep . /sys/class/typec/port0/device/power_supply/ucsi-source-psy-USBC000\:001/*
>> /sys/class/typec/port0/device/power_supply/ucsi-source-psy-USBC000:001/current_max:0
>> /sys/class/typec/port0/device/power_supply/ucsi-source-psy-USBC000:001/current_now:0

[…]

>> ```
>>
>> I guess, that is the wrong directory I look at though?
>>
>> (I am going to monitor the logs over the next days.)
> 
> Just list what you have in /sys/class/typec/ before and after plugging
> a device to the port:
> 
>          ls /sys/class/typec/

Sorry, here you go:

With charger:

     $ ls /sys/class/typec/
     port0  port0-partner

After unplugging the charger:

     $ LANG= ls /sys/class/typec/
     port0

By the way, Linux logs the ucsi_handle_connector_change line around five 
second after unplugging the USB Type-C charger cable.


Kind regards,

Paul


PS: In the logs since October 30th, I see the three distinct lines below:

1.  ucsi_acpi USBC000:00: failed to re-enable notifications (-110)
2.  ucsi_acpi USBC000:00: GET_CONNECTOR_STATUS failed (-110)
3.  ucsi_acpi USBC000:00: ucsi_handle_connector_change: ACK failed (-110)

Is it documented somewhere what -100 means?

