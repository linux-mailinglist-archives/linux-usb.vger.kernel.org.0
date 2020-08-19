Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABB1A249E76
	for <lists+linux-usb@lfdr.de>; Wed, 19 Aug 2020 14:45:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728524AbgHSMpU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 19 Aug 2020 08:45:20 -0400
Received: from mga06.intel.com ([134.134.136.31]:5555 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728506AbgHSMpR (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 19 Aug 2020 08:45:17 -0400
IronPort-SDR: m6wZFW4o+N6LXlUQa7rye3yAte7RKZT8UjnnTJLfDWTkYoIJe2kWZbqZQJNsl25RSuNLmdArzg
 vKfCpSWOnoYQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9717"; a="216621256"
X-IronPort-AV: E=Sophos;i="5.76,331,1592895600"; 
   d="scan'208";a="216621256"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2020 05:45:16 -0700
IronPort-SDR: iR4/zpQwTRHUpCdmm6s2zBpyN1b88y2Gt5+s1zrDEqdLFRCN0cHONBsAkc8IEB0j/N5N9/B9Iv
 7HGCPpTqrfUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,331,1592895600"; 
   d="scan'208";a="400816079"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga001.fm.intel.com with SMTP; 19 Aug 2020 05:45:13 -0700
Received: by lahna (sSMTP sendmail emulation); Wed, 19 Aug 2020 15:45:12 +0300
Date:   Wed, 19 Aug 2020 15:45:12 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Yehezkel Bernat <yehezkelshb@gmail.com>
Cc:     linux-usb@vger.kernel.org, Michael Jamet <michael.jamet@intel.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        "Nikunj A . Dadhania" <nikunj.dadhania@linux.intel.com>,
        Srikanth Nandamuri <srikanth.nandamuri@intel.com>,
        Lukas Wunner <lukas@wunner.de>
Subject: Re: [PATCH 1/2] thunderbolt: Disable ports that are not implemented
Message-ID: <20200819124512.GJ1375436@lahna.fi.intel.com>
References: <20200819112716.59074-1-mika.westerberg@linux.intel.com>
 <CA+CmpXs+WHj_PS51s=nOAJp9pvn6atDhVi0FtNasHfqqJ9MhXw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+CmpXs+WHj_PS51s=nOAJp9pvn6atDhVi0FtNasHfqqJ9MhXw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Aug 19, 2020 at 02:54:39PM +0300, Yehezkel Bernat wrote:
> > - * @disabled: Disabled by eeprom
> > + * @disabled: Disabled by eeprom or enabled, but not implemented
> 
> I'm not a native speaker, so I'm not sure about it, but maybe the comma here is
> superfluous and just confuses the reader. To me it looks like it means
> "(disabled
> || enabled) && !implemented" instead of "disabled || (enabled && !implemented)".
> Any opinion?

For me (also non-native speaker) I don't see a difference but sure I can
remove it :)
