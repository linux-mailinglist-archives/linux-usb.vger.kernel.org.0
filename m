Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5623E1BD80D
	for <lists+linux-usb@lfdr.de>; Wed, 29 Apr 2020 11:18:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726523AbgD2JSv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 29 Apr 2020 05:18:51 -0400
Received: from mga07.intel.com ([134.134.136.100]:48958 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726345AbgD2JSv (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 29 Apr 2020 05:18:51 -0400
IronPort-SDR: rugnO2TMxmNT+MiWELTbwG3G7URfSe5eaVYHdXkBWMdL1aNj2HmGqjhkh8JaxACs6HM3rA1kPG
 5xoblxjTblkQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2020 02:18:50 -0700
IronPort-SDR: fB26L7HgW8+Hv9IUdEO9/Z3U+dzWdRpMAwDQl0bfqnE43rdgyHTbTXTjXueI49RLdGptOFi0EX
 Gxt/7lLcfYuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,331,1583222400"; 
   d="scan'208";a="367753470"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga001.fm.intel.com with SMTP; 29 Apr 2020 02:18:47 -0700
Received: by lahna (sSMTP sendmail emulation); Wed, 29 Apr 2020 12:18:46 +0300
Date:   Wed, 29 Apr 2020 12:18:46 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Lukas Wunner <lukas@wunner.de>, linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] Thunderbolt/USB4 fix for v5.7-rc4
Message-ID: <20200429091846.GL487496@lahna.fi.intel.com>
References: <20200428090956.GR487496@lahna.fi.intel.com>
 <20200428105018.GA1143911@kroah.com>
 <20200428115815.GY487496@lahna.fi.intel.com>
 <20200428170131.GA1641691@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200428170131.GA1641691@kroah.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Apr 28, 2020 at 07:01:31PM +0200, Greg Kroah-Hartman wrote:
> On Tue, Apr 28, 2020 at 02:58:15PM +0300, Mika Westerberg wrote:
> > On Tue, Apr 28, 2020 at 12:50:18PM +0200, Greg Kroah-Hartman wrote:
> > > On Tue, Apr 28, 2020 at 12:09:56PM +0300, Mika Westerberg wrote:
> > > > Hi Greg,
> > > > 
> > > > The following changes since commit ae83d0b416db002fe95601e7f97f64b59514d936:
> > > > 
> > > >   Linux 5.7-rc2 (2020-04-19 14:35:30 -0700)
> > > > 
> > > > are available in the Git repository at:
> > > > 
> > > >   git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-fix-for-v5.7-rc4
> > > > 
> > > > for you to fetch changes up to 9d2214b14103594efdbf33018b893b9417846d42:
> > > > 
> > > >   thunderbolt: Check return value of tb_sw_read() in usb4_switch_op() (2020-04-20 11:54:19 +0300)
> > > > 
> > > > ----------------------------------------------------------------
> > > > thunderbolt: Fix for v5.7-rc4
> > > > 
> > > > - Fix checking return value of tb_sw_read() in usb4_switch_op().
> > > > 
> > > > ----------------------------------------------------------------
> > > > Mika Westerberg (1):
> > > >       thunderbolt: Check return value of tb_sw_read() in usb4_switch_op()
> > > 
> > > Why does this commit not have a cc: stable tag on it?  I can apply it by
> > > hand and add it, but that will not show up as a pull request/merge, is
> > > that ok?
> > 
> > I'm not sure this qualifies as stable material to be honest. Changes
> > that this triggers is really low because there are no USB4 devices
> > available for public at the moment (that's the reason I did not add the
> > tag).
> > 
> > If you still think it should have stable tag, then it would be great if
> > you could add it. It is fine if it goes in as a patch not a merge.
> 
> I'll add it and queue it up now, thanks.

Thanks Greg!
