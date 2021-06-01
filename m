Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EAA323929C3
	for <lists+linux-usb@lfdr.de>; Thu, 27 May 2021 10:44:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235573AbhE0IqV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 27 May 2021 04:46:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235569AbhE0IqV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 27 May 2021 04:46:21 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A19E5C061574
        for <linux-usb@vger.kernel.org>; Thu, 27 May 2021 01:44:47 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id x187-20020a25e0c40000b029052a5f0bf9acso5042969ybg.1
        for <linux-usb@vger.kernel.org>; Thu, 27 May 2021 01:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=E9Y+aCu/dNMj5yd6F2VP6nHchu69wdBKbxAfsbuEMQk=;
        b=Tx0eyYcsGyiJMMykGJTtD73pcz5KKEDDkvgFfXC27lTQUBuHhLkMYYtljva9xL0g1A
         6M7kAAEZvnoidO/0uoFDvjx/Kb5GRU2TWFk3E9PIO8O1fZROZAa/WeLrOJvI+8H4+eP2
         Tn/Z62xn5Zf5AczjGy5LPOfc1UKMmO8amXaNF1Iv+bCNLmUd4cq0lTDl/YSva2Q+Nn2z
         VWwJinImPJIc5SfNMxH3m6AjEdUB+U4R9ANlTJHpGa+3MwZP4qL/abeH9qsvumzp/662
         1vX5cC8/gua4px+jbZPPa8Bba0WqGLsXhJIfZOGTvn3OeNcA7Qs2w5Ofkhvz122/ixU9
         GUHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=E9Y+aCu/dNMj5yd6F2VP6nHchu69wdBKbxAfsbuEMQk=;
        b=g9+5Pase184xs0NPGrANhaL1XmMx2kKWZYhOdIsl2NOZt4kaktE5ha5ans3Bd8zz8s
         zWZ9w10GfNNgEvqE2nUGg+B9ovOAH5y3kqnvX3mpBMyaSsF6gsUJh5/laj009l1JQlNG
         rXhEChp3UZ6oo/P9uhXNddb2LPs5tYis23gauR2B+hBObGyPtMeGzM0kVjuXTdrPWY4Y
         g2xxwMAN6uYxndsPd9brDJmfx4ROc3N9XadFQl8KS0FBpXsp5CCM8ls53leCSbcR+qbD
         1ed7jZko0SJV6a2QOd3mMu1T5FGR2MBUa6EYGedfMWLkNj7bJp65yfevaOQPnWmqfD7v
         YNjw==
X-Gm-Message-State: AOAM530Xu2nAeU5DNMB3T8t9kZisDCsWPR5JKrD04nLLyMW/53+/3W2v
        7hTzedvYt5ZXiapCPuOtSFVRznN9hocm
X-Google-Smtp-Source: ABdhPJy47Q7Ea3hXhnA5pq2z2QwnAlc4ysNg/muW3ni16oJivYHPBQZfdJ0zx9Ndg3w9uRf7X4M4cUpYpnsM
X-Received: from kyletso.ntc.corp.google.com ([2401:fa00:fc:202:c563:7257:f641:cbcd])
 (user=kyletso job=sendgmr) by 2002:a25:880f:: with SMTP id
 c15mr3138750ybl.247.1622105086846; Thu, 27 May 2021 01:44:46 -0700 (PDT)
Date:   Thu, 27 May 2021 16:44:16 +0800
Message-Id: <20210527084419.4164369-1-kyletso@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.31.1.818.g46aad6cb9e-goog
Subject: [PATCH 0/3] Add the support of SVDM Version 2.0 VDOs
From:   Kyle Tso <kyletso@google.com>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, robh+dt@kernel.org
Cc:     badhri@google.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Kyle Tso <kyletso@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg, these patches are based on usb-linus branch. Is it okay?

===

The patches are primarily for the responses to the Discover Identity
command. This part was changed a lot from PD rev2.0 to PD rev3.0 (now
it's rev3.1 :D). e.g. DFP can respond to Discover Identity command with
ACK in PD rev3.x and the Product Type VDOs are quite different. Given
that tcpm.c moved on to PD rev3.x and PD rev2.0 is still supported, some
changes need to be made to support both PD rev3.x and rev2.0.

usb: typec: tcpm: Correct the responses in SVDM Version 2.0 DFP
- This patch is to unblock the responder ACK to Discover Identity if the
  port is DFP and the SVDM version is 2.0

dt-bindings: connector: Add PD rev 2.0 VDO definition
- similar changes to Commit 2a1673f0f1de ("usb: pd: Reland VDO
  definitions of PD2.0")
  https://lore.kernel.org/linux-usb/20210204005036.1555294-1-kyletso@google.com/
- add a new property sink-vdos-v1 to store the PD rev2.0 VDOs

usb: typec: tcpm: Introduce snk_vdo_v1 for SVDM version 1.0
- populate the legacy VDOs from fwnode
- send these data if the port partner is SVDM Version 1.0

Kyle Tso (3):
  usb: typec: tcpm: Correct the responses in SVDM Version 2.0 DFP
  dt-bindings: connector: Add PD rev 2.0 VDO definition
  usb: typec: tcpm: Introduce snk_vdo_v1 for SVDM version 1.0

 .../bindings/connector/usb-connector.yaml     | 15 ++++
 drivers/usb/typec/tcpm/tcpm.c                 | 52 ++++++++++----
 include/dt-bindings/usb/pd.h                  | 69 ++++++++++++++++++-
 3 files changed, 119 insertions(+), 17 deletions(-)

-- 
2.31.1.818.g46aad6cb9e-goog

