Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 432774E69F1
	for <lists+linux-usb@lfdr.de>; Thu, 24 Mar 2022 21:46:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354091AbiCXUql (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 24 Mar 2022 16:46:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354090AbiCXUql (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 24 Mar 2022 16:46:41 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB6D0B91B4
        for <linux-usb@vger.kernel.org>; Thu, 24 Mar 2022 13:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648154708; x=1679690708;
  h=to:cc:references:from:subject:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=zu+gYtD2+KcE/K52Or4TrL/smYI3UwGe+DLSnR2LqZw=;
  b=liWhz2ElYWtUamjdwW0q0QU5C5yCxgLVidhhTgPe87MS4hIZdT6Z2b4Y
   ana6GjBfmEGUr5wJFdE8zqmroazztmZXkyUIO3yMZYr7xRi20MbFGt0aZ
   mNmk5g73eQs4zIzJju3g9QMsf732kA2H3svXFRpgOz36ZhrWj2fk34U+T
   PW5sjAI6AJsJtjE4ef8FPKP7hlsXNqgETi+kTjo3If8w7Du5hihabPtwN
   AYPwrUSnf8K9q1jCWTkNbl/6ljV0+C+FA7P09HS3F6dGBwTSyh6UNEc2e
   S2sM4Tv7yeDxI+P8b1UdEVi1Zjm77UkVgq+Ga6ZCJHrZPlut5nOzoxrHv
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10296"; a="258195451"
X-IronPort-AV: E=Sophos;i="5.90,208,1643702400"; 
   d="scan'208";a="258195451"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2022 13:45:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,208,1643702400"; 
   d="scan'208";a="649996811"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by orsmga004.jf.intel.com with ESMTP; 24 Mar 2022 13:45:05 -0700
To:     Heiner Kallweit <hkallweit1@gmail.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Linux USB Mailing List <linux-usb@vger.kernel.org>,
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Jack Pham <quic_jackp@quicinc.com>,
        Tung Nguyen <tunguyen@apm.com>
References: <0684616b-5cc0-e9f6-7015-ce709c6d4386@gmail.com>
 <cd18385f-cc94-45fc-4a39-60e05dd6031e@linux.intel.com>
 <73b6b3aa-b38e-bf28-59e0-7c58afaadf9d@gmail.com>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [PATCH v2 0/5] usb: host: xhci-plat: omit shared hcd if either of
 the root hubs has no ports
Message-ID: <7ab8d931-2b48-5297-4b2e-2d5ac0149428@linux.intel.com>
Date:   Thu, 24 Mar 2022 22:46:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <73b6b3aa-b38e-bf28-59e0-7c58afaadf9d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 24.3.2022 21.38, Heiner Kallweit wrote:
> On 24.03.2022 10:23, Mathias Nyman wrote:
>> On 17.3.2022 0.08, Heiner Kallweit wrote:
>>> I have a system with a low-cost Amlogic S905W SoC that supports USB3
>>> but has a USB3 root hub with no ports. This results in an error
>>> message and a hcd that is good for nothing. The USB2 root hub has
>>> ports and works normally.
>>> I think we can do better and omit creating a shared hcd if either of
>>> the root hubs has no ports. This series is based on discussion [0].
>>>
>>> The series works as intended for me. What I couldn't test is the case
>>> of the USB2 root hub having no ports.
>>>
>>> Follow-up to this series could be applying the xhci-plat extension
>>> to other xhci drivers.
>>>
>>
>> Thanks,
>> Patches look good but something must have changed since you submitted them.
>> I can't apply them neatly on usb-next, usb-linus, 5.17, or 5.17-rc8
>>
>>
>> On top of usb-next I get:
>> Applying: usb: host: xhci-plat: create shared hcd after having added main hcd
>> error: patch failed: drivers/usb/host/xhci-plat.c:313
>> error: drivers/usb/host/xhci-plat.c: patch does not apply
>> Patch failed at 0003 usb: host: xhci-plat: create shared hcd after having added main hcd
>>
> The series was based on linux-next. Seems you're missing 8e10548f7f48
> ("Revert "usb: host: xhci: mvebu: make USB 3.0 PHY optional for Armada 3720"").
> 
>> -Mathias
> 
> Heiner
> 

Thanks, applies fine on linux-next.

I'll add these after 5.18-rc1 to my own tree, and try them out by faking a one roothub
PCI xhci device. Patches should end up in 5.19 if all goes well.

-Mathias 

