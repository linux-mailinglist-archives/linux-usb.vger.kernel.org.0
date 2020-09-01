Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 311D2259EFB
	for <lists+linux-usb@lfdr.de>; Tue,  1 Sep 2020 21:11:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728039AbgIATLA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Sep 2020 15:11:00 -0400
Received: from mr06.mx01.tldhost.de ([62.108.41.213]:49451 "EHLO
        mr06.mx01.tldhost.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726521AbgIATK7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 1 Sep 2020 15:10:59 -0400
X-Greylist: delayed 714 seconds by postgrey-1.27 at vger.kernel.org; Tue, 01 Sep 2020 15:10:58 EDT
Received: from mx01.tldhost.de (localhost [127.0.0.1])
        by mx01.tldhost.de (Postfix) with ESMTP id 2C37F121717
        for <linux-usb@vger.kernel.org>; Tue,  1 Sep 2020 20:59:03 +0200 (CEST)
Received: by mx01.tldhost.de (Postfix, from userid 1001)
        id 21EB312171F; Tue,  1 Sep 2020 20:59:03 +0200 (CEST)
X-Spam-Status: No, score=-1.9 required=7.0 tests=BAYES_00,SPF_PASS,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.2
Received: from server12.tldhost.de (server12.tldhost.de [84.19.26.112])
        by mx01.tldhost.de (Postfix) with ESMTPS id 9A37E121625;
        Tue,  1 Sep 2020 20:59:02 +0200 (CEST)
Received: from fw-emea.rohde-schwarz.com (fw-emea.rohde-schwarz.com
 [80.246.32.33]) by webmail.kiener-muenchen.de (Horde Framework) with HTTPS;
 Tue, 01 Sep 2020 18:59:03 +0000
Date:   Tue, 01 Sep 2020 18:59:03 +0000
Message-ID: <20200901185903.Horde.NHT9rmY1GQT34m6C6YMUCNF@webmail.kiener-muenchen.de>
From:   guido@kiener-muenchen.de
To:     George McCollister <george.mccollister@gmail.com>
Cc:     linux-usb@vger.kernel.org, guido.kiener@rohde-schwarz.com
Subject: Re: usbtmc: stb race condition introduced by
 4f3c8d6eddc272b386464524235440a418ed2029
In-Reply-To: <CAFSKS=Pv1Ji4XqHjVMCAnszq_HjFYYk7GuzeeCCScHd1NMumDA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed; DelSp=Yes
MIME-Version: 1.0
Content-Disposition: inline
X-PPP-Message-ID: <20200901185903.5728.88104@server12.tldhost.de>
X-PPP-Vhost: kiener-muenchen.de
X-POWERED-BY: TLDHost.de - AV:CLEAN SPAM:OK
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


George,

Thanks for your question.
> Since 4f3c8d6eddc272b386464524235440a418ed2029 I'm experiencing this
> STB race condition. TL;DR an old, cached STB value can be used after a
> new one is reported in reply to a control message. Hacking up the
> latest driver code to ignore the cached stb value gets around the
> issue.

The SRQ notification is an important message and must not be missed
in userspace applications. The new implementation does not miss the
SRQ event anymore, even when multiple threads are waiting for the SRQ event.

Your coding relies on the previous behavior and did not fail for your
use case and timing. However we could not develop reliable applications with
the previous implementation.

There are now two ways to wait for the SRQ event:
1. Using the poll/select method
2. Using the new ioctl USBTMC488_IOCTL_WAIT_SRQ (preferred way)

When receiving the SRQ event, you should immediately read the stb with
USBTMC488_IOCTL_READ_STB within the same thread to prevent races or
reading stale status byte information.

More info see:
https://github.com/GuidoKiener/linux-usbtmc/blob/master/README.md

> My USBTMC device has an interrupt endpoint with a 1ms interval.
>
> 1) A query is sent to the USBTMC device.
>
> 2) An SRQ is reported via the interrupt endpoint with MAV set.
>
> 3) Userspace performs a read to get the reply since MAV is set after
> being notified by poll().

Did you start reading (read()) without checking the Status Byte after  
poll() event?

Regards,

Guido


