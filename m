Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC52520333A
	for <lists+linux-usb@lfdr.de>; Mon, 22 Jun 2020 11:22:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726836AbgFVJWK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 22 Jun 2020 05:22:10 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:35080 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726608AbgFVJWK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 22 Jun 2020 05:22:10 -0400
Received: by mail-lj1-f196.google.com with SMTP id q19so18482464lji.2
        for <linux-usb@vger.kernel.org>; Mon, 22 Jun 2020 02:22:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=YzggH+Jnr7As5TqqJqU+lziLZ+psRrAdT33Si9TbIfM=;
        b=YPuvnCrjdDPWJoho+zgKqBd4/Ah7mAvxfqHVanMuhhJJX0kVD6HFn0R5UNkMCv7b0b
         iXOhIJ/9PCsKByBTjbyl9PK8Gcc/qnrTwWCvJ91xV8hmpNKQXhBpgbrsuBT4CGcv+fHi
         LNZpMO9FGlpJubPrtOSlU2BzhFcizFCQxMXGGJ0uP6ssT8C6THA0VeFC2sOC36lOxSUJ
         zfqvmISN0G2vLgNHwej5w3uPJ3g07khIyGlrRk6Lb39SGuqYGPR1a+Ba8xi1yA2uWxSR
         F8bmsfmxGxFXEVzph8TWjAyQftxEY11s1jyypxTuSBjL03qSl8Qype8kPj+IJ/dAQuPS
         F4Xg==
X-Gm-Message-State: AOAM531KJQFp3ceV8WHjrBBfQhi/Idr6ywZrYt4ZPqnqu/LTirAe9f4x
        gGXXTU1LHcxAQG4CEOblnXQ=
X-Google-Smtp-Source: ABdhPJx2rYsJ3BTPyaVrQ/QspB8GuQBPLEQwi4PNNiAjyndnnnE5X/peaPGjcEKpNDUUE062Xs/8FA==
X-Received: by 2002:a2e:a407:: with SMTP id p7mr8607483ljn.470.1592817727983;
        Mon, 22 Jun 2020 02:22:07 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id v24sm3347956lfo.4.2020.06.22.02.22.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 02:22:07 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1jnIeU-0002Mt-1Q; Mon, 22 Jun 2020 11:22:06 +0200
Date:   Mon, 22 Jun 2020 11:22:06 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Rob Gill <rrobgill@protonmail.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH v3] driver/usb MODULE_DESCRIPTION entries to usb modules
Message-ID: <20200622092206.GC3334@localhost>
References: <20200619133141.31890-1-rrobgill@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200619133141.31890-1-rrobgill@protonmail.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jun 19, 2020 at 01:31:48PM +0000, Rob Gill wrote:
> The user tool modinfo is used to get information on kernel modules, including a
> description where it is available.
> 
> This patch adds a brief MODULE_DESCRIPTION to the following modules in driver/usb.
> 
> isight_firmware
> mxuport
> u_ether
> uas

We have literally thousands of modules without a module description, so
why this arbitrary and incomplete set?

If the driver author did not care to add a description I don't think we
should go adding mostly pointless descriptions to all those drivers now.

> Signed-off-by: Rob Gill <rrobgill@protonmail.com>
> 
> ---
>  drivers/usb/gadget/function/u_ether.c | 1 +
>  drivers/usb/misc/isight_firmware.c    | 1 +
>  drivers/usb/serial/mxuport.c          | 1 +
>  drivers/usb/storage/uas.c             | 1 +
>  4 files changed, 4 insertions(+)

Johan
