Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25D082FAEE2
	for <lists+linux-usb@lfdr.de>; Tue, 19 Jan 2021 03:45:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394316AbhASCpq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 18 Jan 2021 21:45:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387605AbhASCpp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 18 Jan 2021 21:45:45 -0500
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15AD0C061573
        for <linux-usb@vger.kernel.org>; Mon, 18 Jan 2021 18:45:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=mR8oLEeg18czdbKXEZL+4tUmHcYN5LaoMXBI59LPQmc=; b=EqyI4K0VIYuDMmNjPf3yP4P9PA
        AQXyZMtlpRnDNpCayjkjkdFepSYIpXT7vs6Ywo71cgkkNWv6fdfno7DwIfj30umexdb3UpqojvkSq
        uVnHzZOqVRTu++FuSBwX2cL1+cy1mBUN/F22yiVih0Pt7p84V8ZO0HgpUX3ue3KeY8QZCtv3uFInh
        XsXQBi4QhMexjzXAmSm5Ynot/nT0SY53a0pvd5fkeOdhgdp+G1SkIrD7RFcz9K9c6vQ2S6wRmTfAO
        V2Y5XddS6YfvNsgt1dNd8W/mJ8WuXtIRBuJySsIFMzoPgF3GAfupIqHNgw3L67Mw8SuUrPbrxIUIy
        JYUlXfTQ==;
Received: from [2601:1c0:6280:3f0::9abc]
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1l1h0u-0005ID-1w; Tue, 19 Jan 2021 02:45:00 +0000
Subject: Re: [linux-next:master 2519/4500] ucsi.c:undefined reference to
 `fwnode_usb_role_switch_get'
To:     Jack Pham <jackp@codeaurora.org>,
        kernel test robot <lkp@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Mayank Rana <mrana@codeaurora.org>, kbuild-all@lists.01.org,
        Linux Memory Management List <linux-mm@kvack.org>,
        USB list <linux-usb@vger.kernel.org>
References: <202101181814.rQtj0Eqo-lkp@intel.com>
 <20210118204040.GA19773@jackp-linux.qualcomm.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <96a4a684-998f-8b8e-4b19-ec690c4dfde9@infradead.org>
Date:   Mon, 18 Jan 2021 18:44:52 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210118204040.GA19773@jackp-linux.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

[adding linux-usb list]

On 1/18/21 12:40 PM, Jack Pham wrote:
> On Mon, Jan 18, 2021 at 06:52:23PM +0800, kernel test robot wrote:
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
>> head:   93bf8b946e5f9a0b0c68155597b53fd8ccce2827
>> commit: 89795852c9c46b9b0701f7376d30a1c5ab4d146c [2519/4500] usb: typec: ucsi: Add support for USB role switch
>> config: nios2-randconfig-m031-20210118 (attached as .config)
>> compiler: nios2-linux-gcc (GCC) 9.3.0
>> reproduce (this is a W=1 build):
>>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>>         chmod +x ~/bin/make.cross
>>         # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=89795852c9c46b9b0701f7376d30a1c5ab4d146c
>>         git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>>         git fetch --no-tags linux-next master
>>         git checkout 89795852c9c46b9b0701f7376d30a1c5ab4d146c
>>         # save the attached .config to linux build tree
>>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=nios2 
>>
>> If you fix the issue, kindly add following tag as appropriate
>> Reported-by: kernel test robot <lkp@intel.com>
>>
>> All errors (new ones prefixed by >>):
>>
>>    nios2-linux-ld: drivers/usb/typec/ucsi/ucsi.o: in function `ucsi_register_port':
>>>> ucsi.c:(.text+0x15a8): undefined reference to `fwnode_usb_role_switch_get'
>>    ucsi.c:(.text+0x15a8): relocation truncated to fit: R_NIOS2_CALL26 against `fwnode_usb_role_switch_get'
>>>> nios2-linux-ld: ucsi.c:(.text+0x15e8): undefined reference to `usb_role_switch_set_role'
>>    ucsi.c:(.text+0x15e8): relocation truncated to fit: R_NIOS2_CALL26 against `usb_role_switch_set_role'
>>    nios2-linux-ld: drivers/usb/typec/ucsi/ucsi.o: in function `ucsi_handle_connector_change':
>>>> ucsi.c:(.text+0x1b50): undefined reference to `usb_role_switch_set_role'
>>    ucsi.c:(.text+0x1b50): relocation truncated to fit: R_NIOS2_CALL26 against `usb_role_switch_set_role'
>>    nios2-linux-ld: ucsi.c:(.text+0x1c28): undefined reference to `usb_role_switch_set_role'
>>    ucsi.c:(.text+0x1c28): relocation truncated to fit: R_NIOS2_CALL26 against `usb_role_switch_set_role'
>>
>> Kconfig warnings: (for reference only)
>>    WARNING: unmet direct dependencies detected for SERIAL_CORE_CONSOLE
>>    Depends on TTY && HAS_IOMEM
>>    Selected by
>>    - EARLY_PRINTK
>>
>> ---
>> 0-DAY CI Kernel Test Service, Intel Corporation
>> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
> 
> I have no clue about the nios2, so not sure if this is an arch-specific
> linker error or not.
> 
> Hmm but the .config has the following:
> 
> CONFIG_TYPEC_UCSI=y
> CONFIG_USB_ROLE_SWITCH=m
> 
> So I'm guessing this patch also requires a Kconfig change to disallow
> the above combination? If so, should UCSI have a "depends" or a "select"
> on USB_ROLE_SWITCH?

Hm, there is certainly a mixture of depends and selects in the kernel source
tree. I would say "depends", based on Documentation/kbuild/kconfig-language.rst:
("->" added for emphasis)

  Note:
	select should be used with care. select will force
	a symbol to a value without visiting the dependencies.
	By abusing select you are able to select a symbol FOO even
	if FOO depends on BAR that is not set.
->	In general use select only for non-visible symbols
->	(no prompts anywhere) and for symbols with no dependencies.
	That will limit the usefulness but on the other hand avoid
	the illegal configurations all over.


-- 
~Randy
You can't do anything without having to do something else first.
-- Belefant's Law
