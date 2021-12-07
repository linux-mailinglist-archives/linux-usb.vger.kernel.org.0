Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7283B46BAF6
	for <lists+linux-usb@lfdr.de>; Tue,  7 Dec 2021 13:22:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235821AbhLGMZm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 7 Dec 2021 07:25:42 -0500
Received: from mga01.intel.com ([192.55.52.88]:21903 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230107AbhLGMZm (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 7 Dec 2021 07:25:42 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10190"; a="261629845"
X-IronPort-AV: E=Sophos;i="5.87,293,1631602800"; 
   d="scan'208";a="261629845"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2021 04:22:11 -0800
X-IronPort-AV: E=Sophos;i="5.87,293,1631602800"; 
   d="scan'208";a="462273945"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2021 04:22:07 -0800
Received: by lahna (sSMTP sendmail emulation); Tue, 07 Dec 2021 14:22:05 +0200
Date:   Tue, 7 Dec 2021 14:22:05 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Gil Fine <gil.fine@intel.com>, Lukas Wunner <lukas@wunner.de>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Andreas Noever <andreas.noever@gmail.com>
Subject: Re: [PATCH 0/6] thunderbolt: Improvements for PM and USB4
 compatibility
Message-ID: <Ya9R7SXLsdanFhmC@lahna>
References: <20211125073733.74902-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211125073733.74902-1-mika.westerberg@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Nov 25, 2021 at 10:37:27AM +0300, Mika Westerberg wrote:
> Hi all,
> 
> This series consists of improvements around power management and USB4
> compatibility. We also add debug logging for the DisplayPort resource
> allocation.
> 
> Mika Westerberg (6):
>   thunderbolt: Runtime PM activate both ends of the device link
>   thunderbolt: Tear down existing tunnels when resuming from hibernate
>   thunderbolt: Runtime resume USB4 port when retimers are scanned
>   thunderbolt: Do not allow subtracting more NFC credits than configured
>   thunderbolt: Do not program path HopIDs for USB4 routers
>   thunderbolt: Add debug logging of DisplayPort resource allocation

Fixed the typos pointed out by Yehezkel and applied to
thunderbolt.git/next.
