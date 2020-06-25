Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4A3320A751
	for <lists+linux-usb@lfdr.de>; Thu, 25 Jun 2020 23:18:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405790AbgFYVSI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 25 Jun 2020 17:18:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405693AbgFYVSH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 25 Jun 2020 17:18:07 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 767DCC08C5DB
        for <linux-usb@vger.kernel.org>; Thu, 25 Jun 2020 14:18:07 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id s1so8148848ljo.0
        for <linux-usb@vger.kernel.org>; Thu, 25 Jun 2020 14:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=SWIaY12Y0G2dy4SWvhoH0txkwE664AQyplOHmcrCZV8=;
        b=fbe0YAfdtHX4mE/5jYK+b08zs+3EV0uom5viW7YIAmLz+nBMpOQmDjRSOyXr8Yq7yN
         PwAutxSNdIeuWip+kNrf3gcnBZH8jKFNmBwAjc+LNvXoR6BzQQvm7fzO0cpyVFFej+U+
         XAmFafYM1/fWIYT+jg3hsjYgmUj6CrBiGce7w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=SWIaY12Y0G2dy4SWvhoH0txkwE664AQyplOHmcrCZV8=;
        b=LjnsWqgjS8XWp8mS+gUPmD/Fjqb0Gklm+qoNYfw4EDbZu3AyGZXm6kcQ2YZyEg96tH
         T7NtXusPVC6iVk0U7pHuvXtPJyn2xfH3DlP6iR9mYNa8Gi1nd4VMFPgV62tOz8zw8DlH
         EEUvIzVhL50Wi6zqg5Fl7ttZesvgL2uTeNnK3YlLwNp27SeHEpf0yGHfKUkZCIX7KOEw
         uYEgHyDxc72SDFnaVQB0CBmndtNhLN48xoJin0f2ZG4ufRTPRfYYkuLQoFnz9bh2huHw
         vfuciIas+SjOtxmAAN0wGfU14wAl5JwERKkSGMO31mRlEOX7W0JvVIr5PFbT+eRjZj6X
         2n+A==
X-Gm-Message-State: AOAM531AaB2SsGBnjsLZUIz4wAiX9K2zt8JK7omrgJX0gfbAl0ojfNWJ
        3qRv7Fbb3j5ddx5KGR+ZMlieNkIp077FJe/XVHBYHg==
X-Google-Smtp-Source: ABdhPJwAZAO0URb5429RQ8KWWyn03Dh+VW7wXxDaU0pyTnnX/WMtSBWQoRxtR41F5V5Wn0lUPYIIIBTzfxfYflSU0Sw=
X-Received: by 2002:a2e:3314:: with SMTP id d20mr17597674ljc.359.1593119885826;
 Thu, 25 Jun 2020 14:18:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200623194533.GA3815@amd> <8C887FD6-DDC0-4FD6-8994-00939EFCB0F9@holtmann.org>
In-Reply-To: <8C887FD6-DDC0-4FD6-8994-00939EFCB0F9@holtmann.org>
From:   Miao-chen Chou <mcchou@chromium.org>
Date:   Thu, 25 Jun 2020 14:17:54 -0700
Message-ID: <CABmPvSFbXNcBdgtmygaOdOrJ-4W_PU8ATiEL7StiEqtwXtfZzA@mail.gmail.com>
Subject: Re: next-20200623: oops in btusb_disconnect() at boot on thinkpad x60
To:     Marcel Holtmann <marcel@holtmann.org>
Cc:     Pavel Machek <pavel@ucw.cz>,
        kernel list <linux-kernel@vger.kernel.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        BlueZ <linux-bluetooth@vger.kernel.org>,
        gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Marcel and all,

Thanks for the note here. 8208f5a9d435e58ee7f53a24d9ccbe7787944537 is
the cause of this, I will upload a fix shortly to address the
distinguishment between tearing down hdev and user space request.

Regards,
Miao


On Tue, Jun 23, 2020 at 11:44 PM Marcel Holtmann <marcel@holtmann.org> wrot=
e:
>
> Hi Pavel,
>
> > I'm getting this at boot:
> >
> > [    7.984584] *pdpt =3D 0000000033a31001 *pde =3D 0000000000000000
> > [    7.984584] Oops: 0000 [#1] PREEMPT SMP PTI
> > [    7.984584] CPU: 1 PID: 2532 Comm: systemd-udevd Not tainted
> > 5.8.0-rc2-next-20200623+ #126
> > [    7.998580] Hardware name: LENOVO 17097HU/17097HU, BIOS 7BETD8WW
> > (2.19 ) 03/31/2011
> > [    8.000592] EIP: __queue_work+0x139/0x320
> > [    8.000592] Code: 90 83 7d f0 08 0f 84 b6 00 00 00 8b 45 ec 8b 9f
> > 04 01 00 00 03 1c 85 40 63 1f c5 89 f0 e8 df f8 ff ff 85 c0 0f 85 4f
> > ff ff ff <8b> 03 e9 50 ff ff ff 89 45 e4 e8 48 0a cb 00 8b 4d e8 8b 45
> > e4 8b
> > [    8.007883] EAX: 00000000 EBX: 00000000 ECX: 47d88848 EDX: 03ffffff
> > [    8.007883] ESI: f4a348bc EDI: f492a600 EBP: f3b1dd0c ESP: f3b1dcf0
> > [    8.019981] DS: 007b ES: 007b FS: 00d8 GS: 00e0 SS: 0068 EFLAGS:
> > 00010046
> > [    8.023156] CR0: 80050033 CR2: 00000000 CR3: 33b1e000 CR4: 000006b0
> > [    8.028892] Call Trace:
> > [    8.034199]  queue_work_on+0x1d/0x30
> > [    8.034199]  hci_adv_monitors_clear+0x5c/0x80
> > [    8.042158]  hci_unregister_dev+0x161/0x2f0
> > [    8.042158]  ? usb_disable_endpoint+0x94/0xa0
> > [    8.042158]  btusb_disconnect+0x4b/0x120
> > [    8.057018]  usb_unbind_interface+0x64/0x230
> > [    8.057018]  device_release_driver_internal+0xc1/0x180
> > [    8.065196]  device_release_driver+0xc/0x10
> > [    8.068040]  bus_remove_device+0xa8/0x110
> > [    8.071767]  device_del+0x126/0x370
> > [    8.071767]  ? usb_remove_ep_devs+0x15/0x20
> > [    8.079199]  ? remove_intf_ep_devs+0x30/0x50
> > [    8.081371]  usb_disable_device+0x8e/0x240
> > [    8.087478]  usb_set_configuration+0x47c/0x800
> > [    8.087478]  usb_deauthorize_device+0x36/0x50
> > [    8.092662]  authorized_store+0x5d/0x70
> > [    8.096608]  ? authorized_default_store+0x60/0x60
> > [    8.096608]  dev_attr_store+0x13/0x20
> > [    8.096608]  ? component_bind_all.cold+0x52/0x52
> > [    8.106151]  sysfs_kf_write+0x2f/0x50
> > [    8.106151]  ? sysfs_file_ops+0x50/0x50
> > [    8.106151]  kernfs_fop_write+0x105/0x1a0
> > [    8.106151]  ? kernfs_fop_open+0x3c0/0x3c0
> > [    8.106151]  __vfs_write+0x2b/0x1e0
> > [    8.106151]  ? lock_acquire+0x3f/0x70
> > [    8.106151]  ? vfs_write+0x12a/0x180
> > [    8.106151]  ? __sb_start_write+0xd6/0x180
> > [    8.106151]  ? vfs_write+0x12a/0x180
> > [    8.106151]  vfs_write+0xa1/0x180
> > [    8.106151]  ksys_write+0x5c/0xd0
> > [    8.106151]  __ia32_sys_write+0x10/0x20
> > [    8.106151]  do_syscall_32_irqs_on+0x3a/0xf0
> > [    8.106151]  do_int80_syscall_32+0x9/0x20
> > [    8.106151]  entry_INT80_32+0x116/0x116
> > [    8.106151] EIP: 0xb7f45092
> > [    8.106151] Code: Bad RIP value.
> > [    8.146079] EAX: ffffffda EBX: 00000007 ECX: 004fb760 EDX: 00000001
> > [    8.146079] ESI: 004fb760 EDI: 00000001 EBP: 004c79f0 ESP: bfabc48c
> > [    8.146079] DS: 007b ES: 007b FS: 0000 GS: 0033 SS: 007b EFLAGS:
> > 00000246
> > [    8.150364] Modules linked in:
> > [    8.150364] CR2: 0000000000000000
> > [    8.150364] ---[ end trace 468d097aaf220284 ]---
>
> I assume this is caused by commit e5e1e7fd470ccf2eb38ab7fb5a3ab0fc4792fe5=
3 and mainly because it triggers the background scan workqueue. I think we =
need to distinguish clearing the monitors when removing the controller comp=
ared to clearing the controllers from bluetoothd as a runtime operation.
>
> Regards
>
> Marcel
>
