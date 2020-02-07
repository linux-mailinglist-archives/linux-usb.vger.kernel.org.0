Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 11697155E91
	for <lists+linux-usb@lfdr.de>; Fri,  7 Feb 2020 20:24:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726974AbgBGTYo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 7 Feb 2020 14:24:44 -0500
Received: from cable.insite.cz ([84.242.75.189]:43524 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726900AbgBGTYo (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 7 Feb 2020 14:24:44 -0500
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id F3174A1A40B08;
        Fri,  7 Feb 2020 20:24:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1581103478; bh=9Y8oU7gNioIhzBGf2ReSXrUwmyZgNr8rOIU3grsxqIk=;
        h=Subject:To:References:From:Date:In-Reply-To:From;
        b=bnH13+OeeWEhM2p9dOp3agPgUQZ/F4E2/DKqBrC6bnQuOlEMZOzbQV+ys70hXF1Gp
         1RY0mwrmgjNGO9HbHn6HWFCt9jkQ67DV7BcWMZpRgtUcU/3uZ30T0MkxDU/VmSt4F3
         tLHezlHFmrWAL9escC2+hQ+m48DA3zX/VjahaDH4=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id rr23XFlYhdfp; Fri,  7 Feb 2020 20:24:32 +0100 (CET)
Received: from [192.168.105.151] (ip28.insite.cz [81.0.237.28])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id 413D0A1A40B05;
        Fri,  7 Feb 2020 20:24:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1581103472; bh=9Y8oU7gNioIhzBGf2ReSXrUwmyZgNr8rOIU3grsxqIk=;
        h=Subject:To:References:From:Date:In-Reply-To:From;
        b=BbhxBVuCgmX6df79lwM6tc3o3YHEhpIe0yvI313XPvQYAxsDAs2mAzDBOtrzKsT9O
         EiWFhcV9lGgtAYAVHB8I8nHZyAqpTpLTL9Pb9jGEUpvhvER0dC4ZKhcaud9mzEN9w8
         6UzkLUSO4/tQ8NeF8qFb0hUngP9LhpjcV6ZBO7Ag=
Subject: Re: [PATCH] overlays: dwc2: Increase RX FIFO size
To:     Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        linux-usb@vger.kernel.org
References: <43db1d9c-6fa2-88bd-11df-6ae2f48a4ac9@ivitera.com>
 <9b0f8daeb12ad4e5be74ff93e64c38087af199cf.camel@suse.de>
From:   Pavel Hofman <pavel.hofman@ivitera.com>
Message-ID: <75d6f277-7c47-d029-6c90-27825443a380@ivitera.com>
Date:   Fri, 7 Feb 2020 20:24:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <9b0f8daeb12ad4e5be74ff93e64c38087af199cf.camel@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Nicolas,

Dne 07. 02. 20 v 18:25 Nicolas Saenz Julienne napsal(a):
> 
> I suggest making a short summary of your github explanation[1] instead of just
> citing Minas. On one hand Minas' memory might get fuzzy after some time (or not
> be able to access the documentation) and...
> 
>> See: https://github.com/raspberrypi/linux/issues/3447
> 
> ...you're assuming this link will be always available. Which is unlikely. After
> properly explaining the issue, you won't need the link anyway. Ultimately a
> patch description should be as self-contained/self-explanatory as possible.

No problem. I tend to copy the whole explanation from that post as it 
explains in detail every step of the calculation which is quite complex. 
Would that be OK?

Thanks,

Pavel.
