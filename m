Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8A1985CA1A
	for <lists+linux-usb@lfdr.de>; Tue,  2 Jul 2019 09:57:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726963AbfGBH5J (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 2 Jul 2019 03:57:09 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:7099 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725801AbfGBH5I (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 2 Jul 2019 03:57:08 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d1b0e500000>; Tue, 02 Jul 2019 00:57:04 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 02 Jul 2019 00:57:07 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 02 Jul 2019 00:57:07 -0700
Received: from [10.19.108.127] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 2 Jul
 2019 07:57:06 +0000
Subject: Re: [PATCH] usb: storage: skip only when uas driver is loaded
To:     Greg KH <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, <stern@rowland.harvard.edu>,
        <usb-storage@lists.one-eyed-alien.net>, <oneukum@suse.com>
References: <20190701084848.32502-1-jckuo@nvidia.com>
 <20190701085248.GA28681@kroah.com>
 <8e8e8703-8620-b625-4917-bbb8d999caa4@nvidia.com>
 <20190702044249.GA694@kroah.com>
 <f6ed2505-5da9-c217-a052-a19d197c5c8e@nvidia.com>
 <f43e7ecf-64d5-20d2-0461-85a55fa28a33@nvidia.com>
 <20190702073432.GA9265@kroah.com>
X-Nvconfidentiality: public
From:   JC Kuo <jckuo@nvidia.com>
Message-ID: <136cd205-6114-2be5-4244-f6689ce6bf3b@nvidia.com>
Date:   Tue, 2 Jul 2019 15:57:04 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190702073432.GA9265@kroah.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL108.nvidia.com (172.18.146.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1562054224; bh=n8EZLqSbsH9hR50c0zG+1lO4rtsBJM1KmooEQ00c+00=;
        h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
         Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
         X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=jgicwKmh1sSMUcDaVzhJRZeEZGuUtRl2VJUFjXnnoB8sZ2n3gJS3TLkqTwsKjSHD2
         hDWRiLjM3qLGUYr0vmdKYvP8Tvz7d+R77l8RdkpOERqGNa67Lq1W4E1117oW1DITC1
         TPz64aoXLUuF0z3YVwnRht+vza1eHjyHjgt2kmYJFpIWXPapDAUXzTGd7yH6qm6sya
         4WWamotUGRpRDunlxWWgOsTVWkbOtEiCG/rwWsfGHrX5C5IYzlP3OkfCcjkt+1fWzy
         EQsH3EJNN/B2WflBvim3cma34i/h6VWhRzDvW0DMaBXX7ppwIPqkjMR/AhK0DueM8p
         ko4RODJTf7plA==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 7/2/19 3:34 PM, Greg KH wrote:
> 
> Footers like this are not allowed on public mailing lists, and forbid me
> to respond to...
> 

Hi Greg,
I am truly sorry for that. I have just figured out how to tell mail server
not to add the footer. Please allow me to query again.

Since blacklisting uas kernel module is not a good idea and could break UAS 
capable storage functionality, although user-space should be blamed for the
improper configuration, do we consider forbidding making uas driver as
module? That means to make CONFIG_USB_UAS a bool option.

Thanks,
JC
