Return-Path: <linux-usb+bounces-4294-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB105816575
	for <lists+linux-usb@lfdr.de>; Mon, 18 Dec 2023 04:53:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5D8E52826DA
	for <lists+linux-usb@lfdr.de>; Mon, 18 Dec 2023 03:53:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F5A15238;
	Mon, 18 Dec 2023 03:52:58 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mp-relay-01.fibernetics.ca (mp-relay-01.fibernetics.ca [208.85.217.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E885B538B
	for <linux-usb@vger.kernel.org>; Mon, 18 Dec 2023 03:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=interlog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=interlog.com
Received: from mailpool-fe-01.fibernetics.ca (mailpool-fe-01.fibernetics.ca [208.85.217.144])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mp-relay-01.fibernetics.ca (Postfix) with ESMTPS id 3360DE0E27;
	Mon, 18 Dec 2023 03:46:09 +0000 (UTC)
Received: from localhost (mailpool-mx-02.fibernetics.ca [208.85.217.141])
	by mailpool-fe-01.fibernetics.ca (Postfix) with ESMTP id 2AC122432B;
	Mon, 18 Dec 2023 03:46:09 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at 
X-Spam-Flag: NO
X-Spam-Score: -0.2
X-Spam-Level:
Received: from mailpool-fe-01.fibernetics.ca ([208.85.217.144])
	by localhost (mail-mx-02.fibernetics.ca [208.85.217.141]) (amavisd-new, port 10024)
	with ESMTP id Q-DNYNmUpwrC; Mon, 18 Dec 2023 03:46:08 +0000 (UTC)
Received: from [192.168.2.19] (lnsm4-toronto12-50-101-224-147.internet.virginmobile.ca [50.101.224.147])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dgilbert@interlog.com)
	by mail.ca.inter.net (Postfix) with ESMTPSA id EAD9A24329;
	Mon, 18 Dec 2023 03:46:07 +0000 (UTC)
Message-ID: <eff9a939-cd38-4cbd-89a4-faebc0de67e6@interlog.com>
Date: Sun, 17 Dec 2023 22:46:01 -0500
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: dgilbert@interlog.com
Subject: Re: type-c subsystem is empty on Thinkpad T14 Gen 4 AMD
Content-Language: en-CA
To: Yaroslav Isakov <yaroslav.isakov@gmail.com>
Cc: linux-usb@vger.kernel.org,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>
References: <CADS+iDWFVZp81Ck48wQjzh--n_7Z-bV2u0SR4Z6-OZOMBLeMKw@mail.gmail.com>
 <520bd89d-b6e4-4654-adcd-8bb884802f56@interlog.com>
 <CADS+iDVhNzAHfbW+Nks_29rgJXwFTCsTU93XHQpCYBCW6cvxzQ@mail.gmail.com>
 <e7257a7a-1391-47e7-9702-d7c9ec3ff338@interlog.com>
 <CADS+iDWM8czf-D8D8H1gx2YBPCYbO4cexO83dUQ6-H8KKQSx4g@mail.gmail.com>
 <CADS+iDWSsLA+HrFLsD4nvo5KCRJTdiuZKp5cYVkXBnkC_nTfRw@mail.gmail.com>
From: Douglas Gilbert <dgilbert@interlog.com>
In-Reply-To: <CADS+iDWSsLA+HrFLsD4nvo5KCRJTdiuZKp5cYVkXBnkC_nTfRw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/17/23 16:25, Yaroslav Isakov wrote:
> вс, 17 дек. 2023 г. в 21:48, Yaroslav Isakov <yaroslav.isakov@gmail.com>:
>>
>> вс, 17 дек. 2023 г. в 20:15, Douglas Gilbert <dgilbert@interlog.com>:
>>>
>>> On 12/17/23 12:24, Yaroslav Isakov wrote:
>>>> вс, 17 дек. 2023 г. в 18:08, Douglas Gilbert <dgilbert@interlog.com>:
>>>>>
>>>>> On 12/17/23 11:21, Yaroslav Isakov wrote:
>>>>>> Hello! I recently bought Thinkpad T14 Gen 4 AMD laptop, and I
>>>>>> installed Gentoo on it, with kernel 6.6.4.
>>>>>>
>>>>>> Even though type-c ports seems to be working (I checked usb3 flash
>>>>>> stick, lenovo charger, Jabra headset, Yubikey), I cannot see any
>>>>>> devices in /sys/class/(typec,typec_mux,usb_power_delivery).
>>>>>>
>>>>>> There are no messages in dmesg at all, mentioning typec. I can see
>>>>>> that modules typec_ucsi, ucsi_acpi, thunderbolt are loaded. I can see
>>>>>> that device TYPEC000 is present on acpi bus, there are files in
>>>>>> /sys/bus/acpi/devices/USBC000:00, but, there is no driver linked in
>>>>>> it.
>>>>>>
>>>>>> I tried to recompile module ucsi_acpi, with adding { "USBC000", 0 }
>>>>>> to ucsi_acpi_match, but it did not change anything (except that in
>>>>>> modinfo of this module, USBC000 is now seen.
>>>>>>
>>>>>> I tried to decompile SSDT1 table, which has definition of USBC, but
>>>>>> there is nothing in it, which is supicious.
>>>>>>
>>>>>> What else can I check, to understand, why can't I see anything in
>>>>>> typec/PD subsystems?
>>>>>>
>>>>>
>>>>> I have a X13 Gen 3 [i5-1240P] which is about 18 months old. Everything you
>>>>> mention is present plus the typec ports and the associated pd objects:
>>>>>
>>>>> $ lsucpd
>>>>>     port0 [pd0]  <<====  partner [pd2]
>>>>>     port1 [pd1]  <
>>>>
>>>> I guess, it makes no sense to install lsucpd, if it checks /sys/class/typec etc?
>>>>
>>>>>
>>>>> A power adapter is connected to port0. Here are the modules loaded:
>>>>>
>>>>> $ lsmod | grep typec
>>>>> typec_ucsi             57344  1 ucsi_acpi
>>>>> roles                  16384  1 typec_ucsi
>>>>> typec                 114688  1 typec_ucsi
>>>>> usb_common             20480  4 xhci_hcd,usbcore,uvcvideo,typec_ucsi
>>>>> $ lsmod | grep ucsi
>>>>> ucsi_acpi              12288  0
>>>>> typec_ucsi             57344  1 ucsi_acpi
>>>>> roles                  16384  1 typec_ucsi
>>>>> typec                 114688  1 typec_ucsi
>>>>> usb_common             20480  4 xhci_hcd,usbcore,uvcvideo,typec_ucsi
>>>>>
>>>> I have exact same modules.
>>>>
>>>>> $ ls /sys/bus/acpi/devices/USBC000:00
>>>>> device:ac  device:ad  hid  modalias  path  physical_node  power  status
>>>>> subsystem  uevent  uid  wakeup
>>>> Under /sys/bus/acpi/devices/USBC000:00 I have the similar files:
>>>> adr  device:48  device:49  hid  modalias  path  physical_node  power
>>>> status  subsystem  uevent  uid
>>>> As you don't have driver symlink there, too, then it's a red herring,
>>>> that lack of driver file is symptom of this issue.
>>>>
>>>>>
>>>>> Strange that the Thunderbolt module is loaded since I thought only the Intel
>>>>> variants supported Thunderbolt.
>>>> thundebolt module is now shared with USB4 subsystem, and T14 started
>>>> to have USB4 from Gen 3, for AMD variant.
>>>>>
>>>>> The only thing that I can think of is some BIOS setting. When I poked around
>>>>> in the X13 BIOS I don't remember any setting that would cause what you are
>>>>> seeing.]
>>>> I checked BIOS settings, but I cannot find anything related
>>>>
>>>> Could you please show, what drivers are used for device:ac and
>>>> device:ad, under /sys/bus/acpi/devices/USBC000:00? It seems that if I
>>>> have such entries in my /sys/bus/acpi/devices/USBC000:00, at least
>>>> ucsi_acpi works properly.
>>>
>>> dougg@treten:/sys/bus/acpi/devices/USBC000:00/device:ac$ ls -l
>>> total 0
>>> -r--r--r-- 1 root root 4096 Dec 16 19:11 adr
>>> -r--r--r-- 1 root root 4096 Dec 16 19:11 path
>>> lrwxrwxrwx 1 root root    0 Dec 16 19:11 physical_node ->
>>> ../../../../platform/USBC000:00/typec/port0
>>> drwxr-xr-x 2 root root    0 Dec 16 19:11 power
>>> lrwxrwxrwx 1 root root    0 Dec 16 16:45 subsystem -> ../../../../../bus/acpi
>>> -rw-r--r-- 1 root root 4096 Dec 16 16:45 uevent
>>>
>>> dougg@treten:/sys/bus/acpi/devices/USBC000:00/device:ac$ cd ../device\:ad
>>> dougg@treten:/sys/bus/acpi/devices/USBC000:00/device:ad$ ls -l
>>> total 0
>>> -r--r--r-- 1 root root 4096 Dec 16 19:11 adr
>>> -r--r--r-- 1 root root 4096 Dec 16 19:11 path
>>> lrwxrwxrwx 1 root root    0 Dec 16 19:11 physical_node ->
>>> ../../../../platform/USBC000:00/typec/port1
>>> drwxr-xr-x 2 root root    0 Dec 16 19:11 power
>>> lrwxrwxrwx 1 root root    0 Dec 16 16:45 subsystem -> ../../../../../bus/acpi
>>> -rw-r--r-- 1 root root 4096 Dec 16 16:45 uevent
>>>
>>>
>>>>
>>>> In my /sys/bus/acpi/devices/USBC000:00/device:(48,49), there are only
>>>> adr, path and uevent files, and power and subsytem folders. Subsystem
>>>> links to bus/acpi, and path has \_SB_.UBTC.CR01, \_SB_.UBTC.CR02
>>>
>>> Mine has the extra physical_node symlinks to typec/port0 and typec/port1
>> Yes, I have the same as on T14 Gen 3 (Intel). Looks like they have no
>> driver symlinks, too, but they're working on Intel.
>>>
>>>> P.S. I tried latest live Fedora, just to see if I forgot to compile
>>>> some drivers for custom-built Gentoo kernel, but same issue on Fedora
>>>
>>> Below is a fragment of a post from Heikki Krogerus about turning on ucsi debug:
>>>
>>> If you want to see the actual UCSI notification in user space, then
>>> that is not possible, but the driver does produce trace output, and I
>>> would actually like to see what we got there. You need debugfs to be
>>> mounted. Then try the following:
>>>
>>>           # Unload all UCSI modules
>>>           modprobe -r ucsi_acpi
>>>
>>>           # At this point you should plug-in the problematic device
>>>
>>>           # Reload the UCSI core module
>>>           modprobe typec_ucsi
>>>
>>>           # Enable UCSI tracing
>>>           echo 1 > /sys/kernel/debug/tracing/events/ucsi/enable
>>>
>>>           # Now reload the ACPI glue driver
>>>           modprobe ucsi_acpi
>>>
>>>           # Unplug the problematic device so that you see the error
>>>
>>>           # Finally dump the trace output
>>>           cat /sys/kernel/debug/tracing/trace
>>>
>>> So if that works, please send the trace output to me.
>>> [Heikki]
>> I tried provided commands, both in Gentoo and Fedora - nothing in
>> trace at all. I guess, it's because ucsi on AMD can see two devices,
>> but cannot work with them, for some reason. I also checked same
>> commands on T14 Gen 3 (Intel), and I can see many ucsi_register_port
>> and ucsi_register_altmode events.
>>>
>>>
> 
> I think I managed to find the issue - looks like on my laptop,
> ucsi_register fails in version check, !ucsi->version returns False.
> Commenting out this check populates /sys/class/typec and
> /sys/class/usb_power_delivery. I did not check yet, if populated data
> is correct, but, it's definite progress.

Well spotted.

That is probably the first UCSI read operation that failed. At the very least
ucsi_register() could send a message to the log that it was exiting rather
than leave users guessing.

My guess is that Lenovo/AMD have a configuration or timing issue.

Doug Gilbert



