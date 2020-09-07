Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3EB6825FD91
	for <lists+linux-usb@lfdr.de>; Mon,  7 Sep 2020 17:52:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730269AbgIGPwi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Sep 2020 11:52:38 -0400
Received: from mga17.intel.com ([192.55.52.151]:25785 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730221AbgIGPwe (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 7 Sep 2020 11:52:34 -0400
IronPort-SDR: XLendpVzhN8Mt4KG5/sHo+UV+ChOat8WTxaIMm+uZ3LxioFTEqDPeohrIl6Z6l32MRP34fxeXL
 QiKrR/wwhlxA==
X-IronPort-AV: E=McAfee;i="6000,8403,9737"; a="138066938"
X-IronPort-AV: E=Sophos;i="5.76,402,1592895600"; 
   d="scan'208";a="138066938"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2020 08:52:29 -0700
IronPort-SDR: OKawkKFMoTnSGMbguXThLtl8NtjcwhxLsewqqLKPYgFmHyfSdylAm5yyICdAjMpdfR2/DEblnQ
 njoVBfvoFnZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,402,1592895600"; 
   d="scan'208";a="333197015"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga008.jf.intel.com with ESMTP; 07 Sep 2020 08:52:26 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kFJNC-00EzvH-KL; Mon, 07 Sep 2020 18:48:02 +0300
Date:   Mon, 7 Sep 2020 18:48:02 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     himadrispandya@gmail.com, dvyukov@google.com,
        linux-usb@vger.kernel.org, perex@perex.cz, tiwai@suse.com,
        stern@rowland.harvard.ed, linux-kernel@vger.kernel.org,
        marcel@holtmann.org, johan.hedberg@gmail.com,
        linux-bluetooth@vger.kernel.org, alsa-devel@alsa-project.org,
        Alan Stern <stern@rowland.harvard.edu>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Subject: Re: [PATCH v2 03/11] USB: core: message.c: use
 usb_control_msg_send() in a few places
Message-ID: <20200907154802.GO1891694@smile.fi.intel.com>
References: <20200907145108.3766613-1-gregkh@linuxfoundation.org>
 <20200907145108.3766613-4-gregkh@linuxfoundation.org>
 <20200907145644.GA3767938@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200907145644.GA3767938@kroah.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Sep 07, 2020 at 04:56:44PM +0200, Greg Kroah-Hartman wrote:
> On Mon, Sep 07, 2020 at 04:51:00PM +0200, Greg Kroah-Hartman wrote:
> > There are a few calls to usb_control_msg() that can be converted to use
> > usb_control_msg_send() instead, so do that in order to make the error
> > checking a bit simpler.
> > 
> > Cc: Alan Stern <stern@rowland.harvard.edu>
> > Cc: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
> > Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Cc: linux-usb@vger.kernel.org
> > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> 
> Oops, Andy, sorry, you gave me a Reviewed-by: Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> on the previous version of this,
> I'll add it next round, or when it's queued up.

NP! Whatever works better for you.

-- 
With Best Regards,
Andy Shevchenko


