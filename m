Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B34B91B777D
	for <lists+linux-usb@lfdr.de>; Fri, 24 Apr 2020 15:51:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727010AbgDXNu6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 24 Apr 2020 09:50:58 -0400
Received: from cable.insite.cz ([84.242.75.189]:50404 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726301AbgDXNu6 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 24 Apr 2020 09:50:58 -0400
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id 43F76A1755F1F;
        Fri, 24 Apr 2020 15:50:56 +0200 (CEST)
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id VT3A0paSuqdh; Fri, 24 Apr 2020 15:50:51 +0200 (CEST)
Received: from [192.168.105.191] (ip28.insite.cz [81.0.237.28])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id EAA6EA1F2B0D7;
        Fri, 24 Apr 2020 15:50:50 +0200 (CEST)
Subject: Re: usb:gadget:f_uac2: EP OUT is adaptive instead of async
To:     Ruslan Bilovol <ruslan.bilovol@gmail.com>
Cc:     Linux USB <linux-usb@vger.kernel.org>
References: <4bd36708-0ade-fbd7-5eec-5b8df7b3f2ee@ivitera.com>
 <CAB=otbRMQ6eCD0U-2zDCQvN37VRhBta_9_+9u4FwEbY4St=AgQ@mail.gmail.com>
 <f3114cb0-dc77-b4a6-f70b-2e72c9e87ce2@ivitera.com>
 <cf933b39-1d4a-aeff-3db9-5e05da302665@ivitera.com>
 <CAB=otbQLV1b6mv3n6d0URRM71OnEmwkTSEDuiNW5-rniBzdo1w@mail.gmail.com>
From:   Pavel Hofman <pavel.hofman@ivitera.com>
Message-ID: <d6646b6e-2799-91f4-5be3-ece31ac96ecc@ivitera.com>
Date:   Fri, 24 Apr 2020 15:50:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAB=otbQLV1b6mv3n6d0URRM71OnEmwkTSEDuiNW5-rniBzdo1w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Dne 24. 04. 20 v 14:34 Ruslan Bilovol napsal(a):
> 
> I worked on this during last moths and implemented feedback endpoint
> and other improvements to UAC2 driver.
> Currently it's under testing, I do expect to submit patches to community soon.

That is amazing, thank you.

> 
> I used the same idea with "PCM Rate Shift" control to make it work with
> existing alsaloop tool, but the in this case I do think it's better to expose
> frequency directly to the control

I agree. Nevertheless compatibility with alsaloop would be quite useful.
 E.g. the gadget could just implement a simple loopback from gaudio ->
some alsa plugins chain -> one or more output soundcards to offer simple
features not available readily in other OSes (route, multi, etc). With
alsaloop such configuration would be very simple. Perhaps making both
relative and absolute controls available?

Thank you for your work.

Regards,

Pavel.
