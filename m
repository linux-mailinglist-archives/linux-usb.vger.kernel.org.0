Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7AD1E873C4
	for <lists+linux-usb@lfdr.de>; Fri,  9 Aug 2019 10:08:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405617AbfHIIIY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 9 Aug 2019 04:08:24 -0400
Received: from mga01.intel.com ([192.55.52.88]:59068 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726059AbfHIIIY (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 9 Aug 2019 04:08:24 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 09 Aug 2019 01:08:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,364,1559545200"; 
   d="scan'208";a="165944037"
Received: from pipin.fi.intel.com (HELO pipin) ([10.237.72.175])
  by orsmga007.jf.intel.com with ESMTP; 09 Aug 2019 01:08:22 -0700
From:   Felipe Balbi <balbi@kernel.org>
To:     Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH] [RFC] usb: gadget: hid: Add "single_ep" option
In-Reply-To: <e326f0a27c04a5f23cee5ef36f38e3ddf11bbf5d.camel@kernel.crashing.org>
References: <5db94157b9b3b89b2874a4f91505e4b860903ac6.camel@kernel.crashing.org> <8736iagb11.fsf@gmail.com> <e326f0a27c04a5f23cee5ef36f38e3ddf11bbf5d.camel@kernel.crashing.org>
Date:   Fri, 09 Aug 2019 11:08:21 +0300
Message-ID: <87zhki69sa.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


Hi,

Benjamin Herrenschmidt <benh@kernel.crashing.org> writes:

> On Fri, 2019-08-09 at 08:31 +0300, Felipe Balbi wrote:
>> Hi,
>> 
>> Benjamin Herrenschmidt <benh@kernel.crashing.org> writes:
>> 
>> > Some host drivers really do not like keyboards having an OUT
>> > endpoint.
>> > 
>> > For example, most UEFI forked from EDK2 before 2006 (or was it 2008
>> > ?)
>> > have a bug, they'll try to use the *last* interrupt EP in the
>> > descriptor list and just assume it's an IN endpoint. Newer UEFIs
>> > use the *first* interrupt endpoint instead. None of them checks the
>> > direction :-(
>> > 
>> > This adds a "single_ep" option to f_hid which allows to specify
>> > that
>> > only the IN path should be created. This should be used for
>> > keyboards
>> > if they are ever to be used with such systems as host.
>> > 
>> > Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
>> 
>> Could you come up with a slightly more descriptive name? single_ep
>> doesn't give me any hint of which endpoint will be left around.
>> 
>> Perhaps call it 'disable_output_report'?
>
> Sure. Or more concice "input_only" maybe ?

that works too. Another option would to introduce two options,
has_input_report and has_output_report and have them true by default.

Then user can even produce an output-only HID device, like these odd
USB-controlled relays.

-- 
balbi
