Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1BE032810E
	for <lists+linux-usb@lfdr.de>; Mon,  1 Mar 2021 15:36:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236438AbhCAOgD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 1 Mar 2021 09:36:03 -0500
Received: from mga07.intel.com ([134.134.136.100]:9160 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236448AbhCAOft (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 1 Mar 2021 09:35:49 -0500
IronPort-SDR: EUEeiSA2XZY+kerko7PD7CGAQZaIfEr/EApblAw7kQTf9bZgV3pHTP4ilvx1Ilf+1C9mXIpjC5
 BkixUWhgfGGw==
X-IronPort-AV: E=McAfee;i="6000,8403,9909"; a="250531229"
X-IronPort-AV: E=Sophos;i="5.81,215,1610438400"; 
   d="scan'208";a="250531229"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2021 06:34:01 -0800
IronPort-SDR: AmALupyGgcKlhj2uU78WNRm0BFeuBeg3VspAUttQrRTorOV7yFvtRIsSKz4XrD+hidYEh+f4IM
 7oPaPWBL/aNg==
X-IronPort-AV: E=Sophos;i="5.81,215,1610438400"; 
   d="scan'208";a="406248403"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2021 06:33:58 -0800
Received: by lahna (sSMTP sendmail emulation); Mon, 01 Mar 2021 16:33:55 +0200
Date:   Mon, 1 Mar 2021 16:33:55 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Gil Fine <gil.fine@intel.com>
Cc:     andreas.noever@gmail.com, michael.jamet@intel.com,
        YehezkelShB@gmail.com, linux-usb@vger.kernel.org, lukas@wunner.de
Subject: Re: [PATCH v2 0/2] thunderbolt: debugfs: handle fail reading block
Message-ID: <20210301143355.GI2542@lahna.fi.intel.com>
References: <20210216130427.7317-1-gil.fine@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210216130427.7317-1-gil.fine@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Feb 16, 2021 at 03:04:25PM +0200, Gil Fine wrote:
> Applies on top of thunderbolt.git/next.
> 
> v1 can be found here:
> 
>   https://lore.kernel.org/linux-usb/20210201214637.2158-1-gil.fine@intel.com/
> 
> Changes from v1:
> 
>   * Split the previous patch into two patches so that
>     dropping of the unused functions reside in a separate patch
> 
> Gil Fine (2):
>   thunderbolt: debugfs: handle fail reading block
>   thunderbolt: drop unused functions for TGL and ICL

I did some minor edits to the patches and applied to
thunderbolt.git/next, thanks!
