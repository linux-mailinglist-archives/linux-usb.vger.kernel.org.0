Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0EB45227C9D
	for <lists+linux-usb@lfdr.de>; Tue, 21 Jul 2020 12:11:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728005AbgGUKLN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 21 Jul 2020 06:11:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726147AbgGUKLM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 21 Jul 2020 06:11:12 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E81DC061794;
        Tue, 21 Jul 2020 03:11:12 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id k13so2387578lfo.0;
        Tue, 21 Jul 2020 03:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AqegAVUUDavgK7hfl9iCh0mu9TjHfNDN9kX05QgdHaQ=;
        b=RGzU+yxvmwHfzXaXCzU5giD6tiPNdHiVr5RUtzajbTbN0h+eoSZQvrMwQtAg9qViSe
         Hps+RuNPMAa0dbJMVuO+t5uNu16ScgnIwrmj4kweUEjRlTUGAvj9d5MREMWf832oAvS7
         CFiMO5jGoJiDeeygW3a+1mSr+0WxHbodbsa3ZApQmQ98xeA03lDFedyBi25UQsNFp1Xh
         ViNEOvqbgQlvmTN8h3Dy7xV2tZlVuDTRE4dT20Lx1tNZEeNsEqTpnpr3aD2C6WQviKkp
         rvrahSJfCmLixQ28tqGM500sDH2yNGi27NlfgKEUothrc7llAhdhl4oC2zVhh3F3zzIj
         UUow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AqegAVUUDavgK7hfl9iCh0mu9TjHfNDN9kX05QgdHaQ=;
        b=kIpksAza/wanZaCpgp7/nkCV/6TPh6E74sgILZvvumprc+y2UmoyxxdRM+RlFqA2pF
         8PcrjEL2QPNe3A6It33/tP+ds8Fc0MiQ23jEkRhgYhdLjsALgNLVAFCByBTNqnf7mEKP
         +f0Ebu7Ue2KHxyjUoNu+4honUOly0okFmRix9km8GbJ6zUa/cWRILa/NY23d8O1ea4ws
         GKOfKifN0MiJTib0rQ9Fyoq57WIX5BZRq5MG9ZBP6VHfsfk7UCfxLo092DcwTqkJwigb
         RpSl6mb9+ZLH2HPMhVe2zQcZ/gX4GT+e+jnj5DhwXWb34GnZn7FfAlfWbeR2ezqcD64b
         G5Xw==
X-Gm-Message-State: AOAM533WbxZ3lh7UTXc517bku0b4lrXo3c0mgSl+PybGN2QK7E9aFVKC
        J5MwHxMLzobNm5PLRdwcVrPvOijnERi98YHA2Hs=
X-Google-Smtp-Source: ABdhPJwf6QuxwK93KoJzNxQ6mPhVUKpq7VTDCkWgAovorllG16KuPBZxGujy2vDx4LA3S54xvpPBzVNnZ+zq+d+JhNw=
X-Received: by 2002:ac2:4294:: with SMTP id m20mr9463978lfh.147.1595326270432;
 Tue, 21 Jul 2020 03:11:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200717121642.41022-1-jaap.aarts1@gmail.com> <6a5bcebd-379b-58d8-ac26-0bb2a27b9291@roeck-us.net>
 <CACtzdJ0AmukhtzAtL5Vj5p52nCd5hQ77gPWVpYb4YBo2n6QfdA@mail.gmail.com> <24b5dcf4-076c-427c-41b3-32a2220f755b@roeck-us.net>
In-Reply-To: <24b5dcf4-076c-427c-41b3-32a2220f755b@roeck-us.net>
From:   jaap aarts <jaap.aarts1@gmail.com>
Date:   Tue, 21 Jul 2020 12:10:59 +0200
Message-ID: <CACtzdJ06qqrhrQhSetjHnkE11+x5qgs62LCN53aTL0Sidg1GTA@mail.gmail.com>
Subject: Re: [PATCH V2] hwmon: add fan/pwm driver for corsair h100i platinum
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello Guenter,

Is there still interest in this driver? I got a way of not needing the
dynamic clusterfuck in `hwmon_init` and could send in v3
with that, the 0day issues fixed and remove the 100s timeout.

I send this message in private by accident, sorry about that.

Jaap Aarts

On Sat, 18 Jul 2020 at 17:10, Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 7/18/20 2:33 AM, jaap aarts wrote:
> > On Sat, 18 Jul 2020 at 01:15, Guenter Roeck <linux@roeck-us.net> wrote:
> >>
> >> On 7/17/20 5:16 AM, jaap aarts wrote:
> >>> Adds fan/pwm support for H100i platinum.
> >>> Custom temp/fan curves are not supported, however
> >>> the presets found in the proprietary drivers are available.
> >>>
> >>> Signed-off-by: Jaap Aarts <jaap.aarts1@gmail.com>
> >>
> >> Most of my comments have not been addressed.
> >
> > I replied to your comments, everything I mentioned as fixed/changed
> > has been addressed in this new patch. You didn't respond to that any
> > further even though you did reply to my other email. So I thought I
> > was supposed to just send in v2.
> >
>
> This is incorrect. I did say, for example, that I won't accept things
> like setting fan curves, and that the driver should provide sets of
> {temperature, pwm} attributes instead. There are several other comments
> which were not addressed, such as not using C++ comments and using
> "if (retval)" instead of "if (retval != 0)". There is still a
> 100-second timeout. I didn't check any further, but I think that
> is sufficient to say that several of my comments were not addressed.
>
> >> Change log is missing.
> >
> > I don't know what you mean, I have a from line, I have a one-line
> > description of the patch, the email subject just like some other
> > patches, I have a multi-line description, and a signed-off-by line.
> > According to the linux docs
> > (https://www.kernel.org/doc/html/latest/process/5.Posting.html?highlight=changelog#patch-formatting-and-changelogs)
> > This is what a changelog should be.
> > If you mean changelog from v1, I mailed about all the fixed/changed
> > things in this patch. I also send a follow-up email noting that after
> > some research I found out that this driver should NOT work with
> > all asetek gen6 based coolers, and that I changed the scope of
> > the driver to just a single line of corsair products.
> >
>
> I don't see anything along the line of
>
> v2:
> - made this change
> - made that change
>
> in this patch.
>
> >> 0-day feedback has not been adressed.
> >
> > True, I did not fix all of those, I wasn't sure how to take all of them
> > since it was a long list.
>
> I am not entirely sure how to respond to that. What would be the point
> of reviewing the code if a simple compile and sanity check reveals
> several errors, and you state yourself that you did not fix them all ?
>
> Guenter
>
> > The rest of the 0-day feedback will be fixed next round.
> >
> >>
> >> Guenter
> >
> >
> >>
> >>> ---
> >>>  drivers/hwmon/Kconfig               |   6 +
> >>>  drivers/hwmon/Makefile              |   1 +
> >>>  drivers/hwmon/corsair_hydro_i_pro.c | 791 ++++++++++++++++++++++++++++
> >>>  3 files changed, 798 insertions(+)
> >>>  create mode 100644 drivers/hwmon/corsair_hydro_i_pro.c
> >>>
> >>> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> >>> index 288ae9f63588..9831a40fb05f 100644
> >>> --- a/drivers/hwmon/Kconfig
> >>> +++ b/drivers/hwmon/Kconfig
> >>> @@ -378,6 +378,12 @@ config SENSORS_ARM_SCPI
> >>>         and power sensors available on ARM Ltd's SCP based platforms. The
> >>>         actual number and type of sensors exported depend on the platform.
> >>>
> >>> +config SENSORS_CORSAIR_HYDRO_I_PRO
> >>> +     tristate "Corsair hydro HXXXi pro driver"
> >>> +     help
> >>> +       If you say yes here you get support for the corsair hydro HXXXi pro
> >>> +       range of devices.
> >>> +
> >>>  config SENSORS_ASB100
> >>>       tristate "Asus ASB100 Bach"
> >>>       depends on X86 && I2C
> >>> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> >>> index 3e32c21f5efe..ec63294b3ef1 100644
> >>> --- a/drivers/hwmon/Makefile
> >>> +++ b/drivers/hwmon/Makefile
> >>> @@ -20,6 +20,7 @@ obj-$(CONFIG_SENSORS_W83793)        += w83793.o
> >>>  obj-$(CONFIG_SENSORS_W83795) += w83795.o
> >>>  obj-$(CONFIG_SENSORS_W83781D)        += w83781d.o
> >>>  obj-$(CONFIG_SENSORS_W83791D)        += w83791d.o
> >>> +obj-$(CONFIG_SENSORS_CORSAIR_HYDRO_I_PRO)    += corsair_hydro_i_pro.o
> >>>
> >>>  obj-$(CONFIG_SENSORS_AB8500) += abx500.o ab8500.o
> >>>  obj-$(CONFIG_SENSORS_ABITUGURU)      += abituguru.o
> >>> diff --git a/drivers/hwmon/corsair_hydro_i_pro.c b/drivers/hwmon/corsair_hydro_i_pro.c
> >>> new file mode 100644
> >>> index 000000000000..43bf52d8d365
> >>> --- /dev/null
> >>> +++ b/drivers/hwmon/corsair_hydro_i_pro.c
> >>> @@ -0,0 +1,791 @@
> >>> +// SPDX-License-Identifier: GPL-2.0-or-later
> >>> +/*
> >>> + * A hwmon driver for all corsair hyxro HXXXi pro all-in-one liquid coolers.
> >>> + * Copyright (c) Jaap Aarts 2020
> >>> + *
> >>> + * Protocol reverse engineered by audiohacked
> >>> + * https://github.com/audiohacked/OpendriverLink
> >>> + */
> >>> +
> >>> +/*
> >>> + * Supports following liquid coolers:
> >>> + * H100i platinum
> >>> + *
> >>> + * Other products should work with this driver but no testing has been done.
> >>> + *
> >>> + * Note: platinum is the codename name for pro within the driver, so H100i platinum = H100i pro.
> >>> + * But some products are actually calles platinum, these are not intended to be supported.
> >>> + *
> >>> + * Note: fan curve control has not been implemented
> >>> + */
> >>> +#include <linux/errno.h>
> >>> +#include <linux/hwmon.h>
> >>> +#include <linux/kernel.h>
> >>> +#include <linux/module.h>
> >>> +#include <linux/slab.h>
> >>> +#include <linux/usb.h>
> >>> +
> >>> +struct hydro_i_pro_device {
> >>> +     struct usb_device *udev;
> >>> +
> >>> +     unsigned char *bulk_out_buffer;
> >>> +     char *bulk_in_buffer;
> >>> +     size_t bulk_out_size;
> >>> +     size_t bulk_in_size;
> >>> +     char bulk_in_endpointAddr;
> >>> +     char bulk_out_endpointAddr;
> >>> +
> >>> +     struct usb_interface *interface; /* the interface for this device */
> >>> +     struct semaphore
> >>> +             limit_sem; /* limiting the number of writes in progress */
> >>> +};
> >>> +
> >>> +struct curve_point {
> >>> +     uint8_t temp;
> >>> +     uint8_t pwm;
> >>> +};
> >>> +
> >>> +struct hwmon_fan_data {
> >>> +     char fan_channel;
> >>> +     long fan_target;
> >>> +     unsigned char fan_pwm_target;
> >>> +     long mode;
> >>> +     struct curve_point curve[7];
> >>> +};
> >>> +
> >>> +struct hwmon_data {
> >>> +     struct hydro_i_pro_device *hdev;
> >>> +     int channel_count;
> >>> +     void **channel_data;
> >>> +};
> >>> +
> >>> +struct curve_point quiet_curve[] = {
> >>> +     {
> >>> +             .temp = 0x1F,
> >>> +             .pwm = 0x15,
> >>> +     },
> >>> +     {
> >>> +             .temp = 0x21,
> >>> +             .pwm = 0x1E,
> >>> +     },
> >>> +     {
> >>> +             .temp = 0x24,
> >>> +             .pwm = 0x25,
> >>> +     },
> >>> +     {
> >>> +             .temp = 0x27,
> >>> +             .pwm = 0x2D,
> >>> +     },
> >>> +     {
> >>> +             .temp = 0x29,
> >>> +             .pwm = 0x38,
> >>> +     },
> >>> +     {
> >>> +             .temp = 0x2C,
> >>> +             .pwm = 0x4A,
> >>> +     },
> >>> +     {
> >>> +             .temp = 0x2F,
> >>> +             .pwm = 0x64,
> >>> +     },
> >>> +};
> >>> +
> >>> +struct curve_point balanced_curve[] = {
> >>> +     {
> >>> +             .temp = 0x1C,
> >>> +             .pwm = 0x15,
> >>> +     },
> >>> +     {
> >>> +             .temp = 0x1E,
> >>> +             .pwm = 0x1B,
> >>> +     },
> >>> +     {
> >>> +             .temp = 0x20,
> >>> +             .pwm = 0x23,
> >>> +     },
> >>> +     {
> >>> +             .temp = 0x22,
> >>> +             .pwm = 0x28,
> >>> +     },
> >>> +     {
> >>> +             .temp = 0x24,
> >>> +             .pwm = 0x32,
> >>> +     },
> >>> +     {
> >>> +             .temp = 0x27,
> >>> +             .pwm = 0x48,
> >>> +     },
> >>> +     {
> >>> +             .temp = 0x29,
> >>> +             .pwm = 0x64,
> >>> +     },
> >>> +};
> >>> +
> >>> +struct curve_point extreme_curve[] = {
> >>> +     {
> >>> +             .temp = 0x19,
> >>> +             .pwm = 0x28,
> >>> +     },
> >>> +     {
> >>> +             .temp = 0x1B,
> >>> +             .pwm = 0x2E,
> >>> +     },
> >>> +     {
> >>> +             .temp = 0x1D,
> >>> +             .pwm = 0x37,
> >>> +     },
> >>> +     {
> >>> +             .temp = 0x1E,
> >>> +             .pwm = 0x41,
> >>> +     },
> >>> +     {
> >>> +             .temp = 0x1F,
> >>> +             .pwm = 0x4C,
> >>> +     },
> >>> +     {
> >>> +             .temp = 0x20,
> >>> +             .pwm = 0x56,
> >>> +     },
> >>> +     {
> >>> +             .temp = 0x21,
> >>> +             .pwm = 0x64,
> >>> +     },
> >>> +};
> >>> +
> >>> +#define default_curve quiet_curve
> >>> +
> >>> +enum opcodes {
> >>> +     PWM_FAN_CURVE_CMD = 0x40,
> >>> +     PWM_GET_CURRENT_CMD = 0x41,
> >>> +     PWM_FAN_TARGET_CMD = 0x42,
> >>> +     RPM_FAN_TARGET_CMD = 0x43,
> >>> +};
> >>> +
> >>> +#define SUCCES_LENGTH 3
> >>> +#define SUCCES_CODE (0x12, 0x34)
> >>> +static const char SUCCESS[SUCCES_LENGTH - 1] = { 0x12, 0x34 };
> >>> +
> >>> +static bool check_succes(enum opcodes command, char ret[SUCCES_LENGTH])
> >>> +{
> >>> +     char success[SUCCES_LENGTH] = { command, SUCCES_CODE };
> >>> +
> >>> +     return strncmp(ret, success, SUCCES_LENGTH) == 0;
> >>> +}
> >>> +
> >>> +int set_fan_pwm_curve(struct hydro_i_pro_device *hdev,
> >>> +                   struct hwmon_fan_data *fan_data,
> >>> +                   struct curve_point point[7])
> >>> +{
> >>> +     int retval;
> >>> +     int wrote;
> >>> +     int sndpipe = usb_sndbulkpipe(hdev->udev, hdev->bulk_out_endpointAddr);
> >>> +     int rcvpipe = usb_rcvbulkpipe(hdev->udev, hdev->bulk_in_endpointAddr);
> >>> +     unsigned char *send_buf = hdev->bulk_out_buffer;
> >>> +     unsigned char *recv_buf = hdev->bulk_in_buffer;
> >>> +
> >>> +     memcpy(fan_data->curve, point, sizeof(fan_data->curve));
> >>> +
> >>> +     send_buf[0] = PWM_FAN_CURVE_CMD;
> >>> +     send_buf[1] = fan_data->fan_channel;
> >>> +     send_buf[2] = point[0].temp;
> >>> +     send_buf[3] = point[1].temp;
> >>> +     send_buf[4] = point[2].temp;
> >>> +     send_buf[5] = point[3].temp;
> >>> +     send_buf[6] = point[4].temp;
> >>> +     send_buf[7] = point[5].temp;
> >>> +     send_buf[8] = point[6].temp;
> >>> +     send_buf[9] = point[0].pwm;
> >>> +     send_buf[10] = point[1].pwm;
> >>> +     send_buf[11] = point[2].pwm;
> >>> +     send_buf[12] = point[3].pwm;
> >>> +     send_buf[13] = point[4].pwm;
> >>> +     send_buf[14] = point[5].pwm;
> >>> +     send_buf[15] = point[6].pwm;
> >>> +
> >>> +     retval = usb_bulk_msg(hdev->udev, sndpipe, send_buf, 16, &wrote, 100);
> >>> +     if (retval != 0)
> >>> +             return retval;
> >>> +
> >>> +     retval = usb_bulk_msg(hdev->udev, rcvpipe, recv_buf, 4, &wrote, 100);
> >>> +     if (retval != 0)
> >>> +             return retval;
> >>> +
> >>> +     if (!check_succes(send_buf[0], recv_buf)) {
> >>> +             dev_info(&hdev->udev->dev,
> >>> +                      "[*] failed setting fan curve %d,%d,%d/%d\n",
> >>> +                      recv_buf[0], recv_buf[1], recv_buf[2], recv_buf[3]);
> >>> +             return -EINVAL;
> >>> +     }
> >>> +     return 0;
> >>> +}
> >>> +
> >>> +int set_fan_target_rpm(struct hydro_i_pro_device *hdev,
> >>> +                    struct hwmon_fan_data *fan_data, long val)
> >>> +{
> >>> +     int retval;
> >>> +     int wrote;
> >>> +     int sndpipe = usb_sndbulkpipe(hdev->udev, hdev->bulk_out_endpointAddr);
> >>> +     int rcvpipe = usb_rcvbulkpipe(hdev->udev, hdev->bulk_in_endpointAddr);
> >>> +
> >>> +     unsigned char *send_buf = hdev->bulk_out_buffer;
> >>> +     unsigned char *recv_buf = hdev->bulk_in_buffer;
> >>> +
> >>> +     fan_data->fan_target = val;
> >>> +     fan_data->fan_pwm_target = 0;
> >>> +
> >>> +     send_buf[0] = RPM_FAN_TARGET_CMD;
> >>> +     send_buf[1] = fan_data->fan_channel;
> >>> +     send_buf[2] = (fan_data->fan_target >> 8);
> >>> +     send_buf[3] = fan_data->fan_target;
> >>> +
> >>> +     retval = usb_bulk_msg(hdev->udev, sndpipe, send_buf, 4, &wrote, 100);
> >>> +     if (retval != 0)
> >>> +             return retval;
> >>> +
> >>> +     retval = usb_bulk_msg(hdev->udev, rcvpipe, recv_buf, 6, &wrote, 100);
> >>> +     if (retval != 0)
> >>> +             return retval;
> >>> +
> >>> +     if (!check_succes(send_buf[0], recv_buf)) {
> >>> +             dev_info(&hdev->udev->dev,
> >>> +                      "[*] failed setting fan rpm %d,%d,%d/%d\n",
> >>> +                      recv_buf[0], recv_buf[1], recv_buf[2], recv_buf[3]);
> >>> +             return -EINVAL;
> >>> +     }
> >>> +     return 0;
> >>> +}
> >>> +
> >>> +int get_fan_current_rpm(struct hydro_i_pro_device *hdev,
> >>> +                     struct hwmon_fan_data *fan_data, long *val)
> >>> +{
> >>> +     int retval;
> >>> +     int wrote;
> >>> +     int sndpipe = usb_sndbulkpipe(hdev->udev, hdev->bulk_out_endpointAddr);
> >>> +     int rcvpipe = usb_rcvbulkpipe(hdev->udev, hdev->bulk_in_endpointAddr);
> >>> +
> >>> +     unsigned char *send_buf = hdev->bulk_out_buffer;
> >>> +     unsigned char *recv_buf = hdev->bulk_in_buffer;
> >>> +
> >>> +     send_buf[0] = PWM_GET_CURRENT_CMD;
> >>> +     send_buf[1] = fan_data->fan_channel;
> >>> +
> >>> +     retval = usb_bulk_msg(hdev->udev, sndpipe, send_buf, 2, &wrote, 100);
> >>> +     if (retval != 0)
> >>> +             return retval;
> >>> +
> >>> +     retval = usb_bulk_msg(hdev->udev, rcvpipe, recv_buf, 6, &wrote, 100);
> >>> +     if (retval != 0)
> >>> +             return retval;
> >>> +
> >>> +     if (!check_succes(send_buf[0], recv_buf) ||
> >>> +         recv_buf[3] != fan_data->fan_channel) {
> >>> +             dev_info(&hdev->udev->dev,
> >>> +                      "[*] failed retrieving fan rmp %d,%d,%d/%d\n",
> >>> +                      recv_buf[0], recv_buf[1], recv_buf[2], recv_buf[3]);
> >>> +             return -EINVAL;
> >>> +     }
> >>> +
> >>> +     *val = ((recv_buf[4]) << 8) + recv_buf[5];
> >>> +     return 0;
> >>> +}
> >>> +
> >>> +int set_fan_target_pwm(struct hydro_i_pro_device *hdev,
> >>> +                    struct hwmon_fan_data *fan_data, long val)
> >>> +{
> >>> +     int retval;
> >>> +     int wrote;
> >>> +     int sndpipe = usb_sndbulkpipe(hdev->udev, hdev->bulk_out_endpointAddr);
> >>> +     int rcvpipe = usb_rcvbulkpipe(hdev->udev, hdev->bulk_in_endpointAddr);
> >>> +
> >>> +     unsigned char *send_buf = hdev->bulk_out_buffer;
> >>> +     unsigned char *recv_buf = hdev->bulk_in_buffer;
> >>> +
> >>> +     fan_data->fan_pwm_target = val;
> >>> +     fan_data->fan_target = 0;
> >>> +
> >>> +     send_buf[0] = PWM_FAN_TARGET_CMD;
> >>> +     send_buf[1] = fan_data->fan_channel;
> >>> +     send_buf[3] = fan_data->fan_pwm_target;
> >>> +
> >>> +     retval = usb_bulk_msg(hdev->udev, sndpipe, send_buf, 4, &wrote, 100);
> >>> +     if (retval != 0)
> >>> +             return retval;
> >>> +
> >>> +     retval = usb_bulk_msg(hdev->udev, rcvpipe, recv_buf, 6, &wrote, 100000);
> >>> +     if (retval != 0)
> >>> +             return retval;
> >>> +
> >>> +     if (!check_succes(send_buf[0], recv_buf)) {
> >>> +             dev_info(&hdev->udev->dev,
> >>> +                      "[*] failed setting fan pwm %d,%d,%d/%d\n",
> >>> +                      recv_buf[0], recv_buf[1], recv_buf[2], recv_buf[3]);
> >>> +             return -EINVAL;
> >>> +     }
> >>> +     return 0;
> >>> +}
> >>> +
> >>> +umode_t hwmon_is_visible(const void *d, enum hwmon_sensor_types type, u32 attr,
> >>> +                      int channel)
> >>> +{
> >>> +     switch (type) {
> >>> +     case hwmon_fan:
> >>> +             switch (attr) {
> >>> +             case hwmon_fan_input:
> >>> +                     return 0444;
> >>> +                     break;
> >>> +             case hwmon_fan_target:
> >>> +                     return 0644;
> >>> +                     break;
> >>> +             case hwmon_fan_min:
> >>> +                     return 0444;
> >>> +                     break;
> >>> +             default:
> >>> +                     break;
> >>> +             }
> >>> +             break;
> >>> +     case hwmon_pwm:
> >>> +             switch (attr) {
> >>> +             case hwmon_pwm_input:
> >>> +                     return 0200;
> >>> +                     break;
> >>> +             case hwmon_pwm_enable:
> >>> +                     return 0644;
> >>> +                     break;
> >>> +             default:
> >>> +                     break;
> >>> +             }
> >>> +             break;
> >>> +     default:
> >>> +             break;
> >>> +     }
> >>> +     return 0;
> >>> +}
> >>> +
> >>> +static int hwmon_write(struct device *dev, enum hwmon_sensor_types type,
> >>> +                    u32 attr, int channel, long val)
> >>> +{
> >>> +     struct hwmon_data *data = dev_get_drvdata(dev);
> >>> +     struct hydro_i_pro_device *hdev = data->hdev;
> >>> +     struct hwmon_fan_data *fan_data;
> >>> +     int retval = 0;
> >>> +
> >>> +     switch (type) {
> >>> +     case hwmon_fan:
> >>> +             switch (attr) {
> >>> +             case hwmon_fan_target:
> >>> +                     fan_data = data->channel_data[channel];
> >>> +                     if (fan_data->mode != 1)
> >>> +                             return -EINVAL;
> >>> +
> >>> +                     retval = usb_autopm_get_interface(hdev->interface);
> >>> +                     if (retval)
> >>> +                             goto exit;
> >>> +
> >>> +                     if (down_trylock(&hdev->limit_sem)) {
> >>> +                             retval = -EAGAIN;
> >>> +                             goto cleanup_interface;
> >>> +                     }
> >>> +
> >>> +                     retval = set_fan_target_rpm(hdev, fan_data, val);
> >>> +                     if (retval)
> >>> +                             goto cleanup;
> >>> +
> >>> +                     break;
> >>> +             default:
> >>> +                     return -EINVAL;
> >>> +             }
> >>> +             goto exit;
> >>> +     case hwmon_pwm:
> >>> +             switch (attr) {
> >>> +             case hwmon_pwm_input:
> >>> +                     fan_data = data->channel_data[channel];
> >>> +                     if (fan_data->mode != 1)
> >>> +                             return -EINVAL;
> >>> +
> >>> +                     retval = usb_autopm_get_interface(hdev->interface);
> >>> +                     if (retval)
> >>> +                             goto exit;
> >>> +
> >>> +                     if (down_trylock(&hdev->limit_sem)) {
> >>> +                             retval = -EAGAIN;
> >>> +                             goto cleanup_interface;
> >>> +                     }
> >>> +
> >>> +                     retval = set_fan_target_pwm(hdev, fan_data, val);
> >>> +                     if (retval)
> >>> +                             goto cleanup;
> >>> +
> >>> +                     break;
> >>> +             case hwmon_pwm_enable:
> >>> +                     fan_data = data->channel_data[channel];
> >>> +
> >>> +                     retval = usb_autopm_get_interface(hdev->interface);
> >>> +                     if (retval)
> >>> +                             goto exit;
> >>> +
> >>> +                     if (down_trylock(&hdev->limit_sem)) {
> >>> +                             retval = -EAGAIN;
> >>> +                             goto cleanup_interface;
> >>> +                     }
> >>> +                     fan_data->mode = val;
> >>> +
> >>> +                     switch (val) {
> >>> +                     case 0:
> >>> +                             set_fan_pwm_curve(hdev, fan_data,
> >>> +                                               default_curve);
> >>> +                             break;
> >>> +                     case 1:
> >>> +                             if (fan_data->fan_target != 0) {
> >>> +                                     retval = set_fan_target_rpm(
> >>> +                                             hdev, fan_data,
> >>> +                                             fan_data->fan_target);
> >>> +                                     if (retval)
> >>> +                                             goto cleanup;
> >>> +                             } else if (fan_data->fan_pwm_target != 0) {
> >>> +                                     retval = set_fan_target_pwm(
> >>> +                                             hdev, fan_data,
> >>> +                                             fan_data->fan_pwm_target);
> >>> +                                     if (retval)
> >>> +                                             goto cleanup;
> >>> +                             }
> >>> +                             break;
> >>> +                     case 2:
> >>> +                             set_fan_pwm_curve(hdev, fan_data, quiet_curve);
> >>> +                             break;
> >>> +                     case 3:
> >>> +                             set_fan_pwm_curve(hdev, fan_data,
> >>> +                                               balanced_curve);
> >>> +                             break;
> >>> +                     case 4:
> >>> +                             set_fan_pwm_curve(hdev, fan_data,
> >>> +                                               extreme_curve);
> >>> +                             break;
> >>> +                     }
> >>> +                     break;
> >>> +             default:
> >>> +                     return -EINVAL;
> >>> +             }
> >>> +             goto exit;
> >>> +     default:
> >>> +             return -EINVAL;
> >>> +     }
> >>> +
> >>> +cleanup:
> >>> +     up(&hdev->limit_sem);
> >>> +cleanup_interface:
> >>> +     usb_autopm_put_interface(hdev->interface);
> >>> +exit:
> >>> +     return retval;
> >>> +}
> >>> +
> >>> +int hwmon_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
> >>> +            int channel, long *val)
> >>> +{
> >>> +     struct hwmon_data *data = dev_get_drvdata(dev);
> >>> +     struct hydro_i_pro_device *hdev = data->hdev;
> >>> +     struct hwmon_fan_data *fan_data;
> >>> +     int retval = 0;
> >>> +
> >>> +     if (channel >= data->channel_count)
> >>> +             return -EAGAIN;
> >>> +
> >>> +     switch (type) {
> >>> +     case hwmon_fan:
> >>> +             switch (attr) {
> >>> +             case hwmon_fan_input:
> >>> +                     fan_data = data->channel_data[channel];
> >>> +
> >>> +                     retval = usb_autopm_get_interface(hdev->interface);
> >>> +                     if (retval)
> >>> +                             goto exit;
> >>> +
> >>> +                     if (down_trylock(&hdev->limit_sem)) {
> >>> +                             retval = -EAGAIN;
> >>> +                             goto cleanup_interface;
> >>> +                     }
> >>> +
> >>> +                     retval = get_fan_current_rpm(hdev, fan_data, val);
> >>> +                     if (retval)
> >>> +                             goto cleanup;
> >>> +
> >>> +                     goto cleanup;
> >>> +             case hwmon_fan_target:
> >>> +                     fan_data = data->channel_data[channel];
> >>> +                     if (fan_data->mode != 1) {
> >>> +                             *val = 0;
> >>> +                             goto exit;
> >>> +                     }
> >>> +                     *val = fan_data->fan_target;
> >>> +                     goto exit;
> >>> +             case hwmon_fan_min:
> >>> +                     *val = 200;
> >>> +                     goto exit;
> >>> +
> >>> +             default:
> >>> +                     return -EINVAL;
> >>> +             }
> >>> +             goto exit;
> >>> +
> >>> +     case hwmon_pwm:
> >>> +             switch (attr) {
> >>> +             case hwmon_pwm_enable:
> >>> +                     fan_data = data->channel_data[channel];
> >>> +                     *val = fan_data->mode;
> >>> +                     goto exit;
> >>> +             default:
> >>> +                     return -EINVAL;
> >>> +             }
> >>> +             goto exit;
> >>> +
> >>> +     default:
> >>> +             return -EINVAL;
> >>> +     }
> >>> +
> >>> +cleanup:
> >>> +     up(&hdev->limit_sem);
> >>> +cleanup_interface:
> >>> +     usb_autopm_put_interface(hdev->interface);
> >>> +exit:
> >>> +     return retval;
> >>> +}
> >>> +
> >>> +#define fan_config (HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_MIN)
> >>> +#define pwm_config (HWMON_PWM_INPUT | HWMON_PWM_ENABLE)
> >>> +
> >>> +static const struct hwmon_ops i_pro_ops = {
> >>> +     .is_visible = hwmon_is_visible,
> >>> +     .read = hwmon_read,
> >>> +     .write = hwmon_write,
> >>> +};
> >>> +
> >>> +bool does_fan_exist(struct hydro_i_pro_device *hdev, int channel)
> >>> +{
> >>> +     int retval;
> >>> +     int wrote;
> >>> +     int sndpipe = usb_sndbulkpipe(hdev->udev, hdev->bulk_out_endpointAddr);
> >>> +     int rcvpipe = usb_rcvbulkpipe(hdev->udev, hdev->bulk_in_endpointAddr);
> >>> +
> >>> +     unsigned char *send_buf = hdev->bulk_out_buffer;
> >>> +     unsigned char *recv_buf = hdev->bulk_in_buffer;
> >>> +
> >>> +     send_buf[0] = RPM_FAN_TARGET_CMD;
> >>> +     send_buf[1] = channel;
> >>> +     send_buf[2] = (600 >> 8);
> >>> +     send_buf[3] = (unsigned char)600;
> >>> +
> >>> +     retval = usb_bulk_msg(hdev->udev, sndpipe, send_buf, 4, &wrote, 100);
> >>> +     if (retval != 0)
> >>> +             return false;
> >>> +
> >>> +     retval = usb_bulk_msg(hdev->udev, rcvpipe, recv_buf, 6, &wrote, 100000);
> >>> +     if (retval != 0)
> >>> +             return false;
> >>> +
> >>> +     if (!check_succes(send_buf[0], recv_buf))
> >>> +             return false;
> >>> +     return true;
> >>> +}
> >>> +
> >>> +int get_fan_count(struct hydro_i_pro_device *hdev)
> >>> +{
> >>> +     int fan;
> >>> +
> >>> +     for (fan = 0; does_fan_exist(hdev, fan); fan += 1)
> >>> +             ;
> >>> +     return fan;
> >>> +}
> >>> +
> >>> +void hwmon_init(struct hydro_i_pro_device *hdev)
> >>> +{
> >>> +     int fan_id;
> >>> +     struct device *hwmon_dev;
> >>> +     struct hwmon_fan_data *fan;
> >>> +     struct hwmon_data *data = devm_kzalloc(
> >>> +             &hdev->udev->dev, sizeof(struct hwmon_data), GFP_KERNEL);
> >>> +     struct hwmon_chip_info *hwmon_info = devm_kzalloc(
> >>> +             &hdev->udev->dev, sizeof(struct hwmon_chip_info), GFP_KERNEL);
> >>> +     //Allocate the info table
> >>> +     struct hwmon_channel_info **aio_info =
> >>> +             devm_kzalloc(&hdev->udev->dev,
> >>> +                          sizeof(struct hwmon_channel_info *) * 2,
> >>> +                          GFP_KERNEL); //2 for each channel info.
> >>> +
> >>> +     //Allocate the fan and PWM configuration
> >>> +     u32 *fans_config = devm_kzalloc(&hdev->udev->dev,
> >>> +                                     sizeof(u32) * (data->channel_count + 1),
> >>> +                                     GFP_KERNEL);
> >>> +     u32 *pwms_config = devm_kzalloc(&hdev->udev->dev,
> >>> +                                     sizeof(u32) * (data->channel_count + 1),
> >>> +                                     GFP_KERNEL);
> >>> +
> >>> +     data->channel_count = get_fan_count(hdev); //amount of fans
> >>> +     data->channel_data =
> >>> +             devm_kzalloc(&hdev->udev->dev,
> >>> +                          sizeof(char *) * data->channel_count, GFP_KERNEL);
> >>> +
> >>> +     //For each fan create a data channel a fan config entry and a pwm config entry
> >>> +     for (fan_id = 0; fan_id <= data->channel_count; fan_id++) {
> >>> +             fan = devm_kzalloc(&hdev->udev->dev,
> >>> +                                sizeof(struct hwmon_fan_data), GFP_KERNEL);
> >>> +             fan->fan_channel = fan_id;
> >>> +             fan->mode = 2;
> >>> +             data->channel_data[fan_id] = fan;
> >>> +             fans_config[fan_id] = fan_config;
> >>> +             pwms_config[fan_id] = pwm_config;
> >>> +     }
> >>> +     fans_config[data->channel_count] = 0;
> >>> +     pwms_config[data->channel_count] = 0;
> >>> +
> >>> +     aio_info[0] =
> >>> +             devm_kzalloc(&hdev->udev->dev,
> >>> +                          sizeof(struct hwmon_channel_info), GFP_KERNEL);
> >>> +     aio_info[0]->type = hwmon_fan;
> >>> +     aio_info[0]->config = fans_config;
> >>> +
> >>> +     aio_info[1] =
> >>> +             devm_kzalloc(&hdev->udev->dev,
> >>> +                          sizeof(struct hwmon_channel_info), GFP_KERNEL);
> >>> +     aio_info[1]->type = hwmon_pwm;
> >>> +     aio_info[1]->config = pwms_config;
> >>> +
> >>> +     hwmon_info->ops = &i_pro_ops;
> >>> +     hwmon_info->info = (const struct hwmon_channel_info **)aio_info;
> >>> +
> >>> +     data->hdev = hdev;
> >>> +     hwmon_dev = devm_hwmon_device_register_with_info(
> >>> +             &hdev->udev->dev, "driver_fan", data, hwmon_info, NULL);
> >>> +     dev_info(&hdev->udev->dev, "[*] Setup hwmon\n");
> >>> +}
> >>> +
> >>> +/*
> >>> + * Devices that work with this driver.
> >>> + * More devices should work, however none have been tested.
> >>> + */
> >>> +static const struct usb_device_id astk_table[] = {
> >>> +     { USB_DEVICE(0x1b1c, 0x0c15) },
> >>> +     {},
> >>> +};
> >>> +
> >>> +MODULE_DEVICE_TABLE(usb, astk_table);
> >>> +
> >>> +int init_device(struct usb_device *udev)
> >>> +{
> >>> +     int retval;
> >>> +
> >>> +     //This is needed because when running windows in a vm with proprietary driver
> >>> +     //and you switch to this driver, the device will not respond unless you run this.
> >>> +     retval = usb_control_msg(udev, usb_sndctrlpipe(udev, 0), 0x00, 0x40,
> >>> +                              0xffff, 0x0000, 0, 0, 0);
> >>> +     //this always returns error
> >>> +     if (retval != 0)
> >>> +             ;
> >>> +
> >>> +     retval = usb_control_msg(udev, usb_sndctrlpipe(udev, 0), 0x02, 0x40,
> >>> +                              0x0002, 0x0000, 0, 0, 0);
> >>> +     return retval;
> >>> +}
> >>> +
> >>> +int deinit_device(struct usb_device *udev)
> >>> +{
> >>> +     return usb_control_msg(udev, usb_sndctrlpipe(udev, 0), 0x02, 0x40,
> >>> +                            0x0004, 0x0000, 0, 0, 0);
> >>> +}
> >>> +
> >>> +static void astk_delete(struct hydro_i_pro_device *hdev)
> >>> +{
> >>> +     usb_put_intf(hdev->interface);
> >>> +     usb_put_dev(hdev->udev);
> >>> +     kfree(hdev->bulk_in_buffer);
> >>> +     kfree(hdev->bulk_out_buffer);
> >>> +     kfree(hdev);
> >>> +}
> >>> +
> >>> +static int astk_probe(struct usb_interface *interface,
> >>> +                   const struct usb_device_id *id)
> >>> +{
> >>> +     struct hydro_i_pro_device *hdev;
> >>> +     int retval;
> >>> +     struct usb_endpoint_descriptor *bulk_in, *bulk_out;
> >>> +
> >>> +     hdev = kzalloc(sizeof(*hdev), GFP_KERNEL);
> >>> +     if (!hdev) {
> >>> +             retval = -ENOMEM;
> >>> +             goto exit;
> >>> +     }
> >>> +
> >>> +     retval = usb_find_common_endpoints(interface->cur_altsetting, &bulk_in,
> >>> +                                        &bulk_out, NULL, NULL);
> >>> +     if (retval != 0)
> >>> +             goto exit;
> >>> +
> >>> +     hdev->udev = usb_get_dev(interface_to_usbdev(interface));
> >>> +     hdev->interface = usb_get_intf(interface);
> >>> +
> >>> +     /* set up the endpoint information */
> >>> +     /* use only the first bulk-in and bulk-out endpoints */
> >>> +     hdev->bulk_in_size = usb_endpoint_maxp(bulk_in);
> >>> +     hdev->bulk_in_buffer = kmalloc(hdev->bulk_in_size, GFP_KERNEL);
> >>> +     hdev->bulk_in_endpointAddr = bulk_in->bEndpointAddress;
> >>> +     hdev->bulk_out_size = usb_endpoint_maxp(bulk_out);
> >>> +     hdev->bulk_out_buffer = kmalloc(hdev->bulk_out_size, GFP_KERNEL);
> >>> +     hdev->bulk_out_endpointAddr = bulk_out->bEndpointAddress;
> >>> +
> >>> +     retval = init_device(hdev->udev);
> >>> +     if (retval) {
> >>> +             dev_err(&interface->dev, "failed initialising this device.\n");
> >>> +             goto exit;
> >>> +     }
> >>> +
> >>> +     hwmon_init(hdev);
> >>> +
> >>> +     usb_set_intfdata(interface, hdev);
> >>> +     sema_init(&hdev->limit_sem, 8);
> >>> +exit:
> >>> +     return retval;
> >>> +}
> >>> +
> >>> +static void astk_disconnect(struct usb_interface *interface)
> >>> +{
> >>> +     struct hydro_i_pro_device *hdev = usb_get_intfdata(interface);
> >>> +
> >>> +     dev_info(&hdev->udev->dev, "[*] DEINIT DEVICE\n");
> >>> +     usb_set_intfdata(interface, NULL);
> >>> +     astk_delete(hdev);
> >>> +     deinit_device(hdev->udev);
> >>> +}
> >>> +static int astk_resume(struct usb_interface *intf)
> >>> +{
> >>> +     return 0;
> >>> +}
> >>> +
> >>> +static int astk_suspend(struct usb_interface *intf, pm_message_t message)
> >>> +{
> >>> +     return 0;
> >>> +}
> >>> +
> >>> +static struct usb_driver hydro_i_pro_driver = {
> >>> +     .name = "hydro_i_pro_device",
> >>> +     .id_table = astk_table,
> >>> +     .probe = astk_probe,
> >>> +     .disconnect = astk_disconnect,
> >>> +     .resume = astk_resume,
> >>> +     .suspend = astk_suspend,
> >>> +     .supports_autosuspend = 1,
> >>> +};
> >>> +
> >>> +static int __init hydro_i_pro_init(void)
> >>> +{
> >>> +     return usb_register(&hydro_i_pro_driver);
> >>> +}
> >>> +
> >>> +static void __exit hydro_i_pro_exit(void)
> >>> +{
> >>> +     usb_deregister(&hydro_i_pro_driver);
> >>> +}
> >>> +
> >>> +module_init(hydro_i_pro_init);
> >>> +module_exit(hydro_i_pro_exit);
> >>> +
> >>> +MODULE_LICENSE("GPL");
> >>> +MODULE_AUTHOR("Jaap Aarts <jaap.aarts1@gmail.com>");
> >>> +MODULE_DESCRIPTION("Corsair HXXXi pro device driver");
> >>>
> >>
>
