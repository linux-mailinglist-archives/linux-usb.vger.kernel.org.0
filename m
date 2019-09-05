Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 27967A9AAB
	for <lists+linux-usb@lfdr.de>; Thu,  5 Sep 2019 08:27:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731557AbfIEG1D (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 5 Sep 2019 02:27:03 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:17907 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731461AbfIEG1D (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 5 Sep 2019 02:27:03 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d70aab70000>; Wed, 04 Sep 2019 23:27:03 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Wed, 04 Sep 2019 23:27:02 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Wed, 04 Sep 2019 23:27:02 -0700
Received: from [10.19.108.121] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 5 Sep
 2019 06:27:00 +0000
Subject: Re: [PATCH 1/8] clk: tegra: Add PLLE HW power sequencer control
To:     Jon Hunter <jonathanh@nvidia.com>, <gregkh@linuxfoundation.org>,
        <thierry.reding@gmail.com>, <pdeschrijver@nvidia.com>,
        <afrid@nvidia.com>
CC:     <linux-tegra@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <nkristam@nvidia.com>,
        <skomatineni@nvidia.com>
References: <20190614074652.21960-1-jckuo@nvidia.com>
 <20190614074652.21960-2-jckuo@nvidia.com>
 <1d215b49-73f7-8f5c-c8cb-81bf73553b19@nvidia.com>
X-Nvconfidentiality: public
From:   JC Kuo <jckuo@nvidia.com>
Message-ID: <fb9517e8-e7db-613b-6922-b640c95f2a1a@nvidia.com>
Date:   Thu, 5 Sep 2019 14:26:58 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1d215b49-73f7-8f5c-c8cb-81bf73553b19@nvidia.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1567664823; bh=x5cnuyRHQdEEcbA8md+H1Rut458iUH61JVC0i8TXuSs=;
        h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
         Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
         X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=SkVviJxOqC8LyRKrzg9GH+z6A45IIoy7FSH864kecC6jP3BDZrqRMAAts86V5uVYf
         2rQ0oK9IzAH793aOJBWeTYQLGHpxJ/da491W+0/4cCrFl4tC/L9//N5xNyfBQG07Sj
         M8lqw33lgQnpuqcRAkY1YH0Lq2kJDXOYMU9lULVQ/Xtk8X20KzzmtY2AxtW5an8sLe
         +j16/wwjPUbHJKhapruyS+pyjlATU+DIJLwXXp/+Hot0G964D5oMXr8NSQk4TkaOj8
         CACDG1KOF+eLYUP3YHLJZbsIdP+0+rSD6U3dkw7y+uQtsN4HkiJ6pXysrOMCaZrLxr
         rpYqgqMRFZcGQ==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 7/4/19 8:16 PM, Jon Hunter wrote:
> 
> On 14/06/2019 08:46, JC Kuo wrote:
>> PLLE hardware power sequencer has to be enabled after PEX/SATA
>> UPHY PLL's sequencers are enabled.
>>
>> tegra210_plle_hw_sequence_start() for XUSB PADCTL driver to enable
>> PLLE hardware sequencer at proper time.
>>
>> tegra210_plle_hw_sequence_is_enabled() for XUSB PADCTL driver to
>> check whether PLLE hardware sequencer has been enabled or not.
> 
> I think that here to be clear about what is going on you should state
> that you are "adding the function tegra210_plle_hw_sequence_start() ..."
Thanks. I will amend the commit message accordingly.
> 
> Are these functions dependent upon clk_plle_tegra210_enable() already
> being called? I assume that there must be some dependency between the
> above functions and the existing plle enable function. If there is a
> dependency, how do you ensure the existing enable is already called?
Yes, tegra210_plle_hw_sequence_start() has to be invoked after PLLE is
enabled/locked. Caller is in charge of calling with correct sequence.
I will add a check in tegra210_plle_hw_sequence_start() to ensure that
PLLE HW sequencer will not be accidentally enabled when PLLE is not
enabled/locked yet.

Thanks,
JC
