Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5ACDA1346BD
	for <lists+linux-usb@lfdr.de>; Wed,  8 Jan 2020 16:54:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728834AbgAHPyv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 8 Jan 2020 10:54:51 -0500
Received: from mga03.intel.com ([134.134.136.65]:29686 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728499AbgAHPyv (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 8 Jan 2020 10:54:51 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 08 Jan 2020 07:54:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,410,1571727600"; 
   d="scan'208";a="303589888"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.170]) ([10.237.72.170])
  by orsmga001.jf.intel.com with ESMTP; 08 Jan 2020 07:54:49 -0800
Subject: Re: [RFT PATCH] xhci: Fix memory leak when caching protocol extended
 capability PSI tables
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     pmenzel@molgen.mpg.de, mika.westerberg@linux.intel.com,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <572bea6f-06d4-938a-802e-93386acf59d9@linux.intel.com>
 <20200108151730.21022-1-mathias.nyman@linux.intel.com>
 <20200108154008.GA2448418@kroah.com>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Message-ID: <9e91c6a7-94a5-6ed7-22c7-ebc956403e8f@linux.intel.com>
Date:   Wed, 8 Jan 2020 17:56:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200108154008.GA2448418@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 8.1.2020 17.40, Greg KH wrote:
> On Wed, Jan 08, 2020 at 05:17:30PM +0200, Mathias Nyman wrote:
>> xhci driver assumed that xHC controllers have at most one custom
>> supported speed table (PSI) for all usb 3.x ports.
>> Memory was allocated for one PSI table under the xhci hub structure.
>>
>> Turns out this is not the case, some controllers have a separate
>> "supported protocol capability" entry with a PSI table for each port.
>> This means each usb3 port can in theory support different custom speeds.
> 
> Is there a "max" number of port capabilities that can happen?  Or this
> this truely dynamic?

Almost truly dynamic, each capability points to the next, last points to 0

But we can't have more "supported protocol capabilities" than xHC ports.
(MaxPorts value in xHC HCSPARAMS1 register)

> 
>> +	for (i = 0; i < xhci->num_port_caps; i++) {
>> +		kfree(xhci->port_caps[i].psi);
>> +		xhci->port_caps[i].psi = NULL;
>> +	}
> 
> Nit, no need to set to NULL here :)

Thanks, will remove that

-Mathias

