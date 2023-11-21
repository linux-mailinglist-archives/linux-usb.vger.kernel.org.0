Return-Path: <linux-usb+bounces-3134-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AF4767F370B
	for <lists+linux-usb@lfdr.de>; Tue, 21 Nov 2023 21:03:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 69489282A6B
	for <lists+linux-usb@lfdr.de>; Tue, 21 Nov 2023 20:03:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 153154207C;
	Tue, 21 Nov 2023 20:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-usb@vger.kernel.org
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B179D191;
	Tue, 21 Nov 2023 12:03:22 -0800 (PST)
Received: from [10.0.3.168] (unknown [93.240.169.83])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id A02FA61E5FE01;
	Tue, 21 Nov 2023 21:02:54 +0100 (CET)
Message-ID: <e679745a-6498-496c-8e0a-0d83cafbca27@molgen.mpg.de>
Date: Tue, 21 Nov 2023 21:02:53 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Qualcomm Atheros QCA61x4 keeps drawing 0.85 W despite Bluetooth
 being disable in GNOME
Content-Language: en-US
To: Alan Stern <stern@rowland.harvard.edu>,
 Hans de Goede <hdegoede@redhat.com>
Cc: Marcel Holtmann <marcel@holtmann.org>,
 Johan Hedberg <johan.hedberg@gmail.com>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-pm@vger.kernel.org,
 Mike Jones <mike@mjones.io>, Rocky Liao <quic_rjliao@quicinc.com>
References: <d994bd71-8d8b-4b6a-855e-8ea5bfede3ca@molgen.mpg.de>
 <22494842-a785-4151-915d-6f3a677d96cb@molgen.mpg.de>
 <1f3cb0cc-4bb0-471f-a785-a5d237cd46a3@rowland.harvard.edu>
 <d63ebc5f-9b72-4457-949b-3e90883bd3c0@molgen.mpg.de>
 <d61ae9a8-2228-4af1-a5f0-912e7763fbd1@rowland.harvard.edu>
 <de236c7d-e265-452a-a60e-b10293a5b944@molgen.mpg.de>
 <41253614-764e-4e95-b052-a46bf5587c29@rowland.harvard.edu>
 <3489df64-0f8f-43e1-a05f-ccb145ff6d59@molgen.mpg.de>
 <fd84c14a-1866-4643-8ce9-0d6da5c4b82e@rowland.harvard.edu>
 <d8fba4f9-f868-4ef3-938b-f202e5bcc4ad@molgen.mpg.de>
 <b6c77dc7-04e6-424c-b3b6-f51f437a1671@rowland.harvard.edu>
From: Paul Menzel <pmenzel@molgen.mpg.de>
Disposition-Notification-To: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <b6c77dc7-04e6-424c-b3b6-f51f437a1671@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dear Alan, dear Hans,


Am 21.11.23 um 18:40 schrieb Alan Stern:
> On Tue, Nov 21, 2023 at 06:12:30PM +0100, Paul Menzel wrote:

>> Am 21.11.23 um 17:23 schrieb Alan Stern:
>>>> [340560.441957] usb 1-3: finish reset-resume
>>>> [340560.570940] usb 1-3: reset full-speed USB device number 2 using xhci_hcd
>>>
>>> Those two lines are unexpected.  Why does the device need to be reset?
>>> While the btusb module is loaded, does anything show up in
>>> /sys/bus/usb/devices/1-3/quirks?
>>
>>      $ more /sys/bus/usb/devices/1-3/quirks
>>      0x2
> 
> Ah.  0x2 is the RESET_RESUME quirk bit.  The fact that it is on explains
> why the device gets reset when it is resumed.
> 
> It also explains why the device isn't getting suspended.  The USB core
> will not autosuspend a device that has the RESET_RESUME quirk if its
> driver wants remote-wakeup or does not support reset-resume.  The btusb
> driver is like that.
> 
> Apparently the RESET_RESUME quirk bit is set by the btusb driver itself
> (see the btusb_check_needs_reset_resume() routine in btusb.c), based on
> the computing platform rather than on the Bluetooth device.  The
> btusb_needs_reset_resume_table[] contains three entries: Dell OptiPlex
> 3060, Dell XPS 9360, and Dell Inspiron 5565.
> 
> Since your system is an XPS 9360, it has this problem with suspending
> the onboard Bluetooth device.  The only way the kernel can deal with it
> is to avoid putting the device into runtime suspend while the driver
> module is loaded.
> 
> So there's your answer.  If you rebuild the btusb driver after removing
> the XPS 9360 entry from btusb_needs_reset_resume_table[], you should
> find that the device does get runtime suspended.  (But then it might not
> operate properly if you try to turn it on again after it has been
> suspended.)

Thank you for finding this. This is commit 596b07a9a226 (Bluetooth: 
btusb: Add Dell XPS 13 9360 to btusb_needs_reset_resume_table) from 
April 2018 [1]. Hans, was it ever confirmed to be a platform limitation? 
Does the Microsoft Windows driver do the same? Did the Dell engineers 
verify it with the schematics? I was unable to see this in the bug 
report [2].

Also, it would be nice, if Linux logged, if quirks are applied that 
affect power usage.

As Alan wrote, that I’d need to rebuild the module to deactivate the 
behavior, there is no switch to override the quirk table, right?

>>>>       bmAttributes         0xe0
>>>>         Self Powered
>>>>         Remote Wakeup
>>>
>>> That's what I was interested in.  The device does support remote wakeup.
>>
>> That would make sense so it can be resumed? (It does not necessarily mean
>> something like Wake-On-LAN, right?
> 
> It _does_ mean something like Wake-On-LAN: The device is capable of
> asking the system to wake it up under some conditions while it or the
> system is suspended.
> 
>> Also, for this device it’s disabled?
>>
>>      $ grep . /sys/bus/usb/devices/1-3/power/wakeup
>>      disabled
> 
> Yes.  You can change that setting by writing "enabled" to the sysfs
> file.  But I don't think this will make any difference to your runtime
> suspend problem; the power/wakeup setting affects only system suspend,
> not runtime suspend.

Thank you again for the clarification.


Kind regards,

Paul


[1]: 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=596b07a9a22656493726edf1739569102bd3e136
[2]: https://bugzilla.redhat.com/show_bug.cgi?id=1514836

