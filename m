Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E93AF721DF8
	for <lists+linux-usb@lfdr.de>; Mon,  5 Jun 2023 08:19:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229656AbjFEGTk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 5 Jun 2023 02:19:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229613AbjFEGTj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 5 Jun 2023 02:19:39 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F769DA
        for <linux-usb@vger.kernel.org>; Sun,  4 Jun 2023 23:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685945978; x=1717481978;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=oiIBAdEM2IK2w6PdLkL3TtIlZfqaE92lEBQS+imifLI=;
  b=TmfO0QEo8b9+JAzaKUvdCp8YjyhZn/UpCXerKviofiahhFng8GUK4RJS
   uvdZE0xr05W3o5DF/iJUGQtyZpRBAAT787M1N6iHHoBOTgLS9hdTvoYCk
   nt2+zH0SijbbFgboF27wpFay2gRHFGfau9EhixYFQmTnUx5Ydy8UP+z+G
   C2ff1/2pj8AgWYxpXIz8QN9UWeb+cesH/nNwYEdRbIat94q9cXYZa9+iq
   +0t+yEMxGM576/EGA+GZGfyLS6rmgd33v9JgrpqFr9fHrjlRA++AFBrmM
   T/PYROlooIsV/ZxlurchRuMrYOJEhb/zSmgcr8X6arXnBD/uw9Z2Yeyy3
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10731"; a="336647234"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; 
   d="scan'208";a="336647234"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2023 23:19:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10731"; a="708538558"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; 
   d="scan'208";a="708538558"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga002.jf.intel.com with ESMTP; 04 Jun 2023 23:19:35 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 32571204; Mon,  5 Jun 2023 09:19:41 +0300 (EEST)
Date:   Mon, 5 Jun 2023 09:19:41 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Yehezkel Bernat <yehezkelshb@gmail.com>
Cc:     linux-usb@vger.kernel.org, Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Utkarsh H Patel <utkarsh.h.patel@intel.com>
Subject: Re: [PATCH 3/3] thunderbolt: Enable/disable sideband depending on
 USB4 port offline mode
Message-ID: <20230605061941.GR45886@black.fi.intel.com>
References: <20230602091055.65049-1-mika.westerberg@linux.intel.com>
 <20230602091055.65049-4-mika.westerberg@linux.intel.com>
 <CA+CmpXs2K8Bi2xHk_hhWC3x6rVeTQ=SbtjuxLSBV+3rjHRwxVQ@mail.gmail.com>
 <20230604051136.GQ45886@black.fi.intel.com>
 <CA+CmpXtNgVRrOdJyTvcyPSxa9jxkNjQvPbGtmbSickL7QFwYPA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+CmpXtNgVRrOdJyTvcyPSxa9jxkNjQvPbGtmbSickL7QFwYPA@mail.gmail.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On Sun, Jun 04, 2023 at 12:16:18PM +0300, Yehezkel Bernat wrote:
> On Sun, Jun 4, 2023 at 8:11 AM Mika Westerberg
> <mika.westerberg@linux.intel.com> wrote:
> >
> > Hi,
> >
> > On Sat, Jun 03, 2023 at 10:24:38PM +0300, Yehezkel Bernat wrote:
> > > On Fri, Jun 2, 2023 at 12:11 PM Mika Westerberg
> > > <mika.westerberg@linux.intel.com> wrote:
> > > >
> > > > When USB4 port is in offline mode (this mean there is no device
> > > > attached) we want to keep the sideband up to make it possible to
> > > > communicate with the retimers. In the same way there is no need to
> > > > enable sideband transactions when the USB4 port is not offline as they
> > > > are already up.
> > > >
> > > > For this reason make the enabling/disabling depend on the USB4 port
> > > > offline status.
> > >
> > > I'm probably missing something here, but if we don't allow disabling it when the
> > > port is offline, and when the port is online the sideband is enabled, when can
> > > it be disabled? If we can manually disable it when the port is online, on
> > > enablement we can't assume that it's already enabled just because the port
> > > is online, as we might have manually disabled it earlier.
> >
> > We allow disabling them when the port is online. This all basically
> > separates how the device attached and non-device attached handle the
> > sideband communications.
> 
> OK, but then we don't enable it back, as we assume it's enabled because the
> port is online, even while the user might have disabled it earlier?

Well there are two "modes" how they are accessed. Normal cases user
cannot offline the port so the sideband comes up when the link comes up
(e.g device is connected). In this case after the retimer enumeration
put them back to "passthrough" mode by sending the UNSET_INBOUND_SBTX.
This is needed to make the link come up after hot-reboot etc and was
recommended by our hardware folks.

The second case is when there is no device attached. This requires
special firmare too. In ChromeOS there is an ACPI _DSM method that does
this and if present we allow user to offline the port but only when
there is no device attached. In this mode we need to bring up the
sideband so we must send the SET_INBOUND_SBTX during enumeration but we
also need to keep them communicating so we cannot send
UNSET_INBOUND_SBTX. This mode is only used to upgrade the retimer NVM
firmware.

This is the idea behind these patches but let me know if I misssed
something.
