Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B08F311CEA3
	for <lists+linux-usb@lfdr.de>; Thu, 12 Dec 2019 14:44:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729418AbfLLNoQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 12 Dec 2019 08:44:16 -0500
Received: from mga17.intel.com ([192.55.52.151]:51603 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729392AbfLLNoP (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 12 Dec 2019 08:44:15 -0500
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 12 Dec 2019 05:44:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,306,1571727600"; 
   d="scan'208";a="220696698"
Received: from kuha.fi.intel.com ([10.237.72.53])
  by fmsmga001.fm.intel.com with SMTP; 12 Dec 2019 05:44:13 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Thu, 12 Dec 2019 15:44:12 +0200
Date:   Thu, 12 Dec 2019 15:44:12 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Ajay Gupta <ajaykuee@gmail.com>
Cc:     linux-usb@vger.kernel.org, Ajay Gupta <ajayg@nvidia.com>
Subject: Re: [PATCH v6] usb: typec: ucsi: add support for separate DP altmode
 devices
Message-ID: <20191212134412.GF31345@kuha.fi.intel.com>
References: <20191123004347.5127-1-ajayg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191123004347.5127-1-ajayg@nvidia.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Ajay,

On Fri, Nov 22, 2019 at 04:43:47PM -0800, Ajay Gupta wrote:
> From: Ajay Gupta <ajayg@nvidia.com>
> 
> CCGx controller used on NVIDIA GPU card has two separate display
> altmode for two DP pin assignments. UCSI specification doesn't
> prohibits using separate display altmode.
> 
> Current UCSI Type-C framework expects only one display altmode for
> all DP pin assignment. This patch squashes two separate display
> altmode into single altmode to support controllers with separate
> display altmode. We first read all the alternate modes of connector
> and then run through it to know if there are separate display
> altmodes. If so, it prepares a new port altmode set after squashing
> two or more separate altmodes into one.

I didn't see any major issues with this. There were still few extra
spaces etc., but I can clean those. Maybe it would have been good to
mention in the commit message that the reason why we need those two
separate alt modes, for what is in reality two separate pin
configurations, is limitations in UCSI specification, but never mind.

I still don't like the approach, but since I'm unable to explain my
idea, or have time to write something for this myself, I don't want
block this any longer. It does not add that much code, so once I have
time, I can always try to improve it myself, right?

Otherwise it's OK by me. I'll queue it up.

thanks,

-- 
heikki
