Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C8294875FD
	for <lists+linux-usb@lfdr.de>; Fri,  9 Aug 2019 11:32:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406048AbfHIJce (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 9 Aug 2019 05:32:34 -0400
Received: from mga12.intel.com ([192.55.52.136]:51685 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2405967AbfHIJce (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 9 Aug 2019 05:32:34 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 09 Aug 2019 02:32:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,364,1559545200"; 
   d="scan'208";a="374439671"
Received: from pipin.fi.intel.com (HELO pipin) ([10.237.72.175])
  by fmsmga005.fm.intel.com with ESMTP; 09 Aug 2019 02:32:33 -0700
From:   Felipe Balbi <balbi@kernel.org>
To:     Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH] [RFC] usb: gadget: hid: Add "single_ep" option
In-Reply-To: <146d724c5df6b6e9a98f9d1d69a85be23eed0311.camel@kernel.crashing.org>
References: <5db94157b9b3b89b2874a4f91505e4b860903ac6.camel@kernel.crashing.org> <8736iagb11.fsf@gmail.com> <e326f0a27c04a5f23cee5ef36f38e3ddf11bbf5d.camel@kernel.crashing.org> <87zhki69sa.fsf@gmail.com> <146d724c5df6b6e9a98f9d1d69a85be23eed0311.camel@kernel.crashing.org>
Date:   Fri, 09 Aug 2019 12:32:32 +0300
Message-ID: <87ef1un0pb.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


Hi,

Benjamin Herrenschmidt <benh@kernel.crashing.org> writes:

> On Fri, 2019-08-09 at 11:08 +0300, Felipe Balbi wrote:
>> 
>> that works too. Another option would to introduce two options,
>> has_input_report and has_output_report and have them true by default.
>> 
>> Then user can even produce an output-only HID device, like these odd
>> USB-controlled relays.
>
> Ideally we could just parse the descriptor :-) But that's a bit
> trickier.
>
> One thing I've been meaning to look at is a way to properly handle
> keyboards (and other "on/off" buttons) by having the kernel latch the
> state so it can properly respond to things like get report, or resend
> all the "down" keys after a reset (so that things like "keep some key
> pressed during boot for magic to happen") actually works...

cool idea

> But one thing at a time :-)

yup

-- 
balbi
