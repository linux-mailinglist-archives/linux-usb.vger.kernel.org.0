Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9C43419285
	for <lists+linux-usb@lfdr.de>; Mon, 27 Sep 2021 12:49:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233904AbhI0Kv0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 27 Sep 2021 06:51:26 -0400
Received: from mga02.intel.com ([134.134.136.20]:41843 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233866AbhI0Kv0 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 27 Sep 2021 06:51:26 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10119"; a="211700320"
X-IronPort-AV: E=Sophos;i="5.85,326,1624345200"; 
   d="scan'208";a="211700320"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2021 03:49:48 -0700
X-IronPort-AV: E=Sophos;i="5.85,326,1624345200"; 
   d="scan'208";a="437666516"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2021 03:49:46 -0700
Received: by lahna (sSMTP sendmail emulation); Mon, 27 Sep 2021 13:49:43 +0300
Date:   Mon, 27 Sep 2021 13:49:43 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Sanjay R Mehta <Sanju.Mehta@amd.com>
Cc:     andreas.noever@gmail.com, michael.jamet@intel.com,
        YehezkelShB@gmail.com, Basavaraj.Natikar@amd.com,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH] thunderbolt: Enable retry logic for intra-domain control
 packets
Message-ID: <YVGhxy7YZtQ/94Ft@lahna>
References: <1632469464-53954-1-git-send-email-Sanju.Mehta@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1632469464-53954-1-git-send-email-Sanju.Mehta@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Sep 24, 2021 at 02:44:24AM -0500, Sanjay R Mehta wrote:
> From: Sanjay R Mehta <sanju.mehta@amd.com>
> 
> In case of software connection manager, the response packets are lost
> sometimes within the stipulated time. Hence resending the control
> packets in such scenario by increasing the retry count TB_CTL_RETRIES
> value.
> 
> Signed-off-by: Sanjay R Mehta <sanju.mehta@amd.com>
> Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Applied, thanks!
