Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 43136CB6A3
	for <lists+linux-usb@lfdr.de>; Fri,  4 Oct 2019 10:49:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729993AbfJDIt6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 4 Oct 2019 04:49:58 -0400
Received: from mga18.intel.com ([134.134.136.126]:34180 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725730AbfJDIt6 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 4 Oct 2019 04:49:58 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 04 Oct 2019 01:49:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,255,1566889200"; 
   d="scan'208";a="205810140"
Received: from kuha.fi.intel.com ([10.237.72.53])
  by fmsmga001.fm.intel.com with SMTP; 04 Oct 2019 01:49:55 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Fri, 04 Oct 2019 11:49:55 +0300
Date:   Fri, 4 Oct 2019 11:49:55 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH 5/7] usb: typec: tps6598x: Start using struct
 typec_operations
Message-ID: <20191004084955.GH1048@kuha.fi.intel.com>
References: <20191001094858.68643-1-heikki.krogerus@linux.intel.com>
 <20191001094858.68643-6-heikki.krogerus@linux.intel.com>
 <8587aaaa-57be-809a-2cc3-cf98c8d42219@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8587aaaa-57be-809a-2cc3-cf98c8d42219@roeck-us.net>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Oct 01, 2019 at 06:35:59AM -0700, Guenter Roeck wrote:
> On 10/1/19 2:48 AM, Heikki Krogerus wrote:
> > Supplying the operation callbacks as part of a struct
> > typec_operations instead of as part of struct
> > typec_capability during port registration. After this there
> > is not need to keep the capabilities stored anywhere in the
> > driver.
> > 
> > Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> 
> Nitpick or not:
> 
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>

Thanks for reviewing these Guenter. I'll preper v2.

cheers,

-- 
heikki
