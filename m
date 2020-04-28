Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA2F41BBCE7
	for <lists+linux-usb@lfdr.de>; Tue, 28 Apr 2020 13:58:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726682AbgD1L6T (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 28 Apr 2020 07:58:19 -0400
Received: from mga18.intel.com ([134.134.136.126]:51685 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726505AbgD1L6T (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 28 Apr 2020 07:58:19 -0400
IronPort-SDR: fXhF726Sm6OIQS7eE8PVn2QDQbxEseJWK6+MTUiWBfVEcv+Vg08QBkstPlThEQdmOChicUT0vZ
 4+GNsVF7t4CQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2020 04:58:19 -0700
IronPort-SDR: y3P4o11mIgCqlvRCq883TGGvZu2TGc5M1PqVAhKMSbc35M/kBIFc+Kjg+bIDPWD5MPImvrX/5Z
 WpPuItFCvZQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,327,1583222400"; 
   d="scan'208";a="367478930"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga001.fm.intel.com with SMTP; 28 Apr 2020 04:58:16 -0700
Received: by lahna (sSMTP sendmail emulation); Tue, 28 Apr 2020 14:58:15 +0300
Date:   Tue, 28 Apr 2020 14:58:15 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Lukas Wunner <lukas@wunner.de>, linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] Thunderbolt/USB4 fix for v5.7-rc4
Message-ID: <20200428115815.GY487496@lahna.fi.intel.com>
References: <20200428090956.GR487496@lahna.fi.intel.com>
 <20200428105018.GA1143911@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200428105018.GA1143911@kroah.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Apr 28, 2020 at 12:50:18PM +0200, Greg Kroah-Hartman wrote:
> On Tue, Apr 28, 2020 at 12:09:56PM +0300, Mika Westerberg wrote:
> > Hi Greg,
> > 
> > The following changes since commit ae83d0b416db002fe95601e7f97f64b59514d936:
> > 
> >   Linux 5.7-rc2 (2020-04-19 14:35:30 -0700)
> > 
> > are available in the Git repository at:
> > 
> >   git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-fix-for-v5.7-rc4
> > 
> > for you to fetch changes up to 9d2214b14103594efdbf33018b893b9417846d42:
> > 
> >   thunderbolt: Check return value of tb_sw_read() in usb4_switch_op() (2020-04-20 11:54:19 +0300)
> > 
> > ----------------------------------------------------------------
> > thunderbolt: Fix for v5.7-rc4
> > 
> > - Fix checking return value of tb_sw_read() in usb4_switch_op().
> > 
> > ----------------------------------------------------------------
> > Mika Westerberg (1):
> >       thunderbolt: Check return value of tb_sw_read() in usb4_switch_op()
> 
> Why does this commit not have a cc: stable tag on it?  I can apply it by
> hand and add it, but that will not show up as a pull request/merge, is
> that ok?

I'm not sure this qualifies as stable material to be honest. Changes
that this triggers is really low because there are no USB4 devices
available for public at the moment (that's the reason I did not add the
tag).

If you still think it should have stable tag, then it would be great if
you could add it. It is fine if it goes in as a patch not a merge.

Thanks!
