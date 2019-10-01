Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 889A3C365B
	for <lists+linux-usb@lfdr.de>; Tue,  1 Oct 2019 15:52:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388687AbfJANww (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Oct 2019 09:52:52 -0400
Received: from mga07.intel.com ([134.134.136.100]:61353 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726898AbfJANww (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 1 Oct 2019 09:52:52 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 01 Oct 2019 06:52:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,571,1559545200"; 
   d="scan'208";a="205066221"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.157])
  by fmsmga001.fm.intel.com with SMTP; 01 Oct 2019 06:52:47 -0700
Received: by lahna (sSMTP sendmail emulation); Tue, 01 Oct 2019 16:52:46 +0300
Date:   Tue, 1 Oct 2019 16:52:46 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Mario.Limonciello@dell.com
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        andreas.noever@gmail.com, michael.jamet@intel.com,
        YehezkelShB@gmail.com, rajmohan.mani@intel.com,
        nicholas.johnson-opensource@outlook.com.au, lukas@wunner.de,
        stern@rowland.harvard.edu, anthony.wong@canonical.com,
        linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 01/22] thunderbolt: Introduce tb_switch_is_icm()
Message-ID: <20191001135246.GV2714@lahna.fi.intel.com>
References: <20191001113830.13028-1-mika.westerberg@linux.intel.com>
 <20191001113830.13028-2-mika.westerberg@linux.intel.com>
 <20191001121005.GA2951658@kroah.com>
 <20191001124638.GL2714@lahna.fi.intel.com>
 <bc3be927d5fd41efa6e0828f78a41d7a@AUSX13MPC105.AMER.DELL.COM>
 <20191001134828.GU2714@lahna.fi.intel.com>
 <b3f621c4bb6f45e796b19e545240bd0f@AUSX13MPC105.AMER.DELL.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b3f621c4bb6f45e796b19e545240bd0f@AUSX13MPC105.AMER.DELL.COM>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Oct 01, 2019 at 01:50:13PM +0000, Mario.Limonciello@dell.com wrote:
> > Here at Intel we use term "SW CM" and "FW CM" and IMHO they are better
> > than ECM/ICM. But if people insist I can change them.
> 
> I do agree with you, SW CM and FW CM are clearer than ECM/ICM, maybe just reference
> both in the comments so if someone is aware of ECM/ICM from some documents they
> can relate the two concepts.

Sure, I'll do that in the next version.
