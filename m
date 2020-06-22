Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBCAC203294
	for <lists+linux-usb@lfdr.de>; Mon, 22 Jun 2020 10:53:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726987AbgFVIx0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 22 Jun 2020 04:53:26 -0400
Received: from mail-lj1-f175.google.com ([209.85.208.175]:41163 "EHLO
        mail-lj1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725966AbgFVIx0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 22 Jun 2020 04:53:26 -0400
Received: by mail-lj1-f175.google.com with SMTP id 9so18356761ljc.8;
        Mon, 22 Jun 2020 01:53:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=nZTBXhwF66GMXMYe0wTj59WMwAfoF1kcnBYniC5n5Lk=;
        b=De+tA9zcJGOWfFb/l9sfP6OoEAd1xrRtnLFcM+bDdL5YEIroDzpS76hF4UPBjBbUHd
         us+R9wiNHH2LL95iuoNDzNRQsSk89nTJs+mjnjxt+qivLSDHj+Cx1VgBvEaeOgkH8684
         opG+AeQSO8Ql+ZCqc8kLdaxhnjvKxIjZtPdPGuhMkaXN0+gZ51mYkcPfViTuRgl/wadP
         uV+7EcDFfw4lCSknBPSJJWCdoBdneMRBRIHUsEOCwb/wzx8coPyEbeSXD0Y+ZSE70N8q
         kK2HqgaY8VzoW/HgHIuG5WkYDOQLq92L6heK4UNh7grZNHkEl3/WXAbkzQC5wVyrxwn/
         D5PQ==
X-Gm-Message-State: AOAM5314ikFZO/N7HsBXZnnAgatZu6nZ5mKt9hKyJ9KekPWj6Hh2I6aE
        7SZ0bf4KWCtMltfMrxn3IVs10kCt
X-Google-Smtp-Source: ABdhPJxhy1Tbua04JsvQKGuKDKMK+vCeEpwG5Q/ZsF7deKMryw6WrVZjGR80MUIR2OdIl475OwDqOw==
X-Received: by 2002:a2e:98c2:: with SMTP id s2mr8503520ljj.288.1592816003291;
        Mon, 22 Jun 2020 01:53:23 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id e80sm3333134lfd.64.2020.06.22.01.53.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 01:53:22 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1jnICf-0004Dg-Td; Mon, 22 Jun 2020 10:53:21 +0200
Date:   Mon, 22 Jun 2020 10:53:21 +0200
From:   Johan Hovold <johan@kernel.org>
To:     James Hilliard <james.hilliard1@gmail.com>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH v2] USB: Serial: cypress_M8: Enable Simply Automated UPB
 PIM
Message-ID: <20200622085321.GA3334@localhost>
References: <20200616220403.1807003-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200616220403.1807003-1-james.hilliard1@gmail.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jun 16, 2020 at 04:04:03PM -0600, James Hilliard wrote:
> This is a UPB(Universal Powerline Bus) PIM(Powerline Interface Module)
> which allows for controlling multiple UPB compatible devices from
> Linux using the standard serial interface.
> 
> Based on vendor application source code there are two different models
> of USB based PIM devices in addition to a number of RS232 based PIM's.
> 
> The vendor UPB application source contains the following USB ID's:
> #define USB_PCS_VENDOR_ID 0x04b4
> #define USB_PCS_PIM_PRODUCT_ID 0x5500
> 
> #define USB_SAI_VENDOR_ID 0x17dd
> #define USB_SAI_PIM_PRODUCT_ID 0x5500
> 
> The first set of ID's correspond to the PIM variant sold by Powerline
> Control Systems while the second corresponds to the Simply Automated
> Incorporated PIM. As the product ID for both of these match the default
> cypress HID->COM RS232 product ID it assumed that they both use an
> internal variant of this HID->COM RS232 converter hardware. However
> as the vendor ID for the Simply Automated variant is different we need
> to also add it to the cypress_M8 driver so that it is properly
> detected.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
> Changes v1 -> v2:
>   - Add more detailed commit message.

Now applied, thanks.

Would you mind posting the output of "lsusb -v" for this device for
completeness?

Johan
