Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 03E08E940A
	for <lists+linux-usb@lfdr.de>; Wed, 30 Oct 2019 01:18:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726076AbfJ3ASE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 29 Oct 2019 20:18:04 -0400
Received: from foss.arm.com ([217.140.110.172]:58664 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726048AbfJ3ASE (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 29 Oct 2019 20:18:04 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ADC361FB;
        Tue, 29 Oct 2019 17:18:03 -0700 (PDT)
Received: from [192.168.1.124] (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B6C2E3F71E;
        Tue, 29 Oct 2019 17:18:02 -0700 (PDT)
Subject: Re: [PATCH 0/5] add rk3328 usb3 phy driver
From:   Robin Murphy <robin.murphy@arm.com>
To:     Peter Geis <pgwipeout@gmail.com>, heiko@sntech.de, kishon@ti.com
Cc:     katsuhiro@katsuster.net, linux-rockchip@lists.infradead.org,
        linux-usb@vger.kernel.org
References: <20191028182254.30739-1-pgwipeout@gmail.com>
 <5230f80c-9684-72e0-8f96-602428a9e655@arm.com>
Message-ID: <9e5546de-f5b6-7f60-96d0-612249e832ce@arm.com>
Date:   Wed, 30 Oct 2019 00:17:56 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <5230f80c-9684-72e0-8f96-602428a9e655@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 2019-10-28 6:41 pm, Robin Murphy wrote:
> On 28/10/2019 18:22, Peter Geis wrote:
>> It took a lot more effort than originally anticipated, but here it is.
>> This is the driver from [0], updated to work with the current kernel.
>> I've tested it on the rk3328-roc-cc board, both usb 2.0 and usb 3.0
>> devices detect on hotplug.
> 
> Thanks Peter, I'll try to give this a go on my box for confirmation.

OK, I hooked it up with a vbus-drv-gpio hacked in - USB 2.0 
unplug/replug does indeed work fine, but it takes a while to acknowledge 
an unplug of a USB 3.0 device, and throws a bunch of errors every time:

[  288.229568] usb usb4-port1: Cannot enable. Maybe the USB cable is bad?
[  290.809599] usb usb4-port1: Cannot enable. Maybe the USB cable is bad?
[  293.389594] usb usb4-port1: Cannot enable. Maybe the USB cable is bad?
[  295.969600] usb usb4-port1: Cannot enable. Maybe the USB cable is bad?
[  295.970418] usb 4-1: USB disconnect, device number 10
[  299.209631] usb usb4-port1: Cannot enable. Maybe the USB cable is bad?
[  301.789655] usb usb4-port1: Cannot enable. Maybe the USB cable is bad?
[  301.790534] usb usb4-port1: attempt power cycle

(although new devices are still detected OK eventually)

Robin.

> One quick comment is that it might be worth importing the version from 
> Rockchip's own kernel tree, as that includes this additional patch which 
> looks like a welcome improvement:
> 
> https://github.com/rockchip-linux/kernel/commit/12efa9acad65b4c3256683c1ccd769687be3ca56#diff-b6317b3425ac054be551abdcda910b68 
> 
> 
> Also, as it's a new phy driver, we should keep Kishon (+cc) in the loop 
> as the subsystem maintainer.
> 
> Robin.
> 
>> [0] 
>> https://github.com/FireflyTeam/kernel/commits/roc-rk3328-cc/drivers/phy/rockchip/phy-rockchip-inno-usb3.c 
>>
>>
>> Peter Geis (5):
>>    phy: rockchip: add inno-usb3 phy driver
>>    dt-bindings: clean up rockchip grf binding document
>>    Documentation: bindings: add dt documentation for rockchip usb3 phy
>>    arm64: dts: rockchip: add usb3 to rk3328 devicetree
>>    arm64: dts: rockchip: enable usb3 on rk3328-roc-cc
>>
>>   .../bindings/phy/phy-rockchip-inno-usb3.yaml  |  157 +++
>>   .../devicetree/bindings/soc/rockchip/grf.txt  |    8 +-
>>   .../devicetree/bindings/usb/rockchip,dwc3.txt |    9 +-
>>   .../arm64/boot/dts/rockchip/rk3328-roc-cc.dts |   21 +
>>   arch/arm64/boot/dts/rockchip/rk3328.dtsi      |   72 ++
>>   drivers/phy/rockchip/Kconfig                  |    9 +
>>   drivers/phy/rockchip/Makefile                 |    1 +
>>   drivers/phy/rockchip/phy-rockchip-inno-usb3.c | 1107 +++++++++++++++++
>>   8 files changed, 1378 insertions(+), 6 deletions(-)
>>   create mode 100644 
>> Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb3.yaml
>>   create mode 100644 drivers/phy/rockchip/phy-rockchip-inno-usb3.c
>>
> 
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip
