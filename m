Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 41E308795B
	for <lists+linux-usb@lfdr.de>; Fri,  9 Aug 2019 14:05:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406669AbfHIMF6 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Fri, 9 Aug 2019 08:05:58 -0400
Received: from mga12.intel.com ([192.55.52.136]:61963 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726216AbfHIMF6 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 9 Aug 2019 08:05:58 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 09 Aug 2019 05:05:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,364,1559545200"; 
   d="scan'208";a="175139225"
Received: from pipin.fi.intel.com (HELO pipin) ([10.237.72.175])
  by fmsmga008.fm.intel.com with ESMTP; 09 Aug 2019 05:05:56 -0700
From:   Felipe Balbi <balbi@kernel.org>
To:     =?utf-8?Q?Micha=C5=82_Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ladislav Michl <ladis@linux-mips.org>
Subject: Re: [PATCH v5 2/6] usb: gadget: u_serial: reimplement console support
In-Reply-To: <0dd7dc4d5135b838d8f0fe98d0a689163cc9dda8.1563809035.git.mirq-linux@rere.qmqm.pl>
References: <cover.1563809035.git.mirq-linux@rere.qmqm.pl> <0dd7dc4d5135b838d8f0fe98d0a689163cc9dda8.1563809035.git.mirq-linux@rere.qmqm.pl>
Date:   Fri, 09 Aug 2019 15:05:55 +0300
Message-ID: <87r25utufw.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


Hi,

Michał Mirosław <mirq-linux@rere.qmqm.pl> writes:
> Rewrite console support to fix a few shortcomings of the old code
> preventing its use with multiple ports. This removes some duplicated
> code and replaces a custom kthread with simpler workqueue item.
>
> Only port ttyGS0 gets to be a console for now.
>
> Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Tested-by: Ladislav Michl <ladis@linux-mips.org>

checking file drivers/usb/gadget/function/u_serial.c
Hunk #7 FAILED at 1206.
Hunk #8 succeeded at 1302 (offset -2 lines).
Hunk #9 succeeded at 1334 (offset -2 lines).
Hunk #10 succeeded at 1363 (offset -2 lines).
1 out of 10 hunks FAILED

Could you rebase on my testing/next?

-- 
balbi
