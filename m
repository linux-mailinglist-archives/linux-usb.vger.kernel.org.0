Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 496D6DD8BD
	for <lists+linux-usb@lfdr.de>; Sat, 19 Oct 2019 14:52:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725868AbfJSMwT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 19 Oct 2019 08:52:19 -0400
Received: from ms-10.1blu.de ([178.254.4.101]:54828 "EHLO ms-10.1blu.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725812AbfJSMwT (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 19 Oct 2019 08:52:19 -0400
Received: from [84.135.228.213] (helo=[192.168.178.51])
        by ms-10.1blu.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <ben@besd.de>)
        id 1iLoDR-0006eA-6t; Sat, 19 Oct 2019 14:52:17 +0200
Subject: Re: [USB EHCI DRIVER] [Regression] EHCI no longer working in 5.4
 series kernel
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-usb@vger.kernel.org, hch@lst.de
References: <Pine.LNX.4.44L0.1910171830550.4074-100000@netrider.rowland.org>
From:   Benedikt Schemmer <ben@besd.de>
Message-ID: <5328c3b3-d527-42a6-d3b8-18a4ef842227@besd.de>
Date:   Sat, 19 Oct 2019 14:52:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <Pine.LNX.4.44L0.1910171830550.4074-100000@netrider.rowland.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Con-Id: 150997
X-Con-U: 0-ben
X-Originating-IP: 84.135.228.213
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

reverting that specific commit on top of todays linux git (d418d070057c) produces a good kernel

Am 18.10.19 um 00:31 schrieb Alan Stern:
> On Thu, 17 Oct 2019, Benedikt Schemmer wrote:
> 
>> Hi all,
>>
>> I recently started compiling the 5.4. kernel starting with rc3 and noticed that both my keyboard and mouse aren't working
>> when connected to the motherboards USB ports (they work fine when connected to an xhci extension card) and they work fine
>> with the 5.3 series up to 5.3.6
> 
> Can you use git bisect to track the problem down to a particular commit?
> 
> Alan Stern
> 
