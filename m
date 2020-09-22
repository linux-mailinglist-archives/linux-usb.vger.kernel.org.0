Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5183527457A
	for <lists+linux-usb@lfdr.de>; Tue, 22 Sep 2020 17:39:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726662AbgIVPjQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 22 Sep 2020 11:39:16 -0400
Received: from mr01.mx01.tldhost.de ([62.108.36.247]:48699 "EHLO
        mr01.mx01.tldhost.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726566AbgIVPjQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 22 Sep 2020 11:39:16 -0400
X-Greylist: delayed 356 seconds by postgrey-1.27 at vger.kernel.org; Tue, 22 Sep 2020 11:39:15 EDT
Received: from mx01.tldhost.de (localhost [127.0.0.1])
        by mx01.tldhost.de (Postfix) with ESMTP id D421912010F
        for <linux-usb@vger.kernel.org>; Tue, 22 Sep 2020 17:33:17 +0200 (CEST)
Received: by mx01.tldhost.de (Postfix, from userid 1001)
        id C9AD3120287; Tue, 22 Sep 2020 17:33:17 +0200 (CEST)
X-Spam-Status: No, score=-1.9 required=7.0 tests=BAYES_00,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.2
Received: from server12.tldhost.de (server12.tldhost.de [84.19.26.112])
        by mx01.tldhost.de (Postfix) with ESMTPS id D767E12010F;
        Tue, 22 Sep 2020 17:33:16 +0200 (CEST)
Received: from fw-emea.rohde-schwarz.com (fw-emea.rohde-schwarz.com
 [80.246.32.33]) by webmail.kiener-muenchen.de (Horde Framework) with HTTPS;
 Tue, 22 Sep 2020 15:33:17 +0000
Date:   Tue, 22 Sep 2020 15:33:17 +0000
Message-ID: <20200922153317.Horde.kYfFgpOej2x7e8K3swKnHnz@webmail.kiener-muenchen.de>
From:   guido@kiener-muenchen.de
To:     George McCollister <george.mccollister@gmail.com>
Cc:     linux-usb@vger.kernel.org, guido.kiener@rohde-schwarz.com,
        dpenkler@gmail.com, steve_bayless@keysight.com
Subject: Re: usbtmc: stb race condition introduced by
 4f3c8d6eddc272b386464524235440a418ed2029
References: <CAFSKS=Pv1Ji4XqHjVMCAnszq_HjFYYk7GuzeeCCScHd1NMumDA@mail.gmail.com>
 <20200901185903.Horde.NHT9rmY1GQT34m6C6YMUCNF@webmail.kiener-muenchen.de>
 <CAFSKS=M8xh3UVFEt+QxcCr_Ghie8tBkudrbLO15hpvEzQEbGfQ@mail.gmail.com>
 <20200902152514.Horde.-6-I20fjCayIQgkkuxwk-o2@webmail.kiener-muenchen.de>
 <CAFSKS=P-kY=CJhbf_QCAPRJKrZQ1OR9FyrrMSzm-7Wm6BxSgYA@mail.gmail.com>
 <20200903165401.Horde.0plv-8-wrkSbaoSekydKWEy@webmail.kiener-muenchen.de>
In-Reply-To: <20200903165401.Horde.0plv-8-wrkSbaoSekydKWEy@webmail.kiener-muenchen.de>
Content-Type: text/plain; charset=utf-8; format=flowed; DelSp=Yes
MIME-Version: 1.0
Content-Disposition: inline
X-PPP-Message-ID: <20200922153317.31734.60203@server12.tldhost.de>
X-PPP-Vhost: kiener-muenchen.de
X-POWERED-BY: TLDHost.de - AV:CLEAN SPAM:OK
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


Hi George,

We discussed some solutions to solve the race you found.

Since we want to avoid future requests and compatibility problems
regarding the SRQ and Status Byte, we will fix the current ioctl.
Furthermore we add two ioctls which return the original status
message and avoid assumptions about the USB488 subclass definition.

We will have the 3 STB ioctls:

1) USBTMC488_IOCTL_READ_STB always reads the STB from the device and
if the associated file descriptor has the srq_asserted bit set it ors
in the RQS bit to the returned STB and clears the srq_asserted bit.

Comment: This ioctl will return the latest status byte again, but will
not loose the RQS bit sent by intermediate SRQ messages. This ioctl
should be conform with 488.2 devices.

2) USBTMC_IOCTL_GET_STB always reads the STB from the device and returns
the STB unmodified to the application. The srq_asserted bit is not changed.

3) USBTMC_IOCTL_GET_SRQ_STB if the associated file descriptor has the
srq_asserted bit set it returns the STB originally sent in the device
SRQ message and clears the srq_asserted bit otherwise it returns error
code ENOMSG.

Please let us know your feedback and comments.

Regards,

Guido


