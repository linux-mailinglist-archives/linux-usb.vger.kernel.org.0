Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 838F92C53D7
	for <lists+linux-usb@lfdr.de>; Thu, 26 Nov 2020 13:17:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728014AbgKZMRR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 26 Nov 2020 07:17:17 -0500
Received: from mga07.intel.com ([134.134.136.100]:2984 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726062AbgKZMRR (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 26 Nov 2020 07:17:17 -0500
IronPort-SDR: jEXcbIjR3XmEohb30AuCAPJEEoHb2qFjAzpaCuFVIndXk5J16gNXItUMDoKgBvbFEsoAcZ5H2U
 CIoxxVAoPizQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9816"; a="236408057"
X-IronPort-AV: E=Sophos;i="5.78,372,1599548400"; 
   d="scan'208";a="236408057"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2020 04:17:16 -0800
IronPort-SDR: jvlSswvBnRaFvq+NSTvcdwS1GLYLL0uAp6p/FjKJHyfe4hs5Lt/iHxoUK8XRqTjIMCeaTgZef5
 H2owViwS+zqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,372,1599548400"; 
   d="scan'208";a="433257872"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 26 Nov 2020 04:17:14 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Thu, 26 Nov 2020 14:17:13 +0200
Date:   Thu, 26 Nov 2020 14:17:13 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     "Shah, Nehal-bakulchandra" <nehal-bakulchandra.shah@amd.com>
Cc:     harry.wentland@amd.com, linux-usb@vger.kernel.org,
        Sandeep Singh <Sandeep.Singh@amd.com>
Subject: Re: Display Alt mode with TPS6598x driver
Message-ID: <20201126121713.GO1008337@kuha.fi.intel.com>
References: <bf85cdbb-23a1-107d-4e7b-679506810248@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bf85cdbb-23a1-107d-4e7b-679506810248@amd.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Nov 25, 2020 at 08:51:24PM +0530, Shah, Nehal-bakulchandra wrote:
> Hi Heikki,
> 
> I am working on the project with PD controller as TPS6598x. The current
> implementation of TPS6598x does not invoke display alt mode driver .
> 
> Can you help me to understand how to achieve this?

You should be able to get an idea how to achieve that for example by
checking how we did it for UCSI: drivers/usb/typec/ucsi/displayport.c

I think you should start by first only registering the alternate mode
without any control. That way you should not need to deal with
anything else except the DP SID Status register.

After that we can add control as the next step.

If you need more help, let me know.

Br,

-- 
heikki
