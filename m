Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0AA57149E3B
	for <lists+linux-usb@lfdr.de>; Mon, 27 Jan 2020 03:26:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726703AbgA0C0m (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 26 Jan 2020 21:26:42 -0500
Received: from mail-il1-f174.google.com ([209.85.166.174]:36399 "EHLO
        mail-il1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726545AbgA0C0m (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 26 Jan 2020 21:26:42 -0500
Received: by mail-il1-f174.google.com with SMTP id b15so6260057iln.3
        for <linux-usb@vger.kernel.org>; Sun, 26 Jan 2020 18:26:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=m/Om3Vl42d6dey74HGqRtBt84wohKo/VIxqc5dZa/ww=;
        b=puWGqbpPsXZ1eKf2e6bY8M7MnEnz+aYXe96mgLadLHdeeGp2tit5yl0oiYkaWtcRtF
         rv7fGwTBdbB4mV8FbF56hGfD1sCKvyvrqn42/FjuZjNCnu4ad3+02tArGiaEmfuZI6+Q
         7KhDQiy0udurzd2JX2MvX9y3eLJ7OFOmeH0599yYoDpNAIDI+JAWCkUEz/LdU3SM2/ld
         V48E40F9uH0GWcbqbMYfg369sdQRNAOLfExAy0WgodW7epBrK3ZkdDKBBp967CvBssRn
         7NVFabWoABJ/e0Fsqv+TevPSP3Tg4w03zA0L+PDqcu37VuFJnrTLsBnha9Tx/qSAe83x
         BGFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=m/Om3Vl42d6dey74HGqRtBt84wohKo/VIxqc5dZa/ww=;
        b=sYONh8+H74ibJt6mRj1fut6pY0Rcwgi0jasW5vy2M3CuB+M0DQcN9d5utm/t4242+0
         6bEkF4IMta/d+yk22A7Qak8xDcruCCKmCtn/RslEcCR+H57bwn6QUxZYkuBi9PbhLkFO
         5hYtirrs7SJ+S+OeTIl2dEFr30sGbUM/M6DmvQi5tKfm/DNW6+7PYRLgQ98Utlrhz9sl
         nr09xMrHNL7xb4Ir1glkif5YoJyIWf4PV+WPc/8UK60fERlfOJF200k9nzQA/hjG/2g4
         1WWpE4y9un6xl8wmA54uthNPN7JFHAJ2Uo57wusUWVdY1mfbT4tfh8wIcoUiuWva2J2w
         8tYQ==
X-Gm-Message-State: APjAAAWpc71vUlVQIb4qzbT5QXMV5yZCCe9w66kRYEwK3Y7ZeAz9E+hs
        92Obzzj1aQb7We4HzuzYgXuoRbFsuJoUXVoDOwRvlGzZ
X-Google-Smtp-Source: APXvYqyS87X46DoULjFFNj4rrbIheCOKZKTM9hfsCUVCOARiH55eaFqqKd7t3KYaq8fWi24O9AXfEzS4fmMIGqcP36U=
X-Received: by 2002:a92:ce85:: with SMTP id r5mr13522422ilo.301.1580092001666;
 Sun, 26 Jan 2020 18:26:41 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:ad5:5d0d:0:0:0:0:0 with HTTP; Sun, 26 Jan 2020 18:26:41
 -0800 (PST)
From:   JH <jupiter.hce@gmail.com>
Date:   Mon, 27 Jan 2020 13:26:41 +1100
Message-ID: <CAA=hcWTiqmULgD1JqEHUo4iXtrCt+zQAHmJL8=wPUNqPA57ENA@mail.gmail.com>
Subject: 4G LTE connection stability with USB voltage requirement
To:     connman <connman@lists.01.org>
Cc:     ofono <ofono@ofono.org>, linux-usb <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

Apologies for cross posting.

I am running Yocto build image with kernel 4.19.75 on iMX6, the device
uses uBlox SARA-R4 4G LTE modem. I have an LTE connection stability
issue, it could connect to 4G LTE, then the connection was
disconnected between half an hour to an hour randomly, the error
messages were qmi_wwan of qmi_wwan 1-1:1.3: nonzero urb status
received: -71 and qmi_wwan 1-1:1.3: wdm_int_callback - usb_submit_urb
failed with result -19 for errors of EPROTO and ENODEV, many indicated
that kind of errors usually caused by insufficient USB voltage.

To diagnose it, I changed to use a DC regulated power supply to
connect USB voltage from a stable 5V DC regulated power supply, that
did help to stabilize the 4G LTE connection, the device has been
stable to connect to 4G LTE since yesterday (26 January AEST) morning
more than 24 hours which was not able to perform that stability if the
USB connected to a laptop or connected the device internal regulated
DC voltage from AC power supply.

What cannot convince to hardware engineers and what baffling me is
that I am also testing an image built from OpenWrt using network
manager netifd, it did not have LTE connection issue and it could
connect to 4G LTE much stable to use either USB power supply from a
laptop or device internal DC voltage from AC power supply. It does not
make sense if I say to the hardware engineer that device has power
supply issues. Why OpenWrt netifd is much stable than connman / ofono
in the same power supply conditions?

It seems to me there are subtle differences between connman / ofono
and OpenWrt netifd, could the connman / ofono require more rigid
stable USB voltage than OpenWrt netifd? Or could the OpenWrt netifd be
more superior than connman / ofono in terms of 4G LTE connections?

Appreciate your insight comments and advice.

Thank you.

Kind regards,

- jh
