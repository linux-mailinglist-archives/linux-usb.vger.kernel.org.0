Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 299FB15947E
	for <lists+linux-usb@lfdr.de>; Tue, 11 Feb 2020 17:10:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730781AbgBKQKg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 11 Feb 2020 11:10:36 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:38403 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730005AbgBKQKf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 11 Feb 2020 11:10:35 -0500
Received: by mail-oi1-f195.google.com with SMTP id l9so13269374oii.5
        for <linux-usb@vger.kernel.org>; Tue, 11 Feb 2020 08:10:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xvPGrxFUGqMLSAiWfimrK4h2s+k8AyjaVs9/AW/hgW8=;
        b=UVOKTCHw1M6fbeb5+iIybMSi1mpRpN4EIktFFwL2Rmkj28+pPcdBcN5LXnTAyok1aK
         I1z2D4JpLfOZScrHtTm1grPhnaZYXNP2fPjzEoDhqOgXuT/En0LusO5UsMqTw5BLNF3M
         hcl2+0hyt1GZjhZ+iCGdUa02CuTFuJn9tmeHk0nXw9QgPMG6EZVVyeiboy1Aicgn05Ot
         v4gi/ViJZmjlAKaK7ulFiHa8pU2kneI8ZaE90FTCPOAMLWJQuxeVv0pV/LK3baErc3HF
         ZpDRXq2t75N6qEE0oxRT8K7CTqJG/uinvbRSLhe8rrfTSZWZWoJxL2J+WC1U4/1KRiXf
         1iUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xvPGrxFUGqMLSAiWfimrK4h2s+k8AyjaVs9/AW/hgW8=;
        b=ICt+0wqu2yD+1DamHaZUsaJHajC2j+w1sdN5i1iZ7uLzvw2MKOUH0zmZCcNfxX0N+H
         v6PVNEH670V4GmIgFfthYpoZrjGBxLo+pbpOSVN5YH+Q9wJAhmVjqmUlfUt4bKrFMO3w
         txocT80AtJ2AarAOOnWccmrKOpeGM67B88Mizj70Rtk916Q0pbZLjD0uGluDMt/UKnzd
         Mmip1JszquTjCT/eRAoviNp8xO25XYjOzBYYw4391T+BKGO83ay21BoU4KfZ/G6JnvAr
         lN7XO5GtNEzTtTgFMNq6j1/0QPVbTtme8G4hskl0F+ghV1CEdEXF4EnHUj6+eYC4Ng+Q
         hgnQ==
X-Gm-Message-State: APjAAAXt1GeLxiC2MrCfYR6T9U9oz691UwKVQRJVXCUqQB9RPce8t0H6
        YaYn64avPB0ccNF6Y2RgwTWhBR+6sTc3UoSLX2BFvMxhj3A=
X-Google-Smtp-Source: APXvYqwdYHW3b9A/kYLaGeypbGhchdIOgNML7kUSPRdj/JL9DSEpXWCndq6GIg4AowyzeDZF3TArXt8kJnIloI71ZxE=
X-Received: by 2002:aca:50cd:: with SMTP id e196mr3332127oib.178.1581437434605;
 Tue, 11 Feb 2020 08:10:34 -0800 (PST)
MIME-Version: 1.0
References: <4bd36708-0ade-fbd7-5eec-5b8df7b3f2ee@ivitera.com>
In-Reply-To: <4bd36708-0ade-fbd7-5eec-5b8df7b3f2ee@ivitera.com>
From:   Ruslan Bilovol <ruslan.bilovol@gmail.com>
Date:   Tue, 11 Feb 2020 18:10:23 +0200
Message-ID: <CAB=otbRMQ6eCD0U-2zDCQvN37VRhBta_9_+9u4FwEbY4St=AgQ@mail.gmail.com>
Subject: Re: usb:gadget:f_uac2: EP OUT is adaptive instead of async
To:     Pavel Hofman <pavel.hofman@ivitera.com>
Cc:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Feb 6, 2020 at 3:35 PM Pavel Hofman <pavel.hofman@ivitera.com> wrote:
>
> Hi,
>
> The existing UAC2 implementation presents itself as asynchronous
> USB_ENDPOINT_SYNC_ASYNC
> https://github.com/torvalds/linux/blob/master/drivers/usb/gadget/function/f_uac2.c#L276
> +
> https://github.com/torvalds/linux/blob/master/drivers/usb/gadget/function/f_uac2.c#L285
> .
>
> However:
> 1) The function does not define any feedback endpoint
>
> 2) IMO in reality it is adaptive - the g_audio capture device accepts
> any data passed by the USB host, the USB host is the one which defines
> the data pace.
>
> While Linux and reportedly OSX accept the async EP OUT without explicit
> feedback EP IN, Windows does not.
>
> Simply changing USB_ENDPOINT_SYNC_ASYNC to USB_ENDPOINT_SYNC_ADAPTIVE
> for the FS and HS output endpoints fixes the windows problem and IMO
> corrects the config to reflect real function.
>
> There are multiple projects underway adding the async feedback EP, but
> in the meantime I think the .bmAttributes information should be changed
> as above, making the device usable in Windows for everyone.

Are you working on async feedback EP implementation? I'm interested in that
feature and I can implement it soon but do not want to do double work
if somebody
is already working on it and will send to the community soon

Thanks,
Ruslan

>
> Thanks a lot for considering.
>
> Best regards,
>
> Pavel.
