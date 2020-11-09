Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DA292AB182
	for <lists+linux-usb@lfdr.de>; Mon,  9 Nov 2020 08:00:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729615AbgKIHAx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 9 Nov 2020 02:00:53 -0500
Received: from mail.kernel.org ([198.145.29.99]:37092 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728873AbgKIHAx (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 9 Nov 2020 02:00:53 -0500
Received: from saruman (88-113-213-94.elisa-laajakaista.fi [88.113.213.94])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 772C620665;
        Mon,  9 Nov 2020 07:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604905252;
        bh=FisUgV7uscqua/AneDb62Q2lcmZKFJRrYhSkiLnuRrI=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=NOcf1lTWXRbb5fiUkYnOeAi6+47AtPpiqxDDSDG5cguHL8LGTTgLQNzo8CXyZJFso
         u2nyOkIbAtpMzMRlkUH/rQVmkx2UiqrD1P32QKR7fbyRHr4JmfkOAr/ml2OLCBeQjH
         6Mkf8ktzW0O9XUvLkU81JxNEDt4k+hPcX/IW2X0Q=
From:   Felipe Balbi <balbi@kernel.org>
To:     Ferry Toth <fntoth@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Jack Pham <jackp@codeaurora.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: BUG with linux 5.9.0 with dwc3 in gadget mode
In-Reply-To: <cdb37a4c-2815-0068-1707-2e9163d1a93c@gmail.com>
References: <913dccca-500d-1938-b199-6eb67cfb60cc@gmail.com>
 <874kmpf583.fsf@kernel.org>
 <d0aca346-353c-d74e-6f00-ccd2a4ed26ef@gmail.com>
 <976cea12-e54e-fbca-6c53-e6ef5c554094@synopsys.com>
 <645b6ddc-d4f5-3f5b-b85f-b3d27fc365f5@synopsys.com>
 <2b6586e6-528c-86e8-9d92-0061bc44866d@gmail.com>
 <aad327a8-95bc-40ec-abf7-ad216a02fad0@synopsys.com>
 <2cc783ac-6b71-190b-49fc-9e2bceeacd4b@gmail.com>
 <920590dc-5430-7f8b-b2e1-1a4c37f4dfbe@synopsys.com>
 <CAHp75Vfs9AoOYSVGTpw30h11ptPOSPNf1AsWBKdiVrDL=9X3PQ@mail.gmail.com>
 <0089306e-e2ca-9a53-6ffb-202d028050ce@gmail.com>
 <CAHp75Vc0P746FhhohJ=wRccsQL4ewn+AECMw3yTD6cuGxHCG9Q@mail.gmail.com>
 <30ab00e4-53ae-fd9e-1689-c94078a31625@gmail.com>
 <871rhin1yt.fsf@kernel.org>
 <ec15a515-6dbc-1224-a457-d5ac4a4db280@gmail.com>
 <87eel7q9bk.fsf@kernel.org>
 <326aa23e-fabd-f3d6-4778-d036858413a2@gmail.com>
 <87blgar2ow.fsf@kernel.org>
 <e21a5a77-9017-4cbe-a228-85357d660da5@gmail.com>
 <87d00py4sj.fsf@kernel.org>
 <cdb37a4c-2815-0068-1707-2e9163d1a93c@gmail.com>
Date:   Mon, 09 Nov 2020 09:00:47 +0200
Message-ID: <87wnyv2ew0.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


Hi,

Ferry Toth <fntoth@gmail.com> writes:
>> I don't suppose you have a USB sniffer, do you?
> No, I don't have one of those.
>> Andy, could you see if you can reproduce the same behavior with a
>> sniffer? It really seems like this either caused by the host side or
>> something outside dwc3. Perhaps the PHY is going bonkers?
>>
>> cheers
>
> But got other inspiration: like you say dwc3 is behaving normally, so 
> problem might be elsewhere right?
>
> Now, to make gadget working I needed to apply the experiment from Jack Pham:
>
> https://github.com/edison-fw/linux/commit/da90cb63fc8f0ce18805f262d4d6b5b4d8c11d5c
>
> But now Jack has already sent in "[PATCH v3] usb: gadget: audio: Free 
> requests only after callback"
>
> So, removing the experiment and adding PATCH 3, this issue appears to go 
> away.
>
> And indeed this fixes a problem in u_audio.c, not in dwc3.
>
> Thanks all, I'm looking forward to the patch to land in 5.10-rc3/4.

Awesome!!! Do you want to reply to Jack's patch with a Tested-by?

-- 
balbi
