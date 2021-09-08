Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52522403604
	for <lists+linux-usb@lfdr.de>; Wed,  8 Sep 2021 10:23:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348325AbhIHIW7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 8 Sep 2021 04:22:59 -0400
Received: from cable.insite.cz ([84.242.75.189]:49958 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1348202AbhIHIW4 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 8 Sep 2021 04:22:56 -0400
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id 2975CA1A3D402;
        Wed,  8 Sep 2021 10:21:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1631089305; bh=xZ4CdmOgShW6GkJ22VB1GJdmGZP/AyDzgHhQwOUVzlY=;
        h=From:Subject:To:Date:From;
        b=T0WcncR4u+2WOIirMCq5m+mmKJR4/0ogmklreSDq9rPPTI81zG4c3aZCWtYj424MO
         RAV360RmnWsFs2bV7MJsoGOsUgl7pv5c40uZfFfb5CGRxxTiweBs5MhxW+rNI/1kYg
         z+I/9kuIdNMJ0uAMj71pFqCG23UEpNVgHn2Xdp+M=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id tyKv6bs_lSlo; Wed,  8 Sep 2021 10:21:40 +0200 (CEST)
Received: from [192.168.105.22] (dustin.pilsfree.net [81.201.58.138])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id EBDD3A1A3D400;
        Wed,  8 Sep 2021 10:21:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1631089300; bh=xZ4CdmOgShW6GkJ22VB1GJdmGZP/AyDzgHhQwOUVzlY=;
        h=From:Subject:To:Date:From;
        b=qVaYkeYAfIul+hKKjHRrcORcBlCmgRXDhlcv80QdGvbqwyxCBrjYC/Q4fvF7AcK3n
         hznfi0QcwZk6m9sxG4zEqwBBiQkVZRlJ2eL+UmlQDKNy8FC27ANKjKxwRJDUyRaPO5
         dw4vqcG2+i3lWVhv8/de9kIZ0NZEqNgdpeE5pvwg=
From:   Pavel Hofman <pavel.hofman@ivitera.com>
Subject: RFC: usb: gadget: u_audio: Notifying gadget that host started
 playback/capture?
To:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Julian Scheel <julian@jusst.de>
Message-ID: <6ebc2456-a46b-bc47-da76-7a341414c1fb@ivitera.com>
Date:   Wed, 8 Sep 2021 10:21:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

The current audio gadget has no way to inform the gadget side that the 
host side has started playback/capture and that gadget-side alsa 
processes should be started.

Playback/capture processes on the host side do not get stuck without the 
gadget side consuming/producing data (OUT requests are ignored in 
u_audio_iso_complete, IN ones send initial zeros in their req->buf).

However, playback/capture processes on the gadget side get stuck without 
the host side sending playback OUT packets or capture IN requests and 
time out with error. If there was a way to inform the gadget side that 
playback/capture has started on the host side, the gadget clients could 
react accordingly.

I have been trying to investigate the packet flow/behavior in 
u_audio:u_audio_iso_complete, u_audio_start_capture/playback, 
u_audio_stop_capture/playback but could not find a pattern which would 
recognize that playback or capture has started. I see incoming OUT and 
IN requests shortly after gadget enumeration. Also before starting 
playback/capture both _start_ and _stop_ method are called. I guess the 
actual sequence will be specific for every UAC2, maybe even for every 
player/capture app on the host.

Technically a boolean alsa ctrl could be used for each direction 
(Capture Running/Playback Running, resp. specific rate or zero in 
Capture Rate/Playback Rate in Julian's multiple rates patches I am 
preparing), with the gadget client registering for notifications.But 
detecting when to set the ctrl value is the key.

Thanks a lot for ideas and recommendations.

Pavel.

