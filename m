Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A4AD67214C8
	for <lists+linux-usb@lfdr.de>; Sun,  4 Jun 2023 07:12:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229519AbjFDFL5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 4 Jun 2023 01:11:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229462AbjFDFLe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 4 Jun 2023 01:11:34 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AB9CDD
        for <linux-usb@vger.kernel.org>; Sat,  3 Jun 2023 22:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685855493; x=1717391493;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=ZCYV03TEOIP4KUwhZsf0gG/hpF2Fu2YUnimRLNvXrRY=;
  b=SAl7CkDmEfemPfiAeMouu5s4kdIlrsqDJ485FnWjMjfDsq+U40Y5uxB/
   JDTIqGzEZDl1bJcDIuw+EmJ50xy5Va/MQGr2I9FTUYl+kBefaay1MgcM1
   4pHFy6paR3af68cx+va8/oiPTy5awXMpemPCoJq3gwi94gmaBzH9rc4zK
   Tx+pPjsZ+I4RxflkEG/bz9Nd7ikkkOGXe8Ex819st1tPhiepUAHpT3zhp
   z3R6+D8BujiA/1KVXEF8H4sduX72sl5yDPR5OHq4st3qtFOG3Tia+XqQu
   NO+3c38GYh50r6U+GWIvjKSjMvrRgHPil3g09uKUvfttiLM8uTFXWNK25
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10730"; a="421976872"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; 
   d="scan'208";a="421976872"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2023 22:11:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10730"; a="711410499"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; 
   d="scan'208";a="711410499"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga007.fm.intel.com with ESMTP; 03 Jun 2023 22:11:30 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 9A641204; Sun,  4 Jun 2023 08:11:36 +0300 (EEST)
Date:   Sun, 4 Jun 2023 08:11:36 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Yehezkel Bernat <yehezkelshb@gmail.com>
Cc:     linux-usb@vger.kernel.org, Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Utkarsh H Patel <utkarsh.h.patel@intel.com>
Subject: Re: [PATCH 3/3] thunderbolt: Enable/disable sideband depending on
 USB4 port offline mode
Message-ID: <20230604051136.GQ45886@black.fi.intel.com>
References: <20230602091055.65049-1-mika.westerberg@linux.intel.com>
 <20230602091055.65049-4-mika.westerberg@linux.intel.com>
 <CA+CmpXs2K8Bi2xHk_hhWC3x6rVeTQ=SbtjuxLSBV+3rjHRwxVQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+CmpXs2K8Bi2xHk_hhWC3x6rVeTQ=SbtjuxLSBV+3rjHRwxVQ@mail.gmail.com>
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On Sat, Jun 03, 2023 at 10:24:38PM +0300, Yehezkel Bernat wrote:
> On Fri, Jun 2, 2023 at 12:11 PM Mika Westerberg
> <mika.westerberg@linux.intel.com> wrote:
> >
> > When USB4 port is in offline mode (this mean there is no device
> > attached) we want to keep the sideband up to make it possible to
> > communicate with the retimers. In the same way there is no need to
> > enable sideband transactions when the USB4 port is not offline as they
> > are already up.
> >
> > For this reason make the enabling/disabling depend on the USB4 port
> > offline status.
> 
> I'm probably missing something here, but if we don't allow disabling it when the
> port is offline, and when the port is online the sideband is enabled, when can
> it be disabled? If we can manually disable it when the port is online, on
> enablement we can't assume that it's already enabled just because the port
> is online, as we might have manually disabled it earlier.

We allow disabling them when the port is online. This all basically
separates how the device attached and non-device attached handle the
sideband communications.
