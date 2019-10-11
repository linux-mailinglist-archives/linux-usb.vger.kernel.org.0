Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B7B2ED4066
	for <lists+linux-usb@lfdr.de>; Fri, 11 Oct 2019 15:06:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728098AbfJKNGg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 11 Oct 2019 09:06:36 -0400
Received: from mga14.intel.com ([192.55.52.115]:24485 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727709AbfJKNGg (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 11 Oct 2019 09:06:36 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 11 Oct 2019 06:06:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,284,1566889200"; 
   d="scan'208";a="395742055"
Received: from pipin.fi.intel.com (HELO pipin) ([10.237.72.175])
  by fmsmga006.fm.intel.com with ESMTP; 11 Oct 2019 06:06:34 -0700
From:   Felipe Balbi <felipe.balbi@linux.intel.com>
To:     Roger Quadros <rogerq@ti.com>, laurent.pinchart@ideasonboard.com,
        paul.elder@ideasonboard.com,
        "linux-usb\@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: how to test g_webcam
In-Reply-To: <7c65d743-f6cd-846b-381a-07808c6f4c5a@ti.com>
References: <7c65d743-f6cd-846b-381a-07808c6f4c5a@ti.com>
Date:   Fri, 11 Oct 2019 16:06:34 +0300
Message-ID: <8736fzv3c5.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


Hi,

Roger Quadros <rogerq@ti.com> writes:

> Hi,
>
> I'm having a hard time to figure out how to get g_webcam working with
> the tip of http://git.ideasonboard.org/uvc-gadget.git
>
> Platform I'm using is dra7-evm with dwc3 controller.

which arguments are you passing to g_webcam?


> What platform was g_webcam and uvc-gadget last tested with?

I think we went through this a while back, but the problem back then was
related to bad arguments being passed to g_webcam. You should still be
able to find our discussion on linux-usb.

-- 
balbi
