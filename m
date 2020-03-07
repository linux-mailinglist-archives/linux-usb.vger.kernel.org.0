Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C11417CFCD
	for <lists+linux-usb@lfdr.de>; Sat,  7 Mar 2020 20:15:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726206AbgCGTPE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 7 Mar 2020 14:15:04 -0500
Received: from mail-lf1-f54.google.com ([209.85.167.54]:34033 "EHLO
        mail-lf1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726138AbgCGTPD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 7 Mar 2020 14:15:03 -0500
Received: by mail-lf1-f54.google.com with SMTP id w27so4501433lfc.1
        for <linux-usb@vger.kernel.org>; Sat, 07 Mar 2020 11:15:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=one-eyed-alien.net; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2uYOB3RuHfkoIsORffjFQ7cRUXuBj+pBfxmhq7YpleA=;
        b=B0YfG/4t6uTu3IILcvXoLa32x4DBTYn2oX6Sjsrah0vBR+HbsJWGAAgf/ZHIix948w
         VA091BnNdtycO2iKNy+G/QMaZE+UgR6e2wKWKzeAzTm8rzqoRHYfzLr1fR5UYC7IQ5YA
         tXLRCa+1PbT225kjrGi5bIDP8R6JIKs61FVW4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2uYOB3RuHfkoIsORffjFQ7cRUXuBj+pBfxmhq7YpleA=;
        b=AGwIDcF5Jje9ky+UsEdXtAmSZ/Bzjw6Bk7E5GYbASFMWtMz9Yb3kZQb6LBOwMQ2Dmy
         rMaxwd9U8sXRDhqxTDWBJo4D9WmnVf1thrZyplHEAHQwB6OvHiXVD6tvMGxjJuacMjQl
         v0DktRwP656RNx7Wqns4PsWOiIu+coQTjvOtITSL/aKyqfrm92eTlrLmaW17QVuAe/2c
         SW7Ms4sjnpRollwozKzZriu3Oa0tDgla1imrLDYoX5j4+UvciFnAHQ1rBc2V0+FKasYV
         ntoTSiufHW1LZ//x/bfdJLf1nLT/gfTOzt4aUvKWlgRhX2IsMCsc/Tj9Q22TTMdRFCN6
         BPww==
X-Gm-Message-State: ANhLgQ25GpO1CoY+/6/WjFYECiITU+FfLuY24I0KGsjKjQaevlgxIf7s
        C92M+WRfw2B1m3COp+O3A997UGrqn6kzL7TByZuKptPg
X-Google-Smtp-Source: ADFU+vsCjX4IMp8Un7wCrkDwVSZJa3xbTPf2byNun+rFDHSlxHCiwHKgizo/Pt4C5VzNGhwgP+mVkmk0ekLGdGpMYQM=
X-Received: by 2002:ac2:4c18:: with SMTP id t24mr959795lfq.54.1583608501473;
 Sat, 07 Mar 2020 11:15:01 -0800 (PST)
MIME-Version: 1.0
References: <477a12ce-e6ae-ce43-fca7-0f1dc4e00735@lockie.ca>
In-Reply-To: <477a12ce-e6ae-ce43-fca7-0f1dc4e00735@lockie.ca>
From:   Matthew Dharm <mdharm-usb@one-eyed-alien.net>
Date:   Sat, 7 Mar 2020 11:14:49 -0800
Message-ID: <CAA6KcBAEfZJ0rHHKEGELrdVehNFfELV78AOw=X=qhp1jQBXucA@mail.gmail.com>
Subject: Re: dvdrw USB3 drive seen as USB2
To:     James <bjlockie@lockie.ca>
Cc:     linux-usb <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Is the cable on your DVDRW device a USB3 cable?  Those have extra pins
(and are often blue) for USB3 cables.  If you use a USB2 cable with a
USB3 device, it will automatically revert to USB2 only.

Matt

On Fri, Mar 6, 2020 at 12:40 PM James <bjlockie@lockie.ca> wrote:
>
> I bought what is supposed to be a USB3 dvdrw drive but it is detected as
> USB2.
>
> $ dmesg
> [99941.296152] usb 1-3: new high-speed USB device number 12 using xhci_hcd
> [99941.464780] usb 1-3: New USB device found, idVendor=13fd,
> idProduct=0840, bcdDevice= 1.14
> [99941.464783] usb 1-3: New USB device strings: Mfr=1, Product=2,
> SerialNumber=3
> [99941.464786] usb 1-3: Product: External
> [99941.464788] usb 1-3: Manufacturer: Generic
> [99941.464789] usb 1-3: SerialNumber: 534841353132313630362020
> [99941.477838] usb-storage 1-3:1.0: USB Mass Storage device detected
> [99941.478063] scsi host9: usb-storage 1-3:1.0
> [99942.485502] scsi 9:0:0:0: CD-ROM            hp       DVD RW AD-7586H
> KH04 PQ: 0 ANSI: 0
> [99942.488054] sr 9:0:0:0: Power-on or device reset occurred
> [99942.492956] sr 9:0:0:0: [sr0] scsi3-mmc drive: 24x/24x writer dvd-ram
> cd/rw xa/form2 cdda tray
> [99942.493466] sr 9:0:0:0: Attached scsi CD-ROM sr0
> [99942.493594] sr 9:0:0:0: Attached scsi generic sg2 type 5
>
> $ lsusb
> Bus 001 Device 012: ID 13fd:0840 Initio Corporation INIC-1618L SATA
>
> $ lsusb -t
> /:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/10p, 480M
>      |__ Port 3: Dev 12, If 0, Class=Mass Storage, Driver=usb-storage, 480M
>
> I plugged in a known USB3 device in the same port.
> Could there be a bug that makes the bus decide it is not a USB3 device?
>
> $ lsusb
> Bus 002 Device 003: ID 13fe:6300 Kingston Technology Company Inc. USB
> DISK 3.0
>
> $ lsusb -t
> /:  Bus 02.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/4p, 10000M
>      |__ Port 3: Dev 3, If 0, Class=Mass Storage, Driver=usb-storage, 5000M
>
> Is there a way to see if Windows in a VirtualBox sees it as USB3?
>


-- 
Matthew Dharm
Former Maintainer, USB Mass Storage driver for Linux
