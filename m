Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8477B5F942
	for <lists+linux-usb@lfdr.de>; Thu,  4 Jul 2019 15:40:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727242AbfGDNkz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 4 Jul 2019 09:40:55 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:17225 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727026AbfGDNkz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 4 Jul 2019 09:40:55 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d1e01df0001>; Thu, 04 Jul 2019 06:40:50 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Thu, 04 Jul 2019 06:40:54 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Thu, 04 Jul 2019 06:40:54 -0700
Received: from [10.21.132.148] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 4 Jul
 2019 13:40:49 +0000
Subject: Re: [PATCH 4/8] phy: tegra: xusb: add sleepwalk and suspend/resume
To:     JC Kuo <jckuo@nvidia.com>, <gregkh@linuxfoundation.org>,
        <thierry.reding@gmail.com>, <pdeschrijver@nvidia.com>,
        <afrid@nvidia.com>
CC:     <linux-tegra@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <nkristam@nvidia.com>,
        <skomatineni@nvidia.com>
References: <20190614074652.21960-1-jckuo@nvidia.com>
 <20190614074652.21960-5-jckuo@nvidia.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <446b74c1-3d54-62ab-0491-b183389e6efd@nvidia.com>
Date:   Thu, 4 Jul 2019 14:40:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190614074652.21960-5-jckuo@nvidia.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL106.nvidia.com (172.18.146.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1562247650; bh=C6D1yFCecR5sgHVNrphRZ5fJPaXx67kTMPrMwK2DTls=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=ATN7vHP25uKDYfsTpqhdCKPL2krEkIbnI1oUAwh6bVHaeRW+dpgQC1x0/IVx58XaG
         5EMrQnZaKllww/DMMuKPrJPF6FfSO5OgoWgIvW74AWKf6VpmbWtaedjPr1r5dEuJ6i
         wQ/iiO356P4Zw/kKCRiUn5n287+e6vuAerZjSfNl2hZcAs4Wqpqe940f2NcVkjdXSU
         u73oL4WV5Ctf39iSTs63mKZLoQz3qe+Pkk/DSncS1zs8FfJmAK+jhXOf5pQIIU4CKD
         9BGzdUn8S291QZYSC421FX2zNC6AqRFwYH53RFpPh/ts1uRqIDNWMB/Ht5QVmuCQuu
         se6WbDSAFZoXg==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


On 14/06/2019 08:46, JC Kuo wrote:
> This commit adds sleepwalk/wake and suspend/resume interfaces
> to Tegra XUSB PHY driver.

If you adding new custom global APIs, you really need to explain why
these are needed and how they are used. If we can avoid adding such
global APIs, it is preferred.

Cheers
Jon

-- 
nvpublic
