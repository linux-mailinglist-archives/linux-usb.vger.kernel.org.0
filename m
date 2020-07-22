Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DD74229419
	for <lists+linux-usb@lfdr.de>; Wed, 22 Jul 2020 10:55:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727000AbgGVIzR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 22 Jul 2020 04:55:17 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:43096 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726254AbgGVIzR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 22 Jul 2020 04:55:17 -0400
Received: by mail-lf1-f67.google.com with SMTP id b11so865648lfe.10
        for <linux-usb@vger.kernel.org>; Wed, 22 Jul 2020 01:55:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+DuHpCpp+/U1YRECO3fd90uWUbMRBlFKICZm4laiVtE=;
        b=CxBt7mQSnJUo5ZwnQQto0pT27RHrELMStwnTrmwZXY/fiNDwLXYjwdUE5FhiLjurs4
         xiOyT6Kl0OQQW3h0NKuqOYugNeq1F+5+dEr1EWaJHjvfL53UkBCEkcbCDbqehWg/7bca
         85L1svwt1kL1lNsRKdM1E1hKaDSz0cw/DZHWRDLNJEL27Dl8s38o41wBe0Qo7pySn6Ou
         3AwzSinTtkwYBe8cqihBYiZ3KcRBNEEePCp9pG3t8qWkKPIlmhBKEJFmTqDlNbENRM8j
         0oBZBhzWM4FTlhP+Zcwf/HkO9TYh7SxpM2DL9Vg7nzJbH0AoPtr5OeeMtFlmKrCQzAqe
         D+UA==
X-Gm-Message-State: AOAM531ZN9WUqOcxSJTNGCwxUN0CB6Tp52+XE+SR3x+kAXXzoirDqtDr
        b1QHn1mEABPgJlxd8LZIgWsrEwTR
X-Google-Smtp-Source: ABdhPJwOvg1gpD+Avwd1cerxSF4/3m943SA+q+DFvknHs4pXcJoshB0oJ+DaZMOuZeCAlSSLiCL79Q==
X-Received: by 2002:a05:6512:3253:: with SMTP id c19mr7547371lfr.139.1595408115243;
        Wed, 22 Jul 2020 01:55:15 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id 83sm6176987ljj.51.2020.07.22.01.55.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2020 01:55:14 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1jyAWr-0005bL-RB; Wed, 22 Jul 2020 10:55:09 +0200
Date:   Wed, 22 Jul 2020 10:55:09 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Manivannan Sadhasivam <mani@kernel.org>
Cc:     Johan Hovold <johan@kernel.org>,
        Angelo Dureghello <angelo.dureghello@timesys.com>,
        linux-usb@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2] USB: serial: add support for MaxLinear XR21V1412
Message-ID: <20200722085509.GI3634@localhost>
References: <20200709222126.5055-1-angelo.dureghello@timesys.com>
 <20200714100851.GB3453@localhost>
 <20200714103727.GA2626@Mani-XPS-13-9360>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200714103727.GA2626@Mani-XPS-13-9360>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jul 14, 2020 at 04:07:27PM +0530, Manivannan Sadhasivam wrote:
> Hi,
> 
> On Tue, Jul 14, 2020 at 12:08:51PM +0200, Johan Hovold wrote:

> > There was another driver for this device posted recently, and which
> > appears to have more features:
> > 
> > 	https://lore.kernel.org/r/20200607162350.21297-2-mani@kernel.org
> > 
> > Would you mind taking a look and see if that one would work for you?
> > 
> > I had some comments on the latest version that needs to be addressed,
> > but I'm assuming Manivannan is working on a v5?
> > 
> 
> Yes! This driver is being worked on in my limited spare time. So I'm a bit
> late to reiterate the patchset but planning to send v5 around this weekend.

Ok, no stress. :)

Johan
