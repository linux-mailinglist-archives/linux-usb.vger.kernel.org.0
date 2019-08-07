Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 509198495F
	for <lists+linux-usb@lfdr.de>; Wed,  7 Aug 2019 12:22:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728747AbfHGKWb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 7 Aug 2019 06:22:31 -0400
Received: from mga06.intel.com ([134.134.136.31]:8005 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727012AbfHGKWb (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 7 Aug 2019 06:22:31 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 07 Aug 2019 03:22:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,357,1559545200"; 
   d="scan'208";a="176156686"
Received: from pipin.fi.intel.com (HELO pipin) ([10.237.72.175])
  by fmsmga007.fm.intel.com with ESMTP; 07 Aug 2019 03:22:26 -0700
From:   Felipe Balbi <felipe.balbi@linux.intel.com>
To:     Roger Quadros <rogerq@ti.com>, Pawel Laszczak <pawell@cadence.com>,
        "devicetree\@vger.kernel.org" <devicetree@vger.kernel.org>
Cc:     "gregkh\@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb\@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "hdegoede\@redhat.com" <hdegoede@redhat.com>,
        "heikki.krogerus\@linux.intel.com" <heikki.krogerus@linux.intel.com>,
        "robh+dt\@kernel.org" <robh+dt@kernel.org>,
        "linux-kernel\@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "jbergsagel\@ti.com" <jbergsagel@ti.com>,
        "nsekhar\@ti.com" <nsekhar@ti.com>, "nm\@ti.com" <nm@ti.com>,
        Suresh Punnoose <sureshp@cadence.com>,
        "peter.chen\@nxp.com" <peter.chen@nxp.com>,
        Jayshri Dajiram Pawar <jpawar@cadence.com>,
        Rahul Kumar <kurahul@cadence.com>
Subject: Re: [PATCH v9 2/6] usb:gadget Separated decoding functions from dwc3 driver.
In-Reply-To: <b66216dd-6fcf-2900-e67b-42fdb81af78a@ti.com>
References: <1562324238-16655-1-git-send-email-pawell@cadence.com> <1562324238-16655-3-git-send-email-pawell@cadence.com> <87tvc0lngz.fsf@linux.intel.com> <BYAPR07MB4709964C1D0AA2A851BF2F55DDF50@BYAPR07MB4709.namprd07.prod.outlook.com> <b66216dd-6fcf-2900-e67b-42fdb81af78a@ti.com>
Date:   Wed, 07 Aug 2019 13:22:25 +0300
Message-ID: <877e7pnula.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


Hi,

Roger Quadros <rogerq@ti.com> writes:
>>>> +extern const char *usb_decode_ctrl(char *str, size_t size, __u8 bRequestType,
>>>> +				   __u8 bRequest, __u16 wValue, __u16 wIndex,
>>>> +				   __u16 wLength);
>>>> +
>>>
>>> where's the stub when !TRACING?
>> 
>> Right, I will add 
>> #ifdef	CONFIG_TRACING 
>> 	.....
>> #endif 
>
> Can usb_decode_ctrl() be used even when CONFIG_TRACING is not set?
> If yes then above #ifdefe is not sufficient.
>
> You might need to do something like
>
> #if defined(CONFIG_TRACING)
>
> extern const char *usb_decode_ctrl(..)
>
> #else
>
> static inline const char *usb_decode_ctrl(..) {
> 	return NULL;
> }
>
> #endif

This is what I mean. They shouldn't be used outside of TRACING, but it's
far safer to have the stubs.

-- 
balbi
