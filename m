Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A59CC1001B1
	for <lists+linux-usb@lfdr.de>; Mon, 18 Nov 2019 10:50:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726750AbfKRJt6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 18 Nov 2019 04:49:58 -0500
Received: from hqemgate15.nvidia.com ([216.228.121.64]:5828 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726488AbfKRJt5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 18 Nov 2019 04:49:57 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5dd269420000>; Mon, 18 Nov 2019 01:49:54 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 18 Nov 2019 01:49:57 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 18 Nov 2019 01:49:57 -0800
Received: from [10.26.11.241] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 18 Nov
 2019 09:49:54 +0000
Subject: Re: [PATCH] usb: host: xhci-tegra: Correct phy enable sequence
To:     Thierry Reding <thierry.reding@gmail.com>,
        Nagarjuna Kristam <nkristam@nvidia.com>,
        <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Jui Chang Kuo <jckuo@nvidia.com>,
        linux-tegra <linux-tegra@vger.kernel.org>
References: <1572859470-7823-1-git-send-email-nkristam@nvidia.com>
 <20191107153231.GC2580600@ulmo>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <e36b8dad-768b-bc2e-6aba-1ee96fd9deeb@nvidia.com>
Date:   Mon, 18 Nov 2019 09:49:52 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191107153231.GC2580600@ulmo>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="windows-1252"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1574070594; bh=UwwI8VP046uCwejur/7YzcQ8zuZ+qEr0E6VrEQyZXJ0=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=pvK9CeOd2HI8undkM4dPDMwLbNWC3+Z7jrFCPBIDkaeeOL1MRQTglpJt5/hbzZ6qU
         nj9ekZmj5AV8bFaU7rWO002f6zQpNQ68iC1g309/lhYc5P/rhFh9enyZu+FpanRsZY
         S4vQnm9mzwVaAodNEqg78BpptvHd3B/mciu8KaaB8UZflOU6NS4NLFPcch15zIAW+b
         Eogm66BWjT/ylKSUGBTdOWcqHSm/kzYoN7mw03nZZBsQILbnFw94E/NFkyI9bJi2bv
         Xm6dQTCEpPpz3MmRFIBaDfuO1k/M6Dv0AC+2eQ26t97uCmu1GGXztSz8fG5+OICc6h
         d19VGkgKQsUNQ==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg,

On 07/11/2019 15:32, Thierry Reding wrote:
> On Mon, Nov 04, 2019 at 02:54:30PM +0530, Nagarjuna Kristam wrote:
>> XUSB phy needs to be enabled before un-powergating the power partitions.
>> However in the current sequence, it happens opposite. Correct the phy
>> enable and powergating partition sequence to avoid any boot hangs.
>>
>> Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
>> Signed-off-by: Jui Chang Kuo <jckuo@nvidia.com>
>> ---
>>  drivers/usb/host/xhci-tegra.c | 25 +++++++++++++------------
>>  1 file changed, 13 insertions(+), 12 deletions(-)
> 
> Acked-by: Thierry Reding <treding@nvidia.com>

Let me know if you can pick this one up? This is fixing a boot
regression on Tegra210.

Tested-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

-- 
nvpublic
