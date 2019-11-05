Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE3E8EF77F
	for <lists+linux-usb@lfdr.de>; Tue,  5 Nov 2019 09:46:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730216AbfKEIqm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 5 Nov 2019 03:46:42 -0500
Received: from mga03.intel.com ([134.134.136.65]:17414 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725806AbfKEIqm (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 5 Nov 2019 03:46:42 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 05 Nov 2019 00:46:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,270,1569308400"; 
   d="scan'208";a="212496264"
Received: from kuha.fi.intel.com ([10.237.72.53])
  by fmsmga001.fm.intel.com with SMTP; 05 Nov 2019 00:46:39 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 05 Nov 2019 10:46:38 +0200
Date:   Tue, 5 Nov 2019 10:46:38 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ajay Gupta <ajayg@nvidia.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH v4 12/18] usb: typec: ucsi: acpi: Move to the new API
Message-ID: <20191105084638.GD29493@kuha.fi.intel.com>
References: <20191104142435.29960-1-heikki.krogerus@linux.intel.com>
 <20191104142435.29960-13-heikki.krogerus@linux.intel.com>
 <20191104185451.GA5351@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191104185451.GA5351@roeck-us.net>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Nov 04, 2019 at 10:54:51AM -0800, Guenter Roeck wrote:
> On Mon, Nov 04, 2019 at 05:24:29PM +0300, Heikki Krogerus wrote:
> > Replacing the old "cmd" and "sync" callbacks with an
> > implementation of struct ucsi_operations. The ACPI
> > notification (interrupt) handler will from now on read the
> > CCI (Command Status and Connector Change Indication)
> > register, and call ucsi_connector_change() function and/or
> > complete pending command completions based on it.
> > 
> > Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> 
> FTR, my request for better (non-)iomem documentation isn't really
> that important.
> 
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>

Thanks Guenter.

-- 
heikki
