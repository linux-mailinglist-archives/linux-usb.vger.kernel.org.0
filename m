Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 49B606BF75C
	for <lists+linux-usb@lfdr.de>; Sat, 18 Mar 2023 03:12:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229961AbjCRCMg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 17 Mar 2023 22:12:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229488AbjCRCMf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 17 Mar 2023 22:12:35 -0400
X-Greylist: delayed 479 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 17 Mar 2023 19:12:34 PDT
Received: from lithium.sammserver.com (lithium.sammserver.com [168.119.122.30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C9966422F
        for <linux-usb@vger.kernel.org>; Fri, 17 Mar 2023 19:12:34 -0700 (PDT)
Received: from mail.sammserver.com (sammserver.wg [10.32.40.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (Client did not present a certificate)
        by lithium.sammserver.com (Postfix) with ESMTPS id 5FDC631181CC;
        Sat, 18 Mar 2023 03:04:33 +0100 (CET)
Received: from mail.sammserver.com (localhost.localdomain [127.0.0.1])
        by mail.sammserver.com (Postfix) with ESMTP id 0CE92341A1;
        Sat, 18 Mar 2023 03:04:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cavoj.net; s=email;
        t=1679105073; bh=1hrJ9AjYjLMRHm6x41xqIlKY7cvuAe3cUk8V4Af1rQ8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=ejUZ9k9W34r2pq91RNL2AGSBPWq5AkCIw0dVHNePCMy6kRSEwVLE7GCekcBBRqviA
         qq+cVRebKsV+3Nf2cr4t3hYnDaelWP9HdfyuwnlPL1uRYvVBdwmdqWkAg4x5R9Yd7E
         USCeM2E20gh1q0geH9WWPjU29cylmwr24Z/u2Mi8=
MIME-Version: 1.0
Date:   Sat, 18 Mar 2023 03:04:32 +0100
From:   =?UTF-8?Q?Samuel_=C4=8Cavoj?= <samuel@cavoj.net>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: typec: ucsi: introduce read_explicit operation
In-Reply-To: <ZBMUsweZjfqxZJdc@kuha.fi.intel.com>
References: <20230120233920.752245-1-samuel@cavoj.net>
 <Y8uRnc3Cxb1ADad6@kroah.com> <Y8+/Lgp7fWaxFsri@kuha.fi.intel.com>
 <ZAi1KO+WUs+9nNOn@kuha.fi.intel.com> <ZBMUsweZjfqxZJdc@kuha.fi.intel.com>
Message-ID: <c5223adc99dd9bf849071e8fdfed4bb1@cavoj.net>
X-Sender: samuel@cavoj.net
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On 2023-03-16 14:08, Heikki Krogerus wrote:
> On Wed, Mar 08, 2023 at 06:17:47PM +0200, Heikki Krogerus wrote:
>> Hi Samuel,
>> 
>> > I asked that Samuel to share this here, but perhaps we should consider
>> > it still as an RFC. I have tested this with some of my platforms, but
>> > I want to test more.
>> 
>> Sorry about the slow progress, but this is causing commands to fail on
>> some platforms. I've been trying to figure out how to fix those, but
>> nothing has worked so far.

No worries, I've been very busy with other stuff as well, that's
why I haven't responded for some time--nothing new on my end.

>> I think we have to handle this with a DMI quick in ucsi_acpi.c. I
>> don't have any other ideas. I'll try a few more things, and then
>> prepare a patch for that.
> 
> Unfortunately nothing seems to work... I'm attaching the DMI quirk
> patch here. Can you test it?

I'll definitely try it out, I hope sometime next week!

> I'm not sure if the DMI_PRODUCT_NAME is just "ZenBook" so you may
> need to fix that in the patch!!
> 
> You can get the correct value by running dmidecode. This should work:
> 
>         % dmidecode -s system-product-name
> 
> thanks,

Thanks
Sam
