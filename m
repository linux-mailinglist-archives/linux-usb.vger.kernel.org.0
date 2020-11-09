Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 406B22AB262
	for <lists+linux-usb@lfdr.de>; Mon,  9 Nov 2020 09:29:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729236AbgKII3d (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 9 Nov 2020 03:29:33 -0500
Received: from cable.insite.cz ([84.242.75.189]:53648 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726127AbgKII3d (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 9 Nov 2020 03:29:33 -0500
X-Greylist: delayed 312 seconds by postgrey-1.27 at vger.kernel.org; Mon, 09 Nov 2020 03:29:32 EST
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id 0A5BCA93253BA;
        Mon,  9 Nov 2020 09:24:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1604910257; bh=GFxrZmOjHf1coQIZ1tOskOK/f3baZkB6oWTLPzXpIoY=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=QK965PRVN184B0sSUibHV8LDjeZP1b6YeVUWkE+vPMzR6Nw1ea0+BvqoUbM1dVlvk
         TZxi5t/UoTE/pPAemRcRmufhbOkkfWyQEX2NEvPzvqGAsM7JKCjlfBlxzqL7+7E4/x
         c0luAoi5TDzVdhxG/SPV9PJnIBwm1Y9LHsxHm9PA=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id bDuFcrYv9yJ3; Mon,  9 Nov 2020 09:24:11 +0100 (CET)
Received: from [192.168.105.22] (ip28.insite.cz [81.0.237.28])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id 7790AA93158DC;
        Mon,  9 Nov 2020 09:24:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1604910251; bh=GFxrZmOjHf1coQIZ1tOskOK/f3baZkB6oWTLPzXpIoY=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=l6P/zTnZu7xLX3vRtuzZnvQis65mA+6RXJsccfWKwyZODGmO+BR9yhV1e1iZdSaxb
         ckaUe8KOZR0DFu+mlnPuX5sAPdZrXoasZ4WhZtOQKKREa6th2adeOUzAOcSpRkOoIJ
         2TCCWt6bX3z80NoZ6U1y4tKl5Fi0DQvePR4mvyvw=
Subject: Re: [PATCH 3/3] usb: gadget: u_audio: add real feedback
 implementation
To:     Ruslan Bilovol <ruslan.bilovol@gmail.com>, balbi@kernel.org
Cc:     linux-usb@vger.kernel.org, gschmottlach@gmail.com
References: <1604794711-8661-1-git-send-email-ruslan.bilovol@gmail.com>
 <1604794711-8661-4-git-send-email-ruslan.bilovol@gmail.com>
From:   Pavel Hofman <pavel.hofman@ivitera.com>
Message-ID: <cbdd5e54-87e8-98f2-becb-692c125ae456@ivitera.com>
Date:   Mon, 9 Nov 2020 09:24:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1604794711-8661-4-git-send-email-ruslan.bilovol@gmail.com>
Content-Type: text/plain; charset=iso-8859-2
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Bilovol,

Dne 08. 11. 20 v 1:18 Ruslan Bilovol napsal(a):
> This adds interface between userspace and feedback
> endpoint to report real feedback frequency to the Host.
> 
> Current implementation adds new userspace interface
> ALSA mixer control "PCM Feedback Frequency Hz" (similar
> to aloop driver's "PCM Rate Shift 100000" mixer control)
> 
> We allow +/-20% deviation of nominal sampling frequency,
> that usually is more than enough in real-world usecases
> 
> Usage of this new control is easy to implement in
> existing userspace tools like alsaloop from alsa-utils.
> 
> Signed-off-by: Ruslan Bilovol <ruslan.bilovol@gmail.com>
> ---
>  drivers/usb/gadget/function/f_uac2.c  |  4 ++
>  drivers/usb/gadget/function/u_audio.c | 93 +++++++++++++++++++++++++++++++++++
>  drivers/usb/gadget/function/u_audio.h |  7 +++
>  3 files changed, 104 insertions(+)

Thanks a lot for the great implementation. IIUC the control element sets
integer frequency in Hz. Often the clocks deviate by small fractions of
Hz. Please have you considered the value to be e.g. in 100th of Hz for
finer control of the samplerate? Similar to the PCM Rate Shift which has
a step 100000th of the samplerate.

Thanks a lot.

Best regards,

Pavel.
