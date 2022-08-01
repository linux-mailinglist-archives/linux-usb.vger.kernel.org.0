Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C342A586754
	for <lists+linux-usb@lfdr.de>; Mon,  1 Aug 2022 12:24:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230042AbiHAKYj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 1 Aug 2022 06:24:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229664AbiHAKYi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 1 Aug 2022 06:24:38 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3F2B13DD4
        for <linux-usb@vger.kernel.org>; Mon,  1 Aug 2022 03:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659349477; x=1690885477;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=ewKvWC6uM9foVGyJs49gyXcTgY6YgcXAYu7ys+DCO+Y=;
  b=Ny0AUY0r/fzB9xmFqAxrHqE4yt2xxJr5Jqb0BJL/jpWEngvXFoYcjUo2
   Z4NvtufB81fHl8ltiYmEJRl2ir5e0JK3uZB60ncp5qGtWF8VAZpmWQYFc
   PPZwsOiVysXle7IpJUVw+G7wwe8IzEr72HPI5tKZdI4ZEAW5hO5ZJZ9um
   jiXuNnP4Os1p4M+UKKhk1AEtoKjumERYXguwxQAvlEuPj79b9wSlUH+qK
   6kgl1X5hzgqEH3LbS+DwgndzwWNMoctthv5nhxcQabFT4Ph5qjkED+Y1L
   lvpz9H38OEJy820tMKRasSBg+9ej9u5mVgzUOXGjvcaNHagLrKmKPHl07
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10425"; a="290321648"
X-IronPort-AV: E=Sophos;i="5.93,206,1654585200"; 
   d="scan'208";a="290321648"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2022 03:24:37 -0700
X-IronPort-AV: E=Sophos;i="5.93,206,1654585200"; 
   d="scan'208";a="598894797"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.162])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2022 03:24:32 -0700
Received: by lahna (sSMTP sendmail emulation); Mon, 01 Aug 2022 13:24:30 +0300
Date:   Mon, 1 Aug 2022 13:24:30 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     =?utf-8?Q?=C5=81ukasz?= Bartosik <lb@semihalf.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        linux-usb@vger.kernel.org, upstream@semihalf.com
Subject: Re: [PATCH v2] thunderbolt: fix PCI device class after powering up
Message-ID: <Yuep3lpI02gWiJY9@lahna>
References: <20220729094022.186496-1-lb@semihalf.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220729094022.186496-1-lb@semihalf.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On Fri, Jul 29, 2022 at 11:40:22AM +0200, Łukasz Bartosik wrote:
> A thunderbolt
> lspci -d 8086:9a1b -vmmknn
> Slot:	00:0d.2
> Class:	System peripheral [0880]
> Vendor:	Intel Corporation [8086]
> Device:	Tiger Lake-LP Thunderbolt 4 NHI #0 [9a1b]
> 
> presents itself with PCI class 0x088000 after Chromebook boots.
> lspci -s 00:0d.2 -xxx
> 00:0d.2 System peripheral: Intel Corporation Tiger Lake-LP Thunderbolt 4
> NHI #0 (rev 01)
> 00: 86 80 1b 9a 00 00 10 00 01 00 80 08 00 00 00 00
> ...
> 
> However after thunderbolt is powered up in nhi_probe()
> its class changes to 0x0c0340
> lspci -s 00:0d.2 -xxx
> 00:0d.2 System peripheral: Intel Corporation Tiger Lake-LP Thunderbolt 4
> NHI #0 (rev 01)
> 00: 86 80 1b 9a 06 04 10 00 01 40 03 0c 00 00 00 00
> ...
> 
> which leaves pci_dev structure with old class value
> cat /sys/bus/pci/devices/0000:00:0d.2/class
> 0x088000

This is completely unexpected. Which Chromebook this is and have you
tried to upgrade it to the latest?

> This fix updates PCI device class in pci_dev structure after
> thunderbolt is powered up.

I think we need to understand why this happens in the first place before
doing anything else.
