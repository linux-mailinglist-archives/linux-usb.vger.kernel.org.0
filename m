Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D95163B671
	for <lists+linux-usb@lfdr.de>; Mon, 10 Jun 2019 15:51:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390387AbfFJNvF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 Jun 2019 09:51:05 -0400
Received: from mga05.intel.com ([192.55.52.43]:43786 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390306AbfFJNvF (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 10 Jun 2019 09:51:05 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 10 Jun 2019 06:51:05 -0700
X-ExtLoop1: 1
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.164]) ([10.237.72.164])
  by orsmga007.jf.intel.com with ESMTP; 10 Jun 2019 06:51:03 -0700
Subject: Re: [PATCH 4/5] usb: xhci: dbc: Add a dbc raw driver to provide a raw
 interface on DbC
To:     Greg KH <gregkh@linuxfoundation.org>,
        Prabhat Chand Pandey <prabhat.chand.pandey@intel.com>
Cc:     linux-usb@vger.kernel.org, mathias.nyman@intel.com,
        rajaram.regupathy@intel.com, abhilash.k.v@intel.com,
        m.balaji@intel.com
References: <20190607063306.5612-1-prabhat.chand.pandey@intel.com>
 <20190607063306.5612-5-prabhat.chand.pandey@intel.com>
 <20190607142132.GG14665@kroah.com>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Message-ID: <af51b855-4ee4-9bc2-6484-b8c4d897f503@linux.intel.com>
Date:   Mon, 10 Jun 2019 16:53:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190607142132.GG14665@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 7.6.2019 17.21, Greg KH wrote:
> On Fri, Jun 07, 2019 at 12:03:05PM +0530, Prabhat Chand Pandey wrote:
>> From: Abhilash K V <abhilash.k.v@intel.com>
>>
>> This patch provides a raw device interface on xhci Debug capability.
> 
> What is a "raw device"?
> 
>> This abstracts dbc functionality to user space inorder to facilitate
>> various frameworks to utilize xhci debug capability.
> 
> I do not understand this sentance at all.  Please provide a lot more
> information.
> 
>> It helps to render the target as an usb debug class device on host and
>> establish an usb connection by providing two bulk endpoints.
> 
> provide bulk endpoints where?  To send data where?  This is very
> confusing and does not make any sense to me...
> 
> 
>>
>> [don't dynamically allocate tiny space for name only -Mathias]
>> Signed-off-by: Rajaram Regupathy <rajaram.regupathy@intel.com>
>> Signed-off-by: Prabhat Chand Pandey <prabhat.chand.pandey@intel.com>
>> Signed-off-by: Abhilash K V <abhilash.k.v@intel.com>
>> Acked-by: Mathias Nyman <mathias.nyman@linux.intel.com>
>> ---
...
> 
> So you have a new char device, with a undocumented and unknown format of
> data flowing across it to the device.  How in the world are we supposed
> to use this thing?  Where is it documented?  What does it do?  How can
> you use it?
> 
> I don't mean to be so harsh here, but come on people, this stuff needs a
> lot more background documentation, information, and explaination as to
> exactly why in the world we need any of this, and what it even does!
> 
> Also, you need to fix the code, it doesn't work as pointed out in a few
> places :)
> 

Thanks for going through this.
It's now clear this is far from ready.
I need to re-evaluate my position on this, not just the code and the documentation,
but the usefulness of it all.

-Mathias
