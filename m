Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 44411170E28
	for <lists+linux-usb@lfdr.de>; Thu, 27 Feb 2020 03:03:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728274AbgB0CD1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 Feb 2020 21:03:27 -0500
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:17935 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728217AbgB0CD0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 26 Feb 2020 21:03:26 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e5723490000>; Wed, 26 Feb 2020 18:02:49 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Wed, 26 Feb 2020 18:03:26 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Wed, 26 Feb 2020 18:03:26 -0800
Received: from [10.19.108.125] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 27 Feb
 2020 02:03:24 +0000
Subject: Re: [PATCH] usb: host: xhci-tegra: Tegra186/Tegra194 LPM
To:     Mathias Nyman <mathias.nyman@linux.intel.com>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     <gregkh@linuxfoundation.org>, <jonathanh@nvidia.com>,
        <linux-tegra@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <nkristam@nvidia.com>
References: <20200224062145.25785-1-jckuo@nvidia.com>
 <20200224125100.GA2108060@ulmo>
 <223f5f09-781a-825d-e75e-3b878acec27d@nvidia.com>
 <6c93af2b-5a4d-a3ad-07f4-f5c72f569752@linux.intel.com>
X-Nvconfidentiality: public
From:   JC Kuo <jckuo@nvidia.com>
Message-ID: <f819d55a-8479-b15f-b06c-a8d391a64e04@nvidia.com>
Date:   Thu, 27 Feb 2020 10:03:08 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <6c93af2b-5a4d-a3ad-07f4-f5c72f569752@linux.intel.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1582768969; bh=lK6dW+IEyWhiwClCKvj+UqE+UR6I9nzlO2znKXwoWDM=;
        h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
         Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
         X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=BaJLcL01rmpSpRsgTrZ9/YKvBXkFV3y6/VSnJjCvqX/kc3zyeLagz/SzOkxbrDYG2
         T35gfIeD9677HXPMM9iKP1GFhbaXhuqCK4z1wrGwT0yuMbMJ2YnfiO1TU37r40eYKa
         9x0NzTJfyk0nDtJDkvkQzLy8CTd1CYCBhRR0jtVrXG3YUPQKpB/CV+yiJ6nvSxVlYa
         N+mzEvEYUqbBDTEwl64CZBGeT1AU09TMHe17bBdX4EJqC+g9dPYlRi6a8DmMKDMlSd
         ppGEYPtNn/XHwmsbCrkPe4N2Z842YZIYdjNAsEZ96Y6sHCwspgSJkBtkiDd8602lgV
         BRBqMLsPwRgtA==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Mathias,
Thanks for the tip. It's really helpful.

root@tegra-ubuntu:/d/usb/xhci/3610000.usb/ports/port04# cat portsc
Powered Connected Enabled Link:U2 PortSpeed:4 Change: Wake:

-JC

On 2/26/20 5:32 PM, Mathias Nyman wrote:
> On 26.2.2020 10.12, JC Kuo wrote:
>> Hi Thierry,
>> Yes, it can be verified with a LPM capable device. For example, a VIA USB 3.0
>> hub is connected to Jetson-Xavier. "lsusb -v" output [1] shows the device
>> supports LPM and the host has enabled U1/U2 states for the device. If host LPM
>> is disabled, there will be no "U1 Enabled" and "U2 Enabled" strings in "Device
>> Status" section.
>>
>> To check LPM operation, disconnect all USB 3.0 devices from the hub and disable
>> runtime PM for the super-speed portion of the hub, so that it won't be
>> auto-suspended.
>> root@tegra-ubuntu:~# echo on > /sys/bus/usb/devices/2-4/power/control
>>
>> Since there is no data transaction for the hub, link will enter U2 soon. This
>> can be checked by reading XHCI.PORTSC register. In below, PLS (Port Link State)
>> field is U2.
>> root@tegra-ubuntu:~# devmem 0x3610450
>> 0x00001243
> 
> A more human friendly way to read portsc registers:
> 
> # cat /sys/kernel/debug/usb/xhci/0000\:00\:14.0/ports/port02/portsc 
> Powered Connected Enabled Link:U0 PortSpeed:3 Change: Wake: 
> 
> -Mathias
> 
