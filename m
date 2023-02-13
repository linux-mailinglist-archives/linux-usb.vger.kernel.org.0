Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C507694062
	for <lists+linux-usb@lfdr.de>; Mon, 13 Feb 2023 10:10:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229503AbjBMJKE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 13 Feb 2023 04:10:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229472AbjBMJKD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 13 Feb 2023 04:10:03 -0500
Received: from mail.lineo.co.jp (mail.lineo.co.jp [203.141.200.203])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A17E21206F
        for <linux-usb@vger.kernel.org>; Mon, 13 Feb 2023 01:10:02 -0800 (PST)
Received: from [172.31.17.196] (vpn1.lineo.co.jp [203.141.200.204])
        by mail.lineo.co.jp (Postfix) with ESMTPSA id 6BE0C802D3F24;
        Mon, 13 Feb 2023 18:10:01 +0900 (JST)
Message-ID: <80754db0-a3bb-ee5e-db39-b75b8ebbd30e@lineo.co.jp>
Date:   Mon, 13 Feb 2023 18:10:01 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [RFC PATCH] usb: gadget: f_fs: Fix incorrect version checking of
 OS descs
Content-Language: en-US
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        linux-usb@vger.kernel.org
References: <1da84565-aeb3-e8fa-7cf1-ba2aa5035ac6@lineo.co.jp>
From:   Yuta Hayama <hayama@lineo.co.jp>
Cc:     hayama@lineo.co.jp
In-Reply-To: <1da84565-aeb3-e8fa-7cf1-ba2aa5035ac6@lineo.co.jp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

What is clear is that the value of bcdVersion actually sent to the host is
0x100, and this value is set by composite_setup() (in composite.c) as a fixed
value. That is, the value of bcdVersion written in the OS descriptor passed
to functionfs is not actually transferred. I understand that
__ffs_do_os_desc_header() is only checking the format of the descriptor
(header) received.

Please see below.
https://lore.kernel.org/linux-usb/5c049a94-f848-ff9a-ffbe-c1cf335ca644@lineo.co.jp/

There are several ways to think about this.

1. Accept 0x100 as the correct value, also accept 0x1 for compatibility.

   The way in this patch. Observing the behavior, 0x100 appears to be correct,
   so we want to accept only this value.  However, we cannot break the old
   userspace driver, so we need to accept 0x1 as an exception.

2. Accept 0x100 and 0x1 in silence.

   0x1 is incorrect and is only allowed for compatibility, but it may not be
   worth bothering to tell.

3. Remove bcdVersion value check

   We are already in a tricky situation where we have to accept the correct
   value of 0x100 and the actually incorrect value of 0x1. It might be better
   to omit the bcdVersion value check and check only the wIndex value as a
   OS desc header format check.

For now, I have created this patch based on idea (1), but please let me know
if there is an appropriate way to do this.


Regards,

Yuta Hayama
