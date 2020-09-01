Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D24C258B1D
	for <lists+linux-usb@lfdr.de>; Tue,  1 Sep 2020 11:11:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726102AbgIAJL3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Sep 2020 05:11:29 -0400
Received: from mga01.intel.com ([192.55.52.88]:42833 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726050AbgIAJL3 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 1 Sep 2020 05:11:29 -0400
IronPort-SDR: IR8dbpKO0LyJBXko6xgNgEoppcRr+dnYjShmhXwUqus8FhV8DXaM90uxNDREh05x9lO4mh67LB
 qi/OTMh3lsOg==
X-IronPort-AV: E=McAfee;i="6000,8403,9730"; a="175178541"
X-IronPort-AV: E=Sophos;i="5.76,378,1592895600"; 
   d="scan'208";a="175178541"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2020 02:11:26 -0700
IronPort-SDR: brv74DfoS/Yv7vJCvhvujqyZxbv+OKNaRmrknP3Q6RINCjGmMZWFEgy98laanvkh79NDmBjZtA
 ERf/JqM0A/9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,378,1592895600"; 
   d="scan'208";a="404717583"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga001.fm.intel.com with SMTP; 01 Sep 2020 02:11:23 -0700
Received: by lahna (sSMTP sendmail emulation); Tue, 01 Sep 2020 12:11:23 +0300
Date:   Tue, 1 Sep 2020 12:11:23 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Tian Tao <tiantao6@hisilicon.com>
Cc:     andreas.noever@gmail.com, michael.jamet@intel.com,
        YehezkelShB@gmail.com, linux-usb@vger.kernel.org,
        linuxarm@huawei.com
Subject: Re: [PATCH v2] thunderbolt: Use kobj_to_dev() instead of
 container_of()
Message-ID: <20200901091123.GV1375436@lahna.fi.intel.com>
References: <1598948837-740-1-git-send-email-tiantao6@hisilicon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1598948837-740-1-git-send-email-tiantao6@hisilicon.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Sep 01, 2020 at 04:27:17PM +0800, Tian Tao wrote:
> Doesn't really matter for an individual driver, but it may
> get coppied to lots more. I consider it's a little tidy up.
> 
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>

Applied, thanks!
