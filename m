Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 14D804D1A97
	for <lists+linux-usb@lfdr.de>; Tue,  8 Mar 2022 15:30:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347406AbiCHOba (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Mar 2022 09:31:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240963AbiCHOb3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 8 Mar 2022 09:31:29 -0500
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B57E4BFD8
        for <linux-usb@vger.kernel.org>; Tue,  8 Mar 2022 06:30:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646749832; x=1678285832;
  h=to:cc:references:from:subject:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=2Sps8X1HSq/Qaa9m9NyJst+99og+nqY0X6PFuAEuS8I=;
  b=FPBe8d6ZJ5k0Xkh3sLXmIdUqfDvQtbPul7SbaxlunhzuTkEcKmqRoSnL
   /b7MlMojn8DLcHY1sar8KkYHJj0RYoLnSymmM3j37M1zwLfwciKDO+vt+
   ssteYh5R4nEnnsGRUSpJdhoLzHVoGy+C/VDf24ruokQAWS5Ta85IMNEYJ
   jhj3/R2NqvdOOUYANiogSD4SagyIjc6UnJwMV95SXcC4fe3EAaB75Kx79
   +jexHHaJeF8Lv4chTNo9phhX8qetr1fjnvpcH2jPf2hPZ3Hs7uqyClSg1
   eHCl7iDSzkIUkN0VPPszFvyYVww04NOfYuG1ym0SUAoySM53MGOsBupJY
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10279"; a="254884507"
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400"; 
   d="scan'208";a="254884507"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2022 06:29:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400"; 
   d="scan'208";a="578005703"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by orsmga001.jf.intel.com with ESMTP; 08 Mar 2022 06:29:55 -0800
To:     Heiner Kallweit <hkallweit1@gmail.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Linux USB Mailing List <linux-usb@vger.kernel.org>,
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Jack Pham <quic_jackp@quicinc.com>,
        Tung Nguyen <tunguyen@apm.com>
References: <18a93669-7f7a-dad8-38f4-44819fc3b64a@gmail.com>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [PATCH 0/5] usb: host: xhci-plat: omit shared hcd if either of
 the root hubs has no ports
Message-ID: <475816a5-8349-67c4-1d1f-c1b64149bab5@linux.intel.com>
Date:   Tue, 8 Mar 2022 16:31:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <18a93669-7f7a-dad8-38f4-44819fc3b64a@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 4.3.2022 20.32, Heiner Kallweit wrote:
> I have a system with a low-cost Amlogic S905W SoC that supports USB3
> but has a USB3 root hub with no ports. This results in an error
> message and a hcd that is good for nothing. The USB2 root hub has
> ports and works normally.
> I think we can do better and omit creating a shared hcd if either of
> the root hubs has no ports. This series is based on discussion [0].
> 
> The series works as intended for me. What I couldn't test is the case
> of the USB2 root hub having no ports.
> 
> [0] https://www.spinics.net/lists/linux-usb/msg223416.html
> 

Thanks for the series. Big picture looks good.

Some minor concerns, for example how the generic xhci code now assumes
we can start the controller (run) after adding the primary hcd if only
one roothub has ports, and assumes the secondary hcd won't be added.

After this series this is true for controllers using xhci-plat.c,
but not for mediatek, tegra and all PCI xhci controllers.
I'll comment that patch with more info.

I'll see if I can try to fake a pci xhci controller to try this series out.

Thanks
-Mathias

