Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 75A40A06EC
	for <lists+linux-usb@lfdr.de>; Wed, 28 Aug 2019 18:06:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726560AbfH1QGL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 28 Aug 2019 12:06:11 -0400
Received: from mga03.intel.com ([134.134.136.65]:18137 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726415AbfH1QGL (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 28 Aug 2019 12:06:11 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 28 Aug 2019 09:06:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,441,1559545200"; 
   d="scan'208";a="197585654"
Received: from kuha.fi.intel.com ([10.237.72.53])
  by fmsmga001.fm.intel.com with SMTP; 28 Aug 2019 09:06:07 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Wed, 28 Aug 2019 19:06:06 +0300
Date:   Wed, 28 Aug 2019 19:06:06 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Saranya Gopal <saranya.gopal@intel.com>
Cc:     hdegoede@redhat.com, gregkh@linuxfoundation.org,
        mathias.nyman@intel.com, linux-usb@vger.kernel.org,
        Balaji Manoharan <m.balaji@intel.com>
Subject: Re: [PATCH v2 2/2] usb: roles: intel: Enable static DRD mode for
 role switch
Message-ID: <20190828160606.GC5486@kuha.fi.intel.com>
References: <1567004932-16967-1-git-send-email-saranya.gopal@intel.com>
 <1567004932-16967-3-git-send-email-saranya.gopal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1567004932-16967-3-git-send-email-saranya.gopal@intel.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Aug 28, 2019 at 08:38:52PM +0530, Saranya Gopal wrote:
> Enable static DRD mode in Intel platforms which guarantees
> successful role switch all the time. This fixes issues like
> software role switch failure after cold boot and issue with
> role switch when USB 3.0 cable is used. But, do not enable
> static DRD mode for Cherrytrail devices which rely on firmware
> for role switch.
> 
> Signed-off-by: Saranya Gopal <saranya.gopal@intel.com>
> Signed-off-by: Balaji Manoharan <m.balaji@intel.com>
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

Ditto. Can't use my SoB anymore.

Note. Since I only proposed using the device property, in this patch
you should also not use my "Suggested-by" tag. So I think it is OK to
use it in the first patch of this series, but not in this second patch.

thanks,

-- 
heikki
