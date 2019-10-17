Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 68473DA51E
	for <lists+linux-usb@lfdr.de>; Thu, 17 Oct 2019 07:26:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392316AbfJQF0M (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 17 Oct 2019 01:26:12 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:33514 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728999AbfJQF0M (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 17 Oct 2019 01:26:12 -0400
Received: by mail-pf1-f195.google.com with SMTP id q10so870412pfl.0
        for <linux-usb@vger.kernel.org>; Wed, 16 Oct 2019 22:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uU3hjT8kk7o8OOTrTTkbm2fZKwdTwm/FEyEY+L+tJjk=;
        b=ElmtXkjKTdcsBwVCn/z28VbILxrPNoWaN0YdshFs2pFmFUcFxSCf1lwPQ5COifrblm
         vi1IhZUIHIIpICGj+YjNVwqGyIRa+jqlhPtL5jaXH8q0tTV4pRR3qqUDFXujRjaVyRNq
         9cPvE7NYTPVdbARx0uC3J6rcH2Ie5CMG4wGGz3/WFZ0+CvdBP5uMsO3G4JJ5fGP9/+fh
         isBOTaN6dCzHXUL3dK5gmEgPuCCx3IKhSBgsUGSZVG3vPWlzOlOLHSuy7RMBEE5jS6uR
         TR9PGhbWAjRnR9W4GeIQXfsWhP7M7e7mcSDfkO1wzvlMOd65PQRjwFkIVGJxBc+fIgE8
         4eAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uU3hjT8kk7o8OOTrTTkbm2fZKwdTwm/FEyEY+L+tJjk=;
        b=S8F+/6SOjNIjCHcErIbmZqkJBvLl+Ui9cUPrWVgXzfdFQZrfENm2aQ6KM1Gh5RJ3D6
         W/L7IWwTERFLS4M+xvWGBamuHrLWAtaGFB962fMp7yE6351giXk27bMkrHG3OiBOSCFc
         9DJwsMJrZIhx1IZWLTRx0GrSgS6WNP1jhCXHg6g6X4D2aHn/T/CwjaJEcxicaeL2roPC
         Zh32wNdQLfJk6xIfhE6fQ46/98S7edY2awIEPTBMc9uPKvXSov4we0+U9T+062KrSaGi
         npQnfOAOPhXOoNHceZXhsFPpqs6GmN0kw4+KLmDaEp838GRE5gguyrqoMbnvQIC3FgSG
         4PmA==
X-Gm-Message-State: APjAAAVdc6+1tYZKtvLFc9GeqXIRowmr5m1fDtuCRYz9Ug2f6R54FzwI
        OWC0R4JKI2dluZD0h+6KBU6lpA7q2vg=
X-Google-Smtp-Source: APXvYqxQXvSz4jhmw/f6Fo3JNBgr8QY+uH5pl7ZKYzE2sTYAhecyY/nYSa0PpXR9HTCKyp303CM/LA==
X-Received: by 2002:aa7:9ec5:: with SMTP id r5mr1618414pfq.230.1571289969859;
        Wed, 16 Oct 2019 22:26:09 -0700 (PDT)
Received: from localhost ([39.7.58.146])
        by smtp.gmail.com with ESMTPSA id n23sm866286pff.137.2019.10.16.22.26.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2019 22:26:09 -0700 (PDT)
Date:   Thu, 17 Oct 2019 14:26:05 +0900
From:   GwanYeong Kim <gy741.kim@gmail.com>
To:     shuah <shuah@kernel.org>
Cc:     valentina.manea.m@gmail.com, gregkh@linuxfoundation.org,
        allison@lohutok.net, opensource@jilayne.com,
        changcheng.liu@intel.com, tglx@linutronix.de,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v2] usbip: tools: Fix read_usb_vudc_device() error path
 handling
Message-ID: <20191017142605.000041f6@gmail.com>
In-Reply-To: <e460e4fb-cefa-9dea-f0f6-7e92f3727034@kernel.org>
References: <20191016131832.GC56859@kroah.com>
        <20191017022512.3809-1-gy741.kim@gmail.com>
        <e460e4fb-cefa-9dea-f0f6-7e92f3727034@kernel.org>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, 16 Oct 2019 20:33:39 -0600
shuah <shuah@kernel.org> wrote:

> On 10/16/19 8:25 PM, GwanYeong Kim wrote:
> > cannot be less than 0 - fread() returns 0 on error.
> > 
> 
> This isn't really accurate right. fread() doesn't always
> return 0 in error. It could return < number of elements
> and set errno.
> 
> Please make changes to reflect that.

Will reflect this.

> 
> > Signed-off-by: GwanYeong Kim <gy741.kim@gmail.com>
> > ---
> >   tools/usb/usbip/libsrc/usbip_device_driver.c | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/tools/usb/usbip/libsrc/usbip_device_driver.c
> > b/tools/usb/usbip/libsrc/usbip_device_driver.c index
> > 051d7d3f443b..959bb29d0477 100644 ---
> > a/tools/usb/usbip/libsrc/usbip_device_driver.c +++
> > b/tools/usb/usbip/libsrc/usbip_device_driver.c @@ -69,7 +69,7 @@
> > int read_usb_vudc_device(struct udev_device *sdev, struct
> > usbip_usb_device *dev) FILE *fd = NULL; struct udev_device *plat;
> >   	const char *speed;
> > -	int ret = 0;
> > +	size_t ret = 0;
> 
> You don't need to initialize this.

Exactly, because "ret" variable receives a "fread()" return value,

> 
> >   
> >   	plat = udev_device_get_parent(sdev);
> >   	path = udev_device_get_syspath(plat);
> > @@ -79,7 +79,7 @@ int read_usb_vudc_device(struct udev_device
> > *sdev, struct usbip_usb_device *dev) if (!fd)
> >   		return -1;
> >   	ret = fread((char *) &descr, sizeof(descr), 1, fd);
> > -	if (ret < 0)
> > +	if (ret != 1)
> 
> Why not print error message?


Sorry, I'll add a message.

How about this?

err("Cannot read vudc device descr file");


> 
> >   		goto err;
> >   	fclose(fd);
> >   
> > 
> 
> thanks,
> -- Shuah

