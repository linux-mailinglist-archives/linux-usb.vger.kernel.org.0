Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2F04308638
	for <lists+linux-usb@lfdr.de>; Fri, 29 Jan 2021 08:07:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232195AbhA2HGP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 29 Jan 2021 02:06:15 -0500
Received: from mga12.intel.com ([192.55.52.136]:51579 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229786AbhA2HGF (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 29 Jan 2021 02:06:05 -0500
IronPort-SDR: GxMSxnWexdyfUXS5+a1UCk1PCmhajOI/1FN6y6GDa3CK0M0HTqI9T7pP6xEjS4EdMF/6Sno9PD
 qqDeSHLsYMtQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9878"; a="159549834"
X-IronPort-AV: E=Sophos;i="5.79,384,1602572400"; 
   d="scan'208";a="159549834"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2021 23:04:19 -0800
IronPort-SDR: VbDFNdpoZ/gjfgvuZg0ng6ELjNLAKdj/GOkosjk58G0tkjKbael8VKuIBhzXHeUZvAnM4cVNU4
 B+7KBbNBUYFw==
X-IronPort-AV: E=Sophos;i="5.79,384,1602572400"; 
   d="scan'208";a="474427968"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2021 23:04:16 -0800
Received: by lahna (sSMTP sendmail emulation); Fri, 29 Jan 2021 09:04:14 +0200
Date:   Fri, 29 Jan 2021 09:04:14 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Lukas Wunner <lukas@wunner.de>
Cc:     linux-usb@vger.kernel.org, Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 2/5] thunderbolt: eeprom: Fix kernel-doc descriptions of
 non-static functions
Message-ID: <20210129070414.GD2542@lahna.fi.intel.com>
References: <20210128122934.36897-1-mika.westerberg@linux.intel.com>
 <20210128122934.36897-3-mika.westerberg@linux.intel.com>
 <20210128205719.GA7956@wunner.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210128205719.GA7956@wunner.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On Thu, Jan 28, 2021 at 09:57:19PM +0100, Lukas Wunner wrote:
> On Thu, Jan 28, 2021 at 03:29:31PM +0300, Mika Westerberg wrote:
> >  /**
> > - * tb_drom_read - copy drom to sw->drom and parse it
> > + * tb_drom_read() - Copy DROM to sw->drom and parse it
> > + * @sw: Router whose DROM to read and parse
> > + *
> > + * This function reads router DROM and if successful parses the entries and
> > + * populates the fields in @sw accordingly. Can be called for any router
> > + * generation.
> > + *
> > + * Returns %0 in case of success and negative errno otherwise.
> >   */
> >  int tb_drom_read(struct tb_switch *sw)
> >  {
> 
> I'm confused by the terminology change of "router" vs. "switch".
> Is this change mandated by USB4?

Not mandated.

> The parameter is a tb_switch, so calling it a router looks a little odd.

Right. I'm trying to use the "new" terminology in the comments so that
people reading those might be able to match it better with the spec.
Even though in code we still have tb_switch, tb_port etc. Perhaps we can
mention in kernel-docs of struct tb_switch and others the corresponding
USB4 spec term?
