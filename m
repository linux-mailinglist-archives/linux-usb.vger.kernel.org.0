Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 254AA15BC69
	for <lists+linux-usb@lfdr.de>; Thu, 13 Feb 2020 11:12:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729511AbgBMKMi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 13 Feb 2020 05:12:38 -0500
Received: from mga11.intel.com ([192.55.52.93]:42730 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729428AbgBMKMh (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 13 Feb 2020 05:12:37 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 13 Feb 2020 02:12:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,436,1574150400"; 
   d="scan'208";a="347702344"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga001.fm.intel.com with SMTP; 13 Feb 2020 02:12:35 -0800
Received: by lahna (sSMTP sendmail emulation); Thu, 13 Feb 2020 12:12:34 +0200
Date:   Thu, 13 Feb 2020 12:12:34 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Lukas Wunner <lukas@wunner.de>
Cc:     linux-usb@vger.kernel.org,
        Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>
Subject: Re: [PATCH] thunderbolt: Add missing kernel-doc parameter
 descriptions
Message-ID: <20200213101234.GS2667@lahna.fi.intel.com>
References: <20200213100207.1942-1-mika.westerberg@linux.intel.com>
 <20200213100907.xeuvsiaz4hwxnmb4@wunner.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200213100907.xeuvsiaz4hwxnmb4@wunner.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Feb 13, 2020 at 11:09:07AM +0100, Lukas Wunner wrote:
> On Thu, Feb 13, 2020 at 01:02:07PM +0300, Mika Westerberg wrote:
> > @@ -296,6 +297,9 @@ static int usb4_switch_drom_read_block(struct tb_switch *sw,
> >  /**
> >   * usb4_switch_drom_read() - Read arbitrary bytes from USB4 router DROM
> >   * @sw: USB4 router
> > + * @address: Byte address inside DROM to start reading
> > + * @buf: Buffer where the DROM contens is stored
> 
> Either "content is" or "contents are".

Heh, indeed. I'll use "content is" in v2.
