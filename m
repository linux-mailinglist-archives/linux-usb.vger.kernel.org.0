Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 78279180001
	for <lists+linux-usb@lfdr.de>; Tue, 10 Mar 2020 15:18:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727452AbgCJOSL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 10 Mar 2020 10:18:11 -0400
Received: from mail-vs1-f51.google.com ([209.85.217.51]:35301 "EHLO
        mail-vs1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727445AbgCJOSJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 10 Mar 2020 10:18:09 -0400
Received: by mail-vs1-f51.google.com with SMTP id m9so671575vso.2
        for <linux-usb@vger.kernel.org>; Tue, 10 Mar 2020 07:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hackerdom.ru; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=/gHw4kLrEIsmI95qZ6nhMGzekL5ir6AYQAFylshVC6Q=;
        b=A8T824hjR5N/p3t3GhfyJAVPoTfJqcp3OKdDgsbiK4SGctpaKlRRUyHCbbGcv75bXL
         NXldU72tYY2nGR+YAXp2X2rq2Lr36BCeFqvZ2fOj5xB+/8i1GGsXNYRJXkuLK8k1cPg5
         ca15KLiVc/ILC9E0Br8QiADrxu7F4lAJojt4Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=/gHw4kLrEIsmI95qZ6nhMGzekL5ir6AYQAFylshVC6Q=;
        b=D2IjZe8GoCub91KYYaqfW53B0E39+iVGq8epvBjprBQCSxSJMByaGZAQRXTRS2IEga
         XEcsgHwva5T5y7CgrkFWK7GYA28/1VCxGU5FMZtsncuRlAHEqQVUylvXmk8CKZ3w9WH/
         fzoKLETmfa1OIrV1OfjPlOpkUqngqJZNd4uv798BjsYhQIuwVpxcjFO+ACJ4gzNATGoS
         MT7Qj0ttjd2jmg2fLsaCiJfFi3wCcZhCkr0KwGG+I+//1yu+jjp1kPK+IWotXyGqyqk9
         M8cKDfvLTDrFsGKWhhnusAPLY9Qk2nBiWt7F/HlY4+LOXtNuVcRnfNB2qdFUpNCawRR5
         Eo7A==
X-Gm-Message-State: ANhLgQ2AIVzhISXK1mrNK2yB3/wKlw59/Hzi5BdaZpz39cjkReIzsFP6
        bordsvAqYhN7z6UZ55dJ/6ZpOeAkTiqmcVsvGSu+m9/qDpQ=
X-Google-Smtp-Source: ADFU+vtR88LV/enaz2iag4FQ7W9pTjOZgnAktbD8Rui8bQZ5npBa0m5hMK9XEutirT+AOzXBAgzHv2IzCTOYkN8h0t4=
X-Received: by 2002:a67:88c8:: with SMTP id k191mr1432889vsd.110.1583849886533;
 Tue, 10 Mar 2020 07:18:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200305203318.8980-1-bay@hackerdom.ru> <1583749022.17100.5.camel@suse.com>
 <CAPomEdycThBH5D3Eo3dNCPRrEg0W2fQ9JS9j6TbANTDVChVcog@mail.gmail.com>
In-Reply-To: <CAPomEdycThBH5D3Eo3dNCPRrEg0W2fQ9JS9j6TbANTDVChVcog@mail.gmail.com>
From:   =?UTF-8?B?0JDQu9C10LrRgdCw0L3QtNGAINCR0LXRgNGB0LXQvdC10LI=?= 
        <bay@hackerdom.ru>
Date:   Tue, 10 Mar 2020 19:17:55 +0500
Message-ID: <CAPomEdxg0aD=DgGVwFH4Zd1=0fao32mOL6nU=cL00jHJAuoTwA@mail.gmail.com>
Subject: Fwd: [PATCH] cdc_ncm: Implement the 32-bit version of NCM Transfer Block
To:     linux-usb@vger.kernel.org
Cc:     netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

=D0=BF=D0=BD, 9 =D0=BC=D0=B0=D1=80. 2020 =D0=B3. =D0=B2 15:17, Oliver Neuku=
m <oneukum@suse.com>:
>
> Am Freitag, den 06.03.2020, 01:33 +0500 schrieb Alexander Bersenev:
> > The NCM specification defines two formats of transfer blocks: with 16-b=
it
> > fields (NTB-16) and with 32-bit fields (NTB-32). Currently only NTB-16 =
is
> > implemented.
> >
> > This patch adds the support of NTB-32. The motivation behind this is th=
at
> > some devices such as E5785 or E5885 from the current generation of Huaw=
ei
> > LTE routers do not support NTB-16. The previous generations of Huawei
> > devices are also use NTB-32 by default.
> >
> > Also this patch enables NTB-32 by default for Huawei devices
>
> Hi,
>
> do you really see no other option but to make the choice with yet
> anothet flag? The rest of the code looks good to me.
>

Hi,

The reason of yet another flag is that some Huawei devices, E5785 and E5885=
,
are incorrectly reporting that they support NTB-16. In fact they support on=
ly
NTB-32.

Historically the Huawei devices used NTB-32 by default and there
was a flag CDC_NCM_FLAG_RESET_NTB16 to work around the bug that
some Huawei E3372H devices come out of reset in NTB-32 mode even if
NTB-16 mode was set. This commit removes the
CDC_NCM_FLAG_RESET_NTB16 flag, that was specific to Huawei devices
and introduces the CDC_NCM_FLAG_PREFER_NTB32 flag.

The NTB-16 has lower, protocol overhead, but NTB-32 allows to transfer more
data per transfer block, up to 4GB, supporting both High Speed and
SuperSpeed data rates. So NTB-32 can be faster on devices with big buffers
and slower on devices with small buffers.

Anyway, for 4g modem devices there should not be much difference between
NDP-16 and NDP-32 because the 4g speeds are lower than the USB speed.
But also there may be the devices, that, vice versa,
buggy with NTB-32 and work well with NTB-16.

So having a flag to choose the preferred implementation is probably the bes=
t
option - it allows to keep older device to work as before, but if it
is found out that
the device works with NTB-32 better, the flag can be enabled for that devic=
e
or vendor.

Best,
Alexander Bersenev
