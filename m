Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB2AD225C69
	for <lists+linux-usb@lfdr.de>; Mon, 20 Jul 2020 12:07:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728044AbgGTKH2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 Jul 2020 06:07:28 -0400
Received: from mga04.intel.com ([192.55.52.120]:52322 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728001AbgGTKH2 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 20 Jul 2020 06:07:28 -0400
IronPort-SDR: wA2Fa851weoJQZqqMsg9+gSt2/e4x74SSglk83ajYdJKdlqNAbJxh6NqrNXDik5+y3NHZgPZ8O
 TKZTIu8PoKmw==
X-IronPort-AV: E=McAfee;i="6000,8403,9687"; a="147381596"
X-IronPort-AV: E=Sophos;i="5.75,374,1589266800"; 
   d="scan'208";a="147381596"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2020 03:07:27 -0700
IronPort-SDR: 6BF8Dgf/fJTGgRcvjglmRmjZcH7IaiNEeakLfruGY0U9iSAwygfbhB5N8xJuLWTUiHIYEEj2aY
 AxZuQLeGhaCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,374,1589266800"; 
   d="scan'208";a="391992865"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga001.fm.intel.com with SMTP; 20 Jul 2020 03:07:24 -0700
Received: by lahna (sSMTP sendmail emulation); Mon, 20 Jul 2020 13:07:23 +0300
Date:   Mon, 20 Jul 2020 13:07:23 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     "Kenneth R. Crudup" <kenny@panix.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: I get a new Thunderbolt domain UUID on every boot
Message-ID: <20200720100723.GW5180@lahna.fi.intel.com>
References: <alpine.DEB.2.23.453.2007051446170.4280@xps-7390>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.23.453.2007051446170.4280@xps-7390>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On Sun, Jul 05, 2020 at 02:52:04PM -0700, Kenneth R. Crudup wrote:
> 
> Does anyone know why my machine (Dell XPS 7390 2-in-1, i7-1065G7 CPU) gets a
> new Thunderbolt domain UUID on every boot?
> 
> ----
> $ sudo boltctl domains | wc -l
> 3320
> $ sudo boltctl domains | tail -20
>  o domain 815fe31a-99fd-8680-ffff-ffffffffffff
>    |- bootacl:  0/0
>    `- security: unknown
> 
>  o domain 703bafdf-6a33-8680-ffff-ffffffffffff
>    |- bootacl:  0/0
>    `- security: unknown
> 
>  o domain 91c55303-9244-8680-ffff-ffffffffffff
>    |- bootacl:  0/0
>    `- security: unknown
> 
>  * domain0 800e6342-557e-8680-ffff-ffffffffffff
>    |- bootacl:  0/0
>    `- security: iommu
> 
>  * domain1 9128366f-c373-8680-ffff-ffffffffffff
>    |- bootacl:  0/0
>    `- security: iommu
> $

It is done on purpose. The BIOS generates new UUID every boot.

> ----
> $ egrep '(THUNDER|USB4)' .config
> # CONFIG_MDIO_THUNDER is not set
> CONFIG_USB4_NET=m
> # CONFIG_USB_HSIC_USB4604 is not set
> CONFIG_INTEL_WMI_THUNDERBOLT=y
> CONFIG_USB4=y
> $
> ----
> I did see this, too:
> $  dmesg | fgrep -i thunderbolt
> [    1.114106] thunderbolt 0000:00:0d.2: 0: uid crc8 mismatch (expected: 0x8e, got: 0xe7)
> [    1.657866] thunderbolt 0000:00:0d.3: 0: uid crc8 mismatch (expected: 0x8e, got: 0xe7)

This is harmless. Host router (the TBT host controller) on ICL does not
have DROM so reading UID returns 0. Let me see if we can simply skip
this check on such systems.
