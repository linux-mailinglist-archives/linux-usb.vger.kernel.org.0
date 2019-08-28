Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD769A06D7
	for <lists+linux-usb@lfdr.de>; Wed, 28 Aug 2019 18:00:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726462AbfH1QAn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 28 Aug 2019 12:00:43 -0400
Received: from mga07.intel.com ([134.134.136.100]:9012 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726450AbfH1QAn (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 28 Aug 2019 12:00:43 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 28 Aug 2019 09:00:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,441,1559545200"; 
   d="scan'208";a="197584234"
Received: from kuha.fi.intel.com ([10.237.72.53])
  by fmsmga001.fm.intel.com with SMTP; 28 Aug 2019 09:00:29 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Wed, 28 Aug 2019 19:00:28 +0300
Date:   Wed, 28 Aug 2019 19:00:28 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Saranya Gopal <saranya.gopal@intel.com>
Cc:     hdegoede@redhat.com, gregkh@linuxfoundation.org,
        mathias.nyman@intel.com, linux-usb@vger.kernel.org,
        Balaji Manoharan <m.balaji@intel.com>
Subject: Re: [PATCH v2 1/2] xhci-ext-caps.c: Add property to disable Intel SW
 switch
Message-ID: <20190828160028.GB5486@kuha.fi.intel.com>
References: <1567004932-16967-1-git-send-email-saranya.gopal@intel.com>
 <1567004932-16967-2-git-send-email-saranya.gopal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1567004932-16967-2-git-send-email-saranya.gopal@intel.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Aug 28, 2019 at 08:38:51PM +0530, Saranya Gopal wrote:
> In platforms like Cherrytrail, 'SW switch enable' bit
> should not be enabled for role switch. This patch
> adds a property to Intel USB Role Switch platform driver
> to denote that SW switch should be disabled in
> Cherrytrail devices.
> 
> Signed-off-by: Saranya Gopal <saranya.gopal@intel.com>
> Signed-off-by: Balaji Manoharan <m.balaji@intel.com>
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

You can't use my SoB anymore. With this patch you should probable put
here something like "Suggested-by: Heikki..." instead.

thanks,

-- 
heikki
