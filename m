Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC9252AB855
	for <lists+linux-usb@lfdr.de>; Mon,  9 Nov 2020 13:34:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729776AbgKIMea (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 9 Nov 2020 07:34:30 -0500
Received: from mga18.intel.com ([134.134.136.126]:6285 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729673AbgKIMe2 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 9 Nov 2020 07:34:28 -0500
IronPort-SDR: i9Wo5npVBPOA4GQcKj6T9ytRluUUNT5Ds4ZyW/qLZO3jeC9iqtRWn6KvZB3hlwifWKhUgSTI3J
 PGhp09mf8s1Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9799"; a="157575735"
X-IronPort-AV: E=Sophos;i="5.77,463,1596524400"; 
   d="scan'208";a="157575735"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2020 04:34:27 -0800
IronPort-SDR: 5oKgdn2/PV1JQ5El67arb/RpyeNkqx82bebBQKY7ntYF7CoaSOoo5aHNJgAf+2axLaX493jGmr
 pX/Almd+a63Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,463,1596524400"; 
   d="scan'208";a="427982637"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 09 Nov 2020 04:34:25 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 09 Nov 2020 14:34:24 +0200
Date:   Mon, 9 Nov 2020 14:34:24 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: typec: Add typec_enter_usb() helper function
Message-ID: <20201109123424.GA1224435@kuha.fi.intel.com>
References: <20201109120524.50255-1-heikki.krogerus@linux.intel.com>
 <20201109122120.GA1834779@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201109122120.GA1834779@kroah.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Nov 09, 2020 at 01:21:20PM +0100, Greg Kroah-Hartman wrote:
> We can't add symbols/functions for no in-kernel users, so perhaps submit
> this as part of a series that actually uses it?

Sorry Greg. I didn't mean to send the patch out yet.

thanks,

-- 
heikki
