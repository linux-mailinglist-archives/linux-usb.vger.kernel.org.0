Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78E53280F14
	for <lists+linux-usb@lfdr.de>; Fri,  2 Oct 2020 10:40:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726275AbgJBIkK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 2 Oct 2020 04:40:10 -0400
Received: from mail-lj1-f178.google.com ([209.85.208.178]:37491 "EHLO
        mail-lj1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725961AbgJBIkK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 2 Oct 2020 04:40:10 -0400
Received: by mail-lj1-f178.google.com with SMTP id n25so540412ljj.4
        for <linux-usb@vger.kernel.org>; Fri, 02 Oct 2020 01:40:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1AsSbmuUbFnG9IeGJ+M9J2J0J/6RZYlXUszXAUmeyKo=;
        b=Qk403HcK2mCmLcBLNkZiejbfU6GZ54BrkQYcOa/BFAgyHrOih0+i10uL9hGyeyaFol
         VcapbAvOADdIGpEtXAeVatwhbJMemesYixbDZZmRFeAvYkbdr+i8DT4zs9A+N615klxW
         JMFl9TJAoAYFEEW6HksdTIbxWab8MeRa6fRQhNth3XB/6gFFgL0OR1hyCzUC5KJ5S2gH
         mX1BiSKRDFZ2qtPSEPnCLGSiIxffA7FFuKJIWdF/Qv+w04sv3KyQ5TaZfcwqqdaCi0SQ
         zI06bdWB0n/qyhy2E4BLSo2KGYxaeAfaSfnwEXaATd5THdiBUQ2RYvquoPJmY4PjXElN
         Fhjw==
X-Gm-Message-State: AOAM532RCwj4PekrFk+F2Ks/iA0UQW8M0ExuNJE0/OA1xD2aZ2decEtN
        GdPGrGaA1cRgyWGQpZ0Z5IA=
X-Google-Smtp-Source: ABdhPJz8GX0WWWMkZjOtCUzF7w8KEX4hRnhNDY9ZC2QuFpM78lWBefCvj97XQk+w2mJ/54TE9CNKag==
X-Received: by 2002:a2e:a554:: with SMTP id e20mr430389ljn.458.1601628008367;
        Fri, 02 Oct 2020 01:40:08 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id r132sm169897lff.167.2020.10.02.01.40.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2020 01:40:07 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1kOGbh-00071e-7f; Fri, 02 Oct 2020 10:40:01 +0200
Date:   Fri, 2 Oct 2020 10:40:01 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Mychaela Falconia <mychaela.falconia@gmail.com>
Cc:     Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org
Subject: Re: [RFC] ftdi_sio driver: use altsetting or cur_altsetting?
Message-ID: <20201002084001.GG5141@localhost>
References: <CA+uuBqbCtc3EB0zPUE1WJ9s_+=Oyc5aHzYqUug7D4GpcsgoJcA@mail.gmail.com>
 <20201002070148.GF5141@localhost>
 <CA+uuBqZg+GJk+7FNUh9V4LhCU5L0QSHsM_3Q5bVfsOecBkAnQw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+uuBqZg+GJk+7FNUh9V4LhCU5L0QSHsM_3Q5bVfsOecBkAnQw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Oct 02, 2020 at 12:37:58AM -0800, Mychaela Falconia wrote:
> Hi Johan,
> 
> > As long as you only access bNumInterfaces, which by definition is
> > identical for all altsettings, it's not wrong per se.
> 
> But the code in ftdi_determine_type() that uses the altsetting pointer
> is not looking at bNumInterfaces, it is looking at bInterfaceNumber
> instead:
> 
>   inter = serial->interface->altsetting->desc.bInterfaceNumber;

Sorry, I meant bInterfaceNumber above.

Johan
