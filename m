Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3570F133FEF
	for <lists+linux-usb@lfdr.de>; Wed,  8 Jan 2020 12:11:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727522AbgAHLLE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 8 Jan 2020 06:11:04 -0500
Received: from mga06.intel.com ([134.134.136.31]:14673 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727606AbgAHLLE (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 8 Jan 2020 06:11:04 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 08 Jan 2020 03:11:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,409,1571727600"; 
   d="scan'208";a="225883270"
Received: from kuha.fi.intel.com ([10.237.72.53])
  by fmsmga001.fm.intel.com with SMTP; 08 Jan 2020 03:11:00 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Wed, 08 Jan 2020 13:10:59 +0200
Date:   Wed, 8 Jan 2020 13:10:59 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     USB list <linux-usb@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] usb: typec: fix non-kernel-doc comments
Message-ID: <20200108111059.GD7440@kuha.fi.intel.com>
References: <88821011-2128-a8dd-68b8-c5ae8f43271f@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <88821011-2128-a8dd-68b8-c5ae8f43271f@infradead.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jan 07, 2020 at 10:24:50PM -0800, Randy Dunlap wrote:
> From: Randy Dunlap <rdunlap@infradead.org>
> 
> Use "/*" for non-kernel-doc comments instead of "/**", which is
> intended to be used only for kernel-doc notation.
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

OK by me.

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/bus.c |    2 +-
>  drivers/usb/typec/mux.c |    2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> --- lnx-55-rc5.orig/drivers/usb/typec/bus.c
> +++ lnx-55-rc5/drivers/usb/typec/bus.c
> @@ -1,5 +1,5 @@
>  // SPDX-License-Identifier: GPL-2.0
> -/**
> +/*
>   * Bus for USB Type-C Alternate Modes
>   *
>   * Copyright (C) 2018 Intel Corporation
> --- lnx-55-rc5.orig/drivers/usb/typec/mux.c
> +++ lnx-55-rc5/drivers/usb/typec/mux.c
> @@ -1,5 +1,5 @@
>  // SPDX-License-Identifier: GPL-2.0
> -/**
> +/*
>   * USB Type-C Multiplexer/DeMultiplexer Switch support
>   *
>   * Copyright (C) 2018 Intel Corporation

thanks,

-- 
heikki
