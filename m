Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D1ED7126C5
	for <lists+linux-usb@lfdr.de>; Fri, 26 May 2023 14:36:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236740AbjEZMgy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 26 May 2023 08:36:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229628AbjEZMgx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 26 May 2023 08:36:53 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F0F79E
        for <linux-usb@vger.kernel.org>; Fri, 26 May 2023 05:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685104612; x=1716640612;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=qJ9NEdmoD0M8iqxnVtoe8RU02DGfmCPxktHGW/rUqr0=;
  b=b5/KY1S07cXy8RahpzanPX/HJoiocJ27c/YgIBVo/rWn5rOr53QK1cKq
   4UoJ4ut5uJ5s3UNjQOrtgwTerW7L/FZoarYpYyUyw6zX/H3XgJcP1cLqy
   Fcjza6OuZtOzBZE38doRfHDyJ5dV84XtWUtEHf3OOjb6yTJc6oltUNmqJ
   veur900gW8VctSuTfen1FXQyK/Qlv8KCHCfJEDbI5GUCfn1EsipUH1CgV
   7IuYMTREyNMGYJTkgshfW0jSGuTplG90aWRUD/KM2V+cMkpMF4BkBkF7s
   vioPdu+l6t2daMcNXvaj0na002Ixe4XLctslaOLm0YpKjVa5QUgPNydhY
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="353033996"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; 
   d="scan'208";a="353033996"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2023 05:36:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="1035350871"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; 
   d="scan'208";a="1035350871"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga005.fm.intel.com with ESMTP; 26 May 2023 05:36:51 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 53366413; Fri, 26 May 2023 15:36:55 +0300 (EEST)
Date:   Fri, 26 May 2023 15:36:55 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Christian =?utf-8?Q?Schaubschl=C3=A4ger?= 
        <christian.schaubschlaeger@gmx.at>
Cc:     linux-usb@vger.kernel.org,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: USB issue on a TB4 controller?
Message-ID: <20230526123655.GW45886@black.fi.intel.com>
References: <a45b9989-c9da-bf4e-94c8-3e1341777b4d@gmx.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a45b9989-c9da-bf4e-94c8-3e1341777b4d@gmx.at>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On Tue, May 23, 2023 at 01:15:30PM +0200, Christian Schaubschläger wrote:
> Hi Mika,
> 
> attached you find two dmesg logs (with tunderbolt.dyndbg=+p), one from power off state were everything is ok (dmesg_ok.txt.xz).
> The second one (dmesg_nok.txt.xz) is after a reboot when the network interface is in faulty state.
> 
> Hardware is:
> Dell Inc. Latitude 7440/0XDRJY, BIOS 1.3.1 04/25/2023
> CPU0: 13th Gen Intel(R) Core(TM) i5-1345U (family: 0x6, model: 0xba, stepping: 0x3)
> thunderbolt 0-1: Dell WD19TB Thunderbolt Dock

Sorry for the delay. I've been busy with some other issues.

I guess we are talking about this xHCI:

[   15.449690] xhci_hcd 0000:04:00.0: xHCI Host Controller
[   15.450477] xhci_hcd 0000:04:00.0: new USB bus registered, assigned bus number 3
[   15.452337] xhci_hcd 0000:04:00.0: hcc params 0x200077c1 hci version 0x110 quirks 0x00
00000200009810
[   15.453734] xhci_hcd 0000:04:00.0: xHCI Host Controller
[   15.454437] xhci_hcd 0000:04:00.0: new USB bus registered, assigned bus number 4
[   15.455092] xhci_hcd 0000:04:00.0: Host supports USB 3.1 Enhanced SuperSpeed

In both cases the the SuperSpeed HUB is found:

[    5.589178] usb 4-2.3: new SuperSpeed USB device number 3 using xhci_hcd
[    5.622113] input: HDA Intel PCH Headphone Mic as /devices/pci0000:00/0000:00:1f.3/soun
d/card0/input27
[    5.635536] hub 4-2.3:1.0: USB hub found
[    5.637176] hub 4-2.3:1.0: 4 ports detected

However, the connected NIC is only found in dmesg_ok.txt.xz:

[    5.904363] usb 4-2.4: new SuperSpeed USB device number 4 using xhci_hcd
...
[    6.192613] r8152-cfgselector 4-2.4: reset SuperSpeed USB device number 4 using xhci_hcd
[    6.217838] r8152 4-2.4:1.0 (unnamed net_device) (uninitialized): Using pass-thru MAC addr ac:91:a1:95:63:bf
[    6.258478] r8152 4-2.4:1.0: load rtl8153b-2 v1 10/23/19 successfully
[    6.318568] r8152 4-2.4:1.0 eth0: v1.12.13

To me it looks like the PCIe tunnel to the xHCI (0000:04:00.0) on the
dock works fine, otherwise it would not show up at all. I'm not an xHCI
expert so adding Mathias in case he has ideas how to debug this further.

I think it makes sense to enable xHCI debugging and traces and provide
them to Mathias. The following commands should do so:

 # echo 'module xhci_hcd =p' >/sys/kernel/debug/dynamic_debug/control
 # echo 'module usbcore =p' >/sys/kernel/debug/dynamic_debug/control
 # echo 81920 > /sys/kernel/debug/tracing/buffer_size_kb
 # echo 1 > /sys/kernel/debug/tracing/events/xhci-hcd/enable

Trace buffer is /sys/kernel/debug/tracing/trace.
