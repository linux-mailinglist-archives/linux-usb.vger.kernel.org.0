Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 368D73FAAFC
	for <lists+linux-usb@lfdr.de>; Sun, 29 Aug 2021 13:03:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235122AbhH2LDx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 29 Aug 2021 07:03:53 -0400
Received: from mail.huberulrich.de ([81.169.200.209]:58606 "EHLO
        mail.huberulrich.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235011AbhH2LDx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 29 Aug 2021 07:03:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; d=huberulrich.de; s=2017; c=relaxed/relaxed;
 q=dns/txt; h=from:date:to:cc:message-id:subject;
 bh=xCZxbyjfm/w/4ctrkuixPd+ya+HIaMuFfIs2R42VrcI=;
 b=B5abJObYrLDElJpeLAgZdLRo2D4x9fCn8zfaxj8Qm5QMK7qz1iEcf7O+fLOo0+JccyyJeXyGis0G60bUfxz4G4it8xxznf3nr3ctywz2E0pmB+AK6M890iCqVtcGjVb3pyCJluSvmNoIjNNbLiCr5TnPLJKPyLrHCkvCPWsN0QgLVgxKZbgNz84e69W8Tuu0shekz9urhIgVXNy+G6HvK3n6DQBaDE1g6gWb+zCpRCP8Iqt4U8t9i52IapWRp1swZ/CsgLC1bHT4t0dYvLJB1bGmMobXmljpkkD45KNpW6YmYUNlB+6ILb6eA6uQvtwikJZauUiR1ShvtQ0z65egug==;
DomainKey-Signature: a=rsa-sha1;
 b=cvCGqdTHvuvnbmFN+0OENZc8UdJg+zXqeLCLgWQNaai+yIdvoTzHsOcJms7gS7hb8oVJQd05yWD1gJDEhxy2kCgFby9CLCz9rI+KY0a+7fl8oe7bre4Forni7soUceeVPRB79qjzoQnXexKUEglbBBOOSjsI6F7g1Q1LxgnSHlTm8TRI4Al85b7e3Ykb2fPZ1YFSSJG3xgnzpCCFfuw9Thw+UGG0rDlN3+ISDZAQ/iH5LKCe3AoIJYo1bcK4zowqTK2BGv7pvjWYz2bdeqc+iVXTxqL7naRcWlj8ftndrK0hbC2VOfofGnGlF73llAhthquyOnRj+p2utL6c0lHZrQ==;
 c=nofws; q=dns; d=huberulrich.de; s=2017;
 h=subject:to:cc:from:message-id:date;
Received: from [IPv6:2001:16b8:2d89:e200:4b9e:209d:621a:2c04]
 (2001:16b8:2d89:e200:4b9e:209d:621a:2c04) by mail.huberulrich.de (Axigen)
 with (ECDHE-RSA-AES128-GCM-SHA256 encrypted) ESMTPSA id 39D8D7;
 Sun, 29 Aug 2021 11:02:54 +0000
Subject: Re: ucsi_acpi GET_CONNECTOR_STATUS failed (-5)
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     linux-usb@vger.kernel.org
References: <b36249c5-776a-9338-bb9f-ae6a5c446860@huberulrich.de>
 <YSX7hZnCoFSXTFJe@kuha.fi.intel.com>
 <0e77017d-9358-a691-6293-234fcbab6a31@huberulrich.de>
 <a7f971ef-c3aa-aadc-e453-4c667a414131@huberulrich.de>
 <YSekP0+tq6ISq6my@kuha.fi.intel.com>
 <3fe6d701-bc14-9b26-a5af-aa38fe7c585e@huberulrich.de>
 <YSoGcC4Z1EP0S3KQ@kuha.fi.intel.com>
From:   Ulrich Huber <ulrich@huberulrich.de>
Message-ID: <7e06ae23-1cdd-7fe5-8b56-d4a2f80809f2@huberulrich.de>
Date:   Sun, 29 Aug 2021 13:02:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YSoGcC4Z1EP0S3KQ@kuha.fi.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: 
X-AXIGEN-SPF-Result: Ok
X-AXIGEN-DK-Result: Ok
DomainKey-Status: good
X-AXIGEN-DKIM-Result: Ok
DKIM-Status: good
X-AxigenSpam-Level: 6
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


On 28.08.21 11:48, Heikki Krogerus wrote:
> On Thu, Aug 26, 2021 at 09:50:58PM +0200, Ulrich Huber wrote:
>> I just got around to test your patches. They seem to solve the issue
>> completely! Whatever I tried, the behavior of the port stayed consistent and
>> no error messages appeared in the log.
>>
>> I'll continue using the patch for now and will notify you, should any issue
>> appear.
> Great! If there are no problems, I'll send them to Greg after the next
> -rc1.

It seems I just found one such problem. After waking from hibernation I 
get the following entries in the kernel log:

Aug 29 11:55:31 lenovo-ulrich kernel: ucsi_acpi USBC000:00: 
GET_CONNECTOR_STATUS failed (-5)
Aug 29 11:55:31 lenovo-ulrich kernel: ucsi_acpi USBC000:00: 
GET_CONNECTOR_STATUS failed (-5)
Aug 29 11:55:31 lenovo-ulrich kernel: usb 3-6: reset high-speed USB 
device number 3 using xhci_hcd
Aug 29 11:55:31 lenovo-ulrich kernel: ish-hid 
{33AECD58-B679-4E54-9BD9-A04D34F0C226}: [hid-ish]: enum_devices_do>
Aug 29 11:55:31 lenovo-ulrich kernel: usb 3-10: reset full-speed USB 
device number 4 using xhci_hcd
Aug 29 11:55:31 lenovo-ulrich kernel: usb 3-5: reset full-speed USB 
device number 2 using xhci_hcd

It is obviously related with the system resetting the hardware after 
waking up. Most likely the driver tries to communicate with the device 
while it is in a state where it is not able to respond. I do not get 
this after each hibernation, so far it is the first time I have seen 
this. I'll try to find a way to reproduce this.

>
> thanks,
>
