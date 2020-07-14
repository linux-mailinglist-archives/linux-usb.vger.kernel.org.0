Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3768F21EA03
	for <lists+linux-usb@lfdr.de>; Tue, 14 Jul 2020 09:26:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726282AbgGNH05 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 14 Jul 2020 03:26:57 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:32962 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725306AbgGNH05 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 14 Jul 2020 03:26:57 -0400
Received: by mail-lj1-f195.google.com with SMTP id e8so21285171ljb.0
        for <linux-usb@vger.kernel.org>; Tue, 14 Jul 2020 00:26:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=qRXcQfRkKnflDvGfM9PMv7wF7mXrnvespRg4E3WBBcQ=;
        b=NVw0+c/qkAueM1Zsp9j5GJxX6uWxFD2CbpqrjjXLRIMoPaAPjbIkQNKLaU1sjqQ/Sh
         ixRC8Y/7ElTeQtN8WE0UFS7Q4pkguFP6b21ZRsEHjuKNk8r8Wc2LQ8wVHAB3gLgY/btV
         SGaEhCwb5vy/rvjPda2AqC31vH5DtyrFRXpCO54KoJCYKqtR1sapiXbLTSc/Ga/Vv1/Y
         G+b9P0+XX3b1UmZWq8WXOTV5yQkYpNAbOa5lUo6Nfb+IhzcoLiqU2CYKSR6i3uMdBYB4
         fEIRhHgY36aO5bJEEGjukX16K2xVFk57f0bFTrGXchrvMjpajl/6BqoIriOwkFaO8Kap
         eP7Q==
X-Gm-Message-State: AOAM533Yi4Jmb7uY7bIQcy4bwO1AZv7Hn4cdeT01vj78j9kLcjUHRMI1
        q+HljaLD6fbztf/co9siRO8=
X-Google-Smtp-Source: ABdhPJyFEOifTPG3psCvKUBhzwF1ffRovM13usN4DH2sPHgLN1mqLFLCAikm3m7z+3eVUisfyx056g==
X-Received: by 2002:a2e:90cc:: with SMTP id o12mr97415ljg.231.1594711615141;
        Tue, 14 Jul 2020 00:26:55 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id o1sm5120052lfi.92.2020.07.14.00.26.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2020 00:26:54 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1jvFLE-0008Kl-C6; Tue, 14 Jul 2020 09:27:05 +0200
Date:   Tue, 14 Jul 2020 09:27:04 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Allen =?utf-8?B?TGVl6buO5Lqs5YCN?= <li.jingbei@neoway.com>
Cc:     Johan Hovold <johan@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH] USB: serial: option: Add support for Neoway N720
Message-ID: <20200714072704.GB22214@localhost>
References: <1594298156-21549-1-git-send-email-li.jingbei@neoway.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1594298156-21549-1-git-send-email-li.jingbei@neoway.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jul 09, 2020 at 08:35:56PM +0800, Allen Lee黎京倍 wrote:
> N720 is a Cat. 4 LTE modem. There are three interface
> mappings to meet different needs:
> ID 2949:8241(Rndis + Modem + Nmea + At_port + Diag + Rmnet)
> ID 2949:8243(Rmnet + Modem + Nmea + At_port + Diag + ADB)
> ID 2949:8247(Modem + Nmea + At_port + Diag + Rmnet)

> Signed-off-by: Jingbei Li <li.jingbei@neoway.com>

The name here doesn't match the From (author) name (and checkpatch.pl
complains).

> ---
>  drivers/usb/serial/option.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
> index 8e74903..9191a24 100644
> --- a/drivers/usb/serial/option.c
> +++ b/drivers/usb/serial/option.c
> @@ -524,6 +524,12 @@ static void option_instat_callback(struct urb *urb);
>  #define MEDIATEK_PRODUCT_FPDC_1COM		0x0043
>  #define MEDIATEK_PRODUCT_FPDC_2COM		0x0033
>  
> +/* Neoway products */
> +#define NEOWAY_VENDOR_ID			0x2949
> +#define NEOWAY_PRODUCT_N720_8241		0x8241
> +#define NEOWAY_PRODUCT_N720_8243		0x8243
> +#define NEOWAY_PRODUCT_N720_8247		0x8247

Please drop these defines and add a short comment after the entry
instead as we're trying to move away from these mostly redundant
defines. Add your devices in numerical order towards the end of the
table.

> +
>  /* Cellient products */
>  #define CELLIENT_VENDOR_ID			0x2692
>  #define CELLIENT_PRODUCT_MEN200			0x9005
> @@ -1972,6 +1978,13 @@ static const struct usb_device_id option_ids[] = {
>  	{ USB_DEVICE_AND_INTERFACE_INFO(MEDIATEK_VENDOR_ID, MEDIATEK_PRODUCT_7106_2COM, 0x02, 0x02, 0x01) },
>  	{ USB_DEVICE_AND_INTERFACE_INFO(MEDIATEK_VENDOR_ID, MEDIATEK_PRODUCT_DC_4COM2, 0xff, 0x02, 0x01) },
>  	{ USB_DEVICE_AND_INTERFACE_INFO(MEDIATEK_VENDOR_ID, MEDIATEK_PRODUCT_DC_4COM2, 0xff, 0x00, 0x00) },
> +	/* Neoway N720 4G Modem */
> +	{ USB_DEVICE(NEOWAY_VENDOR_ID, NEOWAY_PRODUCT_N720_8241),
> +	  .driver_info = RSVD(0) | RSVD(1) | RSVD(6) },
> +	{ USB_DEVICE(NEOWAY_VENDOR_ID, NEOWAY_PRODUCT_N720_8243),
> +	  .driver_info = RSVD(0) | RSVD(5) },
> +	{ USB_DEVICE(NEOWAY_VENDOR_ID, NEOWAY_PRODUCT_N720_8247),
> +	  .driver_info = RSVD(4) },
>  	{ USB_DEVICE(CELLIENT_VENDOR_ID, CELLIENT_PRODUCT_MEN200) },
>  	{ USB_DEVICE(PETATEL_VENDOR_ID, PETATEL_PRODUCT_NP10T_600A) },
>  	{ USB_DEVICE(PETATEL_VENDOR_ID, PETATEL_PRODUCT_NP10T_600E) },

Johan
