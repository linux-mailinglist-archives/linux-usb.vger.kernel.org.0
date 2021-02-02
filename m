Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B25D30BC7F
	for <lists+linux-usb@lfdr.de>; Tue,  2 Feb 2021 12:03:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229831AbhBBLDM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 2 Feb 2021 06:03:12 -0500
Received: from mga12.intel.com ([192.55.52.136]:28194 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229572AbhBBLDL (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 2 Feb 2021 06:03:11 -0500
IronPort-SDR: 5MadFAbVQjMNs1fxS6mULc3SYP2yBplqSqHNv9iJtaBX0tmeIdIIOFCCdm2lSM/nRbzrGIKhpC
 5BdLG+Qx1mRA==
X-IronPort-AV: E=McAfee;i="6000,8403,9882"; a="160002102"
X-IronPort-AV: E=Sophos;i="5.79,394,1602572400"; 
   d="scan'208";a="160002102"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2021 03:01:22 -0800
IronPort-SDR: PkTYY1u6sZvV8PxM7NI0JqD60ZSA+0Nh1G1P5p6sgFoyjzwesltb/a4ymTYI3Vt5mO1za2mJDx
 RDiW9Lr1xFyQ==
X-IronPort-AV: E=Sophos;i="5.79,394,1602572400"; 
   d="scan'208";a="479563997"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2021 03:01:19 -0800
Received: by lahna (sSMTP sendmail emulation); Tue, 02 Feb 2021 13:01:17 +0200
Date:   Tue, 2 Feb 2021 13:01:17 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Gil Fine <gil.fine@intel.com>
Cc:     andreas.noever@gmail.com, michael.jamet@intel.com,
        YehezkelShB@gmail.com, linux-usb@vger.kernel.org, lukas@wunner.de
Subject: Re: [PATCH] thunderbolt: debugfs: handle fail reading block
Message-ID: <20210202110117.GV2542@lahna.fi.intel.com>
References: <20210201214637.2158-1-gil.fine@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210201214637.2158-1-gil.fine@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Gil,

On Mon, Feb 01, 2021 at 11:46:37PM +0200, Gil Fine wrote:
> There are cases when reading block of dwords in single transaction fail,
> for several reasons, mostly if HW publish to implement all of the dwords,
> while actually it doesn't or if some dwords not accessible for read
> for security reasons. We handle these cases by trying to read the block,
> dword-by-dword, one dword per transaction, till we get a failure.
> We drop the not-used functions:
> tb_switch_is_tiger_lake() and tb_switch_is_ice_lake()

Can you do this part (dropping the unused functions) in a separate
patch?

Otherwise looks good to me.
