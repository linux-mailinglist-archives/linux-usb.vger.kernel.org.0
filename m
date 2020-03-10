Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9D78818000D
	for <lists+linux-usb@lfdr.de>; Tue, 10 Mar 2020 15:24:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727332AbgCJOYN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 10 Mar 2020 10:24:13 -0400
Received: from mail-vs1-f66.google.com ([209.85.217.66]:34128 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727142AbgCJOYN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 10 Mar 2020 10:24:13 -0400
Received: by mail-vs1-f66.google.com with SMTP id y204so8510849vsy.1
        for <linux-usb@vger.kernel.org>; Tue, 10 Mar 2020 07:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hackerdom.ru; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=/gHw4kLrEIsmI95qZ6nhMGzekL5ir6AYQAFylshVC6Q=;
        b=R30ltV5tj9XzuTZ2exE8wYmEotSsZ5kd0syyUTaIwJ2RS4e1QbDTMJo2CnIJPg0QOQ
         atO1T/En7QKSQYES5TMSv2EVMQ9rXpIoxUB10SH5C9fz24obJLJA9UptdQ7r3yhmD3t2
         iEYdsf76hyflnonwLDkN12zPkyg/E7zYuWQCI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=/gHw4kLrEIsmI95qZ6nhMGzekL5ir6AYQAFylshVC6Q=;
        b=QTjzvogt/nwuuA5jHn5/TsUjIoC5VN8JIIO7DfCt42gPGLuWuBqTbtCvAtNyUfSqyh
         iMEl+rCWY/5JTRIJPvb1qCPH92CrdYNtrixDblncSEuqo3ceVuO1ZJnExJYJplXTVrPf
         Um0BIPCH6Y6yYTqei9fgHQHnNTvFj+YuqIhrYnd7+IjABw3FzOpTZBOAR1Lp2zyIlD/y
         lcjKNZvfk7c+jpjjIGIN6Iqk57WT85CIW2+9s472rhgIxtJ0sAWavA/MnjXXnA7VS9uZ
         TguRP2/TFBF65bILiPt+jdp7VmZ1bMBQ9PSc5ioXtbjGGhLGZs95yV6FBp1SS/0WgAcf
         vfDg==
X-Gm-Message-State: ANhLgQ1tgwlDkHVdvvl/nOUQxrwb6M70MpYdMDUalfOEv6qWqcDIyyg4
        h7o1ANbc18RSHN4ZCXG3xqMp3uvfh0GGpNb1bamYgqq4doIjUQ==
X-Google-Smtp-Source: ADFU+vsguArExWk0wcQcU9I8qOFiOXcjF1JZmzQlZ9OCSc+7GsyBkeDlISEi/lVi8pe0TU1Wo8jIb0GpllppvztHtu4=
X-Received: by 2002:a05:6102:1153:: with SMTP id j19mr13290116vsg.55.1583850252332;
 Tue, 10 Mar 2020 07:24:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200305203318.8980-1-bay@hackerdom.ru> <1583749022.17100.5.camel@suse.com>
 <CAPomEdycThBH5D3Eo3dNCPRrEg0W2fQ9JS9j6TbANTDVChVcog@mail.gmail.com>
In-Reply-To: <CAPomEdycThBH5D3Eo3dNCPRrEg0W2fQ9JS9j6TbANTDVChVcog@mail.gmail.com>
From:   =?UTF-8?B?0JDQu9C10LrRgdCw0L3QtNGAINCR0LXRgNGB0LXQvdC10LI=?= 
        <bay@hackerdom.ru>
Date:   Tue, 10 Mar 2020 19:24:01 +0500
Message-ID: <CAPomEdyx+A4+deXfuJT-i4m+pKuOLsx3+y6Rm+TQ_bZkECV--Q@mail.gmail.com>
Subject: Re: [PATCH] cdc_ncm: Implement the 32-bit version of NCM Transfer Block
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
