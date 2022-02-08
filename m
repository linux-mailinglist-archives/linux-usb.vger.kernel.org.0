Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 68E5C4AE3D5
	for <lists+linux-usb@lfdr.de>; Tue,  8 Feb 2022 23:24:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380578AbiBHWYC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Feb 2022 17:24:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1386291AbiBHUBO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 8 Feb 2022 15:01:14 -0500
Received: from mxout03.lancloud.ru (mxout03.lancloud.ru [45.84.86.113])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A0FDC0613CB
        for <linux-usb@vger.kernel.org>; Tue,  8 Feb 2022 12:01:12 -0800 (PST)
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout03.lancloud.ru 0821820A2D4C
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
Subject: Re: [PATCH] usb: core: devices: drop unreachable code in
 usb_dump_endpoint_descriptor()
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <linux-usb@vger.kernel.org>
References: <dac675d4-2dbd-e16d-622a-0471f31f2aca@omp.ru>
Organization: Open Mobile Platform
Message-ID: <7a352b9b-0073-ad61-cbbf-256ec90e3ba3@omp.ru>
Date:   Tue, 8 Feb 2022 23:01:09 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <dac675d4-2dbd-e16d-622a-0471f31f2aca@omp.ru>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT01.lancloud.ru (fd00:f066::141) To
 LFEX1907.lancloud.ru (fd00:f066::207)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 2/8/22 10:58 PM, Sergey Shtylyov wrote:

> The *switch* statement in usb_dump_endpoint_descriptor() does handle all
> possible endpoint types expilictly, so the *defaut* label is unreachable.

   It's *default*. :-) Please fix when/if merging! 

> 
> Found by Linux Verification Center (linuxtesting.org) with the SVACE static
> analysis tool.
> 
> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>

[...]

MBR, Sergey

