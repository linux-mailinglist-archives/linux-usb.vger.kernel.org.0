Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D13D4399CD
	for <lists+linux-usb@lfdr.de>; Mon, 25 Oct 2021 17:14:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233852AbhJYPRC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 25 Oct 2021 11:17:02 -0400
Received: from mga02.intel.com ([134.134.136.20]:5992 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233777AbhJYPRB (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 25 Oct 2021 11:17:01 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10148"; a="216843050"
X-IronPort-AV: E=Sophos;i="5.87,180,1631602800"; 
   d="scan'208";a="216843050"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2021 08:12:45 -0700
X-IronPort-AV: E=Sophos;i="5.87,180,1631602800"; 
   d="scan'208";a="485713463"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2021 08:12:42 -0700
Received: by lahna (sSMTP sendmail emulation); Mon, 25 Oct 2021 18:12:39 +0300
Date:   Mon, 25 Oct 2021 18:12:39 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mario Limonciello <mario.limonciello@outlook.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        linux-usb <linux-usb@vger.kernel.org>
Subject: Re: Disabling intel-wmi-thunderbolt on devices without Thunderbolt /
 detecting if a device has Thunderbolt
Message-ID: <YXbJZ+qP7s7TZ4rQ@lahna>
References: <e21981cf-fef0-b73d-8fe4-4e1fab0d3864@redhat.com>
 <PH0PR15MB4992B80415BE9BD4836CF336E1839@PH0PR15MB4992.namprd15.prod.outlook.com>
 <b067d9f8-4d15-ac5e-3f1f-ff2ffa3b29aa@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b067d9f8-4d15-ac5e-3f1f-ff2ffa3b29aa@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Oct 25, 2021 at 04:54:41PM +0200, Hans de Goede wrote:
> > Yes that's exactly what is supposed to happen that this attribute is made.
> > What exactly happens when you write into it?
> 
> The _SB.CGWR ACPI method gets called, with arguments coming from ACPI
> settings stored in memory. Depending on those settings this function
> either directly pokes some MMIO or tries to talk to an I2C GPIO
> expander which is not present on the Surface Go, causing it to
> MMIO poke an I2C controller which it should not touch.
> 
> In either case the AML code ends up poking stuff it should not touch
> and the entire force_power sysfs attribute should simply not be
> there on devices without thunderbolt.

That's right - it should not be there in the first place if there is no
Thunderbolt controller on that thing.

I guess most of the systems that have this actually do support
Thunderbolt so maybe we can work this around by quirking all the Surface
models in that driver?
