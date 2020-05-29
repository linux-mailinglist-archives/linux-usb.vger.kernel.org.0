Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D69311E76F8
	for <lists+linux-usb@lfdr.de>; Fri, 29 May 2020 09:38:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726910AbgE2Hii (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 29 May 2020 03:38:38 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:40185 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726911AbgE2Hid (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 29 May 2020 03:38:33 -0400
Received: by mail-lf1-f67.google.com with SMTP id h188so706733lfd.7
        for <linux-usb@vger.kernel.org>; Fri, 29 May 2020 00:38:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=87nVU9CMosGJKROKHIZCpYZ7nI3dqzgw9mnVEWrPJbo=;
        b=lwE/K6K9AqPwzn+eewb3pqd3iRUR32OPLIlORdeDzCSrIEX7KMbcVDXXJk+nu1bOAE
         B1124ezxBSkf8x0g9hu1+ogLbzuzF9zwMP8PtoLMO8atn/V7Vd+sDTnCl8yD7s2oCJ/J
         fD+rzDVRhz+/q00VFYwvkJ9AB78EHIc6MMD2dD9YVr6fn7n39QEU4hRfXMVbDztbD7+z
         L6RexGZg1XqDVIlMiTFKDOKOrK8RzRRqbreVSdA3RHvq/UAQiOG+aMIwnHcgkybJOTjy
         PS3LhFB1dOUiEhFEIkVJ1n8BBlYnGa6fZOETjmFteW4TgTxg0bL8zEopVE4+SqIQ6o9T
         7e9g==
X-Gm-Message-State: AOAM530uUxD/MGDo7q3zFM60EGOc+ahAcVFwRZYUp4r217p7CS3zoSfs
        YWbQRVbZa8td9N2GugD77+AUVoEn
X-Google-Smtp-Source: ABdhPJz0bieqLJDVZN4GwyCK21kP7mJZgq8TDy2upj8Na4NYWn/uQetJ98gw/4+5KN/SSoKvdQzgdA==
X-Received: by 2002:ac2:5cd1:: with SMTP id f17mr3503115lfq.4.1590737910716;
        Fri, 29 May 2020 00:38:30 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id u20sm1849482ljk.103.2020.05.29.00.38.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2020 00:38:30 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1jeZaz-0003ZB-Tw; Fri, 29 May 2020 09:38:25 +0200
Date:   Fri, 29 May 2020 09:38:25 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [GIT PULL] USB-serial fixes for 5.8-rc1-2
Message-ID: <20200529073825.GA13677@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg,

Here's a second pull request for 5.8-rc1 as I wanted to avoid a back merge.

Johan



The following changes since commit b9bbe6ed63b2b9f2c9ee5cbd0f2c946a2723f4ce:

  Linux 5.7-rc6 (2020-05-17 16:48:37 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git tags/usb-serial-5.8-rc1-2

for you to fetch changes up to 399ad9477c523f721f8e51d4f824bdf7267f120c:

  USB: serial: option: add Telit LE910C1-EUX compositions (2020-05-27 09:28:02 +0200)

----------------------------------------------------------------
USB-serial fixes for 5.8-rc1

Here are some new modem device ids.

All have been in linux-next with no reported issues.

----------------------------------------------------------------
Daniele Palmas (1):
      USB: serial: option: add Telit LE910C1-EUX compositions

Matt Jolly (1):
      USB: serial: qcserial: add DW5816e QDL support

 drivers/usb/serial/option.c   | 4 ++++
 drivers/usb/serial/qcserial.c | 1 +
 2 files changed, 5 insertions(+)
