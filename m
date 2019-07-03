Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5B1F65DE00
	for <lists+linux-usb@lfdr.de>; Wed,  3 Jul 2019 08:24:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726236AbfGCGYJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 3 Jul 2019 02:24:09 -0400
Received: from mga07.intel.com ([134.134.136.100]:54499 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725927AbfGCGYJ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 3 Jul 2019 02:24:09 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 02 Jul 2019 23:24:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,446,1557212400"; 
   d="scan'208";a="362928867"
Received: from pipin.fi.intel.com (HELO pipin) ([10.237.72.175])
  by fmsmga006.fm.intel.com with ESMTP; 02 Jul 2019 23:24:07 -0700
From:   Felipe Balbi <balbi@kernel.org>
To:     Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Greg KH <greg@kroah.com>
Cc:     "linux-usb\@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: Aspeed vhub configuration
In-Reply-To: <3cea94e3f461c44c0799c2d494b174d20895cc08.camel@kernel.crashing.org>
References: <44bb150fb8b283a3036a382fa7e821b045554c15.camel@kernel.crashing.org> <20190702122430.GC12019@kroah.com> <e90076897577e2b4d2ad864eff85406b19f88dd3.camel@kernel.crashing.org> <8736jobnnb.fsf@linux.intel.com> <3cea94e3f461c44c0799c2d494b174d20895cc08.camel@kernel.crashing.org>
Date:   Wed, 03 Jul 2019 09:24:06 +0300
Message-ID: <87h883d4ah.fsf@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


Hi,

Benjamin Herrenschmidt <benh@kernel.crashing.org> writes:

> On Tue, 2019-07-02 at 15:56 +0300, Felipe Balbi wrote:
>> We already have an interface for disconnecting from the host
>> programatically by disconnecting data pullup.
>> 
>> static ssize_t soft_connect_store(struct device *dev,
>>                 struct device_attribute *attr, const char *buf,
>> size_t n)
>
>  .../...
>
> I could reproduce the same interface for the vhub, at least it would
> provide consistency...
>
> The vhub itself is not an UDC device. It provides UDC devices that are
> the hub "ports".

Right, if you have your UDC devices and you implement ->udc_start(),
->udc_stop() and ->pullup(), you *already* have this interface for you.

-- 
balbi
