Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 935A730EDA3
	for <lists+linux-usb@lfdr.de>; Thu,  4 Feb 2021 08:47:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234566AbhBDHps (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 4 Feb 2021 02:45:48 -0500
Received: from mga07.intel.com ([134.134.136.100]:39667 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230270AbhBDHpp (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 4 Feb 2021 02:45:45 -0500
IronPort-SDR: JLDaigr7QfAFj7PlYsIHnZmZ4SYuIKLqGuM+f1TzgoC6cohvYuFJsrFn+SosduwcOkaifRLUb5
 HpL1/Zl1VZ5w==
X-IronPort-AV: E=McAfee;i="6000,8403,9884"; a="245262985"
X-IronPort-AV: E=Sophos;i="5.79,400,1602572400"; 
   d="scan'208";a="245262985"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2021 23:43:59 -0800
IronPort-SDR: Uoky4kgUqX1kGqtZOHhjeBaYxHXR8ui/nQQjRI1/uL8IQ6qsi9g3g7f6CXZ9r17Ha4LaZIwKHR
 XZ7ABUmmrubQ==
X-IronPort-AV: E=Sophos;i="5.79,400,1602572400"; 
   d="scan'208";a="433810668"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2021 23:43:57 -0800
Received: by lahna (sSMTP sendmail emulation); Thu, 04 Feb 2021 09:43:54 +0200
Date:   Thu, 4 Feb 2021 09:43:54 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Isaac Hazan <isaac.hazan@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Lukas Wunner <lukas@wunner.de>
Subject: Re: [PATCH] thunderbolt: dma_test: Drop unnecessary include
Message-ID: <20210204074354.GO2542@lahna.fi.intel.com>
References: <20210201122101.87783-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210201122101.87783-1-mika.westerberg@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Feb 01, 2021 at 03:21:01PM +0300, Mika Westerberg wrote:
> It seems <linux/acpi.h> is not actually needed in this driver so we can
> drop it.
> 
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Applied to thunderbolt.git/next.
