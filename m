Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 122AE2C9EFC
	for <lists+linux-usb@lfdr.de>; Tue,  1 Dec 2020 11:20:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726917AbgLAKSo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Dec 2020 05:18:44 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:39685 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726688AbgLAKSn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 1 Dec 2020 05:18:43 -0500
Received: by mail-lj1-f196.google.com with SMTP id o24so1984885ljj.6;
        Tue, 01 Dec 2020 02:18:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=r884Dtj/SKGKwdn0bdO73MaDfI4I9XuoyNT0XwhtuzY=;
        b=R09f8E8x+eRUWc4GqfPooR6PK4CGaowARMrOR10fBlOjIAz/7+YdQ1MwfpzxmGp3uT
         Vv//Ur1UbxAS6887roeapwB+uvzPYl7coHOdpQCLRJXnb9FoX474Cf/3cAfqIX7S+W4a
         sbq42t5nGdJAzdDQCDGAzq0PkvIKeOj1pXvS1619k8nDls/+qt+ZKjNjhjo++IUSBY4N
         qe/bmeonjzhPOcGH9dyUkCBoEA1Htdd9XOGt2hOjDRDDHVXfPKbvP/CQUw4jB4Zr4FgT
         fAdalBsVkTXj9jo7pBeEPMzDRnCVSbBRmG5w03E3NV3QLSDHoRTMTJM3dwKrTqvxD6FK
         1A+Q==
X-Gm-Message-State: AOAM531e8mJryfclD67pMf/y7JpCH9P7+6408hRF6rgLrYUTCAPwx+P8
        k+Rtc1SzLvySauzdgTSriHs=
X-Google-Smtp-Source: ABdhPJzBKR6olQ36FZWCPNnJjpvoVm5stwubLnPkm9/6C0AoxmSxMO8JsX0p7L9QnpSoJRzFypvbAw==
X-Received: by 2002:a2e:6f04:: with SMTP id k4mr965305ljc.220.1606817881175;
        Tue, 01 Dec 2020 02:18:01 -0800 (PST)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id 123sm152655lff.119.2020.12.01.02.18.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Dec 2020 02:18:00 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1kk2jt-0006tL-Go; Tue, 01 Dec 2020 11:18:30 +0100
Date:   Tue, 1 Dec 2020 11:18:29 +0100
From:   Johan Hovold <johan@kernel.org>
To:     =?iso-8859-1?Q?Bj=F8rn?= Mork <bjorn@mork.no>
Cc:     Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org,
        Sebastian Sjoholm <sebastian.sjoholm@gmail.com>,
        linux-stable@vger.kernel.org
Subject: Re: [PATCH] USB: serial: option: fix Quectel BG96 matching
Message-ID: <X8YYdVk7LQ+VcpPf@localhost>
References: <20201201100318.37843-1-bjorn@mork.no>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201201100318.37843-1-bjorn@mork.no>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Dec 01, 2020 at 11:03:18AM +0100, Bjørn Mork wrote:
> This is a partial revert of commit 2bb70f0a4b23 ("USB: serial:
> option: support dynamic Quectel USB compositions")
> 
> The Quectel BG96 is different from most other modern Quectel modems,
> having serial functions with 3 endpoints using ff/ff/ff and ff/fe/ff
> class/subclass/protocol. Including it in the change to accommodate
> dynamic function mapping was incorrect.
> 
> Revert to interface number matching for the BG96, assuming static
> layout of the RMNET function on interface 4. This restores support
> for the serial functions on interfaces 2 and 3.
> 
> Full lsusb output for the BG96:

> Cc: Sebastian Sjoholm <sebastian.sjoholm@gmail.com>
> Cc: linux-stable@vger.kernel.org
> Fixes: 2bb70f0a4b23 ("USB: serial: option: support dynamic Quectel USB compositions")
> Signed-off-by: Bjørn Mork <bjorn@mork.no>

Thanks, Bjørn. Now applied.

Johan
