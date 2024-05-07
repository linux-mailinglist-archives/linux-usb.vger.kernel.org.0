Return-Path: <linux-usb+bounces-10062-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B81518BE14F
	for <lists+linux-usb@lfdr.de>; Tue,  7 May 2024 13:45:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B527EB28385
	for <lists+linux-usb@lfdr.de>; Tue,  7 May 2024 11:44:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA689152534;
	Tue,  7 May 2024 11:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b5YnVZIK"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B2415252F
	for <linux-usb@vger.kernel.org>; Tue,  7 May 2024 11:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715082279; cv=none; b=sZdFZA03Vn1LhQRlnkQMEId+rF/BgQ6xU6DvjRIEckkE/7YQk2K8tMUq86tB/x860J2a2hWfIJiZHC2E+KqLJ2szw6H/kqi1FepZj+60THkD/ulaPmwxR9svThsz1PGXY3IGKV5ipKZAvLIk/NUwvkSVPi+Z9mZoYX3DHkG2BoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715082279; c=relaxed/simple;
	bh=CxhjvWHJUuKHc+UG+7LRAgjPBSMeb6kOu6pcrk4BnKQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RYgrBFD4ysWlbcbKAn2wNkPDI+lbEgxFG+8W83uKkl2T8jlVKfBbLxVhNovp0/m+j8U8JxjUibSpVZ15EEGSGl9SB0Jl/6hk+c5cXjUvsT5HHvy60esN4kPHd+46J59bnoow4RL4JJP3R9GH/uDiAhh43CbAXlKIxn964Fu6Jsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b5YnVZIK; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-62050e00cfdso20321937b3.3
        for <linux-usb@vger.kernel.org>; Tue, 07 May 2024 04:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715082277; x=1715687077; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XnAh9SAP3yzVgRg2uuSYhZI7cBVfWDGrjlaKcwxdTHk=;
        b=b5YnVZIKiZggXwqO0Oyp10DAfgsv/cZ4djvzyQopMMP5tpgcC+AKUWKJoDwVyVqd3K
         wZAGTP6bax6klIpYZUBPzyJKPns5JCDHuv4eFSllCD69tqziZQ7/LHkzg7sWiEHFCHJ2
         fYEaxvCsrefMOPzW1RHASEs9QWFbXnRtDxQsRqzw6Y9lEGxB3+bshRezBWbLtH6z5rs2
         gvQ55FwwWFGNIgSxRtJIaOEL1HLL9h35Nv3T+GHU1HNo1NMiHyymucrty/Qsh/vq0R/B
         Qj3fswVLuM7PTyakIjHvssfVOlTDYDo6f4jp6iclIcr2dNRcDkVph4jP8uU5OhuQ8ps9
         Fo2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715082277; x=1715687077;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XnAh9SAP3yzVgRg2uuSYhZI7cBVfWDGrjlaKcwxdTHk=;
        b=c9WNmLR021tTj8mQgmaT+owV/Oe6OaXRLpfxVD23yQpLYuyYjARvQeW9GtJcghKx0C
         SOi+gfQ5iNcnS8GQg0Uhn15b2uqx6ZfEnUlLJSRe/zslan6BxhLuaPrn2zgcLnFmbeFT
         tl0yNJqdcn3UAnEVUlgODP84XG+zOQazIXSRt1ZhZ5Ltzy0eMMdp9iKnawbkxxnOeBG2
         OFsAys9Zjt1zn3b6af9kP+Ko61p8P+uHxnkEdGR8ISgEek+P2fCJYW6pVq60JDImJBJS
         kxVWfita5yG07bRdPaD5rUU/Wrwlq+dE12nXIaCm2w2/y2htK5+4HDmno/PQ/RlDmHPc
         qa4Q==
X-Gm-Message-State: AOJu0YzRBQRROv3x1HI0Oe3gMHfXhQq0l68Wkk/57FNcPHgzUZo3Cm5l
	QbmZId8hLUi+Ys3KGEBZHmgk4DduYQfs25f3LWqsTf4WezF+3mqqHLlX4IacRTH04zrzo24bnuA
	LCWvi1OB1aFcABba3S1VV4PimzSU=
X-Google-Smtp-Source: AGHT+IHGYaYCTaiIOoGCd5KotF1ipoWL5vDkB/9PbWyMYxlTbF+uKggMLQzSAN7zEqdTmXuLzxAUeTLV6FsDsgKaXmA=
X-Received: by 2002:a81:920e:0:b0:615:9a1:602b with SMTP id
 j14-20020a81920e000000b0061509a1602bmr12688013ywg.44.1715082276673; Tue, 07
 May 2024 04:44:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAHhAz+g=7pocghMX-Yu=jg0jxnpfwa3+ZmmdLP_pVuXmWLJ=aw@mail.gmail.com>
 <ea450e31-8f71-4726-91f6-ada79e0b3a9a@rowland.harvard.edu>
 <CAHhAz+gRvah++Hv4k5+Ec0epNbmet0=JZ6tJ3R8zjZmiKACaQA@mail.gmail.com> <c309b037-50db-4ca1-8f86-60131cb84564@rowland.harvard.edu>
In-Reply-To: <c309b037-50db-4ca1-8f86-60131cb84564@rowland.harvard.edu>
From: Muni Sekhar <munisekharrms@gmail.com>
Date: Tue, 7 May 2024 17:14:25 +0530
Message-ID: <CAHhAz+i9TLCb3hKpzWAL2DkH9Y25XszJO5kgbRGzsut1zCzrJw@mail.gmail.com>
Subject: Re: Seeking Assistance: Implementing USB Device Suspend/Resume in
 User Space Driver
To: Alan Stern <stern@rowland.harvard.edu>
Cc: linux-usb@vger.kernel.org, kernelnewbies <kernelnewbies@kernelnewbies.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 7, 2024 at 1:20=E2=80=AFAM Alan Stern <stern@rowland.harvard.ed=
u> wrote:
>
> On Mon, May 06, 2024 at 09:44:52PM +0530, Muni Sekhar wrote:
> > On Mon, May 6, 2024 at 7:59=E2=80=AFPM Alan Stern <stern@rowland.harvar=
d.edu> wrote:
> > >
> > > On Mon, May 06, 2024 at 04:44:30PM +0530, Muni Sekhar wrote:
> > > > While we have successfully converted most of the USB device driver
> > > > functionality from kernel space to user space using libusb, we are =
now
> > > > seeking guidance on how to implement USB device suspend/resume in u=
ser
> > > > space. Specifically, we would like to know if libusb provides suppo=
rt
> > > > for achieving the suspend/resume functionality mentioned above.
> > > > Additionally, any insights or suggestions on how to accomplish this
> > > > task would be greatly appreciated.
> > >
> > > Your question is about libusb, right?  So you'll get better answers i=
f
> > > you post it on the libusb mailing list rather than the linux-usb mail=
ing
> > > list.
> > Can USB device suspend\resume  be implemented in user space driver
> > using software other than libusb?
>
> Yes, a userspace driver can use the usbfs interface and can employ the
> ioctl commands listed in /usr/include/linux/usbdevfs.h.  It's possible
> that libusb also provides facilities for controlling suspend and resume;
> I don't know whether it does.
>
> > If so, what are those methods or techniques to achieve USB device
> > suspend\resume , can you please provide clarity on this.
>
> As far as I know, these usbfs ioctl commands are not documented
> anywhere.
>
> The USBDEVFS_FORBID_SUSPEND ioctl prevents the device from being
> suspended, and wakes it up if it is currently suspended.
>
> The USBDEVFS_ALLOW_SUSPEND ioctl allows the device to be suspended.  The
> suspend may not happen immediately; it is controlled by the settings in
> the device's power/control and power/autosuspend (or
> power/autosuspend_delay_ms) sysfs attribute files.
>
> The USBDEVFS_WAIT_FOR_RESUME ioctl waits until the device resumes,
> whether because of a remote wakeup or because another process has
> resumed it, and then forbids the device from suspending again until
> you perform another USBDEVFS_ALLOW_SUSPEND ioctl.
>
Thank you, it is very helpful.

To verify the USB device suspend\resume functionality, I configured
the USB Power Management variables as follows:

# cat /sys/bus/usb/devices/2-1.7/power/wakeup
enabled

# cat /sys/bus/usb/devices/2-1.7/power/control
on

# cat /sys/bus/usb/devices/2-1.7/power/autosuspend_delay_ms
0

# cat /sys/module/usbcore/parameters/autosuspend
2


So, I configured the system to autosuspend the USB device as soon as
it becomes idle, with no transactions running through the USB device.
Now, how can I verify that the USB device has entered suspend mode
from user space? When checking /var/log/kern.log, there are no
relevant print statements. Are there any other log files related to
power management or USB subsystems?
Please correct me if anything in the test procedure mentioned above is
incorrect.

> Alan Stern



--=20
Thanks,
Sekhar

