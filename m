Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5666A49BAA
	for <lists+linux-usb@lfdr.de>; Tue, 18 Jun 2019 10:02:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726888AbfFRICC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Jun 2019 04:02:02 -0400
Received: from hqemgate15.nvidia.com ([216.228.121.64]:1575 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725913AbfFRICB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 18 Jun 2019 04:02:01 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d089a790001>; Tue, 18 Jun 2019 01:02:01 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 18 Jun 2019 01:02:00 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 18 Jun 2019 01:02:00 -0700
Received: from [10.19.108.127] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 18 Jun
 2019 08:01:58 +0000
Subject: Re: [PATCH 8/8] xhci: tegra: enable ELPG for runtime/system PM
To:     Greg KH <gregkh@linuxfoundation.org>
CC:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <pdeschrijver@nvidia.com>, <afrid@nvidia.com>,
        <linux-tegra@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <nkristam@nvidia.com>,
        <skomatineni@nvidia.com>
References: <20190614074824.22023-1-jckuo@nvidia.com>
 <20190614074824.22023-4-jckuo@nvidia.com> <20190618063322.GA10079@kroah.com>
From:   JC Kuo <jckuo@nvidia.com>
Message-ID: <40374770-912a-f4fb-a90e-ea0bccceaad0@nvidia.com>
Date:   Tue, 18 Jun 2019 16:01:56 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190618063322.GA10079@kroah.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL103.nvidia.com (172.20.187.11) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1560844921; bh=3GuncUlSKsmI7x4+GNsDMFUCN+OQrxFC5HqZFPYlDTY=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=jPMFJxJkktr8WRnqP5+WJZhP21Mr0hogE0BtWvVyX2SdS4Z/mN3ypNmL09fXVBpmb
         YBIV4FvBoW7s9ZmMF2jnRZakCo/1ofmZ1TZp7ytb9qxr2l40R8857t0y/p0wfZLSV0
         0SEms/JkyxlMaJgzmtHRtosG1X059APRIa18nXInoItYdUaTC1r+M0nrnV6/tLs2Kv
         OZTt/XhtWnggY5cq9Y0ZLpUOhxyan1ZiuRFES23WDPnQUTPXiDEDIJRMotRa9FgrNx
         7Ku0Th4hh0cZEidZcT7TpN/tSIuipU52cfSpg5b1W2qAz05bexT0hDF91qSCnPMYhT
         M8yQNOXcN7OXw==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg,
Code cleanup was done but I forgot the "NEED CLEANUP" in the commit comment. Sorry for that. I will wait for review comments to come and fix the commit message together with code improvements.

Thanks,
JC

On 6/18/19 2:33 PM, Greg KH wrote:
> On Fri, Jun 14, 2019 at 03:48:24PM +0800, JC Kuo wrote:
>> This commit enables XUSB host controller ELPG for runtime and system
>> power management.
>>
>> NEED CLEANUP.
> 
> Odd kernel changelog comment...
> 
> Please cleanup when you resend. :)
> 
> thanks,
> 
> greg k-h
> 
