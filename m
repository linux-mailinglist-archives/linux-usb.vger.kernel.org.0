Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5242C2D2799
	for <lists+linux-usb@lfdr.de>; Tue,  8 Dec 2020 10:29:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728860AbgLHJ2d (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Dec 2020 04:28:33 -0500
Received: from mx3.molgen.mpg.de ([141.14.17.11]:45217 "EHLO mx1.molgen.mpg.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728362AbgLHJ2d (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 8 Dec 2020 04:28:33 -0500
Received: from [192.168.0.3] (unknown [95.90.244.73])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: pmenzel)
        by mx.molgen.mpg.de (Postfix) with ESMTPSA id 5BF0F20647B78;
        Tue,  8 Dec 2020 10:27:51 +0100 (CET)
Subject: Re: usb usb1-port10: disabled by hub (EMI?), re-enabling...
To:     Greg KH <gregkh@linuxfoundation.org>,
        Mario Limonciello <mario.limonciello@dell.com>
Cc:     Mathias Nyman <mathias.nyman@intel.com>,
        USB list <linux-usb@vger.kernel.org>
References: <c8408e58-8bc3-dbe7-2a99-1b1f0d3eae21@molgen.mpg.de>
 <X89ABDFgyjpQPeRq@kroah.com>
From:   Paul Menzel <pmenzel@molgen.mpg.de>
Message-ID: <8c5d6edd-d41b-0d86-e0ea-d1a1689625de@molgen.mpg.de>
Date:   Tue, 8 Dec 2020 10:27:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <X89ABDFgyjpQPeRq@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Dear Greg, dear Mario,


Am 08.12.20 um 09:57 schrieb Greg KH:
> On Tue, Dec 08, 2020 at 09:18:08AM +0100, Paul Menzel wrote:

>> On a Dell Precision 3540/0M14W7, BIOS 1.9.1 07/06/2020
>>
>>      $ lspci -nn | grep -i usb
>>      00:14.0 USB controller [0c03]: Intel Corporation Cannon Point-LP USB 3.1
>> xHCI Controller [8086:9ded] (rev 30)
>>      3a:00.0 USB controller [0c03]: Intel Corporation JHL6340 Thunderbolt 3
>> USB 3.1 Controller (C step) [Alpine Ridge 2C 2016] [8086:15db] (rev 02)
>>
>> at each boot Linux 5.6 to 5.9 logs the error below.
>>
>>      [   95.528190] usb usb1-port10: disabled by hub (EMI?), re-enabling...
>>
>> Everything seems to be fine, so I wonder, why this is level error. Is it a
>> hardware error?
> 
> Yes, it is a hardware issue.

Thank you for the confirmation. Mario, do you know if this issues is 
known to the Dell hardware team?


Kind regards,

Paul
