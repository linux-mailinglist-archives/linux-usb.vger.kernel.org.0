Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64D9345D4A5
	for <lists+linux-usb@lfdr.de>; Thu, 25 Nov 2021 07:19:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346665AbhKYGWQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 25 Nov 2021 01:22:16 -0500
Received: from mga06.intel.com ([134.134.136.31]:3233 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1346804AbhKYGUN (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 25 Nov 2021 01:20:13 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10178"; a="296258536"
X-IronPort-AV: E=Sophos;i="5.87,262,1631602800"; 
   d="scan'208";a="296258536"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2021 22:17:02 -0800
X-IronPort-AV: E=Sophos;i="5.87,262,1631602800"; 
   d="scan'208";a="457278789"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2021 22:16:58 -0800
Received: by lahna (sSMTP sendmail emulation); Thu, 25 Nov 2021 08:16:55 +0200
Date:   Thu, 25 Nov 2021 08:16:55 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     "Francisco Blas Izquierdo Riera (klondike)" <klondike@klondike.es>
Cc:     linux-usb@vger.kernel.org,
        Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Kranthi Kuntala <kranthi.kuntala@intel.com>,
        Rajmohan Mani <rajmohan.mani@intel.com>,
        Mario.Limonciello@dell.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Lukas Wunner <lukas@wunner.de>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: Re: [PATCH 1/2] thunderbolt: allow vendor ID override for NVM
 programming
Message-ID: <YZ8qVwt9k6Y8cSq+@lahna>
References: <8d29b41b-3590-c4b0-a2f8-fa34063bafb3@klondike.es>
 <07bd1d90-c95f-0685-e1a8-2211c9dac251@klondike.es>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <07bd1d90-c95f-0685-e1a8-2211c9dac251@klondike.es>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On Wed, Nov 24, 2021 at 05:37:05PM +0100, Francisco Blas Izquierdo Riera (klondike) wrote:
> Currently, the vendor ID reported by the chipset is checked before to
> avoid accidentally programming devices from unsupported vendors with
> a different NVM structure.
> 
> Certain Thunderbolt devices store the vendor ID in the NVM, therefore
> if the NVM has become corrrupted the device will report an invalid
> vendor ID and reflashing will be impossible on GNU/Linux even if the
> device can boot in safe mode.

How this can happen? The NVM upgrade verifies the signature of the new
NVM and does not allow upgrade if it does not match. Only way I can see
this happens is that the NVM is flashed directly to the flash chip
through some external tool like dediprog, or the NVM was corrupted
before it was signed at Intel which should not happen either (but OK,
mistakes can happen).

Can you give some more details about the issue? Which device it is and
how did the NVM ended being invalid?
