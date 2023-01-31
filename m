Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D21DA6823BC
	for <lists+linux-usb@lfdr.de>; Tue, 31 Jan 2023 06:20:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230030AbjAaFUf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 31 Jan 2023 00:20:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230031AbjAaFUY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 31 Jan 2023 00:20:24 -0500
Received: from mail.lineo.co.jp (mail.lineo.co.jp [203.141.200.203])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A0F93526E
        for <linux-usb@vger.kernel.org>; Mon, 30 Jan 2023 21:20:22 -0800 (PST)
Received: from [172.31.17.196] (vpn1.lineo.co.jp [203.141.200.204])
        by mail.lineo.co.jp (Postfix) with ESMTPSA id AFE56802F9525;
        Tue, 31 Jan 2023 14:20:20 +0900 (JST)
Message-ID: <de051a0b-98e0-cca0-f9f4-4ac8d4c4fc02@lineo.co.jp>
Date:   Tue, 31 Jan 2023 14:20:20 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: OS Descriptor version in FunctionFS
Content-Language: en-US
To:     Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        linux-usb@vger.kernel.org
References: <60cd04bb-c080-4242-b981-8da1e1c3ca53@lineo.co.jp>
 <979dcea0-938e-377b-c9a4-0a796bbdf7bc@collabora.com>
From:   Yuta Hayama <hayama@lineo.co.jp>
In-Reply-To: <979dcea0-938e-377b-c9a4-0a796bbdf7bc@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,
 
> Are you able to check what does Windows host actually see in bcd_version if
> it is set as "0x0001" at the FunctionFS gadget side? 

I'm sorry, It is hard for me to check how the bcd_version value is handled
internally because I don't have a Windows development environment and I simply
don't know enough about Windows.
The least I can do is try to manipulate something and watch the behavior from
the outside. (e.g., if the driver was autoloaded by passing an Extended Compat
ID Descriptor with bcd_version=0x0001, this descriptor would work, etc.)


I forgot to write about the background in my last post.
Before trying FunctionFS, I had tried GadgetFS with a configuration that
included OS descriptor, and found that bcd_version=0x0100 worked (the Windows
host recognized it). For this reason, I thought the same descriptor would work
in FunctionFS, but was actually rejected by the kernel.

> And then, whether it does
> not complain because it sees what it expects or because it does not care even
> though it sees something it doesn't expect?

Since the Windows host appears to recognize both the value 0x0001 and 0x0100,
I guess the Windows host "does not care even though it sees something it
doesn't expect." I don't know which value the Windows host actually expects,
but since the MSFT document says bcd_version=0x0100, it probably expects 0x100.


Regards,

Yuta Hayama
