Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90A93251ADE
	for <lists+linux-usb@lfdr.de>; Tue, 25 Aug 2020 16:34:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726542AbgHYOeC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 25 Aug 2020 10:34:02 -0400
Received: from mga07.intel.com ([134.134.136.100]:48069 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726483AbgHYOd7 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 25 Aug 2020 10:33:59 -0400
IronPort-SDR: rY/5/ZBrnqsTNyf3HA16dSVV1buAL3eI58we/ZKYnmTqnI+DyrsIO6lcZrnMUm8m5ELc7uob8U
 BHbEU7XMEHvQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9723"; a="220379820"
X-IronPort-AV: E=Sophos;i="5.76,352,1592895600"; 
   d="scan'208";a="220379820"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2020 07:33:57 -0700
IronPort-SDR: dzmeqHoIyTXJ+o+g7Y8O9WxJ1M4qlPGVCY4Rp7vvQQFDRLvAXeYKDd3/dQ9lCaBWtakJIiZusD
 4GhiA4F4SMXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,352,1592895600"; 
   d="scan'208";a="328880141"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga008.jf.intel.com with ESMTP; 25 Aug 2020 07:33:55 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kAa1J-00BLPk-Mi; Tue, 25 Aug 2020 17:33:53 +0300
Date:   Tue, 25 Aug 2020 17:33:53 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     "Rafael J. Wysocki" <rafael@kernel.org>,
        Felipe Balbi <balbi@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-acpi@vger.kernel.org
Subject: Re: [PATCH 2/3] software node: Introduce device_add_software_node()
Message-ID: <20200825143353.GL1891694@smile.fi.intel.com>
References: <20200825135951.53340-1-heikki.krogerus@linux.intel.com>
 <20200825135951.53340-3-heikki.krogerus@linux.intel.com>
 <20200825143228.GK1891694@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200825143228.GK1891694@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Aug 25, 2020 at 05:32:28PM +0300, Andy Shevchenko wrote:
> On Tue, Aug 25, 2020 at 04:59:50PM +0300, Heikki Krogerus wrote:
> > This helper will register a software node and then assign
> > it to device at the same time. The function will also make
> > sure that the device can't have more than one software node.
> 
> > +	/* Only one software node per device. */
> > +	if (dev_to_swnode(dev))
> > +		return -EBUSY;
> 
> > +	swnode = dev_to_swnode(dev);
> > +	if (!swnode)
> > +		return;
> 
> Hmm... I didn't find implementation of dev_to_swnode().
> What did I miss?

Now found, I was looking into header, but it's defined in the c-file in
previous patch.

-- 
With Best Regards,
Andy Shevchenko


