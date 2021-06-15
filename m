Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBAB23A7C86
	for <lists+linux-usb@lfdr.de>; Tue, 15 Jun 2021 12:55:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231612AbhFOK5H (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 15 Jun 2021 06:57:07 -0400
Received: from mga01.intel.com ([192.55.52.88]:16021 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231651AbhFOK5H (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 15 Jun 2021 06:57:07 -0400
IronPort-SDR: TOnkqmnp3Ml0fKaUBdU/gF4x6jWPFBP0zsoboVxytJLvyEGPERB3z8cdcPXPeM7L9ZpWK+2eEt
 8TsRiXuuBWvA==
X-IronPort-AV: E=McAfee;i="6200,9189,10015"; a="227432797"
X-IronPort-AV: E=Sophos;i="5.83,275,1616482800"; 
   d="scan'208";a="227432797"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2021 03:55:02 -0700
IronPort-SDR: Rm2KjeB6nKNr3Ho9NNRcX7UIuAlshgT7KptFL2w164ULKZv6oeEvl/Kfe83AX6GT0AXOws3Jxf
 DCTKNCTyRD7Q==
X-IronPort-AV: E=Sophos;i="5.83,275,1616482800"; 
   d="scan'208";a="553651280"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2021 03:54:59 -0700
Received: by lahna (sSMTP sendmail emulation); Tue, 15 Jun 2021 13:54:57 +0300
Date:   Tue, 15 Jun 2021 13:54:57 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Gil Fine <gil.fine@intel.com>
Cc:     andreas.noever@gmail.com, michael.jamet@intel.com,
        YehezkelShB@gmail.com, linux-usb@vger.kernel.org, lukas@wunner.de
Subject: Re: [PATCH] thunderbolt: Fix DROM handling for USB4 DROM
Message-ID: <YMiHAaPycVFrb+Kv@lahna>
References: <20210614135210.29787-1-gil.fine@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210614135210.29787-1-gil.fine@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jun 14, 2021 at 04:52:10PM +0300, Gil Fine wrote:
> DROM for USB4 host/device has a shorter header than Thunderbolt DROM
> header. This patch addresses host/device with USB4 DROM (According to spec:
> Universal Serial Bus 4 (USB4) Device ROM Specification, Rev 1.0, Feb-2021).
> 
> Signed-off-by: Gil Fine <gil.fine@intel.com>

I did some minor tweaks and applied to thunderbolt.git/next, thanks!
