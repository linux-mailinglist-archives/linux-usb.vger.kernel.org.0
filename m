Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E8F26195A06
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2020 16:38:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726540AbgC0Pi1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 27 Mar 2020 11:38:27 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:45646 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726275AbgC0Pi1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 27 Mar 2020 11:38:27 -0400
Received: by mail-ed1-f68.google.com with SMTP id u59so11637919edc.12
        for <linux-usb@vger.kernel.org>; Fri, 27 Mar 2020 08:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=13KkiX8ebWJ7ffJKbaifD7UJCjVlx+9HSJRw0YI6cvs=;
        b=iRcTf3gFsKKbCMRGAka79cBGMOzc7RQn98K2j+0mXS208L68NHyV45BByNEIMstPsA
         iGMChtO3q6z6PhOdrPvuiW11fmz+iUoM+2wNJs54xSd79Bu3Sk2E9B0ITtQ4VgI8gDJN
         2Hxw9qreInRcRS88kLSf0h7JTTBwP9HfG1mQI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=13KkiX8ebWJ7ffJKbaifD7UJCjVlx+9HSJRw0YI6cvs=;
        b=fO+kjQJOfWYqDXDmW/rm9ALb7cXRH9s3NdgufPg9SHP9ghu1SmoH9WsZFlgWAFBi7S
         PJ4xL553pI54agDl9vPOSkELinV/gyyPZy0CyMyK4y30ZCdoOucn1djRnub7Hg6ClNrU
         UoTz43Wy2euiNreIDRJOr89vhIHXglmW14r1aKB+AEUR5EvO5KWtdxaYHt8Wavx3tlma
         61cyDyVEck0oIhN3zjunhVwColN1qCL69Qt1ugAfSRPS7HSHphMJO/OORkhCTCKAWTDl
         48+msuDxqHmLJ7DTSkcB8gEm67TjrLYfp23R2FrEvn9IjsMNzDrLAL3I/swsPj/5alZv
         U5kA==
X-Gm-Message-State: ANhLgQ1JpBzqoCYjHi9C4QKKhtO4Ryxu9hQjhOjXg17rjnHtncQInkWF
        /AWz8cN6NWJj6U3t1lcU914KtamX0wA=
X-Google-Smtp-Source: ADFU+vuKvk1FTfiPvKIDYFrY7uDVB6Em3OYKNvy389/RTlDU73CeETvvVFum3jwkt5P9ys/AEVdmHg==
X-Received: by 2002:a17:906:2451:: with SMTP id a17mr12617991ejb.79.1585323504958;
        Fri, 27 Mar 2020 08:38:24 -0700 (PDT)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com. [209.85.221.54])
        by smtp.gmail.com with ESMTPSA id dj1sm946292edb.70.2020.03.27.08.38.22
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2020 08:38:23 -0700 (PDT)
Received: by mail-wr1-f54.google.com with SMTP id m17so11873358wrw.11
        for <linux-usb@vger.kernel.org>; Fri, 27 Mar 2020 08:38:22 -0700 (PDT)
X-Received: by 2002:a5d:4091:: with SMTP id o17mr24301wrp.254.1585323502272;
 Fri, 27 Mar 2020 08:38:22 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1585297723.git.joglekar@synopsys.com> <5f7605b9f4cd2d6de4f0ef7d25be9a99d92c5aee.1585297723.git.joglekar@synopsys.com>
 <20200327092759.GA1693819@kroah.com> <d20ec217-adc2-e587-f285-83fbabc30378@synopsys.com>
 <20200327102211.GA1700570@kroah.com> <db1519be-979b-575d-9077-b26920aea5fc@linux.intel.com>
In-Reply-To: <db1519be-979b-575d-9077-b26920aea5fc@linux.intel.com>
From:   Raul Rangel <rrangel@chromium.org>
Date:   Fri, 27 Mar 2020 09:38:10 -0600
X-Gmail-Original-Message-ID: <CAHQZ30Djsh+xsEYQXc5h2vUm8eFQGTVJgd66QDkh5rDPwYZpJA@mail.gmail.com>
Message-ID: <CAHQZ30Djsh+xsEYQXc5h2vUm8eFQGTVJgd66QDkh5rDPwYZpJA@mail.gmail.com>
Subject: Re: [RESENDING RFC PATCH 4/4] usb: xhci: Use temporary buffer to
 consolidate SG
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        Tejas Joglekar <Tejas.Joglekar@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Fredrik Noring <noring@nocrew.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Laurentiu Tudor <laurentiu.tudor@nxp.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        John Youn <John.Youn@synopsys.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Not sure if I'm hijacking the thread, or if this patch is related, but
I've been seeing xHC hangs and timeouts with the dwc_3_1 controller.
Protocol Trace: https://0paste.com/59611 or
https://photos.app.goo.gl/54DGJJuH4kQa9Psy6
kernel trace: https://0paste.com/59613
This hang happens on transactions larger than 16K regardless of the
number of TRBs. I only see this on SS and not 2.0.
