Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 55C8B6B0C47
	for <lists+linux-usb@lfdr.de>; Wed,  8 Mar 2023 16:15:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231940AbjCHPOu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 8 Mar 2023 10:14:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230342AbjCHPOs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 8 Mar 2023 10:14:48 -0500
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79BEAB5B44
        for <linux-usb@vger.kernel.org>; Wed,  8 Mar 2023 07:14:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678288487; x=1709824487;
  h=message-id:date:mime-version:to:cc:references:from:
   subject:in-reply-to:content-transfer-encoding;
  bh=x7RzDVBoZyr197rNFkEh9BFoQNvwCK5Nv5p0hfcKImk=;
  b=Ncj6Cg5kCyVS9hLaOWZqYioeEBIS5Udpo0Xv5eq6f0ESPmeeR5bGY0vg
   DShFJ2EutFNtG8dqpFCbUqaEk9H3E+Zwz8c8SwLWeDIDUlor2xJq323ay
   fGNPRmxXiwF5k77nVu5gkHzshXcIVtggqciKzGFAIFEYMJ+xXgx286PD3
   Xursj2PrCBTRy+Tw79jdAPMGY1q34WmA8QHKVWMMcafYy1+bCdW2a66AP
   sfUQyGyN67fi+4zKHYapzvlnTPw2ZIMYxCMaUD4KzZchuuiX/kaGnB01V
   v9uqFVPNM+83edTNr1TyESThMFjzclXA/HLJwUXXkg6cZ1qnhPZPSWqBr
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="336192953"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; 
   d="scan'208";a="336192953"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2023 07:14:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="677014210"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; 
   d="scan'208";a="677014210"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by orsmga002.jf.intel.com with ESMTP; 08 Mar 2023 07:14:45 -0800
Message-ID: <db2e0984-6eb5-5987-44e1-a7143141469b@linux.intel.com>
Date:   Wed, 8 Mar 2023 17:16:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.7.1
To:     Brian Morrison <bdm@fenrir.org.uk>, mathias.nyman@intel.com
Cc:     linux-usb@vger.kernel.org
References: <20230307132120.5897c5af@deangelis.fenrir.org.uk>
Content-Language: en-US
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: USB regression in kernel 6.2.2
In-Reply-To: <20230307132120.5897c5af@deangelis.fenrir.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 7.3.2023 15.21, Brian Morrison wrote:
> Hello Mathias (sorry you're getting this twice).
> 
> Re-send after linux-usb list rejection (too big).
> 
> Hans de Goede replied to my Fedora kernel bug here:
> 
> https://bugzilla.redhat.com/show_bug.cgi?id=2175534
> 
> suggesting that I contact you about it and Cc: the linux-usb list.
> 
> Starting with kernel-6.2.2-300 on Fedora x86_64 (the first 6.2 kernel on
> Fedora 37) I am seeing problems with USB devices on a Renesas
> ROM-based USB PCI card which works normally with kernel-6.1.15-200 and
> earlier 6.x kernels, essentially the USB 2.0 device tree on this card's
> bus is not being enumerated with the result that my /dev/ttyUSB*
> devices are no longer present (these are Silicon Labs CP210x UARTS with
> TI PCM290x devices behind them).
> 
> I have attached the lsusb -t output for the working and broken cases, I
> don't know where the problem lies but I suspect it's not udev because
> the configuration is unchanged, it seems to be in the kernel usb code.
> 
> There are further attachments in the bug referred to above, I don't
> know if they help but you can look there if the lsusb output is
> insufficient, I can point out that lsmod does show the cp210x module is
> loaded which may provide a clue about where things are failing.
> 
> Thanks for reading this, I look forward to hearing your suggestions.
> 

Looks like that those devices initially enumerated fine, but suddenly
disconnect about 19 seconds after boot.

[   19.155556] usb 2-1.1: USB disconnect, device number 4
[   19.155685] cp210x ttyUSB0: cp210x converter now disconnected from ttyUSB0
[   19.159290] usb 2-1.4: USB disconnect, device number 6
[   19.242344] usb 2-1.4: 3:0: failed to get current value for ch 0 (-22)
[   20.100761] usb 2-4.1: USB disconnect, device number 8
[   20.100894] cp210x ttyUSB1: cp210x converter now disconnected from ttyUSB1
[   20.100999] cp210x 2-4.1:1.0: device disconnected
[   20.107188] usb 2-4.2: USB disconnect, device number 9
[   20.107253] cp210x ttyUSB2: cp210x converter now disconnected from ttyUSB2
[   20.107284] cp210x 2-4.2:1.0: device disconnected
[   20.111938] usb 2-4.4: USB disconnect, device number 10
[   20.181363] usb 2-4.4: 3:0: failed to get current value for ch 0 (-22)

Interestingly those are all the devices behind external hubs.

Bisecting this to find the offending commit would be best, but a dmesg
with xhci and usb core dynamic debug enabled could also show why those devices
disconnect.

Adding "usbcore.dyndbg=+p xhci_hcd.dyndbg=+p" to your kernel cmdline
should do this.

Thanks
Mathias

