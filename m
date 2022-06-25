Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9BAE555A7CA
	for <lists+linux-usb@lfdr.de>; Sat, 25 Jun 2022 09:47:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232257AbiFYHql (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 25 Jun 2022 03:46:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231527AbiFYHqk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 25 Jun 2022 03:46:40 -0400
X-Greylist: delayed 18236 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 25 Jun 2022 00:46:39 PDT
Received: from mail.gtsys.com.hk (unknown [27.111.83.178])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07B1547553
        for <linux-usb@vger.kernel.org>; Sat, 25 Jun 2022 00:46:38 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by mail.gtsys.com.hk (Postfix) with ESMTP id 0264622A1D85;
        Sat, 25 Jun 2022 15:46:37 +0800 (HKT)
X-Virus-Scanned: Debian amavisd-new at gtsys.com.hk
Received: from mail.gtsys.com.hk ([127.0.0.1])
        by localhost (mail.gtsys.com.hk [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id Puf6xdLp9Dtj; Sat, 25 Jun 2022 15:46:36 +0800 (HKT)
Received: from s01.gtsys.com.hk (unknown [10.128.4.2])
        by mail.gtsys.com.hk (Postfix) with ESMTP id D4CF9229C1AA;
        Sat, 25 Jun 2022 15:46:36 +0800 (HKT)
Received: from [10.128.1.32] (unknown [182.239.122.235])
        by s01.gtsys.com.hk (Postfix) with ESMTPSA id 8EB23C01B49;
        Sat, 25 Jun 2022 15:46:36 +0800 (HKT)
Subject: Re: serial: usb: cdc-acm: OMRON B5L ToF, device probe failed
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Oliver Neukum <oneukum@suse.com>,
        "michael.lee@omron.com" <michael.lee@omron.com>,
        Lars Melin <larsm17@gmail.com>,
        USB list <linux-usb@vger.kernel.org>
References: <1af7ff05-8558-9162-a0cd-ac140ddaf2e1@gmail.com>
 <cbcc2071-5b56-025e-cae6-5af0210e2363@gtsys.com.hk>
 <OSZP286MB1776CCBCBFE38B25C7DB9978E1B39@OSZP286MB1776.JPNP286.PROD.OUTLOOK.COM>
 <40395457-0927-c169-7d9f-47d1912e2c39@suse.com>
 <f3aaf9e8-07c7-2c50-48c3-723c51f9445a@gtsys.com.hk>
 <dc9f9c31-b72d-0895-544a-13764538d991@suse.com>
 <3194ea30-34da-3d34-6d4a-08dc7c8d683a@gtsys.com.hk>
 <4f4977bf-6096-592c-9c06-44aacb82ccd7@gtsys.com.hk>
 <68fffa09-1522-bef0-f76e-610e2345a70c@suse.com>
 <85ff1357-5a70-3ee1-4098-08401f522c7a@gtsys.com.hk>
 <Yra6Jw4uSSq2OJIZ@kroah.com>
From:   Chris Ruehl <chris.ruehl@gtsys.com.hk>
Message-ID: <cdd087b2-7a96-ccb0-0720-3a13717936bc@gtsys.com.hk>
Date:   Sat, 25 Jun 2022 15:46:35 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <Yra6Jw4uSSq2OJIZ@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 25/6/2022 3:32 pm, Greg KH wrote:
> On Sat, Jun 25, 2022 at 10:35:54AM +0800, Chris Ruehl wrote:
>> Disclaimer: https://www.gtsys.com.hk/email/classified.html
> Now deleted.
>
> Note, this does not work well with kernel development efforts :(
Sorry,
usually I not sent it with the kernel list.

-Chris
