Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6A2B1B5528
	for <lists+linux-usb@lfdr.de>; Thu, 23 Apr 2020 09:07:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726871AbgDWHGC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 Apr 2020 03:06:02 -0400
Received: from mga12.intel.com ([192.55.52.136]:18011 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726027AbgDWHGC (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 23 Apr 2020 03:06:02 -0400
IronPort-SDR: ddRdf4HQ5M+ooIAX0Kb0pWkHoFRgHNeDZ8AIoq0JHijr1X+Z8gc0H7bczXvipPDFQHSpZ8yI59
 6fh0z2XuK9uw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2020 00:06:02 -0700
IronPort-SDR: /G2S663C1oe91dSSYaBCRpwSwTt48NFT06JmFjZQt6om4BC8/aq4LCp3uQZ4dVRUTgLraTKteK
 vpQfn1x7i0bQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,306,1583222400"; 
   d="scan'208";a="365919160"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga001.fm.intel.com with SMTP; 23 Apr 2020 00:05:59 -0700
Received: by lahna (sSMTP sendmail emulation); Thu, 23 Apr 2020 10:05:58 +0300
Date:   Thu, 23 Apr 2020 10:05:58 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Yehezkel Bernat <yehezkelshb@gmail.com>
Cc:     linux-usb@vger.kernel.org, Michael Jamet <michael.jamet@intel.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Lukas Wunner <lukas@wunner.de>
Subject: Re: [PATCH] thunderbolt: Add support for Intel Tiger Lake
Message-ID: <20200423070558.GC2586@lahna.fi.intel.com>
References: <20200416120825.65013-1-mika.westerberg@linux.intel.com>
 <CA+CmpXtRZBt26E7rMNtZyNZdjjcqLuc84YfUNS0WgoWzQZhyBw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+CmpXtRZBt26E7rMNtZyNZdjjcqLuc84YfUNS0WgoWzQZhyBw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Apr 17, 2020 at 02:17:23AM +0300, Yehezkel Bernat wrote:
> On Thu, Apr 16, 2020 at 3:08 PM Mika Westerberg
> <mika.westerberg@linux.intel.com> wrote:
> >
> > Tiger Lake integrated Thunderbolt/USB4 controller is quite close to
> > Intel Ice Lake. By default it is still using firmware based connection
> > manager so we can use most of the Ice Lake flows in Tiger Lake as well.
> > We check if the firmware connection manager is running and in that case
> > use it, otherwise use the software based connection manager.
> >
> > Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> 
> Acked-by: Yehezkel Bernat <yehezkelshb@gmail.com>

Applied, thanks!
