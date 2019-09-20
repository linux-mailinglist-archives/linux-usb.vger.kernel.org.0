Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E38EB89B4
	for <lists+linux-usb@lfdr.de>; Fri, 20 Sep 2019 05:25:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391061AbfITDZN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 19 Sep 2019 23:25:13 -0400
Received: from mail-pf1-f202.google.com ([209.85.210.202]:48788 "EHLO
        mail-pf1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389462AbfITDZN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 19 Sep 2019 23:25:13 -0400
Received: by mail-pf1-f202.google.com with SMTP id z13so3691837pfr.15
        for <linux-usb@vger.kernel.org>; Thu, 19 Sep 2019 20:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=ex5S+EddAB54/0CCml7QbmSM+qrl+SnL+MOYNcuwHlo=;
        b=Gc2ODOLsGsHeQow1q8Fl61gSimubTDsTR6s6NHbtSqwj/+kmxNx8h8vb7CGP/bt2mm
         h6UxJ6n1CJXn5kxebgPd2uHb53z6fBY4dOjttbqRXoi69IQ8IdSb1FA2bufrWorTp7fJ
         9NdGlE4x1RrLlSoPyd9Zwd2nBukPhAewr9atfyPDh/XHXCEKG6IpZAftoQ/StjZOmDW1
         rY02dQZfS9lA9V2iWcRfVBopg1EfFWWITnnWJLE/NGXb9pdrAqYsnZm8oaeYJz0j82qJ
         mDlzqmk6YZJhFkmahbMyFG2axdUW8mEwgRBJDQCo7pDdJNiR59Hj0lBfPxYVRgF/hpes
         uLlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=ex5S+EddAB54/0CCml7QbmSM+qrl+SnL+MOYNcuwHlo=;
        b=VwJ8h0Cb6AV29Etq4Hw1GsBgi+Y9Ev420Lz+9dlcA7Ezpe0jUHGLNaJq+MY7v1GULB
         gnA3PvRzzyqZOUucJCil5K/ZslDOJLtuMY1pw9cCBMXMHOQhFUtc3oXuql7PAl/H03Wg
         /bJ5C6Z9Sibfw0H0Ckk7viytCPnpx5B3xJNoUJxU99yYRaFxYSIkGEQrzTwusQa3Ql1v
         JlrWiX/M0u1kswicDTEtwtDweoIartTv5bsxajVT1xkKtIbg9GLt8DJ9MOrn+7RtPexf
         nUwqBUk098+6w8gVhpCBsNrL9gwJ2ysVtZnY79PVxDykm+1zYV3HqPqqrLCFU4gPNBkQ
         lIvA==
X-Gm-Message-State: APjAAAWjWLNqhrvkZTgdv8qGtZSrxF1YF2WtyRxztdMQM0VGZmpBtcki
        VimvxtM+LMgUZsA0wAePKiNhCeCnsOpj
X-Google-Smtp-Source: APXvYqz++jeY2qTZJhTPpFkv9AGfU1Vj2/IzomECoofk9kzsBfHodqokRgwtOpkpDQgPgJ0sL9y8KMC9UKXz
X-Received: by 2002:a63:d46:: with SMTP id 6mr13061102pgn.364.1568949912474;
 Thu, 19 Sep 2019 20:25:12 -0700 (PDT)
Date:   Fri, 20 Sep 2019 11:24:35 +0800
Message-Id: <20190920032437.242187-1-kyletso@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.23.0.351.gc4317032e6-goog
Subject: [PATCH v3 0/2] tcpm: AMS and Collision Avoidance
From:   Kyle Tso <kyletso@google.com>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org
Cc:     badhri@google.com, hdegoede@redhat.com,
        Adam.Thomson.Opensource@diasemi.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, Kyle Tso <kyletso@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

*** BLURB HERE ***

Kyle Tso (2):
  usb: typec: tcpm: AMS and Collision Avoidance
  usb: typec: tcpm: AMS for PD2.0

 drivers/usb/typec/tcpm/tcpm.c | 523 ++++++++++++++++++++++++++++++----
 include/linux/usb/pd.h        |   1 +
 include/linux/usb/tcpm.h      |   4 +
 3 files changed, 468 insertions(+), 60 deletions(-)

-- 
2.23.0.351.gc4317032e6-goog

