Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48CAF273B6E
	for <lists+linux-usb@lfdr.de>; Tue, 22 Sep 2020 09:08:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729545AbgIVHI2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 22 Sep 2020 03:08:28 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:41845 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728526AbgIVHI2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 22 Sep 2020 03:08:28 -0400
Received: by mail-lj1-f194.google.com with SMTP id y4so13213743ljk.8
        for <linux-usb@vger.kernel.org>; Tue, 22 Sep 2020 00:08:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9Ay1tAgPoVck33vDH1Fp/XIOGc/iZxnjcjvmuLks26A=;
        b=dPOu0rhJ6nEZRrH8WcYz9fXic5NWcE1Ye8/g6H++z3QRtXKoPNkLcrw7isXmkIBkoW
         bXZwyje8RiyHfPVRXrCuhfedkUadjZ+EC7TclqkzGi5BUf9QzxTI/t8Cw6EHNeHZ0dBI
         2+qlLzILc6guZoH5Bm/MJDbp74Cbq9MPYN2Q3Z1E4BfmCZ7uyZ/vBTuWYzBGF2Apuv3w
         XSNIDEO+7ZSwD/MA1lrwI344rDm2rZX863tUmzic5eGAwZ7BAbfl7keDIfFS1usNijY4
         X0Vge3cUyB8cRXC5/WJT1vR/5DyMYCUXuQTaNcr7d7NPJAjzl+vlngwDv1m/baMD+b4k
         Uzng==
X-Gm-Message-State: AOAM532frCIZEIxR+jO38yJi8wpGw7ZzLJM5799IKIHsjRpX321fYx3v
        hfokkLdf1LXpAY/7mC3kTwQ=
X-Google-Smtp-Source: ABdhPJxPdIW+4nmGCavST8kNOcG9lpsgi9J0LgP1lhSzKZzwwKQ+vQ7EoVMOml717/cRzpPvbntyzA==
X-Received: by 2002:a2e:8956:: with SMTP id b22mr996009ljk.85.1600758506216;
        Tue, 22 Sep 2020 00:08:26 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id d18sm3216212lfm.178.2020.09.22.00.08.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2020 00:08:25 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1kKcPS-0004I1-P8; Tue, 22 Sep 2020 09:08:18 +0200
Date:   Tue, 22 Sep 2020 09:08:18 +0200
From:   Johan Hovold <johan@kernel.org>
To:     "<Daniel Caujolle-Bert>" <f1rmb.daniel@gmail.com>
Cc:     Johan Hovold <johan@kernel.org>, Oliver Neukum <oneukum@suse.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 0/4] USB: cdc-acm: handle broken union descriptors
Message-ID: <20200922070818.GA24441@localhost>
References: <20200921135951.24045-1-johan@kernel.org>
 <5f68d281.1c69fb81.86428.99fb@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5f68d281.1c69fb81.86428.99fb@mx.google.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Sep 21, 2020 at 06:19:12PM +0200, <Daniel Caujolle-Bert> wrote:
> Hi Johan, Oliver,
> 
>    I just compiled and tested, everything still works.

Thanks for testing, Daniel.

If you want to you can reply to the second patch with a Tested-by tag so
that it gets added by Greg's tooling (or reply to the cover letter if
you want to have that tag added to all the patches in the series).

Johan
