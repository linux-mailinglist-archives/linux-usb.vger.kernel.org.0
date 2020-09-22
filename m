Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7590D273F37
	for <lists+linux-usb@lfdr.de>; Tue, 22 Sep 2020 12:07:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726522AbgIVKHY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 22 Sep 2020 06:07:24 -0400
Received: from mail-lf1-f45.google.com ([209.85.167.45]:43503 "EHLO
        mail-lf1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726341AbgIVKHY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 22 Sep 2020 06:07:24 -0400
Received: by mail-lf1-f45.google.com with SMTP id y2so17346235lfy.10
        for <linux-usb@vger.kernel.org>; Tue, 22 Sep 2020 03:07:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=g8AhtFNZ8B0u/Su5uMsQVep65Pu2+oZVvNFtSm1Q8jA=;
        b=dvDhIwJO8I77yPO0DtoDbWsstKXI+K/gVioS7fqMsIJnjOKSPN1wftp2unOdAHSMcv
         FNga5Qm5WHXmSQANZQNGm7d6sYqXCxnx11uCJMNuxswdBa3AGZO2YOKF1xc1bcm/phkT
         Bl/UjA1+a5hm+woyQ9UPWKECdWfSlrtsZDGGCcPeSzd05+ySwSeHBesQa7RU2Fsd7Lq8
         RPM0r9CoA+NNqBME7j3QWGp1XWI2RfwHf6PawoSmtq9jqaLpAuFR9U20dwIGBNlzx5FK
         oBoKYtMfcnbHkL1oU9Z2J/s2psi6Q1GkvBnaZSiRONVjRM8F/g4JhwcP77r3d+/xUcd3
         hE1w==
X-Gm-Message-State: AOAM532YADfy0NEuKKnZCDE3GgPksQx0MhWwgWuUs9CxaoUvkdDjrmPS
        9HnQE7OKvOvLc1t9ZH+VdEw=
X-Google-Smtp-Source: ABdhPJw51V0MqSA/f/VeYa3aoxN6B+nsbJNMH4ncAWSL7F9Bn9K64kg32nsaxprIi+kc/FanHjr1qA==
X-Received: by 2002:a19:7fc8:: with SMTP id a191mr1318889lfd.591.1600769242217;
        Tue, 22 Sep 2020 03:07:22 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id z27sm3359593lfg.14.2020.09.22.03.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2020 03:07:21 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1kKfCc-0001Lq-Ca; Tue, 22 Sep 2020 12:07:15 +0200
Date:   Tue, 22 Sep 2020 12:07:14 +0200
From:   Johan Hovold <johan@kernel.org>
To:     "<Daniel Caujolle-Bert>" <f1rmb.daniel@gmail.com>
Cc:     Johan Hovold <johan@kernel.org>, Oliver Neukum <oneukum@suse.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 0/4] USB: cdc-acm: handle broken union descriptors
Message-ID: <20200922100714.GB24441@localhost>
References: <20200921135951.24045-1-johan@kernel.org>
 <5f68d281.1c69fb81.86428.99fb@mx.google.com>
 <20200922070818.GA24441@localhost>
 <5f69ca33.1c69fb81.f95dc.2c96@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5f69ca33.1c69fb81.f95dc.2c96@mx.google.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Sep 22, 2020 at 11:56:02AM +0200, <Daniel Caujolle-Bert> wrote:
> Hi Johan,
> 
>    Okay, I replied to the second patch, hope I didn't make any mistake.

Looks good. Thanks again!

Johan
