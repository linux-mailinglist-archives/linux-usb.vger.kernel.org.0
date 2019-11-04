Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F2A64EDB5D
	for <lists+linux-usb@lfdr.de>; Mon,  4 Nov 2019 10:15:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726441AbfKDJP0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 4 Nov 2019 04:15:26 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:38071 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726100AbfKDJPZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 4 Nov 2019 04:15:25 -0500
Received: by mail-lj1-f195.google.com with SMTP id v8so1057483ljh.5
        for <linux-usb@vger.kernel.org>; Mon, 04 Nov 2019 01:15:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=V84pd6/ipO6JPFb5cfwq7s+PIYE671g1slMfMreuSaY=;
        b=eZh16Pi68bYLnBHroEA38OBoXredUWWCsy6QvaM7cI/gkJb98ftsCCVC3erK6xh3cM
         nR9JeSW+gS4uPUbv/6bppfsAvWDwXSv9AWBl+3lS0NP5+TYi9f1J2ySxx6tWM/Vk3R9y
         O1Gmq/QmheWCKQhvl4yvELc6cPjhnkkxemfMi6zGp7uIYzF4bvZxuMmTktWX4i5WNtTP
         wlfT/81NDksfm8zywmeflEaZTuxIhP7+1itqRJ6Bf8ZPDI1SeWlZGxrEr44B30R1CEeU
         11EUzOnBV1DtoD3SgN1YvUBGqniBWyyC9+qRDfKlszaCboVEte2uZhcRtBGU27hhTmT+
         U3ow==
X-Gm-Message-State: APjAAAW1300oQQvskdPR++K/MFVRd8Sb5gbc5Sq6u1d+jiXfYGgiaCHE
        hQmlaleAzKWN2y0cj4Hum0E=
X-Google-Smtp-Source: APXvYqwTSB5FW0+O5ITShgjEd7+6FTx5X+/DY1Zc9kz9DTJf2OQ6HINvsLoxzKEjjd3mNGp+oEyAxg==
X-Received: by 2002:a05:651c:305:: with SMTP id a5mr18301552ljp.144.1572858923767;
        Mon, 04 Nov 2019 01:15:23 -0800 (PST)
Received: from xi.terra (c-51f1e055.07-184-6d6c6d4.bbcust.telenor.se. [85.224.241.81])
        by smtp.gmail.com with ESMTPSA id 68sm3912782ljf.26.2019.11.04.01.15.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2019 01:15:22 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.92.3)
        (envelope-from <johan@kernel.org>)
        id 1iRYSH-0006d1-Vy; Mon, 04 Nov 2019 10:15:22 +0100
Date:   Mon, 4 Nov 2019 10:15:21 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Charles Yeh <charlesyeh522@gmail.com>
Cc:     Johan Hovold <johan@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org,
        =?utf-8?B?WWVoLkNoYXJsZXMgW+iRieamrumRq10=?= 
        <charles-yeh@prolific.com.tw>
Subject: Re: [PATCH] [PATCH v8] USB: serial: pl2303: Add new PID to support
 PL2303HXN (TYPE_HXN)
Message-ID: <20191104091521.GF3657@localhost>
References: <20190924121400.1497-1-charlesyeh522@gmail.com>
 <20191023085657.GP24768@localhost>
 <CAAZvQQ7EdZ=5TtU0qHBzACQ=g5equR+F-j2nt+-0F3bYOH4F7A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAZvQQ7EdZ=5TtU0qHBzACQ=g5equR+F-j2nt+-0F3bYOH4F7A@mail.gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Nov 02, 2019 at 04:58:24PM +0800, Charles Yeh wrote:
> > Now applied, thanks.
> 
> Hello sir, when to start updating the patch?

I'm not sure I understand your question; what did you mean here?

This patch will be included in Linux 5.5, if that's what your asking.

Johan
