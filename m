Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2275641515A
	for <lists+linux-usb@lfdr.de>; Wed, 22 Sep 2021 22:25:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233460AbhIVU06 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 22 Sep 2021 16:26:58 -0400
Received: from mail.third-level.de ([85.115.14.135]:43283 "EHLO
        mail.third-level.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232274AbhIVU05 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 22 Sep 2021 16:26:57 -0400
Received: from p508e5677.dip0.t-ipconnect.de ([80.142.86.119] helo=[10.242.10.3])
        by mail.third-level.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <malte@neo-soft.org>)
        id 1mT8o2-0005rI-6X; Wed, 22 Sep 2021 22:25:26 +0200
Subject: Re: Possible bug in the cp210x kernel driver?
To:     Johan Hovold <johan@kernel.org>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
References: <zarafa.614a0e7a.4925.15cc733978d29bb6@neosoft.neo-soft.org>
 <YUsTYFOdMH/kQEyE@hovoldconsulting.com>
From:   Malte Di Donato <malte@neo-soft.org>
Message-ID: <ecb45e46-a093-0bc8-7855-0c0714ee447b@neo-soft.org>
Date:   Wed, 22 Sep 2021 22:25:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <YUsTYFOdMH/kQEyE@hovoldconsulting.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Message-Linecount: 40
X-Body-Linecount: 24
X-Message-Size: 1510
X-Body-Size: 828
X-SA-Exim-Connect-IP: 80.142.86.119
X-SA-Exim-Rcpt-To: linux-usb@vger.kernel.org, johan@kernel.org
X-SA-Exim-Mail-From: malte@neo-soft.org
X-SA-Exim-Scanned: No (on mail.third-level.de); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 22.09.21 13:28, Johan Hovold wrote:
> Heh, good that you noticed in time so I can give you proper credit in
> the commit message. ;)
yay \/ ;)

> Unfortunately your mails won't be seen by anyone else one the list
> unless you can disable that html.
finally it seems that I've got fixed that by now.
Not so easy with "limited everything" on vacation :/

> I'll reply to this mail with a fix that fixes the dropped character
> issue by disabling event-insertion mode (and thus parity reporting) for
> devices such as yours.
> 
> I've verified it here as well as I could, but could you give it a spin
> with your device as well? If you want you can reply to the patch mail
> with a Tested-by tag and I'll add that to the commit message as well.
> 
> Johan

Successfully tested the patch in debian kernel 5.10.0-8-amd64!


Malte
