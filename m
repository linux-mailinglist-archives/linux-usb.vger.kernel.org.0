Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 59A0190F67
	for <lists+linux-usb@lfdr.de>; Sat, 17 Aug 2019 10:22:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725965AbfHQIWK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 17 Aug 2019 04:22:10 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:40527 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725832AbfHQIWK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 17 Aug 2019 04:22:10 -0400
Received: by mail-lf1-f67.google.com with SMTP id b17so5614096lff.7
        for <linux-usb@vger.kernel.org>; Sat, 17 Aug 2019 01:22:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=Z9J+dShCfDuXV/LCJRq2gcidV6bojVIM5OvG664eBhw=;
        b=kotv3NVGbwlLsXwKs3HjFRfB6yF9CLA5YbJkcR71u4vIzaIq1KCKoMwZH9lGaGlxI7
         rIR5B3H6sBjSKEBZenyAujE+f/qFe1oYyJVfiMLPSowUXFvzLWJtYoEUzS2ZHK+yOdkE
         AoyBetwthETCZm/a+GllnKc2GAaVGPYF4IIScpfI/49d16g0tERog/Fw+9KWmDvvVP8p
         oA5YFeL0aJl7vUsRscP+fWC+60yMYjdfrsiRIU0zmrrwWTQ6za1Yrc8dGqzgcwdmRNam
         x7g8tePJX/yMUsNOR8HWHEE2Js1D1AmB/BlgGgOji4f2Vky3NjjC7uW+KGK3TImuEg9R
         zuqg==
X-Gm-Message-State: APjAAAVGdbRJjY5dc10Kokk+6ZOC9uB5BjiwBuGDMo4Q96jI4efw0rDj
        OJ4PVU8BfBdo03GJpPvHlTyjTPAKir8=
X-Google-Smtp-Source: APXvYqwM/44bg8ok39890qnyYMvVHwQ62q1dBQmvilQFYwphsoS1niytxWI8A9NgJc+uli0oxOSolQ==
X-Received: by 2002:ac2:4644:: with SMTP id s4mr7208926lfo.158.1566030127942;
        Sat, 17 Aug 2019 01:22:07 -0700 (PDT)
Received: from xi.terra (c-51f1e055.07-184-6d6c6d4.bbcust.telenor.se. [85.224.241.81])
        by smtp.gmail.com with ESMTPSA id j21sm1300746lfb.38.2019.08.17.01.22.06
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 17 Aug 2019 01:22:07 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92)
        (envelope-from <johan@kernel.org>)
        id 1hytyR-0002v7-D8; Sat, 17 Aug 2019 10:22:07 +0200
Date:   Sat, 17 Aug 2019 10:22:07 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [GIT PULL] USB-serial fixes for 5.3-rc5
Message-ID: <20190817082207.GA11204@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The following changes since commit e21a712a9685488f5ce80495b37b9fdbe96c230d:

  Linux 5.3-rc3 (2019-08-04 18:40:12 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git tags/usb-serial-5.3-rc5

for you to fetch changes up to e5d8badf37e6b547842f2fcde10361b29e08bd36:

  USB: serial: option: add the BroadMobi BM818 card (2019-08-15 13:46:22 +0200)

----------------------------------------------------------------
USB-serial fixes for 5.3-rc5

Here are some new modem device ids.

All have been in linux-next with no reported issues.

Signed-off-by: Johan Hovold <johan@kernel.org>

----------------------------------------------------------------
Bob Ham (1):
      USB: serial: option: add the BroadMobi BM818 card

Rogan Dawes (1):
      USB: serial: option: add D-Link DWM-222 device ID

Tony Lindgren (1):
      USB: serial: option: Add Motorola modem UARTs

Yoshiaki Okamoto (1):
      USB: serial: option: Add support for ZTE MF871A

 drivers/usb/serial/option.c | 10 ++++++++++
 1 file changed, 10 insertions(+)
