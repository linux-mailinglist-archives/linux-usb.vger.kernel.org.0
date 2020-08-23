Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C235B24F034
	for <lists+linux-usb@lfdr.de>; Mon, 24 Aug 2020 00:14:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726449AbgHWWOm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 23 Aug 2020 18:14:42 -0400
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83]:54776 "EHLO
        mail2-relais-roc.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726057AbgHWWOl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 23 Aug 2020 18:14:41 -0400
X-IronPort-AV: E=Sophos;i="5.76,346,1592863200"; 
   d="scan'208";a="464389334"
Received: from 91-160-5-165.subs.proxad.net (HELO [192.168.44.21]) ([91.160.5.165])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-SHA; 24 Aug 2020 00:14:38 +0200
Subject: Re: [BUG] Regression in Linux 5.4.17 for JMicron JMS566 enclosure
To:     Cyril Roelandt <tipecaml@gmail.com>,
        Alan Stern <stern@rowland.harvard.edu>
Cc:     USB list <linux-usb@vger.kernel.org>, sellis@redhat.com,
        pachoramos@gmail.com, labbott@fedoraproject.org,
        gregkh@linuxfoundation.org, javhera@gmx.com
References: <Pine.LNX.4.44L0.2004191144550.4266-100000@netrider.rowland.org>
 <20200421030137.GA2492@Susan> <20200815001829.GA2786@Susan>
 <20200815021929.GC52242@rowland.harvard.edu> <20200815232357.GB2786@Susan>
 <20200816162642.GC86937@rowland.harvard.edu> <20200818041324.GA3173@Susan>
 <20200818145722.GA146472@rowland.harvard.edu> <20200823013025.GA11449@Susan>
 <20200823144752.GB303967@rowland.harvard.edu> <20200823180837.GA3448@Susan>
From:   Brice Goglin <brice.goglin@gmail.com>
Autocrypt: addr=brice.goglin@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <558e1879-e17a-6185-70db-b45c3f640596@gmail.com>
Date:   Mon, 24 Aug 2020 00:14:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200823180837.GA3448@Susan>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


Le 23/08/2020 à 20:08, Cyril Roelandt a écrit :
> Hello,
>
> On 2020-08-23 10:47, Alan Stern wrote:
>> Yes; it looks like the problem is that there are entries for this device 
>> in both unusual_devs.h and unusual_uas.h -- and it doesn't help that the 
>> two entries aren't identical.
>>
>> The unusual_devs.h entry tells usb-storage not to use FUA, but it 
>> doesn't rule out the uas driver.  And since the device claims to support 
>> UAS, usb-storage bows out.  But then the unusual_uas.h entry tells uas 
>> not to handle the drive, so the end result is that it doesn't get 
>> handled at all.
>>
>> To fix the immediate problem you should add the US_FL_IGNORE_UAS flag to 
>> the entry in unusual_devs.h.
> That did the trick[1]. Do you think this patch could be suitable for a
> future version of the kernel?


It fixes my issue too (on top of 5.7.17).

Brice

