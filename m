Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F7C4251443
	for <lists+linux-usb@lfdr.de>; Tue, 25 Aug 2020 10:32:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729240AbgHYIcM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 25 Aug 2020 04:32:12 -0400
Received: from mga03.intel.com ([134.134.136.65]:11196 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725936AbgHYIcH (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 25 Aug 2020 04:32:07 -0400
IronPort-SDR: P+YjPeIrVINVxH1BR4hHqSJqUiESEVBrE/mGzUATMB3ZxZhbwEYhRea54Tse1y3iZ0rY6ETflc
 H9DgUcz+ER+Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9723"; a="156063208"
X-IronPort-AV: E=Sophos;i="5.76,351,1592895600"; 
   d="scan'208";a="156063208"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2020 01:32:06 -0700
IronPort-SDR: Jy/4EhjIdMqM9Bp4lNhVDX1j5tFmUEbBlgAXlcodbdOJQJN1jca60aAURBSXZxzqa46d92J0x0
 OaLy6L9H7FCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,351,1592895600"; 
   d="scan'208";a="402645432"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga001.fm.intel.com with SMTP; 25 Aug 2020 01:32:03 -0700
Received: by lahna (sSMTP sendmail emulation); Tue, 25 Aug 2020 11:32:02 +0300
Date:   Tue, 25 Aug 2020 11:32:02 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     "Nikunj A. Dadhania" <nikunj.dadhania@linux.intel.com>
Cc:     Yehezkel Bernat <yehezkelshb@gmail.com>, linux-usb@vger.kernel.org,
        Michael Jamet <michael.jamet@intel.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Srikanth Nandamuri <srikanth.nandamuri@intel.com>,
        Lukas Wunner <lukas@wunner.de>
Subject: Re: [PATCH 1/2] thunderbolt: Disable ports that are not implemented
Message-ID: <20200825083202.GY1375436@lahna.fi.intel.com>
References: <20200819112716.59074-1-mika.westerberg@linux.intel.com>
 <CA+CmpXs+WHj_PS51s=nOAJp9pvn6atDhVi0FtNasHfqqJ9MhXw@mail.gmail.com>
 <20200819124512.GJ1375436@lahna.fi.intel.com>
 <5227d92b-069d-7026-9136-5036cfbe3fee@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5227d92b-069d-7026-9136-5036cfbe3fee@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Aug 20, 2020 at 05:31:08PM +0530, Nikunj A. Dadhania wrote:
> On 8/19/2020 6:15 PM, Mika Westerberg wrote:
> > On Wed, Aug 19, 2020 at 02:54:39PM +0300, Yehezkel Bernat wrote:
> > > > - * @disabled: Disabled by eeprom
> > > > + * @disabled: Disabled by eeprom or enabled, but not implemented
> > > 
> > > I'm not a native speaker, so I'm not sure about it, but maybe the comma here is
> > > superfluous and just confuses the reader. To me it looks like it means
> > > "(disabled
> > > || enabled) && !implemented" instead of "disabled || (enabled && !implemented)". >> Any opinion?
> > 
> > For me (also non-native speaker) I don't see a difference but sure I can
> > remove it :)
> > 
> 
> I meant the second - "disabled || (enabled && !implemented)"
> (also non-native speaker). If the comma confuses the reader please remove
> it.

Removed comma from the comment and applied to fixes, thanks!
