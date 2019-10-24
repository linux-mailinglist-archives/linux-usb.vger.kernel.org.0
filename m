Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3A382E350A
	for <lists+linux-usb@lfdr.de>; Thu, 24 Oct 2019 16:08:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390348AbfJXOIG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 24 Oct 2019 10:08:06 -0400
Received: from mga06.intel.com ([134.134.136.31]:59019 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389658AbfJXOIG (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 24 Oct 2019 10:08:06 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 24 Oct 2019 07:08:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,224,1569308400"; 
   d="scan'208";a="210166375"
Received: from kuha.fi.intel.com ([10.237.72.53])
  by fmsmga001.fm.intel.com with SMTP; 24 Oct 2019 07:08:03 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Thu, 24 Oct 2019 17:08:02 +0300
Date:   Thu, 24 Oct 2019 17:08:02 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Ajay Gupta <ajayg@nvidia.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v2 13/18] usb: typec: ucsi: ccg: Move to the new API
Message-ID: <20191024140802.GA29754@kuha.fi.intel.com>
References: <20191023143939.39668-1-heikki.krogerus@linux.intel.com>
 <20191023143939.39668-14-heikki.krogerus@linux.intel.com>
 <BYAPR12MB2727F129358456DBD5D087DEDC6B0@BYAPR12MB2727.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BYAPR12MB2727F129358456DBD5D087DEDC6B0@BYAPR12MB2727.namprd12.prod.outlook.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Oct 23, 2019 at 04:12:31PM +0000, Ajay Gupta wrote:
> Hi Heikki
> 
> > -----Original Message-----
> > From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > Sent: Wednesday, October 23, 2019 7:40 AM
> > To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Cc: Guenter Roeck <linux@roeck-us.net>; Ajay Gupta <ajayg@nvidia.com>;
> > linux-usb@vger.kernel.org
> > Subject: [PATCH v2 13/18] usb: typec: ucsi: ccg: Move to the new API
> > 
> > Replacing the old "cmd" and "sync" callbacks with an implementation of struct
> > ucsi_operations. The interrupt handler will from now on read the CCI
> > (Command Status and Connector Change Indication) register, and call
> > ucsi_connector_change() function and/or complete pending command
> > completions based on it.
> 
> I have tested the entire set for ucsi_ccg controller on NVIDIA GPU.
> 
> Tested-by: Ajay Gupta <ajayg@nvidia.com>

Thanks Ajay.

I have to do one more chagne to the ucsi_acpi.c. I'll prepare v3 and
add your tag to this patch.

br,

-- 
heikki
