Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72A751D1B4A
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2020 18:41:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732557AbgEMQlC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 13 May 2020 12:41:02 -0400
Received: from mga09.intel.com ([134.134.136.24]:25318 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728354AbgEMQlC (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 13 May 2020 12:41:02 -0400
IronPort-SDR: ZZkSCbb5JEQsXsBu9YZEuPIWKoAPK5EJYRVnWgPw2S4mo/SSH0Mh4srFcbbpXPcExfl50r3YjQ
 YX9UZGm0C3fg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2020 09:41:01 -0700
IronPort-SDR: 3MeCc5OBY+l5lwh4byl6fFGi/o2sVfl2EKGn+uSOlIc/TVm3hLx/l/xPjjlcDnjEQAUvMVOYcP
 DzFfTyivQB1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,388,1583222400"; 
   d="scan'208";a="371958607"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga001.fm.intel.com with SMTP; 13 May 2020 09:40:59 -0700
Received: by lahna (sSMTP sendmail emulation); Wed, 13 May 2020 19:40:58 +0300
Date:   Wed, 13 May 2020 19:40:58 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     David Manouchehri <david.manouchehri@riseup.net>
Cc:     YehezkelShB@gmail.com, linux-usb@vger.kernel.org,
        andreas.noever@gmail.com, michael.jamet@intel.com
Subject: Re: [PATCH] thunderbolt: Update Kconfig to allow building on other
 architectures.
Message-ID: <20200513164058.GK2571@lahna.fi.intel.com>
References: <CAJEJqRzVe1oWZAWMq=JLkAtDpH4pxvLVoh4uO=qqF+a6sL77uA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJEJqRzVe1oWZAWMq=JLkAtDpH4pxvLVoh4uO=qqF+a6sL77uA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, May 11, 2020 at 05:42:51PM -0400, David Manouchehri wrote:
> Thunderbolt 3 and USB4 shouldn't be x86 only.

Fully agree.

> Tested on a SolidRun HoneyComb (ARM Cortex-A72) with a
> Gigabyte Titan Ridge Thunderbolt 3 PCIe card (JHL7540).

Nice :)

> Signed-off-by: David Manouchehri <david.manouchehri@riseup.net>

Applied, thanks!
