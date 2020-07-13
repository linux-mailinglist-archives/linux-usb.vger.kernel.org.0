Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C427221C264
	for <lists+linux-usb@lfdr.de>; Sat, 11 Jul 2020 07:29:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727834AbgGKF3T (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 11 Jul 2020 01:29:19 -0400
Received: from smtp.al2klimov.de ([78.46.175.9]:54486 "EHLO smtp.al2klimov.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726786AbgGKF3S (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 11 Jul 2020 01:29:18 -0400
Received: from authenticated-user (PRIMARY_HOSTNAME [PUBLIC_IP])
        by smtp.al2klimov.de (Postfix) with ESMTPA id 6F584BC078;
        Sat, 11 Jul 2020 05:29:14 +0000 (UTC)
Subject: Re: [PATCH] Replace HTTP links with HTTPS ones: USB MASS STORAGE
 DRIVER
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Stafford Horne <shorne@gmail.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        stern@rowland.harvard.edu, linux-usb@vger.kernel.org,
        usb-storage@lists.one-eyed-alien.net, linux-kernel@vger.kernel.org,
        David Miller <davem@davemloft.net>,
        Linus Torvalds <torvalds@linux-foundation.org>
References: <20200708095500.13694-1-grandmaster@al2klimov.de>
 <20200708103928.GC585606@kroah.com>
 <6b78a3fd-04b9-fc8e-b5c6-f03372a4cd31@al2klimov.de>
 <20200709061409.GA130260@kroah.com>
 <20200710103621.GA437393@lianli.shorne-pla.net>
 <53342e1a-8430-2557-94c7-1da979a79e68@al2klimov.de>
 <20200710153519.421d2cf3@lwn.net>
From:   "Alexander A. Klimov" <grandmaster@al2klimov.de>
Message-ID: <91d09f25-664c-59a6-199f-2592ba883aee@al2klimov.de>
Date:   Sat, 11 Jul 2020 07:29:13 +0200
MIME-Version: 1.0
In-Reply-To: <20200710153519.421d2cf3@lwn.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Authentication-Results: smtp.al2klimov.de;
        auth=pass smtp.auth=aklimov@al2klimov.de smtp.mailfrom=grandmaster@al2klimov.de
X-Spamd-Bar: /
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



Am 10.07.20 um 23:35 schrieb Jonathan Corbet:
> On Fri, 10 Jul 2020 21:36:03 +0200
> "Alexander A. Klimov" <grandmaster@al2klimov.de> wrote:
> 
>> 2) Apropos "series" and "as whole"... I stumbled over
>>      `git log --oneline |grep -Fwe treewide`
>>      and am wondering:
>>      *Shouldn't all of these patches even begin with "treewide: "?*
>>      E.g.: "treewide: Replace HTTP links with HTTPS ones: GCC PLUGINS"
> 
> No, this isn't something that needs to be done across the tree all at
> once.  Keep going through the appropriate maintainers as you have, but do
If we do treewide only if needed... why is this treewide:

git log --oneline |grep -Fwe 'treewide: Replace GPLv2 
boilerplate/reference with SPDX'

> please try to adjust your subject lines to match what they do.
> 
> jon
> 
