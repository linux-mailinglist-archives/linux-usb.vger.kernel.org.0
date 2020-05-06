Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90A8C1C7336
	for <lists+linux-usb@lfdr.de>; Wed,  6 May 2020 16:45:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729078AbgEFOpv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 6 May 2020 10:45:51 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:46379 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728769AbgEFOpv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 6 May 2020 10:45:51 -0400
Received: by mail-lj1-f196.google.com with SMTP id f18so2614226lja.13
        for <linux-usb@vger.kernel.org>; Wed, 06 May 2020 07:45:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=1st69Fz5AJdkGwK5xoZ0LiTf14B9vkxcb08k3O94xgs=;
        b=P2RFjsNcJPuvEBQw39jV7TNNS2bYfMipZojofdjInCXz7WMqW+ORdKURqrI+y5NcK+
         qnKFoBUdSXElaLjIcWlBK26GIJdKUzwxMrT7A7YyDCs7MM/bR+/SBt4o0f5rEdvqiNtD
         Uq13hsbd9Bb4UhyPPPFh/IlG+wBi3mgu+oN4pvur0uIjvhOIXXXyGld1iq1VqqLCAkTh
         by4I8i2YM985MJcPgEF9HRp5kA2E3aBRk7Bs8houEggaKUz5dJ13X4bbj2KFrAGQGqNK
         I5EM2spU+KwFqI9ib/pxqrglYE1zxZWqgYbXlPLNPljZF4RnsDQsFSFfHdUqzDsqBSuu
         ILHA==
X-Gm-Message-State: AGi0PubeZE743AK3nri8LKyMXTMFx3wNyl0JD9W/pbjLSd9Trg0G1O0b
        vq9nu1Fw3jXO8lNQMzIQSOvP61xl
X-Google-Smtp-Source: APiQypLjy8FNp2CLjLa7aDfzPflU1eyrCRXBcv0sji33B6mbpp5kIUc82XmePM8JzDXLSVLg8abGFg==
X-Received: by 2002:a2e:b6cf:: with SMTP id m15mr5031653ljo.168.1588776348896;
        Wed, 06 May 2020 07:45:48 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id u3sm1742817lfq.59.2020.05.06.07.45.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2020 07:45:47 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92.3)
        (envelope-from <johan@kernel.org>)
        id 1jWLIq-0001wK-9S; Wed, 06 May 2020 16:45:40 +0200
Date:   Wed, 6 May 2020 16:45:40 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [GIT PULL] USB-serial fixes for 5.7-rc5
Message-ID: <20200506144540.GA7432@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The following changes since commit ae83d0b416db002fe95601e7f97f64b59514d936:

  Linux 5.7-rc2 (2020-04-19 14:35:30 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git tags/usb-serial-5.7-rc5

for you to fetch changes up to 78d6de3cfbd342918d31cf68d0d2eda401338aef:

  USB: serial: qcserial: Add DW5816e support (2020-05-04 18:23:54 +0200)

----------------------------------------------------------------
USB-serial fixes for 5.7-rc5

Here's a fix adding a missing input sanity check and a new modem device
id.

Both have been in linux-next with no reported issues.

----------------------------------------------------------------
Matt Jolly (1):
      USB: serial: qcserial: Add DW5816e support

Oliver Neukum (1):
      USB: serial: garmin_gps: add sanity checking for data length

 drivers/usb/serial/garmin_gps.c | 4 ++--
 drivers/usb/serial/qcserial.c   | 1 +
 2 files changed, 3 insertions(+), 2 deletions(-)
