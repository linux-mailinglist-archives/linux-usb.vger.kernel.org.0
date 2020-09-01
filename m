Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1AA30258974
	for <lists+linux-usb@lfdr.de>; Tue,  1 Sep 2020 09:42:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727108AbgIAHmO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Sep 2020 03:42:14 -0400
Received: from mga05.intel.com ([192.55.52.43]:31884 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726124AbgIAHmN (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 1 Sep 2020 03:42:13 -0400
IronPort-SDR: k+XUZZmj/KqcRyLShm0rIzJiIZ8GbfHfWrZSxihLULV9ABpFyEh/HTtGh9YPLPTfPC5U280UJg
 BgzODnNaXR4A==
X-IronPort-AV: E=McAfee;i="6000,8403,9730"; a="241935374"
X-IronPort-AV: E=Sophos;i="5.76,378,1592895600"; 
   d="scan'208";a="241935374"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2020 00:42:12 -0700
IronPort-SDR: mHPQrUsBA6ymKH/ksIDCAlbzt7yq2GLyxqN0vwTXLdi7iG0n7iE9MaFnK/ZN8Sy8eCYYUEoyNM
 7UGtkZ1wzjUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,378,1592895600"; 
   d="scan'208";a="404695670"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga001.fm.intel.com with SMTP; 01 Sep 2020 00:42:10 -0700
Received: by lahna (sSMTP sendmail emulation); Tue, 01 Sep 2020 10:42:09 +0300
Date:   Tue, 1 Sep 2020 10:42:09 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     "tiantao (H)" <tiantao6@hisilicon.com>
Cc:     "andreas.noever@gmail.com" <andreas.noever@gmail.com>,
        "michael.jamet@intel.com" <michael.jamet@intel.com>,
        "YehezkelShB@gmail.com" <YehezkelShB@gmail.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Linuxarm <linuxarm@huawei.com>
Subject: Re: =?utf-8?B?562U5aSNOiBbUEFUQ0g=?= =?utf-8?Q?=5D?= thunderbolt:
 Use kobj_to_dev() instead of container_of()
Message-ID: <20200901074209.GT1375436@lahna.fi.intel.com>
References: <1598922090-39482-1-git-send-email-tiantao6@hisilicon.com>
 <20200901070847.GR1375436@lahna.fi.intel.com>
 <b7567a2dc486435c9e34e5f027d3664f@hisilicon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b7567a2dc486435c9e34e5f027d3664f@hisilicon.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Sep 01, 2020 at 07:37:48AM +0000, tiantao (H) wrote:
> Hi:
> 
> Doesn't really matter for an individual driver, but it may get coppied to lots more. 
> I consider it's a little tidy up.

That's fine but please write it down in the commit message as well :)
