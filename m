Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FA92245EAF
	for <lists+linux-usb@lfdr.de>; Mon, 17 Aug 2020 10:01:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726707AbgHQIBp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 17 Aug 2020 04:01:45 -0400
Received: from mail2.skidata.com ([91.230.2.91]:20910 "EHLO mail2.skidata.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726089AbgHQIBn (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 17 Aug 2020 04:01:43 -0400
X-Greylist: delayed 429 seconds by postgrey-1.27 at vger.kernel.org; Mon, 17 Aug 2020 04:01:42 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
  t=1597651302; x=1629187302;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4ofZrqwAJsIrM6P1Vwx0HSmOUvg40eLwTglG9qnXtQI=;
  b=YPna2yU3tqDJlPYDgFaDitGcq2Vat/kKxTBzSpTgl//2pnGdHzVOq1Ic
   JBNQYwxwRjQKzR+T3aIwIvTmDws8s6MRG1qNBbdXkJZ1AQ950T99WE0r1
   lBK5emT8R1dMEed52VE3YeKpioWp6/ZnuzIysnRuGPmftJ86CPSVrsKuI
   59H8jU/+1WpwtSont0b8dA2RPsnU/AQl0J7TR5JDIkv7ShasxKok13LZj
   tiLEy8C0CxzwvGmbVQlsFu0bB+LqXx4gfKakywwL4fV0AoVljts0jjcGh
   nRdKpb6yMN63TG54pVCEcY0wNYwI6Jsw8lgp1wlgKKSIp65iai3o49Vm+
   Q==;
IronPort-SDR: E6jKT3W4gGuPCqcb4dACYlUcJdMvMQ6vN3AbLOWDsFITViC1ocTwq1NFR8yGc6UYCithd/ds9s
 LPsfgBt9exsxIDt7Cyls6tvynZTqeupkZtIlqWC4Dj3vUtFmkq5ntcwsd7c0PGxzzJ4nfm0V8B
 RjUVFTXtvCyL5tAsN4ROaAJ0yohsvLVjerg1Vlr8I4Y63JzHavc/QzETBWPP406Je0v+nZiGr2
 zpp3CSi1EhzAgl6Kt38qpvIN7JsLTIy6kvy4BaIA+KHSXcnt1KuyRdMnsAN01TCTx0J/zeS+JY
 ybk=
X-IronPort-AV: E=Sophos;i="5.76,322,1592863200"; 
   d="scan'208";a="2642593"
Date:   Mon, 17 Aug 2020 09:54:26 +0200
From:   Richard Leitner <richard.leitner@skidata.com>
To:     Christian Eggers <ceggers@arri.de>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Hering <robh@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        <devicetree@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] Add two new configuration drivers for Microchip USB
 hubs
Message-ID: <20200817075426.GA560469@pcleri>
References: <20200726084116.GD448215@kroah.com>
 <20200727083333.19623-1-ceggers@arri.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200727083333.19623-1-ceggers@arri.de>
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex6srv.skidata.net (192.168.111.84) To
 sdex5srv.skidata.net (192.168.111.83)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jul 27, 2020 at 10:33:29AM +0200, Christian Eggers wrote:
> On Sonday, greg k-h wrote:
> > Please resend the whole series, not just a single patch, as it makes it
> > very difficult to pick the "correct" patches to be applied...

Hi Christian,
sorry for the late reply. My MUA somehow didn't show me that series
earlier...

I haven't looked into the patches in detail, but at a first glance it
looks like a lot copy-n-paste.
Have you thought about merging the (after your series) 3 hub drivers
into one? Something like a "microchip i2c usb hub driver"?
Would that be feasible for your point of view?

regards;rl

> 
> Changes in v3:
>  - none (only resend the whole series)
> 
> Changes in v2:
>  - added property description for ocs-min-width-ms
>  - fixed property description for oc-delay-ns
> 
