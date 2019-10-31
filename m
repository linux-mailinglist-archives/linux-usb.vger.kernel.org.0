Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 45DABEAC82
	for <lists+linux-usb@lfdr.de>; Thu, 31 Oct 2019 10:23:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726948AbfJaJX3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 31 Oct 2019 05:23:29 -0400
Received: from mga06.intel.com ([134.134.136.31]:5741 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726776AbfJaJX3 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 31 Oct 2019 05:23:29 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 31 Oct 2019 02:23:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,250,1569308400"; 
   d="scan'208";a="211531401"
Received: from pipin.fi.intel.com (HELO pipin) ([10.237.72.175])
  by fmsmga001.fm.intel.com with ESMTP; 31 Oct 2019 02:23:27 -0700
From:   Felipe Balbi <felipe.balbi@linux.intel.com>
To:     Pavel Hofman <pavel.hofman@ivitera.com>
Cc:     Linux USB <linux-usb@vger.kernel.org>,
        Roger Quadros <rogerq@ti.com>
Subject: Re: [PATCH] usb: dwc3: gadget: fix race when disabling ep with cancelled xfers
In-Reply-To: <3cd8a46e-8c1a-84c1-eb82-27713cf16a87@ivitera.com>
References: <20191031090713.1452818-1-felipe.balbi@linux.intel.com> <3cd8a46e-8c1a-84c1-eb82-27713cf16a87@ivitera.com>
Date:   Thu, 31 Oct 2019 11:23:26 +0200
Message-ID: <87k18le0a9.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


Hi,

Pavel Hofman <pavel.hofman@ivitera.com> writes:

> Hi,
>
> Dne 31. 10. 19 v 10:07 Felipe Balbi napsal(a):
>> When disabling an endpoint which has cancelled requests, we should
>> make sure to giveback requests that are currently pending in the
>> cancelled list, otherwise we may fall into a situation where command
>> completion interrupt fires after endpoint has been disabled, therefore
>> causing a splat.
>> 
>
> Please is this problem (and its solution) also applicable to dwc2 (i.e. 
> e.g. RPi4)?

different driver, so no.

-- 
balbi
