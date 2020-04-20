Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBD4C1B04F2
	for <lists+linux-usb@lfdr.de>; Mon, 20 Apr 2020 10:57:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726355AbgDTI5N (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 Apr 2020 04:57:13 -0400
Received: from mga07.intel.com ([134.134.136.100]:12822 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725886AbgDTI5M (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 20 Apr 2020 04:57:12 -0400
IronPort-SDR: 1etWlaUZ0CEA9C77bjJLwqRH8uJMQt5MTJBBpmFd9Fp5ojO9NO7V0SVN6Ma/xYefKpazyhizjs
 jELUsQbH0iPA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2020 01:57:12 -0700
IronPort-SDR: prkYc6reaZk4OcfYBCBetKNdy6j/YP9OfDRV07RFHXJiKCugUt9Yd32KIVzJ3UTozI/a9kJU+4
 vBKjeTY+78Mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,406,1580803200"; 
   d="scan'208";a="364942349"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga001.fm.intel.com with SMTP; 20 Apr 2020 01:57:09 -0700
Received: by lahna (sSMTP sendmail emulation); Mon, 20 Apr 2020 11:57:09 +0300
Date:   Mon, 20 Apr 2020 11:57:09 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Yehezkel Bernat <yehezkelshb@gmail.com>
Cc:     linux-usb@vger.kernel.org, Michael Jamet <michael.jamet@intel.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Lukas Wunner <lukas@wunner.de>
Subject: Re: [PATCH] thunderbolt: Check return value of tb_sw_read() in
 usb4_switch_op()
Message-ID: <20200420085709.GU2586@lahna.fi.intel.com>
References: <20200416120146.54791-1-mika.westerberg@linux.intel.com>
 <CA+CmpXuEbpATXSw2x0sH4LWU9XAm8d5ZpkDm9Kuoi5CwvTZQvQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+CmpXuEbpATXSw2x0sH4LWU9XAm8d5ZpkDm9Kuoi5CwvTZQvQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Apr 17, 2020 at 02:20:26AM +0300, Yehezkel Bernat wrote:
> On Thu, Apr 16, 2020 at 3:01 PM Mika Westerberg
> <mika.westerberg@linux.intel.com> wrote:
> >
> > The function misses checking return value of tb_sw_read() before it
> > accesses the value that was read. Fix this by checking the return value
> > first.
> >
> > Fixes: b04079837b20 ("thunderbolt: Add initial support for USB4")
> > Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> 
> Reviewed-by: Yehezkel Bernat <yehezkelshb@gmail.com>

Applied to fixes, thanks!
