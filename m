Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F98B16B69A
	for <lists+linux-usb@lfdr.de>; Tue, 25 Feb 2020 01:18:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728602AbgBYASE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 24 Feb 2020 19:18:04 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:50349 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728011AbgBYASD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 24 Feb 2020 19:18:03 -0500
Received: by mail-pj1-f65.google.com with SMTP id r67so483331pjb.0
        for <linux-usb@vger.kernel.org>; Mon, 24 Feb 2020 16:18:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=49/v+Nf7LPcGofu0JcfqKZIRUKh2q2fmPpy5lPor13s=;
        b=Vs4lXffuRy1uDo3E80/HdsgzKogmyf3F0I2+mUw2aLP0Shn14xz3TSqDrPBuX1m6RB
         D4Na8OdNYNgaF4GQ/MqQylhNyTy1Yne1cLVC33ANY2VeBxqr2KX2Eu+wyTfuo1tEUUs9
         3CBi+LlmGimBITkALwYNPUFlBknjdKXUzFi/WBMtVZ+Fs1lTI19IivrR6Bj3zNkSTgiH
         MU7d2aJxaw1H7BO7Dia9bD2PzGYp4HbbJPLkBRdBsFrPlFKoHZTfqiVNb7CKusBZoQgo
         TdvU+WTnHTssqdqDjsdi8jt3V74NhLk1b05+3LSoeaDt+iCA3WqRhB5iFWlGEk/Odwwq
         5lOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=49/v+Nf7LPcGofu0JcfqKZIRUKh2q2fmPpy5lPor13s=;
        b=kzC+DSwPqJcxe453NgBNUDJ5Rix8wEd13kg4KHpYIsRTgLje+n1S9LFKmyshhQhKXs
         TiV3B6j0P1pIj0XBlr8RzGKekaZWc+uR1ay85t5KTRput+xiox1Hs3fiBFxePNVpy7F2
         7h64xBBtCwq2Z35Xz9u61cXYQ5tubuNDeEwODwJX9/OD2qMGo6J2qK8Al3WU39K5uUS0
         vHH6ccOLUXkNOjNQrckZDTwpYUmHYxE9G5eEFFbazxc6a+YM8VSu+iIhfg7IE0oAX9Yw
         Qs7sHID9OrrUDXWxLuOxVlF4hmF1S4QiAFKsOdGL9iGMoQRKx8wmApJjbV3t3KpllwfJ
         KZ8w==
X-Gm-Message-State: APjAAAUGhWJPvg4897uT5y5joKmLIocnZem5rCXJ+ARNH2Qn3mGo9XHX
        fnYnNqRkkKfMWNI9fPj3VHN9x/JC
X-Google-Smtp-Source: APXvYqz1p4vCnOtscIrXCCvshSGFGr9Yfy8G1nn7w7PS4HobKXEMWJQeMggxhLob9bjomoiYMxttdQ==
X-Received: by 2002:a17:90b:254:: with SMTP id fz20mr1872925pjb.25.1582589883085;
        Mon, 24 Feb 2020 16:18:03 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id s7sm625161pjk.22.2020.02.24.16.18.01
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Feb 2020 16:18:02 -0800 (PST)
Date:   Mon, 24 Feb 2020 16:18:00 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Boris ARZUR <boris@konbu.org>
Cc:     linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Minas Harutyunyan <hminas@synopsys.com>,
        William Wu <william.wu@rock-chips.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Douglas Anderson <dianders@chromium.org>, a.seppala@gmail.com
Subject: Re: [PATCH] usb: dwc2: extend treatment for incomplete transfer
Message-ID: <20200225001800.GA13099@roeck-us.net>
References: <20200210213906.GA24079@roeck-us.net>
 <20200211054953.GA2401@tungsten>
 <20200211161522.GA1894@roeck-us.net>
 <20200215053647.GA10345@tungsten>
 <20200219211056.GA829@roeck-us.net>
 <20200223120247.GA21552@tungsten>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200223120247.GA21552@tungsten>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Feb 23, 2020 at 09:02:47PM +0900, Boris ARZUR wrote:
> Hi Guenter,
> 
> I tried your series of patch. rndis_host tethering & loading the machine
> seems to work fine. No more crashing.
> 
> That being said, I now have an issue with regular USB keys (I tried a few):
> usb 3-1: reset high-speed USB device number 2 using dwc2
> 
> I was able to reproduce this issue with the unpatched kernel, by disabling
> the early return in dwc2_alloc_dma_aligned_buffer(), see attached.
> There are times were re-allocation fails, either with your patch or with
> the (almost-)original code.
> 
> In particular it seems that there is a packet of lenght 13, usb_urb_dir_in() == true,
> usb_pipetype(urb->pipe) == PIPE_BULK, that comes in every 2s or so, that
> does not reallocate properly.
> 
Those packets have URB_NO_TRANSFER_DMA_MAP set. If that is the case,
the packet is not received into the transfer buffer but into an already
assigned DMA buffer/address. Providing a temporary buffer does not have
an effect; the packet is still received into the orginal buffer (and then
overwritten with the data in the temporary buffer). That means we have
to leave such packets alone.

I'll send out an updated series later tonight or tomorrow. I'll probably
send it as RFT series this time.

Guenter
