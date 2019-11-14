Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7220BFCC49
	for <lists+linux-usb@lfdr.de>; Thu, 14 Nov 2019 18:57:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726557AbfKNR5r (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 14 Nov 2019 12:57:47 -0500
Received: from mail-lf1-f44.google.com ([209.85.167.44]:43316 "EHLO
        mail-lf1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726474AbfKNR5r (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 14 Nov 2019 12:57:47 -0500
Received: by mail-lf1-f44.google.com with SMTP id q5so5779900lfo.10
        for <linux-usb@vger.kernel.org>; Thu, 14 Nov 2019 09:57:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=RGWW1oQjd5eX3JE22dClxPty7jGSxD5ZUZ/zv/5Ob24=;
        b=cvisw5olklYQ/Ux+TGTF6EHK9kKDgMkGU1GRoZ0YGyWzvQ6lLoYzUkEQUSvwt8vUH8
         /X0lU0gVPTpH2P7o4SAG/CXyjvyHUwKvZwNnuQyg+zWw6ze8L12WJGmbSIJUeExDGVZ8
         VCcKPXob6CC6JgEozWem5p/beNMuct1gA79zhEPJ6e8i35zurBAgyQauLE0m0U24BHj5
         +8Jai6XDCgAuysSYLGMJVinMnDV+eB21n6GqoGxS8iAOaZm1/zdpSka5hCvEUlq294Tt
         LTEXEJOdbcbBOfeDlhLtwU0CYN5+rYIKh08bVOzO5JdMsjAJwqYUy4iU5UJPDJdFL2lH
         aQJg==
X-Gm-Message-State: APjAAAW9ySS62UYsIoV4qfSGACeuonM57w2BpNODDYMz3xbTa0Qadyev
        ItJpH9ste0fujXPoCkpXcpL77WLKhzA=
X-Google-Smtp-Source: APXvYqwMTS9SIsXp8fsQ7ANRMNZ1bZyhmpqSHV8V9cdr38tFw/usFUmqDxd7ok0kcg13EU2X+v71nA==
X-Received: by 2002:a19:196:: with SMTP id 144mr7643630lfb.47.1573754264133;
        Thu, 14 Nov 2019 09:57:44 -0800 (PST)
Received: from xi.terra (c-51f1e055.07-184-6d6c6d4.bbcust.telenor.se. [85.224.241.81])
        by smtp.gmail.com with ESMTPSA id m6sm2735024ljj.49.2019.11.14.09.57.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2019 09:57:43 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.92.3)
        (envelope-from <johan@kernel.org>)
        id 1iVJNR-0007eL-Gk; Thu, 14 Nov 2019 18:57:53 +0100
Date:   Thu, 14 Nov 2019 18:57:53 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Fabio D'Urso <fabiodurso@hotmail.it>
Cc:     Johan Hovold <johan@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] USB: serial: ftdi_sio: add device IDs for U-Blox C099-F9P
Message-ID: <20191114175753.GG5633@localhost>
References: <AM6PR0202MB3430B966BCDA378E9F2D68ACAF710@AM6PR0202MB3430.eurprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AM6PR0202MB3430B966BCDA378E9F2D68ACAF710@AM6PR0202MB3430.eurprd02.prod.outlook.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Nov 14, 2019 at 01:30:53AM +0000, Fabio D'Urso wrote:
> This device presents itself as a USB hub with three attached devices:
>  - An ACM serial port connected to the GPS module (not affected by this
>    commit)
>  - An FTDI serial port connected to the GPS module (1546:0502)
>  - Another FTDI serial port connected to the ODIN-W2 radio module
>    (1546:0503)
> 
> This commit registers U-Blox's VID and the PIDs of the second and third
> devices.
> 
> Datasheet: https://www.u-blox.com/sites/default/files/C099-F9P-AppBoard-Mbed-OS3-FW_UserGuide_%28UBX-18063024%29.pdf
> 
> Signed-off-by: Fabio D'Urso <fabiodurso@hotmail.it>

Applied, thanks!

Johan
