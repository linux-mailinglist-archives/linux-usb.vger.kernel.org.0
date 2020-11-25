Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3F0F2C3632
	for <lists+linux-usb@lfdr.de>; Wed, 25 Nov 2020 02:21:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728429AbgKYBVy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 24 Nov 2020 20:21:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727692AbgKYBVy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 24 Nov 2020 20:21:54 -0500
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5A90C0613D4
        for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2020 17:21:53 -0800 (PST)
Received: by mail-lj1-x243.google.com with SMTP id j10so529219lja.5
        for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2020 17:21:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3noFmTuQNcIBpNza5v1HkRdCp/nnB8dAmfqQPfvL/sk=;
        b=gGH9glNeaWmSGjiilY1xGaXYxfcM7+VNu3TuyRgdHqvh3myKO4417TYE0JwO149e/g
         OW47GNbJ9eb0iwrNY+4+ZPJlVnhpgddn/yz5RNJ4Oqz/asqApJGaEWNCNw9T7v12/S98
         6dYz48ULREKcLUHZJGMdJthPNrAjjZVBHdLGKAPyKaV7fwCB+o1h5ulEzE+qC5I6jFI3
         l7p3X3MzBYIilO8X8VPmlM4r1ExDEmKWjC7iu6q0fme5/XIKrT3tHpZ+UBzquHZ8z3on
         gXxpybdoiRAqb0f/TmMKdIk63tiU9+9wkNOY6rh6SXWeCQdwK10JCEL47Dz2CrSUaYIw
         MlwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3noFmTuQNcIBpNza5v1HkRdCp/nnB8dAmfqQPfvL/sk=;
        b=rvmgyofaUqbwSY1Q2b0497ZnL9yW/BrUpqRrEz1MBO3WMQX9itixzCkc33nyMTrloM
         vnwkWIeCxFatqWiK5GAocAp12C3vFW1gBkHknvlpEOUuUAMx/9lswF4cCyMMUmmBXSHo
         pwxrStqWG0M0i1VtZDXchoz2/ZNIRxxgxnvLeWHFczNBsjI7nDm24GJQj8itbw1oOwNv
         i65IGAFjOhg2nteBW4B0D7vmlAuctjccX/WP9cSzweAE2tR4vnxjUaIhyBTa1ET7Lcf0
         2hHsvwEDLnhdiX2rAj6Wxk367yKazX/BAy/RGoyp4dI8YWyLRaBz0Y8kiCStIeVZsAEP
         PFCA==
X-Gm-Message-State: AOAM533orRIQoFXqBtvSE0+5HXZcU9ZtWEuupUSVUZtuN/LOT2PBcBcr
        3B4fE9B9PSZ4ef0tNXV4SZffwT2/lwfdIGUTh0d/+eQ21Os=
X-Google-Smtp-Source: ABdhPJzr0yH5cTcHv22wYe5RwdBBKLysEBcAj3PTTNDrMwhOOuCtzow/jrqctuiBwxTaAfOSijDXCRNCJPi1gMLeulo=
X-Received: by 2002:a2e:5c7:: with SMTP id 190mr385715ljf.403.1606267312157;
 Tue, 24 Nov 2020 17:21:52 -0800 (PST)
MIME-Version: 1.0
References: <20201124163912.12074-1-festevam@gmail.com> <20201125011447.GD9929@b29397-desktop>
In-Reply-To: <20201125011447.GD9929@b29397-desktop>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Tue, 24 Nov 2020 22:21:40 -0300
Message-ID: <CAOMZO5A91b1cVgakrpPtGpGiMDzCKQ1Z37Ae8UX4LbskwYO4gw@mail.gmail.com>
Subject: Re: [PATCH 1/3] usb: phy: phy-mxs-usb: Use of_device_get_match_data()
To:     Peter Chen <peter.chen@nxp.com>
Cc:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Peter,

On Tue, Nov 24, 2020 at 10:15 PM Peter Chen <peter.chen@nxp.com> wrote:

> > -     mxs_phy->data = of_id->data;
> > +     mxs_phy->data = of_device_get_match_data(&pdev->dev);
>
> You may forget the error handling for it, eg, -ENODEV.

How can this happen?
