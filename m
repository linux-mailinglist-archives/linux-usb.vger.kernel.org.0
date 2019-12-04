Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E0E12112F66
	for <lists+linux-usb@lfdr.de>; Wed,  4 Dec 2019 17:02:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728319AbfLDQCU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 4 Dec 2019 11:02:20 -0500
Received: from mga14.intel.com ([192.55.52.115]:53773 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728216AbfLDQCT (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 4 Dec 2019 11:02:19 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 04 Dec 2019 08:02:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,277,1571727600"; 
   d="scan'208";a="218960242"
Received: from kuha.fi.intel.com ([10.237.72.53])
  by fmsmga001.fm.intel.com with SMTP; 04 Dec 2019 08:02:17 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Wed, 04 Dec 2019 18:02:16 +0200
Date:   Wed, 4 Dec 2019 18:02:16 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Ajay Gupta <ajayg@nvidia.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v6] usb: typec: ucsi: add support for separate DP altmode
 devices
Message-ID: <20191204160216.GA3253@kuha.fi.intel.com>
References: <20191123004347.5127-1-ajayg@nvidia.com>
 <BYAPR12MB2727502B347FA72BCB9C7B60DC420@BYAPR12MB2727.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BYAPR12MB2727502B347FA72BCB9C7B60DC420@BYAPR12MB2727.namprd12.prod.outlook.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Dec 03, 2019 at 05:45:05PM +0000, Ajay Gupta wrote:
> Hi Heikki
> 
> Please help review this change. It has been pending for some time.

I will, don't worry. We are in the middle of merge window, so nothing
is going to happen right now.


thanks,

-- 
heikki
