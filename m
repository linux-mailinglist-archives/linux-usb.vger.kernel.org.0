Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C811E209A1E
	for <lists+linux-usb@lfdr.de>; Thu, 25 Jun 2020 08:53:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389807AbgFYGxt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 25 Jun 2020 02:53:49 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:38914 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389540AbgFYGxt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 25 Jun 2020 02:53:49 -0400
Received: by mail-lj1-f195.google.com with SMTP id b25so1647310ljp.6
        for <linux-usb@vger.kernel.org>; Wed, 24 Jun 2020 23:53:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=VOP/NHfjn+/doHshsSMj10KVzBVmk7y/J0P8NtnPDLs=;
        b=NxpH/4OFsquLScoq1ixJhI+arjUycd59wehheiDcTY/7pf/KOZ1+zkSMk6Ww8VMV9y
         LYyyOpfTGAY2TaBLuI/dK2SrxSlnvwbZl1AcfDp5FffltfOxzXYLST90W9YbHhnS8RZF
         X0EbW/3VTV3qGeCkZCAyQ8O/2RAtHQ4B7a4P+uUhmFphNnT99I99JS56FlpbnkwIgpGh
         xROezEDDwW0lll4hedbTaHsEmldiYuwL9KhfBg61L7JFc0ncKC6IHzHYrt+qf6gyCMnk
         9I6auRsO700iaxTPZg53VtMSCsZk12ScjrvO2WyAQXtzKjCtdqLE3GjXYOxCB3SOMpuV
         wBOA==
X-Gm-Message-State: AOAM532mNBoXMYnxqXyda65baJ1l8vOqDCPU4qo9g5TZ3d+HMZ37ba9z
        SyE4wEBLYC2eqt100t8NbCX7PY9TfoI=
X-Google-Smtp-Source: ABdhPJwJ2d3z8paEWKpOsiNR/3gz1A/09KueoVfcmmEoFW0/bGG+zDHpmyQJIYhdy3CeuwQnn2F0Iw==
X-Received: by 2002:a2e:8490:: with SMTP id b16mr16523545ljh.325.1593068026051;
        Wed, 24 Jun 2020 23:53:46 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id a22sm4537875lfg.96.2020.06.24.23.53.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2020 23:53:45 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1joLld-0005oO-4P; Thu, 25 Jun 2020 08:53:49 +0200
Date:   Thu, 25 Jun 2020 08:53:49 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Jerry <Jerry@jrr.cz>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org
Subject: Re: [PATCH v4] usbserial: cp210x - icount support for parity error
 checking
Message-ID: <20200625065349.GM3334@localhost>
References: <b4cd2557-9a61-5ccd-32ad-48b0c68bef6b@jrr.cz>
 <20200621085816.GB95977@kroah.com>
 <03712b5a-ecb6-ae42-ff8e-8d5d6f2ed918@jrr.cz>
 <20200621095509.GA120230@kroah.com>
 <470484c8-7afc-c593-5ca9-cdb97dba39e1@jrr.cz>
 <20200621135838.GA125568@kroah.com>
 <7bdff86f-0988-2afc-e1a6-35df2931fd5b@jrr.cz>
 <20200622053146.GB134804@kroah.com>
 <838f09f9-4063-1c2c-8b4d-c18dee6c18de@jrr.cz>
 <6f9cfeb1-3f98-abd3-2471-7508326620ca@jrr.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6f9cfeb1-3f98-abd3-2471-7508326620ca@jrr.cz>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jun 25, 2020 at 06:31:09AM +0200, Jerry wrote:
> Hello, can I do anything more for this patch?

You posted the last update only this Monday. I'll try to review it next
week.

Johan
