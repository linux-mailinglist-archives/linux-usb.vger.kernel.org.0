Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 346E941E244
	for <lists+linux-usb@lfdr.de>; Thu, 30 Sep 2021 21:30:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343998AbhI3TcZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 30 Sep 2021 15:32:25 -0400
Received: from mga17.intel.com ([192.55.52.151]:14228 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229600AbhI3TcY (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 30 Sep 2021 15:32:24 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10123"; a="205420300"
X-IronPort-AV: E=Sophos;i="5.85,336,1624345200"; 
   d="scan'208";a="205420300"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2021 12:30:25 -0700
X-IronPort-AV: E=Sophos;i="5.85,336,1624345200"; 
   d="scan'208";a="438154658"
Received: from akleen-mobl1.amr.corp.intel.com (HELO [10.252.134.229]) ([10.252.134.229])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2021 12:30:24 -0700
Subject: Re: [PATCH v2 4/6] virtio: Initialize authorized attribute for
 confidential guest
To:     "Kuppuswamy, Sathyanarayanan" 
        <sathyanarayanan.kuppuswamy@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Dan Williams <dan.j.williams@intel.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Borislav Petkov <bp@alien8.de>, X86 ML <x86@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Jason Wang <jasowang@redhat.com>,
        Kuppuswamy Sathyanarayanan <knsathya@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux PCI <linux-pci@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        virtualization@lists.linux-foundation.org
References: <20210930010511.3387967-1-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20210930010511.3387967-5-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20210930065953-mutt-send-email-mst@kernel.org>
 <CAPcyv4hP6mtzKS-CVb-aKf-kYuiLM771PMxN2zeBEfoj6NbctA@mail.gmail.com>
 <6d1e2701-5095-d110-3b0a-2697abd0c489@linux.intel.com>
 <YVXWaF73gcrlvpnf@kroah.com>
 <1cfdce51-6bb4-f7af-a86b-5854b6737253@linux.intel.com>
From:   Andi Kleen <ak@linux.intel.com>
Message-ID: <291d5e03-ccaa-3a73-cdcd-66cbe80fede1@linux.intel.com>
Date:   Thu, 30 Sep 2021 12:30:23 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <1cfdce51-6bb4-f7af-a86b-5854b6737253@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


On 9/30/2021 12:04 PM, Kuppuswamy, Sathyanarayanan wrote:
>
>
> On 9/30/21 8:23 AM, Greg Kroah-Hartman wrote:
>> On Thu, Sep 30, 2021 at 08:18:18AM -0700, Kuppuswamy, Sathyanarayanan 
>> wrote:
>>>
>>>
>>> On 9/30/21 6:36 AM, Dan Williams wrote:
>>>>> And in particular, not all virtio drivers are hardened -
>>>>> I think at this point blk and scsi drivers have been hardened - so
>>>>> treating them all the same looks wrong.
>>>> My understanding was that they have been audited, Sathya?
>>>
>>> Yes, AFAIK, it has been audited. Andi also submitted some patches
>>> related to it. Andi, can you confirm.
>>
>> What is the official definition of "audited"?
>
>
> In our case (Confidential Computing platform), the host is an un-trusted
> entity. So any interaction with host from the drivers will have to be
> protected against the possible attack from the host. For example, if we
> are accessing a memory based on index value received from host, we have
> to make sure it does not lead to out of bound access or when sharing the
> memory with the host, we need to make sure only the required region is
> shared with the host and the memory is un-shared after use properly.
>
> Elena can share more details, but it was achieved with static analysis
> and fuzzing. Here is a presentation she is sharing about the work at the
> Linux Security Summit:
> https://static.sched.com/hosted_files/lssna2021/b6/LSS-HardeningLinuxGuestForCCC.pdf 
>
>
> Andi, can talk more about the specific driver changes that came out of 
> this
> effort.

The original virtio was quite easy to exploit because it put its free 
list into the shared ring buffer.

We had a patchkit to harden virtio originally, but after some discussion 
we instead switched to Jason Wang's patchkit to move the virtio metadata 
into protected memory, which fixed near all of the issues. These patches 
have been already merged. There is one additional patch to limit the 
virtio modes.

There's an ongoing effort to audit (mostly finished I believe) and fuzz 
the three virtio drivers (fuzzing is still ongoing).

There was also a range of changes outside virtio for code outside the 
device model. Most of it was just disabling it though.

-Andi

