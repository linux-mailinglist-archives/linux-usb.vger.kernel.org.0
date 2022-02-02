Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D3334A6F57
	for <lists+linux-usb@lfdr.de>; Wed,  2 Feb 2022 12:02:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343643AbiBBLCK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 2 Feb 2022 06:02:10 -0500
Received: from mga17.intel.com ([192.55.52.151]:35186 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1343632AbiBBLCJ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 2 Feb 2022 06:02:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643799729; x=1675335729;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EAq08HSGiQ6pIJJAMlN5vhb3L/MWH6Lf/XUFM0/SaAk=;
  b=UzhhIe4vWc5nzlHmu9J9OGplGo96SKu8bCPwO0qOmSEFLmlHJyeRTx30
   3Dwy/6l3wROOSJCqCUcGOGMhIml+G0JsHxDl0XpLqBgaaiFCB0MHl8lLL
   g4zHbX7w9sxiPpXKj/UhyOIG25jFEyvq9Ms+Ee2LkFKSsgWZ8NInP1w+M
   RhLI7WSTT55zf39Y7VFe+UYkqMhDaooCMQ7cBCqi9wFsLTxrtnKbbexk5
   7bVY2UmodP2J6cFU6Vsm/SJGmNbU+qAYVLMLarf4oaNy6wHLfNQ2ebsRW
   CM3e9Ty8uVDNVUIJs/0x/i4Zm61BjL6MCppQV7C/FM7rpHsoJxtHeGR9Q
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10245"; a="228547147"
X-IronPort-AV: E=Sophos;i="5.88,336,1635231600"; 
   d="scan'208";a="228547147"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2022 03:02:09 -0800
X-IronPort-AV: E=Sophos;i="5.88,336,1635231600"; 
   d="scan'208";a="480066111"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.162])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2022 03:02:06 -0800
Received: by lahna (sSMTP sendmail emulation); Wed, 02 Feb 2022 12:59:55 +0200
Date:   Wed, 2 Feb 2022 12:59:55 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>
Subject: Re: [PATCH 0/3] thunderbolt: Improvements for Alpine and Titan Ridge
 devices
Message-ID: <YfpkK7o1aDV5fZI3@lahna>
References: <20220126141653.28092-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220126141653.28092-1-mika.westerberg@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jan 26, 2022 at 05:16:50PM +0300, Mika Westerberg wrote:
> Hi all,
> 
> The first two patches implement flows that are needed to bring up the
> internal xHCI controller when there is USB device connected to the
> downstream Thunderbolt port of the the router. The last patch disables
> LTTPR (LT-tunable PHY Repeater, DisplayPort term) when Titan Ridge device
> router is connected to avoid tunneling issues.
> 
> Mika Westerberg (3):
>   thunderbolt: Add missing device ID to tb_switch_is_alpine_ridge()
>   thunderbolt: Add internal xHCI connect flows for Thunderbolt 3 devices
>   thunderbolt: Disable LTTPR on Intel Titan Ridge

Fixed the typo pointed out by Lukas and applied to thunderbolt.git/next.
