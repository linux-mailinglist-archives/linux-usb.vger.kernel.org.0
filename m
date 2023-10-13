Return-Path: <linux-usb+bounces-1608-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E29277C8F82
	for <lists+linux-usb@lfdr.de>; Fri, 13 Oct 2023 23:44:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8E481282EDC
	for <lists+linux-usb@lfdr.de>; Fri, 13 Oct 2023 21:44:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DBB0273ED;
	Fri, 13 Oct 2023 21:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F60A18E21
	for <linux-usb@vger.kernel.org>; Fri, 13 Oct 2023 21:44:23 +0000 (UTC)
Received: from mp-relay-01.fibernetics.ca (mp-relay-01.fibernetics.ca [208.85.217.136])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A6C7BE
	for <linux-usb@vger.kernel.org>; Fri, 13 Oct 2023 14:44:21 -0700 (PDT)
Received: from mailpool-fe-02.fibernetics.ca (mailpool-fe-02.fibernetics.ca [208.85.217.145])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mp-relay-01.fibernetics.ca (Postfix) with ESMTPS id B9F9AE1ACA;
	Fri, 13 Oct 2023 21:44:20 +0000 (UTC)
Received: from localhost (mailpool-mx-01.fibernetics.ca [208.85.217.140])
	by mailpool-fe-02.fibernetics.ca (Postfix) with ESMTP id AC3266044B;
	Fri, 13 Oct 2023 21:44:20 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at 
X-Spam-Score: -0.2
X-Spam-Level:
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mailpool-fe-02.fibernetics.ca ([208.85.217.145])
	by localhost (mail-mx-01.fibernetics.ca [208.85.217.140]) (amavisd-new, port 10024)
	with ESMTP id f2BeJWsnfGmZ; Fri, 13 Oct 2023 21:44:20 +0000 (UTC)
Received: from [192.168.2.19] (lnsm3-torontoxn-142-116-140-195.internet.virginmobile.ca [142.116.140.195])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dgilbert@interlog.com)
	by mail.ca.inter.net (Postfix) with ESMTPSA id F3C45600EA;
	Fri, 13 Oct 2023 21:44:19 +0000 (UTC)
Message-ID: <3659cd85-1ad0-4587-b2db-acec87f6312b@interlog.com>
Date: Fri, 13 Oct 2023 17:44:19 -0400
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: dgilbert@interlog.com
Subject: Re: device present in lsusb, disappears in lsusb -t
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Greg KH <gregkh@linuxfoundation.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
References: <70c563f1-847c-32a1-cf4d-6bf9802017ab@interlog.com>
 <2023091638-duration-barcode-73a3@gregkh>
 <11b1687f-3419-4037-845e-ef33d4e3871f@interlog.com>
 <2023101139-puma-fanfare-8a0e@gregkh>
 <299d927f-7044-4d48-b6cd-c05bdb0e7fcc@rowland.harvard.edu>
 <0c2a2a23-28dd-4c83-b7af-d5421501e411@interlog.com>
 <2023101203-marine-chatter-692e@gregkh>
 <723ee63c-1eb6-490d-9327-2856601573f7@interlog.com>
 <30288fa6-105a-4c4b-84c4-750fe083ee85@rowland.harvard.edu>
 <611db058-afb5-4837-850d-b91f1e48f386@interlog.com>
 <f51cd282-6244-4689-84be-143e56809eb2@rowland.harvard.edu>
Content-Language: en-CA
From: Douglas Gilbert <dgilbert@interlog.com>
In-Reply-To: <f51cd282-6244-4689-84be-143e56809eb2@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On 10/13/23 10:50, Alan Stern wrote:
> On Thu, Oct 12, 2023 at 10:12:42PM -0400, Douglas Gilbert wrote:
>> # lsusb -tv
>> /:  Bus 001.Port 001: Dev 001, Class=root_hub, Driver=xhci_hcd/1p, 480M
>>      ID 1d6b:0002 Linux Foundation 2.0 root hub
>> /:  Bus 002.Port 001: Dev 001, Class=root_hub, Driver=xhci_hcd/3p, 20000M/x2
>>      ID 1d6b:0003 Linux Foundation 3.0 root hub
>> /:  Bus 003.Port 001: Dev 001, Class=root_hub, Driver=xhci_hcd/12p, 480M
>>      ID 1d6b:0002 Linux Foundation 2.0 root hub
>>      |__ Port 003: Dev 007, If 0, Class=Vendor Specific Class, Driver=, 12M
>>          ID 06cb:00f9 Synaptics, Inc.
>>      |__ Port 004: Dev 003, If 0, Class=Video, Driver=uvcvideo, 480M
>>          ID 5986:1177 Acer, Inc
>>      |__ Port 004: Dev 003, If 1, Class=Video, Driver=uvcvideo, 480M
>>          ID 5986:1177 Acer, Inc
>>      |__ Port 004: Dev 003, If 2, Class=Application Specific Interface,
>> Driver=, 480M
>>          ID 5986:1177 Acer, Inc
>>      |__ Port 005: Dev 009, 12M
>>          ID 0483:572b STMicroelectronics
>>      |__ Port 007: Dev 004, If 0, Class=Human Interface Device, Driver=usbhid, 12M
>>          ID 046d:c52b Logitech, Inc. Unifying Receiver
>>      |__ Port 007: Dev 004, If 1, Class=Human Interface Device, Driver=usbhid, 12M
>>          ID 046d:c52b Logitech, Inc. Unifying Receiver
>>      |__ Port 007: Dev 004, If 2, Class=Human Interface Device, Driver=usbhid, 12M
>>          ID 046d:c52b Logitech, Inc. Unifying Receiver
>> /:  Bus 004.Port 001: Dev 001, Class=root_hub, Driver=xhci_hcd/4p, 10000M
>>      ID 1d6b:0003 Linux Foundation 3.0 root hub
>>
>>
>> And there it is: Bus 003. Port 005: Dev 009 !!
> 
> Not much of an entry, but better than nothing.  :-)
> 
>> Re your "unusual device" comment: welcome to USB-C PD which in a way subverts
>> "classic" USB.
> 
> Well, it's not really a subversion.  Just using it in a way it wasn't
> intended to be used, while still remaining in compliance with the spec.
> 
>> USB-C port 0 has the ST Micro dongle in it; USB-C port 1 has a PD power adapter:
>>
>> # lsucpd
>>   port0 [pd0]  ====>>  partner [pd2]
>>   port1 [pd1]  <<====  partner [pd3]
>>
>> # lsucpd pd2 -c
>>> pd2: has NO source capabilities
>>>   pd2: sink capabilities:
>>     >> 1:fixed_supply
>>        dual_role_data='0'
>>        dual_role_power='0'
>>        fast_role_swap_current='0'
>>        higher_capability='0'
>>        operational_current='3000mA'
>>        unchunked_extended_messages_supported='0'
>>        unconstrained_power='0'
>>        usb_communication_capable='0'
>>                         ^^^^^^^^^^^^^
>>        voltage='5000mV'
>>
>> So port 0's partner says it does _not_ support USB data communications! I
>> think that means that if anything moves along D+, D-, and the Tx plus Rx
>> SuperSpeed circuits then it does _not_ follow the USB specs.
> 
> Not quite; if that were true then nothing would have shown up in any of
> the lsusb outputs, with or without -t and with or without my patch.  The
> dongle transfers enough data to be initialized and enumerated. of 

So then there might be two varieties of "usb_communications_capable=0" *** : 
those that send enough along D+ and D- to be enumerated; and those that don't
have D+ and D- pins! Many USB PD power adapters are any that second variety.

And it is not the worst idea to have a USB-C M-M cable that is Emarked (so
it can carry up to 5 Amps) and does _not_ connect D+, D- and the SuperSpeed
signals). And this is the cable to use when recharging your USB-C devices
from a public source ...

Doug Gilbert

*** I prefer the snake case variant of "usb_communications_capable" because that
is the term used by the PD specs, not  "usb_communication_capable" .

>>   Further USB PD
>> potentially sets up alternate modes:
>>
>> # lsucpd -ll p0p
>>   port0 [pd0]  ====>>  partner [pd2]
>>     port0-partner  [pd2]:
>>        accessory_mode='none'
>>        number_of_alternate_modes='1'
>>        supports_usb_power_delivery='yes'
>>        usb_power_delivery_revision='0.0'
>>      Alternate mode: /sys/class/typec/port0-partner/port0-partner.0
>>          active='yes'
>>          description='DisplayPort'
>>          mode='1'
>>          svid='ff01'
>>          vdo='0x00001085'
>>
>> So you could argue the 'lsusb -t' should not list this USB-C DP dongle.
>> IMO a stronger argument is that lsusb and 'lsusb -t' should list the
>> same devices.
>>
>> If you submit a patch you can add my "tested-by" to it. Another (little)
>> bug fixed.
> 
> Thank you; I will.
> 
> Alan Stern


