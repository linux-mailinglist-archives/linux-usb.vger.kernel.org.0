Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 662D3A892B
	for <lists+linux-usb@lfdr.de>; Wed,  4 Sep 2019 21:23:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731084AbfIDPED (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 4 Sep 2019 11:04:03 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:34338 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730604AbfIDPEC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 4 Sep 2019 11:04:02 -0400
Received: by mail-lf1-f68.google.com with SMTP id z21so16248682lfe.1
        for <linux-usb@vger.kernel.org>; Wed, 04 Sep 2019 08:04:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=DcnAxhT50GR+ilGnjSHoQUvLCxVke3++MpUcW5c5jmI=;
        b=nTnVVAh3rzSJH0S2dUAfgnyug7bLv8bNHGMSm/NE4fEQLoy+PEEQn27KPcHw2PyCP9
         mlTZ3HnQSMAG3b+GtI0/2xj6ZvtAfPqasReJGkv3flCv4LWInDhX0LWITHJzMOPnipPf
         kYsr5Cgsi7ReXEE1A5q2x2SfF1ICsKLt3JUWV5T7xkkKHfWTjT4LozOi8N6uXpKf/0ED
         iAl4SnScb5O2O5y8SMpIVF8I5zNuT55YCwyyH2W7/hZo+QLVCs0uFrXplHfBG9zc+zjR
         i1kyojbfw4+d+Tqet4ErTIxj1QFNq6bG4tiI53H1TesgF+fdndfGoL10fAdcTZHsCPaU
         MSaA==
X-Gm-Message-State: APjAAAVGd6RbyFUrS6tcPOVDPEe/Tav7GWA+M49SGH/ZpNdTJ1vHRJCH
        7Q0IXl+5ybMSvZwr9Vu/Xvo=
X-Google-Smtp-Source: APXvYqzC2wqJRCkZlJyanL5D8L9+3cKE/uVYS63F3r8wqySwV/m4cZuj+nCo97GOLEBTaAWaZMzt1g==
X-Received: by 2002:a19:f11c:: with SMTP id p28mr13825468lfh.44.1567609440778;
        Wed, 04 Sep 2019 08:04:00 -0700 (PDT)
Received: from xi.terra (c-51f1e055.07-184-6d6c6d4.bbcust.telenor.se. [85.224.241.81])
        by smtp.gmail.com with ESMTPSA id q88sm949007lje.57.2019.09.04.08.03.59
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 04 Sep 2019 08:04:00 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92)
        (envelope-from <johan@kernel.org>)
        id 1i5WpA-0006RJ-Oy; Wed, 04 Sep 2019 17:03:56 +0200
Date:   Wed, 4 Sep 2019 17:03:56 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [GIT PULL] USB-serial updates for 5.4-rc1
Message-ID: <20190904150356.GA24736@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The following changes since commit d1abaeb3be7b5fa6d7a1fbbd2e14e3310005c4c1:

  Linux 5.3-rc5 (2019-08-18 14:31:08 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git tags/usb-serial-5.4-rc1

for you to fetch changes up to 7a786b84790789eff5bad49e3f6c15f75b7bf691:

  USB: serial: ftdi_sio: add support for FT232H CBUS gpios (2019-08-28 15:35:33 +0200)

----------------------------------------------------------------
USB-serial updates for 5.4-rc1

Here are the USB-serial updates for 5.4-rc1, which this time is just a
single commit adding support for the CBUS GPIOs on FT232H devices.

This change has spent a week in linux-next with no reported issues.

Signed-off-by: Johan Hovold <johan@kernel.org>

----------------------------------------------------------------
Matthew Michilot (1):
      USB: serial: ftdi_sio: add support for FT232H CBUS gpios

 drivers/usb/serial/ftdi_sio.c | 43 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)
