Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 967F24050B7
	for <lists+linux-usb@lfdr.de>; Thu,  9 Sep 2021 14:42:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237295AbhIIMbl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 Sep 2021 08:31:41 -0400
Received: from mail.huberulrich.de ([81.169.200.209]:57147 "EHLO
        mail.huberulrich.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347758AbhIIMZs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 9 Sep 2021 08:25:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; d=huberulrich.de; s=2017; c=relaxed/relaxed;
 q=dns/txt; h=from:date:to:cc:message-id:subject;
 bh=2TugKmgEtE9vw0PawSkcaKTNk9riZr/4V0gYGu4X0rg=;
 b=jQx8PfqOxS7DOS6smNUp9v6ryqwpL58UuiEYMae+RpIFMYA8bcg4NAHilubMl41Bia5/7U1DG4uDGpfaqzce2khbcuBq85TXxkOQN0ZS47CmQ0KLbSg6cT0cyTcqJSCN5itjZyucv0uWPokj5EfW+/dVQPcTpIt7rjbikH64Y90VoHzg0SKsp9M3vzYSzAwmdCKNY+U12BHlV7GCijx9EQFkzpQIPo5vyHWeTI235125/OcQhzRFSRf/qT9NLMR+Jk2wQk94ifMMmAL6r1QnhhFXqoW1HajfUKvVmnc/5q7+fnIjT/Wgizwk/Kg6cSVUf4h1G+OqmW4oPqGxZm7ghA==;
DomainKey-Signature: a=rsa-sha1;
 b=XvcCfmJGNvdRvzQ9m+bBuR0fpkvK+zVJK5HgnnRLQ/iffBpSl2LrZsO7X3A4j+YJl6u53NfCXKfBFiimolQ2hTXVy7QPlxAh/1rLkjBEbuScVuToT+egQ7lCX3JvWeziOHJ/zTtGCYXC1t6hjkt9ufM3T2nPmCPKYx0mDhN3Tr1GU+h0IF1fzWwqeH7pgP5VFBZnJNxcZO+MIQIn4epg1klLbsFcT0UCXPPXYK5fMULzvXR4mhhBAaDlA1pkI74nAtYF7LPqQx4LPeyZ8EqkZd1NhRxYXAbp1PtGsmKjHL+QaQXaCeoYPVXCAEv2oB+cM4iEyskrIliwzFEB94QpQw==;
 c=nofws; q=dns; d=huberulrich.de; s=2017;
 h=subject:to:cc:from:message-id:date;
Received: from [IPv6:2001:16b8:2d87:a600:b35f:b05b:32de:5183]
 (2001:16b8:2d87:a600:b35f:b05b:32de:5183) by mail.huberulrich.de (Axigen)
 with (ECDHE-RSA-AES128-GCM-SHA256 encrypted) ESMTPSA id 1F8772;
 Thu, 9 Sep 2021 12:24:34 +0000
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
 <7e06ae23-1cdd-7fe5-8b56-d4a2f80809f2@huberulrich.de>
 <YTn75r/QUSjjQ0BV@kuha.fi.intel.com>
From:   Ulrich Huber <ulrich@huberulrich.de>
Message-ID: <2b9b8209-d2d7-1cf1-ee48-490a77348ced@huberulrich.de>
Date:   Thu, 9 Sep 2021 14:24:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YTn75r/QUSjjQ0BV@kuha.fi.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: 
X-AXIGEN-SPF-Result: Ok
X-AXIGEN-DK-Result: Ok
DomainKey-Status: good
X-AXIGEN-DKIM-Result: Ok
DKIM-Status: good
X-AxigenSpam-Level: 4
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Heikki,

On 09.09.21 14:19, Heikki Krogerus wrote:
> Hi Ulrich,
>
> On Sun, Aug 29, 2021 at 01:02:54PM +0200, Ulrich Huber wrote:
>> On 28.08.21 11:48, Heikki Krogerus wrote:
>>> On Thu, Aug 26, 2021 at 09:50:58PM +0200, Ulrich Huber wrote:
>>>> I just got around to test your patches. They seem to solve the issue
>>>> completely! Whatever I tried, the behavior of the port stayed
> consistent and
>>>> no error messages appeared in the log.
>>>>
>>>> I'll continue using the patch for now and will notify you, should
> any issue
>>>> appear.
>>> Great! If there are no problems, I'll send them to Greg after the next
>>> -rc1.
>> It seems I just found one such problem. After waking from hibernation I
> get
>> the following entries in the kernel log:
>>
>> Aug 29 11:55:31 lenovo-ulrich kernel: ucsi_acpi USBC000:00:
>> GET_CONNECTOR_STATUS failed (-5)
>> Aug 29 11:55:31 lenovo-ulrich kernel: ucsi_acpi USBC000:00:
>> GET_CONNECTOR_STATUS failed (-5)
>> Aug 29 11:55:31 lenovo-ulrich kernel: usb 3-6: reset high-speed USB
> device
>> number 3 using xhci_hcd
>> Aug 29 11:55:31 lenovo-ulrich kernel: ish-hid
>> {33AECD58-B679-4E54-9BD9-A04D34F0C226}: [hid-ish]: enum_devices_do>
>> Aug 29 11:55:31 lenovo-ulrich kernel: usb 3-10: reset full-speed USB
> device
>> number 4 using xhci_hcd
>> Aug 29 11:55:31 lenovo-ulrich kernel: usb 3-5: reset full-speed USB
> device
>> number 2 using xhci_hcd
>>
>> It is obviously related with the system resetting the hardware after
> waking
>> up. Most likely the driver tries to communicate with the device while it
> is
>> in a state where it is not able to respond. I do not get this after each
>> hibernation, so far it is the first time I have seen this. I'll try to
> find
>> a way to reproduce this.
> Any updates?

Whatever I tried, I can not manage to reproduce this issue. I haven't 
seen it for quite some time as well.

>
> Would it make sense to go ahead with my series now anyway at this
> point since it seems to fix the other problems?

It would definitely make sense to go ahead with your series. Compared to 
the behavior without this fix, the situation improved tremendously. That 
hiccup I saw, does not degrade the connection as far as I can tell. At 
least the connection status has been correct after the error occurred. 
That was not the case without your fixes.

>
> thanks,
>
