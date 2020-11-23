Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E3132C0F2F
	for <lists+linux-usb@lfdr.de>; Mon, 23 Nov 2020 16:47:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731631AbgKWPpZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 23 Nov 2020 10:45:25 -0500
Received: from mga09.intel.com ([134.134.136.24]:35042 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727444AbgKWPpY (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 23 Nov 2020 10:45:24 -0500
IronPort-SDR: 77A3SfAIMuLuQsXurPbSz1UES0qSscc5jF4D7JAAvhGOgT0LB23PpVdPZedceUCSX+Ddeqt9PS
 Xs8g9Z3enFEg==
X-IronPort-AV: E=McAfee;i="6000,8403,9813"; a="171946559"
X-IronPort-AV: E=Sophos;i="5.78,363,1599548400"; 
   d="scan'208";a="171946559"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2020 07:45:24 -0800
IronPort-SDR: 4zbJ//UWa/EpcCmri3Cz+3vfg0ILrdGRU5jsaBZjC1ectnWwDKRgPuJPadPtrOCQ4fuHDDU0Qs
 3RN/TLZR5LEQ==
X-IronPort-AV: E=Sophos;i="5.78,363,1599548400"; 
   d="scan'208";a="478149491"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2020 07:45:21 -0800
Received: by lahna (sSMTP sendmail emulation); Mon, 23 Nov 2020 17:45:19 +0200
Date:   Mon, 23 Nov 2020 17:45:19 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH] xhci-pci: Allow host runtime PM as default for Intel
 Alpine LP
Message-ID: <20201123154519.GA2532@lahna.fi.intel.com>
References: <20201123151140.5324-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201123151140.5324-1-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Hans,

Few minor comments below :)

On Mon, Nov 23, 2020 at 04:11:40PM +0100, Hans de Goede wrote:
> The xhci controller on Alpine Ridge LP keeps the whole thunderbolt
      ^^^^                                               ^^^^^^^^^^^
xHCI                                                     Thunderbolt


> controller awake if the host controller is not allowed to sleep.
> This is the case even if no USB devices are connected to the host.
> 
> Add the Intel Alpine LP product-id to the list of product-ids
                      ^
		      Ridge

> for which we allow runtime PM by default.
> 
> Fixes: 2815ef7fe4d4 ("xhci-pci: allow host runtime PM as default for Intel Alpine and Titan Ridge")
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
