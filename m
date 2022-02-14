Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 78FC64B5A2A
	for <lists+linux-usb@lfdr.de>; Mon, 14 Feb 2022 19:45:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229910AbiBNSpf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 14 Feb 2022 13:45:35 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:39496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229536AbiBNSpe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 14 Feb 2022 13:45:34 -0500
Received: from mxout01.lancloud.ru (mxout01.lancloud.ru [45.84.86.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA2C16E8D2
        for <linux-usb@vger.kernel.org>; Mon, 14 Feb 2022 10:45:16 -0800 (PST)
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout01.lancloud.ru EFCE720730E6
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
Subject: Re: [PATCH] usb: host: xhci-hub: drop redundant port register reads
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Mathias Nyman <mathias.nyman@intel.com>,
        <linux-usb@vger.kernel.org>
References: <5ea9b08b-38a5-498b-8312-c64ad782318a@omp.ru>
 <Ygdbs5A/v/9rrdiX@kroah.com>
Organization: Open Mobile Platform
Message-ID: <521a9f16-3c34-b8ce-2020-87ec6fc9f983@omp.ru>
Date:   Mon, 14 Feb 2022 21:44:48 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <Ygdbs5A/v/9rrdiX@kroah.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT02.lancloud.ru (fd00:f066::142) To
 LFEX1907.lancloud.ru (fd00:f066::207)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 2/12/22 10:03 AM, Greg Kroah-Hartman wrote:

>> In xhci_hub_control(), there are many port register readbacks in several
>> branches of the *switch* statement which get duplicated right after that
>> *switch* by reading back the port register once more -- which is done to
>> flush the posted writes. Remove the redundant reads inside that *switch*.
> 
> Doing a read right after a write is good, perhaps the one after the
> switch should be removed instead?

   OK, hoping that the PORTPMSC writes don't need the PORTSC readbacks...
   Looking a the git history, the readback after *switch* was redudant from the start... 

> thanks,
> 
> greg k-h

MBR, Sergey

