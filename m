Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A0532A7BFD
	for <lists+linux-usb@lfdr.de>; Thu,  5 Nov 2020 11:37:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728371AbgKEKh5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 5 Nov 2020 05:37:57 -0500
Received: from mga18.intel.com ([134.134.136.126]:23555 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726400AbgKEKh5 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 5 Nov 2020 05:37:57 -0500
IronPort-SDR: skZUtvB36k+c1u43cOxnNKcj5nP8HlTHhJnOYY037Dju3G7VWp7yKr4UvHaCtJ/Cn7HmtjFjsA
 sv1tw0eyUC6A==
X-IronPort-AV: E=McAfee;i="6000,8403,9795"; a="157140088"
X-IronPort-AV: E=Sophos;i="5.77,453,1596524400"; 
   d="scan'208";a="157140088"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2020 02:37:56 -0800
IronPort-SDR: vtd5uq0/lEpH9P8JwAmODQZGcOgbXfw/lP24YiuRNegConPqJ6ia2xjhSandx1c+/1DDTy3zbU
 N796WQG6oEeg==
X-IronPort-AV: E=Sophos;i="5.77,453,1596524400"; 
   d="scan'208";a="354231632"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2020 02:37:53 -0800
Received: by lahna (sSMTP sendmail emulation); Thu, 05 Nov 2020 12:37:51 +0200
Date:   Thu, 5 Nov 2020 12:37:51 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Casey Bowman <casey.g.bowman@intel.com>,
        Lukas Wunner <lukas@wunner.de>
Subject: Re: [PATCH 1/3] thunderbolt: Fix memory leak if ida_simple_get()
 fails in enumerate_services()
Message-ID: <20201105103751.GF2495@lahna.fi.intel.com>
References: <20201029094636.51818-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201029094636.51818-1-mika.westerberg@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Oct 29, 2020 at 12:46:34PM +0300, Mika Westerberg wrote:
> The svc->key field is not released as it should be if ida_simple_get()
> fails so fix that.
> 
> Fixes: 9aabb68568b4 ("thunderbolt: Fix to check return value of ida_simple_get")
> Cc: stable@vger.kernel.org
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

This and the other 2 patches applied to thunderbolt.git/fixes.
