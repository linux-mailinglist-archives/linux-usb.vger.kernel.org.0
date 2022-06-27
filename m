Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98B4C55D3FA
	for <lists+linux-usb@lfdr.de>; Tue, 28 Jun 2022 15:13:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234488AbiF0LSk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 27 Jun 2022 07:18:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234474AbiF0LSk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 27 Jun 2022 07:18:40 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79479654C
        for <linux-usb@vger.kernel.org>; Mon, 27 Jun 2022 04:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656328719; x=1687864719;
  h=message-id:date:mime-version:to:references:from:subject:
   in-reply-to:content-transfer-encoding;
  bh=iC6Bb+nmBNBwNqtyT/Gc9b+41mbMagvJSQU011GSAIc=;
  b=h+lxUsbLXJwHlsQlIk8A6nmETzjpypyLAo1ncTl+Y+GtG/NCo61eaLDw
   b8EVDNGc8TIQXEG6SD85IZKUmCMrwFjy4K8msR2ih0wLdw57Rqv62R6Ag
   sm0fgkS8NIb3XVMRD8CA0OZI65xCImfSS2lj5r1JW5tmmUQAhr6LzciFB
   +AQ7/2vI8sDbxU1wsOOymT2F0+1dL/kkAWi4cDLhZ+egD1RDf8kox5brv
   aOJI1umQF11S+tCtPrW/N/I9ITTd34eVghwJZW29ntq+aKROrY7ipP5y+
   3G8jMR8jFeViSYvO5qJjvUHsg/doZqqpw2YPFP6d5ncCjpm22uAT2SAMT
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10390"; a="264469807"
X-IronPort-AV: E=Sophos;i="5.92,226,1650956400"; 
   d="scan'208";a="264469807"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2022 04:18:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,226,1650956400"; 
   d="scan'208";a="732274577"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by fmsmga001.fm.intel.com with ESMTP; 27 Jun 2022 04:18:38 -0700
Message-ID: <c4efa4a8-7ad6-e0f7-0c3b-73ddc31b2353@linux.intel.com>
Date:   Mon, 27 Jun 2022 14:20:10 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.8.1
Content-Language: en-US
To:     bugzilla-daemon@kernel.org, linux-usb@vger.kernel.org
References: <bug-216171-208809@https.bugzilla.kernel.org/>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [Bug 216171] New: Hibernation not working because of xhci_hcd
In-Reply-To: <bug-216171-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 25.6.2022 20.19, bugzilla-daemon@kernel.org wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=216171
> 
>              Bug ID: 216171
>             Summary: Hibernation not working because of xhci_hcd
>             Product: Drivers
>             Version: 2.5
>      Kernel Version: 5.18.6-arch1-1
>            Hardware: All
>                  OS: Linux
>                Tree: Mainline
>              Status: NEW
>            Severity: normal
>            Priority: P1
>           Component: USB
>            Assignee: drivers_usb@kernel-bugs.kernel.org
>            Reporter: prz.kopa@gmail.com
>          Regression: No
> 
> Created attachment 301268
>    --> https://bugzilla.kernel.org/attachment.cgi?id=301268&action=edit
> Dmesg log with failed hibernation attempt
> 
> Starting from 5.18.4 my notebook (Dell Latitude 3340) won't hibernate -
> hibernation fails with dmesg errors related to xhci_hcd. I'm attaching dmesg
> log with failed hibernation attempt. Problem goes away after reverting commit
> 63acaa8e9c65dc34dc249440216f8e977f5d2748 (USB: hcd-pci: Fully suspend across
> freeze/thaw cycle). After reverting this commit on linux 5.18.6 my system can
> again successfully hibernate.
> 

Looks like there is a pending wakeup:

[   30.475168] xhci_hcd 0000:00:14.0: PM: pci_pm_freeze(): hcd_pci_suspend+0x0/0x30 returns -16

Guessing suspend_common() in hcd-pci.c retruns -EBUSY because HCD_WAKEUP_PENDING(hcd) flag is set.

Does xhci dynamic debug show some port event before this?

mount -t debugfs none /sys/kernel/debug
echo 'module xhci_hcd =p' >/sys/kernel/debug/dynamic_debug/control
echo 'module usbcore =p' >/sys/kernel/debug/dynamic_debug/control

Thanks
-Mathias
