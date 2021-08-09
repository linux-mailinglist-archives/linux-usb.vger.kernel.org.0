Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5504F3E4550
	for <lists+linux-usb@lfdr.de>; Mon,  9 Aug 2021 14:06:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233744AbhHIMGt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 9 Aug 2021 08:06:49 -0400
Received: from mga05.intel.com ([192.55.52.43]:36748 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233603AbhHIMGs (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 9 Aug 2021 08:06:48 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10070"; a="300263921"
X-IronPort-AV: E=Sophos;i="5.84,307,1620716400"; 
   d="scan'208";a="300263921"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2021 05:06:27 -0700
X-IronPort-AV: E=Sophos;i="5.84,307,1620716400"; 
   d="scan'208";a="670769573"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2021 05:06:24 -0700
Received: by lahna (sSMTP sendmail emulation); Mon, 09 Aug 2021 15:06:21 +0300
Date:   Mon, 9 Aug 2021 15:06:21 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Sanjay R Mehta <Sanju.Mehta@amd.com>
Cc:     andreas.noever@gmail.com, michael.jamet@intel.com,
        YehezkelShB@gmail.com, Basavaraj.Natikar@amd.com,
        Nehal-bakulchandra.Shah@amd.com, Shyam-sundar.S-k@amd.com,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v3 0/4] Added some bug fixes for USB4
Message-ID: <YREaPR3xyxOkm3iL@lahna>
References: <1628269148-51355-1-git-send-email-Sanju.Mehta@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1628269148-51355-1-git-send-email-Sanju.Mehta@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On Fri, Aug 06, 2021 at 11:59:04AM -0500, Sanjay R Mehta wrote:
> From: Sanjay R Mehta <sanju.mehta@amd.com>
> 
> This series adds some general USB4 bug fixes as per USB4 Spec.
> 
> v2:
> 	- Added quirk to handle any vendor specific quirks.
> v1: 
> 	- removed PCI-IDs as AMD USB4 controller exposes USB4 class ID.
> 	- removed clearing of interrupt using interrupt status clear register.
> 	- skip port Adapter(0) initialisation for both host router & device router.
> 
> Sanjay R Mehta (4):
>   thunderbolt: Add quirk to support vendor specific implementation
>   thunderbolt: Handle ring interrupt by reading intr status
>   thunderbolt: Skip port init for control adapter(0)
>   thunderbolt: Fix port linking by checking all adapters

I did some minor tweaks and removed the "Fixes" lines since these are
actually not fixes per se more like improvements :) Then applied all to
thunderbolt.git/next. Please check that they still work on AMD hardware
and make sense in general.

Thanks!
