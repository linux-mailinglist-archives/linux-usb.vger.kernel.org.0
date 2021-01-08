Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F27452EEAA7
	for <lists+linux-usb@lfdr.de>; Fri,  8 Jan 2021 02:02:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729631AbhAHBB4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 7 Jan 2021 20:01:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729465AbhAHBB4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 7 Jan 2021 20:01:56 -0500
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E70BBC0612F6
        for <linux-usb@vger.kernel.org>; Thu,  7 Jan 2021 17:01:15 -0800 (PST)
Received: by mail-pg1-x52a.google.com with SMTP id v19so6519806pgj.12
        for <linux-usb@vger.kernel.org>; Thu, 07 Jan 2021 17:01:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=MdSpVHOyEQwx2tgCei9Ky7KIKszDfq0M63V4sVAOXNY=;
        b=Qu12bZ+bZVJNiLLqgx5RQ/7tEauhuRprLxjFJK7UU9jGlH1tb1d1YXJvEe+7NFndyR
         gjUR3d8893KdOjVnvdXRBU8m6EY92plwsGImxSRXt55AHGTo0ALgoQ8cJpNXKu6azUUT
         ekGJAbyohVM0bddtNWVoJMLW9GjLUNT4OnhCERiNT/MhvxVssQgkWBRk+1QsTe7zQvgs
         aTGAypPkyOi8aFlcHxvSj4/2/CSgd3z8uYD+NqCZmygd+4jGNm2z3ZVT8yEg7+4HG1Qd
         kvOBJ24uzowgukoZe/gq/qchY7fOui3X7QJC8QwI8nL39LcvIyqA0W2OxM31uCbg2/B4
         ujXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=MdSpVHOyEQwx2tgCei9Ky7KIKszDfq0M63V4sVAOXNY=;
        b=ahNS7cZ9Xvz5CLeBQP5rjEjMRpyvHIjAW8j752ugmg4mRNti3UOWB99OeiDV3lEBM5
         pqFOVlMceD+wXlBd7tdV9eC+6KU5DCcaGTGqHzqgAl+6DXcYCtucBp4v7iJFcpTtwJx0
         D/8KoUTR9iS8seMsysNMUxNLmsi2bV1Adkky7oJ+brzORkcHASzHSwdjRGRM4vDHPFw3
         sYAHI09IyMN/m0kN+UUJmoIW79d/Lj28YI41V8ET+QO2dSI38TOVXLNhj1xT5SSOYEe9
         +goxbuE1wIN9xokqR+F4EvHggG4y/6Z2gz0zR7tJoMq93sZPHMNA34rmVJPiC7IoH1gM
         PIYA==
X-Gm-Message-State: AOAM5324wbLZsz6p5YVUACttyAFw7+2A6V6jKleqBRnQHeaulDKSrE4G
        XwQQQy8AM6otZwZ83M/o+xlyATRBdzn+7g==
X-Google-Smtp-Source: ABdhPJwhQbtqGfUNxoRBoG2DpIc8VVFBIC2H0sasTtkqbEBhPb4azVDhhAs4ZNL5IL8cIbZZ6Tz4kw==
X-Received: by 2002:a62:aa06:0:b029:19d:f4d3:335e with SMTP id e6-20020a62aa060000b029019df4d3335emr1323991pff.60.1610067675419;
        Thu, 07 Jan 2021 17:01:15 -0800 (PST)
Received: from b29397-desktop ([84.17.34.154])
        by smtp.gmail.com with ESMTPSA id b11sm6120253pjl.41.2021.01.07.17.01.13
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Jan 2021 17:01:14 -0800 (PST)
Date:   Fri, 8 Jan 2021 09:01:09 +0800
From:   Peter Chen <hzpeterchen@gmail.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [GIT PULL] usb: fixes for v5.11-rc3
Message-ID: <20210108010109.GA3318@b29397-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/peter.chen/usb.git/ tags/usb-v5.11-rc3

for you to fetch changes up to 491b1bea00040233b791dc8fea1608ac6a7003bc:

  MAINTAINERS: update Peter Chen's email address (2021-01-08 08:46:42 +0800)

----------------------------------------------------------------
- Several bug-fixes for cdns3 imx driver
- Update Peter Chen and Roger Quadros email address

----------------------------------------------------------------
Peter Chen (4):
      usb: cdns3: imx: fix writing read-only memory issue
      usb: cdns3: imx: fix can't create core device the second time issue
      usb: cdns3: imx: improve driver .remove API
      MAINTAINERS: update Peter Chen's email address

Roger Quadros (1):
      MAINTAINERS: Update address for Cadence USB3 driver

 MAINTAINERS                   |  8 ++++----
 drivers/usb/cdns3/cdns3-imx.c | 22 +++++++++++-----------
 2 files changed, 15 insertions(+), 15 deletions(-)

-- 

Thanks,
Peter Chen

