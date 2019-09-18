Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2C3A6B5EFF
	for <lists+linux-usb@lfdr.de>; Wed, 18 Sep 2019 10:21:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730138AbfIRIVC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 18 Sep 2019 04:21:02 -0400
Received: from mail2.skidata.com ([91.230.2.91]:64090 "EHLO mail2.skidata.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726131AbfIRIVB (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 18 Sep 2019 04:21:01 -0400
X-Greylist: delayed 428 seconds by postgrey-1.27 at vger.kernel.org; Wed, 18 Sep 2019 04:21:01 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
  t=1568794861; x=1600330861;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=vHU/01bHlOuKhCjoKe3gSKsq2NLpmQKm4ZkOQIyq2i0=;
  b=LurmtiCq9SKWrmlfDsvs/VfZFs6NdqWRfLlmh++ClkVnLQKyLePKf0QH
   gvC+BqvoEGegsOMhbgrXkHNp8TPFuI7cnsVRC3rJ/a89gTNYIMT/keQ5F
   5SyhbhZjTKCRThZqPou89U2/OZl51tOLCqvxXEBAlKLlmxcFErLzIl/du
   q1trReHRbvrwysAl3ctaa2TPO7/a4wjVO8m59dRdVq+y4Qhr1QATQI48r
   63icrwXft+VA+UhJrxLwYXYOwC1c5z0c9slUVImEreF4HqLC3anHJm8bh
   /OmhLmDTD9DJV7/GQQvXqBj+IX3ponJo9Bc+QJfDzIS1F4zOQ28zk3WNL
   w==;
IronPort-SDR: rsL2ngqHgwDci4waXzzD6gAohTD8A8wXUMBWEGgbEAaBXF4+j7VtZvF9YbORL94wDDHGJ8iBBX
 a0o1NP8O7/2RYtYnrlHl6rTdbOuoyqotCJoPgoZi1W05/zS7VhTGabb5neyIwlSsvXjsuIytYl
 VmSYqGEYTiNWoQ21v/9zKt01BM9v6vfk8FhFEEZ/D8wdtwqIzWIjJzo2RkU8z6r2EmZ4WMsViD
 mCcS3qW6K6UStGmfB2SnRDgpyWIK2CeqX8LsuUfu6FuiiNLUCSH4z5wewASJY4aTTBfuM+iMoT
 WKg=
X-IronPort-AV: E=Sophos;i="5.64,520,1559512800"; 
   d="scan'208";a="2338233"
Subject: Re: [PATCH 1/4] dt-bindings: usb: usb251xb: add documentation for
 voltage supply
To:     Marco Felsch <m.felsch@pengutronix.de>, <robh+dt@kernel.org>,
        <fancer.lancer@gmail.com>
CC:     <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <kernel@pengutronix.de>
References: <20190917144449.32739-1-m.felsch@pengutronix.de>
 <20190917144449.32739-2-m.felsch@pengutronix.de>
From:   Richard Leitner <richard.leitner@skidata.com>
Message-ID: <81b0ede6-60e2-0092-d0b4-b2a090162605@skidata.com>
Date:   Wed, 18 Sep 2019 10:13:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190917144449.32739-2-m.felsch@pengutronix.de>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex3srv.skidata.net (192.168.111.81) To
 sdex5srv.skidata.net (192.168.111.83)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 17/09/2019 16:44, Marco Felsch wrote:
> Add the optional voltage supply documentation. If not specified the
> dummy-regulator is used.
> 
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>

Hi,
please feel free to add:

Acked-by: Richard Leitner <richard.leitner@skidata.com>

regards;Richard.L

> ---
>   Documentation/devicetree/bindings/usb/usb251xb.txt | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/usb251xb.txt b/Documentation/devicetree/bindings/usb/usb251xb.txt
> index 17915f64b8ee..4d5808b1cee0 100644
> --- a/Documentation/devicetree/bindings/usb/usb251xb.txt
> +++ b/Documentation/devicetree/bindings/usb/usb251xb.txt
> @@ -12,6 +12,7 @@ Required properties :
>   
>   Optional properties :
>    - reset-gpios : Should specify the gpio for hub reset
> + - vdd-supply : Should specify the phandle to the regulator supplying vdd
>    - skip-config : Skip Hub configuration, but only send the USB-Attach command
>    - vendor-id : Set USB Vendor ID of the hub (16 bit, default is 0x0424)
>    - product-id : Set USB Product ID of the hub (16 bit, default depends on type)
> 
